Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B41C3C11
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744802160; cv=none; b=QUMI6ki02v8lSIfw7+UfmVvQRqHmmt3Sg9qY8oMhGlGELtRq6BAANZOccbxf8KlUzZ/cQ1/RlpWG+HuGRSIZgF368eO5YazvSr+I/r/KN+8vYw8g32LQg8c5HlcOynCtHoWMcz2TYsOlrgeEr3hgd43lEPd6sd/MtoLbFCSJ17Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744802160; c=relaxed/simple;
	bh=ILF0PYFRt+5/SS1jz79P/tqDZ1CqNJprncxTwdpLR5A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MHTZmw8x5TFplQThsjo0tKr0w5zrXdnWDZYMF5Bw01yP2juaS0N0yXdUw2SPybEzm0lD0EMbB5oVcSVu4LoLtkoqXEyYSeLur2OWz4TLJZa9ouWF7pyJiYTbJDVox3QgKamDg5mbk6Ii/9Ut9XfyiYvugESRMXKSDtRRAOuOeZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ayUyWNK0; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ayUyWNK0"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cf257158fso47314915e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 04:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744802157; x=1745406957; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WgM3WwWzThIQV3Fv3N07LVNHJbc+37PYi8/8xrP5FMI=;
        b=ayUyWNK0pV7bTfXnWDUf4FcGsGxY1g06ZwgZiSgQC3nKYdU5/NblAG0gtwWUrC6og+
         0jfuWaERByNB3NxJ1uNSVrQYt9V6baHF8abb1Upngf6OkaimKOUwKmakG+bZxLWUs4SU
         l49XHj95w3vHO1n9Nu26jD+WpP4SYUZKpWG77muZPHMCKQmqtk6eXYKfXASlVEmwvSFO
         ExSt/WGXvEZT7nj7yHxUZ8/7EWy4nyz4ZK8ns+gVxRFN55Cg/UzmvjTBnbRNJTcrrkXG
         VTVGI7jpOG9eZbhsJNx5lm7UhTDIgFssUhhOKxKacAMdLWSV7TTAQrTcHF67SbVq1ZRt
         69+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744802157; x=1745406957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WgM3WwWzThIQV3Fv3N07LVNHJbc+37PYi8/8xrP5FMI=;
        b=lxqtwMMsVIyIgDozFRLgFGHsgXxYRJYJ2heaCU7Y8SluJEPkQOlPaS0ETpnA6FDIm1
         HbvEEAG5NRiNrvEgsoAM560Pltambh5IUe7Q95TLNpZZrxRdSjXdc7JaXzLN5PbFAhiG
         ZEhM5AKBNdhcj1LtHDbggCq+fQiz5q5/7HJr1y+FshFNPKX8TesASsggNUcm4Tj/kEfi
         A2qpCa7n2CVM/0vEUKN62QVBxtueE8J1ppT3ItHnXEFyAL2Sr+WsFYCXPuI5o8bhmk2S
         JuZzc05Sp0TIKwDWXVGi9QvgWCYe1xruwGRGF0ox5k3/edTymft2JtEYPmjHcKGQ+hm2
         nIYA==
X-Forwarded-Encrypted: i=1; AJvYcCWGAQjiiL0rBUKJrRkfkIJ9jmeBgeeez5BBe9QFF97++TbyrsPaHUIfYRnDdpznXLkgPMM46F0U6OQcvoQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA/459qzrO7xqJ6N6Np8vOA7V1qTbA8lp+AfINCITCX7vjooB/
	lkGooo/O044ddFNg9dCZXaT1am6SHskvRGZpe11aBMfwHs+W8aJsL87K+y12Gjg=
X-Gm-Gg: ASbGncso8S/XpOhjqts0V6CKMOfWyS9xIdur3Vak+F++u+FnIvINIuUxyeB7GNoyZZ0
	VS4SH/eKK1v67M5Eu8qIn+WaoN1hHFnzrm64EC3McTT9oJEylfTdhg1nibtr6nwSwF90V9Funes
	Ji+VqIDOqaOStt15NQmVnnEZCz0M8t6bLw4ThpHaWwu+81oTHTNyn+FBq69EViSsv8PQTDZNGUi
	UO26TKtwIfyxf4mRxGQVDFdfCV6R6H/oHlcNC/GQC9HXO0kVFqmN5HDG1z+Mnnhwnh4TP2oF5Qq
	He8UP6x9WfzP2sc8aQBrq8lryG0pepXAlAOADNNsbmHX9l9dpin7WIugcPhleHhqKwcaQveV7RK
	Gm2A=
X-Google-Smtp-Source: AGHT+IEz+GCuPAXQGEykmoJh7ndtzRsRPw1jC68sVNImIJaJ+XeAMgd2XZHAT5eJI2F3fj9jTKhaKg==
X-Received: by 2002:a05:600c:698d:b0:43d:26e3:f2f6 with SMTP id 5b1f17b1804b1-4405d5fcdbcmr13829375e9.5.1744802156679;
        Wed, 16 Apr 2025 04:15:56 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4405f583bcesm5988575e9.3.2025.04.16.04.15.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 04:15:56 -0700 (PDT)
Date: Wed, 16 Apr 2025 13:15:53 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: William McVicker <willmcvicker@google.com>
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
Message-ID: <Z_-RaYcXHR9--zXA@mai.linaro.org>
References: <20250402233407.2452429-1-willmcvicker@google.com>
 <20250402233407.2452429-7-willmcvicker@google.com>
 <Z_6OZHYfC0bC5289@mai.linaro.org>
 <Z_7O1xi2-ZGhJ1r_@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z_7O1xi2-ZGhJ1r_@google.com>

On Tue, Apr 15, 2025 at 02:25:43PM -0700, William McVicker wrote:
> On 04/15/2025, Daniel Lezcano wrote:
> > Hi Will,
> 
> Hi Daniel,
> 
> > 
> > On Wed, Apr 02, 2025 at 04:33:57PM -0700, Will McVicker wrote:
> > > From: Donghoon Yu <hoony.yu@samsung.com>
> > > 
> > > On Arm64 platforms the Exynos MCT driver can be built as a module. On
> > > boot (and even after boot) the arch_timer is used as the clocksource and
> > > tick timer. Once the MCT driver is loaded, it can be used as the wakeup
> > > source for the arch_timer.
> > 
> > From a previous thread where there is no answer:
> > 
> > https://lore.kernel.org/all/c1e8abec-680c-451d-b5df-f687291aa413@linaro.org/
> > 
> > I don't feel comfortable with changing the clocksource / clockevent drivers to
> > a module for the reasons explained in the aforementionned thread.
> > 
> > Before this could be accepted, I really need a strong acked-by from Thomas
> 
> Thanks for the response! I'll copy-and-paste your replies from that previous
> thread and try to address your concerns.
> 
> >   * the GKI approach is to have an update for the 'mainline' kernel and
> > let the different SoC vendors deal with their drivers. I'm afraid this
> > will prevent driver fixes to be carry on upstream because they will stay
> > in the OoT kernels
> 
> I can't speak for that specific thread or their intent, but I can speak to this
> thread and our intent.
> 
> This whole patch series is about upstreaming the downstream changes. So saying
> this will prevent others from upstreaming changes is punishing the folks who
> are actually trying to upstream changes. I don't think that's a fair way to
> handle this.
> 
> Also, rejecting this series will not prevent people from upstreaming their
> changes, it'll just make it more unlikely because they now have to deal with
> upstreaming more changes that were rejected in the past. That's daunting for
> someone who doesn't do upstreaming often. I'm telling this from experience
> dealing with SoC vendors and asking them to upstream stuff.
> 
> With that said, let me try to address some of your technical concerns.

I won't reject the series based on my opinion. Answering the technical concerns
will prevail.

Why is it needed to convert the timer into a module ?
 
> > * the core code may not be prepared for that, so loading / unloading
> > the modules with active timers may result into some issues
> 
> We had the same concern for irqchip drivers. We can easily disable unloading
> for these clocksource modules just like we did for irqchip by making them
> permanent modules.

In the clockevent / clocksource initialization process, depending on the
platform, some are needed very early and other can be loaded later.

For example, the usual configuration is the architected timers are initialized
very early, then the external timer is loaded a bit later. And when this one is
loaded it does not take over the architected timers. It acts as a "broadcast"
timer to program the next timer event when the current CPU is going to an idle
state where the local timer is stopped.

Other cases are the architected timers are not desired and the 'external' timer
is used in place when it is loaded with a higher rating. Some configuration can
mimic local timers by settting a per CPU timer.

Some platforms could be without the architected timers, so the 'external' timer
is used.

Let's imagine the system started, the timers are running and then we load a
module with a timer replacing the current ones. Does it work well ?

Are we sure, the timer modularization is compatible with all the timer use cases ?
 
> > * it may end up with some interactions with cpuidle at boot time and
> > the broadcast timer
> 
> If I'm understanding this correctly, no driver is guaranteed to probe at
> initialization time regardless of whether it is built-in or a module. Taking
> a look at the other clocksource drivers, I found that the following drivers are
> all calling `clocksource_register_hz()` and `clockevents_config_and_register()`
> at probe time.
> 
>   timer-sun5i.c
>   sh_tmu.c
>   sh_cmt.c
>   timer-tegra186.c
>   timer-stm32-lp.c (only calls clockevents_config_and_register())
> 
> So this concern is unrelated to building these drivers are modules. Please let
> me know if I'm missing something here.

We would have to check each platform individually to answer this question.

The interaction between cpuidle and the timer module is about not having a
broadcast timer when cpuidle initializes and then having it later when the
module is loaded. Did you check the deep idle states are used after loading the
module ?

> >  * the timekeeping may do jump in the past [if and] when switching the
> > clocksource
> 
> Can you clarify how this relates to modules? IIUC, the clocksource can be
> changed anytime by writing to:
> 
>  /sys/devices/system/clocksource/clocksource0/current_clocksource

The clocksource counter is stopped when it is not the current one. So when you
switch it, the new clocksource counter could be different and can make you jump
back in time.
 
> If there's a bug related to timekeeping and changing the clocksource, then that
> should be handled separately from the modularization code.

I disagree :)

The whole point is the time framework may not be totally immune against the
timer modularization. It is about identifying the corner cases where the timer
driver modularization can have an impact and set the scene to support it.
 
> For ARM64 in general, the recommendation is to use the ARM architected timer
> which is not a module and is used for scheduling and timekeeping. While the
> Exynos MCT driver can functionally be used as the primary clocksource, it's not
> recommended due to performance issues. So building the MCT driver as a kernel
> module really shouldn't be an issue and has been thoroughly testing on several
> generations of Pixel devices which is why we are trying to upstream our
> downstream technical debt (so we can directly using the upstream version of the
> Exynos MCT driver).

The discussion is not about only the Exynos MCT but as you are not the first
one asking to convert the timer driver to a module, we should check what could
be the impact on the time framework and the system in general.

Others proposed to convert to module and I asked to investigate the impact.
Nobody came back with a clear answer and there is no feedback from Thomas.


> [...]

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
