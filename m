Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BFB01CEAA3
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 05:02:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749790963; cv=none; b=aVVDEzMT4a1FLvgpG3cIS1SjXOC4RFZVsOvAX/WtjrmVqhnBmppxf7UmPryfb+y0My2kmqZ6Z4Bw8edHKNQdeskwqYVrU7RL80uxN8vjx+LFA24HUc9/+tn3HtuJjzxnqXegFIPgwrsaT3zh1CD8AVxEQitZM78Cmw4pu5zWXHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749790963; c=relaxed/simple;
	bh=ih4/xa2KkoXBJlt31uSLZyLlwq1jhZSsfTgNn0bdHtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GNncFiUvUwA1JLJtcOOCjAWw1v0ekQoVLVbkaDxqSKgz9CYgY4pQ8olickrkgG8EOXRGx1Gg3wnlq6yuWdbIkslNQdy3oyyipdqslvh6L0h9aVmPvQMm6P3EA2/+nLn/SnfjNcxqDhMV4QrFLh8jbCEvvT2+GoUMtRYDZ9WQioE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e7+AeiJ+; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e7+AeiJ+"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b2c41acd479so1057631a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 22:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749790961; x=1750395761; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jcwj3yAJ7pyDvm1tu7+3gSa4GtMgtj32T0lLORRGnzY=;
        b=e7+AeiJ+JXm4bUDEBnkmFmycAFNIQzDYjFyG9D41XeqZbYpQtw8xFhrhXqgasF5vKH
         cYNorGVFZzi4LODtXSjAPNtzmOUfvvPo0HFA1/WXhUHZpQ+9JRoMw8ExWe+B9aJXFFYG
         iJZtsejoPUealEFFMN5v7wv5SaVkJ4PCZJTNn3UFJq6gLocSgEDVTpzWKevV1EKee/B+
         E89zX9m29iQVEpkUlXTrm+QbcUSi07SZoGIQCq8WU19kzY+pq+erTILdXUpU24ZhPxJS
         olYtEMKn3kAVzu47/hqOhPOjfc9NRhBfpnYAWxvK3uiDXNYr2hZHoOjDvX6x6FP/K/yz
         xMKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749790961; x=1750395761;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcwj3yAJ7pyDvm1tu7+3gSa4GtMgtj32T0lLORRGnzY=;
        b=FT433jJNtt/Sdq7UaDuWhAvQHRBr+qHv0gac5cIjfN9dW40e3h3G8q0yVE0mI568Ut
         FBZ1lqSiqS+PXXmc9GtWtvRk3NRdOSKdpHR/KsrOPC2WXxZKXJUkNBtl7lCpHfoOPmjD
         Ex6bNZGq3+HZCfovuSIQ2gQDg/312ndGeuUfw6yT43Y2p5GY6UaZIYYLxxEMuPuJQkS4
         m0offIHNfmrARmRXFUmLuE3ARHEzdulA+gZ5WY3arRxqPtL2EiXblC/BgSPcvMucJzRX
         NCJJ/kVDOkeQvOsy9mHLNDIjupfowSjwkZKpD5iIVLPA20qQcHNtULvWQ6G6mFELa4VP
         E0Fw==
X-Forwarded-Encrypted: i=1; AJvYcCUKLh/sLfa3AtaJODnyVnTL4xrcWyVkFDqmqpRZzo/83xoIbL0pktgocTgixUaDafPPamC4OGy2i2CFhKk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjQy7sH/8T+gQj3zwUs6KcrwdmCrun5t0vVkKIf65zNScQh4z1
	nhsJei5u63Nx5WsJeZoVvXnKNBoyofrwXAi/kN28d77IvnMzsAWRNU8P
X-Gm-Gg: ASbGncsTdZqRHdGv0rLc55lnWS8MmUBs47MqPrgoOVp1qkXtc865URH06z6S0DSxL/i
	yQORZEKSU9U4Sdxg1wL3ZMAEi62kO5ejA11fv8kgb1ztMIPiPcqAf46LyplqC+0Fqt2w94syzpb
	hIafcD2+Rn8N7nDwM40k8AmVcorH6xl97sSLG2mnjtlUQas1nTfbNVx19Y33hWKstWZNhv0C0d9
	6Amq741wXxxYxh+LUxsOQv0jO3IKKv4lj33rGNThykdJN7tCf+IWcReNy9Nn/QbtjTHiHmamKFI
	26Zv2+4bQfNAhVC17Gzj/JJJHMOUFOSgMc8GiZyQQmJWFx3NWSl73N2I4SftfQ==
X-Google-Smtp-Source: AGHT+IHj9asMbod66o6NA5yopeZ8imOgK1x8/waa6ZVfyYqH+0n6eUNCQ3F6hlYMLPVZggDbqcln+Q==
X-Received: by 2002:a17:90b:56c4:b0:311:9c1f:8524 with SMTP id 98e67ed59e1d1-313d9c7a6bamr2790183a91.15.1749790961390;
        Thu, 12 Jun 2025 22:02:41 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de782fcsm5915585ad.104.2025.06.12.22.02.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 22:02:40 -0700 (PDT)
Date: Fri, 13 Jun 2025 01:02:38 -0400
From: Yury Norov <yury.norov@gmail.com>
To: I Hsin Cheng <richard120310@gmail.com>
Cc: linux@rasmusvillemoes.dk, jstultz@google.com, tglx@linutronix.de,
	sboyd@kernel.org, linux-kernel@vger.kernel.org,
	eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
Message-ID: <aEuw7ls9hieUv_Ox@yury>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613033447.3531709-3-richard120310@gmail.com>

I Hsin,

This exact change has already been submitted by me and is under review.

https://lore.kernel.org/all/20250604232550.40491-2-yury.norov@gmail.com/

I don't understand why are you undercutting my work, and moreover do it 
for the second time.

For the first time you submitted something that duplicates my another
patch from the exact same series. John Stultz has pointed that, so you're
surely aware.

https://lore.kernel.org/all/CANDhNCoJ_MmpEfyuL+JWav+NUfQDH3dm196JSE-Mv3QrPUzi3g@mail.gmail.com/

Kernel development process implies that one makes sure that his work
is unique and doesn't break someone else's development, at one's best
knowledge.

What you're doing not only breaks this rule. You're in fact trying to
get credit for the work that is done by someone else. This is the
definition of fraud.

I cannot make sure that any other patches from you are unique and
written by actually you. Therefore, I will not take your work anymore.

I encourage everyone else to be careful working with I Hsing Cheng
and check his patches for uniqueness, at minimum.  

NAKed-by: Yury Norov <yury.norov@gmail.com>

Thanks,
Yury

On Fri, Jun 13, 2025 at 11:34:47AM +0800, I Hsin Cheng wrote:
> Utilize cpumask_first_but() helper instead of first using
> cpumask_first() and then cpumask_next(). The logic is the same here,
> using the new helper will make it more conscious.
> 
> Use bloat-o-meter to check the impact on code size, the result is the
> same, does not have positive impact nor negative impact.
> 
> $ ./scripts/bloat-o-meter vmlinux_old vmlinux_new
> add/remove: 0/0 grow/shrink: 0/0 up/down: 0/0 (0)
> Function                                     old     new   delta
> Total: Before=22590709, After=22590709, chg +0.00%
> 
> Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
> ---
> Generally speaking, I think this is just a small tweak on the code,
> making it more readable. However, no benefit in code size or performance
> as the implementation behind the helper is in fact the same as the one
> used here.
> 
> Maybe more tests should be done to ensure the change is solid, I hope to
> seek some suggestions from everyone who has any ideas, or this is enough
> then it's good.
> 
> Best regards,
> I Hsin Cheng
> ---
>  kernel/time/clocksource.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
> index bb48498ebb5a..12ff0c048570 100644
> --- a/kernel/time/clocksource.c
> +++ b/kernel/time/clocksource.c
> @@ -323,9 +323,7 @@ static void clocksource_verify_choose_cpus(void)
>  		return;
>  
>  	/* Make sure to select at least one CPU other than the current CPU. */
> -	cpu = cpumask_first(cpu_online_mask);
> -	if (cpu == smp_processor_id())
> -		cpu = cpumask_next(cpu, cpu_online_mask);
> +	cpu = cpumask_first_but(cpu_online_mask, smp_processor_id());
>  	if (WARN_ON_ONCE(cpu >= nr_cpu_ids))
>  		return;
>  	cpumask_set_cpu(cpu, &cpus_chosen);
> -- 
> 2.43.0
