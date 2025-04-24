Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2772284681
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 17:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745515660; cv=none; b=t3WgVU54qdu6eoWJKzAxyzRiJpb1PJfhJ2xKop9nTgjDSsHXGrYBP5u3CDPS1lBsepzGiyJfBnqlR6Dh/UtLcBe88Js9jvyQWx/uQhpKQ8dGuGmNkA2jcdKFwjiyidWN3uxKgQ0RQUbvvqsQiG2vNBcbg3m0wsshstGJXC+jMWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745515660; c=relaxed/simple;
	bh=q5I+xTsja6/+NAMFo4t3Ik87fK6qI8eX8c59YtHm0FA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f9i5hYGniI3kxU+w4GGO/WcjX9/3eaxjRTada1v3+JniX0x1QBG60ZURTJoC38DPQ0zE4pMLSLjnYwRL/AnaPllPhwIrufYtxPkhlLS8gn7yWTqTAGt/YxGr1ETHyCk0ylCKQ/dUhxuCu4a5o7d73EFOHGY224gaatwklxcWQ70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PJPn2V7f; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PJPn2V7f"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-739b3fe7ce8so1357711b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 10:27:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745515658; x=1746120458; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=VbeLnI23O/2RXZovesa/I0oinrI/iA9H2L6qN8Jup2k=;
        b=PJPn2V7flntDsS4Dkj6AGOb5MxswTH/gb2hc0hFAoe3YglA24TIiHqtf7mF3MzZNU5
         niTtZTuN0/Q6QcfleeJuNYCzOC7xzob3449fP33myDLa766dB5ez1YB/+BqsD7v+EiyW
         BFkioNF7AMpOgb+t/A5mrqIDNUrWTitZQHbpBNtYRNpav/Ok539Hypq2Uvp7eN4eIF6b
         pJ18p9P0JWp2O+YzUThyaz0drMshIYS4h/eVRK2TTLAtinE86EzaDHFAtxDFCZBxQ1t5
         B3Ul/IG6S2ZxdOgmrTanmNNo3TdqvnMoUrt9eTuYgAXmB2nwUQyuEBRZGsEPeTe2hLox
         +4yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745515658; x=1746120458;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VbeLnI23O/2RXZovesa/I0oinrI/iA9H2L6qN8Jup2k=;
        b=VC9dzXrUqRJyInA/CCbyboNTrUaATOKTnOPgkHEAnR0Mw8T5J12Z4X5dLxfyZiUyOG
         v2Q5U8w0TcYBydcRTa3TrZsEYkYtN/CqaX9v+1r32RXwZufVpotp6QxBW0ZUsh4w1aP4
         HMRJvKKHP8Cy+kAOpjJqk0rHy/OxoLlk30URslXQgwyQ+Sf1Q8qL8MBzWXd5kLQXTV3M
         V7N3LE0XZBCvzuFxP4XyJEsrlNwd9gToDte4oqJUIkFxoETXHkQahLqSeGnoOWIXWQTr
         O6JNh+LSZbqJt8fZFea7cwCinaNWpTVFnPZLU0hJprB8Z9xXDSG2hXp3kwN9iC+fgJiv
         x20w==
X-Forwarded-Encrypted: i=1; AJvYcCW4MYF71aSK/Pn4mAJdMF1j1naBACrbT4OEM6972AJXEyPGrQcbgHTQiBtxP3lgkMZQqQMPugGH5hmboOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxblPLo19aprNWd+Ef+5+PBP5+5kMdnG/CPXBsFjuIdXRhbiZKu
	9X/yjEYZBJa6clH218ba5Ykf2mUO8141PRFQrDfY+cQLbmSc7R96M87g+vmajiXvbVmYtsykT0y
	q7HE3chIhQGxnVS+uMGX7dAKZLWpPprgGiZxFxw==
X-Gm-Gg: ASbGnct/7OIF4IBt50f1wCbsk8RnFG1JS2OXRJ/Mi5QbyxtT24tHFeQL7s3Mkk/ctZR
	2fHIyN6J3OeZGndKg6fP62TTrK5bLx4oSPOSg+cj6BemJRUQvvyT0b8WGTnw2+hc8fr5lubn/PK
	vzGV4Qd9o+hYMCiq2F0ooTPOvVjc0lDDwlyfr4ALA9B8f5e2brUUkezle8QUv81HEPRA==
X-Google-Smtp-Source: AGHT+IEC4h+n6V+A3Wkh5EyBqD0wTFX3L2FNrC/0h1SWeKXUdUnLiYu48vedhleXRiwH7v+CaXpMm7cUsFfYX6TKBn0=
X-Received: by 2002:a05:6a00:80d:b0:736:34ff:be7 with SMTP id
 d2e1a72fcca58-73e24acafe4mr4147250b3a.15.1745515658003; Thu, 24 Apr 2025
 10:27:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401180708.385396-1-leo.yan@arm.com> <20250401180708.385396-6-leo.yan@arm.com>
 <CAJ9a7VgTyKfebbYhEG5cGH4HyzU+4FavDXsAxGncXLsDtHSUHA@mail.gmail.com> <20250402155841.GO115840@e132581.arm.com>
In-Reply-To: <20250402155841.GO115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Thu, 24 Apr 2025 18:27:27 +0100
X-Gm-Features: ATxdqUGBFz5B9fpLBwG1Cv3FoCD1MAVXU7_kEqsKCNI9bWn99Dnw_J5zgIlpHr4
Message-ID: <CAJ9a7VjDe9U9RufKfuBAW9gAUdiWHyErxqsV=3gL=oaj7uS12Q@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] coresight: tmc: Re-enable sink after buffer update
To: Leo Yan <leo.yan@arm.com>
Cc: James Clark <james.clark@linaro.org>, Jonathan Corbet <corbet@lwn.net>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 2 Apr 2025 at 16:58, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Apr 02, 2025 at 04:05:10PM +0100, Mike Leach wrote:
>
> [...]
>
> > > @@ -482,6 +482,7 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> > >         unsigned long offset, to_read = 0, flags;
> > >         struct cs_buffers *buf = sink_config;
> > >         struct tmc_drvdata *drvdata = dev_get_drvdata(csdev->dev.parent);
> > > +       struct perf_event *event = handle->event;
> > >
> > >         if (!buf)
> > >                 return 0;
> > > @@ -586,6 +587,14 @@ static unsigned long tmc_update_etf_buffer(struct coresight_device *csdev,
> > >          * is expected by the perf ring buffer.
> > >          */
> > >         CS_LOCK(drvdata->base);
> > > +
> > > +       /*
> > > +        * If the event is active, it is triggered during an AUX pause.
> > > +        * Re-enable the sink so that it is ready when AUX resume is invoked.
> > > +        */
> > > +       if (!event->hw.state)
> > > +               __tmc_etb_enable_hw(drvdata);
> > > +
> >
> > Think that the  refcnt should be checked here too.
>
> No, ETF driver uses spinlock to guard the entire region for checking
> refcnt and updating buffer, here it is still in the same critical
> region.  This is why the checking refcnt is not needed.
>
> > Does the  ETB case need to be handled? - somewhat confusingly the
> > coresight-tmc-etf.c file handles both ETF and ETB.
>
> ETF is for the link mode, and ETB is for sink.  Updating buffer is only
> for sink mode, this is why here I use __tmc_etb_enable_hw().  Does it
> make sense?
>
> I also have a question for the paired operations (this is applied for
> both ETF and ETR drivers).
>
> Now the flow is:
>
>   tmc_update_etf_buffer()  {
>
>     tmc_flush_and_stop();
>
>     update buffer;
>
>     __tmc_etb_enable_hw();
>   }
>
> The operations are not paired between tmc_flush_and_stop() and
> __tmc_etb_enable_hw().
>
> The tmc_flush_and_stop() function only controls the TMC_FFCR register.
> I'm not sure whether I need to extract the TMC_FFCR operations from
> __tmc_etb_enable_hw() to use them for recovery in the update buffer.
> Or do you think re-enabling the hardware in this patch is the safer
> approach?
>
> Thanks,
> Leo

Looks OK to me.

Reviewed-by: Mike Leach <mike.leach@linaro.org>


-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
