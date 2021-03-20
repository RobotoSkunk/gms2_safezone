draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text(5, 5, "Upper left");
draw_set_halign(fa_right);
draw_text(rs_ideal_width - 5, 5, "Upper right");

draw_set_valign(fa_bottom);
draw_set_halign(fa_left);
draw_text(5, rs_ideal_height - 5, "Lower left");
draw_set_halign(fa_right);
draw_text(rs_ideal_width - 5, rs_ideal_height - 5, "Lower right");

draw_set_halign(-1);
draw_set_valign(-1);
