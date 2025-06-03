Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A6A1C861B
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 17:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973428; cv=none; b=d7+4rEkdURfJ2F2KEGU62wIWc10DJxb2vuFUYlmzp5CuHS09NTJFZJkSteTGfsDXRrxwGtoNFK4etQwMh+BAjOGDk1qfAyTTqpXnKu8l9Nv1ZQSrebkIcJz6A7RG7dosqgywd8bG50Q7xdkdcQoDIdU4iBzbo6tMA+g1710Fg+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973428; c=relaxed/simple;
	bh=QN5rbcRHWNYvmqhVhRD9FgtoDgxlmTfU7H2bsy6rsYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pePnsSeNq75eB7AjV9oZ5VF2Fh/kKWr3L8vC7akKRPA5O78k7mP/xxBKR3aoMJQHFhl5R7qihacYer9PVT0m9n+mDhkhH3udCwYzGA3VJjS+3okmU3X9d+w6eAqiBRlv5ezNM4qTHphh+zjDjJhcVbKmGOT+tVR4KZtVgMK05K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XgmYLCFu; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XgmYLCFu"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-74264d1832eso6565119b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973426; x=1749578226; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=XgmYLCFu/k7G5+IOwdFliJRnYqVS/ouWbx8HfJzDg0uA627UihR1+lWwNA9Tw6pkRa
         K8qTKwy0FmppnROfGPd7miSxvPZeT2Eg3uqpjd6Vjz07T0kapGvNX8CfOEz1AS+Gs/BX
         T8C3th5akxqIJbnwBLQ8iKCwEfpS0LeZiLDC0RdzZb9yLGJjN4+Kh0fzRGFoNSyW1sD+
         NDxSCDtDwnw/IbVnbfF+Kc2SdVTuRyruVblL2RuYJ2d4lA9jnWNeRqoTxalJjRAprFh2
         Scom6IJ8bmo9p2HO4H7eK+3YX3Xvi4IAyQYykaW7Jo/xBIKGxCYOLNiWNwkk2C1h01cT
         F/zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973426; x=1749578226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QOHtIjIllleG5NXeGwEB/iZNkovTPGk/XQvSsFwTJgY=;
        b=i2nPvdaso4Q8UQEvv0ZhICTzSpjI7LClyARpSYnfv+SSXJzD0A+6JgWl1UJhItJrhc
         3hh/NN+XlllLh3QXicxsUOT56yXDoFqCXZFeSgTz6YgDv8cMoMy8kHH/rWVP185v66Gk
         FHLx40Cddt4rAj2Ld6RUdlghk84tueB6Z2lBql57WFMSlQXB5jTQPpVBhigCfUx2dEjr
         FMJjol8PgfiSZIAfa+Gf4Q4H8+kI23jb/mjHL/CjZzSuQtirQMlblXzzk9RJbGVfFvh6
         twpR7yo9Suo/yPwoNGNYN3CBUzZIQ3kv88Cei4gDFz135+/X4X++KPCzXIdB7wSUW+a7
         k0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCXqb6rNqwTj4cmURy0eoae96Z/WwS5VE4AOSm0hwVCbCACLHCY1wDJQ/hqUPdoDWHdHSg8THiFM8pVQTNs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8LV1ZJ/ZP9NRhGDAh1ZqfwcV9MUGExQ9BlPREpoWnTn7dnrJX
	SWyesjWFHfc0Cav8MxpCI6EBDx87opHSpENfcsxO25eO2oQJPoILzR7v2ZkMOZNf+A==
X-Gm-Gg: ASbGncs/uDAi6m4wNUTUmiRzFXbDNjY3DqkxPA46CT35ZtFprhUrYUqELrYkaYhMxh6
	RL4JmEL3SOml5LfP6jxlnyS1YLiR0MdFb0+7+flKe9blrDLxGrpOYrf7FGyyEukEo95sOo1phGu
	jThPoepgDDC1nJYDGHTQ3t8VgOX485uHgGfLlVkzOIez2tg09eOxqFg/S7uSzVjg9fnNFLtt6nA
	+R6t9WUcC0ptqN0rMi9bxb+On3J7Jn7SoECJcIBS7RZPLBbO0L1NbvbXg9tTqXv2wJynCydLsUA
	KVi/vkKORGhSWBS1dRKLt2vVIAL2wyQoZ4hfKR7H37MqAI3KUK3zlUsY41LhXOLuLwcY7oQQyek
	kUavQXAPTNurLsONBb/pZw7nKH+s=
X-Google-Smtp-Source: AGHT+IFJjRiNTfrHUGA38dJeGT2+lFGgu3T7p+sKAbadh5LPG+wdrTfumVyLbKsTRptWC4Rroj128g==
X-Received: by 2002:a05:6a00:3d12:b0:737:678d:fb66 with SMTP id d2e1a72fcca58-7480b1f3b1amr53928b3a.5.1748973426129;
        Tue, 03 Jun 2025 10:57:06 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afeab4acsm9633273b3a.43.2025.06.03.10.57.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 10:57:05 -0700 (PDT)
Date: Tue, 3 Jun 2025 10:57:01 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: tglx@linutronix.de, Jim Cromie <jim.cromie@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Peter Zijlstra (Intel)" <peterz@infradead.org>,
	Marco Elver <elver@google.com>, Nam Cao <namcao@linutronix.de>,
	linux-kernel@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-tegra@vger.kernel.org, John Stulz <jstultz@google.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Saravan Kanna <saravanak@google.com>
Subject: Re: [PATCH v1 4/7] clocksource/drivers/tegra186: Add module owner
Message-ID: <aD83bbyEPKSDXv_T@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-5-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-5-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The conversion to modules requires a correct handling of the module
> refcount in order to prevent to unload it if it is in use. That is
> especially true with the clockevents where there is no function to
> unregister them.
> 
> The core time framework correctly handles the module refcount with the
> different clocksource and clockevents if the module owner is set.
> 
> Add the module owner to make sure the core framework will prevent
> stupid things happening when the driver will be converted into a
> module.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  drivers/clocksource/timer-tegra186.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/clocksource/timer-tegra186.c b/drivers/clocksource/timer-tegra186.c
> index e5394f98a02e..56a5342bcf78 100644
> --- a/drivers/clocksource/timer-tegra186.c
> +++ b/drivers/clocksource/timer-tegra186.c
> @@ -373,6 +373,7 @@ static int tegra186_timer_tsc_init(struct tegra186_timer *tegra)
>  	tegra->tsc.read = tegra186_timer_tsc_read;
>  	tegra->tsc.mask = CLOCKSOURCE_MASK(56);
>  	tegra->tsc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->tsc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->tsc, 31250000);
>  }
> @@ -392,6 +393,7 @@ static int tegra186_timer_osc_init(struct tegra186_timer *tegra)
>  	tegra->osc.read = tegra186_timer_osc_read;
>  	tegra->osc.mask = CLOCKSOURCE_MASK(32);
>  	tegra->osc.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->osc.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->osc, 38400000);
>  }
> @@ -411,6 +413,7 @@ static int tegra186_timer_usec_init(struct tegra186_timer *tegra)
>  	tegra->usec.read = tegra186_timer_usec_read;
>  	tegra->usec.mask = CLOCKSOURCE_MASK(32);
>  	tegra->usec.flags = CLOCK_SOURCE_IS_CONTINUOUS;
> +	tegra->usec.owner = THIS_MODULE;
>  
>  	return clocksource_register_hz(&tegra->usec, USEC_PER_SEC);
>  }
> -- 
> 2.43.0
> 
