Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6E82505A9
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 21:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744752349; cv=none; b=UpJbWvbwr9DmJsDMlOXFkBKpdsmDWbCM/OxBYr6g7h8zTms3TT1opBviwREnkQbtoMvLXH7/IU8nBZGRAj4t0q7t6yz3TLxCmgniMXm7I4XBLccao0fpjr2rDaz8ctQbry7q78zRmLi0c9M/P2cwY44tuZicvF72V2L2ruNNVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744752349; c=relaxed/simple;
	bh=JwU8AHx8PeAN8AtgSHA3D7DJk5pbqTcZbLy8XxPRcck=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DB329EkBQweqXvQ/N+xNE1IwEyrDJkDnVpAjCZT4DnBKuoll/hXzyrrAYt3wUkg/+VIuL+CuAzLpegR9FHETBfHYn5wVBY8haGVDIqDH1vedonq/N8pEZaBBRoRr/89wDYknKF9Xz5z1CKB01Fqh2EFx7/EuedW+Pe5BIznozFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iCIksnsj; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iCIksnsj"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2254e0b4b79so82805875ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744752347; x=1745357147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=UwJG8J1iyTH8V+SfRmZi+ISFZpJOYpkT7vaEBR18O5k=;
        b=iCIksnsjKqkhihQIYg19sKVmkq2e+Jia7Bpsluw2ZFQvTCM9GvurtEAF6sHTCQcofI
         yDrKpBRuYYxFBnyeVi+2R3WvQtiXdqlrhE2so/t1sU6NC0wQW9xd7Xw8towIAWmyGdMq
         H6B5AsLNwBu4iPDTvSJCJ6zDB5UlQeqd2H8cHy6qiS178s+fU3TAd0fOF6f1i29ZNTYP
         KS6iGzAKr36q9cZGrx6uiUwA6dicdQu4ckd0ebtSmIzGJQzmuG0TFqiBpucAjst9gyWA
         /q2GXEQYpBhlj+0hnHWGQ/psUG54gQtQplCpj36EMT8nmKkVhQItC9/HpdYREPeFF0BX
         +vfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752347; x=1745357147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UwJG8J1iyTH8V+SfRmZi+ISFZpJOYpkT7vaEBR18O5k=;
        b=Anwt5f/FMivSZrZcZlo8kuyG7Q78edxu1sZGBDg732hn5kT4ujKnH+RSeZW183vahL
         qJQo7jiiCHWaQsJdzfPARpbMI1uhbsGqh6OXrHUObbMrxwQpqx19CmISANxpaUP/tV9k
         XX8G7c/wULo0N+Pe0NGNp3w7AjriyAeacCM8LN/BgJTnmpTSTO0KII80QiXqZ2F6Ao1R
         S8VO4uNJKahKoui7e+EGyWvRsmkU3uydRFXfXvhA0yS4ZW/ggPnTmyl5l/kNywnCooN0
         BB/75/crdjWghH7GwztKq/cn4SzAcj3YZYNE3MMIbhBdyTF8CD9Ovqafyz7bitAzYQr1
         ODig==
X-Forwarded-Encrypted: i=1; AJvYcCUefIyiMQgmBkpDyIJdds+oDkexpBVF/TSSMoZhqipWQ3EIdSvTyD0HxgkkYkXDbOVLi9+lD8mfh76CpRs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhR61ubsz97jwhe+xk+ELQR72h7r3cRcZ+PIMySkp6dHHqqp/r
	afwLLMr4/0BB7w+T/lvRWA1LBBGf7vr5kSDefhgcwvDXm94/WA0qFCW7fhL6Hw==
X-Gm-Gg: ASbGncskqUQFdbdVkp+z3QYBHQLPs9obfGsqyZ7LZDKqxUU9H3yS2iLOl4kkE2ai6jX
	ph9xZ/YdfLeoO5dam0mdJDLMeNPCLPkS8kBw1P38dhdY7b53FdN25tJlQGZJzUy45I1EbNEoON0
	Ht4faxEdB2CFi+h5YFTypoQ6/djaPxlyxs/khccAWqBVVGqC8ghgQvtVHLbSLQYPreFGXSnCG8y
	OUyixdfnH47IRBX+UfOfHwaiHVm+NoTfHqH2Ju7HrnSq/+mdUnTLzHL2kynXhyOLKqsWoRz6i/n
	ysOg+phdV4wRJOpuzxdX3RIzffUHyNKGsSQ7B0Aq+6h1PsghY9LoVisCRfRnsdELj7sHtW8r2Mx
	kCJYGug==
X-Google-Smtp-Source: AGHT+IFbV5rZHgTJXmvY63NNUPHF83MLOSfyfSDJgneqMsKOmSCLVHVGlipkv2ZUH8ySI1osZFQGUA==
X-Received: by 2002:a17:902:ef4c:b0:224:f12:3734 with SMTP id d9443c01a7336-22c319f7f6bmr11029435ad.30.1744752347289;
        Tue, 15 Apr 2025 14:25:47 -0700 (PDT)
Received: from google.com (7.104.168.34.bc.googleusercontent.com. [34.168.104.7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd230e8b1sm9292900b3a.148.2025.04.15.14.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 14:25:46 -0700 (PDT)
Date: Tue, 15 Apr 2025 14:25:43 -0700
From: William McVicker <willmcvicker@google.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Donghoon Yu <hoony.yu@samsung.com>,
	Hosung Kim <hosung0.kim@samsung.com>, kernel-team@android.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Youngmin Nam <youngmin.nam@samsung.com>,
	linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/7] clocksource/drivers/exynos_mct: Add module support
Message-ID: <Z_7O1xi2-ZGhJ1r_@google.com>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_6OZHYfC0bC5289@mai.linaro.org>

On 04/15/2025, Daniel Lezcano wrote:
> Hi Will,

Hi Daniel,

> 
> On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > From: Donghoon Yu <hoony.yu@samsung.com>
> > 
> > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > boot (and even after boot) the arch_timer is used as the clocksource and
> > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > source for the arch_timer.
> 
> From a previous thread where there is no answer:
> 
> https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> 
> I don't feel comfortable with changing the clocksource / clockevent drivers to
> a module for the reasons explained in the aforementionned thread.
> 
> Before this could be accepted, I really need a strong acked-by from Thomas

Thanks for the response! I'll copy-and-paste your replies from that previous
thread and try to address your concerns.

>   * the GKI approach is to have an update for the 'mainline' kernel and
> let the different SoC vendors deal with their drivers. I'm afraid this
> will prevent driver fixes to be carry on upstream because they will stay
> in the OoT kernels

I can't speak for that specific thread or their intent, but I can speak to this
thread and our intent.

This whole patch series is about upstreaming the downstream changes. So saying
this will prevent others from upstreaming changes is punishing the folks who
are actually trying to upstream changes. I don't think that's a fair way to
handle this.

Also, rejecting this series will not prevent people from upstreaming their
changes, it'll just make it more unlikely because they now have to deal with
upstreaming more changes that were rejected in the past. That's daunting for
someone who doesn't do upstreaming often. I'm telling this from experience
dealing with SoC vendors and asking them to upstream stuff.

With that said, let me try to address some of your technical concerns.

> * the core code may not be prepared for that, so loading / unloading
> the modules with active timers may result into some issues

We had the same concern for irqchip drivers. We can easily disable unloading
for these clocksource modules just like we did for irqchip by making them
permanent modules.

> * it may end up with some interactions with cpuidle at boot time and
> the broadcast timer

If I'm understanding this correctly, no driver is guaranteed to probe at
initialization time regardless of whether it is built-in or a module. Taking
a look at the other clocksource drivers, I found that the following drivers are
all calling `clocksource_register_hz()` and `clockevents_config_and_register()`
at probe time.

  timer-sun5i.c
  sh_tmu.c
  sh_cmt.c
  timer-tegra186.c
  timer-stm32-lp.c (only calls clockevents_config_and_register())

So this concern is unrelated to building these drivers are modules. Please let
me know if I'm missing something here.

>  * the timekeeping may do jump in the past [if and] when switching the
> clocksource

Can you clarify how this relates to modules? IIUC, the clocksource can be
changed anytime by writing to:

 /sys/devices/system/clocksource/clocksource0/current_clocksource

If there's a bug related to timekeeping and changing the clocksource, then that
should be handled separately from the modularization code.

For ARM64 in general, the recommendation is to use the ARM architected timer
which is not a module and is used for scheduling and timekeeping. While the
Exynos MCT driver can functionally be used as the primary clocksource, it's not
recommended due to performance issues. So building the MCT driver as a kernel
module really shouldn't be an issue and has been thoroughly testing on several
generations of Pixel devices which is why we are trying to upstream our
downstream technical debt (so we can directly using the upstream version of the
Exynos MCT driver).

Thanks,
Will

[...]
