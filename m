Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC08D1EDA23
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 15:01:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747321300; cv=none; b=RTwfBRMAlzWftPw+MgvcbHwEUdYcFM55RSvBiXaYBhhEIiychSZqeUbRkZ5wmrVpUIAEaBXIz+DEuNmGSDGDGqPlbTCjN+5yARdsjGGQK+2MDiH461FNNUJbqczdMJMcbC60L191dM29zy6+vxeVIZ5dnbNgmnlK67WzQQm38qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747321300; c=relaxed/simple;
	bh=0bpgmELm9pb0sTqZLHy84T/BAyd8bl3vq21w2L/4rbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r2nrLutfZaJyknRlgD4r0hX6ukLiDkpPiH3pv4QQctr9r9MbOWGVwW38Dmg7BnriPtGBDHEUWn4qqzjq58DIHxqVSpb2n5nbaerNwoR9MWgumV5mkLVBUmRyqGJsxX/N41uOMpi0Ptpsma6pFV8mCl4YZtpJiMgh/dCg1jW/URk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=RbKW1qQ+; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="RbKW1qQ+"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1fb17a9beso599782f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1747321296; x=1747926096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=;
        b=RbKW1qQ+wXt5d6fGV19WSyFsSdtGy1xU2SR7jN8WdHqmQvuI+5HKHJM5pE4gDH5MCQ
         qZl69AWj+lzhciGLw8V+Lah84JQUvPmGYbQCehrC4SHxnvP5VG2cq7d3lrIxYqEcQH3R
         bwNXHxYfuHD6Sh7kPaWF8UzkFm+bUs0ThAZhrE3Ttgk/En7jpiO1jYCQveAhMjUZhRgl
         s1iQjl1qfPgDxFqaavEy7TZieg8GSixaqlaIoOB9838IcdBcVCzriYuf0We/0wvKA1v8
         L9W77xtW2zZwT7FlB6p8XV+lVZPgruXLlPiSAsBURbs8hY32tSI8Xv6ooWYs+jcQuAta
         f/UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747321296; x=1747926096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R+ExZLPgDVqN/4FPN7RMRww8CSWWl502tOiZJcg9SzU=;
        b=WHwqfUyF0Mm2rbDHFimTWuAYZzAjqt0TyybeDsmHGNbYg40pBIOpQKoe+z6z7d+1s5
         6dGgvrvcyuX61A9bKPfLP/zqvMv2UyrmefK37sC3JBpCqGBozuR0vrZwmJS6gZh2VZD6
         sSop/LRS8q2KKgQbYv13VV6JISxd7ase5KD05dBNMn2/rncHSqwH64seuA0jaSMcQQcB
         3ALFNgc6UrBKrvw3RsJAFRJAvDhRbWWpoQ2hEr1nZFSnzkbusttLR2fVR68GMkwvLKbL
         awuESSOwp7eO8NszwAPIBT9o+Ma5s1zqSCfWQOm9ZnedTIKKsJSz8W9Kmd/IqCWkE+dT
         JeqA==
X-Forwarded-Encrypted: i=1; AJvYcCUayIu25syaF7vrT40aO2X6/2SmddvJre5+kwsjgpRuc02ACdEn0lw7P3YyvN1BoU7QJzarDmKGSsX6gmE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxqyZDEBqMpZzpmheLjk/KVxz2JnEMSvtKx6LieXDGGsfuyFCz
	pQCk/ILqS5M96ZnTE0kbPsZPY9GRgUCRHxQ02ElU7PB7NH1azgnABgElTSt6xehO+Xs=
X-Gm-Gg: ASbGncvENwNZVjjTedlPDEnLDv8vFjk5g3KrbwAvPirYD6LXBAfseV5WgCAo39g1idB
	KmgOjLOcZifCa2NiZ1QON9hrvko97sovZU2BjwrYVrw1SZvzxdmKW2NqSRC2JdD57loSwhHj/FA
	YhD8GsEqN9V/eUE1u5oOSaFOkJa8Em8Di7tbYaZcVANZTuXb22StoS29g4epf1mNo3574XKYnv1
	cN1KKCQLpt/YFm+yYMihtgOZ0+FoQY/fulX55pH4+SnklQFTQ0c5Zt229jhsKBxTcsC3MQ0/Elt
	4c5istF+qogCXz9w7CiSmYktKlj6iNaoeeTaPuCcOYkTw+5hSe+kfklRsDP87E0HFMu/KFdroIl
	4GdVa/BwAK5mHhnHgkwjeLgIO
X-Google-Smtp-Source: AGHT+IEaP32P+mtGWKd+DTEdhUkGNIOD6/Ha+Kt5yoVGB1vbS+3gB2gBhfdgIpL/XkzyzcsRFJdbcA==
X-Received: by 2002:a05:6000:188d:b0:3a3:5c7c:1889 with SMTP id ffacd0b85a97d-3a35c84fc73mr60948f8f.52.1747321294274;
        Thu, 15 May 2025 08:01:34 -0700 (PDT)
Received: from brgl-uxlite.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57dde01sm23388046f8f.15.2025.05.15.08.01.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 08:01:33 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@tuxon.dev>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	linux-gpio@vger.kernel.org,
	kernel@pengutronix.de,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH 0/2] gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
Date: Thu, 15 May 2025 17:01:28 +0200
Message-ID: <174732127891.17102.13995153594267301956.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
References: <20250507-gpio-chip-base-readback-v1-0-ade56e38480b@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 07 May 2025 19:28:00 +0200, Ahmad Fatoum wrote:
> Bartosz requested that I add this to the TODO, so here goes.
> While at it, I also added a FIXME into the driver.
> 
> I'll be away most of the month, so feel free to squash changes as
> appropriate.
> 

Applied, thanks!

[1/2] gpio: TODO: add item about GPIO drivers reading struct gpio_chip::base
      https://git.kernel.org/brgl/linux/c/833c086f22ecebe576af42051733796d1690dd71

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
