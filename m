Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9205297A68
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 17:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748020443; cv=none; b=OYN3dm1Mld2YEfPO4+1kroBlkm96B3Im+bf83gsmcH43v/cx2lhCi8KqLWTUECI+AVzXYNTtcnq6rrPSI/5+V7M5zOU89UU4ig00iJA392lc811aDHqMZIplRwUI+mLdKW6iLHOEeDWeqNxEc1ZLb9weI0Bl1nOFuWiz1FflruA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748020443; c=relaxed/simple;
	bh=q70KRtP/Ls/EnPfjY52Cg7+ufdVGyh9iPZ62lGJOoDc=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=iyA7+JPRy5C3vE31mJZeob5iieFlVrQ8vhZCcPuJRrH0+GBy8vJ0UFLSnEt53acD3zeUwNgyB16wLmJinwFrJM791PlJpx4xP9sO035P0WsHItcX5vDpwmDzmPaRILp/Y+ACl0B9lnB1f6IZJF0MAWDQQinGGbIPWViMYHN/B4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cRmn2osA; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cRmn2osA"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6f8c53aeedbso1100006d6.2
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 10:14:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748020439; x=1748625239; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6u9v9rOB7wDSHj6qtz/FEqNxQ/3givq7zBFPK6aaZeU=;
        b=cRmn2osAYRU5wL9NyNSmhj/NzV+WHj70LaKZOl9KV7MnCbdts5++EiMK4bdaXhkj7G
         o6hsQm27Dy9+ISVcd87ZFaT6GNhE19biilGQ8rNGroFsBceHF0xS4QOV3fkCy7XEx1Tz
         uzz1dtgLl+ub13go+TCvoMiKiNj/gSXUaIZySMajYCJfcS0J7Smifonr/+J6bhgMOCaT
         w5i1bLtcORUoup8ttMzq9DM0bq75ikO//WdHzSWDY5VQg/xIpYK3oEs7YyOPpzmSDmvL
         aDyzVI+Zynk+SUqjR9PaIjoV4dvyrjKp5KT2gL1X6fqkjbMhpcwvIIUEWErKmJ7Zn37q
         WLHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748020439; x=1748625239;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6u9v9rOB7wDSHj6qtz/FEqNxQ/3givq7zBFPK6aaZeU=;
        b=MZN/wUydU6CWHj8IwojZiuwSk+8roG3Q3bRmBhPcqiuRz33/pR3MJGAgwCTV0Zd7Jt
         hzE0NajQeStvoLPyYJ5kUrEwP8zyx5l8QVhGooNXl+EYfxvzYxgCSuT23FLs3qOQK7oJ
         jm0ImMEF6sNvIHWnkGH7BazwI4Vq5mdAgReBmoA3xfxDJJO7U3vKKbdKRr5je9y+jI+Q
         +Zafc01y75DR04fi6Zl6MySp57vb+rjAHxFMcUVqtW5zt3I88ef0p+8NEH7v4x7kX00H
         /4ZPJmwacsqwDlSZEO09wkynLSIvLW4mwacGW69yob7pnNcg3jjurU5IMP04mwPtG+BM
         Q/vQ==
X-Forwarded-Encrypted: i=1; AJvYcCWLAq8/DzkGV0MNwpNWoniq84/exDFYVzmZHvdsEjhF248pagXHdDnX17naPiUOCcAx4q48Bc+qIVrohKg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeouxJxBsKXyredhD2KdZbuFh+L7OLF0Xz3ppaq1C7/OWI3yBG
	mIYzMhmkH5yTWQ17Ua/xsj2k7TUyLWDnD5kgKXRNmBouf1lsTiVu4lKtTBzCdL5Kdrs=
X-Gm-Gg: ASbGnctdMakz/DkBfaucJ99Q80AD/pVWX6Z/thdKQGxi8UltjwQUYb4N4+x3KAaAKtq
	QfwTnB1dIESkO9oeVhciOrSSnrlCpSu3B172onKVGQUltbbqu3UvrCU6xzbD8KS4lkvTgYZyVGo
	dU/KVFBb6GiP9CI6CvHHwWXd43ukEnKDRzY8izS8JP3BDJVmmYMaKOCB08zv9QidigyfBIsneI3
	57vbb1XYcRBamKflfaPr3cWub3XSUKW4kcdW0BF1Of/l9OHdQM8nnuceq0H3a8tF9xDpIVuLp40
	XxnYV8W/DQ5WNFYmJMw5DiZWAX3cBDr5/cxnKDZFiO2226eRuYADZaMELRJzw6yOTDT7ZdwyzI5
	E8jApJxoqVZ7tNA==
X-Google-Smtp-Source: AGHT+IGJzuu4ZXXeX5BlecuVuFVZZwA/bCwL7vxRk1fOvReZtV8zdHQ/t63ghPaOuxghJs5IcqbiTw==
X-Received: by 2002:a05:6214:764:b0:6f5:e0c:b203 with SMTP id 6a1803df08f44-6fa9d176d43mr5501356d6.11.1748020439667;
        Fri, 23 May 2025 10:13:59 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fa99a641cesm5782186d6.53.2025.05.23.10.13.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 10:13:59 -0700 (PDT)
Date: Fri, 23 May 2025 13:13:58 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Jiri Slaby <jirislaby@kernel.org>
cc: linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] vt: remove redundant condition from redraw_screen()
Message-ID: <n58o097s-s20p-4222-nqo5-2qp26843rs35@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Given !con_is_visible(vc) is the equivalent of *vc->vc_display_fg != vc
we have:

	struct vc_data *old_vc = vc_cons[fg_console].d;
	if (old_vc == vc)
		return;
	*vc->vc_display_fg = vc;
	if (*vc->vc_display_fg != old_vc) /* !con_is_visible(old_vc) */
		...

Therefore the last if condition is always true.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index ed39d9cb4432..af5186d2c219 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -946,10 +946,8 @@ void redraw_screen(struct vc_data *vc, int is_switch)
 		*vc->vc_display_fg = vc;
 		fg_console = vc->vc_num;
 		hide_cursor(old_vc);
-		if (!con_is_visible(old_vc)) {
-			save_screen(old_vc);
-			set_origin(old_vc);
-		}
+		save_screen(old_vc);
+		set_origin(old_vc);
 		if (tty0dev)
 			sysfs_notify(&tty0dev->kobj, NULL, "active");
 	} else {
