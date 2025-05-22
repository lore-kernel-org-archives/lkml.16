Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6995424EF6F
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747900831; cv=none; b=ANtqdjluTkqNHVcQWi+Jlfl+wdgm9vGxggdlK7JD25/KP7irFrz058RF3iAUzAi63V0OIOIt0KKgWuHG3dM/eYrEmBVVj/cTuAQKm5Cgp7d0uBNMJ02CcHdBlJJNyRNuqpe3xf1Y8CBGGkq0DIaGC3ZX5yVDZrubqRiOv/6vh9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747900831; c=relaxed/simple;
	bh=2KrLRCNsvyk+hOa4GOw+soTgVGJ/UOZjQf27qAwdHMg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HDh07ZysXjKgs920dQM8mvWEzQOOG+1xxEf44/SCOzm8ZtCjlk3bRzbQo+orp0ECLKsCi1npr6S+PiKRpZTqFNVptIT25Q7M78b4HQG7lozrcpzgrAJ+DLkdTlVwBdQaRo15FFMHKnf/S/jhgJNankdhsi+1N2HXjcLzPDZQuOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z+nWEFaI; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z+nWEFaI"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43cfe574976so55792065e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 01:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747900826; x=1748505626; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ilxl+LSaAl6Lq/YJ+iXyW4KufkIqKnj6oK2o+Hh3z1c=;
        b=Z+nWEFaICmKG3vLaynTV/QECLCx5/vGIMQynd+OEOelvsX8QhIp8fQVcNam8+w8flk
         wgSVONPADdzGbynsmLG3V6pRmP5xlTGOmjpq2FCSYWCWU16OW2m9vWxkz+ju0vbJx7tG
         C9G/PhS+MoSogy17s+G3HPSRBnEXq8tQ0raAK19tEpJxIyLDNYaNw26Z1TaDC0V7HdMu
         LgXdYHkp35Pz4UiE2GiGk/gFr45H6WubsDW1uQYrcFD8ilRtqmkOlfvb+xJawu6bq/Ww
         /4HNo2O28GcoOQ7OkbvUrOZ/KrP70cc/5VICLmSyj+ACv9ZwexHBL0VPCUPY4Suf6In+
         DA0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747900826; x=1748505626;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ilxl+LSaAl6Lq/YJ+iXyW4KufkIqKnj6oK2o+Hh3z1c=;
        b=hT5F4oiSMO5zSK2M21UjzCME9WCcJlkmw5kRheCa2qyrBhXe37eO55GQPZfsfp0szM
         8mg6k71yluJIN/PQUTZu+JGZddYisPpGmXPtpb8lyisPm3HZwOAugfeU0xLHEAL1sEPe
         Z35yr9FhGDAmeIJFp48xb85T6vamallBIbWN570pmHYjzoN8xZwIuc1Ye/6vD3NCsz2R
         bYppeMDTvngTfGeXuG3xNjP5UvNXAv0XTNfEoVHg3iI2MxAOOTpn57eOAJrfq4DfiqCk
         KinTR2x32xfn0fCuk3bbZ8lthF5bOGSOG92yLwPz4AL1CM520dIdMOBBtNna4NusDTyd
         D0ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR8TM/a9Za5XzBitsaPAGJxwVX/kFjjLESFLAXwB+xUwRofy4goEj1Y/unhwqPDHXyK86kHa/dzUouT9o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAr/8kljCyztVf4XCFFsULc5FcEwbMP/qcFQwyOG5xQTzW5em2
	MeO/q7Tcz4NGzgvnG9GEJnPt1KEss/pntIkS1clSYmXsgxEdN3IjXGVYoOYZaKJw148=
X-Gm-Gg: ASbGncuPQzSf2QTjxR1FSfB2jAX2L3jeF25l5WB9kjT/OfrMWpu8CFGF0BJb626qpqs
	LGqHugpOvraC8jjv1xy4bhGJshJsCXePyVSwbjuBG6/AYay/wQA47PkLe+wPlYF4eFY1C/mzvTQ
	DsxplyLaW2JG1ojvFrw0jkbpSrv/n9DHYnuEBDZ0T2frOZaLq8QQm/6L13MepxzYEVa87qj1OOs
	nEO1azkITgOFGYGsb7BX3DcbUt/LSrK/UWBIFFr/Q2YElG9GRknfI4q2DLXFdPDwvKFWTCT8vKi
	LxDnSU7g5P5UOchk+Eemdu+Oa04IPSoq0nJzLudP5mH1iLXBxR1S
X-Google-Smtp-Source: AGHT+IGIbjY86ciIOyRVyM/0jS+mEA9hAYBdMWLbkWJXiCcKUuA3jgCciTCBgFzCu9rZSMQYBYX7Mw==
X-Received: by 2002:a5d:64ee:0:b0:397:5de8:6937 with SMTP id ffacd0b85a97d-3a35c840cfcmr20664488f8f.41.1747900826480;
        Thu, 22 May 2025 01:00:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:774c:e9f0:1d32:4927])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a362b4e2e1sm20913519f8f.96.2025.05.22.01.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 01:00:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	"Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH 0/4] gpio: select GPIOLIB_IRQCHIP for various entries
Date: Thu, 22 May 2025 10:00:24 +0200
Message-ID: <174790082298.11547.4760162788670811259.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
References: <20250522-gpio-fix-v1-0-98ceae7c4c3c@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 22 May 2025 15:11:49 +0800, Peng Fan (OSS) wrote:
> There was an effort to make irq_chip immutable for several drivers,
> but kernel test robot reports build errors for:
> gpio-mpc8xxx
> gpio-pxa
> gpio-davinci
> 
> Thanks to Bartosz for helping on this.
> 
> [...]

Applied, thanks!

[1/4] gpio: bcm-kona: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/86fabf1b174069465ea12b4140cb35543fd0c738
[2/4] gpio: grgpio: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/3dff3563cc11e90f046902f0b2be40e82f5ee251
[3/4] gpio: lpc18xx: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/01e4397d0c1c9ae434c574f45359ad0c226a864b
[4/4] gpio: timberdale: select GPIOLIB_IRQCHIP
      https://git.kernel.org/brgl/linux/c/8b8ef309093ff196967a21ee51a9cdb404a13bf6

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
