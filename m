Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 375631DE3BA
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 06:59:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751266752; cv=none; b=Jf6MCxTlui9MLtdFu0CAYX/ggziJFpTB1lt+WVb35xqatfhk4RjpkXW9qVri+kzSr0RiSf5oKgazbm9PYA8WDXkz8IPwCB9J0uxo+QHiC+/++rd4DJBOfCRhaqaefWIFdciJgK1Bb0+OT2VBllJ+m9SaT3hXWEZZnQJ3MncTPVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751266752; c=relaxed/simple;
	bh=N8NcPPJxadXWse0HT/QBGjpeBDejSpL4abXtBlKXbck=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QtBfIQXVrE6y++y2UEWUbAt2y6YcUKdBXo7uBuvRvOx4xuL9eEL3hGj95ZAR2UH2qSnJyfjql8kTgER8SWnJSeUByx9SMYZRy+QzRyG1SAMIPSNWEUIpJAmBXgoviIidSp9YewUAQ0YuKW0K3ZWv3lQKWQiv1F2LD2t2cXm+CMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xe9xc3Hl; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xe9xc3Hl"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-45348bff79fso17584095e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 23:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751266749; x=1751871549; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rVc+xIvEP7q6mVJvo+SAFYvuaUIIBVDDa8cApMBL5oc=;
        b=xe9xc3HlPX8LXegkX0gjRzPIbtIryZyHqpA6AkhiH9JoKyElnk2aHozSII7rR97PP7
         Z66bhK7Z0gCcsProyh8BE3SZ1y3NI52XP/Md2FajcBcQywk858GIEQwuqM7U0kah5Kru
         N2a/ww2Nqsq6+ymbl4AITOQpi7ZwYSLPS7rAclMKAjd7Mz883MH+5+x5G3qxwSirH5g4
         FVXmkYw6pA9M4A23vjgbfClM5oR/p87EBsk6W9vDpz41TxMwcr6GHm5YH93Z6NK43utF
         x3PdsuFV5ZqMq7YVilgjbkL8Qba5W4lliaRWSOJdjtd9fcYRaXXJfFFe7fJSWAXjHCpS
         HHvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751266749; x=1751871549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rVc+xIvEP7q6mVJvo+SAFYvuaUIIBVDDa8cApMBL5oc=;
        b=nms+WTQARTpbg5iF0TayAAvfpjQL/pOEg0dX6tH3MJzpjTLsIjKLyMFiCMPJKWM+UD
         8fxByFInyKUMMeeCCX8nz+hpycpL1v9Vd3Iqg6TANTk2NsMZeXM66BTQciWsrhXDzizS
         68wqQePy+2X/ILd08ftV3mYPfY1w7xC3++20tzaTWonJQqgArR2YsCryZTUk8fE3378D
         xUGdzPo1w9kIUjpwz6ndjNzS3rlLnq2tMECyrjC+sVfhfKDZanQD3LTY8+cJRyCL6oaq
         LPcvsc3e6so9nTtI8hKGxFODUgj+mzXtBtuWFyaWjJC5jYeSEkCg9l4GqO+dQDjOHdK2
         JskA==
X-Forwarded-Encrypted: i=1; AJvYcCVq9YzD2x/UfIPL95lX4V6uc1DqeedRZvA6I9k7xGf4FvMtbyUiQGtA5XpJy9h5oCkZnHwvxUNkJCDluLw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7fya50lUwv6Y/L9b/wFAucN+sb8/jiZCw9YEWKjGygLkI3JvJ
	y7JZ3kvUu8iZj0705S4FQ8GohchDHVK/fj6frOAkRFeSU4S3v67PqyzdDylngheAXRU=
X-Gm-Gg: ASbGnctCQdQ4gFMVlK8pcpN3Z23YcirrQvD1USlwb90B1fUnNiX4g2FnFHfyThxnr5z
	itsPPq9Cbnl+eVJ4r6b6DkiZIqWs6jgjEZ2W+Jh+Y1Ma+S7nDHBrLVe/zxzHQs8u5NwODPTJjrW
	u9mceDQFxf7JLaYehbCSctRPjBMHrNJ0LjzXdBOBuEawYrU4klyPMtGPLx0e0R8mISJ6MsZe9ha
	RgLWdIWZU0T7w/UK5ZLegJOftI9vdPMRsNrJ9WUsP9vDSmFVzejMlnyxSxjoWNfd/26RtQcSW6o
	VtvAwhs+fb2VecQLTG/efB4fj77yJoG4ezjmt7agDuW+hQSn2WB0zzvb31UtSSc=
X-Google-Smtp-Source: AGHT+IEnf1e311CHx7pGdkMuMp3hPcgdVROv8BNvfkAw7T5EXn7m4sv+gadF6ts7WpBEDZmQ9c71rw==
X-Received: by 2002:a05:6000:2d08:b0:3a4:ec23:dba5 with SMTP id ffacd0b85a97d-3a8f435e55dmr7677203f8f.5.1751266749380;
        Sun, 29 Jun 2025 23:59:09 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:19e3:6e9c:f7cd:ff6a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e7481sm9686783f8f.14.2025.06.29.23.59.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Jun 2025 23:59:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: Re: [PATCH 0/2] gpio: improve gpiod_is_equal()
Date: Mon, 30 Jun 2025 08:58:43 +0200
Message-ID: <175126671926.7549.9629868942672241575.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
References: <20250620-gpiod-is-equal-improv-v1-0-a75060505d2c@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Fri, 20 Jun 2025 14:58:00 +0200, Bartosz Golaszewski wrote:
> This short series contains small improvements to the gpiod_is_equal()
> GPIO descriptor comparator added last cycle.
> 
> 

Applied, thanks!

[1/2] gpio: constify arguments of gpiod_is_equal()
      https://git.kernel.org/brgl/linux/c/08ad63bbd681ae4eeb50644564435035c38e5795
[2/2] gpio: make gpiod_is_equal() arguments stricter
      https://git.kernel.org/brgl/linux/c/26981e8906bb5c902e2d34874f64ecfa975d28c8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
