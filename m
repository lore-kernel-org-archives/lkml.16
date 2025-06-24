Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95CB170826
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750791900; cv=none; b=pYYAUg/eaThQM//g2kHn3rxoIjlGnP/f9foxJg8yAGlLZvp4pRTIw1Kz5aHcTIEJyCRVhOzcaCHn/dFpHLgmcTjU90TdT0qoLEoeZMYNUnQBo0M2lGGOyVg23m2B+LVXxbKNLciYnIptzrL3Ceuvz8TFr5p1FObvAse2YZ1FwLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750791900; c=relaxed/simple;
	bh=2gIzDtztlXFsBmfrdVWYGJGg2T2mtarQJIjU/uKnbHs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WfSVf5GtcH4eEJ41n9v44YblDix/ZJaBUgUp3I2ocrE/eWO8Tf748qh8QRBxXxStPwWT87wsIdy8HPmEQtYVA7Z6yQ6QSV5iN1BsoxyUAJj9KJSsta0E6hgjvFGObu0a0tOk6P84UrvxVmXSPPaA60LUV0UzD5yRZaPi5bbgeIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=afp+DIJh; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="afp+DIJh"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3141b84bf65so921172a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 12:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750791898; x=1751396698; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K2Kngavp4rtDZRNS2LgoI8pHut0RmsW/toTlJ2MFFp0=;
        b=afp+DIJh8kaMKzsjPbVLkdTWeWhhAgqy4wfc98CxE0vAqsI+xmK2nI6wzwpknXRrkv
         +M9dQk2IZil7PmtvVGOshQZ0gvi1fuuHpzextyJxRjWt7Re6GnBnl7yxDIqnTy9GYonC
         b8qtcZzwB+4UJMwDlTxIRmfjJYp6Lmitw8mP2VcVT2O4cbza5cuMTXFDVXPy7u4tqEHY
         mhdt9QM+dGyGJisWszTdJNsjSYRGtpkiJTdolGGwBBwMyfEqPaoheaRMVy4k2CM2Dw+H
         MrD9hPKH0XjPxOR9moFFTPz9gAl//2dyUZjXdBY9t9hPcvSdTEGT+YUSmpmNteCE9ym5
         umWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750791898; x=1751396698;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K2Kngavp4rtDZRNS2LgoI8pHut0RmsW/toTlJ2MFFp0=;
        b=tjFh2nYaeRUmDERISAvFC5ZKKzaz1TGBBMwzzIjfVbIDqwK3O5D/EAzIkEwwNVWJPB
         4j0+k4qFzkgzW7fcm8DS9UPMXOe78da1r8IsPd51Wbfoq77FMBdUV7PMI+TzOnxQKN25
         EnnHEDmfk5NjBnemaBD4sFgTK3wd+rzkvdVOEcqHcw4964IuFtrt61a7QAk3V/noVNUk
         clWD8h4QB4M9qZswjNPouqmwr0y7Xu7dVScwbqB57WAe22rYQLjuw1GxJbaM4sMkz8W+
         FvVgKUtpxP3cRz5QMKd4xBuPQ2sr6LcCrjqMAtFx94YkxsXIhV/TpPDmc1Q+fDoTAP3a
         BgiQ==
X-Gm-Message-State: AOJu0YydhLHMxyBjmwNbWVCcosPrO7LE38h4lc2mHnHZapXKxcFgBPCo
	+cij88OzE3ekXQ5mcvlH8HkWEs9c/HZ0zXZUms7o+3JPoxoJMp2BtGgyofHjL08xf7+zEceliFH
	RS+NJXDtajLOiHMnMpIyxMiPrbI0WajLB7BOkEVOP
X-Gm-Gg: ASbGncs9gmB4K6ENOE8t5j7/2MDUOumt0jS9vduZdhUK9z/ZpdqiTZQPtiXdqgx+6q0
	RQlZP92/6Oogcqy3zr/8LV6D1Vu6a+ynOzG+eXokgETqseNgfznTlanegikHz5dNQNWdy6VOTdM
	hrdJIsgC2jEFWacxgZaZM3fUqXjPPLo47w9EEjkxzj2qY=
X-Google-Smtp-Source: AGHT+IFKwv0p7g2UPZAuAO0ldFtReM/ENeLUBTFg81N68i1C71I9bm1zFs4UOFtwvKXxSowZacvDiUZFQTjZ6DR5MJk=
X-Received: by 2002:a17:90b:35cf:b0:312:959:dc3f with SMTP id
 98e67ed59e1d1-315f25d150dmr30205a91.3.1750791897784; Tue, 24 Jun 2025
 12:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609080841.1394941-1-nikunj@amd.com> <858qlhhj4c.fsf@amd.com>
In-Reply-To: <858qlhhj4c.fsf@amd.com>
From: Dionna Amalie Glaze <dionnaglaze@google.com>
Date: Tue, 24 Jun 2025 12:04:45 -0700
X-Gm-Features: AX0GCFutkCai5Ej5clSCJJHAvRh79dv943h8tZ9hiv-rxScUYBH5_ybiJhbKr2Q
Message-ID: <CAAH4kHZPrDRF3sZ2GxFxMeue3o9PsEL7p-j8bKL2mxgBjR0ATg@mail.gmail.com>
Subject: Re: [PATCH] x86/sev: Use TSC_FACTOR for Secure TSC frequency calculation
To: Nikunj A Dadhania <nikunj@amd.com>
Cc: linux-kernel@vger.kernel.org, bp@alien8.de, x86@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com, 
	thomas.lendacky@amd.com, aik@amd.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 9:17=E2=80=AFPM Nikunj A Dadhania <nikunj@amd.com> =
wrote:
>
> Nikunj A Dadhania <nikunj@amd.com> writes:
>
> > When using Secure TSC, the GUEST_TSC_FREQ MSR reports a frequency based=
 on
> > the nominal P0 frequency, which deviates slightly (typically ~0.2%) fro=
m
> > the actual mean TSC frequency due to clocking parameters. Over extended=
 VM
> > uptime, this discrepancy accumulates, causing clock skew between the
> > hypervisor and SEV-SNP VM, leading to early timer interrupts as perceiv=
ed
> > by the guest.
> >
> > The guest kernel relies on the reported nominal frequency for TSC-based
> > timekeeping, while the actual frequency set during SNP_LAUNCH_START may
> > differ. This mismatch results in inaccurate time calculations, causing =
the
> > guest to perceive hrtimers as firing earlier than expected.
> >
> > Utilize the TSC_FACTOR from the SEV firmware's secrets page (see "Secre=
ts
> > Page Format" in the SNP Firmware ABI Specification) to calculate the me=
an
> > TSC frequency, ensuring accurate timekeeping and mitigating clock skew =
in
> > SEV-SNP VMs.
> >
> > Use early_ioremap_encrypted() to map the secrets page as
> > ioremap_encrypted() uses kmalloc() which is not available during early =
TSC
> > initialization and causes a panic.
> >
> > Fixes: 73bbf3b0fbba ("x86/tsc: Init the TSC for Secure TSC guests")
> > Reviewed-by: Tom Lendacky <thomas.lendacky@amd.com>
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Nikunj A Dadhania <nikunj@amd.com>
>
> A gentle reminder for review.
>
> Thanks
> Nikunj
>
> > ---
> >  arch/x86/include/asm/sev.h |  5 ++++-
> >  arch/x86/coco/sev/core.c   | 24 ++++++++++++++++++++++++
> >  2 files changed, 28 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/include/asm/sev.h b/arch/x86/include/asm/sev.h
> > index 58e028d42e41..655d7e37bbcc 100644
> > --- a/arch/x86/include/asm/sev.h
> > +++ b/arch/x86/include/asm/sev.h
> > @@ -282,8 +282,11 @@ struct snp_secrets_page {
> >       u8 svsm_guest_vmpl;
> >       u8 rsvd3[3];
> >
> > +     /* The percentage decrease from nominal to mean TSC frequency. */
> > +     u32 tsc_factor;
> > +
> >       /* Remainder of page */
> > -     u8 rsvd4[3744];
> > +     u8 rsvd4[3740];
> >  } __packed;
> >
> >  struct snp_msg_desc {
> > diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
> > index b6db4e0b936b..ffd44712cec0 100644
> > --- a/arch/x86/coco/sev/core.c
> > +++ b/arch/x86/coco/sev/core.c
> > @@ -2167,15 +2167,39 @@ static unsigned long securetsc_get_tsc_khz(void=
)
> >
> >  void __init snp_secure_tsc_init(void)
> >  {
> > +     struct snp_secrets_page *secrets;
> >       unsigned long long tsc_freq_mhz;
> > +     void *mem;
> >
> >       if (!cc_platform_has(CC_ATTR_GUEST_SNP_SECURE_TSC))
> >               return;
> >
> > +     mem =3D early_memremap_encrypted(sev_secrets_pa, PAGE_SIZE);
> > +     if (!mem) {
> > +             pr_err("Unable to get TSC_FACTOR: failed to map the SNP s=
ecrets page.\n");
> > +             sev_es_terminate(SEV_TERM_SET_LINUX, GHCB_TERM_SECURE_TSC=
);
> > +     }
> > +
> > +     secrets =3D (__force struct snp_secrets_page *)mem;
> > +
> >       setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
> >       rdmsrq(MSR_AMD64_GUEST_TSC_FREQ, tsc_freq_mhz);
> >       snp_tsc_freq_khz =3D (unsigned long)(tsc_freq_mhz * 1000);
> >
> > +     /*
> > +      * Obtain the mean TSC frequency by decreasing the nominal TSC fr=
equency with
> > +      * TSC_FACTOR as documented in the SNP Firmware ABI specification=
:
> > +      *
> > +      * GUEST_TSC_FREQ * (1 - (TSC_FACTOR * 0.00001))
> > +      *
> > +      * which is equivalent to:
> > +      *
> > +      * GUEST_TSC_FREQ -=3D (GUEST_TSC_FREQ * TSC_FACTOR) / 100000;
> > +      */
> > +     snp_tsc_freq_khz -=3D (snp_tsc_freq_khz * secrets->tsc_factor) / =
100000;
> > +

To better match the documentation and to not store an intermediate
result in a global, it'd be
good to add local variables. I'm also not a big fan of ABI constants
in the implementation.

guest_tsc_freq_khz =3D (unsigned long)(tsc_freq_mhz * 1000);
snp_tsc_freq_khz =3D guest_tsc_freq_khz -
SNP_SCALE_TSC_FACTOR(guest_tsc_freq_khz * secrets->tsc_factor);

...in a header somewhere...
/**
 * The SEV-SNP secrets page contains an encoding of the percentage decrease
 * from nominal TSC frequency to mean TSC frequency due to clocking paramet=
ers.
 * The encoding is in parts per 100,000, so the following is an
integer-based scaling macro.
 */
#define SNP_SCALE_TSC_FACTOR(x) ((x) / 100000)

> >       x86_platform.calibrate_cpu =3D securetsc_get_tsc_khz;
> >       x86_platform.calibrate_tsc =3D securetsc_get_tsc_khz;
> > +
> > +     early_memunmap(mem, PAGE_SIZE);
> >  }
> >
> > base-commit: 337964c8abfbef645cbbe25245e25c11d9d1fc4c
> > --
> > 2.43.0
>


--=20
-Dionna Glaze, PhD, CISSP, CCSP (she/her)
