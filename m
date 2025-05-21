Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DE29280309
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 14:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747836628; cv=none; b=Ankemm5WJN/ypx55ik7Fq7R/Ol/bSnylFHzscmkBKNnlWi2VqHt5YiIO0rDlaRbz9ko8zzNoVxlgEIlFHy6SDal6kM6xgQzoWLPsjC2XVNSMvjp0O+HHUcIIzjFnvwWd3qz05kO6QomBgkNRxDdMUsUX+SBETjKQ0poYtWPXNxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747836628; c=relaxed/simple;
	bh=jZzOia2XsslK/UVTV0RsWGKc7SbGTkfUbEhS+fMGkbo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=edPF7CO8GArG8F6k5iuc6gT82ozRbD+ygvo2ZMU6kWe1QzGWa57UtyrJ/ykejI/yhqpzwQ+E2FkGPSuW3rKwvaR5iEQe9FL19ryErywFKCu8dkssetbOYxLv04rCeYVQv0PQXeV4WobDN3g1Xq+jTA/8iM2HQlVWAfDP8/TW2Jw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=oN8RWN5l; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="oN8RWN5l"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-6015f8d4b7dso3049500a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 07:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1747836625; x=1748441425; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v258ll9JbBLXOIea9jWrUjVqAB2GMAl7DarOvnstw10=;
        b=oN8RWN5lPYuSH3i7CXIuNBl9HUzv7DQdWnexJAF+ttFIGjsDwRTiCRTjHgAWVc+mb3
         XluGcj3ugvA+9nXxNfqNpQZxCL+nl5KAPXMZ5w3383ayU8aIBC7Gs3GftAGb/wI5Ls5N
         MvBA5dUjyNeah92fmkPy4MCeJ/SorqOgMoPTqUpN21fdFsXLVUvb0XfeuJpqrT9N8dzl
         i68G5X6gHLeQvgpzic+61v/EcdQclXsWkvAIxtc81qpUSxCOPQhaew9V4dPI76XwPq5U
         6rBT/HYpE5TmI7ErUcwqmHVtgNXzs/xEAGMv7+6KsxA2M2wdUVJQkAlB3RieS/c3UD9U
         zL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747836625; x=1748441425;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v258ll9JbBLXOIea9jWrUjVqAB2GMAl7DarOvnstw10=;
        b=C0bf5sG2YkXHz+ASwbUF9UpKYBCXILznfOaB/ymwAAdjMuLwlUsIxD87xTJjbMuoPB
         Qr0wbAxy8+KMhLdUr7JIrCLTsDIdo5A2MNG866xBuu/gdMVF9AXJs/y7sHQtl+rYjWUP
         kBVR68U4H3S4D/C4Z96MuE7iocR4qcAWPqnztWQGpRCTKGBKVxHqMk1pgli4DTsA0oN/
         ScUkkHHHeIpwNWh97fOOK6L13C2/KXv6NNmHGAKM6vH49ywslvvY9w8/p8OqfTcF9VfM
         mrrKNxo3KG9lGPZ5ulHboqHJiERli3Z3Ov47BwlPOQUcD12Vy0f/wOaM3hRZP1Cp3nJB
         uX2w==
X-Forwarded-Encrypted: i=1; AJvYcCVa8U1BA6FLwbEqXv0qe4ibEg8xWHlJjSpxT11Xk0VecGHwtr5rd74fIniUCK2S8YpyboGMR1hdqVnJC5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEumx7RgRJd9UpWGQdbKtLMWNhRTkXGm7qFDKwK8wpO6Cx7PbE
	d7XMTW9VWQOGdBwyFivRZ4pQLQrqQ5buXcr8WQwZFxDiVl88SWrKEI5bXWBXKsA27dY=
X-Gm-Gg: ASbGnct7H9rBugSKmjiiHTtMcNIYh7Zyg8pnFEwY2CyiErbkPhVhbRf8mn6G6qHZBfk
	NcinuWdfgGrNUzXfrE6vIo0G2OcAZZC4FXEVnr0XA1lqIdXmQOHEU+dHHCE143o9qLsoed6fzcV
	sbcAilY+tJy0wqVwk/p/po6OgZGDkwBfZ9kCiypuPc5pCDmcp26uP7x3qg2T9GAeyLwnSwOjj5l
	FREqH20OmUj/9k75nqNpluhKzvLk8q4OJFXnWPcwR7+ktR8o395dJ9ia3UmkVBNmESiuT1NtDtw
	pNkRojBmTG8ChckYOo2jrvDU9KKuAJyJTfzodZTKwbNnGmpG5PIYTVk6SDgqf2v3ZcF2U9anmBR
	LvPGz
X-Google-Smtp-Source: AGHT+IExJE/BNkE5bINpRA4UDQooBTWGbExswmf0e5QQQgNXAyz1AiUe3bXi/hkJVkXYpmXzRVVPXw==
X-Received: by 2002:a17:907:2da2:b0:ad5:78ca:2126 with SMTP id a640c23a62f3a-ad578ca2302mr998041066b.59.1747836624607;
        Wed, 21 May 2025 07:10:24 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d271916sm914552866b.69.2025.05.21.07.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 07:10:23 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	p.zabel@pengutronix.de,
	geert+renesas@glider.be,
	magnus.damm@gmail.com,
	yoshihiro.shimoda.uh@renesas.com,
	kees@kernel.org,
	gustavoars@kernel.org,
	biju.das.jz@bp.renesas.com
Cc: claudiu.beznea@tuxon.dev,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	john.madieu.xa@bp.renesas.com,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v3 10/12] reset: rzg2l-usbphy-ctrl: Add support for RZ/G3S SoC
Date: Wed, 21 May 2025 17:09:41 +0300
Message-ID: <20250521140943.3830195-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250521140943.3830195-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

The Renesas RZ/G3S SoC USB PHY HW block receives as input the USB PWRRDY
signal from the system controller. Add support for the Renesas RZ/G3S SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v3:
- none; this patch is new

 drivers/reset/reset-rzg2l-usbphy-ctrl.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/reset/reset-rzg2l-usbphy-ctrl.c b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
index 016aae883b2e..98d6323e9f56 100644
--- a/drivers/reset/reset-rzg2l-usbphy-ctrl.c
+++ b/drivers/reset/reset-rzg2l-usbphy-ctrl.c
@@ -97,6 +97,10 @@ static int rzg2l_usbphy_ctrl_status(struct reset_controller_dev *rcdev,
 
 static const struct of_device_id rzg2l_usbphy_ctrl_match_table[] = {
 	{ .compatible = "renesas,rzg2l-usbphy-ctrl" },
+	{
+		.compatible = "renesas,r9a08g045-usbphy-ctrl",
+		.data = (void *)RZG2L_USBPHY_CTRL_PWRRDY
+	},
 	{ /* Sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, rzg2l_usbphy_ctrl_match_table);
-- 
2.43.0

