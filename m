Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D141FFC6D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 07:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750059846; cv=none; b=nWi1ch/EikWLXIsTdTEjNcJPEOvGRJR2KAFMJNJGozXOCqnEOCzvPB95Rb8drY+/TvAwG/8zZdKcuGPfgTafwdGjnkKQOH+IRmScMpuNs9yCZ87lWD3jTw6ZraYxgWmi9LZAGSNH6GbhU3OQEUcprNrhJ/HQfd4X8DBG1Y16l7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750059846; c=relaxed/simple;
	bh=96OTwG6/iG28bTHQxzabxipQYNEL3wxef+/smJwNLYA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eCsrgAEYHrTJq64i6PcvQcoUThmvfrdEKiiZ35d8WRadIKkGwhlwYVg2kdfumuCLWV9Aoz11jf2bj76wDfEVs3ZINrNVjCwPuKnPaC+2F1qcCWESh4UVt1We1WaHM76621pEdQiTC6r5Ftz3qasgcUkugTJLaFmvJlOOhcmJ5cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Z435ZTsM; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Z435ZTsM"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so3457486f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 00:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750059843; x=1750664643; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=Z435ZTsMXuSTzLbdaj9DvTUKeNXMw6SSI8SBIBb0ij9yKQBdAWP01HdNDmzvU0YflM
         elW+Tga49TwVO7cMWk2OIIJWxE41HvpqmJfGrQ9ajy4ItCaM4AGxfd021N/VzaCzRzK2
         Ylr4cGsqXlnWTemFF8JcwfZi1GmuSltB2NIOyLVyi1Dafo3KOl6OwUrKsY7enUoZhZvW
         24+4oRaqKi979kKXuzGZp3HazdKjYzECWadIIrErFHDdMdACSHNa6shdP4jpyVt+ryf6
         gAsID2mQVBdNXqoNe1ElUnLSB72ATk5S+1YdPLsuLHWekNG57PDfCppQ6aQfj+pyUf7T
         CvhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750059843; x=1750664643;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tMMpwu5AAcujXLKEmXFe7RXmxtH0nNb2sC3DH3erLCo=;
        b=kECq6mru3917ECBxxSU+aIEAdp85R2ijWk6VJSJPcNcVT1Ndxk3H61JTyuYX2pUNPX
         XbGEra+ecH6yB/JjbbLs9mT5vVJPMvhbpB72eo6i/UjeUYmr9L/vCLXF+CUMsy9AHGgq
         gmL13+o8jLH8dBIkYgqmUpAdke3oCud+2WbFKHUpmN2RzJGUC2Vnl+QCuwJ07HxJLu9M
         am+sKsQXcdzBAO4VjYpFZzay6UkpsMyxRsOh/FvFjLNSWyYt+B+qcrbBXWtwd0OGv+Mq
         bf4Y6xZhyskuuOQBiRYsYZmzynPNf2T13mBNpx5KKOSYXy0+oezolT3boAUDLp9bZqsj
         5VFQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9jz/dtqvBMSB9VhJ/uSUNHQ5ixceXZRmVOu3zfTrkO3kbEaTONgEymFWPIUQzg871mKbjFLvWiELy6hs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6fBFgrx+o3DZI62Hn/EaWNwpyL4S34wAv3td0Z0wNYgrlb/tA
	XNJZmgRrlIT/iHr9KYqQMAwZ/DkU5o/Ye3eOXI4QDjg2cvahwusYbtQCrxPEbEXskpU=
X-Gm-Gg: ASbGncvRIeg2xVDzSM7gEBpRFj+W9LBYfGi1Ht97575Ws8uR0JIEW8mYhVKJEU795Eg
	I4MYD9dcw7XM+aQd6BEy6E7pzJAB+pwwDpBsa2CxpSpAl5GsKOtcaGTwoVV/vuobh3jhuBei6QX
	AzE4XiPz5J7w8wezLZmFs92uspxcs7sFBCuDr82DTwGu+vnGfcLFMhQoL1H6JaLTmaCHyAnA9g7
	CevqJpCbbQ6Vz8YuvnADBZi9WzuEYdGO6YXIGSC7d1MRl8bOS3Ubu75gA/Z1lryPu5nBm+itw7h
	rwPLRC+AagtBMUxamn89+cSXrjnIe4FLoRM7M4r/MRMn5uZs1dEF7TFPvo1/a8U=
X-Google-Smtp-Source: AGHT+IFyiwrOAI2w1hU8cdsv4G6PwQ9rykHzyJGCDN95ThomN6k4mm9h9BfNGYN1cWwJ8JWTOJssQg==
X-Received: by 2002:a05:6000:400b:b0:3a4:f2ed:217e with SMTP id ffacd0b85a97d-3a5723af786mr6649593f8f.42.1750059842782;
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4238:f8a4:c034:8590])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e2618f0sm134543945e9.37.2025.06.16.00.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 00:44:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Yixun Lan <dlan@gentoo.org>,
	Alex Elder <elder@riscstar.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Vivian Wang <uwu@dram.page>,
	linux-gpio@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
Date: Mon, 16 Jun 2025 09:44:00 +0200
Message-ID: <175005983908.15867.5595150226500672210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
References: <20250613-k1-gpio-of-table-v1-1-9015da8fdfdb@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 13 Jun 2025 17:25:33 +0800, Vivian Wang wrote:
> The gpio-spacemit-k1 driver can be compiled as a module. Add missing
> MODULE_DEVICE_TABLE so it can be matched by modalias and automatically
> loaded by udev.
> 
> 

Applied, thanks!

[1/1] gpio: spacemit: Add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/brgl/linux/c/e6382fcf989074566bb9a54bbd3c514d7bb99397

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
