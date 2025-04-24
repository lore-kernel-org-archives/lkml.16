Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 935B628F524
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745519883; cv=none; b=mO39+Ql+GZFkJsdSAzV/P+MMNY4lPEJl2tRaRllPVjp2ofAxghJfxpVRaymE438h+DxIjj/sAFsxJgQIpcac38CQrH8pbwYsqVddS/e7/FwGWueBjC32npx7CBjk98AAzJA6SVfhQcK6MxTdSy3BOT/kzZC47DQGaTUhe6BOgZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745519883; c=relaxed/simple;
	bh=BzWbctbwkOsBu5dIgj5N8Eo7Ns/K4fv6YgNG30UQ2B4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UxrvFa+E79KudIw7eoZmyD5ai06a6t3N1ICJ80e64+//tIkiS5NzADgVHNULM41K9pIaKPZ00Z1pEizGyKPhmEyia+A8DGSuSLxbji1DuXBJ4IGd6gIoFyjdWYX93D4EzhPx19bzfO5kGbZofQb8ratOXO6JZNtSahKTN3KkXKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=k7tNyhKd; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="k7tNyhKd"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6e8f06e13a4so28941146d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745519880; x=1746124680; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qiNWnQMtGrQqoGeghTFTaV+yI+YeCdjBAwSDvmoMUtU=;
        b=k7tNyhKdXr1bDtYWykZo9UmWD61KvhlLqa5y5L1b8FHPuFjdE+kdUD63hXRK8TOSal
         8AmaTVPJi5JxQVEE6ghd89X7MTxsZQoLUQ4YySV0Ghpmdsv16B9OZZyVmAy3/mO5HLqM
         WPRLEmqq9DkHymXjO6G8YFdFQKrehUYARVk9K2PHoXSuze5hqnzukEuH75JnGF8ins7W
         TCyvWA+Gp3bqfgBG2Z+oS4ZtZGPepOD7+ybm2KcWhCIBp+unB/iK1MoXORXheohPQ+2x
         3pz4CBl2cqxwQLYYi0/1oK69bb9YNPCKvd8nmilB+bv4rkDz2hrWba8e15HLkIq+D6OJ
         SXmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745519880; x=1746124680;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qiNWnQMtGrQqoGeghTFTaV+yI+YeCdjBAwSDvmoMUtU=;
        b=uNoy3R2dvYqYxtiuXS2iwOzGhtK2kVgIPF0up58gBD/VdFyUVezPpe6GUIzs6CN69c
         AM5EfaoTSadoQueFZk1LX0jO9lw4XfR2xP9t/f7lniGr8jEeLYvXJJeXX/gzdpEZ6gbA
         t8mZmNtBszp9zAF+bB/jrnCpGrVP6ScNzSYhPXN4Gs+zR9P4seokYfRM0aTRAngaJi8l
         M17GccGBIqQqTktt6bP0ta6jXbvmx/l7I9StOPuiDpYAyjKTqJo3c8VsuOPzO6csO+JB
         DogNo4gdzhXku4mRYRSO0WN3bxzN6EWRseI2Hdle3bXV9voa3Wqt5R+0wgZFQGWQPFSr
         1/tA==
X-Forwarded-Encrypted: i=1; AJvYcCWygQ/khgtrr+coP9pNusjvVhq/CUqWzjOHYPBL4+9dKNerHRUDKBjPZlM5OqvFLzxSzCoUnt0Xzpb20s4=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe7NRYk41D/YRa+13yRFk5WFUr9rmBTKTkyJd1ZUlnqTfOrfJD
	fhA4dlEGIccm8U4IHtlMB1kx6ClWFuB5TXagEIMggVOiwr6q9FCBGJB7MjrVU5Rn8NKuxaPrWht
	7T/oJd+NQRSYvjIu49YmvXmsTQEqV3wabrAg=
X-Gm-Gg: ASbGncsTHx0zyfC0DcUNOMMfFR/gEzyWyFFcXQk0zwskfqD5w0yVF04cwB8AhC9oIv1
	2Q3ZUhU5B6Kev/ealwi16DcYdyfOfsjzBL0eyI/T9WtLLQZH2bzPWj127uodKbD8QarQV4xiRdD
	outo00X1QKU+r4y2kJ2lABUqCTmX1lfevxnEAs04YZgnr7chvi1x2vmYY=
X-Google-Smtp-Source: AGHT+IEgzkCp19X1hUx0K4CNHyl42mitxUF8xCqnzHFeC6oinPUgS83/wR/eN1NJbe22i34g+1jituaQJixCrt2ksQg=
X-Received: by 2002:a05:6214:410f:b0:6f2:c94f:b12f with SMTP id
 6a1803df08f44-6f4c0f4aacamr56439356d6.3.1745519880182; Thu, 24 Apr 2025
 11:38:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423230046.1134389-1-yabinc@google.com> <038a4c10-14c6-4671-8db1-fd38dc73bccf@arm.com>
In-Reply-To: <038a4c10-14c6-4671-8db1-fd38dc73bccf@arm.com>
From: Yabin Cui <yabinc@google.com>
Date: Thu, 24 Apr 2025 11:37:48 -0700
X-Gm-Features: ATxdqUHMGcMM17vbRPuI0DigfaqnG-L_XwvB6bYJEBYXEW-89TJMuPJWEmcjWvk
Message-ID: <CALJ9ZPM4+OtyzFHWxrOeNWdFyGy+xoLCch+bH8O3AJDgMFk61g@mail.gmail.com>
Subject: Re: [PATCH] coresight: trbe: Save/restore state across CPU low power state
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@linaro.org>, 
	James Clark <james.clark@linaro.org>, Leo Yan <leo.yan@arm.com>, 
	Jie Gan <quic_jiegan@quicinc.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, coresight@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 24, 2025 at 1:46=E2=80=AFAM Anshuman Khandual
<anshuman.khandual@arm.com> wrote:
>
> On 4/24/25 04:30, Yabin Cui wrote:
> > Similar to ETE, TRBE may lose its context when a CPU enters low
> > power state. To make things worse, if ETE state is restored without
> > restoring TRBE state, it can lead to a stuck CPU due to an enabled
> > source device with no enabled sink devices.
> >
> > This patch introduces support for "arm,coresight-loses-context-with-cpu=
"
>
> But could "arm,coresight-loses-context-with-cpu" device tree property
> be associated wit TRBE devices ? OR this state save and restore needs
> to be handled in the firmware.

This property is handled by ETM/ETE driver. In ETM/ETE driver, the state ha=
s
options to be saved by firmware or by the driver. On my test device, which
is Pixel 9, the state is saved by the driver. I have also tested that TRBE =
state
can be saved by the TRBE driver.

>
> > in the TRBE driver. When present, TRBE registers are saved before
> > and restored after CPU low power state. To prevent CPU hangs, TRBE
> > state is always saved after ETE state and restored after ETE state.
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
> > +     bool state_needs_restore;
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
> > +
> > +     if (cpudata->mode =3D=3D CS_MODE_DISABLED || !cpudata->state_need=
s_save)
> > +             return;
> > +
> > +     state->trbbaser =3D read_sysreg_s(SYS_TRBBASER_EL1);
> > +     state->trbptr =3D read_sysreg_s(SYS_TRBPTR_EL1);
> > +     state->trblimitr =3D read_sysreg_s(SYS_TRBLIMITR_EL1);
> > +     state->trbsr =3D read_sysreg_s(SYS_TRBSR_EL1);
> > +     cpudata->state_needs_restore =3D true;
> > +}
> > +
> > +static void arm_trbe_cpu_restore(struct coresight_device *csdev)
> > +{
> > +     struct trbe_cpudata *cpudata =3D dev_get_drvdata(&csdev->dev);
> > +     struct trbe_save_state *state =3D &cpudata->save_state;
> > +
> > +     if (cpudata->state_needs_restore) {
> > +             /*
> > +              * To avoid disruption of normal tracing, restore trace
> > +              * registers only when TRBE lost power (TRBLIMITR =3D=3D =
0).
> > +              */
> > +             if (read_sysreg_s(SYS_TRBLIMITR_EL1) =3D=3D 0) {
> > +                     write_sysreg_s(state->trbbaser, SYS_TRBBASER_EL1)=
;
> > +                     write_sysreg_s(state->trbptr, SYS_TRBPTR_EL1);
> > +                     write_sysreg_s(state->trbsr, SYS_TRBSR_EL1);
> > +                     set_trbe_enabled(cpudata, state->trblimitr);
> > +             }
> > +             cpudata->state_needs_restore =3D false;
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
> >  };
> >
> >  /**
