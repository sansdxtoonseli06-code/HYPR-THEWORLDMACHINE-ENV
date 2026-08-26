#!/usr/bin/env python3
"""Genera iconos neon (morado fluorescente) para niripwmenu."""
import math
from PIL import Image, ImageDraw, ImageFilter

S = 4            # supersampling
OUT = 256        # tamano final
N = OUT * S      # lienzo de trabajo
W = int(18 * S)  # grosor de trazo

CORE = (245, 235, 255, 255)      # nucleo casi blanco
GLOW1 = (198, 140, 255, 255)     # halo cercano
GLOW2 = (150, 80, 255, 255)      # halo lejano


def blank():
    return Image.new("L", (N, N), 0)


def round_cap(d, x, y, w=W):
    r = w / 2
    d.ellipse([x - r, y - r, x + r, y + r], fill=255)


def arc(d, cx, cy, r, a0, a1, w=W, caps=(True, True)):
    """r = radio exterior; los caps van sobre la linea central (r - w/2)."""
    box = [cx - r, cy - r, cx + r, cy + r]
    d.arc(box, a0, a1, fill=255, width=w)
    rc = r - w / 2
    for a, on in zip((a0, a1), caps):
        if not on:
            continue
        rad = math.radians(a)
        round_cap(d, cx + rc * math.cos(rad), cy + rc * math.sin(rad), w)


def line(d, x0, y0, x1, y1, w=W):
    d.line([x0, y0, x1, y1], fill=255, width=w)
    round_cap(d, x0, y0, w)
    round_cap(d, x1, y1, w)


def arrowhead(d, tx, ty, angle, length=None, half=None):
    """Punta de flecha isosceles con el vertice en (tx, ty) mirando a `angle`."""
    length = length or W * 2.4
    half = half or W * 1.35
    a = math.radians(angle)
    ux, uy = math.cos(a), math.sin(a)
    px, py = -uy, ux
    bx, by = tx - ux * length, ty - uy * length
    d.polygon([
        (tx, ty),
        (bx + px * half, by + py * half),
        (bx - px * half, by - py * half),
    ], fill=255)


# ---------------------------------------------------------------- iconos
def icon_power():
    m = blank()
    d = ImageDraw.Draw(m)
    cx = cy = N / 2
    r = N * 0.30
    cy += N * 0.04
    arc(d, cx, cy, r, 300, 240)          # circulo abierto arriba (PIL: horario)
    line(d, cx, cy - r * 1.18, cx, cy - r * 0.12)
    return m


def icon_restart():
    m = blank()
    d = ImageDraw.Draw(m)
    cx = cy = N / 2
    r = N * 0.30
    end = 305
    arc(d, cx, cy, r, 40, end, caps=(True, False))
    rc = r - W / 2
    a = math.radians(end)
    ex, ey = cx + rc * math.cos(a), cy + rc * math.sin(a)
    # la punta continua la tangente (sentido horario en pantalla)
    t = end + 90
    tr = math.radians(t)
    round_cap(d, ex, ey)
    arrowhead(d, ex + math.cos(tr) * W * 1.9, ey + math.sin(tr) * W * 1.9,
              t, length=W * 1.9, half=W * 1.2)
    return m


def icon_logout():
    m = blank()
    d = ImageDraw.Draw(m)
    # marco abierto por la derecha
    x0, y0 = N * 0.20, N * 0.20
    x1, y1 = N * 0.56, N * 0.80
    gap = N * 0.13
    line(d, x0, y0, x1, y0)
    line(d, x0, y0, x0, y1)
    line(d, x0, y1, x1, y1)
    line(d, x1, y0, x1, y0 + (y1 - y0) / 2 - gap)
    line(d, x1, y1, x1, y1 - (y1 - y0) / 2 + gap)
    # flecha saliendo
    cy = (y0 + y1) / 2
    line(d, N * 0.46, cy, N * 0.72, cy)
    arrowhead(d, N * 0.80, cy, 0, length=W * 1.9, half=W * 1.25)
    return m


# ---------------------------------------------------------------- neon
def neonize(mask):
    """Convierte una mascara en un icono neon con halo fluorescente."""
    layers = [
        (mask.filter(ImageFilter.GaussianBlur(28 * S)), GLOW2, 0.85),
        (mask.filter(ImageFilter.GaussianBlur(12 * S)), GLOW2, 0.90),
        (mask.filter(ImageFilter.GaussianBlur(5 * S)), GLOW1, 0.95),
        (mask.filter(ImageFilter.GaussianBlur(1.2 * S)), GLOW1, 1.0),
        (mask, CORE, 1.0),
    ]
    out = Image.new("RGBA", (N, N), (0, 0, 0, 0))
    for m, color, strength in layers:
        a = m.point(lambda v, s=strength: int(min(255, v * s)))
        layer = Image.new("RGBA", (N, N), color[:3] + (0,))
        layer.putalpha(a)
        out = Image.alpha_composite(out, layer)
    return out.resize((OUT, OUT), Image.LANCZOS)


if __name__ == "__main__":
    for name, fn in (
        ("shutdown", icon_power),
        ("reboot", icon_restart),
        ("logoff", icon_logout),
    ):
        neonize(fn()).save(f"/home/claude/{name}.png")
        print("ok", name)
