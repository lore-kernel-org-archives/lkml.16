Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C785826C3B0
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747653049; cv=none; b=HA/v7yxA9ASLfl9yAjEv3+OfZO1R1OzSh461vfhne3rNDBSYo4ulosOdN8DTGbqBx6qlIwUsF8QkYszh+yc1n2QvNR5kv4nQl+/zB47C1beomb66I9C4VXuRaCrer6qd/AenLDPSasiMGYwSe15eBGUf5rzlFDQ01+tM9+5K/K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747653049; c=relaxed/simple;
	bh=wiEzBh3xjQwUdk+I+cg0lVGNUDnsVUcuKkYkdMmu8eE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YpgrCOh0CRWa2OWuSE93r0I1CHzAQ1/PGhe+vzwnyIUY8P81CmkdzbT5p7PJWm6PUrYNoWy3Je5e1Q+7jYIPRh3O4K/OaU6a9mAZUXmAuoMAhFOuMduJ+jIoAZBUjjbQGIBtJ56lonY7CuuvczitpdTRNrWbSE3W9hCSyqqg0eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=P4lKhf55; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="P4lKhf55"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a366843fa6so1123319f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 04:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747653046; x=1748257846; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vsojZtD6BgTPOWkTq93jOVXdejHw2hJ7JQOoFv4Lq3U=;
        b=P4lKhf55MjOmgfIiulbqszUFcPPug1IMLgPM7WsGC4iBi4NKiTpBy4fuu9ZvFKwNrY
         LMd/g7bB+8+mp1giJI5atATAYZq0ctKW0KmZ/0QXlq0svDihwPI/YMzaTkQPNL40vxr0
         oYZEGpV2Z/1Z/gpJVMfJELszf1i4teXsthXnaRG/ICuHzxd0RGs45YxkDVz02AlqwwyU
         dJGMkXwBE70LeaPsvXvPpqM/S/cmM6m5QFOYUUBRQb0I/ncwFmOejc1zlZmG5zIomF6A
         /yZGvIxe4Uv6eZMX52nwFzfvsCArbQWXP9Id10E8XFgL3m6lYI2I6/91XFHuFNd9D6bN
         o86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747653046; x=1748257846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vsojZtD6BgTPOWkTq93jOVXdejHw2hJ7JQOoFv4Lq3U=;
        b=cvy0VHjQzhHWhrw4U0WZgY8ZpMPh3pVBQIZ3PByqQ2uw4jClRXu5UoKkTtIAAgvFwq
         WX5PEWbuH4ftDwJ6GX4F8Y2fKMbde7jb6kOD0tBw1eHY0nNPrSkNkDbejCXscSGTEyKm
         J7HM1z7IEDrZtfePkrT+kKOsZD1MlOdAq6k+bnkAl3C9fO18gbxoJNSsRCJSm41GxACk
         uCTTt8r11x5o6Jb3YB0PbAZ7C/71OIomhjOvc2HMCPbrIZJEZ2gcQ1YyglqoZAvwni5b
         lGel992QWc5QRVxSsWk3JFSiBzmCkFQKZSPd6dbnO+PDRYZGqp9vaeNQdUftpGlJf2cV
         xkwg==
X-Forwarded-Encrypted: i=1; AJvYcCVuT9kWyM7VsMmC/RB2XXKl6zOLj1RQk2gPm5reuvoLxHv5rBSStCNJbRgSpN8II3/+d+7Xlk6ZtHdZ4lM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfLTTMPNWUTPqpoFmswQS9psDU0xanF+HJnti//DBzsyVKLO90
	e/B7HlZi7S3ioIoa8mbbUL0MuCsUUbLScbz8DwBJ3Rz0eWZSE7nrVxJ6r46sFmZ9Zrc=
X-Gm-Gg: ASbGncsd+TP8tDTM2akowXG6uFaocdykKrzEF32zK8ciVN0DOrs0EmEoYAgvH0xhbxD
	o9CN1YRInWz/+SqF+f0SaC8mhKsZAp6W25X65as5tyh0pKUkxd7LbdArl/nEO2ylIX1W0ku8R4Z
	FZn/5AtyFjP/Jx+OQKstYQpiR/uRkk6IDX0cNtTBnGLYO/EX8ihMHpADBTibxHGhTmJ47YWIEnD
	lO45gid73Cw5FuGDNTBCA15FHLpNCxz22kFju2dNtyZ6ozj+1G3sSpO4Bu/PltDHjkjYDtmfkze
	eDM90YB22NewRcPkPu9sRaEhc6JibLZXb9eoMIuACh04
X-Google-Smtp-Source: AGHT+IED8LdqXD9Af3ETI9Y0T4VUvYPJWcf8vCfNpBx6He82lMQ0mLy/U+9qVOdAPSKfG9tJrPASuQ==
X-Received: by 2002:a5d:64e3:0:b0:3a3:6cf9:9b71 with SMTP id ffacd0b85a97d-3a36cf99dcemr4170595f8f.51.1747653045839;
        Mon, 19 May 2025 04:10:45 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:fc90:23dd:2853:309])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca88957sm12290575f8f.75.2025.05.19.04.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 04:10:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 19 May 2025 13:10:41 +0200
Subject: [PATCH 1/3] gpio: pxa: select GPIOLIB_IRQCHIP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-gpio-irq-kconfig-fixes-v1-1-fe6ba1c6116d@linaro.org>
References: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
In-Reply-To: <20250519-gpio-irq-kconfig-fixes-v1-0-fe6ba1c6116d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Peng Fan <peng.fan@nxp.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, 
 kernel test robot <lkp@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=932;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=kxKveyPfFgx7BPMeOTDzizMxVcZNhn8BUaL2GhDm9xw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoKxGzIaJ6NwcXryay2yGScPsmPQzhfiStpbCY6
 97H9WLHeSWJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaCsRswAKCRARpy6gFHHX
 cjaPD/4hNzogj24oMngDjAp6DouxfRlPlyGs/qaBdG7nro5p+Ls04e2j7isW+8mnfKLr9lKlsbn
 77u6BrNnuY+PYEVyjtSOj4GZGlU5SvWfJlNL01INkTbACGVVHzCJg3aNZO4Nz1Yl42kf0eD0b3l
 NtR2BUIL2/YIH6CNOWXS/J3U6Dn6iRAIL5AbhktyjBMKZBz9CKuWGycOib+klwA4BfhaxlKyZh3
 oPyOlFSp1zfSCMk6uolJNc9zm3ZcO/cD3lraasVfePUD85AH9FM+4eATPLM+aIrh2vw2KFQdAkd
 IB98CMj6ENRs+rBo8+AmrBePz1inr02sVPMEuAURN0WUgeNDc6UVlw4qVju+jXolaPJNw65jIRg
 9U88lGeYiuXrc3PNDf37rK5a4FzdGkPEHzOvl+uVHLcp/AFlpojWJ+BQyTYCSAV5bUveG/+NEAk
 pBXY9yD1qWIpMmBr91KZiTCSij1XNzBna7O6nmZjnxWOcBqUQDFvQgy0NhtwLgQMt+nCn53BC7H
 vCCg5MUGugttQKdR89pDANuESht7PsDf4davNNBomDkRvg8cQ9qZk06+dkBN2HPqQ2d6dn7vOZt
 HOcU3xLqg/qHeDLyFlZEm0Tu+JL06V29j/1ep2Iw0iFF2urT5+CPggc30E4iDPgjHslQLaz6Ufg
 Er3wnOyX/VXrXFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This driver uses gpiochip_irq_reqres() and gpiochip_irq_relres() which
are only built with GPIOLIB_IRQCHIP=y. Add the missing Kconfig select.

Fixes: 20117cf426b6 ("gpio: pxa: Make irq_chip immutable")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505181429.mzyIatOU-lkp@intel.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bbc71cdde9ed66b2fe69dcbc7508d51690d2cfa4..dbf503d8228673013d4b58693152e7e21436fef5 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -566,6 +566,7 @@ config GPIO_POLARFIRE_SOC
 config GPIO_PXA
 	bool "PXA GPIO support"
 	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	select GPIOLIB_IRQCHIP
 	help
 	  Say yes here to support the PXA GPIO device.
 

-- 
2.48.1

