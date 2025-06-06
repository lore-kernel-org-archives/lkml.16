Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED375286D72
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212521; cv=none; b=ja2MNtLY3CnFFoOB1ekSKg8gxCvXqghhskeERGal1ppBLESqxmKLu72lEjJlSHPJI0r1Wa7+Esr8iAWzBSo9Cq3efTrF3UdpFJH1B5nZwi0B61lMsBVJ1c/14CHm3VPSkgM2Musoo5xJGfLsrEJ8tYsIPHPqYfS5wlJB3vZms6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212521; c=relaxed/simple;
	bh=nZRE9jMK6GJm014fdSyKTgnZ//JZUiXylfSpJYVDtNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xp26iMjkRW9ZxExGOvi6vy30Hsvh7KXMpzi+UcqLXk6ciGWJW8hSg5w4sBgxQJUICV15iyt5oruS2qFruP0SkupxtL8nWdeB51gIpAC1iSLkAcJAKnzldPJeVtEVJMI9jOnFhsao+m/dAcSPmbU+SzcT6AJRhCA1izh/Lcod+WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VItbd/rW; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VItbd/rW"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-604bff84741so4051124a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749212518; x=1749817318; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kUcUCGpt2P3y/QMzABkuyFHR7tmd84+UCxMipLCW7j0=;
        b=VItbd/rWgaKnkmx223P8oCibjoVCn5jHC84myLG3yQ+Km/njzh6OblUOlnQUSK6PIt
         OkTP7Br4scoG9SZzq9+wTq1Qi/rAvqlsUio+6S07GWAwTXT0sH8LszCDTdOsMb9rDnZ4
         9icxqjCWs/ZY9gCvy6uifsBrEPjWqtO/Q2dh7OwUUtMQvkp6ACvYUCfMps2Ptxvuo/Lo
         4+En69Tjy4r/t7inz1aTTPaFTqqOWkMRdsDYX4ar/MetxMz82GfW2IH8SsD8RI3PtzOS
         qZXduWFAfyxaQURI5u1m19oc64MG9daEw/S72PPhNPKd16WNt0DnjILzoh9THOXm8Cdj
         SB3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212518; x=1749817318;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUcUCGpt2P3y/QMzABkuyFHR7tmd84+UCxMipLCW7j0=;
        b=Evxqtc+Rw+LvW1U3hv7Zi488hlcTqkpGhVhAH15XTyHccIbx0qMHkL1nGH4yombaGY
         5ortASy3F5da4EX3Wpb1rRpCJ1dysuf4sy3WaFJFd91UMGGSb/dQInXXh+70YpaNErrl
         SFVRQqoy225sOnRCPMKF6WaBsen04i3jWAIB3CM+tcQaZ0ExVL0gKwzBLmhWZTQnp04V
         RaCcdNWstyx9YJ0nTGW3Bo4Xzn1VOqJhtXjno0T5TCLx00dA2eqKnez8FKN0KMTa4Oge
         deaOz8ZxhpH0EDCY84KNRLMTwWOO3EwVI1U6HbcayzbyjfY/fkvwkja6aHccbGq3gR9J
         N2Hw==
X-Forwarded-Encrypted: i=1; AJvYcCWXlKk1HB7+3ZzBa0Jy5zfY4G8/bwCOnfcQCTxqtwlVZnSXLT9Y8dMGcr2SFG6q/3i0sK2xm2e3i17aIF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVOEgK0p54a9+a+aYu9ZLxQekyQXJgc5yTwOrZva/fy60zsrp+
	3LDvZP8RmM4VtGzr+axev5BCsawL0SoGyC9XkbcAEtvoelvzuX7mEnRz/7uo
X-Gm-Gg: ASbGncuzwYRbLHCWUolEKjylLRFTjOsIHHmkuAznH1EIC4qtJPqeX74BK1OyzRFXmUx
	gYhyea7+GtTZ6m2nOCbyz9sbGI3rVi9q8Seo7+ZqtDU4/tphjXIUumfEHpytYSA4Xb4b+orDadt
	qzJjwhL2HLc84anxjj/v9oewF50Xj4PGOTA8jEvXPPxy2ICjei3Vm4UXLuF49IecGFtLWgi0DHh
	YF55Cp9JO0dVs/J5U75laWdbasN+nJKYaAHLczndj9XlJVeI8K2dRk0JmGSz8clxDUZWEZh3mve
	lD+IG/q2IxEFB5Gm0VjniWE/UOKrbFxPdbpDYCI1l4YIAuddQg4xJyuMmojASrH76yrGjyOFgkA
	fIWFeSo3Qoei0ZOSwQajC8DkIiMx0z7Hxq64=
X-Google-Smtp-Source: AGHT+IHQW6szGhy2I7Njh3emGhJdpYN5VryDQbhoUUYzhfd2Hd+ynaIMW6bluAR6kjU64A5DtZfPQA==
X-Received: by 2002:a05:6402:40c5:b0:602:15f:5883 with SMTP id 4fb4d7f45d1cf-607735130d3mr2442075a12.9.1749212517884;
        Fri, 06 Jun 2025 05:21:57 -0700 (PDT)
Received: from [10.203.235.164] (mob-194-230-148-44.cgn.sunrise.net. [194.230.148.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6077837eb84sm946175a12.33.2025.06.06.05.21.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:21:57 -0700 (PDT)
Message-ID: <24ec4adc-7c80-49e9-93ee-19908a97ab84@gmail.com>
Date: Fri, 6 Jun 2025 14:21:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] genirq: Retain depth for managed IRQs across CPU
 hotplug
To: Brian Norris <briannorris@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>
Cc: Tsai Sung-Fu <danielsftsai@google.com>,
 Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org,
 Johan Hovold <johan@kernel.org>
References: <20250514201353.3481400-1-briannorris@chromium.org>
 <20250514201353.3481400-2-briannorris@chromium.org>
Content-Language: en-US
From: Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
In-Reply-To: <20250514201353.3481400-2-briannorris@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/14/25 22:13, Brian Norris wrote:
> Affinity-managed IRQs may be shut down and restarted during CPU
> hotunplug/plug, and the IRQ may be left in an unexpected state.
> Specifically:
>
>   1. IRQ affines to CPU N
>   2. disable_irq() -> depth is 1
>   3. CPU N goes offline
>   4. irq_shutdown() -> depth is set to 1 (again)
>   5. CPU N goes online
>   6. irq_startup() -> depth is set to 0 (BUG! client expected IRQ is
>      still disabled)
>   7. enable_irq() -> depth underflow / unbalanced enable_irq() WARN
>
> It seems depth only needs preserved for managed IRQs + CPU hotplug, so
> per Thomas's recommendation, we make that explicit.
>
> I add kunit tests that cover some of this in a following patch.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> Co-developed-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Thomas Gleixner <tglx@linutronix.de>


Hi All,

It appears that this commit introduces a critical bug observed on at 
least some Qualcomm Snapdragon X1E/X1P laptops, rendering the suspend 
function unusable.

With this change in place, after successful suspend the device either:
1. Cannot wake up at all. Screen stays black, even though PM has existed 
suspend (observed by external LEDs controlled by PM)

2. Wakes up eventually after minutes (instead of seconds) with SSD 
related errors in dmesg. System still exhibits errors eg. UI icons are 
not properly loaded, WiFi does not (always) connect.

Example of SSD errors:
```

[   45.997238] PM: suspend exit
[   76.276320] nvme nvme0: I/O tag 320 (5140) QID 3 timeout, completion 
polled
[  104.945562] nvme nvme0: I/O tag 38 (9026) QID 2 timeout, completion 
polled
[  104.946170] nvme nvme0: I/O tag 147 (8093) QID 4 timeout, completion 
polled
[  106.354320] nvme nvme0: I/O tag 321 (3141) QID 3 timeout, completion 
polled
[  136.689693] nvme nvme0: I/O tag 322 (3142) QID 3 timeout, completion 
polled
[  141.428102] wlP4p1s0: authenticate with 50:64:2b:5f:e3:ba (local 
address=8c:3b:4a:a6:fa:f3)
[  141.428123] wlP4p1s0: send auth to 50:64:2b:5f:e3:ba (try 1/3)
[  141.433397] wlP4p1s0: authenticated
[  141.434303] wlP4p1s0: associate with 50:64:2b:5f:e3:ba (try 1/3)
[  141.438224] wlP4p1s0: RX AssocResp from 50:64:2b:5f:e3:ba 
(capab=0x1011 status=0 aid=2)
[  141.451828] wlP4p1s0: associated
[  149.984776] ath11k_pci 0004:01:00.0: msdu_done bit in attention is 
not set
[  160.635229] ath11k_pci 0004:01:00.0: msdu_done bit in attention is 
not set
[  165.873389] nvme nvme0: I/O tag 12 (500c) QID 7 timeout, completion 
polled
[  165.873478] nvme nvme0: I/O tag 526 (120e) QID 8 timeout, completion 
polled
[  166.026369] nvme nvme0: I/O tag 776 (a308) QID 5 timeout, completion 
polled
[  166.026406] nvme nvme0: I/O tag 704 (22c0) QID 6 timeout, completion 
polled
[  166.769312] nvme nvme0: I/O tag 128 (d080) QID 4 timeout, completion 
polled
[  166.858582] systemd-journald[452]: Time jumped backwards, rotating.
[  196.072359] nvme nvme0: I/O tag 45 (a02d) QID 2 timeout, completion 
polled
[  196.072429] nvme nvme0: I/O tag 778 (630a) QID 5 timeout, completion 
polled
[  196.072440] nvme nvme0: I/O tag 705 (82c1) QID 6 timeout, completion 
polled
[  196.904376] nvme nvme0: I/O tag 346 (215a) QID 3 timeout, completion 
polled
[  212.970816] nvme nvme0: I/O tag 129 (e081) QID 4 timeout, completion 
polled

```


This series was merged to linux-next on 20250516 introducing this bug.

Reverting commit 788019eb559fd0b3 ("genirq: Retain disable depth for 
managed interrupts across CPU hotplug") on either `next-20250516` or 
anything newer eg. `next-20250605` fixes the issue.

Tested on Dell XPS 9345 (Snaprdagon X1E-80-100), Asus Zenbook A14 
(Snapdragon X1-26-100).


Is it possible to have this addressed/patched up/reverted before 
6.16-rc1 goes live and introduces the regression?
It also appears this series was selected for backporting to 6.6, 6.12, 
6.14, 6.15:  perhaps this should be postponed/aborted until better 
solution is found?


Thanks in advance,

Alex

> ---
> Thomas provided a better suggestion than my v1, without fully-formed
> patch metadata. I've incorporated that as "Co-developed-by". Feel free to
> suggest something different.
>
> Changes in v2:
>   * Adapt Thomas Gleixner's alternative solution, to focus only on CPU
>     hotplug cases
>
>   kernel/irq/chip.c       | 22 +++++++++++++++++++++-
>   kernel/irq/cpuhotplug.c |  2 +-
>   kernel/irq/internals.h  |  1 +
>   3 files changed, 23 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
> index 36cf1b09cc84..ab2bf0de3422 100644
> --- a/kernel/irq/chip.c
> +++ b/kernel/irq/chip.c
> @@ -223,6 +223,19 @@ __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
>   		return IRQ_STARTUP_ABORT;
>   	return IRQ_STARTUP_MANAGED;
>   }
> +
> +void irq_startup_managed(struct irq_desc *desc)
> +{
> +	/*
> +	 * Only start it up when the disable depth is 1, so that a disable,
> +	 * hotunplug, hotplug sequence does not end up enabling it during
> +	 * hotplug unconditionally.
> +	 */
> +	desc->depth--;
> +	if (!desc->depth)
> +		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
> +}
> +
>   #else
>   static __always_inline int
>   __irq_startup_managed(struct irq_desc *desc, const struct cpumask *aff,
> @@ -290,6 +303,7 @@ int irq_startup(struct irq_desc *desc, bool resend, bool force)
>   			ret = __irq_startup(desc);
>   			break;
>   		case IRQ_STARTUP_ABORT:
> +			desc->depth = 1;
>   			irqd_set_managed_shutdown(d);
>   			return 0;
>   		}
> @@ -322,7 +336,13 @@ void irq_shutdown(struct irq_desc *desc)
>   {
>   	if (irqd_is_started(&desc->irq_data)) {
>   		clear_irq_resend(desc);
> -		desc->depth = 1;
> +		/*
> +		 * Increment disable depth, so that a managed shutdown on
> +		 * CPU hotunplug preserves the actual disabled state when the
> +		 * CPU comes back online. See irq_startup_managed().
> +		 */
> +		desc->depth++;
> +
>   		if (desc->irq_data.chip->irq_shutdown) {
>   			desc->irq_data.chip->irq_shutdown(&desc->irq_data);
>   			irq_state_set_disabled(desc);
> diff --git a/kernel/irq/cpuhotplug.c b/kernel/irq/cpuhotplug.c
> index 15a7654eff68..3ed5b1592735 100644
> --- a/kernel/irq/cpuhotplug.c
> +++ b/kernel/irq/cpuhotplug.c
> @@ -219,7 +219,7 @@ static void irq_restore_affinity_of_irq(struct irq_desc *desc, unsigned int cpu)
>   		return;
>   
>   	if (irqd_is_managed_and_shutdown(data))
> -		irq_startup(desc, IRQ_RESEND, IRQ_START_COND);
> +		irq_startup_managed(desc);
>   
>   	/*
>   	 * If the interrupt can only be directed to a single target
> diff --git a/kernel/irq/internals.h b/kernel/irq/internals.h
> index b0290849c395..7111747ecb86 100644
> --- a/kernel/irq/internals.h
> +++ b/kernel/irq/internals.h
> @@ -87,6 +87,7 @@ extern void __enable_irq(struct irq_desc *desc);
>   extern int irq_activate(struct irq_desc *desc);
>   extern int irq_activate_and_startup(struct irq_desc *desc, bool resend);
>   extern int irq_startup(struct irq_desc *desc, bool resend, bool force);
> +extern void irq_startup_managed(struct irq_desc *desc);
>   
>   extern void irq_shutdown(struct irq_desc *desc);
>   extern void irq_shutdown_and_deactivate(struct irq_desc *desc);
