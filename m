Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFA23D3B8
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 18:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748973693; cv=none; b=D8cNxraUfOr1Qmz7i+pi2fF3uijHsUrRSKEQ2ZeEG1HlCEJRGQToizHWlu1dgq3Tyqc2ew+jfrjL1ii3A2jv1NeF+5vPYeD1WIMeOb5W+fFyUFQ6NfcfaFAV32KL+d0mzG6X0dXlazCYLxgfwANCOQ1wsFxTYvTTFKDJ+QCRUac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748973693; c=relaxed/simple;
	bh=2dyMbRz1h7s7edNrWCTXDbYuBWjwzW91GnsgeY0rtXI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FQtMYZ8zg1rVUYgdbK9ELsmkfvfLkh0K+hj37nmy/+50b1N80Azeo+33LReQfpq03IV1ZWELY+UcuIssZ+lVePoAYLO++H17jJ+sgy00h7HnGZfFXwstrJBRrL0gYO1ZzhnC0Px9T2skSkh+x3L61FcXT5jFtsk0Zr9kb4NG9qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M9sg7lLP; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M9sg7lLP"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3122368d7c4so4667693a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 11:01:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748973691; x=1749578491; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=M9sg7lLPk1EeherbHWIWt8jSEd1Iqy2v8XSxNICn72cIQDij7UlXQbLLzjGtkYPLdz
         ePJEiyIpForhngS3UGLObw2qCENh9/V5HAhV8HFAjv/HYQgcVYPguKDby1nIcoq4zLmx
         gMfjjrXRZkk9ZK67g07jrHyggnTcHtf6UZM6SnUWy7yvwncFMcXfkIPY1wn1ttjibkOG
         7rmOXE/rAhdgpvsN3Mr+NtoGRUxsbTD0djzgl3xrLvfdh9BogOMi9eDichX0dS5yuTKX
         gouv6iIY/4MNHy2vp5Nf5Raf9vgZCqU6Vm4NrcvyRQtcA8rfJwVwdVmFxkJPIZNzx7Vl
         K87A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748973691; x=1749578491;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Oio5+oLisctncuh+HzW9YUjFC1egO1KiH1XNbWO+K7k=;
        b=nUlQd1vo9xJEaCvGvxstkS8w6h55ZAEqW4+KA5iq8i/xUTBGbZnHPQJywfRBX1LkHK
         HoTxHy127BrXWr3g4LDIY10QWHDJROzhLWobKLeo0/ImpyT5cVBL2hexdKtBRA7nMbn5
         RNnhuP4u8jkre9p7fmdiiHCJ2ro9ib6nVo4yWXOSYoT7GaoklsfG18x8rpuGNfmi67dP
         cpeKBkSrOqysKAf0PrhyrOvt4AHCSsg6gplRjHzysP40uEGZsRZrxUYK2nD8dIJLizNM
         QmcwO+Bv6ZZvIF1rnBzDEss4VqRHug6LqKgELlVyAvrPkAkZdT2IP64dbisqGMgOL09e
         JlXA==
X-Forwarded-Encrypted: i=1; AJvYcCVowF4a3jwGdCDz9Or4q3ld7sKfQd/aY99p8mGQU/l9Hp3AEFS+13zGC52Ym9QEzOPxsb40bL9R8o5eN5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLiL5EZzmSaciqgb5KrXUGTgJabAPtrNKVU33I6HsUwSY81MxM
	0jTJ9vqlU/8EBFE/5nNc+0jhRMbLaY9Fdevku8zieoJUIiCsXztD6G2NrMq/olT+qg==
X-Gm-Gg: ASbGncuHnWUTDeUy0xFIvgFdWs8/WseakemazQfApCxHcXonpAb7wCbe3zgUVEtBuF5
	LBBM4ARbbjfVYJzuwRFQZX4djP7lL5Ng0gDnrzJMQ89vQxfsav0m+yVj5kL3LDHodfg9eoRIKQ+
	G1dT7U4XOnQg9+SAbQGV49e3nHf4qMV5JOwRn4zQj6AsQA2YkkMHN/gwFfmzzHdPw5xTwThB77i
	fYWvdAjJo/fudvWNSaySMkoW0Rnd/tjdyxKpCJgowZg9SkBQHqnC2gGXBZE0AXvamIvcF8lb7YH
	WcAFClLYCWufeKR/N7emceGNbHWzkGyDms3DQn5DAgcufj671B86A9wQJwj/DtHjAdd3PtF/K74
	hmbkV7IE5XQHHGWfx17PvrkuybfQ=
X-Google-Smtp-Source: AGHT+IGJVe96mQDhzEhZqYJnC27O9vMFUAoTp1xS/H2NANso8WpCr6YJ9fd9Q8qaZg1NI2W+7g1xJw==
X-Received: by 2002:a17:90b:3f10:b0:312:f263:954a with SMTP id 98e67ed59e1d1-3130ccaa125mr73097a91.5.1748973691331;
        Tue, 03 Jun 2025 11:01:31 -0700 (PDT)
Received: from google.com (128.65.83.34.bc.googleusercontent.com. [34.83.65.128])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e29f899sm7572695a91.6.2025.06.03.11.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 11:01:30 -0700 (PDT)
Date: Tue, 3 Jun 2025 11:01:27 -0700
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
Subject: Re: [PATCH v1 7/7] time: Export symbol for sched_clock register
 function
Message-ID: <aD84d4WArf_terBP@google.com>
References: <20250602151853.1942521-1-daniel.lezcano@linaro.org>
 <20250602151853.1942521-8-daniel.lezcano@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250602151853.1942521-8-daniel.lezcano@linaro.org>

On 06/02/2025, Daniel Lezcano wrote:
> The timer drivers could be converted into modules. The different
> functions to register the clocksource or the clockevent are already
> exporting their symbols for modules but the sched_clock_register()
> function is missing.
> 
> Export the symbols so the drivers using this function can be converted
> into modules.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Reviewed-by: Will McVicker <willmcvicker@google.com>

Thanks,
Will

> ---
>  kernel/time/sched_clock.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/time/sched_clock.c b/kernel/time/sched_clock.c
> index cc15fe293719..cc1afec306b3 100644
> --- a/kernel/time/sched_clock.c
> +++ b/kernel/time/sched_clock.c
> @@ -174,8 +174,7 @@ static enum hrtimer_restart sched_clock_poll(struct hrtimer *hrt)
>  	return HRTIMER_RESTART;
>  }
>  
> -void __init
> -sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
> +void sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  {
>  	u64 res, wrap, new_mask, new_epoch, cyc, ns;
>  	u32 new_mult, new_shift;
> @@ -247,6 +246,7 @@ sched_clock_register(u64 (*read)(void), int bits, unsigned long rate)
>  
>  	pr_debug("Registered %pS as sched_clock source\n", read);
>  }
> +EXPORT_SYMBOL_GPL(sched_clock_register);
>  
>  void __init generic_sched_clock_init(void)
>  {
> -- 
> 2.43.0
> 
