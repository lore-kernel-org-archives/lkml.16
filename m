Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BECA27587B;
	Tue, 15 Apr 2025 06:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744700096; cv=none; b=m2RjvlI8dGRjrOgq2qo7pCm4PrypSB4agLOVtnmAhuIC4If4CXWsEYf4iAQCDvi5TNV/upkQxiTDMsXA0azjG7tBiKPJ+XbGCI+HugtADAP/NnHjIHlnFDNrLvltDg8Lf2uM9R/yb2m2B5cth2xjt+vkOmlyJMWaRVKLUzWT+sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744700096; c=relaxed/simple;
	bh=otczYa1ghEak+qqgPZ6Ve17y269l2h98GsBiXGcj3Fs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VaXL9jVS3BRmY1AVquZoQSL2DDBdWL2fAMM+ddulork9JwVBHW/PXer3E8WPyfbGu9KE2LbiwlLdC0BBG3S7npCceiwMiNcRi0l3NVCxyh3fdA4diO3zUNPtYsKBPJ5mOuPUD+nLYTK694lcyZRvn117SU6y7bwM2CtszQFtoOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OijRX4xz; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OijRX4xz"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30bf1d48843so44082721fa.2;
        Mon, 14 Apr 2025 23:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744700092; x=1745304892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2THuqnnjpaeGK3L+ZcHQ6pVri6WkM/B5U621pyeSAeA=;
        b=OijRX4xzE1s3qQWGiR3kuncCF6vJvzW7KkGukIdcVDx0wHgj8RkEZEHmud3gc0pPr0
         Sbmpi1ZJ69SuZELQvXWBO7W2nICHXOEv5kTOXEO4G9oN2IxEyR9EmA3VZxy0Kc1dAEu5
         NV/83kr+1CmkU1jRJNhl2633zA6sVlkKNF/8iwogYICCKS2rUOj072ZKFJrHT8ITn+fB
         9sKGYs+JBVAXZ1RSuA/3y6hVB+9cWYOQdAnqglsIgcZeDYzKvvrCd+SXGyVHF722WePd
         Muul9ZLADoaOnE+UZkeH/cu92mSaZunmYCWallgGUaGmFDLudifU6ktqJmlrqUvJhed/
         poGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744700092; x=1745304892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2THuqnnjpaeGK3L+ZcHQ6pVri6WkM/B5U621pyeSAeA=;
        b=QsA+cm1HkAQFpzyPNsMF0movAnACDa7JKORPvJy0k3hE0ywsdtgPi7Wj2aLAdsSfP6
         VLxZgMuoUjocM9eDbHwRZJ9wdFEqnLOfYSPYC2VZRaXADzRaLwdrRnJPs5CwV/E+riSr
         Wk4pDqeh0z4Z6m+On1bWGU55hfH/PkQJbvrS2xH9WwDz27Dic4au2N4TLB63Bihhqpu+
         ydTNNpA6k/GLLljPKKNajrdRYMPzhTpJugWm/Te0FCRhg5uD8OkCY+EZsircfj8KfTdg
         aL1cOvtwMcq4+sV2P2r7OZadj3r5bI6xIYtQSupSy6Vq5/fYYULZEsc/6EJ//+Z0AeaR
         qk9A==
X-Forwarded-Encrypted: i=1; AJvYcCVqIEJ5wfHSYAr/plNxz5NjSr/m06hXFXaazwjoiUPeqv1fDOkuv/+2ZSdUicJwjWnPHWljUbbReLbWumTXub+InHKBeQ==@vger.kernel.org, AJvYcCWoApVrhm0+UNgk9uYBq3L9cVOQ4hPi+Ppy3vMOgvC26krHCPIs19gTNICt78eEmCA6qke2cI1iYCGKQjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyAP+LpQEw+66TrpxeyENDwWPobDKgk8G5WhOi+N3tsli9YDxX
	NejCFSIKkk6FtAgCCDrtXE2dB0DiqDi7JfsJvAVZj9A3hmfwsAavjMYK8CKgY6ZH3uqTRKEYcKD
	5ICRvIHKMjJTbvD+cqGY+Xx+FAgM=
X-Gm-Gg: ASbGncu8y06UG22TAzejHC/SYhQUSV9MVVpmmYpe69tqgmX6ODMPQh2AOhjEBcmfyNA
	TdRnd8mPoTGvAMnXbkgInxaKm5GGIQGmLkiJhNESNL13WwBcOEOD4d4CQAXKlb27ueuOBEMFnYh
	4UH+1z/rCzOolcP84n/zmzJQ==
X-Google-Smtp-Source: AGHT+IFAbvuR21DIztnhuL0l3222BeT4W2KZCRfgDNpf5QWXiSJQymbLDiT8gigzr/0cN+mDSfsulSKa5POqR3x76nI=
X-Received: by 2002:a05:651c:1515:b0:307:9555:dc5e with SMTP id
 38308e7fff4ca-310499d1599mr52119541fa.3.1744700091727; Mon, 14 Apr 2025
 23:54:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414092132.40369-1-shouyeliu@gmail.com> <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>
 <f673452d7afc4419120f2cdb32e5033c35f22229.camel@linux.intel.com>
In-Reply-To: <f673452d7afc4419120f2cdb32e5033c35f22229.camel@linux.intel.com>
From: liu shouye <shouyeliu@gmail.com>
Date: Tue, 15 Apr 2025 14:54:40 +0800
X-Gm-Features: ATxdqUGj1yNhUoVoGrEdPQ1vFpN9Q44lqcabNjqRD9KtUy2IYKuMJLVrh98hNJw
Message-ID: <CAAscG3W+QpD8xqo3qB_u2ViuUA6-_VsBT3GExU-DakDZJwtN8Q@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state on
 init failure
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

srinivas pandruvada <srinivas.pandruvada@linux.intel.com> =E4=BA=8E2025=E5=
=B9=B44=E6=9C=8815=E6=97=A5=E5=91=A8=E4=BA=8C 00:08=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Mon, 2025-04-14 at 13:41 +0300, Ilpo J=C3=A4rvinen wrote:
> > On Mon, 14 Apr 2025, shouyeliu wrote:
> >
> > > When uncore_event_cpu_online() fails to initialize a control CPU
> > > (e.g.,
> > > due to memory allocation failure or uncore_freq_add_entry()
> > > errors),
> > > the code leaves stale entries in uncore_cpu_mask after that online
> > > CPU
> > > will not try to call uncore_freq_add_entry, resulting in no sys
> > > interface.
> >
> > Please add () after any name that refers to a C function (you're not
> > even
> > being consistent here as you had it in some cases but not here).
ok,I will modify it in the next version
> >
> > Please try to split the very long sentence a bit and make it more
> > obvious
> > what causes what as the current wording is a bit vague, did you mean:
> > uncore_event_cpu_online() will not call uncore_freq_add_entry() for
> > another CPU that is being onlined or something along those lines?
> >
> > Will this change work/matter? Documentation/core-api/cpu_hotplug.rst
> > says
> > about cpuhp_setup_state():
> >
> > "If a callback fails for CPU N then the teardown callback for CPU
> >  0 .. N-1 is invoked to rollback the operation. The state setup
> > fails,
> >  the callbacks for the state are not installed and in case of dynamic
> >  allocation the allocated state is freed."
> >
>
> Yes, cpuhp_setup_state() will fail and which will result in clean up.
> So any fail of any fail uncore_event_cpu_online() will result in no sys
> entries.
>
> I think here the intention is to keep sys entries, which will not
> happen with this patch.
>
> For confirmation on 6.14 kernel, I forced failure on CPU 10:
>
> [595799.696873] intel_uncore_init
> [595799.700102] uncore_event_cpu_online cpu:0
> [595799.704240] uncore_event_cpu_online cpu:1
> [595799.708360] uncore_event_cpu_online cpu:2
> [595799.712505] uncore_event_cpu_online cpu:3
> [595799.716633] uncore_event_cpu_online cpu:4
> [595799.720755] uncore_event_cpu_online cpu:5
> [595799.724953] uncore_event_cpu_online cpu:6
> [595799.729158] uncore_event_cpu_online cpu:7
> [595799.733409] uncore_event_cpu_online cpu:8
> [595799.737674] uncore_event_cpu_online cpu:9
> [595799.741954] uncore_event_cpu_online cpu:10
> [595799.746134] Force CPU 10 to fail online
> [595799.750182] uncore_event_cpu_offline cpu:0
> [595799.754508] uncore_event_cpu_offline cpu:1
> [595799.758834] uncore_event_cpu_offline cpu:2
> [595799.763238] uncore_event_cpu_offline cpu:3
> [595799.767558] uncore_event_cpu_offline cpu:4
> [595799.771832] uncore_event_cpu_offline cpu:5
> [595799.776178] uncore_event_cpu_offline cpu:6
> [595799.780506] uncore_event_cpu_offline cpu:7
> [595799.784862] uncore_event_cpu_offline cpu:8
> [595799.789247] uncore_event_cpu_offline cpu:9
> [595799.793540] intel_uncore_init cpuhp_setup_state failed
> [595799.798776] intel_uncore_init failed
>
>
> Thanks,
> Srinivas
Registering the CPU hot-plug callback function during booting can be
handled correctly. I think the problem occurs during runtime.
The original code may have problems when the CPU hot-plug modifies the
management CPU during runtime:
Assume that the CPUs of package 1 are 8-15, and the uncore driver has
been registered at boot time;
1. Offline all CPU No.8-15
2. Try online CPU No. 8, the code executes cpumask_set_cpu()
successfully, but fails in the uncore_freq_add_entry() process. At
this time, the mark of CPU No. 8 is added to uncore_cpu_mask, but no
sys interface is generated,cpu No.8 online fails;
3. Try online CPU No. 8 again, cpumask_any_and() judges success, and
the CPU No.8 online is successful at this time;
4. Assume that the attempt to online CPU No. 9-15 is successful at
this time, but there is no sys interface =E2=80=94=E2=80=94=E2=80=94=E2=80=
=94unexpected behavior 1.
5. Offline CPU No. 9-15, and offline No.8, will eventually call
uncore_freq_remove_die_entry()=E2=80=94=E2=80=94=E2=80=94=E2=80=94unexpecte=
d behavior 2 is generated,
which may cause a crash.
>
>
>
> > >
> >
> > Fixes tag?
> >
> > > Signed-off-by: shouyeliu <shouyeliu@gmail.com>
> >
> > The correct format for tags is documented in
> > Documentation/process/5.Posting.rst:
> >
> > tag: Full Name <email address>
ok,I will modify it in the next version
> >
> > > ---
> > >  .../x86/intel/uncore-frequency/uncore-frequency.c    | 12
> > > ++++++++----
> > >  1 file changed, 8 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > > frequency.c b/drivers/platform/x86/intel/uncore-frequency/uncore-
> > > frequency.c
> > > index 40bbf8e45fa4..1de0a4a9d6cd 100644
> > > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > > frequency.c
> > > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-
> > > frequency.c
> > > @@ -146,15 +146,13 @@ static int uncore_event_cpu_online(unsigned
> > > int cpu)
> > >  {
> > >     struct uncore_data *data;
> > >     int target;
> > > +   int ret;
> > >
> > >     /* Check if there is an online cpu in the package for
> > > uncore MSR */
> > >     target =3D cpumask_any_and(&uncore_cpu_mask,
> > > topology_die_cpumask(cpu));
> > >     if (target < nr_cpu_ids)
> > >             return 0;
> > >
> > > -   /* Use this CPU on this die as a control CPU */
> > > -   cpumask_set_cpu(cpu, &uncore_cpu_mask);
> > > -
> > >     data =3D uncore_get_instance(cpu);
> > >     if (!data)
> > >             return 0;
> > > @@ -163,7 +161,13 @@ static int uncore_event_cpu_online(unsigned
> > > int cpu)
> > >     data->die_id =3D topology_die_id(cpu);
> > >     data->domain_id =3D UNCORE_DOMAIN_ID_INVALID;
> > >
> > > -   return uncore_freq_add_entry(data, cpu);
> > > +   ret =3D uncore_freq_add_entry(data, cpu);
> > > +   if (!ret) {
> > > +           /* Use this CPU on this die as a control CPU */
> > > +           cpumask_set_cpu(cpu, &uncore_cpu_mask);
> > > +   }
> > > +
> > > +   return ret;
> >
> > Please reverse to logic such that you return early on error, which is
> > the
> > usual error handling pattern.
ok,I will modify it in the next version
> >
> > >  }
> > >
> > >  static int uncore_event_cpu_offline(unsigned int cpu)
> > >
> >
>
