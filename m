Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C521F940A
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294682; cv=none; b=ncL+FKaEaezWs2Phg6XYMJDXzt8RSFAT8OSZXNfNY/vw81+l06ByLR9unQuWs+HJIZ3MeoQqkkrTxX+deHizhzajEwEQDnRVr+c86EMKnhxGRh4H9zlLQjL5KvVXFAn3xafmi+DcO6l7C+gKEZikm85KfAEnpA2z7kWzxfE4GIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294682; c=relaxed/simple;
	bh=KWS+cifqAmXXgbqnEdYquTPah30qhdgIioGdq82FNYk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZWzzzlfzor0WeC/l2Zre6w4as18AeTfX4MSOLuow6UJvZcqkQDNr3UPK/c9qBi6znRg2Roo3Nvji/JxN6wVF2AOvENS6l90NwFsKhkSAXb3UIN0G3u8DyunAkWfsNxvmALAiT7zEYgybrArVlQpIoOMVvj7+EJp2bhmiYSYlE+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=THQfb/Sq; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="THQfb/Sq"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f62cc4088so68673325ad.3
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739294679; x=1739899479; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=U6SXgYg7esmTxhwZTlIjFXRPb6oCtU1ku3PB/lUUVzA=;
        b=THQfb/SqdVaN9LwYu3lHpQt6Bg6+3i0Pvo08vyyWl6KeJRipG42EKB3VE4bskYCa3l
         qWksE2HmpUTKMxIiCBjIG/3iLJPlcDZ/0Rx2J2MDrmcq9weeu4CsH85rqnO1nXcZjYx7
         RMi4tpiWNGJQE9u2JYrwzDUcYje5/HzsBT3MkhhU4yXGsY+4HycxEiIJ6J7ev7Gt5sn2
         NxpSeARbAjDvAWpgYM8EjBLjDJimHVr1BHf743vALDCXAg06Gkg7BWBaiI7Ms7/CMm+7
         FyO0jGC3eb7uCHcSY1ht2NACAB0fYbzMA8SZUGjy+ur/v5QiqKoqoDHdnTFxMtBQZR9t
         GxjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294679; x=1739899479;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6SXgYg7esmTxhwZTlIjFXRPb6oCtU1ku3PB/lUUVzA=;
        b=hBTJsQFHwmwSpIKg/dGKY9O4agmgi+ozmA9rOpSlTTzEn1Tm3s3w829lscdzZMNvvX
         JU7aOc2CmO+63/2tsvHZIqHctbACXVLQdqilRE+tTIgMT5UG1mai+MSQT/Q1ZSsmtZBh
         Hbmzvvqv3mM8qW2Hkk/VRYsgpiBj25PaBYBKs5ABUaMnU6mf7wVgTwh5FKxyIvybY2wn
         24JJOB+8Hf6FL1rCttijN6dN8ZeodGi4qIS30P/Cnb2xmjMaBMZRuxfUcK+JPI7mAYRP
         1rpoqbpR2OIBxzfiIn6yaiFXufhd3IVBAY6io4IyRKeLrnIkxjpBomMDazutG/W6Bxwb
         cpIg==
X-Forwarded-Encrypted: i=1; AJvYcCVKOfynpgKMTRsFbXPZHLaNdM9dc3dNQR613oQOJ/i7UsmyWYaCmvMNkq+4c4rnRXl5R9BNHRLM0fzjnq0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3Ev1O/+QSRraRfW4eeg4pnl/gN4iQ2GnnY3yIFrLptWVGTj/+
	CtFvemX59a898ucoKXJJCNA/WKc2yu+2BbIa48RBtVN+S+/rj5DPWOkP7ZSYipRNh37hffRusEU
	c/7NdoyNo6xVJpPvGQDfEBrKVtWMPwT+dfKwHqg==
X-Gm-Gg: ASbGnctwn5w7lvji7M/45FfTA9/7qnG7ctx7J9TLy/evcIpWZnekksr5n2vQaaH4B4J
	lzXn0xyscpgcDPZvK3vCMahdijZYCI5Ua/ypRnLwiCrCRUtwL2V6xdFWzaky/9RwjqBpAZaK2CT
	0TDTV5NjOvtg3mM00QrljZDl5xEdQEow==
X-Google-Smtp-Source: AGHT+IGmRUXrQTlIf9W4HKabU/xBKx/DTJE7QzDhgMGQDvFVAUo/kz1vNcNccn/atrBA/7YiFzEFo4a1RxFVzd8BNaI=
X-Received: by 2002:a05:6a21:6b17:b0:1ed:a80e:932 with SMTP id
 adf61e73a8af0-1ee5c83de1bmr74737637.34.1739294679456; Tue, 11 Feb 2025
 09:24:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250103-fix_cpu_hung-v1-1-a7b9b3893d44@quicinc.com>
 <20250206103213.GB8855@e132581.arm.com> <a2d221a7-ca6d-4956-8537-bee39e89f61c@quicinc.com>
In-Reply-To: <a2d221a7-ca6d-4956-8537-bee39e89f61c@quicinc.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Tue, 11 Feb 2025 17:24:28 +0000
X-Gm-Features: AWEUYZnowpZtnynJFEXqjgvxW0cjB3n9o8gMcQxWCocSbFlTqxgJUzvvcjSrNt4
Message-ID: <CAJ9a7Vgre_3mkXB_xeVx5N9BqPTa2Ai4_8E+daDZ-yAUv44A9g@mail.gmail.com>
Subject: Re: [PATCH] coresight-tmc: stop disabling tmc when flush timeout
To: Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: Leo Yan <leo.yan@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, kernel@quicinc.com, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

We are not seeing these problems on other systems with multiple ETMs.

How are you using the system?

 Perf will strictly disable sources before sinks - which would mean
that the ETMs will flush before the TMC requests a manual flush on
stop.
For sysfs use, we recommend the same, but even halting the TMC first
should result in all sources being requested to flush at the same time
(subject to propagation through connected trace funnels).

On Fri, 7 Feb 2025 at 07:25, Yuanfang Zhang <quic_yuanfang@quicinc.com> wrote:
>
>
>
> On 2/6/2025 6:32 PM, Leo Yan wrote:
> > Hi Yuanfang,
> >
> > On Fri, Jan 03, 2025 at 04:01:54PM +0800, Yuanfang Zhang wrote:
> >>
> >> When multiple ETMs are enabled simultaneously, the time required
> >> to complete a flush in the process of reading the TMC device node
> >> may exceed the default wait time of 100us.
> >

How do you know that it is the ETM flush process that is the issue?
TMC ready can be delayed by issues in the memory system that prevent
write to the memory buffer.

The TMC flush complete will indicate completion of flush for all
connected devices - so if flush complete is indicated by the TMC then
a flush request cannot be the issue.
With multiple ETMs, then the connected trace funnels arbitration will
ensure flush is indicated complete on all connected inputs before
transmitting to the output.

The driver code to stop the TMC will first wait on flush complete
before waiting on TMC ready.


> > Have you tried how long time would be safe to wait for the
> > TMCREADY_BIT bit to be set on your platform?
> yes, 400000us.

This is a huge amount of latency for a coresight system.  This
suggests some sort of contention issue.

> >
> >> If the TMC capture is stopped while any ETM has not completed its
> >> flush, it can cause the corresponding CPU to hang.
> >>

There is nothing in the ETMv4 hardware specification /design that
should cause an CPU to hang. There is an implementation dependent
stall mechanism that if implemented can stall a PE when the ETM fifo
approaches overflow, but this is switch off on the drivers, if
implemented on the hardware.

The flush process for the ETM is a purely internal process of clearing
out all trace currently in the ETM, and is not dependent on the PE.

> >> Fix the by checking the TMCReady bit after the flush. If TMCReady
> >> bit is set, TraceCaptEn bit can be clear; otherwise, return directly
> >> and stop the TMC read.
> >
> > When a timeout for TMC flush and stop is detected, if the driver
> > arbitrarily bails out without disabling TMC, this would leave the
> > hardware always on.
> >

I agree that this is not an acceptable solution - we cannot leave the
TMC in an indeterminate state.

Where clients such as perf are using the hardware there is no
mechanism for re-trying if halt fails.
The functions you have changed seem to relate to  reading the buffer
via sysfs. Do you see similar problems using perf to collect trace
data?


> > I would like first know if a longer timeout can fix the issue.
> >
> > Thanks,
> > Leo
> >
> yes, longer timeout can fix this issue.
>

I think that a longer timeout will mask some underlying contention
issue, but it should be possible to make the coresight driver timeout
configurable, and set the value appropriately for your system.

There is a new TMC logging patchset here:
https://lists.linaro.org/archives/list/coresight@lists.linaro.org/thread/7Y6NPTNKKIPERUUBHG5UEUNVR7ZMFUGM/
which improves the error reporting around timeouts.  This might help
establish if the error is in waiting for flush complete, or TMC ready.

This API could be extended to add a timeout value parameter, that can
be configured from the TMC driver, set via sysfs for the TMC in the
initial case to further debugging of this issue on your system

Regards

Mike


> >> Signed-off-by: Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >> ---
> >>  drivers/hwtracing/coresight/coresight-tmc-etf.c | 17 +++++++++++++++--
> >>  drivers/hwtracing/coresight/coresight-tmc-etr.c | 22 +++++++++++++++++-----
> >>  2 files changed, 32 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etf.c b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> index d4f641cd9de69488fe3d1c1dc9b5a9eafb55ed59..bded290c42891d782344d9a6e63ebdbed6719133 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etf.c
> >> @@ -80,11 +80,21 @@ static void tmc_etb_dump_hw(struct tmc_drvdata *drvdata)
> >>         return;
> >>  }
> >>
> >> -static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >> +static int __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >> +       int rc;
> >> +
> >>         CS_UNLOCK(drvdata->base);
> >>
> >>         tmc_flush_and_stop(drvdata);
> >> +
> >> +       rc = tmc_wait_for_tmcready(drvdata);
> >> +       if (rc) {
> >> +               dev_err(&drvdata->csdev->dev,
> >> +                       "Failed to disable : TMC is not ready\n");
> >> +               CS_LOCK(drvdata->base);
> >> +               return rc;
> >> +       }
> >>         /*
> >>          * When operating in sysFS mode the content of the buffer needs to be
> >>          * read before the TMC is disabled.
> >> @@ -94,6 +104,7 @@ static void __tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >>         tmc_disable_hw(drvdata);
> >>
> >>         CS_LOCK(drvdata->base);
> >> +       return 0;
> >>  }
> >>
> >>  static void tmc_etb_disable_hw(struct tmc_drvdata *drvdata)
> >> @@ -650,7 +661,9 @@ int tmc_read_prepare_etb(struct tmc_drvdata *drvdata)
> >>                         ret = -EINVAL;
> >>                         goto out;
> >>                 }
> >> -               __tmc_etb_disable_hw(drvdata);
> >> +               ret = __tmc_etb_disable_hw(drvdata);
> >> +               if (ret)
> >> +                       goto out;
> >>         }
> >>
> >>         drvdata->reading = true;
> >> diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> index a48bb85d0e7f44a25b813f3c828cc3d705d16012..63a1f7501562fa0b5c2fe6ea53dce4d82842bec3 100644
> >> --- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> +++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
> >> @@ -1135,11 +1135,21 @@ static void tmc_etr_sync_sysfs_buf(struct tmc_drvdata *drvdata)
> >>         }
> >>  }
> >>
> >> -static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >> +static int __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >>  {
> >> +       int rc;
> >> +
> >>         CS_UNLOCK(drvdata->base);
> >>
> >>         tmc_flush_and_stop(drvdata);
> >> +
> >> +       rc = tmc_wait_for_tmcready(drvdata);
> >> +       if (rc) {
> >> +               dev_err(&drvdata->csdev->dev,
> >> +                       "Failed to disable : TMC is not ready\n");
> >> +               CS_LOCK(drvdata->base);
> >> +               return rc;
> >> +       }
> >>         /*
> >>          * When operating in sysFS mode the content of the buffer needs to be
> >>          * read before the TMC is disabled.
> >> @@ -1150,7 +1160,7 @@ static void __tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >>         tmc_disable_hw(drvdata);
> >>
> >>         CS_LOCK(drvdata->base);
> >> -
> >> +       return 0;
> >>  }
> >>
> >>  void tmc_etr_disable_hw(struct tmc_drvdata *drvdata)
> >> @@ -1779,9 +1789,11 @@ int tmc_read_prepare_etr(struct tmc_drvdata *drvdata)
> >>         }
> >>
> >>         /* Disable the TMC if we are trying to read from a running session. */
> >> -       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS)
> >> -               __tmc_etr_disable_hw(drvdata);
> >> -
> >> +       if (coresight_get_mode(drvdata->csdev) == CS_MODE_SYSFS) {
> >> +               ret = __tmc_etr_disable_hw(drvdata);
> >> +               if (ret)
> >> +                       goto out;
> >> +       }
> >>         drvdata->reading = true;
> >>  out:
> >>         spin_unlock_irqrestore(&drvdata->spinlock, flags);
> >>
> >> ---
> >> base-commit: fac04efc5c793dccbd07e2d59af9f90b7fc0dca4
> >> change-id: 20250103-fix_cpu_hung-b5a95179ada4
> >>
> >> Best regards,
> >> --
> >> Yuanfang Zhang <quic_yuanfang@quicinc.com>
> >>
> >>
>


--
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
