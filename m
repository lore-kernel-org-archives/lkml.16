Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F05826F444
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 11:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745407495; cv=none; b=WQGT75yRH6C8EXsF/voMz5yCQkInEQ+hhyQL5xIOqQxTW2l5tfamgAx3c9hFV9EH6Gp32rkMH6wBTZ3o2aoMWp2xLRA3L3om9eYPZuC/Eoqx6UukxP3k15WM/EZ9fKwK5cjqOh7WqWtEVqm9IxOl5rAzGAAiMDVBTifkGfukq9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745407495; c=relaxed/simple;
	bh=ncxIYZozl3N3HdWJb2uKeAj2BG7Vhq1ZxeJg726Fiys=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mNL/Ht8et6ELKbIfLpKvzo3SsnG8nVSPlmOzvwOLxOq6t7dhcdPje0rqL9p9gJs6yX6tZGBfpvpki+J2QPX0oZZpugFqZHzhDjHy5ab3zVZ9gQhxzNlvaidMeu5ZbTwqSqeO4JCHpuj7SHa4wnnZIUvR28tQZpwVitb5NFkjcx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=3VMzw4vT; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="3VMzw4vT"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39d83782ef6so606941f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 04:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745407491; x=1746012291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D9xEJcSBKi98pRIDlGVSCbCsSC4vSPyuZ//ZIroNx9Q=;
        b=3VMzw4vTb1QfElPB8HBoN3Y/3jdiJjouJcHe8waRkQ2z4ErJLFBlppi3juYedILygk
         7TMVcuAF5OFWSqZtCRrkt97Miux9qOzmBp+ksiYKOvgmjYMUE01zpoMDaC70qMO3qutn
         4KTKyO47x6e0XnGkC/w4zug/Gl02QhX+TJeaeV2fWJ4p6LDQR7KyzFDBxsI2h6KnIFAp
         WShU7akfhtEyXKB63mRYun1ytiBAyRUwx8uz7OgyYUdiP4ZbvW9Y4K0RHi+9Za71setX
         evumo/AlEDPd2fob8bfRUu5q+y/6kYCRuSlY+t366ftoDq4Yg9a3CW2z3gZYBZIJRv7+
         cXGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745407491; x=1746012291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D9xEJcSBKi98pRIDlGVSCbCsSC4vSPyuZ//ZIroNx9Q=;
        b=dQl0o+oqP4sgn/2qK8eQqZgFkT0W0+PRjfXd3u2U/D+J8AX+Cp40likAdyDy4ggrMW
         ZKE9YF3if1TqN1MHqLDAzENWkbrvAEvzsxbdIdzLxLE56+BSmGRV+CHFM5nzeNmTByQg
         2Mwwji1kW6aGSJnljkZ3/H45Q8v64VHSiS3zjyH+8i6rWaNQ6/2ih/Ev4r0+KufwWTZt
         jaxsdw/u8ScS3S6UzNh1eJfmjKQUSHg/Fn+LCWH9deuVQPnxhAlRXG4ZYDkdIn+NPkJ/
         lFLfvhnsKmLdVQ23z8LJZBrRz2rjEx1HfDEdqFsyFj0ez/aQJ/YmJx0tcKC78tA7m3fB
         5ykA==
X-Forwarded-Encrypted: i=1; AJvYcCXUYShCgSRAJHI+yQIgHtwPu0UH+Hcy3duwvqdRfLo4Q2TtOKF4j55hWvbzLzBGVy3H5Sa/eaQL/REKN9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzhGhRfkYKqkc7MeNsTognq0zp8Oyc7kXEXtEDspaxym+hT4Agz
	tpt+4SGaNN/XZkD7sulAjLdjxVX6dfs7cEZjy1XoLSTB23szHSkdBhbyD/1AM5o=
X-Gm-Gg: ASbGncvYEGDcgPGaAmgDkg1p6nDFwys0KYVx2mMB2n5oNcOLGpfESZXMgVmXHJZ01Q2
	2elcGlXCHMQCkI6J5dHiEU8Tct3tIKUp1Dp7ZhpfjZCjnFBx2IXz3AQgUP6OwUPhq8WqHGcKMf8
	ulqrA2LvAHRLSs0ulBGnJz+UKZH8uF5pkrIhmZx6+psVmadGmc6SkJyPMwRbavSk/Aq71YcnBJ1
	hK6EixGrzaMzR0LzkkWvlGf/5V/Cka6IWIUt38JaylD6EHy/48DZ58oxW0qytUI1mdLDJxCE9yV
	/jZKwGQ7tQx70un8mwItamq9hmcSLCP7jYKhwu2G
X-Google-Smtp-Source: AGHT+IE/8aBMTgDMeNGhw38uYxbthi7915ysYEty/98iC2vU3Ts+4+07GiW/1NU/mZprn7jV6XzjaQ==
X-Received: by 2002:a5d:59a8:0:b0:39c:1401:679e with SMTP id ffacd0b85a97d-3a067222757mr1949294f8f.5.1745407491320;
        Wed, 23 Apr 2025 04:24:51 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:74b0:71bd:6dda:dcc1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433170sm18245595f8f.25.2025.04.23.04.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 04:24:50 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Patrick Williams <patrick@stwcx.xyz>,
	Potin Lai <potin.lai.pt@gmail.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmo Chou <cosmo.chou@quantatw.com>,
	Potin Lai <potin.lai@quantatw.com>
Subject: Re: [PATCH v3] gpio: pca953x: Add support for level-triggered interrupts
Date: Wed, 23 Apr 2025 13:24:47 +0200
Message-ID: <174540748241.56202.13322099226080640371.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250409-gpio-pca953x-level-triggered-irq-v3-1-7f184d814934@gmail.com>
References: <20250409-gpio-pca953x-level-triggered-irq-v3-1-7f184d814934@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Wed, 09 Apr 2025 23:37:30 +0800, Potin Lai wrote:
> Adds support for level-triggered interrupts in the PCA953x GPIO
> expander driver. Previously, the driver only supported edge-triggered
> interrupts, which could lead to missed events in scenarios where an
> interrupt condition persists until it is explicitly cleared.
> 
> By enabling level-triggered interrupts, the driver can now detect and
> respond to sustained interrupt conditions more reliably.
> 
> [...]

Applied, thanks!

[1/1] gpio: pca953x: Add support for level-triggered interrupts
      https://git.kernel.org/brgl/linux/c/417b0f8d08f878615de9481c6e8827fbc8b57ed2

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
