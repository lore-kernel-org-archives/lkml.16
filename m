Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A98026AA8C
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:55:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745844944; cv=none; b=HQqLeLgt1AnrvJ1vbKmbz9lZt5BXV4czl2sFDdKGIcY3LLgBfyHscvMuEqO35Zg+qOv2Xm9zjZ10iKi8wIyQ509OuVcDyj1nDvXH5ICdkkReBII2ehiBLym4rsuFZhpPNMMUbjNkSkPJfbhKCpqka58cTAkDcuUEDsKMxkZ+0tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745844944; c=relaxed/simple;
	bh=pOyHxmyea21QYFE8U5zMC9u6J0KxC4teVX0vWlyJ85w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hSKAr/XSktl4a65ZpIjJy1uNbn9LOFIxuQ0I+BUUE1sQfCfmYqJZWO+wnoGM2Zb4kxZYkSTtlUqhTVFqHj1suuf2KKBGHmuto3L/UFmiJYnFPHsDk5ui1co24izFjaDGGoocZkS9LnWt+c3lBuHsERUGZfYGzCZvWgQi+X2BOM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hwGGVGiN; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hwGGVGiN"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-b07d607dc83so4059086a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 05:55:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745844941; x=1746449741; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wvbRn7YC9mzQbdZ7W3ysAZ2+Ab46wGRVWzBQLItqLR4=;
        b=hwGGVGiNfkDODjpmpMOa31Rag5eo5cGGWdoUMPzUQYp1hhtkJugU19dsUPmYgsxNK0
         Se6SE7aYeNwEwQJFcGM2S1pg9JbcCU35KX41bxLvC349MOiqneognRmp15WI25XVjVe9
         YsyC7z2CQtSZvsd9BR6Apgn8WgvZHpqJlO0Pv7V7nPIguaQ9cQya1Y2GH4Yt+gvqeDOh
         3JGBOsy3M5vOBJoNmCsh+J/09KxI45ug3007/DsX0+Ezn4c/aXK76nfmdpP/FcEhFUmV
         lWM6faojqxzEzOCFH9qOaI6qJy1WdQY5vMqqY8yl72GQMLoHecgb2HA1RUsL99SRfo/B
         984g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745844941; x=1746449741;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wvbRn7YC9mzQbdZ7W3ysAZ2+Ab46wGRVWzBQLItqLR4=;
        b=rZA9Xdym+3C8hKTOX4s9N331dXFf1Nx/l5eoSPAziha2GGQ7BL/zk89DKS/Z7LNG7Q
         O0veXe4Zcoi7SQhD/MAkBmKecRqyOxeeeFiw/2aNQhy072BIMdnqwxbnCo+jbCIYFgT7
         b3BUGXo+3zpgZOkTsQ3WPEwO373srTW7LGW3Hj+GGTNky/lLskQNbhs/3C7n4mZ9ZyiQ
         4lEQisB+TXywRJ+rIeYBdVYYojsYj6XC6EOENUlCblY/S6jdsTkcLt9pzCcmKtTkwAOA
         9E8tFxEnyW70lT6zN9JQZ7kt8SyhjA5xcgOC4SmyhNDqgopXp7zsuUvuiLpLxWNn/w4V
         g5Yw==
X-Forwarded-Encrypted: i=1; AJvYcCUHjPN7KFHNlAdLSJ+ALhXhlyFQL37CKTp4WeO7PLiVVNekLKUZKuwc5QiRc5s82E8E5Os9KBdpszEyy8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7/AAvwEpF3JNSrcHKaGA9xcl46ENi3woYSPrlM/0AZCjNknB3
	6Z+u67f4K2BvB8HOnx+4UPu5X93mzwtliSpdvj5yCoV2U3788mNq7mfZzwKeAOLOF5/3bdHuBKq
	aeijphpN6I6/xRgEkC+czxbceGA/GfntPd3aQYg==
X-Gm-Gg: ASbGncscMLl9GRxW+T3uv7rka0c1vsB3Cu+nviGsSaNzLClPuuE1KSx004f6riUURsx
	LXGewfA3L/9uB1Y3aJJaR1v67fLYo3Pe4jbD+w0r0h9Z/4rZgk/xBChRUYDXXv0v9SH6h+qAsjH
	2Xmq3T0G/V8r/WPMtVCmhVbgs=
X-Google-Smtp-Source: AGHT+IFsRzSs0/8SuaOOM09eHBrpa86JZSVgpTwx3qI3UUsl6k0oDmTRHno7i+/pYyE5jVyYuFkxPQ+4oAe07LdnvXk=
X-Received: by 2002:a05:6a21:998e:b0:1fb:e271:82e2 with SMTP id
 adf61e73a8af0-2045b6e9fa9mr15917706637.11.1745844940510; Mon, 28 Apr 2025
 05:55:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
 <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com> <20250428122408.GD551819@e132581.arm.com>
In-Reply-To: <20250428122408.GD551819@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 28 Apr 2025 13:55:29 +0100
X-Gm-Features: ATxdqUFPoxNwE9G7_rjmhNqUN6nj015J3cVOQG394WFzBIrfMCpN0vkmhzTPUQU
Message-ID: <CAJ9a7VjhCRk9BxGvE3ZyyZzq__+A1PpD=oRtFQOcD8BwXKa27Q@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Leo Yan <leo.yan@arm.com>
Cc: Yabin Cui <yabinc@google.com>, Anshuman Khandual <anshuman.khandual@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Mon, 28 Apr 2025 at 13:24, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi all,
>
> On Mon, Apr 28, 2025 at 11:53:26AM +0100, Mike Leach wrote:
>
> [...]
>
> > > > > @@ -362,6 +362,10 @@ enum cs_mode {
> > > > >   * @alloc_buffer:    initialises perf's ring buffer for trace collection.
> > > > >   * @free_buffer:     release memory allocated in @get_config.
> > > > >   * @update_buffer:   update buffer pointers after a trace session.
> > > > > + * @percpu_save:     saves state when CPU enters idle state.
> > > > > + *                   Only set for percpu sink.
> > > > > + * @percpu_restore:  restores state when CPU exits idle state.
> > > > > + *                   only set for percpu sink.
> > > > >   */
> > > > >  struct coresight_ops_sink {
> > > > >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> > > > > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> > > > >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> > > > >                             struct perf_output_handle *handle,
> > > > >                             void *sink_config);
> > > > > +     void (*percpu_save)(struct coresight_device *csdev);
> > > > > +     void (*percpu_restore)(struct coresight_device *csdev);
> > > >
> > > > Again - why this percpu_* prefix ?
> > > >
> > > > >  };
> > > > >
> > > > >  /**
> >
> > I do not think this is the best approach.
> >
> > The TRBE driver has its own power management registration functions,
> > so is it not possible for the save and restore should be handled
> > there, through a PM notifier, just as the ETM/ETE is?
> >
> > Drop the unnecessary DT entry - TRBE is a per cpu architectural device
> > - if a TRBE is present, we know it will power down with the PE.
> >
> > The CoreSight architecture permits an ETE to drive trace to an
> > external sink - so the TRBE might be present but unused, therefore
> > hooking into a source driver that may not be driving trace into the
> > device does not seem wise..
>
> Sorry I jumped in a bit late (I saw the patch at last week and it is
> on my review list).
>
> I would suggest to hold on for this patch.  I am refactoring CPU PM and
> hotplug in CoreSight based on the CoreSight path.
>
> The idea is when we do CPU power management for CoreSight devices, we
> cannot simply control individual devices.  Alternatively, we need to
> control logics based on the linkages on CoreSight path as it can reflect
> dependencies crossing the components.  For example, for a CoreSight
> path, when running into CPU low power state, we need firstly disable
> tracer, then links, and at the end sinks.  When CPU resumes back, we
> need to use the reversed ordering for turning on devices.
>
> As a result, except the tracers (ETM / ETE) should be saved and
> restored contexts during CPU power states, other components on the
> path will be controlled by traversing CoreSight paths.  The benefit is
> if a component (e.g., a link or a sink module) is shared by multiple
> CoreSight paths, then the component can be disabled or enabled based on
> reference counter.
>
> I know I am a bit lagged - as I also need to support the locking on
> CoreSight paths.  Please expect in next 1~2 weeks I will send out
> patches for public review.
>
> > The TRBE PM can follow the model of the ETE / ETMv4 and save and
> > restore if currently in use.
>
> If TRBE PM is registered as a seperate PM notifier, a prominent issue is
> it cannot promise the depedency between ETE and TRBE when execute CPU
> power management.  E.g., when entering CPU idle states, ETE should be
> disabled prior to switch off TRBE, otherwise, it might cause lockup
> issue in hardware.  If ETE and TRBE register PM notifier separately,
> we cannot ensure the sequence between ETE and TRBE, this is why we need
> to do the operations based on CoreSight paths.
>

I believe that the architecture requires that if the disabled TRBE
cannot receive trace then the ETE should regard the trace as having
been output (A1.4 ETE spec). Incorrect sequencing should only result
in missing trace, not a core lockup - unless the implementation is not
compliant.

Mike

> Thanks,
> Leo



-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
