Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C30C321D3E3
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751134540; cv=none; b=BAMF2pDJARCgHU6CQb14cLRtWiIDstjDnTETz3eX+qgTRxqE6vEPGjpUfzJGaN4JqJb9DVjNQnS1ctPWuspvzERfvkG8HOW655AIzHAx58UPicb8+svTiCqHfqaZRKM1u15ABdIJg8X6DDeP2GTRpgotrdSMneUafuVeohNEsro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751134540; c=relaxed/simple;
	bh=E4plUyCSI3k6l2mc6OVyIDEg2o/aLZqtXrmCeA+EOe8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kF10fFhfNGbMhCMysLBrmj3pJ9nuk35T1rvo3F6kRLlixNc947e8BmBvU0RJiY+H7Z4QbeRlx5VsmcdzBYQ6/inDLg6KqDFluAnmij73Br2APvpFFrLhYfR5jeP5qUO3JR6rINBm/1M8MBfcrBWgXTZlYQ5/WcO0Yf5/2zif7zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUQgR3HR; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUQgR3HR"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6f8a87f0c0fso34827516d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751134536; x=1751739336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3iwNAdFnvuqB0Dm2t3yhmssxKeJwx9Ii5rUOi2V7+AQ=;
        b=UUQgR3HR27PoE7aiUNXftt24gLYlrPZSSVSROjSH+3ago6OdMmL2UHO0Pk/2g+ffXb
         5LYFl67CnM+c7VTOswJT8ssO+35f1jkkzb2D/Skem4YWYhA1xhVQsJkQ88RKWySThdZW
         1nz9UtKgAqBKTrVJCjkPsLwHPUy+w79InGIdZObh1e0fWgLBU6W9VSe2TRhGMjf44wAP
         zuL9XjjgUhTF7Im8rlgzsaBxD3emYkK6MGbnvsLal091qRrSxmxjy/cg0hYU3PdwR92H
         qRAC1V2akEKHX4fR9S+nlv8By0KoFA+JygDtnWoks+nRsWTkDaaDf006pZJ06gzDFXP7
         bWpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751134536; x=1751739336;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3iwNAdFnvuqB0Dm2t3yhmssxKeJwx9Ii5rUOi2V7+AQ=;
        b=hcYsVhY43r1O8VGR3yiJYXcQQHSDCIUvcQVk9jD6O2YeiOSvLOlfbiv6UwDAxsZddn
         +DRRcmWCj2sr8lwNnLQRKGSmkInkJBNVzG2FKZ9pRL2vUcb2q5ly4g6UYj6qnP6QnF+J
         Ld7UpLOdc9gyo0YBs60X/kNiQOktH0jPZetYNZo7gbQbAGdzb2wIzXPyBPs7o8Q7x1iJ
         DXVBqLyuwNPnQ2Pkgk8OHpSod47rq6ANHBVM+VIq6DFVIMFm6ECcPi7Uv+YzNBsYnm6a
         +auky5OGJO2Pn91WKWw9w/JiW6LDHyO+I5A34aNZ8hj2AMv50JcCD+cYJSWleAci3z0G
         1K0A==
X-Forwarded-Encrypted: i=1; AJvYcCUNDNjDu/ckOcVsXXrGX5P+ZaJEcr8Fq0WVEKQ0kGF8ULgVLP0lKZFbttRfUCQBjRoepD/pXAtkrKN6sqo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzgEXivjRKjfDY78qkS71a38oA/6LS3wCHoRET/ip5BRt65grK0
	ShaCKijadJ0w7EAM3Lj6sVqp+Ie7ydmGVa+GjH0w5IpNxW81Z5z3/11QiFIaaQ==
X-Gm-Gg: ASbGncvVlZ3tcszVE1n+4Ts8a0IjSHNqo3+CfLoF13CNxmUkjFvzAMxUU8PDUATvbc9
	SyLb7XL+YurlcbLfFsEVWTLIZZ8bv8ULGk0DRSWmJB/vRpzCwZiBUIHJGuUjgIlLnYp4Jp/ewrv
	sj0HKEOgRgMeVeT/rNZMbnbtOfGqFeSlpK977NwUYkuklGA9SSBLergVUtWshQK5OUnjJomG5Ml
	M77ENYbCicTaoB+MXHpzskIpemYYEgm5eTtX2JChyw+LZNHQb94/qoTb5NCUph4/tPQho4b3e2L
	cquFWoNUJQivBU8Eqm0ZcH8XQIh936Iu7iqMB+kuAuchbD9j4+H3
X-Google-Smtp-Source: AGHT+IGzp8cWKAuO6qoPBeDI2nAZVjC8/1VnvDFjlGhntI+g10PNt7YtSHw0ASmzwfhGEyjaxqjtiw==
X-Received: by 2002:a05:6214:4309:b0:6fa:c492:2db7 with SMTP id 6a1803df08f44-700016580dbmr116819356d6.13.1751134536131;
        Sat, 28 Jun 2025 11:15:36 -0700 (PDT)
Received: from fushigibana ([2601:405:4a00:186f::cc2])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d31asm39935046d6.18.2025.06.28.11.15.35
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 11:15:35 -0700 (PDT)
Received: from pnariyoshi (uid 1000)
	(envelope-from pedro.nariyoshi@gmail.com)
	id c5f94
	by fushigibana (DragonFly Mail Agent v0.14 on fushigibana);
	Sat, 28 Jun 2025 14:15:34 -0400
From: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	linux-media@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Mr Chromebox <mrchromebox@gmail.com>
Cc: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
Subject: [PATCH] media: cros-ec-cec: Add Fizz board variants, so driver can detect them
Date: Sat, 28 Jun 2025 14:14:35 -0400
Message-ID: <20250628181530.873795-1-pedro.nariyoshi@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I recently reflashed a Chromebox (Wukong variant of the Fizz board) with
coreboot and I noticed that the cec driver refused to load with a bit of
tinkering, I realized that the dmi_match_table was expecting the product
name to be Fizz, but `dmidecode` reports `Wukong` as the product name. I
am not sure if this is the best approach, but adding this patch lets me
load the driver and it works properly.

Alternatively, we could instead match the DMI_PRODUCT_FAMILY, instead of
DMI_SYS_VENDOR and DMI_PRODUCT_NAME. In my board at least, that says
"Google_Fizz".

I am open to suggestions for alternative solutions and I hope I did't
break any rules (this is my first kernel patch). (And sorry for the
previous submissions with errors in the subject line)

Signed-off-by: Pedro Nariyoshi <pedro.nariyoshi@gmail.com>
---
 drivers/media/cec/platform/cros-ec/cros-ec-cec.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
index 419b9a7abcce..a26473c3cd84 100644
--- a/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
+++ b/drivers/media/cec/platform/cros-ec/cros-ec-cec.c
@@ -302,8 +302,15 @@ static const char *const port_ab_conns[] = { "Port A", "Port B", NULL };
 static const char *const port_d_conns[] = { "Port D", NULL };
 
 static const struct cec_dmi_match cec_dmi_match_table[] = {
-	/* Google Fizz */
+	/* Google Fizz and variants*/
 	{ "Google", "Fizz", "0000:00:02.0", port_b_conns },
+	{ "Google", "Bleemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Excelsior", "0000:00:02.0", port_b_conns },
+	{ "Google", "Jax", "0000:00:02.0", port_b_conns },
+	{ "Google", "Kench", "0000:00:02.0", port_b_conns },
+	{ "Google", "Sion", "0000:00:02.0", port_b_conns },
+	{ "Google", "Teemo", "0000:00:02.0", port_b_conns },
+	{ "Google", "Wukong", "0000:00:02.0", port_b_conns },
 	/* Google Brask */
 	{ "Google", "Brask", "0000:00:02.0", port_b_conns },
 	/* Google Moli */
-- 
2.49.0

