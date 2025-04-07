Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C41322A1D4
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010447; cv=none; b=VBCtUNDyQ7XOPVF+NbdDGhecHe4F/FJcTBlLe5xlG/oJQtnEjlKGq+gPWCY9fDRpE78Nfy81VhxBNK1GiR72TZbdacm6di517ptdilWp4hBwuEolTJtFM7CqhQYQl6DAG8oZjWyZc50gPncrxDxV4FuSzujQyb/Mg3o75NdsQCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010447; c=relaxed/simple;
	bh=n3y5S+O7kQ6BuzA99tkggUIPSJO+2r1CKhEXkaomFp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r5T2KuaAFmRkOSNZpi8QYFQNVWLLKYPfZob7Cr0f3AEgXSHPXn3VwclZawabRuoXAkGJ7XWeePemHmT3917neEN/r5siUwKIFidhh9bjSRtwTY6SCb8oP3kH8iGOa8sBqddnUEWikNd/EW54IbSH3g0u2kszv0S0NHDKo5vW4d0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=npzSQQG8; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="npzSQQG8"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-ac2bb7ca40bso361752766b.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:20:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010444; x=1744615244; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKdjaegSMAM/rqAxMCD9Qx149zQwzIx25XoQ9FIROmk=;
        b=npzSQQG85EDenDnVHcpm/jcQ8ifPEi3zqIcaqXCqdsCvuRiJe9y2A32HMGJIZzMbjR
         VkR3d5ZjiS1GxkjVe+GMTCuVzzsR56TfMWR2RXPO43Z8FdmSUAhAtsSuwVDwPdEGsPKA
         kCbvf2cPeQ6IRrHMx/F2jobkGvAltvqVA12eXKDG9as35O/cglxhhSRyDNAsKBq2YGA8
         sKe0HQRY8DYsoRDii7AUIx2K4AGMxClJiHyAmjEHdQHy6sOozigxQ8o8KUJh+J1qX8Ve
         Vo/RfHypa8sojuVvFNTd25/oTLRLKefM9klkh6O0DKiUSAwXY/NdOfgLhD00zw7JB7XU
         qjBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010444; x=1744615244;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xKdjaegSMAM/rqAxMCD9Qx149zQwzIx25XoQ9FIROmk=;
        b=DmvQ/xrfN3r0OvzQyqG1y82pY9tWRTcJpvu7v1XgMs05rQdHFpdKsCnjWx3+0NHpt2
         sZkb1gWC+piazc3gUwp2zz0dOPHBni8WVP4lARJR7313rr/zwWD4zkbUd789B0GpJswe
         9d/cERmS9O5NSFBaVnaDVFIsbtSfVffHwrUDJqwkhQ+qLXLZzZOCX+mHQBBo1pOKg/tU
         BDlc2q2tw9tBLSV+oDnsgCDc1+97eWzEobzg/ayxWSmvsAWnRyADuE5d2nOQ9O9U3/kF
         HSi8iU54/CG9+JmIwJIeDTmxpSZrKM+Nm2zq8L7SuFbpJEw7TV/mOAZz+i0VQo1IOCN5
         WEmw==
X-Forwarded-Encrypted: i=1; AJvYcCVd8xwD956m1dACPBWpR06CQPuLaxbXJef/5vxy+S7k+Buh9thlNKjgOLPfKCFDGNS2IhNJw23LpFkpwZg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw90B4I7vcthcZ7YcnmJdx1BkGPMsTrXxGeBrU4wNJGj1rTsL9K
	J33V97HrYYEB21OT2doht0EqWudBnLmvw6Qs4OtKKGOg0YMtfTnD9V3D06gxDzJNPG2IDk10BfP
	TXyo=
X-Gm-Gg: ASbGnctLWX9Zr88xX1O63BYqKSUR4lvbVlfAvEiOEvFo+E3zmBYMYfHlb36XNvXqfBu
	5uG399unRxvj4U5KHkMbgIxEv6c5OBvuXEBD/PIJRWp4xEdcywyEMyeXWoRwHq5CxKlz+kSPsMs
	2hUhqJ9VyO1aNiYSw7vcUoafAuXL3xovd7FSUxm/3G0Kfb6rVh5oxR/QFzHaavcVTDrmb6PfwqF
	ekNjWI+53k4GmTS2wW+YdcH2ieJ/bNDOo+B9vjCwn7uPz7hYGTTgt4O+nXGt1D0k9oxds7jVBBF
	0RXlv3KO7pDctOZT36bKmWvBM5RYtIlki+NpzQ==
X-Google-Smtp-Source: AGHT+IGVJL2F1/8I/lWwJ31vPm5jJXx6hPrzpL71kYNbYKzzALSjHc3IlX+0r79eE3W6Jj2Qgam/hA==
X-Received: by 2002:a05:600c:3ecb:b0:43d:7588:66a5 with SMTP id 5b1f17b1804b1-43ecfa06563mr113287175e9.31.1744010003499;
        Mon, 07 Apr 2025 00:13:23 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:23 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:18 +0200
Subject: [PATCH 09/12] gpio: htc-egpio: enable building with COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-9-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=682;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=KsRxiW0W4vPyxl96QeRBfnOsz6q4m3Ci9vZGWLs5JTM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sJFjAf8szaIrgU5fOqH/7amZ26nGC766Hem
 EIDJGZEXr+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CQAKCRARpy6gFHHX
 cq6qEACSrOsrL/eTz+OWDhz4LW60zXJaDDg5Nuceeu5AW1ALzN/2p0KC/vTlpXXplL6RdF7BLRf
 2hgVRiqsLE5E03qR0u/5QvjgXLpcIZLvA/diAZ4XpZ4snRlDvtCxE0PjAFuOHG5bY3TD5oJXRHZ
 AYjngYn1l+FQwvCZbDR1pEgQdgx11SkyUGQduyHYyYrYL1JqGwJpe6wGTNUHAUxAHQL3FvVnVCI
 9kERiaMzIwJuLFc/Zl3M0+O67yijJGaMVWhLu4LuQ/lXL0WLApQGgc9ZfQJbflHt+N6v1ks4Hcn
 ckZx0oGiwVo2rrKoTI9s/LKhVzGqBocBtL6md2qZm/thsYmcxHiEAaoQyF1Hq28m7b6Nbd06T7L
 mPbAEcwvF66QinqBunjXweN2uCn4H2323sSgaQk2aD9ZCV17q72vySB1My7hgAGeylyutpAfM5y
 W7dYHtRhWpYpfdF0i0BVuv9A7TWKT6GoaWCKVezB9rGzX9a4JAniOrnnACa8w85M3GkxutuiqO1
 0TmbiI1/mcptGer4guYOBZkhxl/oDwmc0/GA5d6DfPnXP5Bzp7l4C7GjsovTpIFNyrgRhm8fDhS
 WzOqAEi4kuFxf/EW59WI5sce39+te4RlicHYmTDxAJWuSfpOE/mKC11EQughtuzgyvQHJ1bBLFM
 gdvtyhemCdzldcw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index 5bbc7f724a09..decd150810b7 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -1365,7 +1365,7 @@ config GPIO_DLN2
 
 config HTC_EGPIO
 	bool "HTC EGPIO support"
-	depends on ARM
+	depends on ARM || COMPILE_TEST
 	help
 	  This driver supports the CPLD egpio chip present on
 	  several HTC phones.  It provides basic support for input

-- 
2.45.2

