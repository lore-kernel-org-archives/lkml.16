Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AAC628030F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543128; cv=none; b=smQ++vnoHJ6RXvIk3x/ma0GR2HfSRmcifoxpnc8WtZ2oOCe5emuJhaV697xCoVdp7G3iHB3Ds37kyZEj3h+QmlCKxld/uFyvh3KCZm/C2JobT1HLSIfahNaTmYp8m24tUy70MloNMzC43m1T7X+EpYUxz/P/y8kcF+/LvoGoGTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543128; c=relaxed/simple;
	bh=TpGiRbBcxjc2OzndSGN1iy4fiypoqt2jRna1Uwt5m2I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ps58HL4klsv1XKb4uVyma8TfYDoAGp9pWV+K0meW3BW1JEib97fTfNdN/+l5pkNdKSdWeAoZzt1jwTjOIwWQDUrXgkIlDirojR1j4QbhhuDoBZA5QT4tA5LoQYKPPSaC3WfXrvl2diLU+7L6W09wBh3yaJmVYuQT9GgaKSQ62+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=OckOOz8k; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="OckOOz8k"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-45300c82c1cso8575835e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543125; x=1750147925; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SeifUeLaZ9+rDBV83L5gR4o/Q6NXBGUnPq+RJylNCwc=;
        b=OckOOz8kOlJJ2kqfI3FO/eFyGQyXsS+zTFgZF2xT6bRx8SidNUZ+CacnDH6rpNqr70
         AlaV1rb4XQe1RPjs0cTvbuEdLbf//KabBj+LiU1CQmQP3Fpk+mKh+HJQ2FpcGuHoGTX6
         XT9uTzINxrPw5gAwgbGaWQZ13DAZHuicD3la+fFhbt4+cGYQIAEPasHFn8rjwoLEBQ3w
         yuXV58husioRyf57WUtZ6JayYhio1A3sKip8aXkF/BNOfDDnAa/ovBHZ3gVdcTX1Kpjh
         3lhc+6V+jnN82eWi4a0IAJh3vehsMJyxNpSUTTqKIqCME3eHMP1sOqIDr6feUXFOecmo
         Dd6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543125; x=1750147925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SeifUeLaZ9+rDBV83L5gR4o/Q6NXBGUnPq+RJylNCwc=;
        b=cyy4ykx5wYarRgOQxKco2QWUQntm3UGBO6OyXvRGknnkTl7rRxF8MXvxEbC04zLetX
         gl/enV2yAg3DL5yIuioZH18JWXX4+VERpETmIlfNZBtD5Lacus91iBw9uwRu8jWmHmF5
         yVW/vMRXE4AmF0zY0q8UCVRrERJBCK+PWLks1Co4ubnq03zppXYqsr+6AXGtjAsKVjSG
         kTVvCCw5HJij3s44ibgp/QGinpHLj/6aUgxah2DH0EyrGO+cBUfIN0dc9wYIYocNe4DQ
         yreNUI6JabkIZSwdg9e2O0N8gjmGUKX49Lb34nYf2Cs0XA7XmoL8TdG+CNrp9n0uRbWw
         /Z7A==
X-Forwarded-Encrypted: i=1; AJvYcCWn9LdAhMV3XsB6/8gFQdvfft0ecvhUreMRvQo0USoGP7oC1eaMryXf2ZhQMnkuhcJ9IYU7XHDg+Ao529A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO8nN7iiSGQPvyBBlWjZFawQ8XlryLucmQWBLlKdEFaKFzukZg
	bqyXqTaTyPSMzMVdWw5WZBDV4UN+Ki/+foRVywuGL+5b/ifGStx+AjWkDB7kzGgrLLU=
X-Gm-Gg: ASbGncuAWqqscwU4ZI8itAhDcdrVvGcPhTwy6GZp03p575dtOcFcIns16NJM3a/h3Fa
	GuG2wgVrHqdlLEypJKPwh+T+tx8FTiA+Qp1nBfEtUMn34QgaW2LtJtHthsjCSJ5sHyZwY3LaUuB
	/Vt+Z7r4RgmIHHf9+qWhbmhMzw48Ugx0i68/VVLVsHevhRwZ7pCUQedgeiy3cCfaIpfNkc9+vBn
	TSI2dhjJ95Oi9HFos+WKz6vqZ7Whrl3MjBHwmd6v+mOKIz6UVczX54fApxc05YNRgsnxKrQe1EO
	iYf0vET9d6QIj1KFxAnFEHZ5FaG7nCXiSrosOprY8v5ba3lujgovGr4S0QQh
X-Google-Smtp-Source: AGHT+IHggB/BoGLBoXRRcx++7IOBIp0SzUaakzTtNLar/54OyR1+9jdb+6IAQ4fbUnCfy2rRWhaFBw==
X-Received: by 2002:a05:600c:6205:b0:43d:563:6fef with SMTP id 5b1f17b1804b1-4520140c06dmr135987505e9.21.1749543124657;
        Tue, 10 Jun 2025 01:12:04 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730b9b3esm130838565e9.25.2025.06.10.01.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:12:03 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH v1 0/2] gpio: More cleanups to legacy header
Date: Tue, 10 Jun 2025 10:11:52 +0200
Message-ID: <174954311123.28634.7300380826159592857.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
References: <20250531195801.3632110-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sat, 31 May 2025 22:55:42 +0300, Andy Shevchenko wrote:
> If I'm not missing anything the 'struct gpio' is not used and
> GPIO_DYNAMIC_* constants nowadays are private to gpiolib.c.
> Hence this series.
> 
> Note, this seems already the case for the upcoming v6.16 cycle, hence
> I would like to route these patches as fixes to it to prevent any possible
> use of the mentioned definitions in a new code.
> 
> [...]

Applied, thanks!

[1/2] gpio: Remove unused 'struct gpio' definition
      https://git.kernel.org/brgl/linux/c/9b4d4c952e28f97c5e653c8b9453690f7e63cc5a
[2/2] gpiolib: Move GPIO_DYNAMIC_* constants to its only user
      https://git.kernel.org/brgl/linux/c/6595ea2761df191c2ec500d5f54b57592b969f5c

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
