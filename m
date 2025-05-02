Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401A4225775
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 10:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746180544; cv=none; b=sTZqjwc5ET1GGUpMOtk+NGu1LtH8SH8Rscy2j2OgYTUccLfcMxY2NXYXMUomsZmH47ySIQzHd40iEcds0Ek1ixvAcak4iX40v6DB6Pyl2wjeFz1dY2WVirmaYK7s+FZrPH5+ZdkQs02Y8nZBbsfsKDWLSa1blr/coDZ+8bU4DlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746180544; c=relaxed/simple;
	bh=G/yQbTWKw5+TnbyriGPn4AE4fOGUPbORB3d2ncVsOCg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ue7LDLOuPLplOItDm6f5CRA8ZVz4z1iAqRfNmpApNsdcfBQVveD9ncPLb6GKc3RPsb14fm5qbVYEBmPmy/HU8p05I1Gv5YtT8xmSGOnDcNOKBdpOrwuJvtsTFlsNu7Pm1YhmRPP44ADGjBp4Vdd6leJyVqGCY3dCsJ9ScfmiYsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IIcn0eGT; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IIcn0eGT"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cf3192f3bso16886065e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 03:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746180540; x=1746785340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1gpbxUH5zKXlvd7Jg421zxuNqN0FwJbinQ6smtKhC/c=;
        b=IIcn0eGT5eCAKbH1QQbSw34/ym1+9eKcNKAoGFoU3pW81hXLhYHRTV4/RcS4usiyOv
         3IBaN12KsRtIATtuVeU1O+ZS4HIEp0x4t+Q7AMvPejYSnsQbSd9/Q68uFnyr8CWZSUBM
         WXiuSsvVBN8UC7p/kWstwBbFghFLRg1ZpolkA+yJE5eH4WbK3xKmyYjULIB0HLyDhtAE
         /1SGDinetrhz/lIHhQDStXVQoY5RmqZT61r+Y9VJksOE1yt4XZIpIIezi3/kc5SY/DpU
         yOBi9FBAFbELMgUVxdkcc3I1Gjfn1e9h/z41Sox2S+2zSuHXcGbUxgerEJYs8YpkoOP5
         B2LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180540; x=1746785340;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1gpbxUH5zKXlvd7Jg421zxuNqN0FwJbinQ6smtKhC/c=;
        b=dMzMrubWX9ArvmzkdL8xR+V8hfEjRfDyYC+MLFYr/p/8V4ZU3/ZjsQWZnB6wZ2vrnC
         IaCpQlZnqDpoWldSO8gLi1xyxNRkupv0sit9WWxwS3WbfKS/rWJcg76m56UqSSRpG803
         K4RUDBlcyfhhvJ3xFNE+lb8PVJsa4Q3FthUUGNtNzhD094l0XIU6JaDmbgH2LXR0NVI1
         Acrb7XROl5jDyJAn14GjIByHNWbNbMIHdOg1A0mStiqajQc3al6mwApoZJreD2e74wNm
         SuGSw4PCVKlfpKtjsBZPVpu2EEK+KjEJfzAb3UB7bhspChDXTRnOmeYUUkz6NfJWK8J6
         RH0A==
X-Forwarded-Encrypted: i=1; AJvYcCVKA3ImCf37PzcMmQulr2XASW+8kfLZjBTYcEzaorC4ZNnOy3OnlWyYia0SM3Mk8OqyqsPu/MBY8HujgJY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi6meIXpW+fXzmeXljsaFWgu8sIIA9pcpTRwh2nMgy8THV0wOv
	hwPAdcIQoApMwAgtirGdxvhGs2qHfX/eqeMNzo1XdYHYNeWRoptTTHMudRhtz5E=
X-Gm-Gg: ASbGnctEfl5dygl98v6sPndOCnsLZF5rkOQ4n9Tyv3ewzG6iaVCitQtiw69RrnwKOK9
	gVmbWFQ+4a8A+gTKJQmvoqphE4SD/N1IfhGb64tuOhqgiJiZE8aDN2oG8kTfDDOVx+ySxSULtXk
	JL+997g8wbE2+Z3afOYdolew2TbJzQckhP04V7xv/+RxGr7r5AnVLZHa6wmpdJQXxVbSt1zFqgV
	qK+jgcL2Yq8zufVxzTNUQgMfEhX2uDOksfYpiv8DxRsiiy7Muc0Fo1E/SK26MbuPDsDQF4+mnTW
	rVPkbcc0zo3Xht0sUVKkQ9x/0Dmdg5Cr9/0wC6uP8g==
X-Google-Smtp-Source: AGHT+IE47vfNWr5eva9bcWEHLRezwNUBG4506xXlFZEBT+W4RLMrhKjqpzQGXO7HfBEF3Nn5qo8n3Q==
X-Received: by 2002:a05:600c:348b:b0:43c:fcbc:9680 with SMTP id 5b1f17b1804b1-441bbf31f09mr16912665e9.25.1746180540381;
        Fri, 02 May 2025 03:09:00 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b89ee39esm39361045e9.21.2025.05.02.03.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:09:00 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Paul Gazzillo <paul@pgazz.com>,
	Necip Fazil Yildiran <fazilyildiran@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] pinctrl: at91: drop unneeded dependency on OF_GPIO
Date: Fri,  2 May 2025 12:08:41 +0200
Message-ID: <20250502100841.113091-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver does not use any symbols from gpiolib-of.c. There's no
reason for it to select OF_GPIO directly. This addresses a kismet issue
reported by the build bot.

Fixes: 8e86af65f39d ("pinctrl: at91: allow building the module with COMPILE_TEST=y")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505010447.kUlI61vt-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pinctrl/Kconfig b/drivers/pinctrl/Kconfig
index db84d80b7e7d3..33db9104df178 100644
--- a/drivers/pinctrl/Kconfig
+++ b/drivers/pinctrl/Kconfig
@@ -107,7 +107,6 @@ config PINCTRL_AT91
 	select PINMUX
 	select PINCONF
 	select GPIOLIB
-	select OF_GPIO
 	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here to enable the at91 pinctrl driver
-- 
2.45.2

