Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B202627D788
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117154; cv=none; b=hCfxeQZrIf8Zbkt/9j4+/A41E+xJcC80r54kPM7wVphGD4sxlkDHU25qvDKSzzxAtaExr4Y+uNVhIBTikyTywAeFbRDbLTl8C01XvGOLgy4esT0uZWnsIjwO4+TbxlHUYRcOYFPj/opOyNjoI9V5MQoAZAVZCGdukIwG6PJ7Pb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117154; c=relaxed/simple;
	bh=ri4lakWjGaA6VRc8+M0gjfnaWC0bFCqg3RphFjcd+mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=HpDx9JVB1Pt1Szt5jGS1+qRgBsC5fKwDT17BicyiJvvNNH/QnhGUZo4JkoBte1J85w16XsxB9Gznvuy1CjjPjRPJocbxxH/PGBpJHhIcO96Qxii2DHGp2Tatyq1HDoWlp/TVUM4DXBEI2E0WMEsgiUDoJumU1MllOQ3tFAp2h6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=nQcBKYqx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="nQcBKYqx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43ed8d32a95so32051825e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117151; x=1744721951; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SNvTyyUxWe3Kjmcu3ioZ8/vy0nzapTFjSVjN/l2DrR0=;
        b=nQcBKYqxY7oVnC00H3IY4UnY3WuDUE7jRXmztkiR0PzGkZb89Hp5ICXlgwrsK7rNKf
         DtlSrXbcy6hmUh7NDLtcNyw+keFIJrnfqWV7pTKMF4W0twfoKQdgpgc3pMiJyNs7Zh67
         cDzNMj0De2mtzkojbEcYy3Py/pUPu/p9Ykl6Gi2Vt2YSSBtADcGkqZ7IX0Z4s2gxpGKl
         lBG6mue8l8L3c+VLZzXFjQbDbv1TrL1/Fl4nPRtN97MlUhhzWMElS9OwfbP9Tgwqx43o
         h4og/3L8nQcTu+49lJ4cFpvIPixcymR4Rm6QT9BjZk6r4+cU6CfvglMQ5rgx/leHFDYR
         Oyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117151; x=1744721951;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SNvTyyUxWe3Kjmcu3ioZ8/vy0nzapTFjSVjN/l2DrR0=;
        b=O7BGO9H7+Uu1ZgA9KmroCNhgAjMFaHLTvEk3rY91nGqHdnSEWIdv5qjtojx1TkHrUL
         /QguW0i59U9tBIP9B2JCR3pFCsfjzwsSNOkhPG1zpwZQkbaeEq6UfmVAgu/kIFxaNEt5
         PbfPkRjDgf3iK8a166Z4t1fRO2DORipCkFnIbIrj2Aberq/7eTz6zJgRo8S8ka4pDKNF
         Lc+uZev1gxPr2dqo3yToxj1Vkvpc++01uEVkAktk9yo7Tmtze9GsILg5UjKrrnQ5XFex
         ygAsQr2UgGBThX3EENTW/tgzJgX2pFN2h/pAOAICJHRC3/YUh+OmIQQ/qbmGznuN3Ys8
         2xuw==
X-Forwarded-Encrypted: i=1; AJvYcCV08a4bPP6D5Q92rTNipUxq1KmUlMjkMvKNz4/dhlHCarVvi6y28xlFWf4wHz4ycVndPTOiVZQId4k4lp4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ1LFqq/KuBCtNo54r7B6oegj4pEwy7f1JQ/2IWk7CnGc0iA+p
	Tee2oNnV+LaqNFkPer7c77fohoHvZsDGta6t1Omu6EJjyBWurMZ3s5wumD9UF94=
X-Gm-Gg: ASbGncty6vaHyMD6Ckn0EaEMX5AmqRwzJ5p+SCL6f1S6K+mz8BNS+b9LJeUjQBhhPRY
	fJKfTVI9GLB8n62QQaaVfhAFpsbfkpZADZWr0iF3fqnjVruUk3+XN1UKLEwNXlASCcrrSQaKc13
	9oSDWMatDc7mv9Yto4648K2Y1WEpS2i5pMyL2ikvK0vUZ3Oi6jZtAq0wfFF3qEfoRktXcKz3ffe
	DXjBJrN/oLk568u0sKv0WvPIi8ZzJmGwg9nGvZ0vp35HtoYmzHkA7GkAYy4d6T8tpaBDkCsVMz6
	wi1v+Ki+EVTCEhyrnNpgqX6BaVkWlNf2h+/1lA==
X-Google-Smtp-Source: AGHT+IFGpRGP89KTwOSOhK64vHdp3B2vVXVKriVjZmU5NIgr7jj4CuM3gCxi6kGPgqMoXIjuT/Ht5g==
X-Received: by 2002:a05:600c:5494:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-43ecfa04a99mr117103505e9.28.1744117150931;
        Tue, 08 Apr 2025 05:59:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:03 +0200
Subject: [PATCH 3/6] gpio: pl061: enable building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-3-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=634;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=JIbwDoKsBxGEUaim33zYC4POpTW07Ns+JtH0JutKRRk=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2ab4k43KhOouMqHn5tRtzBjnoz8iB7tFXAs
 ITH2ItMB2yJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmgAKCRARpy6gFHHX
 cheoD/96ZiurytnX3MityD0u2QlZAWhecUGm6uZLWokC/ZL6gnLrccSKCEhKmeAMUMhNxZK8rgW
 maJxwakI8V/nEUuvLBL4LkvAsCGncKmWedp58SaeOivFMG2VnvHu3ploeKdY+cpwEBXSQiJsEcH
 QHypu6Urs583pclSdgTuJgI0i1cs3luubzfAQeS93YYq9xsSKfkWK4NqXjCOkg+jKfj7PUYmZVb
 oFHUUWOF1E1XXH7YaqpkTqir9dGzbVVy0uxgnIbOiAbD6NfteMxPGijDfRmxGMIe/9uC32J0Drp
 AsMLBeAt+r5+QYHiIiScxfqzs4OLsDr5Z+DYffGSWe0+tMhboA/aJ6tEjI5HWYhiIIpSDcfr7Je
 7F+9zpFtlBLPORibANJ/WNjcjdZR6ZVrc2zAr+zDQDfd3/CbBeGjPSSV5eIaT12wMqW1UpspTF7
 uA2SM2fYcJuevOE8SJ/45+9W71K4Hand5BiEjVTIO9y8SsXxf/XDf6XV/H/W4SOUtfD/dsLEgEk
 PNvu7l9+w3SgIVj+cH1UBtHNzF95y/SevHf8JrI9GCorjUiV59zh7OV1L/3zAq/uHnTJ0bFCE3T
 gopEvdjl5kTkg6NAHTeXd/np7OMcCLxmViHzgFrdM858KELNU08nooD7zdayutPKlyajm+Mf7LO
 0HEURhzQzORmVog==
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
index 9b25bd667b76..bb03457afa72 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -540,7 +540,7 @@ config GPIO_OMAP
 
 config GPIO_PL061
 	tristate "PrimeCell PL061 GPIO support"
-	depends on ARM_AMBA
+	depends on ARM_AMBA || COMPILE_TEST
 	select IRQ_DOMAIN
 	select GPIOLIB_IRQCHIP
 	help

-- 
2.45.2

