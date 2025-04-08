Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 571C325FA34
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097006; cv=none; b=Gp+oBUg8h141HuEDNMaNyIFyGJi2WPazk7QJoUryRx+pROg4WYPK+M/8nh7lUcbN/81MRUPKhg+2Y+lQI1uShXGu4knUE4lPyTswp/9GkYHTuCfKdYgkZQH6GQ9lzJxHSeq9EMLV1jUjTOa/Y6K8DdxENrW/U7hOKzICTXiBftE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097006; c=relaxed/simple;
	bh=1pHaIND2KYP7IQR016ZtHvkE+J/KYHTFCXPcGNsWjjg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M9ubdfM7HQgJmdpRWmre5B4tlWh4ckTUuZKs9rXlli0Q1nD0Y+mHXSvDBXDoi9Kux7dpJNLouLkooT5r8qvxY8UPJ4aBMZZ3fPhj1eWNgOrJnE3BwYgG382VYhHEIU7OMLHrx0KV69JW+XpmiiC7Ql2k2+YupB62uY7Ro/vOuK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=sRcFrueT; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="sRcFrueT"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so51277915e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097003; x=1744701803; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=sRcFrueTQ99Ls4ZePpZRhqqjFiEhdr00YQ2x18TcI754TcEF/sO+fins1dCOC9nfyA
         GXfylqJEnhiOzZ7j/dCTQE89Vi30wMuU8NMDruU07O7Iy0w6c4LHourIbNGVIMFKlLv2
         2eJI0KM42SOTKWTTlDPtGcTXiYdNjUHf6VC2VDIyY36ckfSOp8S4LzbA8YJK9Ln/Q3Ql
         GRetzl4AwxI0xTaQNbxa+55+RPyOKq4phmGXNju11NvLg/9A54i57Soi7lHoS+AKhsiT
         Xr2mEs6tv+i89rS9xh8jA0njfa6mhkmfdm8TXVDoCj6ByYOLgpd8kvKy/Svw0GNfVrTW
         xW9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097003; x=1744701803;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o6prcSe997utkmrj2Wk6sqfMRushEUX5sURGCDCfQ/A=;
        b=baXiq/04ujPd41P3VhGqEvmtd+r5xdIRRMDN3t6RS6zeW78APjT5ICFX+CYzj2CZ1o
         qBES7gSiTmp3qtu8t3AjP8aOiqrZuk3mgD5XN6VkeHiieKVPvotxTlOck9DtTkIM/exf
         V8LOsgCpt680Z+bhmsJg5JgSEAA67ov2aLEabkko6+/atN9A9+Z9FcVmw9M8+ZIj1gWx
         7bGBwkTLFOtA6GkA4BPLWB2AfzE7yWKtK6+13s3sUZsc+JLnjMSnT+DmUXAXyoJj7F7H
         SExIg+N/F0/4ofajJW7Zwqy4AEOQVtNoJfgklfgy7zkT0HCt4zKYFmhssSR4Ti8T+fw/
         7MYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwj3ftjQfx+Ip0Mi5JBJW0XxD19eyZkXgxayzmg3N4Qs9xnO+dQ5rqkqBxtZ9msyRhQtMdYzJTAZTuRms=@vger.kernel.org
X-Gm-Message-State: AOJu0YwYCP5FQoBE3Wyv1G/lP4mJcXzUoA550P2qhzRU91SWqVdGSo5m
	mRLHZTtiTZvQuMotQmiudEvtC3QFHsV7Bi98x6GAl7MbhOhY9F7ywEb1YMsSrxLCId7pClUFp+g
	eyd4=
X-Gm-Gg: ASbGncvvAzeO1tqCL1+ks3vGFE20FKaWdE6UJq0fa2LuH2u3KPEJDPkWICAoYbwB+GQ
	wUn0Q/7G9jxmxZ+ktQ2MRqiMAo/60hhrRDxzSb+J8V8vLYCMQBOTB+cEI+HYIBC2/GpD8bqaV43
	gN4LNzoFZmmXPGWlGsqclDZG05QWiRhOTrE3KF/OEexRvi6FjZS/1V5uD8+gE78QT6qbC2xo0VX
	J9Ro3qF3ZV32KObcE2H7Q2eMtfcHwxZAJikyq7tdhG88lQqpowg1SOfNfLZMfS/Js6QCRtF8Av/
	km8xrO7xWv005HQ1aDz4FpxwR4PJxLj9W7G5Yg==
X-Google-Smtp-Source: AGHT+IHzySH+p8lRsbpEKp8XdjRw3BmN8WdHjMLgCKHMXaLLom4rGv3xsF4growXW8khurtrZ60whA==
X-Received: by 2002:a05:6000:1846:b0:390:eb6f:46bf with SMTP id ffacd0b85a97d-39cb36b298fmr15212511f8f.5.1744096677281;
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:57 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:44 +0200
Subject: [PATCH 07/10] pinctrl: sx150x: enable building modules with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-7-c9d521d7c8c7@linaro.org>
References: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-pinctrl-part1-v1-0-c9d521d7c8c7@linaro.org>
To: Ludovic Desroches <ludovic.desroches@microchip.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Patrick Rudolph <patrick.rudolph@9elements.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=667;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=YmzRn8TzGA6hsDQ4Ls1ViAlvgo7b9jMn9Wlo//Y9vfE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2a3aI8tyRJWFB0j50+lYKjuGbu/ifeaeFQ/
 4M0t4m17MyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmgAKCRARpy6gFHHX
 cnJ4EACh4EPB2PiBQrpFxrQpn3I5/hHOewyCLs6D3bGW26OisrbJ6BrXg5SN88KZnurmvDHsuP3
 MvwP+6leXhNTitXtnj5TQxtJin6NVZ0Al8MJyd9xwa21k8YTlRMm7rgA4Vx9CNvjDV9gf5XOdBF
 o3JYv1QhJr/SgcdkDr5Ox/diUgdt5Z+bjO2zMLW0i90TN8XxW/blNaWT5xnj070aBbwHIva6E+l
 v1y1VlHp/I4MrpZmV4MtqxBFHCOAQZEOd+itR+n/S8LP50+qens7NAVqfZhfaQQ7KSmLbRKJpm5
 kiG1CDXKTkVqJunSULnVtRahqu1J6ZcmwDJeXTo5PtKQZiFIlUHRjOs60Av24wdhwd+FY4ptQOp
 pU+EYeQcKSLcEMkga3AqSlN+IrU5XJAo9Y4FLczzGc6/9kTe7Y/MLq04J3fmVsp5KDuJR98aytJ
 6m/1/sJrIyiE38hKgq9Ta2I/s9/NjynRehGmP87FTcRsCV1bnl97G4/o6CZtPg/knk7WmCFCogS
 WBIkWDQrNxAYw16mjSeY+350vXO3jYh+7OIbRVqdjqYiZKSAy9A2h4HULcXVra+fEX2z6ALsNmI
 gsWEWEJpEXYy62lnL9J9OTf1+ihsnQZFt0jOnnge9cZzyJTQW7bhCj2GDkVkcgK5wezSQQbuork
 C6IVZWbEkEfQnFg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase the build coverage by enabling the sx150x modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index 464cc9aca157..94eb41bb9cf2 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -541,7 +541,7 @@ config PINCTRL_STMFX
 
 config PINCTRL_SX150X
 	bool "Semtech SX150x I2C GPIO expander pinctrl driver"
-	depends on I2C=y
+	depends on I2C=y || COMPILE_TEST
 	select PINMUX
 	select PINCONF
 	select GENERIC_PINCONF

-- 
2.45.2

