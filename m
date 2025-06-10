Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA44C28B412
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548473; cv=none; b=a2dvAY+ly0dYWiXxR/92E/WrEDIFmHjFDLgfYKDkeBiGbNvPwmAscCoGXuk2wqXIhO1Vb8G5GQQ/lt3GP8XtXxeaJsBBn02wcm49xHrn9RlnhEWgiGooicYC8wuAK/fO7NfQckCVt+jcrWjD//4i3iG8SSDya/Q5Ce0mjUfi2vk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548473; c=relaxed/simple;
	bh=Z2f2UZlbBPoJMBwShyzGoWaBgzCjaqrFUvLkxcX0eQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RBgjFTVtJTnCwa0HFefJnY37mIb2t/zPc4BKj+W88YnKIIl8B3gMyPeAzOmmp+jUFOcKEuETuNIOVAXIrHNg4pyl7dBqwWy3bvhLwo9Ed3RPS/Dg6KcxV4zZWuJHZPj4N1SGXyAULqvee4Ws+aVbKAQlmGwDNET7qlemzcEJtEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=yQUbzN7E; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="yQUbzN7E"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a522224582so3188741f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548470; x=1750153270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spfc0NEE2EV/P2qWj1dghBYkiy9zNZTnQ8paYjIjC1Y=;
        b=yQUbzN7EuECAP3ZEJUcUtcifpc8qYgcZdh4UsoHT3q0uZZU7MuZb5Pk+o8sCRvLjQk
         UzR83YD1u4u9apkgBrb8Oxc90fD1vAjanGkgxceMJXkW7nreLcrSGnsNkAwY7Da+bxXC
         88tvPE31PfMMAtcOkHH7rSsY9GbFnqphIq8zD4JSNIBy1zhbYESQ3X1aehc60e/gVHfO
         xvg9j1pEZcfC9dTYvRbTLLp4Q4VaqOqE41qEFxQnZVq1eZ+aZ2xxQm2EJ8302kKcGgKh
         qCCLI7nanSWcAWNZ5P3kx9GgZtELxpthkX8xU3LWMMaWUxjY8aPnsftJXbS137sXRhWf
         xf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548470; x=1750153270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=spfc0NEE2EV/P2qWj1dghBYkiy9zNZTnQ8paYjIjC1Y=;
        b=UNwum4lRjvRvtNnLPBjtSSy+1IsVq5aVkT9TYelNKFUUC4qy1ao+PZXvPmQ1tBiPS4
         8MUFiuGPLKvFezGZHta67AZLBbvci+2njiRO9bsv3q+W6w46f/tEitGLZvNb/oGztEXo
         adCvF6vb/kNnSms48GHUosgVUXAqVKPrSS3XeTfbPSs/fW4pSmBNypsh96TxkonmqB7K
         I314aRcBPdTy97pmsadlN//DDrMWXM87oBK6OLV+dRsPamA3JKs+P7rJ8SXDBTWRZPPD
         FzVrEFXM1EC2JwySSPS9DBN/tq4ILyWbYxVB4xq8n/M/osQ4IpV06zbYnBO/LoKZmGSu
         nr/A==
X-Forwarded-Encrypted: i=1; AJvYcCUdf5cLCtS2BRCWcXxkISY4LerwDu4mU+hkkrFAPXRJzWt2S/0WMHP76ccO+zyqyDyaEPgrjvaKMQpxdCY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy3rSDMvb9rDQndZnAcr3FzIMIQVw8InjnazgvdgxufUCZRReE
	bOTmV9Fu9f2OOwiO5vVHbzDQagvbomb+9aT61XjwkOzhWOJG25+l4XUIgdPDG49D0xE=
X-Gm-Gg: ASbGncvAYkyxLgACUot1N5CshJSA30Y+FktqaxCy1+31XlwsIF40qoe7/JDH81unwHq
	Ba8oN73CWN/KXLq9rWIDOR/iKlh9ET5/gfA41QeQB09SDzpOEFNgD01v3LvhoNzgEI9+3Vjdor4
	LNgOJplWmXkqPbMkDhT/l+wbT9tM1IXVn6jUVUShKimVru+PcaFl/WighKtyRokUN3eWpqpRx8m
	PHxcAKn7gj92Bz+kIHh31QwceuPCG1/cAQPZaUrTQdcFefAAw0jNWGN+MsMUaKgRr+yO7A6G4kc
	6uSRaUUbXI84/z6aGpY0Y+I/t3XIed45VwzzIxOxxZlcCqU0fuf4K9NtvblfDGTLZr36unE=
X-Google-Smtp-Source: AGHT+IGY1m9lVwTiwOUbkDhjFcZNVF350pSblyG1IIU2HN/L7frRN8DyOvl42PjKSzjlJ4R646WDAw==
X-Received: by 2002:a5d:588a:0:b0:3a5:2ed2:118e with SMTP id ffacd0b85a97d-3a53188a883mr13196109f8f.9.1749548470024;
        Tue, 10 Jun 2025 02:41:10 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53243688asm12101378f8f.57.2025.06.10.02.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:41:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
Date: Tue, 10 Jun 2025 11:41:08 +0200
Message-ID: <174954846672.40051.9274185826688444001.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250527111353.71540-1-brgl@bgdev.pl>
References: <20250527111353.71540-1-brgl@bgdev.pl>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Tue, 27 May 2025 13:13:53 +0200, Bartosz Golaszewski wrote:
> Currently for CONFIG_GPIO_GENERIC=y each struct gpio_chip object
> contains the fields relevant only for gpio-mmio users. It's not an
> insignificant number either as it's several pointers and integers.
> 
> It makes sense to remove these fields from struct gpio_chip into a
> dedicated structure but this is not trivial due to how the bgpio_init()
> function is implemented.
> 
> [...]

Applied, thanks!

[1/1] gpio: TODO: add a task for removing MMIO-specific fields from gpio_chip
      https://git.kernel.org/brgl/linux/c/97a7ea2b8f4a9aec1f43435658343e046c2a4983

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
