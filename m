Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68EA91A0712
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744725012; cv=none; b=W4w1GfhBPVpRI8t4zX3/uCgfR1+uDv028wqu/2FBgBBDyf13Os9F+mLnmrPVi0Y1BWxSGeRFhqWbA7pcYXUwILjmD67oXV0pSX24ItEpGf0j5xYpaYkD/qBNEop2zXy61B3WBu7vTpjaOjdQy1nhNA+ebSgC8LQ5ndQWGDznNLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744725012; c=relaxed/simple;
	bh=hq1Y+ojJ2GF1Hc6zjkQxIT1B/mADl1/vaLggL8GTPCg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r7RsQmPc5UXLNxP2ip6dzogKe2CLiI6/yUFSycSdtJ1scao0JlO0wDx/W60oVazAyXVsucjZ7QKKT2Hkzi6Wj642D0Ye3WCX+dQuZF1VcHGME6teuUjFFRs/w1NSTPq1oje1h0REpsVnMMkncP7JENqgqkxo4tduTtUF3Jlqnag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HmM4VXg3; arc=none smtp.client-ip=209.85.218.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HmM4VXg3"
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-ac6e8cf9132so1053095166b.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744725009; x=1745329809; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wrEPCwM2Bn/9hyG3bxO2C+bn7awqv6ln6+mt63Z/QUM=;
        b=HmM4VXg3xvDmYzXq5wECTz9QliX8JFwlfuZYVtbKADaZY0emDuQET9jkrczL/rC6is
         8tfsJIxz5cDAPrbfuM+3FoPolKLiG9YIdx6iFNgt6Yv1rWaG6fMRFPtB0d0NPUP/6PSC
         R7r8im1priw+F5u3BglbyUX9AD7i81VnndU7rK52m9Q4eaAywoGXDkvnOy1A6krZSzB7
         rU7bIjAR4v4DSALH68Ms64XLihdksfZ/Bmyp2Mai/Oq4l9MRd4TuLqpeubCUo5EVDTsu
         koXAIIYw9LDizzDU8c82rDC4WTbyalhJJVCmrIRp4W/UA0uOL4hdgwB0kmOxHtX3wfAc
         RJXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744725009; x=1745329809;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wrEPCwM2Bn/9hyG3bxO2C+bn7awqv6ln6+mt63Z/QUM=;
        b=ZpewDNADr+Sn5E4c2tiyGyBt3WDoUUeTgxFlt8vgJS68Ypv8moLX7Njp0TWMf4/6nM
         xB8LqBfB7p0o5ne+5Z6G82GL4qDq/v9dolEMtX801lKkKNR5K+8CDmD6bzjStfBexiRh
         WF+MuGKlldLXANB/QbbiahLxJu/LMm23VKeK3r7rRZ7zCu3JoGYSeH6XYMdoxz5GnZ1t
         wKB5rOaQB/eaMw9GuK5c1FfqvZRJVk39JoVwPyM4e4HLkX/K315LO4Y+2rXzYaQ1kGbn
         gmY06PXuKXYR0yQcnsplZvBLAsDEwCSYc/kQjmQUHItUtuPlNFzd/F9Or7neG34KXZ7R
         w5eA==
X-Forwarded-Encrypted: i=1; AJvYcCUcr6l2jfsobT6CKOjp+kSeAi51qnTVM+423YGwU4z8exRxCIMLB5LWFgmWzN1WvA8BXZkSsagvxOoPQC8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBs1+SXEKw+lzzUIJsD5iSdjAxydTIG2OY8kCRPaEO+TQu9QaW
	TJpE1P/N4uRcjcA61f44lduYahFkQstd2L9bmEMBw7oimEuUwcXD5ScxoVZISIGo9OGcBi7orud
	FQbx+H+eCmrqC6x9USN1+51tq2ExcyXsKgvD63A==
X-Gm-Gg: ASbGncupv7ZPvIKTjTMIzhLX05Sz0kxa2JAcvkXL51cVDN5WJfoQoISAOswDEZX5sbv
	zUvdI4IOPUM4xkLIu5cVe39nFz+T2jEFqm0k/+l16WNq2AHxx5Ax5TTr3iDYgE7G7YswDY4Dfno
	ul1Fb6rr7lslF63OEyUwzu4j/6gks/+DaBkqcSrFiAaFoJNxOGN3o3Gj+dIsuxMA==
X-Google-Smtp-Source: AGHT+IGE+x07DdfblSi+FWyAZkA+qhUSf/7rY82sSBtgrgM7EU+PcZzpRi8/EDgcbUuwjrVTPMsNW1QtieYKwrO+K6o=
X-Received: by 2002:a17:907:2ce6:b0:aca:a162:67bb with SMTP id
 a640c23a62f3a-acad345867emr1364373566b.4.1744725008643; Tue, 15 Apr 2025
 06:50:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250302210539.1563190-1-vincent.guittot@linaro.org> <54919a25-b898-407c-a4d7-4ce53907cf75@arm.com>
In-Reply-To: <54919a25-b898-407c-a4d7-4ce53907cf75@arm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Apr 2025 15:49:56 +0200
X-Gm-Features: ATxdqUF0Ipfqj6hgvNz5HJqKVS2C8aqtbu1RDGBJ-S_MZSlxC9H8y49n4jsqVM8
Message-ID: <CAKfTPtAL+jomuj7nuoOkoGCDPURiKmmL51uZqj-wwY4hBuanOQ@mail.gmail.com>
Subject: Re: [PATCH 0/7 v5] sched/fair: Rework EAS to handle more cases
To: Christian Loehle <christian.loehle@arm.com>
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	mgorman@suse.de, vschneid@redhat.com, lukasz.luba@arm.com, 
	rafael.j.wysocki@intel.com, pierre.gondois@arm.com, 
	linux-kernel@vger.kernel.org, qyousef@layalina.io, hongyan.xia2@arm.com, 
	luis.machado@arm.com, qperret@google.com
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

On Thu, 3 Apr 2025 at 14:37, Christian Loehle <christian.loehle@arm.com> wrote:
>
> On 3/2/25 21:05, Vincent Guittot wrote:
> > The current Energy Aware Scheduler has some known limitations which have
> > became more and more visible with features like uclamp as an example. This
> > serie tries to fix some of those issues:
> > - tasks stacked on the same CPU of a PD
> > - tasks stuck on the wrong CPU.
> >

...

> >
> >  include/linux/energy_model.h | 111 ++----
> >  kernel/sched/fair.c          | 721 ++++++++++++++++++++++++-----------
> >  kernel/sched/sched.h         |   2 +
> >  3 files changed, 518 insertions(+), 316 deletions(-)
> >
>
> Hi Vincent,
> so I've invested some time into running tests with the series.
> To further narrow down which patch we can attribute a change in
> behavior I've compared the following:
> - Patches 1 to 3 applied, comparing your proposed feec() (B)
> only to the baseline feec() (A).
> - All patches applied, using a static branch to enable (C) and
> disable (D) push mechanism for misfit tasks (if disabled only
> the 'tasks stuck on CPU' mechanism triggers here).
>
> I've looked at
> 1) YouTube 4K video playback
> 2) Dr.Arm (in-house ARM game)
> 3) VideoScroller which loads a new video every 3s
> 4) Idle screen on
> 5) Speedometer2.0 in Chromium
>
> The device tested is the Pixel6 with 6.12 kernel + backported
> scheduler patches.

What do you mean by "6.12 kernel + backported scheduler patches" ? Do
you mean android mainline v6.12 ?

I run my test with android mainline v6.13 + scheduler patches for
v6.14 and v6.15-rc1. Do you mean the same ? v6.12 misses a number of
important patches in regards to threads accounting

> For power measurements the onboard energy-meter is used [1].

same for me

>
> Mainline feec() A is the baseline for all. All workloads are run for
> 10mins with the exception of Speedometer 2.0
> (one iteration each for 5 iterations with cooldowns).

What do you mean exactly by (one iteration each for 5 iterations with
cooldowns) ?

>
> 1) YouTube 4K video

I'd like to reproduce this use case because my test with 4k video
playback shows similar or slightly better power consumption (2%) with
this patch.

Do you have details about this use case that you can share ?


> +4.5% power with all other tested (the regression already shows with B,
> no further change with C & D).
> (cf. +18.5% power with CAS).
> The power regression comes from increased average frequency on all
> 3 clusters.

I'm interested to understand why the average frequency increases as
the OPP remains the 1st level of selection and in case of light loaded
use cases we should not see much difference. That's what I see on my
4k video playback use case

And I will also look at why the CAS is better in your case

> No dropped frames in all tested A to D.
>
> 2)  Dr.Arm (in-house ARM game)
> +9.9% power with all other tested (the regression already shows with B,
> no further change with C & D).
> (cf. +3.7% power with CAS, new feec() performs worse than CAS here.)
> The power regression comes from increased average frequency on all
> 3 clusters.

I supposed that I won't be able to reproduce this one

>
> 3) VideoScroller
> No difference in terms of power for A to D.
> Specifically even the push mechanism with misfit enabled/disabled
> doesn't make a noticeable difference in per-cluster energy numbers.
>
> 4) Idle screen on
> No difference in power for all for A to D.

I see a difference here mainly for DDR power consumption with 7%
saving compared to mainline and 2% on the CPU clusters

>
> 5) Speedometer2.0 in Chromium
> Both power and score comparable for A to D.
>
> As mentioned in the thread already the push mechanism
> (without misfit tasks) (D) triggers only once every 2-20 minutes,
> depending on the workload (all tested here were without any
> UCLAMP_MAX tasks).
> I also used the device manually just to check if I'm not missing
> anything here, I wasn't.
> This push task mechanism shouldn't make any difference without
> UCLAMP_MAX.

On the push mechanism side, I'm surprised that you don't get more push
than once every 2-20 minutes. On the speedometer, I've got around 170
push fair and 600 check pushable which ends with a task migration
during the 75 seconds of the test and much more calls that ends with
the same cpu. This also needs to be compared with the 70% of
overutilized state during the 75 seconds of the time during which we
don't push. On light loaded case, the condition is currently to
conservative to trigger push task mechanism but that's also expected
in order to be conservative

The fact that OU triggers too quickly limits the impact of push and feec rework

uclamp_max sees a difference with the push mechanism which is another
argument for using it.

And this is 1st step is quite conservative before extending the cases
which can benefit from push and feec rework as explained  at OSPM

>
> The increased average frequency in 1) and 2) is caused by the
> deviation from max-spare-cap in feec(), which previously ensured
> as much headroom as possible until we have to raise the OPP of the
> cluster.
>
> So all in all this regresses power on some crucial EAS workloads.
> I couldn't find a real-world workload where the
> 'less co-scheduling/contention' strategy of feec() showed a benefit.
> Did you have a specific workload for this in mind?
>
> [1]
> https://tooling.sites.arm.com/lisa/latest/sections/api/generated/lisa.analysis.pixel6.Pixel6Analysis.html#lisa.analysis.pixel6.Pixel6Analysis.df_power_meter
