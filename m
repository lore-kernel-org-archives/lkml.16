Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96EBC2505A7
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187749; cv=none; b=pzWIv0/9aiAtx7E47y0FUU4gTxuCVUm8nKTHbPd28m3AbT/YGnezioqSvYhFAgXNGDkDeNGMeZ6vct2mdc47q0gGlCL26s11ygNUNUdaJWVx7oNLsMDjNL4r23Nk5CPOl21FCQOwfY+n0iEHXiyDS9ggAQl+WKCDbkwTJjwvZIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187749; c=relaxed/simple;
	bh=ETDEyyHWHJEIKFXCApELl/R9sLYGdCkFQ8AFXJvJsQA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CRLSCtO/Bla9/DBuyc2TNprIHM0dPee40mIeqRvMNRVFakJoVCUbu3Qeos2bbkvlzc/WyLuLSwOPqlSUYg/OB32dwN2zMJMYYNJWXTaDaCq4rntlLGnJtz6wxTR7E+JuT7LHSvZdyJJj4ZE/7SZpwwRsLdiBgTpOmSw/Z28aIDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=BoJbaHJO; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="BoJbaHJO"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so63639295e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744187746; x=1744792546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=;
        b=BoJbaHJOBwa0kbutOCB5Ug58bwkVPP7j4+L/+G/pTP1eX2IS5Na2y+MD46lKhW7o6q
         4YDVWEiBAvC8RTYy699FOfe4LV6LSGBfwGC2VlCz/tuC8Mga8+H4JKo9E67mC3AE+bFR
         HBtcHO4Ymx7bgoDlFAEcNj0Eh6aSEaLgWr9ggfJd129NF6O7pLFOGX7QFuUA0wJHHKqB
         vp1GHHDjJsM00j0aOXs75WqREDEPOp1wpG0bzsVtGvLQqUffVGeKLT6MmRSsksS/nl/t
         SsXZlJsMQ1JJ/gaWkqORcaApR5LgOQsyCMLBleAy8LWbHOKh3cy17X95ZmkmboZca+zB
         6evQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187746; x=1744792546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=el1YoTqrU0Hduquq3XtvrhCcVlg8sd7EcPhPRkGv2hE=;
        b=m5FEfVooLmT74TbQW69KkXzy1Cr5M0Jx8BDt4nct1bU6P192vqL4EPHK3xmRjqkTls
         rxseNt9ED3wDWfNJiMS5nvJTjLhYsocNQ7yI0S8yvzKgx/dCnQuU/KzU+e3P/lVi33us
         uBZYLXMb2yYywvvDeHh7eVNX+9RMpAFp4M9kTp1xLlBr6mV5qrTjIkAAHy+2T4FzGl7G
         b2PDeV3edA0XSyY6+v3/PSkgA2Ymn/u8bGJEVnolpLg2/yXEegXeZIesq56dWZaiUQki
         VL7SX3q90+ZEaxBFzB14T0tpyyo9iVvBC3UT9ar6cEvg882cMNIkg7Vfq5wVCYBPtitL
         p+vA==
X-Forwarded-Encrypted: i=1; AJvYcCVzPk5wFX6Get6iQAF5Mp50ER8iWkQp4panmFw7UOdm6XGfgy0NEzParrUYrGFMHqVZ2eiNuo1ceOwkB6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwA3605R7rOThuwgdT+8Lh/9afKHBseMVA0zA0OydW/7jTnJcrP
	wWegriQMxI+JEr1SKDezbb/2RbYeBEs9HUUDfJfo1ZMLJsAy35V/vwWnpQNNnmo=
X-Gm-Gg: ASbGncvCzVBL3A9RUWg5/OPy66NsJUpWTlzvGdE05MCetHG2Ucap7jkhp1cK9GoV/AJ
	WdJjYM+5gtX4BqH0EwXOnax/0eslXeTpzDFgsfyaDBPdbBO94VKLfg01+tnrqYIhE4J28semV8k
	N0lR8xBMkplBCTSU9e0RG+6Yb/spkum9n/yI/7cVGY1Q+NBz91KMw5HyMhmUqBknGnsfDOxJ//g
	Ta349X+GCNEjOHB639FWEb1RTzmb31p/5Y5VoqBPY8vU3jAX5F/UC8aHQ796MfKfqTE0kSlgmlc
	ZFbTQv8+TbHt+3/56tgRvXHWupycNwvKA11bRbU/XlAadHyLxvo=
X-Google-Smtp-Source: AGHT+IEVD2lslpaI/7rJdnAeqx3wViSVYCOrqXVSkQ27OLCHAfme1XR6nMNHEVQPwT+A6iaBHutElQ==
X-Received: by 2002:a05:600c:c88:b0:43d:3df:42d8 with SMTP id 5b1f17b1804b1-43f1fdc3bf7mr13678815e9.6.1744187745673;
        Wed, 09 Apr 2025 01:35:45 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f205ecf30sm12557045e9.1.2025.04.09.01.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:35:45 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Andrew Lunn <andrew@lunn.ch>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Russell King <linux@armlinux.org.uk>,
	Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: Re: [PATCH 0/4] ARM: convert board-file GPIO chips to using new value setters
Date: Wed,  9 Apr 2025 10:35:44 +0200
Message-ID: <174418774169.21152.4210389076223179557.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
References: <20250407-gpiochip-set-rv-arm-v1-0-9e4a914c7fd4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Apr 2025 09:09:17 +0200, Bartosz Golaszewski wrote:
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. We're in the process of
> converting all GPIO drivers to using the new API. This series converts
> all ARM board-file level controllers.
> 
> 

Applied, thanks!

[1/4] ARM: orion/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/6982e6b0bdd838fe71a6133cfc0f79645bc31a04
[2/4] ARM: sa1100/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/9c3782118a57a6d7a17980115f46bcf2b85fdf29
[3/4] ARM: scoop/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/dd8a6af45928871e5d9a04959ab8f97c3714264a
[4/4] ARM: s3c/gpio: use new line value setter callbacks
      https://git.kernel.org/brgl/linux/c/fb52f3226cab41b94f9e6ac92b1108bce324e700

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
