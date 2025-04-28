Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C8B21CFEC
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 10:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745837621; cv=none; b=UiDPPZMUeP3SxsT6E87Tu+U+iNtAagUKTnEm+yBIjC7YDOowKA8eXusgQzRWYpPcEKPtV/YqtM8qipoFu8vXHdpiBDeid6c+4Uwfhc0JeIMomT3SWZhvcRMqnGz13pD+hiRKq8CWwYFnbegJ/pnFjdY9jabPJL/qIj9l//W8C0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745837621; c=relaxed/simple;
	bh=ekwEaLCwMaVu8ZTBVSTEvLEdPA+dElpDPsG2NhCHE64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gCuBCZOPEYUn7sCLeLOvY1Z8GywZH9WwBlS/N74DOF/xOfCS/ygojNkGryjVdti7daqRWQHtSqLRHWIKeOjpljF4rWz/vme0hSciBg9aIyGH0igFyrwSGr173y4ZCSwfqOP27sMS3LOL/oeDPDLEG9U/WdDm4A3NV7hQyDGGHm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rG0G7ndG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rG0G7ndG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-736aaeed234so3786769b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 03:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745837618; x=1746442418; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AQ4H0gqqKh+ng1Q5TSOaQmHnCz9VVfiwg4NMCceo9OU=;
        b=rG0G7ndG2H0UEp+mKoeL9asiPowVatq7MhkrKo0CkLkYFOQNmuLd+qdh03jLlRGUWZ
         w6CMAnjPuQaRSbJBnhsLja7G6YJ/RMk2MwtDmppoyX+eKrLBYLCLUkkXE60QSY1CM7rD
         zNhH0nhJF5nmGkD3JudS+9gK9m9+DxhGVCDADiApaD9/GEHMAOcTuEc2oXFwV1598yZt
         zGDakxASI2j8NqUQjvv8HrgmGc78MDl0sPcObSt5BFPNVVSpkqL6TQjXIMszV+d2Pb8n
         hUyiSpxjv3IiD5axTINxLJPOBdGl1e6Ijq5mpghbXirAiYg3MhvA71D10nvML+HsALqJ
         XEvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745837618; x=1746442418;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AQ4H0gqqKh+ng1Q5TSOaQmHnCz9VVfiwg4NMCceo9OU=;
        b=kp2fvDbDUCBmzVIvOGil3WHE/FsLeSFMEHIPL42OYKlj3mlA/Se5Ic6qV2gVmgKqrj
         1CNGge6DeUE/6IWlFQwHWk817DUFPcRYcwzkMCcba8Cx2M/RX7Nn4dgTRnc7XF7Ee2/b
         Re4GgffN3IR2irqKwHBtHt7gTENNGEP8QupNMF80L0GccvO+9lsxCfivoA6El+QtL4Hg
         oOk4X4L/l1rhsVzy5wJRomz0ylDqnWJErE/AYovAJzygI1RChuvkwsPv1sWDBM/6fmm0
         hbF+Iq7owUORWBIsUWnOJhFvcDwmrHoPAQkM6+XThAzr6hE/hQrhKi2wLicUno+xK8/S
         tguQ==
X-Forwarded-Encrypted: i=1; AJvYcCWylXNxtdhk9THd8H+tGurWJwrA4hvodLcSArbUIuvXkTZw4doaAEg+L2qS5I3Y+KenKZFtq5hvyjpFt64=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxa5yI3LGzY8HfBY0DZALu2OUJp2LEocQyRewXF22foNwc5AZJy
	p8pi2ciE9BRGRpDsgC67hsqSiNcpdkkw4snQWmt8NeNE16S2yTPGgvAFEMjk+f+aG+nXe42QcvL
	VXrZ/wyBdkr/TP4ZtkPVVVP+Cwl7+py4hF0R4ocFp0Fucj63z
X-Gm-Gg: ASbGnctFmBwy0hvjKE4aWg1yYU137ttJGu+8YiokYN3zL7SW9vwuzMkNueo9koekjvk
	9q41lIa0YZOh4a7CXh2HN4keeuABqqtGLZQl/sja8OA6a33bwbnzd8saNEARLN1jELO5gaTvOCg
	3sVvq7E4kR3b77Ewe++6TffrM=
X-Google-Smtp-Source: AGHT+IGW39PFq1vNzpQcv+1EqlEOnsFYuMKw69GoGxeEownj7ws52uMpNUzai4ppvPMgAR0rPERZiDrYw8CoCiUEn8c=
X-Received: by 2002:a05:6a21:3398:b0:1f3:33c2:29c5 with SMTP id
 adf61e73a8af0-2045b6a2d55mr17932109637.7.1745837617881; Mon, 28 Apr 2025
 03:53:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
 <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
In-Reply-To: <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Mon, 28 Apr 2025 11:53:26 +0100
X-Gm-Features: ATxdqUHw2fTALHJXvj7ywyjxl49T6cS5C9Tn0FNV7puTETCKCpBTALZ9W1rz2hY
Message-ID: <CAJ9a7VhMJDMbowRuB5zgjQw+UfxP7eumZX1SKF2MJQ2_2NebHA@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Yabin Cui <yabinc@google.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, 25 Apr 2025 at 23:05, Yabin Cui <yabinc@google.com> wrote:
>
> On Thu, Apr 24, 2025 at 9:16=E2=80=AFPM Anshuman Khandual
> <anshuman.khandual@arm.com> wrote:
> >
> > On 4/24/25 04:30, Yabin Cui wrote:
> > > Similar to ETE, TRBE may lose its context when a CPU enters low
> > > power state. To make things worse, if ETE state is restored without
> > > restoring TRBE state, it can lead to a stuck CPU due to an enabled
> > > source device with no enabled sink devices.
> >
> > Could you please provide some more details about when the cpu gets
> > stuck e.g dmesg, traces etc. Also consider adding those details in
> > the commit message as well to establish the problem, this patch is
> > trying to address.
>
> This is already the best I know. When experimenting TRBE locally
> (on Pixel 9), if I don't save TRBE state across low power state, when
> recording system wide ETM data using TRBE on a CPU core. In a
> few seconds, the CPU state becomes unknown (no message in dmesg).
> Since the core may hold locks needed by other cores, it soon locks
> other cores and causes a watchdog reset. I found the coresight driver
> always carefully enables sink before source, and disables sink after
> source. I guess there is some risk in not doing so, like the CPU hang
> here. Maybe you know why?
>
>
> >
> > >
> > > This patch introduces support for "arm,coresight-loses-context-with-c=
pu"
> > > in the TRBE driver. When present, TRBE registers are saved before
> > > and restored after CPU low power state. To prevent CPU hangs, TRBE
> > > state is always saved after ETE state and restored after ETE state.
> >
> > The save and restore order here is
> >
> > 1. Save ETE
> > 2. Save TRBE
> > 3. Restore ETE
> > 4. Restore TRBE
> >
> > >
> > > Signed-off-by: Yabin Cui <yabinc@google.com>
> > > ---
> > >  .../coresight/coresight-etm4x-core.c          | 13 ++++-
> > >  drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++=
++
> > >  include/linux/coresight.h                     |  6 +++
> > >  3 files changed, 71 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/dri=
vers/hwtracing/coresight/coresight-etm4x-core.c
> > > index e5972f16abff..1bbaa1249206 100644
> > > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > > @@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata=
 *drvdata)
> > >  static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
> > >  {
> > >       int ret =3D 0;
> > > +     struct coresight_device *sink;
> > >
> > >       /* Save the TRFCR irrespective of whether the ETM is ON */
> > >       if (drvdata->trfcr)
> > > @@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata =
*drvdata)
> > >        * Save and restore the ETM Trace registers only if
> > >        * the ETM is active.
> > >        */
> > > -     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> > > +     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) =
{
> > >               ret =3D __etm4_cpu_save(drvdata);
> > > +             if (ret =3D=3D 0) {
> > > +                     sink =3D coresight_get_percpu_sink(drvdata->cpu=
);
> > > +                     if (sink && sink_ops(sink)->percpu_save)
> > > +                             sink_ops(sink)->percpu_save(sink);
> > > +             }
> > > +     }
> > >       return ret;
> > >  }
> > >
> > > @@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_dr=
vdata *drvdata)
> > >
> > >  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> > >  {
> > > +     struct coresight_device *sink =3D coresight_get_percpu_sink(drv=
data->cpu);
> > > +
> > > +     if (sink && sink_ops(sink)->percpu_restore)
> > > +             sink_ops(sink)->percpu_restore(sink);
> >
> > TRBE gets restored first which contradicts the order mentioned
> > earlier in the commit message ?
> >
> An error in the commit message, should be:
> To prevent CPU hangs, TRBE state is always saved after ETE state and
> restored before ETE state.
>
> >
> > >       if (drvdata->trfcr)
> > >               write_trfcr(drvdata->save_trfcr);
> > >       if (drvdata->state_needs_restore)
> > > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/h=
wtracing/coresight/coresight-trbe.c
> > > index fff67aac8418..38bf46951a82 100644
> > > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > > @@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] =3D {
> > >   */
> > >  #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES       256
> > >
> > > +struct trbe_save_state {
> > > +     u64 trblimitr;
> > > +     u64 trbbaser;
> > > +     u64 trbptr;
> > > +     u64 trbsr;
> > > +};
> >
> > This seems to accommodate all required TRBE registers. Although this is
> > very intuitive could you please also add a comment above this structure
> > explaining the elements like other existing structures in the file ?
>
> Will do in the v2 patch.
> >
> > > +
> > >  /*
> > >   * struct trbe_cpudata: TRBE instance specific data
> > >   * @trbe_flag                - TRBE dirty/access flag support
> > > @@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] =3D {
> > >   * @cpu                      - CPU this TRBE belongs to.
> > >   * @mode             - Mode of current operation. (perf/disabled)
> > >   * @drvdata          - TRBE specific drvdata
> > > + * @state_needs_save - Need to save trace registers when entering cp=
u idle
> > > + * @state_needs_restore      - Need to restore trace registers when =
exiting cpu idle
> > > + * @save_state               - Saved trace registers
> > >   * @errata           - Bit map for the errata on this TRBE.
> > >   */
> > >  struct trbe_cpudata {
> > > @@ -133,6 +143,9 @@ struct trbe_cpudata {
> > >       enum cs_mode mode;
> > >       struct trbe_buf *buf;
> > >       struct trbe_drvdata *drvdata;
> > > +     bool state_needs_save;
> >
> > This tracks whether coresight_loses_context_with_cpu() is supported
> > on the CPU or not.
> >
> > > +     bool state_needs_restore;
> >
> > This tracks whether the state has been saved earlier and hence can
> > be restored later on when required.
>
> Will update the comment in the v2 patch.
>
> >
> > > +     struct trbe_save_state save_state;
> > >       DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
> > >  };
> > >
> > > @@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int i=
rq, void *dev)
> > >       return IRQ_HANDLED;
> > >  }
> > >
> > > +static void arm_trbe_cpu_save(struct coresight_device *csdev)
> > > +{
> > > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > > +     struct trbe_save_state *state =3D &cpudata->save_state;
> >
> > Please move the above statement after the following conditional
> > block. Because struct trbe_save_state is not going to be required
> > if arm_trbe_cpu_save() returns prematurely from here.
> >
> Will do in the v2 patch.
> > > +
> > > +     if (cpudata->mode =3D=3D CS_MODE_DISABLED || !cpudata->state_ne=
eds_save)
> > > +             return;> +
> > > +     state->trbbaser =3D read_sysreg_s(SYS_TRBBASER_EL1);
> > > +     state->trbptr =3D read_sysreg_s(SYS_TRBPTR_EL1);
> > > +     state->trblimitr =3D read_sysreg_s(SYS_TRBLIMITR_EL1);
> > > +     state->trbsr =3D read_sysreg_s(SYS_TRBSR_EL1);
> > > +     cpudata->state_needs_restore =3D true;
> >
> > This looks right.
> >
> > > +}
> > > +
> > > +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> > > +{
> > > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > > +     struct trbe_save_state *state =3D &cpudata->save_state;
> > Please move this assignment inside the block where these registers
> > actually get restored after all checks are done.
> >
> Will do in the v2 patch.
> > > +
> > > +     if (cpudata->state_needs_restore) {
> > > +             /*
> > > +              * To avoid disruption of normal tracing, restore trace
> > > +              * registers only when TRBE lost power (TRBLIMITR =3D=
=3D 0).
> > > +              */
> >
> > Although this sounds like a reasonable condition, but what happens
> > when TRBE restoration is skipped ?
> >
> There are cases when a CPU fails to enter a low power state or only enter=
s
> a shallow low power state. So TRBE state may not be lost when calling
> arm_trbe_cpu_restore(). In this case, if we write the TRBE registers, pro=
bably
> we lose ETM data written between save and restore. This may not matter,
> but could there be a race condition between this restore function and TRB=
E
> interrupt handler (which could also write TRBE registers)? I can't think
> this up very well. So I only restore registers when state is lost. If
> the state isn't
> lost, TRBE should stay in enabled mode, and continue receiving data from =
ETE.
>
> > > +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) =3D=3D 0) {
> >
> >                         state =3D &cpudata->save_state
> >
> > > +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL=
1);
> > > +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> > > +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> > > +                     set_trbe_enabled(cpudata, state->trblimitr);
> > > +             }
> > > +             cpudata->state_needs_restore =3D false;
> >
> > That means earlier captured state is dropped without a restoration.
> >
> > > +     }
> > > +}
> > > +
> > >  static const struct coresight_ops_sink arm_trbe_sink_ops =3D {
> > >       .enable         =3D arm_trbe_enable,
> > >       .disable        =3D arm_trbe_disable,
> > >       .alloc_buffer   =3D arm_trbe_alloc_buffer,
> > >       .free_buffer    =3D arm_trbe_free_buffer,
> > >       .update_buffer  =3D arm_trbe_update_buffer,
> > > +     .percpu_save    =3D arm_trbe_cpu_save,
> > > +     .percpu_restore =3D arm_trbe_cpu_restore,
> >
> > Why this percpu_* prefix ?
> >
> Added percpu_ prefix because it's only for percpu_sink
> (coresight_get_percpu_sink).
> Please let me know if you have a better name.
> > >  };
> > >
> > >  static const struct coresight_ops arm_trbe_cs_ops =3D {
> > > @@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
> > >       cpudata->trbe_flag =3D get_trbe_flag_update(trbidr);
> > >       cpudata->cpu =3D cpu;
> > >       cpudata->drvdata =3D drvdata;
> > > +     cpudata->state_needs_save =3D coresight_loses_context_with_cpu(
> > > +             &drvdata->pdev->dev);
> > > +     cpudata->state_needs_restore =3D false;
> >
> > The init here looks good.
> >
> > >       return;
> > >  cpu_clear:
> > >       cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
> > > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > > index d79a242b271d..fec375d02535 100644
> > > --- a/include/linux/coresight.h
> > > +++ b/include/linux/coresight.h
> > > @@ -362,6 +362,10 @@ enum cs_mode {
> > >   * @alloc_buffer:    initialises perf's ring buffer for trace collec=
tion.
> > >   * @free_buffer:     release memory allocated in @get_config.
> > >   * @update_buffer:   update buffer pointers after a trace session.
> > > + * @percpu_save:     saves state when CPU enters idle state.
> > > + *                   Only set for percpu sink.
> > > + * @percpu_restore:  restores state when CPU exits idle state.
> > > + *                   only set for percpu sink.
> > >   */
> > >  struct coresight_ops_sink {
> > >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode=
,
> > > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> > >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> > >                             struct perf_output_handle *handle,
> > >                             void *sink_config);
> > > +     void (*percpu_save)(struct coresight_device *csdev);
> > > +     void (*percpu_restore)(struct coresight_device *csdev);
> >
> > Again - why this percpu_* prefix ?
> >
> > >  };
> > >
> > >  /**

I do not think this is the best approach.

The TRBE driver has its own power management registration functions,
so is it not possible for the save and restore should be handled
there, through a PM notifier, just as the ETM/ETE is?

Drop the unnecessary DT entry - TRBE is a per cpu architectural device
- if a TRBE is present, we know it will power down with the PE.

The CoreSight architecture permits an ETE to drive trace to an
external sink - so the TRBE might be present but unused, therefore
hooking into a source driver that may not be driving trace into the
device does not seem wise..

The TRBE PM can follow the model of the ETE / ETMv4 and save and
restore if currently in use.

This approach will isolate the changes to the TRBE driver where they should=
 be.

Regards

Mike


--=20
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
