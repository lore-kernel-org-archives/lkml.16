Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 779021EF1D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 07:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751874182; cv=none; b=d7q7hBGnem+wj2jlmrezPzCW7+Rc84txf2zyvVWv/MLIxYFhAfwCBvzpJ/kB/LRi+4c5ubimswlQPsk1wkN003Dg6qFM9uHju4p2O0ZRyQePt8Mns4T9/8fvx/QAsSontR/SmDjXNhI/D7+zV7wrGzEa55fSmI/DczdhzmRxG4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751874182; c=relaxed/simple;
	bh=Eh5nVob8XqBT5H4toPBO7Udtl43mgczbn+4VPn8DZoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HxvxvvJZZMWerLOHAqGbpnSJPKKH+JXk/D9EHjvYRZ6xdoH1rxxENmk7YGDI/2n9vx4rbwkr2aocsxORgPeX5kjeFV2VmXjW+Fzsxprae5jTFI4ETXLgxD2zOcTvFotrZVruPtP2DefZUJ6NuWaAxA0TqyVbuzuTT26WCEoKu2M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=ChHYPX1n; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="ChHYPX1n"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so2372240f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 00:43:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751874179; x=1752478979; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=;
        b=ChHYPX1nmz0n+W8CMnMDT7zZPn16w0D3pSWC/02A1q8MtyIHzkeqBgPtGe1ZTKA0jj
         gGzwOFiiHv3N/t7ebj1FmgFVWONCdV1M+svymtUoPcYyhks/KCBExK7AwPt3v0QyK6nd
         Mpv5rT6D7+F1Iw+4asZfTaO6GeFumO5uVwOSTdIYm0MvB+tzUcBjTOppISc7kpZVM5eO
         LvwiAozcanHKw5xXpQ0Xx3+n9DDztZvYQuAtOSG3V5bWBZB9jxbAv3fyYPpsBIaEbI14
         4PcJqTsYB/+OFbS5XfM9EXz2uocu+z/qEolNC90DxxQDQr/tju5QBwOWPlu70UaOjXSL
         RR5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751874179; x=1752478979;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IKu+RkS0Zdmhr2twn3T0q2HDKxEwF3RB9jkgTUfP94w=;
        b=hn37ofmcsECyzOxPTiIR28tkhhn2dTgbuoqjkHeYsl+8ji5aic8RW6fCcYm1LTnm+j
         jcWqdhgeWb1YUzu/65+ZfTb7kN2WBMWQ59ppwj9NnKcaPZmIj0UIYAlWtG45JFI2nKlX
         4USGZhUvJUavy3uzMP4dm8cHM6c1VWWaSQa2SSRUuEJyt6qE/1wC4ZXUZtHFcW8EnyHp
         dBACVJXmSePMgvzk/D0ovLDJTsIfK+QIGZp/d11eQxS0TcWndXBLmF1UsUYPjBswNrvK
         wz9QxO61ngMTmi3fiTVFE9Yy8EA00qXRkWj3mmnmpq/FQ2tU/xGJgJfLfTtX4pIbtSNX
         g8Fw==
X-Forwarded-Encrypted: i=1; AJvYcCVUIpCubKltaC1wXb9bvuCWXK0H6jScyQE8Dv6Uh5ZcJ0ZaWWKHIOyDXMSO5qefuWQP3zYYVaEdsZt2PuA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNgUcHduhTXTyaqftjfsVEHveWtcI1srsAR3Jxhw+K/241NJA1
	B9WT8Ze5Nza4bw6EPY5nsC2ccAIoFSeOE5Mr9Nc7DpWC9PZbRKDu7BTdT5uUyuBplSY=
X-Gm-Gg: ASbGncsbi2vBA/+wBFI/vrtpRbsGM/pZBUr7kNhUVql63pfP9XlZUJy/7mDOpo6KVep
	0QeXflTjjiSzzVzK9g9TF4a6V5VvWOtNm8q9nMzg4+8C0DdFDrJ2RlrieddQmnemaWq4/IZdNvU
	wF4UqqjiBcs9acO8YJpED+LdtvREfZ5/JLdAZOPykELZ2V5Hxlf6llVd3tIQUv8AHwVR0BGJQOY
	naJo8U0/lPvZTFazRHiR5cdsZ83Q2yy/tzT+qRa4T/z9XLgIyCLeWSgONnfY92eifQ0U2X3+IBJ
	BsHB/7KWrMQ9ose57MIAmABiWVALWCfF4kHPgd++ZgmmEUKyd0P8mOnPTw1N3CI=
X-Google-Smtp-Source: AGHT+IHNExQVGguYaXAKB1aXj/Vuf2MjgUwaU88wZ/Fr9+ouWScx/ZAWPfXjtQAAvi/SLz+JJ7WmDg==
X-Received: by 2002:a5d:5846:0:b0:3a5:7991:fd3 with SMTP id ffacd0b85a97d-3b495b94916mr10412880f8f.11.1751874178826;
        Mon, 07 Jul 2025 00:42:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3cf3:a61f:85ed:69db])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0941sm9259629f8f.26.2025.07.07.00.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 00:42:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Lee Jones <lee@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Janusz Krzysztofik <jmkrzyszt@gmail.com>,
	Tony Lindgren <tony@atomide.com>,
	Russell King <linux@armlinux.org.uk>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-omap@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-samsung-soc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>
Subject: Re: [PATCH RFT v2 0/6] gpio: mmio: remove struct bgpio_pdata
Date: Mon,  7 Jul 2025 09:42:56 +0200
Message-ID: <175187417000.11224.18185920121696300938.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
References: <20250701-gpio-mmio-pdata-v2-0-ebf34d273497@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 01 Jul 2025 13:49:34 +0200, Bartosz Golaszewski wrote:
> I'm working on removing the fields relevant only to gpio-mmio from
> struct gpio_chip. One of the bits that need addressing before we can do
> this is the removal of struct bgpio_pdata from the kernel. Fortunately
> there are only 3 users left treewide.
> 
> This series adds support for parsing of generic device properties to
> gpio-mmio, converts all users to setting up software nodes containing
> relevant values in their property sets and removes struct bgpio_pdata.
> 
> [...]

Applied, thanks!

[1/6] gpio: mmio: drop the big-endian platform device variant
      https://git.kernel.org/brgl/linux/c/e567269e246809223fafaee7d421ae17a832fae5
[2/6] gpio: mmio: get chip label and GPIO base from device properties
      https://git.kernel.org/brgl/linux/c/c4a834840596c8b9e388d430154959390f9f96e4
[3/6] mfd: vexpress-sysreg: set-up software nodes for gpio-mmio
      https://git.kernel.org/brgl/linux/c/11cd2e582bf4da87b5fc0f9b07e194daaf212651
[4/6] ARM: omap1: ams-delta: use generic device properties for gpio-mmio
      https://git.kernel.org/brgl/linux/c/094017efe332d411a8d6ac41fd8d0a4f81f72a99
[5/6] ARM: s3c: crag6410: use generic device properties for gpio-mmio
      https://git.kernel.org/brgl/linux/c/bb9c88d5b0fabe05b0ed4b843efe78ac1c4712f0
[6/6] gpio: mmio: remove struct bgpio_pdata
      https://git.kernel.org/brgl/linux/c/9bad4bec5daddbb296481af759f9d56c849ba96f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
