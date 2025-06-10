Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8455C27AC4C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749543210; cv=none; b=M6e2/6zp0d8iHWPySR5xhTcxaZK/Q7rQ9E6xhAk/e7jGmQafF7KGxRPIxVEGgebO0E8Ud7c8q6UkN/XB4nIezCAKmBhgQYrCFjtnYUlioTtwaXlapGq3nSTZyDpjy1Upas5tO8PR+/gy0rd7AeSDzppZFE/GzvmSMAWSIPx3nlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749543210; c=relaxed/simple;
	bh=AGrB1k2K4d+j7W5uHQba0DcCDvIDpeMB5mA7xW6HOjs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tApf+5St3E/6EMWpj06ncuKvzCBjlWxBVJGMZmYh0aBhWxyhLDtyQ1zOR+DdE+JiUgWvfAvPJoxGtfCiPattDDapH0kKZ8QdoT7Mrlgp0DqVMFktwJjBO6OrClB4DFxDRX40+iG3BHuEHjQUXLiKQpYtDR4FZ1IEt38lKLAZahQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=r44G/iT4; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="r44G/iT4"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a503d9ef59so4281582f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 01:13:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749543207; x=1750148007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3DDdOm3PjmMZGWv7sfjoGBzae0xVF6b9amq2E2mQlBQ=;
        b=r44G/iT4eUJB2vQYCBF9R6Rtq4Ki0QcTQkyVz5TYvM+v5xM88rUW7HzlI96+q1dsjj
         5MM1a8aMZxfmAgEV+drD0TXE/KdkJClfGWG4b+Sxlct13BHZHasqDpIbLmG6ZKcnfVqA
         IE7pHnpmBxv5GWN6MihtSuNZbVfu5Gf3BD8KWFo29vToEX9uVDSgjwnUJvkrQBBfVNIP
         aRd/ReaVihJyMFBhPCEAFOHsRWAcn2VEwrKRe/nomU4K8gcGNl15qD8EN5uuCg6XuIKu
         PN3laAUP5fTLSYZ+v6D0ahJJoi9EPM0CRutMAT+5DAkH9VlVapT5GVLPxBXMacDQ8TX0
         RfhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749543207; x=1750148007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3DDdOm3PjmMZGWv7sfjoGBzae0xVF6b9amq2E2mQlBQ=;
        b=AadI1w0U0mNnhq0mTsNfAmDcO9+K492V2uyYw5paTRSgQ2D+lTdxcF8VUzTvcB/pKD
         0ZFNI+jk71ysfdQIxCwbM83am/oEiKoWSv1HhW/xmVGeZxTOjqNMHykfIu+NZ+uGxdDK
         IwmXvRQT9t9HIr6HT755FqnCriuHjWqQAPHPpae5j44pZjccT2YZ+uJD1TN5KXOeWzL4
         ZGJjDOU1ihOAPvYShJDCAHC6vAyGT0cN99te9PIEbjZBTADtDNZObD0e/q05r0LPNRTt
         1C/AUGgdS8dGbMqOWLKzWE0pnMRh2mhZWGawfyKWcHclUIsHp8ceBa961RXBfI2OJeCH
         5ENw==
X-Forwarded-Encrypted: i=1; AJvYcCU4Xe5tJJnj2Mn/yuukKfWzsTDicwiQDNPxL8X2jU3JJkjJFLtU4bH7k3df032xOZ0A2Vy2ts22gWHBF/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8AliwgPF/1Y3Wu+Xo04pRvBmEwI6qHO3W88tXDAsZCZTzTAIC
	mKE91D6cExnah91N7OY14lsHg18IZ4aZLQGuhovlURRKYi9ZXrZJC8pKtypoXQVF4zA=
X-Gm-Gg: ASbGncuQ4jrnebd1f7iSdlMMA2VSMoEcpZc5f/bihP442jTHOHLJwQvTWfUKP/6Ydf0
	6oyUlSRYEYZCnvRmvOrMRDVux7n+Dt6qUjYGNrNjvG1XBS+0X+KkGRqQihNGEz1wEUb5Uuj2PQf
	K0YwsT9Fvti3nHD2m/8JnY92AqnpJKjGHCHWqlR7+ywZVO9yT7jv9yalYYqPjArfqgfOwi9+zuw
	guX7ScTsSfwKUfPX630niIoo5bAwEiGWFoulWhm3pRH9YBBfgrtnOsNCQK6tARJNPGZgRZGaHjQ
	2Gln2iO4YzRGmKOZwaYtRvA4pA7qWQ8jpMSvcfYgJjXgwhdVC355zbbI+vnX
X-Google-Smtp-Source: AGHT+IGd0hRk+75zKFj4sdKdcpiZwWHStM03Gr7kQJsVjryb0vZsuhZQnQD8wN1guY6/FynJa1139Q==
X-Received: by 2002:a05:6000:25c6:b0:3a3:7749:9783 with SMTP id ffacd0b85a97d-3a531ce7324mr11978738f8f.51.1749543206999;
        Tue, 10 Jun 2025 01:13:26 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5323b5147sm11852958f8f.37.2025.06.10.01.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 01:13:26 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: linus.walleij@linaro.org,
	brgl@bgdev.pl,
	f.fangjian@huawei.com,
	Yang Shen <shenyang39@huawei.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] MAINTAINERS: Update HiSilicon GPIO driver maintainer
Date: Tue, 10 Jun 2025 10:13:19 +0200
Message-ID: <174954319673.29199.11108527268991181680.b4-ty@linaro.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250529034023.3780376-1-shenyang39@huawei.com>
References: <20250529034023.3780376-1-shenyang39@huawei.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Thu, 29 May 2025 11:40:23 +0800, Yang Shen wrote:
> Add Yang Shen as the maintainer of the HiSilicon GPIO driver,
> replacing Jay Fang.
> 
> 

Applied, thanks!

[1/1] MAINTAINERS: Update HiSilicon GPIO driver maintainer
      https://git.kernel.org/brgl/linux/c/e0d4a0f1d066f14522049e827107a577444d9183

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
