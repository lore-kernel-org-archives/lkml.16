Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B0451DBB2E
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:00:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744574423; cv=none; b=Eely07KeQf1XqmygVORM/p8kmiB49DrRZaQnQDn4QM/gm3VQGkmMaiUdXEFmSrhGKE/uk33Jme9zLwe1f5AqhsvlN6cv25U86E5LWwl+slUnVZgCfiUeuRZvQ8BezKWg752yrDAsFwRG1b27U32AWxJHn6auTgUVrgP2ajaj4Ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744574423; c=relaxed/simple;
	bh=TtZ14UJApXMRPvr4GnfMfduGzgNBfwCVMzqr/TJZeSY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qpxxmTI2zFQCVtKDoYhMf2LDf6xDyjnf6gHf4w1AtU3xZwis6EogXeeXMog/XHk9sXdMeevDZhh47t42pEJnNMiAIiq9BkOdARlKLLK4NW+K/gVx/Dqn6Sqb4lGQWF7fpEmYVHpHRnLPQiYjpYP9V5lSGYmdl7tZBHowQKu5de8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=UFdTl2AN; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="UFdTl2AN"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so39289525e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744574419; x=1745179219; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=;
        b=UFdTl2ANrR3WHnhTzgrvrQP/XrROa44vFvQAii72eGJvLaf4Py6LCKuc4iniE9dMta
         GZisRtevt5Uwlze3PhXz0YFKKE8nbVL3IX82/Jd51x1uPrLtB9E/+mzzwzV89LQtmNYo
         y8wEVo7P4fH2FQCMPFEVI/NuM8F3CnM5F2hr11UeIbqjJJ2wKwYrwB1a5ckhg0DwuHWl
         AQKZ0DYdfxZrtIin+xVAMtQXf6mWEaPwe3nQVARf5iTZ1HB/44GcX5B4brdDJHSi451D
         9HaKOkmSOMgzRw1xHB+RNBlMNDIWpEAOx8YA2qyS+jXeSS2fv5J8pdy4c4IuX3lr/HCk
         fv+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744574419; x=1745179219;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Yy/848/baLEzkw8qa5zoxS7nq5QkNFAJau0dpZhAiE=;
        b=RyLewKnp52nxGwnEx+6rlQNWnQZa1Asveh6qMldbvK/xfOvPbB6nisRuzKvctLV29S
         n0ftzXeprEcO12UxKtQ4gmDNGjIYH/6lpX1L7PSCDQ/W/dmgt9voBlt4PHZDYNuRwhGF
         7by7TMepnqXXPiXSi1SRMB/DzgDNVJUd8tKfUOWz3TUxJggYIYlPo3PXVjxf7ITuGpM8
         aKhU9eVRYvmT7XjE42emU0/yKSTz8olC04PZZU0jlunMbedOm9cX/p2zQnOIKe9FiKcx
         XSjbvats7LHZGKF8tz+yOhN/2CD3yPXsOzc/C6JAkrwooHyML+UoluUgySN/dGgQ4Qz/
         ceXQ==
X-Forwarded-Encrypted: i=1; AJvYcCVWUB0ts2KgF2nRGklk1cO6tJHA0AW3SoJcYIaL9iFNWkWCgdSi9WpFE423ue7iPisCXn8/jBGxIV9EfVw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy1N83/mdPE2qqO3ikqX1vsLAJVDJrWckdBjiqA8q511w5cwee
	hXgfP6YspQHt61nfqAutgPrFTj2k379xRI5z/iwHw6MPp8j/fj0s6YNSJkrI63w=
X-Gm-Gg: ASbGnct9LSouU4vxAlj1Q+hC2WOS2LCRBHrVTj7l7Z1PaVjN42C02cFt8U9iP+NaJYt
	XQJ+iLIrOf8xIbWHQux9r1wtrqeYsm9Nd4cUeTitvw0YTmE1dAnxw2QrP48e49eQOtUmDTiqr5z
	+ykklWEpHyJ5gL8YJ+g/96sQS1kZKd/NEOhRY4drWTCP2W9MqkDYGMXPRWc/i6JW3M+MYol6Idr
	92FuKHuULjElR/6v2134m6Duvl5r45mOzyhZ2bkB/tjyz4smO18LUILjQgqUryIhnkIY/qaOAcp
	djLTjGx1OEbNZOrVHe7JvcUTw2xReeNKqeNg
X-Google-Smtp-Source: AGHT+IHkeeRojU6nphRcBzcpFgA1HGJWrqUBo0zw7NF6Zq4RRkjDJ2KrUAA7MSqPk38slZirAV8Kmg==
X-Received: by 2002:a05:600c:3c82:b0:43c:ebc4:36a5 with SMTP id 5b1f17b1804b1-43f3a933b99mr83516875e9.7.1744574418483;
        Sun, 13 Apr 2025 13:00:18 -0700 (PDT)
Received: from brgl-pocket.. ([2a01:e0a:81f:5e10:e852:1f2c:a4b2:8e89])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce0asm8810540f8f.70.2025.04.13.13.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 13:00:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	theo.lebrun@bootlin.com,
	Chenyuan Yang <chenyuan0y@gmail.com>
Cc: Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: nomadik: Add check for clk_enable()
Date: Sun, 13 Apr 2025 22:00:13 +0200
Message-ID: <174457440296.11196.17152391053685137943.b4-ty@bgdev.pl>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250412193153.49138-1-chenyuan0y@gmail.com>
References: <20250412193153.49138-1-chenyuan0y@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Sat, 12 Apr 2025 14:31:53 -0500, Chenyuan Yang wrote:
> Add check for the return value of clk_enable() to catch
> the potential error.
> 
> This is similar to the commit 8332e6670997
> ("spi: zynq-qspi: Add check for clk_enable()").
> 
> 
> [...]

Applied, thanks!

[1/1] gpio: nomadik: Add check for clk_enable()
      https://git.kernel.org/brgl/linux/c/4521e0884c261fd286c02da942e9e8596bf2e7cf

Best regards,
-- 
Bartosz Golaszewski <brgl@bgdev.pl>
