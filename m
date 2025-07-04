Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B825E2857EA
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751617547; cv=none; b=ibBNe7vhQFMyjUMPc/+EwZifAKU11MblaY+RF7Cyz7MzIKDCmPRn8Py2xyDCYVGoolI0OpV3oU4T+waBB72S/0gSj/uwqhCrESuz6XyrRHuQ/ISV6vApG/bDSSOINsVK+hjTZLbWH5HddJCbfrMt5926l4tI1AHVHSCPHUpYeqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751617547; c=relaxed/simple;
	bh=NOtmTRweHr/OUU+oCOxztbTezR/mlwj8/rnE7T2PLzE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=IuK4D4wm+1UHqW4mIc7fUNw9za5CroMDTzr55DIYbclc6oK93RwLY7UdKrBAoG+U7eDOmPXh5Q6PBs9AzR2tJsBe8GqAp8wKT/U3cHVsHrD6PBWLEFCUzZ/rhY3AanNtTT/6PA9V/U834QwV/Cd3JGF7of/Sde0kRBDgcIUjytQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=gcsUC30v; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="gcsUC30v"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a46eso334399f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751617544; x=1752222344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a8us8p5iwoDYH0rHeULcbB5Hku+K4FAtuFOBzDYvYfA=;
        b=gcsUC30vxAvNwqTf5SGFshWQpQuKe9w3FkorevsuY3luPF3gQrrNnpHVwodhSFc5aP
         5Y+uevAub5UP8Q11A2bXDsp3y51Cfij/qsvilcuyo9c5px8BqiAbed3xoOgQZEqF88Xy
         RcIssBq/YAEMOMsJwuo56lwuyqOY3dnblfd3amO2gF/U8vJtteT3Gj3Msm7BtL0WWBjn
         szhlp7yDJqYoNrDIOcowrXDAMfpFhsdRiRmKFsjiYzZ1KaeCUgmUzhMJ+M0Dv8+Ihqz2
         5zWeCuzPJysPHT8rCskQwtXmdXZZGgz+xuKV6IvZm6XHE/c9DMtK2dbw1TRsU2Z39IVK
         9YyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751617544; x=1752222344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=a8us8p5iwoDYH0rHeULcbB5Hku+K4FAtuFOBzDYvYfA=;
        b=T8q8xC3iLjdp9yfwG078Kjri6EO536H+rcv4ZZvGs837yJfGNM6nvK1xLsyftyTjNv
         NA/GLxRslDal+VLdFGgqihBTf3v2/wpmX9AUg9gt3GAQiSfnB0nePjbFd+yEUNsnnTC5
         467fHW3qigqIi2jhOdTVAbrNTbLal3ptSDj+8WDHroU0jPSw/M4W5en8/DGX3r4duPET
         AMAtQyxQEChVdh06tam7IqWuSr2VnfqB+Cc/KKPpKtp0LkaZU+8Gg6DA9APPRwqBTXlF
         H1N0JfLTnrr8GbknYUNsaQkV0UYeMtFqq+n17cM2L9QjC/39qatrUb9+D3lBDm4LnsFC
         QXnw==
X-Forwarded-Encrypted: i=1; AJvYcCW+b85ONJmSV4+FazQWkzAMNNZHtvdpOAAfniE7+IVG53CRZBkWtM4vz8GFhAp5jAmAgl2/6xdkmUCs7wM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyEKbeehfWN8XVsmSvhuZtDFZqz/FbI7WdZUPMgsxNRumOwXGmc
	1/T0LRDl4/XLHG+MLRqDuZsW8/bbRFNSkwlDkGyEM45DAtlQP8rGvNXsPQ3ox6l1WoI=
X-Gm-Gg: ASbGnctDG+WcuGnV9f3pGAqlyXiWklg3sUKAr9ayPGWIUB6xMKyn219UrdM5/173Y/g
	5iKC7AnLvwC2b9g2oiACWBZUu9s3LJwNezBLEvyT2tI2NrVTvuiPH0RZp2PJlMEwwwQ9olvbHIQ
	n1Dn9tG4jAa18PJkHflyDXJbwTJ78s+th8VPWq9oyUjAAZJw5iSO7dN3ywIDCHNRUhm8paRcKG7
	cYhX7m/I4IMRWpiXgUTY1w+VDSW9u5KO8WImX8OlccmoOcWri+KpMA4RuBEcRcz7cxUZxdfxlYK
	eVFvIRJShFmaHx954I7RH0oCcYI9yL8Xiol1crp0YKELiBs56I7s0wb1wfQMDA==
X-Google-Smtp-Source: AGHT+IHB9CgbH7y2/B6BgqylZ4+/SczX8o22ciAlNeGXLSBGAnyxtC4oX9EXigeL9M8BG6a4AbcVWQ==
X-Received: by 2002:a05:6000:4208:b0:3a5:2ec5:35ba with SMTP id ffacd0b85a97d-3b4964f1c9cmr1110317f8f.30.1751617543920;
        Fri, 04 Jul 2025 01:25:43 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:876:27c7:55ac:40ab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b4708d0af7sm1922605f8f.35.2025.07.04.01.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:25:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Hugo Villeneuve <hugo@hugovil.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	stable@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpiolib: fix efficiency regression when using gpio_chip_get_multiple()
Date: Fri,  4 Jul 2025 10:25:41 +0200
Message-ID: <175161750676.14835.4100205816792446809.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703191829.2952986-1-hugo@hugovil.com>
References: <20250703191829.2952986-1-hugo@hugovil.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 03 Jul 2025 15:18:29 -0400, Hugo Villeneuve wrote:
> commit 74abd086d2ee ("gpiolib: sanitize the return value of
> gpio_chip::get_multiple()") altered the value returned by
> gc->get_multiple() in case it is positive (> 0), but failed to
> return for other cases (<= 0).
> 
> This may result in the "if (gc->get)" block being executed and thus
> negates the performance gain that is normally obtained by using
> gc->get_multiple().
> 
> [...]

Applied, thanks!

[1/1] gpiolib: fix efficiency regression when using gpio_chip_get_multiple()
      https://git.kernel.org/brgl/linux/c/30e0fd3c0273dc106320081793793a424f1f1950

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
