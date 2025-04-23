Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9461B26E14D
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407494; cv=none; b=rtAB+D5nRqmuKPftXJRQCEdMlJZBqiv6/HEUE5nC59+nGp6cPzGJe4zf3POmgJTDHGBbt2FzpPkOrMEwoozgTmYybTzkoUEfIGSgACfoSEX+jygqj2CJdkrDykD4x/6gMOs8xZo1Jn21Jv5tLl4gwnAscnwC3MIQySFhuPVIIxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407494; c=relaxed/simple;
	bh=cHFBuV3l95HmlX0HRQehmp2u+wdgt0YFS9/N24j7r5o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OkOr4G44AFpdSo+MW6asU0KIGzROhlEvTiR/3zMKKc9IWtLanY8b+7YSZDHXw6MPbSjDjNQtE93gdWlLMc75FVbQWOpX/Z2EIZ49d9aib2fJNM180eNGOGV8QDMnV0USDnlcCRfZrf2yhiMUweEQhCe1hUHJLQCo1jQWtZaPclY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=h8sdvKIc; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="h8sdvKIc"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-39c266c1389so4644671f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745407490; x=1746012290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2D5d0p0+CzfBNxQlb58oVQd56QarzNbrJ/V6/Prm+5U=;
        b=h8sdvKIcgr5C4YSudpWmUayOWdWNFU88hrrTyO5g/CLh5M0xQPhhUQeVLxdi+ePnTS
         cIql7fbEXB5omiUilzIjnKjQGPeiWEgqqFwJwky6/TiPMlLve0nFIRT8ou7c3PS7seHR
         MqpfGQs4uX7Uk8C+hSB0ZUn9sUoLd8ayBd6inzEJhu+MGbTAZQdyN/P2sNT8imd6sdJk
         NFvvl5w6tEILvuRio2aJgJB3xIdt1GJwPJjmAbsBCNOJHp9GkuABg3VVkBAr2AdNB7eZ
         rExlu6dUJdybG9H3WV2UOzToNi0eobDNPqlG9S80/dQldTUIKJJnWwA02mkarCZpHOlX
         GfDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407490; x=1746012290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2D5d0p0+CzfBNxQlb58oVQd56QarzNbrJ/V6/Prm+5U=;
        b=F3kleC9Z34ieSnSbnAbcAPWM9WxMouu+FYtsN6kKpNJY3/h56FRwuJ5Snp+YZ9gazh
         lai7/3z4Ytbpnj6pG8rUf1XLqOMtWC2yQYfh+S/iXeInl81sdb+o2v5yspY1Q1zYQapi
         LdWAFBoX2hiecVzXTbTV9ABPnObteSD0pgnkQhHVXrwJNFNjcQWlYAzPz9s3xnMGznTr
         PA5WEoo2I7HsjpFvZ8UkWvrnRcHnqGAl56rkaZJuyy/q1F5oZF3jYScf+G31TN9nL2EP
         6srd246ruyiC3ds9av0ZwSkFgGJQfQKX03T2bZE1BKrTIY8+TVOAcK7LJgM79YZptnOi
         gU+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUFY/aGdjXm9+kTxuT8gfI6LfZksyxqwsJ5Rlqu14cZgjy9ncObpQEMBPgZlg0pZPtnbKj7QJUcowMZr8M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzvLYzBYcct3+1WLoCRdCTRH1/F0I7PUspeU7BchPeTH71edRFo
	tGWIDjSXet2fQwNBbxy7ZbW2bfuTvxF5iKZ5iV2996fuHUlt1RPT99kJki1YZq0=
X-Gm-Gg: ASbGncvdqGkvax03KqrZfDbiV5Q/hzqL0evGFRS0A9nBjZcbFqLLUZxTDcS6l+9fM7g
	PRWN2ypMnObxU1dJt6WQlOq59b90JbaIQhUe0w/DR9AMraLc26UM/k4VLR3G++bkKgZCJfh4D3L
	CteMh7yVMUU5ZqDH2l/h1g5LDnxC2h0uX6397FhtAZWdACr51No30qlgL3ReSJ4ody6V8W8R3nD
	hwDODWF6B7q3wdMVgb5wd4Cf63+JprcwowWoZvn7Pj8nK5d86i0bCAd2bnepu4foCm01hdF1ES5
	aLKrHKXLXvtg1wne2H5yaJbt7liEpImkLyaWqDqJOAze+llpOIo=
X-Google-Smtp-Source: AGHT+IH7LpfNKj8aX2Yg/QnFauc8VJEZNqXvYaPiMRWZExQMqNqHNpeTUn8yHI5yDNGhSuzAozUbDQ==
X-Received: by 2002:a05:6000:2408:b0:39a:ca0b:e7c7 with SMTP id ffacd0b85a97d-39efbacdea0mr14910057f8f.36.1745407489715;
        Wed, 23 Apr 2025 04:24:49 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433170sm18245595f8f.25.2025.04.23.04.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:24:49 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	Jindong Yue <jindong.yue@nxp.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] gpio: vf610: Allow building as a module
Date: Wed, 23 Apr 2025 13:24:46 +0200
Message-ID: <174540748240.56202.16807732358191356818.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250416062605.1948856-1-jindong.yue@nxp.com>
References: <20250416062605.1948856-1-jindong.yue@nxp.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 16 Apr 2025 15:26:05 +0900, Jindong Yue wrote:
> Support for building it as a module for use on the Android
> platform, because the Android kernel(GKI) doesn't contain
> board-specific drivers, it requires that these drivers
> be built as a module and loaded into the system.
> 
> 

Applied, thanks!

[1/1] gpio: vf610: Allow building as a module
      https://git.kernel.org/brgl/linux/c/73dc041f8a60279faa1109957891b00d52496425

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
