Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090B126159B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096676; cv=none; b=oxyWUpImqsWEd3WkpYWucBouz4mV7unj9Ju6gtuX2hC93rYfvwcW2+NQkLmKu+WzCMUfpb38ewJe2/yHvw1l1SsH8ZTulArf9rhvxhs0kOVgOpNCm5GVKYbPcpIs2flujLhcD2BSi5oRksszNnYfCGZ2tPzscTS9vLAnscTSb7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096676; c=relaxed/simple;
	bh=mm+CYE4HlFqyXrmHXF0COUC9+WgpXE6WtAJk1HFSlKk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=vBFTXSoR+NV5AsK8Yz7JVvW1ygdea5xAMPg8iTmn3oUkRQuPKMhRXqlaQ37mqKdhmhPu7CPhGCVEiGgSoXkIxqdUmUEKVooRgvxA85Ex2HksrjJU4c4uC++5CL1KHCmyY25d3fWww9sduzzW60nbrOS0moeGHmuiydhnPO1WZfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=zmyANZSP; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="zmyANZSP"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cf628cb14so40734065e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096673; x=1744701473; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=zmyANZSPe5F0+SNAThTUiSayS4NkdTkMGA9SIWxQat4TXal8PWxLSmTWqTcE6YZGWI
         486Fyj6TZXQ2Dv7Qowzg2U2n3n/AzTXou7AP93hkr4HFfimm3DrJ49Wy7p8UdVJbhI+d
         2QhwopRrLFA6v34FFph9Q8zblCwTwzaquiHD93HLWuqVrT9/ZV+rz9vB3YvEQvQYRhZ/
         aaYx36+wkBFy2IqnRFUZ3yJChj4cL78YDGvPmS4qDU9OcBcW2GkyzQ/Sm8QLG21rx6l4
         YLE+m93Obb0PfHkx3t1vdrk8GLwBoEL+9jwnCeaUSMNh5CnRZWLh1H5oH/vSmuMYmOhO
         hF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096673; x=1744701473;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgKpi2eMQzrwoQvXzcbqAzy5xxQOgpVGvK0+n6zqybM=;
        b=CRsQrtv4QAYH2R8GjU5bWN+lE6+OUl6pm35CilIL7lKNZmPNRDrfJ4rv10Jdh8l5rI
         8oGP59xA4KTbaSN1/og1fPj3IZFPqCDGwTuILM9/diJrl5WrwOrE6UgVqEI9Wm76WTUd
         JNkITx1xG2SS5EUA3eLzus9l9b/USWt7eSwP6M+RYwUrhV04Tmj+3NGIr8CdxRg55CzY
         G6YOTtyi1H1N33ZD71cBNTnAZirkPkuOPKaJbFIuh+XYdGxpi+2FP/mUkcAhGCKpHq3j
         ELirAeyr8PmMHsxReC+QF2TbNaga9wyWcBJWfwAiHtzACqR+AoHJL+uMfrCF0UUb2KDx
         yQMA==
X-Forwarded-Encrypted: i=1; AJvYcCXOykXMcFLFJ8xhTq1iGq0gHOmSllCN/DL9Vpkhqb0NWrN4Gmf0YF5OCZ5UYBhycrz5SWbSBMwuvm9+dSc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1VgWfZbFyu3c3EP9pyjSlyvf0pC75ivf/ondt2oOmynwFvJ2V
	OIUfVJ7+FPny5ww+YcJmtSVvQzwUfR8Ns4wEtQCEarOZnSG+Z5wTME/huDGhRMM=
X-Gm-Gg: ASbGncsD1dcI7VvFwlvjFXTq7xtgC6qa+5LwS//trCCx3V4B6qY/WlPhMboSE04hOIJ
	PtHRG18N7E0rnfICzct+1TH/dCcPiRxPHqsw6pbQ782iyjjD12rv7kVhIuRsm3NJn0WwraCRSzN
	xt2VukXo+/QsQXwczy/gLCSK5kfuAZcrKwTQJgAuzP3JX5d0UATv0ns7QN8CGOrVAxQ4WAuk3K+
	WTUfFpqd9f4DtdqN8wdJoie14SelC21Bvwbp8IX9HVkdUaZ5KYGCoSf/KgrjaW+kE1cXZK2QCJq
	/yHhe1U+EuV2F1Em7QiVkANkQxvPXh0VSbalzQ==
X-Google-Smtp-Source: AGHT+IFIDoEgtgjZmRm76oLe4qBixaJVFcxIWBxSgP9eQc/+muRPjB5OZ4DhcXqFSFfMWbn8IPCLNw==
X-Received: by 2002:a05:6000:2484:b0:38d:ae1e:2f3c with SMTP id ffacd0b85a97d-39d820eb1f9mr1593525f8f.25.1744096673169;
        Tue, 08 Apr 2025 00:17:53 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d5d1sm14257694f8f.77.2025.04.08.00.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:17:52 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:17:40 +0200
Subject: [PATCH 03/10] pinctrl: abx500: enable building modules with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-pinctrl-part1-v1-3-c9d521d7c8c7@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1197;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=7gT59a+ieEBoRyUfHtp8d/jvYbZrPQXR8M3Rkb54480=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M2Z62HjgrUOk13umM6zCKtt5wsF8hMyPqGii
 +FbeYzWZu2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TNmQAKCRARpy6gFHHX
 cr+9D/4pVK6myjhrhbvOnoR4PHJ367IIWOAh/Zh8cc762qftCq98AjRSHWjpi3KMWk+T1SoewR6
 yd9FAaYyN5ggStwHN8ifchYiv+JA8sO+i6UuSIOQUVQzey/SsbW1SeTgmZ3o/GsdKPG/HjoxejZ
 M1kbfrXMCRWGU5zTxGwLAZl126dUhXDTKScOqGDG6ZLFctZH0MSBmu4Nu7uWpRWQK3R+Xr6OGfa
 +BSLVhz77RThlP5bmwNejIlKFQNdlTKOpKLwZ4d0FEN5QJPa8Epbb+Vvkputkda+ERCCbCEvjf9
 8ZSHC0SCNCcLyorbyOA6rgYWiPo+GZMHSqoF/Pl1OFZzp2mCtAXPyQrKJ2wv0I5KYUJSLuNstbX
 pAA8HtMWVKN2o8VTfFf0kYbEFAo7BM5D+3B86ctemR78XtjX9vA/33qPRw6qbRuWNjF2jLMxwGg
 7sr3CLWFwcyqt8oNdhyjEWmfnIO2z+BYPCo7Btr52pKon7rbGIyJAAG4gxmUqgjRO/PJ06aCPjV
 erKdtcafZvxLT9Mf2jX/+expNbOTo5PKgOvekHmSlI2xdATbBZgMQPxFNUNJVlXLL3UGV8fR/Zh
 +ApMwVs12NjHuf/sT9aZDxPH2zbKJvARpXLKynmGD52HIn+u06LPHHbZH2+obwAez7+Tde1ydSJ
 G1AuErL37JcATMA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Increase the build coverage by enabling the abx500 modules with
COMPILE_TEST=y.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/nomadik/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/nomadik/Kconfig b/drivers/pinctrl/nomadik/Kconfig
index aafecf348670..2c1f8a4f5d24 100644
--- a/drivers/pinctrl/nomadik/Kconfig
+++ b/drivers/pinctrl/nomadik/Kconfig
@@ -1,20 +1,20 @@
 # SPDX-License-Identifier: GPL-2.0-only
-if ARCH_U8500
+if (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_ABX500
 	bool "ST-Ericsson ABx500 family Mixed Signal Circuit gpio functions"
-	depends on AB8500_CORE
+	depends on AB8500_CORE || COMPILE_TEST
 	select GENERIC_PINCONF
 	help
 	  Select this to enable the ABx500 family IC GPIO driver
 
 config PINCTRL_AB8500
 	bool "AB8500 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 config PINCTRL_AB8505
 	bool "AB8505 pin controller driver"
-	depends on PINCTRL_ABX500 && ARCH_U8500
+	depends on PINCTRL_ABX500 && (ARCH_U8500 || COMPILE_TEST)
 
 endif
 

-- 
2.45.2

