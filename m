Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B73825A2D3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185677; cv=none; b=W6pPgDsbLlBTFvQf+6bA+pCytE/P1JH/ZIEsVve7Zkuci4VD4IRP4FDnAZmdVDNk0efNrG/Tri+MBk5/7TnMhr/svjbOKiQ1mQsz4ofuf6WOldw9yTR0U4cvQ6j3DFTX+y0TkSoskgzNNWU9aqK0F7u5gHA2hRS2+XfyteLgI0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185677; c=relaxed/simple;
	bh=n3VPKB9aYltNneVrBjJGraBYHEIEXZKeKZdBL+aUoq8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=lgYNkTXaZU3YVKdPJCwcO3Qf4j7cDHO93EdtkV6N6FJLtM5XN4ABoKFNXFPsLTsyNEfIaraPbu4kNerOStqs/YfiJJ4KWQAGU5Pv90fcPfGtDqgHJqw+OtuMRHy6ETftP4t3WIVtaBvBpxYga0+cxZZ7KCrseUE81h7UL9n0TKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LV1w7mjP; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LV1w7mjP"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-39c1efc4577so3515319f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:01:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744185672; x=1744790472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qYA5nuvEcee0U5B8rRBFmv973vNjUvML6aJjj0Hxl2E=;
        b=LV1w7mjPkbiKEZVU33ihSVNkHa48YEgxiFqHgU3mSzSHE4Arl97VLKP4CieoBlMxom
         3I2YCZQMvrXHS2qyiaowRvJ0Q7019s3xA7V9KSFdt5zXI/uKaDlOTFkcaX3XHO3yA9O7
         knXYjlZGJvia7OBTgt1s8Dl0uFfpzdNK5IUmuWTb6+MB5V79Dk+5zDsITRa3swDq3Oea
         4Jh6ya5NafU1LSD3x8ymSN0DZU9qtuyoChr9HyEFxxwORTmdte5KNdYAUcheJuA7Ywku
         zbNV109MRdy/F8kCIcNvNmiT+Z7i3SH+mDoiurBNArb+D6oiBSZyzCJRYOKpztgUafgS
         y35Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185672; x=1744790472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qYA5nuvEcee0U5B8rRBFmv973vNjUvML6aJjj0Hxl2E=;
        b=JN0hbR26NXuP2gDhpv8eWFaOUx9QWZTi4cmXeulg5NNlkTSTCVh/TPsyzQTq1gOfQu
         OqEOHUHh9iXm8p2LXRZ71Ue/tYkb/s73VbyBT65NFDAigOp/lsQPV+JzdINr4cVcRFPo
         ya38Fb2W1VUiwZa6jkvAzcgyUhSBWw2zsA+cHPtWJ7Z72TFCps68O/3Knql0SPw1CQyF
         dwLmGyDqqrJLxJFbXr6K3DTRd1ZToHEQoZUL7H2URuzSlKW51wug0nXjOWN0g4vMzrnA
         jeS4qAGfmiOv5IRzexQghGHd1hGM9rPaMesb3qrhwz2X+JpE9tG2XBKmcx+5k64imlbp
         qnhw==
X-Forwarded-Encrypted: i=1; AJvYcCX/7sa1SKfiWTWTUyALQ+EVUzb+sEV0+1uQHSV7Q4/Hc2B/j357Jvb87Q7/4KZOn8mj/wJFj3QcL7GE7Zo=@vger.kernel.org
X-Gm-Message-State: AOJu0YymcZY/sjbwUc9JGU+CAPVAJioQsT96eQp+0fYZN+hoRU5eZt2y
	n34PzFGpEAML8JMj4WvXKe99m1b1i6NWLGzWsKr3cZBkOBdcZ7zYRQgHgTOAOww=
X-Gm-Gg: ASbGnctn1+EopDoJSsN0lPDclFBCHZD924BqWekOmzw4r8Hp2Dby5BB8yMF+35E4j1V
	0Y7vNrMJHD/mJUvTvfIIXbgAIFMc6xQDw13XkLWn/G9N4TSi2e342BIdC2IWcEiHJakmC0/3DUb
	3NZJu867JKKzj7dBxVjrn98M3OWnhBieaw2luMken74J4LZ2HrCDC7X73DBRZxgESqMR1//mDcb
	4B26zk0miOVJ3db50PW3FSgGTosX/rlKPqJEdeTNHEpEHQRn0L9jBiIjpDTi04rNtx7MLnFNA0n
	0mVoohntmZeujhu685gZfdjtg2oQStYuZ1VfQVB8
X-Google-Smtp-Source: AGHT+IGaj8cFxBAvcY1T8wT2Ez7JNKsWmwnkcv7FXxTc5rGKH2FENTx9IQvQjR6mzayg09fR083p7w==
X-Received: by 2002:a05:6000:2910:b0:39c:1257:feb8 with SMTP id ffacd0b85a97d-39d87ce318fmr1678541f8f.56.1744185672504;
        Wed, 09 Apr 2025 01:01:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:7880:1c3f:3ac3:7c62])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f2075fc8esm11350935e9.30.2025.04.09.01.01.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:01:12 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/2] gpio: don't compare raw GPIO descriptor pointers directly
Date: Wed,  9 Apr 2025 10:01:10 +0200
Message-ID: <174418566616.17540.8349820040396705264.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
References: <20250407-gpiod-is-equal-v1-0-7d85f568ae6e@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 07 Apr 2025 09:08:13 +0200, Bartosz Golaszewski wrote:
> Handling of shared GPIOs in the kernel needs some improvements. Let's
> start with a simple change of not comparing GPIO descriptor pointers
> directly as there's nothing that guarantees that the same physical pin
> will always be represented by a single GPIO descriptor obtained by
> calling gpiod_get().
> 
> For merging: I suggest to take patch 1/2 through the GPIO tree and
> provide an immutable tag for the regulator tree.
> 
> [...]

Applied, thanks!

[1/2] gpio: provide gpiod_is_equal()
      https://git.kernel.org/brgl/linux/c/265daffe788aa1cc5925d0afcde4fe6e99c66638

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
