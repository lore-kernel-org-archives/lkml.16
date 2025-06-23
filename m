Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A889223DE8;
	Mon, 23 Jun 2025 22:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750717229; cv=none; b=pA0Qwflvl2da80/D+01/SAPvcqER2fTCG3dE6n64B7S6T/OdEfgLtM9j490j30gChqdwenTlrlmFwCk45LYkHtmy+ohcn463cGQTUsM9qojkId90VG+cPRH2WTfMl8gICsu7aQAs2uCcWjogfMILNgcgQCh5S1SXxakUft8ZndQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750717229; c=relaxed/simple;
	bh=BJC/cYs9cEh7PKovZypWQEdafr7gizAG2cEeGgnbsHs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=WrtWiIVOCBqm7bxOmmT30by63v5UPC4SmECkRO4tVXYuvZaf7GKiPwbIVQaiP7lPdVU7+AFJjl4SgQnV4srdO5UrKS32Te68gSXz9Z5ZbwnPOFUKezvx4GT5WJcnC7Ov9dTel6Z2RXjaJsNfjvwkGgkH+IBivFv19/dACV6wIKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eSwtV+FA; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eSwtV+FA"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fb9c2436so2390603f8f.1;
        Mon, 23 Jun 2025 15:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750717226; x=1751322026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RcMrKot8tsQrFqCwcQ2eONIC0xSNkQ3UV7nsULcvCSQ=;
        b=eSwtV+FAu54NAIcK0LlWMCwv7cLpsi6EYG4Z7i7BzS+H8GrLlv98lN1dz00SZfkkU8
         GisgL8yJhNQwYJefKEr7kF0TkMy775lDDvSgkYWofCix7WsZKgy5hu3qFPnlCmy6Ea8X
         ZNyQii+5mlgShfg0FGpGh7mVYNM4W3X/Unnt8/13qIvJqsRewYR5ah9oqsMd/S+g1KoF
         41JH/b+YQBjnIvBlR28FlVR7TdJGDBQg6/X7YvmOgp023qn63gzLu19Im941DK+Hncnx
         X9fWDgUi19hel2WX/gFZgBvEqMmsXS9C+m+QS0XRYIHr5qAs925FRIatI968YKzJfr4x
         RKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750717226; x=1751322026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RcMrKot8tsQrFqCwcQ2eONIC0xSNkQ3UV7nsULcvCSQ=;
        b=TGA4v1h+XBNmiSuOyFCNG/65oZsZnzxUvECYuT5dlZc4DaC9AAFoR2uxxs9XXsGBXD
         b9CxjvaovanPwqb1GrSzLpDQPW1RoIXreE7CF+Drgusgf/kam1lsW+MMXOEMCg8sGWjw
         OPlkm+WyD7d0IUrKClL+xjD/yJ4VPMJ4njJ7LNU04VQmyIg2ciUd+8rkukAN18FX3jeu
         FWTEDxrXwlkJkYznQpvgtKs1dN2vzImpEd6O5DlcunEeKrDdpYP6XwnqpojcGDc0BxFj
         +rDE36k0k4+RXK99nI31ReGt7JG11k7pn02erf/0+7WvXDyQc9cDefZIlkuoVPkRx2Ti
         YxgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQnwBSicev/9jdnheta/6Cl5T3jj1SB76XBr/hp5cif0z4SvpvMr2iBF0GAat6MFABF7+37JoGmuFg@vger.kernel.org, AJvYcCXySKxIxYtTT6ILbEnHIwkuyucw/QIRMGbDX+Jsgfvwy8Io0e3Dgr5FZFixJaX/So/suILL2hXX+D6WXM3c@vger.kernel.org
X-Gm-Message-State: AOJu0Yybijjxld42KMBv+bU3lklC/2BJOtaXKtmglQP58ze2v9Z1vjS7
	tggFZ7Uo69joB7Wi3U14GDFSuernp3pUg2akX+1nF7lFvyJxoCDsw4cc
X-Gm-Gg: ASbGncvIDGKfKl4PVU4zkYEz5g6HJkElvRmE2nbrEROYx72+3KFQQPFgbzidbGbBVay
	15ANM1CeTLuda2CSIrM3SkS9Gqii0LYjqSwcpwj3SlRVnWVjVBtB3jE5FlyeIz7t60OfxxqECBE
	hVQ1zpKqgrZpsEU0LKKnyCYWsbvpj4yLSBOWYYSbgQ+qi4GnsdCo/QZWkvpMELxi1fmKiRi7zlb
	6uHPUK3k+tp6ltztuD2JBGGb6txXh+HP06T/9p78xDUBloyVG+RFpRYp+7ASZ02b6+/aiMidOMG
	o22BzOCteTp8JY5OsjnsHURQ5sbFZ+ayRZgDnia1HH8uekcFl2TsWILNkrqsTTO1e3A0Je4=
X-Google-Smtp-Source: AGHT+IFDcQVwpR1EfYUdBzIvJdwoQefp5kX0q+VQqZm09KfS9ZDPMXNVhIJNfMOFJtVYhv0rrocsJw==
X-Received: by 2002:a05:6000:1aca:b0:3a5:2465:c0c8 with SMTP id ffacd0b85a97d-3a6d119291fmr11591377f8f.7.1750717225851;
        Mon, 23 Jun 2025 15:20:25 -0700 (PDT)
Received: from localhost ([87.254.0.133])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4536470415csm121799395e9.31.2025.06.23.15.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 15:20:25 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-gpio@vger.kernel.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] pinctrl: eswin: Fix unsigned comparison to less than zero issue
Date: Mon, 23 Jun 2025 23:20:04 +0100
Message-ID: <20250623222004.280928-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The u32 variable voltage is being compared to less than zero and
this can never be true. Fix this by making voltage an int type which
is the same type as the return from the call to regulator_get_voltage.

Fixes: 5b797bcc00ef ("pinctrl: eswin: Add EIC7700 pinctrl driver")
Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 drivers/pinctrl/pinctrl-eic7700.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pinctrl/pinctrl-eic7700.c b/drivers/pinctrl/pinctrl-eic7700.c
index 719cd11e276a..4874b5532343 100644
--- a/drivers/pinctrl/pinctrl-eic7700.c
+++ b/drivers/pinctrl/pinctrl-eic7700.c
@@ -622,8 +622,8 @@ static int eic7700_pinctrl_probe(struct platform_device *pdev)
 	struct pinctrl_dev *pctldev;
 	struct eic7700_pinctrl *pc;
 	struct regulator *regulator;
-	u32 voltage, rgmii0_mode, rgmii1_mode;
-	int ret;
+	u32 rgmii0_mode, rgmii1_mode;
+	int ret, voltage;
 
 	pc = devm_kzalloc(dev, struct_size(pc, functions, EIC7700_FUNCTIONS_COUNT), GFP_KERNEL);
 	if (!pc)
-- 
2.50.0

