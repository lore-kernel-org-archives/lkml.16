Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7105B28315D
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 12:54:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749646460; cv=none; b=SG/bcFXqNZn34rYrKbnB78c+KPaHHb03SYOTaYTZK0hJWlgQJxL26rDpE1XpZJOZUmI6aGynKZs+3uR//WyrwTaQsdpgd9V6kT0CDEb1Ky4F49Q8nCburs9zZO3e/Xs7t2wpv90w/7rdOYQJQTGhUQWzrfosXHaMd78kc2CzHgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749646460; c=relaxed/simple;
	bh=0jgUbMrrrNY3QwhLNEA7O8KCiSx/gIOyEaCeWfqpB5A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcWh25hfPyb7TMf8Es0jSeQZZENq/eNx3sg87vFM36GjMQZBbTcjfIxSZV7uVmX5qa5xhQYZEXC4rfBt3wyR0U5kepjFTz2IV0872rbMhhLHg1ljAJklMinbxBUS1zgcu3IUAbEyc0X93WmMYuF8D7U8+Xy7FH13n9+YzkMCeLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aoSG2ao6; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aoSG2ao6"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a54836cb7fso2226463f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 05:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749646457; x=1750251257; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=aoSG2ao6x0O11uMSZlatcrJ7WtcNKLsqXupgsCnTpBX47tmzM3+t8tcnjMfaQ52PEs
         xDAA6SBmZV9LjpEBtDV/kZULfh592Tt4+s/DEBY8J+fxPJ/cMbtoXtUQ3tIRii5lSYdd
         RpXpBMgjGkQawU2rOAWXe3Rz2tMYneefSwhhc8xKhUG2eG0grc+1Q8VE+4Kh1OEjgkBT
         K9xbwxxmsaQ+bNEsUO3KVDrQ08XQLptr2pLw/s/pHYpBjgze5vrbnJAT/iMul//IviRC
         v1tuvOmA/DGwKxnF/ToT1SBVZpy73k9crfHs91ln547bLjau68ehmffJrEEeSRtfeNBN
         s6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749646457; x=1750251257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hgyBVrfYOGwb8icwtwZuqsQvTSZXh6hVi38QgSu9syk=;
        b=DXeu/QAsMw4eWjEJrA/8a83iOYQo/N4gs+VrHhGMYbaejasgz96+O+m48mFvQnzUn0
         UBX+EkOhW2TTS5vVe/hIqoDJ2b79PmDzm00AmM732/AoKaF5/jY1g89KUz5rQUx6IVEd
         NCS11JjYpqMIGQtwnp9S7uQ0sQeJEPThQkZhDCSH7voabZAFjs3w//gWOwdxw9bGc3sY
         9gL8PSDesMS/zEMDHe705mpKgNdMb8YIFUABCWXH6DWY0BbchTTxSiltLMkof4dzfOup
         wYH7HOmbF1xQR4o2V/XzCg4BjhnpwO9VlSG3GZMJF/mmnJPc8mlt8EQUOWmipSbGpUhP
         8jXA==
X-Forwarded-Encrypted: i=1; AJvYcCXOTSa+mak2Ml7GotqBBSNmkJ+iKBDFNwV2cwT7jjHQE+wu8cOL3Ik6d+bt5oePAsn9ghcoI/RWnWafQMU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0V+nyMQjOttDQ1FKDjl784iMlhYIIwQ+VcC5CGjFr/bzp9kr0
	UPLLRZewL+A1JAX3nZwCeqHhnJ2L1gvHkSMVAyJZQh3L3XpwzpS/DOrduPixsFmab0w=
X-Gm-Gg: ASbGnctcuObmCDjpDXKp4NtnjruEZBbLOgfuNJRFwrGRqGD4PkOL5Sra15h+0KiM0uy
	1Sg4xxPZHoyLQ38C7XWjK/80luuUG1LmOIe5nDm/N39cNthIkUJGmvrf3OKt778pk+/Ziy17cpY
	827SqSSkCqBcnLBaCIMhfCQH8tPahSkjmImsBrEuOzoHnve1GBx8xXCLYmbuvyubGskT4dww8Op
	AdBwSwgMizpXEZWXVXz4hR6BM8RNxLsJD0y5NQML/8EgavO2WyPlk8ZvBWh41Z38OihjtbRGwdh
	1Whh+hmWlzlD7XkWpJi3HUlSkA1gX8MeZs5sPxIOUQGFoJPLrR/fY+xC2IHivheSVxJpUhgbBKx
	DIexSzlTnvq8=
X-Google-Smtp-Source: AGHT+IGSKQ+I1VSBXzjz0e0/4PIaSTIl1mLDIRYQG2dUdUWN1ZjW/HP6izLGdBlHKJXUN9U97V2Bhg==
X-Received: by 2002:a05:6000:4203:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a5586dcff7mr2566047f8f.38.1749646456700;
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
Received: from toaster.baylibre.com ([2a01:e0a:3c5:5fb1:8ef3:a82f:ccaa:91b5])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-3a53245275esm15225486f8f.76.2025.06.11.05.54.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 05:54:16 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
Date: Wed, 11 Jun 2025 14:53:57 +0200
Subject: [PATCH 2/4] reset: eyeq: drop device_set_of_node_from_dev() done
 by parent
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-clk-aux-v1-2-fb6575ed86a7@baylibre.com>
References: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
In-Reply-To: <20250611-clk-aux-v1-0-fb6575ed86a7@baylibre.com>
To: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>, 
 Gregory CLEMENT <gregory.clement@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Jerome Brunet <jbrunet@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1637; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=RwzYmOF728hq2o8OgF4Q9VGpNb0lf0jDIwME53KEgHc=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBoSXxzT4vvsOSw1zz5K9DH+lG0L5oWKmI61cqwC
 Uao7DX7/vqJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaEl8cwAKCRDm/A8cN/La
 hW4nD/wNd9PvOlo3p4RnDdZJ6qBC2p1a28mPHDfq6qSu/abBcGDIzBdcMUxT62vTPUu8vpWiUGQ
 pFFM9Ak0KjaeQXESXgfXTKh7Dal6utZtLY/jDkAbZPH1CwNYWpz499j+w4KpDXlZ70DGV9b4Wur
 nAc3LYPsix9HrCyBHL4J+bUdWbiZEJN65Ry0GGjj/77420eK2cPTNB0lcn0a/8Nspxs6a5eeb4x
 GxgMKDRbx5Gtc7q31GWbg4XsRhNczNAxGHol6J4U52E4/tdeyB0nWgnqg957uLKyzKff5npQ/3x
 VOpdHG074k8RLQ9kAbwpTGETzaVqm1Us6dEbwLkFAs6zy9EFjLCs0rNcy7xp9Vi04Za0zfGtX7Q
 Qv+i05679yJBJ3hUZJ7gmRPiPftx1Zig+ZdMH1rqLCKlxNbijywLN9bwy0nK+yxAxxKiq9KaZ6X
 G8UF309wZ65EgA57LA60CIS3n3dKEUMwNGPD+Hn0Ya/ZC9Jatg3rF9B6oQP1yDI3V9bMIpDksX5
 yFuQh8/1B89E/ZITsAi7jg6/KC3DsmCjIKGrovtwIdtyC61OzP6De4p6qQcK8KSUhcwFNB31vkO
 mITE+N4jmeeCX2ghVtBZIpexDdcjqcCN0r/MEOfdFdMYz77VtMrWDSAyYmnoEIXZv0b5OosDfZc
 pXrQkrGtqAn1Ltw==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

From: Théo Lebrun <theo.lebrun@bootlin.com>

Our parent driver (clk-eyeq) now does the
	device_set_of_node_from_dev(dev, dev->parent)
call through the newly introduced devm_auxiliary_device_create() helper.

Doing it again in the reset-eyeq probe would be redundant.
Drop both the WARN_ON() and the device_set_of_node_from_dev() call.
Also fix the following comment that talks about "our newfound OF node".

Signed-off-by: Théo Lebrun <theo.lebrun@bootlin.com>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 drivers/reset/reset-eyeq.c | 13 ++-----------
 1 file changed, 2 insertions(+), 11 deletions(-)

diff --git a/drivers/reset/reset-eyeq.c b/drivers/reset/reset-eyeq.c
index 02d50041048b42921e3e511148cd29f215b5fc5e..8018fa895427bb1e51ea23b99803dc7fe6108421 100644
--- a/drivers/reset/reset-eyeq.c
+++ b/drivers/reset/reset-eyeq.c
@@ -420,17 +420,8 @@ static int eqr_probe(struct auxiliary_device *adev,
 	int ret;
 
 	/*
-	 * We are an auxiliary device of clk-eyeq. We do not have an OF node by
-	 * default; let's reuse our parent's OF node.
-	 */
-	WARN_ON(dev->of_node);
-	device_set_of_node_from_dev(dev, dev->parent);
-	if (!dev->of_node)
-		return -ENODEV;
-
-	/*
-	 * Using our newfound OF node, we can get match data. We cannot use
-	 * device_get_match_data() because it does not match reused OF nodes.
+	 * Get match data. We cannot use device_get_match_data() because it does
+	 * not accept reused OF nodes; see device_set_of_node_from_dev().
 	 */
 	match = of_match_node(dev->driver->of_match_table, dev->of_node);
 	if (!match || !match->data)

-- 
2.47.2

