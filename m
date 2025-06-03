Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D9DA1DF27E
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973868; cv=none; b=LD36AiOwulgM5xbdjXOXsZrta7xLS1qLGEUP6j9p84qCtNl+hRLCYXK+35lqP1L8U9+CXzUiiiF/vY69GddBl9p9eU69FvpNkIeSxFLo7wQu5bxE0qh5Vl+7pyweJAF+67g/zCDAeeY4VID6D6qsLPo8O06WSSDq48kHIoIXQQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973868; c=relaxed/simple;
	bh=o3opKOrfcTuzr4DqAqhaR8sfzX3Hm8/ZaGQ2oWe0ido=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gxNY6CUYFouIgz8FcCuepwkugedN3+idMzfeQYRQe37jKwjWSdT/5J9kH2yavdAGwt6/IlEuFWR+6robPHRlnfnspjU8C8FnIFVvT6GfpDbbjMr6B5Axn3AaRRXXIUDTMH6bDmPT3PKzpty5dxbgY4SrvjJII8fB2rZvllmqX7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ujjswy3; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ujjswy3"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-745fe311741so6700821b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973866; x=1749578666; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
        b=1ujjswy3WpTlRHrnN5iBJN8JHL8nXTHGC+2Ilp+o/ai1WypKzLpa0HXYFoscXwtxzi
         ulOf22ptziR6TbYOCMDYMVc7j+EvxcRX78EPUNSAiDayxY8SehgZ3uFS1+kdlueeV2kH
         C5WW1q0JziRX/UfOTr/IiPffriZ0YMBXoP169BSajqL9FW517rClLQY/7i1hrZoe+yjg
         LZZ3C7LoQocAogY8oLuP4bRdb2+/C+4VJQO0oNbn3wumxxvQ2/e1ZMyo4kJM0rjzTQ5q
         f7qPRwLnLDCcjLStkWwiDGCjH10rEk9WsP9clU4HU2JsSzOMZMEA9u9SFb4pk7kggQrD
         1qYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973866; x=1749578666;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KYrpDXZnKMDiJldti/dMMJILacoHM1+V5NOSlkoGpIs=;
        b=t7KfYQtaL7mD8UfH6J6rZRX/2No9rG074EzXVScSxdna94b3N/8iKj3Rkxd39LlkTd
         +I5g/TCBy7XBkd25XoUuzku1wnYNVV7NJIFbzyhbFAyI5pBu3bo0QcBJj53At/bY1zRc
         7UGAPwNLQFT78YHQkjcez40bSqobRBO5MEOr5dvQrl9bBy+lxelJtbkd2ulN19S7yrxt
         7mPTPDjDR3vZawOc3c2EAheAnHazguyRQsiOwE0pBJ/E50ydeHNQ1BfbYNHgWQl6C080
         S/qK5/R67ZSS4wHn5FFFvSwxR8L8FX1uEcEjVE4FKlyoJKQhHCmh9bUVkWSxLO6b7XTo
         tQEg==
X-Forwarded-Encrypted: i=1; AJvYcCV5KsP70z3OSXe5QOAP/oQoPjqc9PNNqYb9xBdbb9Y/TT1YiCnme8urrrJzrUkgjeF2sR0NmLBfVk0tnsE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/EVVXZDchX4B0m3cVmw9qsxv+U19zScMU6Av2FbhI4OXaaN+
	AQAYB9uej4HRhUzya9OSlFxJ20D4Jit9hn5Z+SpOXCfwtwSKbt6ULzEhg0zFqmB9/g==
X-Gm-Gg: ASbGncuXGuEIbLrNP71VvkpR6uauGehhJTkFmVSWPfiBlJcc4EhAwFfkQJiFd9Rjvvj
	ymnsr4KJKVxvGObtHAY3fSEDpP/2iIFdWfcPy+wqJDjfQAAO1BMxnHjn0xyuwNfb4SKJOMk+n74
	mAlyYKFb93k30tHK5vCBsobSfLBDirisk7GAe44w1HPLux2nYItJCqMd8JbkBSiFIQJkV86Khuo
	9ROUKqP+vOBoAkfm7bISBdmJ9MY09QAVfxpFgsocUVrHLgK3g8DgfyaA3+MjUFYliDRDQg7Ku9t
	6pHzlLjtetRkL8CKjM05voHG9Np37NA/065P+TiSXhicreRVvzjv7aNWYBpd9BbPB2vXqI/7Mj4
	VV1gUcf2V/UCKbo8L0AxGWOdEheo=
X-Google-Smtp-Source: AGHT+IH7hVHc0tlAgXxgFaCxYRaYIJQ3DQ+FY7DmQvhi6XPfShjmFssaz9Z/mtpKobWUSTQxJxN8MQ==
X-Received: by 2002:a05:6a20:e68c:b0:1f5:889c:3cbd with SMTP id adf61e73a8af0-21ad98b31f0mr31767222637.35.1748973865748;
        Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-747afe966d4sm9999195b3a.11.2025.06.03.11.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:04:25 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:04:21 -0700
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
Subject: Re: [PATCH v1 0/7] Setting the scene to convert the timers into
 modules
Message-ID: <aD85JdXveNWlWDn4@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-1-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The timer drivers are all compiled-in. The initial pre-requisite is to
> have them available as soon as possible in the boot process. While
> this statement made sense a long time ago, the platforms have today
> multiple timers for different purposes along with architected timers
> which are initialized very early. For example, a timer can be used as
> a backup timer when the local timers are belonging to a power domain
> which is shutted down, or used a watchdog timer when the counter are
> shared, or also as a pulse width modulation counter. Another use case
> is the platform user may want to switch to a timer different from the
> architected timers because they have interesting characteristics in
> the context of a dedicated platform (eg. automotive).
> 
> In some existing drivers, there is already the code to load and unload
> a timer driver even if the Kconfig does not allow that. It means, the
> need is there but partially upstream.
> 
> There were multiple attempts to configure the timer drivers into
> modules but it faced the fact that we were unsure if it is correctly
> supported by the time framework.
> 
> After investigating deeper in the core code it appears we have
> everything set for the modularization of the timer drivers.
> 
>  - When a clocksource is registered with a better rating, the current
>    clocksource is swapped with the new one. The userspace allows to
>    change the current clocksource via sysfs
> 
>  - A clocksource can be unregistered
> 
>  - When a clockevent is registered with a better rating, it becomes
>    the active one
> 
>  - A clockevent can not be unregistered
> 
> A timer driver can be loaded later because of all the supported
> above. However unloading is unsupported because a clockevent can not
> be unregistered and that will lead to a crash.
> 
> But if the timer driver has the module owner set, the core framework
> will handle the refcount correctly and will prevent to unload the
> module if a clockevent is registered. All the refcounting is working
> in different use cases.
> 
>  - A clocksource is the current clocksource, the refcount is held
> 
>  - A current clocksource is switched to another one, the refcount is
>    released
> 
>  - A broadcast timer is registered, the refcount is held
> 
>  - A local timer is registered, the refcount is held
> 
> Consequently, it is possible to unload a module which is only used as
> a clocksource. As soon as a clockevent is registered, the refcount is
> held and can not be released thus preventing the module to be
> unloaded.
> 
> That mechanism ensure it is safe to convert the different timer
> drivers into modules.
> 
> This series adds the module owner in the different driver which are
> initialized with the module_platform_driver() function and export the
> symbols for the sched_clock_register() function.
> 

Thanks Daniel for taking the time to dig into this deeper to help identify how
we can safely convert the timer drivers to modules! The series LGTM. I'll go
ahead and address the review comments on my MCT series and rebase it on top of
your patch series.

Thanks,
Will

<cut>
