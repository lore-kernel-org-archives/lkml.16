Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0303A44C77
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 20:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744662625; cv=none; b=u/v+yo5sPFrs605v7+PYQVxV5s0CwR0u9uo1JiKVRtun4hgQkIffO64aX445NtxmvCdM7grCeL9gu00rAbxKxb3BWlm/BRZo7SkCiz2Q7ebsZYhNe6r1DFqtBn0BOdA1xN0vWPzPQMImt5Bp8DP7B4D13CsBhgVuUo+OZRFEycA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744662625; c=relaxed/simple;
	bh=kcpXaZHBO/DH75qNWenAtc1oMgVDZhFC8WpCuySDPwI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kS5Hl0oJcgc4qcmS1MotOdTXhSX65DJMCL6vOKA/+i//rxDrwTk2ce563ElKxNVV7NyE1vNjDc0HDeGrJr/vgDrDRzfx+lvXflsv2M3EKwAQPC/BmSftUn0U3TJEeTjhJB6xd+AunAy55gXFA1tPepJ7ClCXyhqkBS2zeKBOmCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=xGMgyMB/; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="xGMgyMB/"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so39127215e9.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 13:30:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744662622; x=1745267422; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h/tvYAr482dMhW0r4PAzZsFCs7NAvJS6DBb+Huw3i8w=;
        b=xGMgyMB/4bEvu0Jtx3cXts+vRiovsUmN3BTLMDJ932uh3tbGTBxR8p2NG4x4izHDnO
         wKx+MPhIQ0NDBfAAyu5/Z8AxVm7n61VfoAmF44O5AXCKWQAIrLUMwJAExG9ASjg9gyCo
         Ns9dKkQASMESuRmmoxtE3mbvwHJ1iMpQvUV1DtXu/AB17x6NO2RzB89TnSDqUXaHRuZt
         fHUr8AucIGcjdjofHVrTYo63QgbNGuaGgGaLnKJZZLtRUuIAfcXiTpoxOAIIewEY7l+A
         sP8gqXssj8L88nOdRWEKwg7NHypwbvYqUb6+G7wjSg/2l8sQ4gcoFNSH4NsLpiKCzpZh
         qzTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744662622; x=1745267422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h/tvYAr482dMhW0r4PAzZsFCs7NAvJS6DBb+Huw3i8w=;
        b=Iks9/imaANHf9ArXiwrRrh/082yji89ZAXQmbSY9HFj6BMxA+Qr0IKDIFOJOijqHJb
         N1rSBEh7646poxaianj/Kqpwm2AhwJ5Ltmi1aYA4Cy4jIigdz8aepX5NXqqVzm401ETI
         ShFUxlc769e8A6dskscj21RtHyyErSQQ1dCKpFY9sJaXmKHFdo2xEfcR/jtecvZuuodP
         o02Q7ZiK6rgsZDdc8x4WUwQup7Vk0ilWl6ehB1/RzW/zzDPr3rqeeKw1MQ8GRvthgSLX
         1EXXlLjedrfFMZumPlxlY+nK5j3Q7u7vaXLxkYUIGFpSjLqaLPdfT6/10tHIAoXgzS99
         xHhg==
X-Forwarded-Encrypted: i=1; AJvYcCX6U3xzvDUbOHMUeJqaz4ASc2UlXs18PUN/OISja1TMO6ylZDQ8BauGKiqp5tvHASUMjkc7W8oHwGoXv3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YznkWHt5jV9KMDtCKrxIROui+poNlyK+7d93mGJ1ZQzV+MdcyGq
	0JZ2T8RDmjkZu7JtonI/C3nRsEW5xH9kEQtHRCD3r80J82y75jC9YloNG7GF7PK4uY82E+bWVM4
	Jik4=
X-Gm-Gg: ASbGncswY/YUnGm2Med8svcMq5kFMLUYVCD4nxQDANKZJAJuZHKi/7yMA/p8kCQEjZv
	3QffysMhhu2gDV3EzNty8MzghEJXjU9PXGHWC5CHpO+bvJKkDzGIpby5fUSa57dlJXLvSKaVJz9
	JSXtqgULMKwRWy9vZgfKoMzmFyyH7EvhpnwPbH9ewEqO2O4z9wp2Stbv3mCoiNZbe0mNqQgOSDU
	Nwa45javF8QrQoHhIFz/3sg9g24bNfXz5UXYoBUJg6YdwTXjvrup5998QVukBL2AZ/5HHJPre45
	bDSQ36rB2kJIbQSL5DGx/+Xa+vp873M0x+Wl
X-Google-Smtp-Source: AGHT+IG+igl0QfPnghXbFE3JAeWIIJz7aro/zmK8/VTRG+4DBeiUV6KX+a7AKu3pXrc8+pLTDeT2JQ==
X-Received: by 2002:a05:600c:4fc1:b0:43d:47b7:b32d with SMTP id 5b1f17b1804b1-43f3a9afc1emr98985365e9.25.1744662622150;
        Mon, 14 Apr 2025 13:30:22 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:5368:1715:4c6b:8be6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae978023sm12001396f8f.47.2025.04.14.13.30.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 13:30:21 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Koichiro Den <koichiro.den@canonical.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	geert+renesas@glider.be,
	linus.walleij@linaro.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation
Date: Mon, 14 Apr 2025 22:30:20 +0200
Message-ID: <174466261151.5278.12313728766071795892.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412150119.1461023-1-koichiro.den@canonical.com>
References: <20250412150119.1461023-1-koichiro.den@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sun, 13 Apr 2025 00:01:19 +0900, Koichiro Den wrote:
> The kernel doc for gpio-aggregator configfs interface, which was recently
> added, states that users should not be able to create an aggregator with a
> name prefixed by "_sysfs" via configfs. However, it was found that this
> guard does not function as expected (thanks to Dan Carpenter for
> identifying and fixing the issue).
> 
> Add a test case to verify the guard.
> 
> [...]

Applied, thanks!

[1/1] selftests: gpio: gpio-aggregator: add a test case for _sysfs prefix reservation
      https://git.kernel.org/brgl/linux/c/290ffcfe3042dcd5b701a98edd48d7962d35556b

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
