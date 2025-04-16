Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B55F2557C;
	Wed, 16 Apr 2025 02:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744770858; cv=none; b=kEYY477fVpanlf8C1UKbFcyk3b7exY66NkiPQos+SXXnulo8jQ9yN2xN6InDmA0tZoUFoZ6YlBpQ7+/3GdS0av+rlmtMKEHD09+bdVpt0rwNONjBcAgAyqe7Htks8zyCOuygJu9n/uCpl7D6ruOdT+jo9GIqA7r0BlYfC/Xc1Ww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744770858; c=relaxed/simple;
	bh=CenIrARThLtkbxExzT5EtFnHxB/LcTEkg7KOtXqIYZA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TQ5vueiCrw+/ICo5CysgjW8sNIdjl6jKTxiA0f6OUU+/NZu0HVYGhXUjw3kmcev+2RRSiHDn63XJolqGZNvvADi6Mq8qlno+ZBWOCn0QjPcYyFjfyyyYTPAJDHu/1Zco47uvuH8YwhrR+Qylba05/DAVztH1ntdWugooQlYHpuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XecYMbX1; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XecYMbX1"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-31062172698so33833311fa.0;
        Tue, 15 Apr 2025 19:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744770854; x=1745375654; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sEaBZWo2uW2CIfNa5Wu9E33eEy5oN+l/fkObsnFTwSs=;
        b=XecYMbX1VaGtIr5P1C8YlckpXQ5t4kxLdFKlCcQaDS4v1enu1PRpwuiOLjpiPqDIkg
         5MKSg68Hx9BYxDvKw2NzwesgYyTRdQHS1ktM3yOkxIPfqiv+DKYky4vgkpnxxNZYNgw1
         GznomQZ6rM1tPLcNpn26te4mw7F4TmuDoRibbeCy699zdVfUaFAQZQG+PmY//XM2fMHM
         ipdbh6kyRsil9Sax7+YElb9eNwV4cXhxgN0CSAuEyVt7zsIKp8dPUA5MZ8lfUD8yM9Js
         Fd8ggb15GOH9gx/odh0bOmD8nb1BRFQLHYecKrNLmdGQK+tjIzVs4sXyWp9G7Zsq4rlw
         c9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744770854; x=1745375654;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sEaBZWo2uW2CIfNa5Wu9E33eEy5oN+l/fkObsnFTwSs=;
        b=lDX1t/MOv6qj3gLl1fEetL43S0QjgajeF/9Jjp2Q7xkjV5S/GXjTnbgTBytV1gjJSk
         uI4K0xiBcqP16xS919IPAQJUCc+W//ydqy851pL+gfbKPg1PxWvGQv0tQnUR538HMN7n
         J16Um9o3F3agTOnGDv9LemgNN+6ZAoJpVf8btSNKYMSEMNF9UVe3iAIHHNqmD9DYxfeM
         nJpmdxzHDEKiUytikH4At0Q8QN3OvteGq5CeASkiOAa0xHMqyE5iXqQcAt5VcAhSGf1J
         6ca9zZ5UY+Uwu4+E+hnw+mBMLFoEwC+ND4wnHUogGzutt+GvYh6hc+UqXe2+hLE5npzr
         tfEA==
X-Forwarded-Encrypted: i=1; AJvYcCULV8CXvH9er+s8yogxVJj2tlQ0/qDsSFdbBzRhwsInTw99En1gkSZ7B/9WZmnwXvocrN4ZPNSDUpQ5/Q7HkqzHKsdR6w==@vger.kernel.org, AJvYcCX1keHwWhuc9xVbgeTXMmjlEJ5hpC8IbmcZWuhQ0C4CoqEuE/OXwdTRMiyq5oWMDgm8km/uYVG2NoZN+6w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxyWiKRVJqyhGoGGyzxLH77/VQIL7UKXKkBTTDd9SXlecYCORrY
	1vWZIyczAtKuijnGLAYnMPS1TeN1/gXsuwiLe4hNgc1iW7o7C1UNz9ts1+HnIsD2CkIa5+KGk5r
	bFOyzsKmTebjtJwKC7BsJ+r5Nz3A=
X-Gm-Gg: ASbGncuUtbaqUmn19bmyrCHBcX1p6MNmbcxa5m53biOtQjphXdIhEPHgnHQfpx4/LvL
	q17HVgRQPHn0axd2ElRuUarvu7YRQeIFGPE6FYudiFEr5sKhR9lkt/KaLtHOjNcawSVAGLODg59
	1t80fpYjzOePTzZeq+AHnwQw==
X-Google-Smtp-Source: AGHT+IGI2X6Zn1ZXbeF1eXQhr8TFSrJu77yHtnId75bdu99Qp1Bi/2w+zESp1EPd4gCTwkUUEN4faYqX9Q7mVNL2cnU=
X-Received: by 2002:a05:651c:19aa:b0:309:20b4:b6d5 with SMTP id
 38308e7fff4ca-3107c35b9e8mr3870361fa.28.1744770854133; Tue, 15 Apr 2025
 19:34:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414092132.40369-1-shouyeliu@gmail.com> <1feb5888-5ec8-67aa-9775-e1bea6b8b9fe@linux.intel.com>
 <f673452d7afc4419120f2cdb32e5033c35f22229.camel@linux.intel.com>
 <CAAscG3VHVdNDQGfsdBs_ht5H-WUtCBksMYPXLKW2D6Uqu3yeAA@mail.gmail.com>
 <331a55fe7334cf425ddb8826160b64a5af37c805.camel@linux.intel.com>
 <6bf14a69-5a92-a9cc-b02f-e92de0296321@linux.intel.com> <4d1ecb87636ce1398cf8a2282e5497f6a92334bd.camel@linux.intel.com>
In-Reply-To: <4d1ecb87636ce1398cf8a2282e5497f6a92334bd.camel@linux.intel.com>
From: liu shouye <shouyeliu@gmail.com>
Date: Wed, 16 Apr 2025 10:34:02 +0800
X-Gm-Features: ATxdqUHVjF7cpJJOtgUmaGq2b9jmhcKyijm9ISqoC2iyetQBaeX98Jmhm4SSnwc
Message-ID: <CAAscG3VkSM_BLkRc3CZd5am_-ZW7EkwgZFLXabvq1Qo8ode8-g@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: fix inconsistent state on
 init failure
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

srinivas pandruvada <srinivas.pandruvada@linux.intel.com> =E4=BA=8E2025=E5=
=B9=B44=E6=9C=8816=E6=97=A5=E5=91=A8=E4=B8=89 06:11=E5=86=99=E9=81=93=EF=BC=
=9A
>
> On Tue, 2025-04-15 at 18:10 +0300, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 15 Apr 2025, srinivas pandruvada wrote:
> >
> > > On Tue, 2025-04-15 at 14:39 +0800, liu shouye wrote:
> > >
> > >
> > > srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
> > > =E4=BA=8E2025=E5=B9=B44=E6=9C=8815=E6=97=A5=E5=91=A8=E4=BA=8C
> > > 00:08=E5=86=99=E9=81=93=EF=BC=9A
> > >       On Mon, 2025-04-14 at 13:41 +0300, Ilpo J=C3=A4rvinen wrote:
> > >       > On Mon, 14 Apr 2025, shouyeliu wrote:
> > >       >
> > >       > > When uncore_event_cpu_online() fails to initialize a
> > > control
> > >       CPU
> > >       > > (e.g.,
> > >       > > due to memory allocation failure or
> > > uncore_freq_add_entry()
> > >       > > errors),
> > >       > > the code leaves stale entries in uncore_cpu_mask after
> > > that
> > >       online
> > >       > > CPU
> > >       > > will not try to call uncore_freq_add_entry, resulting in
> > > no sys
> > >       > > interface.
> > >       >
> > >       > Please add () after any name that refers to a C function
> > > (you're
> > >       not
> > >       > even
> > >       > being consistent here as you had it in some cases but not
> > > here).
> > >
> > > ok,I will modify it in the next version
> > >
> > >       >
> > >       > Please try to split the very long sentence a bit and make
> > > it more
> > >       > obvious
> > >       > what causes what as the current wording is a bit vague, did
> > > you
> > >       mean:
> > >       > uncore_event_cpu_online() will not call
> > > uncore_freq_add_entry()
> > >       for
> > >       > another CPU that is being onlined or something along those
> > > lines?
> > >       >
> > >       > Will this change work/matter?
> > >       Documentation/core-api/cpu_hotplug.rst
> > >       > says
> > >       > about cpuhp_setup_state():
> > >       >
> > >       > "If a callback fails for CPU N then the teardown callback
> > > for CPU
> > >       >  0 .. N-1 is invoked to rollback the operation. The state
> > > setup
> > >       > fails,
> > >       >  the callbacks for the state are not installed and in case
> > > of
> > >       dynamic
> > >       >  allocation the allocated state is freed."
> > >       >
> > >
> > > Yes, cpuhp_setup_state() will fail and which will result in clean
> > > up.
> > > So any fail of any fail uncore_event_cpu_online() will result in no
> > > sys
> > > entries.
> > >
> > > I think here the intention is to keep sys entries, which will not
> > > happen with this patch.
> > >
> > > For confirmation on 6.14 kernel, I forced failure on CPU 10:
> > >
> > > [595799.696873] intel_uncore_init
> > > [595799.700102] uncore_event_cpu_online cpu:0
> > > [595799.704240] uncore_event_cpu_online cpu:1
> > > [595799.708360] uncore_event_cpu_online cpu:2
> > > [595799.712505] uncore_event_cpu_online cpu:3
> > > [595799.716633] uncore_event_cpu_online cpu:4
> > > [595799.720755] uncore_event_cpu_online cpu:5
> > > [595799.724953] uncore_event_cpu_online cpu:6
> > > [595799.729158] uncore_event_cpu_online cpu:7
> > > [595799.733409] uncore_event_cpu_online cpu:8
> > > [595799.737674] uncore_event_cpu_online cpu:9
> > > [595799.741954] uncore_event_cpu_online cpu:10
> > > [595799.746134] Force CPU 10 to fail online
> > > [595799.750182] uncore_event_cpu_offline cpu:0
> > > [595799.754508] uncore_event_cpu_offline cpu:1
> > > [595799.758834] uncore_event_cpu_offline cpu:2
> > > [595799.763238] uncore_event_cpu_offline cpu:3
> > > [595799.767558] uncore_event_cpu_offline cpu:4
> > > [595799.771832] uncore_event_cpu_offline cpu:5
> > > [595799.776178] uncore_event_cpu_offline cpu:6
> > > [595799.780506] uncore_event_cpu_offline cpu:7
> > > [595799.784862] uncore_event_cpu_offline cpu:8
> > > [595799.789247] uncore_event_cpu_offline cpu:9
> > > [595799.793540] intel_uncore_init cpuhp_setup_state failed
> > > [595799.798776] intel_uncore_init failed
> > >
> > >
> > > Thanks,
> > > Srinivas
> > >
> > >
> > >
> > > Registering the CPU hot-plug callback function during booting can
> > > be handled
> > > correctly. I think the problem occurs during runtime.
> > > The original code may have problems when the CPU hot-plug modifies
> > > the
> > > management CPU during runtime:
> > > Assume that the CPUs of package 1 are 8-15, and the uncore driver
> > > has been
> > > registered at boot time;
> > > 1. Offline all CPU No.8-15
> > > 2. Try online CPU No. 8, the code executes cpumask_set_cpu()
> > > successfully, but
> > > fails in the uncore_freq_add_entry() process. At this time, the
> > > mark of CPU No.
> > > 8 is added to uncore_cpu_mask, but no sys interface is
> > > generated,cpu No.8
> > > online fails;
> > > 3. Try online CPU No. 8 again, cpumask_any_and() judges success,
> > > and the CPU
> > > No.8 online is successful at this time;
> > > 4. Assume that the attempt to online CPU No. 9-15 is successful at
> > > this time,
> > > but there is no sys interface =E2=80=94=E2=80=94=E2=80=94=E2=80=94une=
xpected behavior 1.
> > > 5. Offline CPU No. 9-15, and offline No.8, will eventually call
> > > uncore_freq_remove_die_entry()=E2=80=94=E2=80=94=E2=80=94=E2=80=94une=
xpected behavior 2 is
> > > generated, which may
> > > cause a crash.
> > >
> > >
> > >
> > > I see the case in 2 socket server. So good to fix. Thanks for this.
> > >
> > > Also I suggest to look why the addition of one entry failed on your s=
erver system.

Sorry for my description problem. My machine also has two sockets.
After all, a one-socket machine cannot offline all CPUs.

> >
> > All this extra information that this discussion has brought into
> > light
> > should be included into the changelog (including the fact that this
> > can
> > only occur after they were first setup without errors as the it would
> > have rolled back otherwise).

Got it. My previous commit was indeed not described clearly.
Thanks,
Shouye

> >
>
> May be something like this:
>
> "
> Fix missing uncore sysfs during CPU hotplug
>
> In certain situations, the sysfs for uncore may not be present when all
> CPUs in a package are offlined and then brought back online after boot.
>
> This issue can occur if there is an error in adding the sysfs entry due
> to a memory allocation failure. Retrying to bring the CPUs online will
> not resolve the issue, as the uncore_cpu_mask is already set for the
> package before the failure condition occurs.
>
> This issue does not occur if the failure happens during module
> initialization, as the module will fail to load in the event of any
> error.
>
> To address this, ensure that the uncore_cpu_mask is not set until the
> successful return of uncore_freq_add_entry().
> "
>
> Thanks,
> Srinivas
>
Very clear and comprehensive commit description - I will apply it in
the next version.

Thanks,
Shouye
