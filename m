Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7E77274657
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:10:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653050; cv=none; b=D5t2euiWMxq39Y7SiR415K8qNU+BcxghAeFyXI3yv89nyjnkTLfNKDajOWuHQCJ6fnSmZlMSTERBqTlcygjf5/7qozi40aLoHsbY/qz2RFrR95TTWlPfD22z96yvR0gJoz5/RoayYvYIpDjRvS7dNvIyghRPp9HeDXd29wMPEDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653050; c=relaxed/simple;
	bh=PJ9tOqE7DCqTj6Xu6T4vmNVqp3QO/g286vSHPwSVK3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X/HfBawJrea98LCfSaD3Xxwv3PKQ2PANxXpXqmRIbyYq6enSPbfUkxzzdmrqkgXMlGXRUV5Tm6QTXuRjfmpTvDlkwy9zlQvdYAku/1cjvqx4lMalknj+SH4TOT2TXPvKQhdjxT+PB5uLw2Pfi8WZZb9tJUN8pX/DXvgwmxEOmec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gdf5miCN; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gdf5miCN"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edb40f357so34305085e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653047; x=1748257847; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h6LSc5lez/Eu//rcIMT09wjishlMs/MOyRm/EiJltuk=;
        b=gdf5miCNZU5Mqbiy5odTkcPxhxf/y9ZfyRps1vkJmswndjGTo2rPjBWDmLZG9KhNNO
         RiOcOVdBNZ8vA3ua+8D/HhEoGXztdGySSXfuneeLuaRTTHq20LRQcU6fq7bLOSaHcFmV
         RfxCB7ma1TQyNQmHCaF5EGQ7/XvEeh1zpAUF+qE+/6kIzYkrGAt1jI/xC6RyX7mMkm43
         9wHMmZa7wADcfi/yz/dng1vE9o03HMo6h6OxSu+7VmWPqPq3lKP99pm71FqPRVy9dSi8
         R0wGaB8YDsA9RxS9D/oDVNi0alluV3kbhPkrt/HSBOL3XPftNpuwmVT6a/413uOn9oZh
         rtUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653047; x=1748257847;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h6LSc5lez/Eu//rcIMT09wjishlMs/MOyRm/EiJltuk=;
        b=FxOEp55AafTe78NnpgWKJAXxVNcnbhadXdXzq72tTRVrylOX//o29YcC7C7GmEf4P4
         706P9XOytIg6iczeYbRlARB4zdOOBRZtvw9LPTXOxYvQMfszkKCFP97VtaBneeYpOyBq
         KiPQWRh20LyBZXBZSPaLa8AL76nqN7ENuda173qx//61CZmaxgAuEaPygfqU1y/cYOET
         6w03nC6VZaJky12tMnmVzxtht9ajsumlBB77shB+68iouNaL+qxLmpHe/AbVW9NUHMnr
         rNtw1Ak9772Lb/I27nTQb7fn6fI2Y1EHSUXC+JpyJi7Y8jf6W+h/GunaHoSJQm+9K4dA
         qp+g==
X-Forwarded-Encrypted: i=1; AJvYcCVBGpdN+ZXIwXLfvNMEywEABgYjf3tcxZqnaNEfwi1jiJNzDQBWgSC99srZkkydjrclAbaLGB/ptbWBysU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFkGvZ9/tJyubCet7J9W8gTbUyyCW3ydtgSF1HLjHAMHVS/NE8
	QZ7FDzwwHpUzWMGm3ZVjb/P/eEIpj+LKtwlFJtKAoPjg9WeCnODKCFRbCCRI50c1kTw=
X-Gm-Gg: ASbGncu6AlZ+rgXrIFRY96mVx8zUpR/YiNOKApPw6tfJHgiDnB0F1f6IdpYEzBkBWpi
	r0bBztq9fpLUzzx1TSZkWs6PqzOVDcErjbiLt4EcAVrCaz2YgvQsYtroI9w3Q38BwBmvIhA5IIX
	EZp/V1K6CkfrZETSjybgf3gn2JXIp9uQ22FjmNrK+OYsZPeSnNAs23zLr37X/0SuNpbXae8kRIn
	2pzcqu8VGuhuYTlwcTgQhJTuLNQqb8Q2m6L8EMx17aspRAJ+UkQVMoqSzAq5aiN3WfeQAmAsaLt
	ODovUVT4yX4h6ujNEm2uDmkrO1FX0ayu01puBzK9VFwtVTirR6B4zwY=
X-Google-Smtp-Source: AGHT+IF7h+zBMscgpauGlKG/YNnBlXL88ytZxqLJwFBN3aVaOn08DNTB4RwfSEtUz8teJYzBRcHiHg==
X-Received: by 2002:a05:6000:184d:b0:3a0:b308:8427 with SMTP id ffacd0b85a97d-3a35c84bda9mr9754134f8f.37.1747653047174;
        Mon, 19 May 2025 04:10:47 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm12290575f8f.75.2025.05.19.04.10.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:10:46 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:10:42 +0200
Subject: [PATCH 2/3] gpio: mpc8xxx: select GPIOLIB_IRQCHIP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-irq-kconfig-fixes-v1-2-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1045;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=J1gK/1Ye8x0phnZQJskolGjNM5MRLOhPlwkZK2TChYo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoKxG08O1LyetUkEWSaaE94TbrHPAvaydgRNsU1
 7f6GEMUSSKJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaCsRtAAKCRARpy6gFHHX
 cj5DD/0f3k8G3pCagvCcw3+ypFtHH4C3qpYAZJTuYRroxQ1smGi8n+tEbGMBHNUYL2qmClAIPEx
 hY7ZqNbt9CJoVhcs7NN8svxvdJdEAv79JiN2cwlFryZHSA8ET4DhQ6cxTb5n0VUpiZfzGDfw+70
 wEvX4CXuCUl9orIUhx2GI0jlL8PNXW5TgxSUq7zNceePAy9MdUoNBc6z+uywpA0W14FrHAXKWzF
 Y734Cs0icu5M3/Qlu2jlG9SSrO3Fo8kip3uZqZKlyLkdaNsYpNFb9dDYsOgyFtrmK16ewn3rgeb
 ipod39G+byoAubGgAXSVGdN2hBw0XFTsOuuK4b/AMJmo+sieGU740qnkPtCZueNciv5Q71p/gpO
 JhXDml/+J4N3zjsiGpN6XXSkb75bqqTaqcVgFXaOjIwMsM2OIoXml0qntSSlOzKlBDaKwkUKhDZ
 Cve6MHQuO2EIsQDrrfzKjtvlgTJu7S6eb7xtnib6JdpS3+Siy1s3yBhNmminMhLcM+xSWn4G+zw
 HdCidvKcxgGHpDYKDaEnWZ2YHgWkSzmwwJFHMVH/wa1yKKU0lce6t7ghIDSaRnmyL8LPpXxPaMB
 cIXlAOvo3tvx09z3POknCmYiOXGP27+KPBbpNONHz6ctJokGUH4rWWjjaKiRyFm6A7KJitakZ3a
 HCl2e3xHYiEtVCw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 7688a54d5b53 ("gpio: mpc8xxx: Make irq_chip immutable")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505180309.1nosQMkI-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index dbf503d8228673013d4b58693152e7e21436fef5..a559d5bb824932d07e5a11b4457c1d5fe457b8e8 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -479,7 +479,7 @@ config GPIO_MPC8XXX
 		   FSL_SOC_BOOKE || PPC_86xx || ARCH_LAYERSCAPE || ARM || \
 		   COMPILE_TEST
 	select GPIO_GENERIC
-	select IRQ_DOMAIN
+	select GPIOLIB_IRQCHIP
 	help
 	  Say Y here if you're going to use hardware that connects to the
 	  MPC512x/831x/834x/837x/8572/8610/QorIQ GPIOs.

-- 
2.48.1

