Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB78139E
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:05:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745618717; cv=none; b=q6xnJ88uOTvq8i48qo3exmRQzbC0ihbjFsaCdtmHvMhY+QUd/QfhpY44z8vETt+MbEl8Qy/JehE9GWnKBJkOw27VxTlgRWokdNAUcz2IDsVBLeIFLV4swpUBjxkPOpj3FKEsBIAfJsZafBcYHnb4LY0gP14+OYuLPHvD4qiC5T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745618717; c=relaxed/simple;
	bh=wpy8ICWTA4V750P4IJKzarxHqFc4K0UbZ5O1LR4NHEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OXsAZ/YENm1Un5vf6WUF/WlDcROl9hAHHlH4bppC62WGLYmcJkrsMFWQP7gif/8DLlp3oL3wEWtVzfIfD0gzvc3WehI8gHRZHqM2YzW8eYRwcgc29BruPRrJgk7iETr9FWNN8k+MX/xMBkU+EgqoZKl6XgzydTR/ofGq1kaz+dI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wT2oeKNv; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wT2oeKNv"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-6e8fce04655so28651556d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745618713; x=1746223513; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eQEaOfuvvVeuvSrF1uTd3hXLlI06wb8Sqqmzq7nvY+c=;
        b=wT2oeKNvXNS7T3us6WGNEofralboZjlOVSiIaozldYpZRNSVCGT/GXfhysZ8XZra0d
         ZqMI4a4DKE3iyMQEoo+R5gmzhFTHiYUZIw53YeBIA67UsgWxMo2xPZEdKXWnWSOl7+4j
         8RoTKlt3JqNNaNyR5jSNvdCQOEk4bcPn0Lura8xK/IROkcghpxsaR6nybP1vJmoG3zlt
         7vSrYA3fHB1lUIWwhFDNdTKPfDvk0G9HlHdK4ApZsh/vhQaaABsR5jXua5JLE6/oYllB
         GAfFptie3bTLRXQQxp0mZ7T6B5E12/cQoaQu4u3/mtowuQ56M+be5taOAmBgdmgInQ7k
         dEnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745618713; x=1746223513;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eQEaOfuvvVeuvSrF1uTd3hXLlI06wb8Sqqmzq7nvY+c=;
        b=fOjqiruMEhGT47kafyRi7e0fJrknmtmhkF4Ye6C4GPbYvFAcBbPTGaMFDQ4EQdhygj
         SYwMBNraHnNNIloOQ3lE88T8Am1I1z1rn4Alc3f95ihnAy6iKhhPfOpv0EjKQMDVnU7e
         cFop650Wpa/ysofvMa1ob/QdNl5acCBBoxa6vtxCWey98zvRKN9lRXyk903rSkUyhb1J
         i1Q5G5ucRHIjam3NS4+Eg4vwE5G8hw75nQHlWf0pdg2YsOQDqrL3vHimEVdNqUSJcem2
         723z87/Cuucgh/jRZs8eEKEyFVz79HiE05inyMlEsTGRjrrDDRODKa7VaOPq6iMJGPAP
         l9rA==
X-Forwarded-Encrypted: i=1; AJvYcCXuLSXUF1fEYpwrpbjEbgyVXllC8BQgPQ+WSrkIyj55oY6HCyRwgPKF8aHhO1geOmsvIjjwfgZZc0eDggw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwaszpjowNVBPAqGKh7H4iqMv7AYePex4WxhtwJ44pmDY4aoHqA
	W+rwchmCB8s+XK8CRrpuieC/ewv3LWKJfhsZ/typi6EophjUI0zF89HaWz4OfUaIo+7R9rtbOiM
	DR7ZtKFrkp2uccp8pjB5AynARrFSYVa/Ge8k=
X-Gm-Gg: ASbGncsMgWvVkd3gFrF1BxIi+M/5QVP2nyMaSFoPAfCrm30FCuAPQ6H+G+DZfSr7soB
	HDf+UoLy6fT0QZmSE5pP3V4JK1fw2iRyFgbxwm1R5tZ2b8I5uhVDfx8FAzi/kjxurCub94GD5vd
	tKajF7VVHBosJajxSsk3c02xARrhgHaCwFCzR4vsQccWa5NIxcO7w=
X-Google-Smtp-Source: AGHT+IHYoKpdXfXgFXrJBFZpzCn/mfe9TNWUjRlQbefBw50/jJUuWZ6Fd+u+VMhaEICt4nTBFSQrCy1qeuWBU1l52v0=
X-Received: by 2002:a05:6214:2504:b0:6f0:e2d4:51fe with SMTP id
 6a1803df08f44-6f4cb9edb99mr65920026d6.26.1745618712759; Fri, 25 Apr 2025
 15:05:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
In-Reply-To: <731dbb1d-e804-4678-9b8c-40f6395e94a7@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Fri, 25 Apr 2025 15:05:01 -0700
X-Gm-Features: ATxdqUFPXkJDUxeyY_qhK-zlhKmqHCzSSlGClv2AG8Hfm8lv-9ZFAk_CP4I8Iok
Message-ID: <CALJ9ZPNExud7ZQ-ZgpVtPJHUsAyJv_O-CH8mCa6gUyu1E1T8zg@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 9:16=E2=80=AFPM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/24/25 04:30, Yabin Cui wrote:
> > Similar to ETE, TRBE may lose its context when a CPU enters low
> > power state. To make things worse, if ETE state is restored without
> > restoring TRBE state, it can lead to a stuck CPU due to an enabled
> > source device with no enabled sink devices.
>
> Could you please provide some more details about when the cpu gets
> stuck e.g dmesg, traces etc. Also consider adding those details in
> the commit message as well to establish the problem, this patch is
> trying to address.

This is already the best I know. When experimenting TRBE locally
(on Pixel 9), if I don't save TRBE state across low power state, when
recording system wide ETM data using TRBE on a CPU core. In a
few seconds, the CPU state becomes unknown (no message in dmesg).
Since the core may hold locks needed by other cores, it soon locks
other cores and causes a watchdog reset. I found the coresight driver
always carefully enables sink before source, and disables sink after
source. I guess there is some risk in not doing so, like the CPU hang
here. Maybe you know why?


>
> >
> > This patch introduces support for "arm,coresight-loses-context-with-cpu=
"
> > in the TRBE driver. When present, TRBE registers are saved before
> > and restored after CPU low power state. To prevent CPU hangs, TRBE
> > state is always saved after ETE state and restored after ETE state.
>
> The save and restore order here is
>
> 1. Save ETE
> 2. Save TRBE
> 3. Restore ETE
> 4. Restore TRBE
>
> >
> > Signed-off-by: Yabin Cui <yabinc@google.com>
> > ---
> >  .../coresight/coresight-etm4x-core.c          | 13 ++++-
> >  drivers/hwtracing/coresight/coresight-trbe.c  | 53 +++++++++++++++++++
> >  include/linux/coresight.h                     |  6 +++
> >  3 files changed, 71 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwtracing/coresight/coresight-etm4x-core.c b/drive=
rs/hwtracing/coresight/coresight-etm4x-core.c
> > index e5972f16abff..1bbaa1249206 100644
> > --- a/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > +++ b/drivers/hwtracing/coresight/coresight-etm4x-core.c
> > @@ -1863,6 +1863,7 @@ static int __etm4_cpu_save(struct etmv4_drvdata *=
drvdata)
> >  static int etm4_cpu_save(struct etmv4_drvdata *drvdata)
> >  {
> >       int ret =3D 0;
> > +     struct coresight_device *sink;
> >
> >       /* Save the TRFCR irrespective of whether the ETM is ON */
> >       if (drvdata->trfcr)
> > @@ -1871,8 +1872,14 @@ static int etm4_cpu_save(struct etmv4_drvdata *d=
rvdata)
> >        * Save and restore the ETM Trace registers only if
> >        * the ETM is active.
> >        */
> > -     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state)
> > +     if (coresight_get_mode(drvdata->csdev) && drvdata->save_state) {
> >               ret =3D __etm4_cpu_save(drvdata);
> > +             if (ret =3D=3D 0) {
> > +                     sink =3D coresight_get_percpu_sink(drvdata->cpu);
> > +                     if (sink && sink_ops(sink)->percpu_save)
> > +                             sink_ops(sink)->percpu_save(sink);
> > +             }
> > +     }
> >       return ret;
> >  }
> >
> > @@ -1977,6 +1984,10 @@ static void __etm4_cpu_restore(struct etmv4_drvd=
ata *drvdata)
> >
> >  static void etm4_cpu_restore(struct etmv4_drvdata *drvdata)
> >  {
> > +     struct coresight_device *sink =3D coresight_get_percpu_sink(drvda=
ta->cpu);
> > +
> > +     if (sink && sink_ops(sink)->percpu_restore)
> > +             sink_ops(sink)->percpu_restore(sink);
>
> TRBE gets restored first which contradicts the order mentioned
> earlier in the commit message ?
>
An error in the commit message, should be:
To prevent CPU hangs, TRBE state is always saved after ETE state and
restored before ETE state.

>
> >       if (drvdata->trfcr)
> >               write_trfcr(drvdata->save_trfcr);
> >       if (drvdata->state_needs_restore)
> > diff --git a/drivers/hwtracing/coresight/coresight-trbe.c b/drivers/hwt=
racing/coresight/coresight-trbe.c
> > index fff67aac8418..38bf46951a82 100644
> > --- a/drivers/hwtracing/coresight/coresight-trbe.c
> > +++ b/drivers/hwtracing/coresight/coresight-trbe.c
> > @@ -115,6 +115,13 @@ static int trbe_errata_cpucaps[] =3D {
> >   */
> >  #define TRBE_WORKAROUND_OVERWRITE_FILL_MODE_SKIP_BYTES       256
> >
> > +struct trbe_save_state {
> > +     u64 trblimitr;
> > +     u64 trbbaser;
> > +     u64 trbptr;
> > +     u64 trbsr;
> > +};
>
> This seems to accommodate all required TRBE registers. Although this is
> very intuitive could you please also add a comment above this structure
> explaining the elements like other existing structures in the file ?

Will do in the v2 patch.
>
> > +
> >  /*
> >   * struct trbe_cpudata: TRBE instance specific data
> >   * @trbe_flag                - TRBE dirty/access flag support
> > @@ -123,6 +130,9 @@ static int trbe_errata_cpucaps[] =3D {
> >   * @cpu                      - CPU this TRBE belongs to.
> >   * @mode             - Mode of current operation. (perf/disabled)
> >   * @drvdata          - TRBE specific drvdata
> > + * @state_needs_save - Need to save trace registers when entering cpu =
idle
> > + * @state_needs_restore      - Need to restore trace registers when ex=
iting cpu idle
> > + * @save_state               - Saved trace registers
> >   * @errata           - Bit map for the errata on this TRBE.
> >   */
> >  struct trbe_cpudata {
> > @@ -133,6 +143,9 @@ struct trbe_cpudata {
> >       enum cs_mode mode;
> >       struct trbe_buf *buf;
> >       struct trbe_drvdata *drvdata;
> > +     bool state_needs_save;
>
> This tracks whether coresight_loses_context_with_cpu() is supported
> on the CPU or not.
>
> > +     bool state_needs_restore;
>
> This tracks whether the state has been saved earlier and hence can
> be restored later on when required.

Will update the comment in the v2 patch.

>
> > +     struct trbe_save_state save_state;
> >       DECLARE_BITMAP(errata, TRBE_ERRATA_MAX);
> >  };
> >
> > @@ -1187,12 +1200,49 @@ static irqreturn_t arm_trbe_irq_handler(int irq=
, void *dev)
> >       return IRQ_HANDLED;
> >  }
> >
> > +static void arm_trbe_cpu_save(struct coresight_device *csdev)
> > +{
> > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > +     struct trbe_save_state *state =3D &cpudata->save_state;
>
> Please move the above statement after the following conditional
> block. Because struct trbe_save_state is not going to be required
> if arm_trbe_cpu_save() returns prematurely from here.
>
Will do in the v2 patch.
> > +
> > +     if (cpudata->mode =3D=3D CS_MODE_DISABLED || !cpudata->state_need=
s_save)
> > +             return;> +
> > +     state->trbbaser =3D read_sysreg_s(SYS_TRBBASER_EL1);
> > +     state->trbptr =3D read_sysreg_s(SYS_TRBPTR_EL1);
> > +     state->trblimitr =3D read_sysreg_s(SYS_TRBLIMITR_EL1);
> > +     state->trbsr =3D read_sysreg_s(SYS_TRBSR_EL1);
> > +     cpudata->state_needs_restore =3D true;
>
> This looks right.
>
> > +}
> > +
> > +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> > +{
> > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > +     struct trbe_save_state *state =3D &cpudata->save_state;
> Please move this assignment inside the block where these registers
> actually get restored after all checks are done.
>
Will do in the v2 patch.
> > +
> > +     if (cpudata->state_needs_restore) {
> > +             /*
> > +              * To avoid disruption of normal tracing, restore trace
> > +              * registers only when TRBE lost power (TRBLIMITR =3D=3D =
0).
> > +              */
>
> Although this sounds like a reasonable condition, but what happens
> when TRBE restoration is skipped ?
>
There are cases when a CPU fails to enter a low power state or only enters
a shallow low power state. So TRBE state may not be lost when calling
arm_trbe_cpu_restore(). In this case, if we write the TRBE registers, proba=
bly
we lose ETM data written between save and restore. This may not matter,
but could there be a race condition between this restore function and TRBE
interrupt handler (which could also write TRBE registers)? I can't think
this up very well. So I only restore registers when state is lost. If
the state isn't
lost, TRBE should stay in enabled mode, and continue receiving data from ET=
E.

> > +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) =3D=3D 0) {
>
>                         state =3D &cpudata->save_state
>
> > +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1)=
;
> > +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> > +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> > +                     set_trbe_enabled(cpudata, state->trblimitr);
> > +             }
> > +             cpudata->state_needs_restore =3D false;
>
> That means earlier captured state is dropped without a restoration.
>
> > +     }
> > +}
> > +
> >  static const struct coresight_ops_sink arm_trbe_sink_ops =3D {
> >       .enable         =3D arm_trbe_enable,
> >       .disable        =3D arm_trbe_disable,
> >       .alloc_buffer   =3D arm_trbe_alloc_buffer,
> >       .free_buffer    =3D arm_trbe_free_buffer,
> >       .update_buffer  =3D arm_trbe_update_buffer,
> > +     .percpu_save    =3D arm_trbe_cpu_save,
> > +     .percpu_restore =3D arm_trbe_cpu_restore,
>
> Why this percpu_* prefix ?
>
Added percpu_ prefix because it's only for percpu_sink
(coresight_get_percpu_sink).
Please let me know if you have a better name.
> >  };
> >
> >  static const struct coresight_ops arm_trbe_cs_ops =3D {
> > @@ -1358,6 +1408,9 @@ static void arm_trbe_probe_cpu(void *info)
> >       cpudata->trbe_flag =3D get_trbe_flag_update(trbidr);
> >       cpudata->cpu =3D cpu;
> >       cpudata->drvdata =3D drvdata;
> > +     cpudata->state_needs_save =3D coresight_loses_context_with_cpu(
> > +             &drvdata->pdev->dev);
> > +     cpudata->state_needs_restore =3D false;
>
> The init here looks good.
>
> >       return;
> >  cpu_clear:
> >       cpumask_clear_cpu(cpu, &drvdata->supported_cpus);
> > diff --git a/include/linux/coresight.h b/include/linux/coresight.h
> > index d79a242b271d..fec375d02535 100644
> > --- a/include/linux/coresight.h
> > +++ b/include/linux/coresight.h
> > @@ -362,6 +362,10 @@ enum cs_mode {
> >   * @alloc_buffer:    initialises perf's ring buffer for trace collecti=
on.
> >   * @free_buffer:     release memory allocated in @get_config.
> >   * @update_buffer:   update buffer pointers after a trace session.
> > + * @percpu_save:     saves state when CPU enters idle state.
> > + *                   Only set for percpu sink.
> > + * @percpu_restore:  restores state when CPU exits idle state.
> > + *                   only set for percpu sink.
> >   */
> >  struct coresight_ops_sink {
> >       int (*enable)(struct coresight_device *csdev, enum cs_mode mode,
> > @@ -374,6 +378,8 @@ struct coresight_ops_sink {
> >       unsigned long (*update_buffer)(struct coresight_device *csdev,
> >                             struct perf_output_handle *handle,
> >                             void *sink_config);
> > +     void (*percpu_save)(struct coresight_device *csdev);
> > +     void (*percpu_restore)(struct coresight_device *csdev);
>
> Again - why this percpu_* prefix ?
>
> >  };
> >
> >  /**
