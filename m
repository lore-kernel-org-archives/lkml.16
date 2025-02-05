Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A99D12EBEA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:40:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762805; cv=none; b=Q6Io92R8J8Cjy/lQ42wPApaMUR5FPU/4lnvWG+I8OPsf7+FA697P9kG2br1Evvb8qILf0Yq8xwNXe56nMIVU6XVJs1Abuh7aOA/8dpHNN4yzq6CfbhF8xXAgVDVApJsuENpMEa+wvFqge+BItZLm+IJexq/boXDyjVVEUoLgrio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762805; c=relaxed/simple;
	bh=to0rndXbutpCdbidwW+dqd9uyYlNfoEbmkQvSdSVRow=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dX9KWpIm8bl4EHRirmXfoPi/tmPdKnzIdkwE+oiShCOoijMl3UzNW2Iul7Vxjeoix85lygQ8Nl8JDCkiDb9RCbHcEvXGm7vd2QHTiJnFuC81zKxqBP1vdluVcdkov8Moq4Cxy1gTaaR3ItrFr3nKGn+gLF3tkGOy7p3zXabmFFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=0kEnSMJ2; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="0kEnSMJ2"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43621d27adeso46769435e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1738762802; x=1739367602; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0jiGn42kvvsu9ocdoHUA3wGODMdKmSTejfdkpV2G8qU=;
        b=0kEnSMJ2JO66/e13CHlOrYuYu1BhaVtKYh5bJbuJDWZ1slzOAeYNj+cgNKyM40a2Dm
         YdPXX3C6lyu99rReB8abYCBWhPkqvrJz/5FriaQz6ItkI8YKdLzroO8Jgiwkosehf6Sd
         +Ki9a4UZugLjgOFwUhYakE7RpBrJYF9dv7xcNDrOlhDWEEesE1NDdQJ3p5Q3hGWW+OKZ
         xbIlUugV3UBnEfco+BSZ7xML/yCPLC5WR8xwTca/9JuwTe0lEOUaKzkPE0gg3ysyBdO8
         JdLKJuwIQoSxrVOr0pEFACRS7pUPbdPpRCu5Kf+rkqYyTgLws1TCt9KezsI1+fQMgwha
         Xrsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762802; x=1739367602;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0jiGn42kvvsu9ocdoHUA3wGODMdKmSTejfdkpV2G8qU=;
        b=TNfrtRVmScZy6Pa7WRqdYu9OlBI76trqMoXiDWcY7MzCqR7ELKLeAYOFkIRaEtd6Vk
         wwRjCAVLF48DAefDrFTJHCtjcnNkj4uifKYU1CtVPyk2YNXybfFT+yGZSvUMoMAcdYfU
         sfG1suC0Nk12yNS/X5X9y1NffUqiXiO4eusMCVqDTFdstEOCR9MzEEhSx6AEcSCVwEWc
         61rby8EP+v7+5CSj4yM9hbdW2f9r0orPRB+tC1qCOvDYyjD1ijvYkKXLc2hGHeQDANot
         Ju1QcYQTNjga3pL+3iTD+M7bFSZ4wAorMztW7MVrtSpg7LFfjvD2QzCxO0Tjsz5tZ3YZ
         8hMQ==
X-Forwarded-Encrypted: i=1; AJvYcCUHt+EvqbtEnSzhubjOQr6cAQcUme0iw1CwPGWpdUDAMPcdZnbaAjpAv8XWr8sGYXNW6dZ2C3ISthfjWdU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyxHft0RkU44Jk/ST0GGV9aW+xPW9l5vl1T0kzFpe0BrGDk1qy
	Vy2+MnZyUsUhEuL88OC0DY5RrEdUJ7uoJVSfL89BZxtb6hNFHsFw14R/Jj6z5+s=
X-Gm-Gg: ASbGncsfRWsWzqTn4k81m37+MmMcB3/ebNXYcIjaITdyw8vUnQb82c1G3jGEgTznCVG
	EphdKGEjNwSnlWk/wZczOgFx4Eckd4PxW8NYTwB6WKmLQm/qeG6KsVKKJRjTo+UJgFwhSu+IfFV
	JwXGjKSYQmDldY+QmhGCRQJxs009ZTSfmrdcy949TuCj/7fzIafTSDIydZM73PmzvQ+tosR02/H
	T1jajuxhZFonOeaH3jcrbxGG4FA773vqb07I1578ZlEqJ4UrCLYQIFDvD8oxyPuFJobm4R8ZAlz
	10c8IxPiD390vGg=
X-Google-Smtp-Source: AGHT+IEo9hIviDYhb31r2hIrMu00KPJNKRFNZRRwmU6V/iBqIa6axOmyAKUSv1JNDBSNjuzq7Fi29g==
X-Received: by 2002:a05:600c:3b9a:b0:434:feb1:adae with SMTP id 5b1f17b1804b1-4390d42cf2bmr22533925e9.3.1738762801531;
        Wed, 05 Feb 2025 05:40:01 -0800 (PST)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:3239:b668:f15e:fed8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d93369fsm21974185e9.3.2025.02.05.05.40.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:40:01 -0800 (PST)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andreas Larsson <andreas@gaisler.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 resend] gpio: GPIO_GRGPIO should depend on OF
Date: Wed,  5 Feb 2025 14:39:57 +0100
Message-ID: <173876277707.18360.8561413925372301898.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <db6da3d11bf850d89f199e5c740d8f133e38078d.1738760539.git.geert+renesas@glider.be>
References: <db6da3d11bf850d89f199e5c740d8f133e38078d.1738760539.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 05 Feb 2025 14:05:03 +0100, Geert Uytterhoeven wrote:
> While the Aeroflex Gaisler GRGPIO driver has no build-time dependency on
> gpiolib-of, it supports only DT-based configuration, and is used only on
> DT systems.  Hence add a dependency on OF, to prevent asking the user
> about this driver when configuring a kernel without DT support.
> 
> 

Applied, thanks!

[1/1] gpio: GPIO_GRGPIO should depend on OF
      commit: 5393f40a640b8c4f716bf87e7b0d4328bf1f22b2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
