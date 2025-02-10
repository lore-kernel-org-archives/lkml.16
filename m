Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 584F02586DC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739228141; cv=none; b=q7omSLAk5KB8PmHwu9+U8h7NBBgTWRX2JTQ40Cp9qK1cbBBvb+PFeEBXLVtoRB8rZNVsm6QidpuStr7LcBfR3asGofvd6iOwdwZDA/Z6v40Y4B56PoNTfVyVo1R7EvM5K+cujwm8ySBlkp48yjejCDLgoISYzynHh6zYV7jwT3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739228141; c=relaxed/simple;
	bh=gL6gOrdCh/IlJsadc0xHEV39mU3RfBa5VLwt02yJjDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRr0yhq7xIvYXNa2+nwGJpNmuUMeCqSr3vifEfn1zdsTUAE0J7zO8LEvVGSQyHwL9Ghi5QeKnee7FQ2F5DZ3TCQIHg/WnS4PN1vpWeOl7X6gBUkjNA+fBkrgIn+19HjicYt1CMe5KT0GDuWgwGx1RAaPPd11k0yt9GmAy3sMb24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b=UWJ3eA9B; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20230601.gappssmtp.com header.i=@layalina-io.20230601.gappssmtp.com header.b="UWJ3eA9B"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dd93ace00so1151146f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:55:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20230601.gappssmtp.com; s=20230601; t=1739228136; x=1739832936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=16Kxi1fzWZwcB3jKzdlGhI3Vf0msI1zu9CH5u5oyJNg=;
        b=UWJ3eA9BQ9ImcmyjZpiaHQ1ZN4wNUYKYEaCPRANgt3VLasDV1AfhzP/654ewgUilB3
         Erpw60mITxIhloa63aKonM2xJp4LCHgoWLB4eC3KIqS9NSRyjIfZQJlK+wVFoeS45Rli
         YPbXXhbqkPmSd3ij+gsdQiPTf9GP1NY94FH3MmuCmsM2+4OMVH7WWb+WZlYqOu/PtbD7
         zR4HZoF4zgQfRbg+9w/B2DTliN4uXP3FuEiMV8eOAczBUVyOaDKA/7xjbsdA20JZdLlQ
         RFrS+i0VrhYzCUIRtrIbel+raUNlgKlhltWeuKRkn21uydzKFlhotKcScQ2dyhSg3iCy
         xXrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739228136; x=1739832936;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=16Kxi1fzWZwcB3jKzdlGhI3Vf0msI1zu9CH5u5oyJNg=;
        b=pGUdKWZxyJ5VElWjksiQPJmw9WfrDEEQRdiwYVMvvbpGERH9XjrKe8bmAxfOi7gfJN
         t+FftvhaNRKFZpHArSmijWSGp/FJkcJBbeKZ/h6rFrjH4VS70V21SXdKlFC5VEwhul/w
         xXwa57MV8gVkdv3c0Myc48wSmC5DhBTIqq/AUJp8F9ioO4SfcILhv0BFOpVu02ejQZKw
         ZLmvvtKuRsAp2K9+Ma2nOnUxkSi/2oGRD5jxKETeXPqvdI7iT1xoPzSdiirkZYeuDcvE
         ZOyBVPJL16oy77v5sRhtB2oeh7sE6o7Pf7yiHkprXTeE8Kyqny/8kVLaDH/MUUp2ig/3
         syMA==
X-Forwarded-Encrypted: i=1; AJvYcCX7qtI5MKuY48D24hzngseYPz+vL0Rv729X51Vr2cMORGuoOoZrLBriDr3Zgca/sAtQBG1MBtUb7E8kzoY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7xJZQ01QlHxCB0wBNezM30PaP4kSqtLf4pw68NsBIf6GTp+VW
	uPSTrS97rwFDyz9sh7iEGKftUBWED8z+kmPD5cBgQ6VX4yQ84fEkY1AiptNfYNE=
X-Gm-Gg: ASbGncvRuxc/sDupNOptIykVMngOgjvqFq5SNTF36XqZLWIDcxIyZWcJ2LnfCphIkw4
	uM0OJ6XMKXpzI79RPjpTZlNr6TCPpIOfptjLhKChGH2kwLRyM1XEmFsSSq603Q7i9f39tVF4IwK
	IOThMm11MO6DiwDRR7yIYnmV7G7yQ9fkSUBxNKtm3hHJpy3RX2uBTdG3h9xyYa3LsYLadE4avYu
	7Z/rwCutnN2+XJT7MczZNuNVG8W6ST0EFk5xXOxW5KvHKFRZJ070fRMaDtTVu7gn5ny/MbvZX0t
	yUfTbGevFNbJXFfFNq9+76WIr6RhdY3bWPuvRODK2TuslAtw3Zb2KdtkgqqQcfELMmaH
X-Google-Smtp-Source: AGHT+IFbhSZ6LPKWubpj+YEVIdFoa49yhANlAr431YxLoc13cZbjY4ILYdm3pX7AxtB4GNAbcdDtOg==
X-Received: by 2002:a5d:6842:0:b0:38d:bf09:aa2b with SMTP id ffacd0b85a97d-38dc937379bmr9875244f8f.54.1739228136314;
        Mon, 10 Feb 2025 14:55:36 -0800 (PST)
Received: from airbuntu (host109-154-33-115.range109-154.btcentralplus.com. [109.154.33.115])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dccc1f531sm10075167f8f.87.2025.02.10.14.55.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 14:55:35 -0800 (PST)
Date: Mon, 10 Feb 2025 22:55:34 +0000
From: Qais Yousef <qyousef@layalina.io>
To: zihan zhou <15645113830zzh@gmail.com>
Cc: bsegall@google.com, dietmar.eggemann@arm.com, juri.lelli@redhat.com,
	linux-kernel@vger.kernel.org, mgorman@suse.de, mingo@redhat.com,
	peterz@infradead.org, rostedt@goodmis.org,
	vincent.guittot@linaro.org, vschneid@redhat.com
Subject: Re: [PATCH V3 1/2] sched: Reduce the default slice to avoid tasks
 getting an extra tick
Message-ID: <20250210225534.efd4onoo7mhodqhn@airbuntu>
References: <20250210012931.ym337oexdcjmwwzv@airbuntu>
 <20250210061855.299323-1-15645113830zzh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210061855.299323-1-15645113830zzh@gmail.com>

On 02/10/25 14:18, zihan zhou wrote:
> Thank you for your comments!
> 
> > I brought the topic up of these magic values with Peter and Vincent in LPC as
> > I think this logic is confusing. I have nothing against your patch, but if the
> > maintainers agree I am in favour of removing it completely in favour of setting
> > it to a single value that is the same across all systems.
> 
> Here is my shallow understanding:
> I think when the number of cpus is small, this type of machine is usually
> a desktop. If the slice is still relatively large, a task has to have a
> longer wake-up delay, which may result in a poorer user experience. When
> there are a large number of cpus, it is likely to mean that the machine is
> a server, its tasks often are batch workloads, a slight increase in slice
> is acceptable. And a server often has idle cpus or cpus with low load, So
> even if there are larger slice, the interaction experience is also not bad.

I think the logic has served its purpose and it's time to retire it. Any larger
than 8 CPUs will have the same mapping anyway. So let's simplify and make it
3ms by default for everyone.

So the suggestion is to remove this logic and always set base_slice to 3ms for
all systems instead. No need to do the scaling anymore.

> 
> > I do think 1ms makes more sense as a default value given how modern workloads
> > need faster responsiveness across the board. But keeping it 3ms to avoid much
> > disturbance would be fine. We could also make it equal to TICK_MSEC (this
> > define doesn't exist) if it is higher than 3ms.
> 
> I don't quite understand this. What is TICK_MSEC? If HZ=1000, then
> TICK_MSEC=1ms? Why is it said that more than 3ms (slice) equals 1ms (tick)?

I meant

	base_slice = max(3ms, TICK_USEC * USEC_PER_MSEC)

I was lazy to type TICK_USEC * USEC_PER_MSEC and used TICK_MSEC instead.

But this is a bad idea. Please ignore it. With HZ=100 still selectable, doing
that will wreck havoc on wake up preemption on those systems.

> 
> It seems that this value was originally designed for
> sysctl_sched_wakeup_granularity. CFS does not force tasks to switch after
> running for this time, but EEVDF does require it, So if slice is too small
> like 1ms, it looks not conducive to cache, and is not good for batch
> workloads.
> 
> > Do you use HZ=100 by the way? If yes, are you able to share the reasons? This
> > configuration is too aggressive and bad for latencies and I doubt this tweak of
> > the formula will make things better to them anyway.
> 
> I don't use HZ=100, in fact, all the machines I use have HZ=1000 and more
> than 8 cpus, so I'm not familiar with some scenarios.
> 
> I think that if the slice is smaller than tick (10ms), there is not much
> difference between 3ms slice and 1ms slice in tick preemption, but the two
> are still different in wake-up preemption. After all, when waking up
> preemption, there also has update_curr->update_deadline, and the wake-up
> latency should be slightly lower with 1ms slice. So I think, when HZ=100,
> different slices still have an impact on latency.

I am trying to argue elsewhere to remove HZ=100. Just was curious if you
actually use this value and if yes why. Sorry a bit of a tangent :)


Thanks!

--
Qais Yousef
