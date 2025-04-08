Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32D9821504F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:56:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744102622; cv=none; b=IWcpCZ6bTaOxh/7HzuAiHxaNX3KJcTn0ffeWHPkx42mRhrEWfOIUdF5qXvpThtsUx2Bz05aaa6zIV8zpE6Ubq28E4Q6zYVY/HeI381b/pzH3B/HYyQSxsFZdadjrE/R02kDIRDAr47yOimqv7UiZJTpGHSVSUBU8O9o7bjXqN0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744102622; c=relaxed/simple;
	bh=mO6tgaOe8Z5JSxtKwXL9kUbbLucxdFSgSkaOgFnu0ho=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KrxmtJCwEtXSj4M0Gdsb6FqDsiptv1SZy0sDpJG9LQMd/IWDHUonA5hzsKBXcztcTjfhrvXE2pYR5+/Kgh1hjFxFkZgLOEbtpMY3OEG67QoCc2cQxBcwRzMS/OG3WmQxP8hmUNP32p5a1inQMyXzwGfH+NqzvZFmWShTrBN6kOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=NVustdQq; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="NVustdQq"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-39727fe912cso2286328f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 01:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744102618; x=1744707418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=;
        b=NVustdQqUcbzsDgezdlU1okpXJ/hRuZd1MIxzTu402R+uQM2u998bWr8Cm7u+u5bME
         zDmSj/3aiVZtbpcGoNWwb2HtZWeX925zv569sTdjBKWnk1uYaLgW/xZCjHf5A5mfa/8t
         rqa0t4/baMtmJuHaOWEz3X1hv28mFT3oW1YKe76OdawwQlNJZQgsN3hX2sRpJfWLhlSv
         dOtsvFoowlJjdgquN/wMHf7ZCB5IF5n54KY1AW1WxJPJG/eeqtqxk+WBiuxh5ggEY98V
         uq63FCzpI5SjdlqdOI7PXLvxFKEi5y9ePYQRoS3ovUqtIN5ta5GFtt3ZwnfuuR1An3qt
         flYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744102618; x=1744707418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NlrL4zXaJRiVzmccsssqwmA6IrlfBxz76fjvGhSaRWM=;
        b=iFDqssBP557zoKeHHWCIRK++RIwtOe+SKGZYnP9BI4z8uptbA2PVtRKFjLoY/llo9u
         lsE3yvEa9NvWcnblsluc1pTiB4x70XKmIIhAmbfrrZy/GSWQZ+eUjkULNGu/OybfaXo7
         ETL942eIt2nZ0/jG8jx3cD5Oxs7YLm/hGbHjrP0vuyAgtP/O1tw2psxUglM+0ADFM+oR
         YWkr4SUh3Flj0LQmLpW8xhzgHLUjUD8gFIGUPP872dAgkHFEP1ZbVOwb0MPyhE7rTt/x
         tWp8nSHjz8hXFpK9diKTcfbRVCJSe/1q1Sc0gRpTLq8HMw+iVdSV1L5dI3+sYQEUfojg
         hM8w==
X-Forwarded-Encrypted: i=1; AJvYcCXigX6bhXiRV8okUmzQIdDYkWIjBzI9xZ5YSukme1Ofs4rbnLWrUOe4p34Bdo6lqRWHqAzPxe3ljvgeaMI=@vger.kernel.org
X-Gm-Message-State: AOJu0YymCJBhvsjX24CZ6NfDZsDdcyP9FidVswoDKyfpFx0Z3Mnw8Wg2
	G1pCt8OkH7q7tL7L4P8CkkYZuFpYhwicRimrH/7cYoEXe1SxnBXoJPwCCQ2jZ8k=
X-Gm-Gg: ASbGncud0w+S/acHBJ8+pRhc20spgvuuukXO61n/h25z913blvPh77SNe25ZSGbwtt1
	0pGIHskrWRLefSX5i9T4anOy3kcc+j30RZFdPpDGYmL/kV++Id78z1QI9TfXNZmI5sio7Pr/Usd
	603ZxfwnEve/y+/eignLSt2csUfLH0j0VYkQAsS4yiKq+S0sGbastXgMI9xqflpIn5D1k0ys3CR
	R5CDQssMcjK9rZ4chopaG0P28AZarW7lsnIHSJUpphKQ9X+yTsCW93yrxjoIunOySv+WsQmRJ5A
	Ki0tLw1nL99zlMG+Te+oepxszwtdi3Y5U8E/OUH/NL4y
X-Google-Smtp-Source: AGHT+IH+3XHGTXWwLQ8aHwnlELIPNmZTRMwkmMqzpY2GuqnkctbVgWOC3EDFl2D0p0YtAgR3d4+z2w==
X-Received: by 2002:a05:6000:2287:b0:38f:23f4:2d7a with SMTP id ffacd0b85a97d-39d6fce1200mr8698026f8f.40.1744102618452;
        Tue, 08 Apr 2025 01:56:58 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d66csm14778725f8f.63.2025.04.08.01.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 01:56:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Srinivas Neeli <srinivas.neeli@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
Date: Tue,  8 Apr 2025 10:56:56 +0200
Message-ID: <174410261480.40984.15525439488118757533.b4-ty@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
References: <20250406202245.53854-1-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>


On Sun, 06 Apr 2025 22:22:44 +0200, Krzysztof Kozlowski wrote:
> Device can be unbound, so driver must also release memory for the wakeup
> source.
> 
> 

Applied, thanks!

[1/2] gpio: mpc8xxx: Fix wakeup source leaks on device unbind
      https://git.kernel.org/brgl/linux/c/da47605e43af9996eb46c8a060f259a8c34cc3c5
[2/2] gpio: zynq: Fix wakeup source leaks on device unbind
      https://git.kernel.org/brgl/linux/c/c5672e310ad971d408752fce7596ed27adc6008f

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
