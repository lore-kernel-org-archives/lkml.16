Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 602B634CF5
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 09:33:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746437630; cv=none; b=nd0GxRZ+Io3a/GFRJmJwMnRL96AgEGKFytDENlmIrAM6+78bxVgBHAOJE8iCo4ROkatJupoGPcOPr6wioWWbGG6DnzfaaFc/IxvQqQAwzAv6Pncd77gZ0AAkV3f7Nt5tOOOahKFaM0oWnMEkII5kKv22E5oHxKc17Sv2SS4rH4g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746437630; c=relaxed/simple;
	bh=E+Rkfl9thA//8dOfnT2wGrUmTCO2FAydSwC3bxJd9l0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XZCzZxMsVk1SwhEwpCOI0Zr9m+/XBZWa/gsxbUvobX5cUSDaIO0+cVFTL8pkikBQJfnVQ4hkZbARSPW+uU2p1Ty+/DNXgJ9OuyY8bP8CAnHl+edxVsNnUolchWXhikALdI9K3fxiEg0Vjq9hXZzklymYHBeqzDNVHnoF0y144Mc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kRFnuJrt; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kRFnuJrt"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c1ee0fd43so4511738f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 02:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746437625; x=1747042425; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XJ06MsaCexaUo2LS8xihxLn4rYdIDADmV/TGsLW6+S8=;
        b=kRFnuJrtXOs8urM1bmbJ8Glgv7TRZKyPbRS3KB6Km4Zo3wb9NpoNzAn4YDkw4J1psg
         p+mfW0Y50fcS4uWiRaempd3C3WaNdLIvTkDgB/8A4r1hsOtuRrzSWn07AGOZ6WUABayS
         ZcwD0TVITNMSjS2ayuFqNCCfMVMEvTn4IqcP6abcGp7bTTmCYp+99NUY9JJyvo88UMwT
         65Y0zdt8e5ayd0PE0w1ywVo0EuqEZbGxFV39ElYin8PGql32k40ScYvuRpehOpKOFevl
         ZKW+A4D6gEz06hp/DpmQOTiJJhHdWVAxvRxowwdNZJLLhtFByRYrEgFjJ8WiFuSKV86/
         oTjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746437625; x=1747042425;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XJ06MsaCexaUo2LS8xihxLn4rYdIDADmV/TGsLW6+S8=;
        b=UkZfgS0x1ngEvWrh4EhPHpOJZABl3WWQgfFtxvUJbyP2rfmXRKG+1BYPezvqjGsTmQ
         GlWm3XrIoXwVsG0z7gThYI4zQSWCMFJ0cCGveW4WnKUbizjmSfK3sCywfahXt5smxJKC
         rCs05kC57FMxOyLzBAJTG0CINnec+aBAVFaMMYS3kBXNV5hr6Zw4g+WiIHDTR1fgE3Xg
         d4RQOpB6kjfekkPq4FWPck+RrA/DyBdCC6m+FOr+aarRJjJsDJXKK75EKCBhqPrW9iSN
         1Bv8WgPPphOZ9KaKp0fxe0STiZsHTeXLU7+7lIMGPd10Rqn42oyJ51EByhhr6xBbJam1
         Ryvw==
X-Forwarded-Encrypted: i=1; AJvYcCXJXSrq0NgQJfTaWwwZgUpfJw4T3FdXuWiWC2/jUlFPpsxb39t5m+G7GZ5Yl8FyejJCH763UtCm7DNGy20=@vger.kernel.org
X-Gm-Message-State: AOJu0YxpASXPN+C2TYivT3NeidOqu5YWULFlAEgByXPhS/BC2yCB/DSF
	uxTJXqCQBe0dnUcE1tJk8aaa/Rr6QHb+mciKNNZ5S8iKyJioIlzeIDPLZImN3aHwet555hop8Bn
	a
X-Gm-Gg: ASbGnct7bg+4ujsXt4wcn50xHflha8j7QgXG4zyKhnDmcEwHFyW0gWHTq9gqOCydQ+A
	/jdyx9o7jZhxFhVMm9WrxOnY7FEIQ7O6JmpVewPPnIVKo9PR8WliQi0nSSpob2gvpBlI03lKtto
	XCEXa+1oLlCDQfXUSrSQlVfQtzg6t27f0g+azT+bs0yHaERW8KM5ufjMPk0F566JAMe2jOkPw08
	xG5J1V7bZR4/nUk/q4R5tiHA+zgs9YzbkMmNh+D/x01STIjcnx6wDLnKJnPLpORkZ13uaDRRNVp
	tniY2eTugN1VFIb5AZIXNps/YRgJoQ2k9YxD7N8s
X-Google-Smtp-Source: AGHT+IEQcue1k4XN/UkoNi+0KcZ4JWKSUMbu8bAHoWYr4298di89GdcuReHjmyRCjR7TkE27M3LKQA==
X-Received: by 2002:a05:6000:2c9:b0:3a0:9f24:774f with SMTP id ffacd0b85a97d-3a09fdbf660mr4541275f8f.39.1746437625592;
        Mon, 05 May 2025 02:33:45 -0700 (PDT)
Received: from localhost ([2a01:e0a:3c5:5fb1:c020:17e6:57d1:3a03])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a099ae3356sm9664006f8f.29.2025.05.05.02.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 02:33:45 -0700 (PDT)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>,  linux-clk@vger.kernel.org,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: add a clk_hw helpers to get the clock device
 or device_node
In-Reply-To: <20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
	(Jerome Brunet's message of "Thu, 17 Apr 2025 15:44:22 +0200")
References: <20250417-clk-hw-get-helpers-v1-0-7743e509612a@baylibre.com>
	<20250417-clk-hw-get-helpers-v1-1-7743e509612a@baylibre.com>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Mon, 05 May 2025 11:33:44 +0200
Message-ID: <1jbjs7mmfb.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu 17 Apr 2025 at 15:44, Jerome Brunet <jbrunet@baylibre.com> wrote:

> Add helpers to get the device or device_node associated with clk_hw.
>
> This can be used by clock drivers to access various device related
> functionality such as devres, dev_ prints, etc ...
>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---

Hello Stephen,

If possible, could you take that change in so can move on with rework
I'm trying do in amlogic clocks, while we refine the test part ? (if
another round is needed for that)

Cheers

>  drivers/clk/clk.c            | 12 ++++++++++++
>  include/linux/clk-provider.h | 26 ++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
>
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 0565c87656cf5c557d8259c71b5d2971a7ac87e8..b821b2cdb155331c85fafbd2fac8ab3703a08e4d 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -365,6 +365,18 @@ const char *clk_hw_get_name(const struct clk_hw *hw)
>  }
>  EXPORT_SYMBOL_GPL(clk_hw_get_name);
>  
> +struct device *clk_hw_get_dev(const struct clk_hw *hw)
> +{
> +	return hw->core->dev;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_dev);
> +
> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw)
> +{
> +	return hw->core->of_node;
> +}
> +EXPORT_SYMBOL_GPL(clk_hw_get_of_node);
> +
>  struct clk_hw *__clk_get_hw(struct clk *clk)
>  {
>  	return !clk ? NULL : clk->core->hw;
> diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
> index 2e6e603b749342931c0d0693c3e72b62c000791b..630705a47129453c241f1b1755f2c2f2a7ed8f77 100644
> --- a/include/linux/clk-provider.h
> +++ b/include/linux/clk-provider.h
> @@ -1360,6 +1360,32 @@ void clk_hw_unregister(struct clk_hw *hw);
>  /* helper functions */
>  const char *__clk_get_name(const struct clk *clk);
>  const char *clk_hw_get_name(const struct clk_hw *hw);
> +
> +/**
> + * clk_hw_get_dev() - get device from an hardware clock.
> + * @hw: the clk_hw pointer to get the struct device from
> + *
> + * This is a helper to get the struct device associated with a hardware
> + * clock. Some clock controllers, such as the one registered with
> + * CLK_OF_DECLARE(), may have not provided a device pointer while
> + * registering the clock.
> + *
> + * Return: the struct device associated with the clock, or NULL if there
> + * is none.
> + */
> +struct device *clk_hw_get_dev(const struct clk_hw *hw);
> +
> +/**
> + * clk_hw_get_of_node() - get device_node from a hardware clock.
> + * @hw: the clk_hw pointer to get the struct device_node from
> + *
> + * This is a helper to get the struct device_node associated with a
> + * hardware clock.
> + *
> + * Return: the struct device_node associated with the clock, or NULL
> + * if there is none.
> + */
> +struct device_node *clk_hw_get_of_node(const struct clk_hw *hw);
>  #ifdef CONFIG_COMMON_CLK
>  struct clk_hw *__clk_get_hw(struct clk *clk);
>  #else

-- 
Jerome
