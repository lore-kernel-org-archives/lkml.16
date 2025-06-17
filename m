Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0550B291161
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151235; cv=none; b=Zoo8/JBHCEMBy5L6N98Tm4MeFX7lOczFvK26I19XGyEsCm8BiNf7V4D2orfsYCNr9Pgyxwbq9U46H3u3ec2xU1V//vncxGKLiorwOvK3Lga1H5/iukRmURCmKL9OGLoqMz8evEfvK/BfQHntYf16b21PfduubgAXCzWp6hF/ouo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151235; c=relaxed/simple;
	bh=xxgZ7R/ukDFm8UgWJQf1d2zRkqYHl3X/OWibR2cLpqU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l6WKyRSHKflKGIvMBE5kQeJXMrqwPILBgOSiuClRiOkZvv+rRkwXDlnpyDtvyfnVGhXrNtgF6zxKnIHIDFOCB/vX9lLs/xoy6VA0aeBl1ODGLpcKnwaBO6rlgfc7jJdQcI8u5g4k5yomt7Rt7MK/42b1GlYf5/gMUVpiHjxnCEE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v/0UHZ8U; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v/0UHZ8U"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450d668c2a1so43540525e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750151232; x=1750756032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d8O6+umHZPO/Ii67p4kZdXXLm9+0GF0Bsp3J+Rdwo5s=;
        b=v/0UHZ8UmlgwN2h15PhYMLo3UEX0Jpnt/SkcwO0xg7XPpWPdtuzPjaEGpYLrws3HB9
         4x3XpSzegORKNxruo8cM+E/bmxl4/8OyP3UmqCDGG9UGYraztXAQiCbeFqu7t1wUjlnK
         DHX3oEAyP9ddrHdtBOR5PYzNQHcccd0zyrMB4W6hrLaKGjjeu73V8w+qCyShRiSRr9cD
         kksCsIKGpiWEbNLsqgx2D5aorep9LchyxUbzZPlL/qJjZyP1XMuBBIGk0BazJcAK2e6n
         s4UJDgMkgAu70VgQCogUxRa/UTVvdDtgmmUsqiOovCx5GWMjeDfqgAhLnvGhi6sHoNG7
         upmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750151232; x=1750756032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d8O6+umHZPO/Ii67p4kZdXXLm9+0GF0Bsp3J+Rdwo5s=;
        b=fiirBpqFqzTv7saB8Kd6bVNYB+vtX3Li3Tp3s1pCDaX8PYtZrE82F+fEd5y0/ItDjA
         MXOcshcAK6xehCFg49nnQh3FQwvAzqTEKoFgyp4nRLHl0qAEVca1iFGsuc45p3uiQMB+
         EVX7t9eG7SX21Q8RFqlWsma7T5UEMzfa0oP4iGCgxzJ9Pc2evbpK4u2bfHfbu+6OSnMR
         674KuxBZpnC/gfI+ZijEJ3vdrIDgV5kipR2Hagn/HXfWP8alidnLQZxQMwG++I0M/ZL7
         7IhKt9NZhwHHSOypJMxcfHrzSMQiJsrYTzIVixS04MgsHufLE/ho8N12zU/sXBKkILFK
         HtPw==
X-Forwarded-Encrypted: i=1; AJvYcCU5IQfYpOpDwLWEmeV0S6HFvcarCTYEn06GaliJcIRWMdsFa7vwxIIP9bPXu6FxGfdLpkeFggrcXaIKb58=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOEATIuAZX7wwx555yuygT7dRUvR7pEfSTDFkwMm7hdkTwYAEF
	c1nkEnzN+brHIR4RO5EMEZHl+b7nnT5g+2YeAQKa6Z/NEt3oMDOn9iP9zxAXGv4tct0=
X-Gm-Gg: ASbGnctvsHrWBNmARczcQaSTQMj4z1cbX9nvqV9EuAiFigD8qAkU9KWQC/RsUXnKRWM
	4jdh2P2ELLEAfmSMXnFLN8oVP6yoCbf5Z0yynoeV/P/HP0KmWmGMAxISoCyxeEI9bMHYCctQ3zV
	ljR3RHimbvOMJbKiHIHu8aZbfVaKa5OxhFNNGRyISefReix0duNiWEM9VjXJB2ZrNIqQiQYxJPw
	WHQ+Oy7Vw7Z4ahe9ndrdQNuB7fY0QV5nrMVrQCGqNNrUmUorIHaDgKXsQ3xfZ40/BnNwC6n2Hw0
	K66PZl442OlCFXMg0bCosBDOu3mTtsAk/S8fs1H2PPgCXLRmKJvm+vrMTUKfxiU=
X-Google-Smtp-Source: AGHT+IGGnLF+aL3LK+xHmsD10MB4lnkkqmE1vMtMPtoum903Wlqks60RJraEkuA7LpVAWBl6qRxRMg==
X-Received: by 2002:a05:600c:8587:b0:44a:b468:87b1 with SMTP id 5b1f17b1804b1-4533ca0a5cfmr82676745e9.4.1750151232139;
        Tue, 17 Jun 2025 02:07:12 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:90df:ded7:9cbf:4074])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24b0c8sm167213005e9.24.2025.06.17.02.07.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 02:07:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linux-gpio@vger.kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] gpio: pca953x: fix wrong error probe return value
Date: Tue, 17 Jun 2025 11:07:09 +0200
Message-ID: <175015122727.20962.12230915650495330768.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250616134503.1201138-1-s.hauer@pengutronix.de>
References: <20250616134503.1201138-1-s.hauer@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Mon, 16 Jun 2025 15:45:03 +0200, Sascha Hauer wrote:
> The second argument to dev_err_probe() is the error value. Pass the
> return value of devm_request_threaded_irq() there instead of the irq
> number.
> 
> 

Applied, thanks!

[1/1] gpio: pca953x: fix wrong error probe return value
      https://git.kernel.org/brgl/linux/c/0a1db19f66c0960eb00e1f2ccd40708b6747f5b1

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
