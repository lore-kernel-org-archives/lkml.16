Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C46525B1CB
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 08:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751876975; cv=none; b=JRNDDVmtyVqyeaSZcVFsDqCFS0I+AhBhlptv7uXeSgDigZh69YDPgAt5XG5AM0rKt2G26rjnSOQUhc5eXP9RH03qwPSGxt0irzxS69gWv07dhi8ZiZJikkQPQMc6ozB499VOGMMedQN/tGUMrj/3cp4PMT2NTXqwACfDlD1xwMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751876975; c=relaxed/simple;
	bh=ZmuwxEwRz9hvR9dPQVP2ysixcdlQYWY+Fgsp2U0+Nu4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BvhhIMQmKoiFyq6rmMF+P5bNh/Pn208LIju5ba908LCbr4Yv16U8dPyFTwkaMBdqrEI6UwU88olLX2uiJIeciB9SiiRj5iASD12vJUUhjYpS9VWNqSEoBALE/yMT5zv1wyEnRGT32FnEbn/7l6xpYjmqKmyWxOWJE8SUKDTSqHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cHhyR4dG; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cHhyR4dG"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2350b1b9129so17674895ad.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Jul 2025 01:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751876973; x=1752481773; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=;
        b=cHhyR4dGUf6pU1+2Xk3eD3W95LwPdcIv5Xxma8aSdvJ86PVItbr11GDDuL+JmfjxNy
         x1j/CCC04VnGgAl/SZNwrmokxkI4vNtFd+VgxKJCFdPVfcwGy5sJVN/EbW2I4DCpZ7WF
         kMfjtySOmZjLIBiF1Zdclgl1/EtAsWSxCqh4HeWvB2cf1DnVel3NxMsmhjCZ1EVaf3XE
         /edxwJz48MBvoW+rSNPE5cImEI6RafEdiZ1SrVKsUXZtmWjTRuextcI2GT/tnhfCelkp
         Z74L6njTe/ga0mU7izQlYS+SyAQjcusYY//WCauNRwq5ot0nC14oT9Hjbcy3uLKgH3TZ
         NsLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751876973; x=1752481773;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WktzVbMCOuSz2XCDiNHlBWqihhwDZRtZkZ7oMJdFGs8=;
        b=pK4L1aqA0BmKGwEpgXmvug8Lhpz8k7DOJlYwliTRvcQkBeHZE8UrpCnondkuXMcTaY
         yOuwiesHqWgTqPi10JfwITciv255JtF5cWabbNsUEzoUPzZlN5e2WmHawhk9iWU13euE
         ixZ5dSMoW8LR2/beLU4i3lGPnB13GNXFrS7AmIRrMP5+vJg6bsRd8/TCcSSPkDk5lK9w
         E/ZjxuecEGkbvI/mcNlj8Eujg0zCmY76mTMqsnB0Pk1e73VFHr+CnjF2tMaG4BE6prTo
         rX7yrBaGryjvtY3hRMron7xoQTIQX5y+yqTQVFJy1ytYRaiBrvkz3xyMsAKzE5mjh8aG
         gstA==
X-Forwarded-Encrypted: i=1; AJvYcCWuWDYWfCFj5HRkb3h9b/LKhjkiNdRLvcACA9VViAACzqj0EMRbuxy3VzGPK5tN87oisCFZpPBPX51vSn8=@vger.kernel.org
X-Gm-Message-State: AOJu0YybJxIURubvI4O03qJGq1/QhrHFn1LpZnA8lneool9Cvf4RyHrR
	0qJLy2FBEz6d7vigjWVsJsBgWEgX6RuQ9AUrXaGFfSoD6isnPxqq/KGmz9tMxVmcbm0=
X-Gm-Gg: ASbGncuuhyXBK5feFwj+fW2bRP7hoVMerwukAg9tNmcZfOzUXHAEmnRpfJbrLdBc+wL
	d16T/e5QZhCNlxxlGlxPLqFwUY4nDMLW4Jb3od31hW0owFlC1Z4zspwFMuWm01GouyQZnOn3Fnc
	9VeTmQHA0t54hrRAkGy8w1pokY3LUqqOgU+lluBUJZZzwo0HDBjLYDEDPDngZ/UktvAMuGeAbYO
	2a4GNT+S9yXBAeFJYwr9BwPpV/e6RGwJJI/SUN9eowOa+qPfrLFI/6H54hsuycXkYGXhNuSwGuh
	3GVeNw3fS4+ApveJ9mwW23F65b/ckB7Loo38x4BIXtMDCWw7DBW375YtgYoOea8=
X-Google-Smtp-Source: AGHT+IEzG4PTUXHjQ19lS5u/nsqPLFIxy4HYD8J7svSUDedR3HYEqjepBCTrT6erZSMiBmj/Gzsypw==
X-Received: by 2002:a17:903:198c:b0:235:7c6:ebd2 with SMTP id d9443c01a7336-23c85e745b6mr148490455ad.31.1751876973579;
        Mon, 07 Jul 2025 01:29:33 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23c845894a3sm80048605ad.187.2025.07.07.01.29.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Jul 2025 01:29:33 -0700 (PDT)
Date: Mon, 7 Jul 2025 13:59:30 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Viresh Kumar <vireshk@kernel.org>, linux-gpio@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux@ew.tq-group.com,
	linux-arm-kernel@lists.infradead.org,
	virtualization@lists.linux.dev,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: Re: [PATCH 12/12] gpio: virtio: use new GPIO line value setter
 callbacks
Message-ID: <20250707082930.boxyt5lrfmmxjrmk@vireshk-i7>
References: <20250707-gpiochip-set-rv-gpio-round4-v1-0-35668aaaf6d2@linaro.org>
 <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250707-gpiochip-set-rv-gpio-round4-v1-12-35668aaaf6d2@linaro.org>

On 07-07-25, 09:50, Bartosz Golaszewski wrote:
> From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> 
> struct gpio_chip now has callbacks for setting line values that return
> an integer, allowing to indicate failures. Convert the driver to using
> them.
> 
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> ---
>  drivers/gpio/gpio-virtio.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
