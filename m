Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681CE2B9B7
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 00:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738802236; cv=none; b=ikaVTM3+CMSn4cS4cvbNqDo2ut53kxOIaEqd6sh20HKRGbu5buCtIQlEKOm/ZOY++XXe7/sk4Or6vrWep81ID0lSI5aAwvjzlGshQhIfFNQMRNYWyfHMNBBA9cZ2tlPekmPJPA4icyvcPrt2mgndYy+9ScfZM6bFa/gaUKUx+YQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738802236; c=relaxed/simple;
	bh=9z/NlbEN8jSOw3hMYSM0ISuObqgiClju3/L+Fh35BN8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=E/zmDw4KfTQ8hQTudw0QI6n7gZ9wqj07XGEyIIYpmyhkRUd1ZSAGuPztXYXQz1LzMOnmtMRNZV8xfOPRuyfirhmnZV9kLR998GylQMNiS5F8D73FNx9H/4EiI5V9EWhrVp9LP4pGrax6pxx8MTsS/h/V7JZ4txuLX4jwjnsLDP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=jKsEJsa8; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jKsEJsa8"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2f9d5f6df4cso408228a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 16:37:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738802235; x=1739407035; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=jKsEJsa8wqClIs5/nvZ2UJJGw76I8z4vidajJJ3fIKC4brix+6xGmevJetO3DdTUIh
         B97waMLf9AoXhmARXarGdZXGMIbhRO604mb6qU+s9tfrq7uRTGhcrz/terX4xnwTvu1O
         l48jSnNTcWnTiyu5sQkRIiSQggIWw53dNeM1loEG+IM87/JwqXfDbQpkfzPll3pteK0X
         1644Ab2pUgr6l3MdvyShFHvBH/zqXX3iZMGCZiAgO7geD+jqFob34WOTbvLtYjp1o9x8
         Ee/C+xTX0rKDUzxaakgZoBJQl2M48Km6Eus4fv9/UBSd3/qafHG0+TFfUYb78YNgcWdj
         tdQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738802235; x=1739407035;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7u4XADLr/C5eZ7qkGhMI8Yv7tVqEObjjFDJ5fXQvZww=;
        b=ZtHTas3eu8OW6aYwSeKcGiGyWcujMhmRakEnvzZu9/IEFX+37359/zPkwsxWdJQsxN
         TPRwaeiWxK1zSLhsRf33+tlIB1LkD1QXTnJ/MDvTziHggkKr/QWMyd2T88/9Fa8wv5oH
         ZJnWTss81ht659fCXhjb9tgkisDuY2C0axv0seP+n/Aafa2LKqlrYwgzIYyUn6qezl2R
         oSlHKtEoH0+VGMuY9q9L6kk/HS9NX4pb1XZS3BuI5sm0mKZqLHGS1TpmksD8IAEemX37
         mcYR3FHLixv7ZZ7Z6ryinCS7LBkU7l/5yJ+EmP/TrUAY/W5x5xPXXeZk5INusQtO+Nsa
         espg==
X-Forwarded-Encrypted: i=1; AJvYcCWeYVAxkd4XBceG/kBg0hPfAgP6jU5mOvaB/NB5N2mAMYYiHrfRyPOd3jiq8/8LHIC/rO7Bz5sjc2tnkh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEVYMZZfuI5T5KaQ+hp0PysAB6RjtOLZak1UifF/cRBmmbygau
	1km+E+XYuruZ7FJD2uc6bAzmCnxIou/jOKNFY6TSJk947KXTYn/8+7ShyfynkxgeUBV3/YRBHtS
	z
X-Gm-Gg: ASbGncs1v4FoIF4beNs6zVLxc9zLVIVECOKUADgea4uz9mn34GIq/pOjAE58KcUqlvN
	OlDdYEoBhX6yWCy8MZUDe4z+TvZJv+Db65KasPXIHEWErH73Bl4uT9enybK6oZUsoCwa2zKC/M3
	tF7MvRMqALIHXkotnvJl5KX+oQr71tgIb/IZD0oYW//1Grt8RcqU0f/5sM5payl1Ygpi+Yyi0w1
	iT4psVeO2Bfgc9FUYL9bubynt5h8k86kxr5z+0MS7EheDfs0GxRWu9Ht5P7ygr7o8s3aoIvAnMF
	i5NCz7pXIVijiw==
X-Google-Smtp-Source: AGHT+IECtRNllbLpK+x9JkKsoGM9WVGfThDVXSbLPfFhNXjo7Zhdyn7+h2ahM/Hfy/0Z08HwPXvJQg==
X-Received: by 2002:a05:6a00:1942:b0:728:9d19:d2ea with SMTP id d2e1a72fcca58-7303513cbe8mr7280503b3a.13.1738802234722;
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
Received: from localhost ([97.126.182.119])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c15bb9sm61111b3a.122.2025.02.05.16.37.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 16:37:14 -0800 (PST)
From: Kevin Hilman <khilman@baylibre.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Arnd Bergmann <arnd@kernel.org>
Cc: soc@kernel.org, Arnd Bergmann <arnd@arndb.de>, 
 Tony Lindgren <tony@atomide.com>, Masahiro Yamada <masahiroy@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20250205121151.289535-1-arnd@kernel.org>
References: <20250205121151.289535-1-arnd@kernel.org>
Subject: Re: [PATCH] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
Message-Id: <173880223388.2488567.3141490107424057794.b4-ty@baylibre.com>
Date: Wed, 05 Feb 2025 16:37:13 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3-dev-94c79


On Wed, 05 Feb 2025 13:11:33 +0100, Arnd Bergmann wrote:
> When GENERIC_IRQ_CHIP is disabled, OMAP1 kernels fail to link:
> 
> arm-linux-gnueabi-ld: arch/arm/mach-omap1/irq.o: in function `omap1_init_irq':
> irq.c:(.init.text+0x1e8): undefined reference to `irq_alloc_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x228): undefined reference to `irq_setup_generic_chip'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2a8): undefined reference to `irq_gc_set_wake'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b0): undefined reference to `irq_gc_mask_set_bit'
> arm-linux-gnueabi-ld: irq.c:(.init.text+0x2b4): undefined reference to `irq_gc_mask_clr_bit'
> 
> [...]

Applied, thanks!

[1/1] ARM: OMAP1: select CONFIG_GENERIC_IRQ_CHIP
      commit: c2a5f8c4f28ffea8c93d10e509c5a6e61172cdca

Best regards,
-- 
Kevin Hilman <khilman@baylibre.com>

