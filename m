Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3073E1A317D;
	Tue, 22 Apr 2025 11:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745322945; cv=none; b=cq9RdS+zwpYZAAigSR8EfimG/5s9VZDtn5QliCiF3kGFF0DNZDFQ9vo87diMTqn5ntDaYUbMJb+ybRTQeByQdub67c/VNOuB2zHZjeOC9No/sNHrVsF/sg9cNRpkzMnkOxze7CTYBg/QgpFWT2VDlnOdruvTkdQaq/PMKucNnrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745322945; c=relaxed/simple;
	bh=NlxnJ6QRk+KEGJ5mZ2Iy2KNh2FSE+5CpEr+p6ovAt4I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qB8oK7qs7gC5miGzuD8bUzIoL0aWkQoLTYq3ka9Y820u4sBYiNjS0xZbIOrXvvLW41AQMYgx16zjOs4WvHPeSR9P+/G8Pu35mnM91/jTy8yPpX+K1K6237OQWATwpfvxhjUbm0r2mzG/UwPNmpSk+cOGITS/Rl4Sb5Lt8oPuVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ooAnSbsG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ooAnSbsG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D474C4CEEC;
	Tue, 22 Apr 2025 11:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745322944;
	bh=NlxnJ6QRk+KEGJ5mZ2Iy2KNh2FSE+5CpEr+p6ovAt4I=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ooAnSbsGb4rZ8inSne9/zF+Osgsv+6NoZCHqJVOevRbY9dX8M3m1NVNr8BqkbSGxu
	 OVG8MILftJ3yywfzBzIGVqhJ4Wmeicabb9zxTiAW/wR/O14C1ymvHE2qtZ/wLuN1iw
	 0S9ydqDUBRPil54VC8ko5JEEiS4vZlnGDDf75g+jDoW4NwozoF6ws7B+SabDXbD89s
	 qniCgonrpIqOJFpgZIm3brEVRy/61e/FY0iR9k8+xfJlKkPOppbO4ldS4jZe2Q8u5f
	 naez/wbrPiPYzDA9BHxWrh1SdZqnocOFl/KqmDOxzQ9XSvLu7Q5yiCJUZ7SPhTgwcp
	 R1x2lojf7M9lA==
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-acb5ec407b1so681993366b.1;
        Tue, 22 Apr 2025 04:55:44 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWxTxBOAkYlpMiQqV5VDqkYkQVfr0I9mt9FReP01oM2lucAqcLfu/QQEOhAeYy5/adg7Ys5kZbLxcz8@vger.kernel.org, AJvYcCXePZgFrpIMXEnM4tkknv0gN5lY4uCqZUxeg5EiJqAJKYmTe4FKAumgIjdWOlyHXWu8C+4q31rzLc8ABM6O@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxJOZYFMCAuuotbmwIZd/I0Q0dXD2MyR04xW02EREiGLjemDG
	UEdIIWJJU4zYkO8QrLmRT6P4KE/rQZ2F203Fgt49/BijpalH8S/8SiIdnXG9EUABA8vQ3TR3+Ft
	8NQLRK/KDzvt2X2CxHW8gRo3AjA==
X-Google-Smtp-Source: AGHT+IFn37a9Lg5i1NLvKHUiFOA39/tRQAT5so5RWqSl5qnZ1/wD62oMMBHhUmLumBZxGZih5sHb7VxtlPiC76dcmq0=
X-Received: by 2002:a17:907:d643:b0:abf:4da0:28e3 with SMTP id
 a640c23a62f3a-ace35b7110emr80983166b.18.1745322943158; Tue, 22 Apr 2025
 04:55:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414083243.59664-1-bsz@amazon.de> <CAL_JsqJdk_UtCEEVrakO8azjxWeLLDGTfWAVqtoPS99VQz3jWQ@mail.gmail.com>
 <61efdf178da04ab6ae0d3feb70852cfe@amazon.de>
In-Reply-To: <61efdf178da04ab6ae0d3feb70852cfe@amazon.de>
From: Rob Herring <robh@kernel.org>
Date: Tue, 22 Apr 2025 06:55:31 -0500
X-Gmail-Original-Message-ID: <CAL_JsqLpKvw73ry+Dmy=uzOopQ4BgbH3qn7gsuj4+RGAD3UY4A@mail.gmail.com>
X-Gm-Features: ATxdqUEX_x7RxEl9s0a2hkcgXDQqjmKuHr3HtqIWITgbJIlhkckjpH2Ojah3cCs
Message-ID: <CAL_JsqLpKvw73ry+Dmy=uzOopQ4BgbH3qn7gsuj4+RGAD3UY4A@mail.gmail.com>
Subject: Re: [PATCH] fdt: arch/arm64: Delete the rng-seed property after use
To: "Szczepanek, Bartosz" <bsz@amazon.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "Graf (AWS), Alexander" <graf@amazon.de>, 
	=?UTF-8?B?U2Now7ZuaGVyciwgSmFuIEgu?= <jschoenh@amazon.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 15, 2025 at 3:52=E2=80=AFAM Szczepanek, Bartosz <bsz@amazon.de>=
 wrote:
>
> > From: Rob Herring <robh@kernel.org>
> > Sent: Monday, April 14, 2025 4:22 PM
> > To: Szczepanek, Bartosz
> >
> > On Mon, Apr 14, 2025 at 3:33=E2=80=AFAM Bartosz Szczepanek <bsz@amazon.=
de> wrote:
> > >
> > > As a part of platform boot, device tree is being read to extract
> > > randonmess bits. The 'rng-seed' property is used for that purpose.
> > > After reading the value, the field was overridden with NOP instead of
> > > being deleted or zeroed. The problem is that NOPed fields are later n=
ot
> > > reused, and kexec code appended this property every time DTB is prepa=
red:
> > >
> > >   /* add rng-seed */
> > >   if (rng_is_initialized()) {
> > >           void *rng_seed;
> > >           ret =3D fdt_setprop_placeholder(dtb, off, FDT_PROP_RNG_SEED=
,
> > >                           RNG_SEED_SIZE, &rng_seed);
> > >           if (ret)
> > >                   goto out;
> > >           get_random_bytes(rng_seed, RNG_SEED_SIZE);
> > >   }
> > > (source: arch/arm64/kernel/machine_kexec_file.c)
> > >
> > > Taken together, DTB grew at each kexec by 140 bytes ie. size of the
> > > newly added (and not overwritten) rng-seed property. ARM64 sets a har=
d
> > > limit on FDT size at 2MB, which means that after at most 14,979 kexec=
s
> > > DTB exceeded the limit causing catastrophic (but silent) failure in
> > > setup_machine_fdt().
> >
> > Just like 2MB should be enough for anyone, 14979 kexecs should be enoug=
h. ;)
>
> I'm actually glad it wasn't more than that, I'm afraid if it were 149790 =
I would
> be still scratching my head about the occasional crashes out of nowhere (=
:
>
> >
> >
> > > This commits addresses the issue as follows:
> > >  1. Call to fdt_nop_property is replaced with overwriting the rng-see=
d
> > >     value with zeros.
> > >  2. Zeroed rng-seed gets special treatment and is not accepted as val=
id
> > >     seed. Warning is emitted on zeroed value.
> >
> > How do you get a zeroed seed if you delete the property when zeroed?
> > Sure, any random bootloader could do that, but that has nothing to do
> > with kexec. And does it really hurt to add 0s to the random pool? A
> > warning is fine. In any case, none of this is specific to DT seeds. It
> > all belongs in the core if it is a problem.
>
> You're right that zeroed property should never get to early_init_dt_scan_=
chosen.
> If the outgoing kernel can't give us randomness, it removes the previousl=
y
> zeroed "rng-seed". So it's an extra check and we could perhaps do without=
 it.
>
> As for whether it hurts to add zeros to random pool, I actually wanted to=
 avoid
> any doubts about security by handling that case explicitly. We can make i=
t a
> mere warning if you like but I thought that illusion of randomness is wor=
se
> than lack of randomness from a security standpoint. If we bail out on zer=
os,
> we are sure that under no circumstances we get misguided by "rng-seed" th=
at is
> there but doesn't bring us actual entropy.

My point is your reasoning is true for all other callers of
add_bootloader_randomness(), so shouldn't all of them be handled the
same way? What guarantee do we have that UEFI implementation doesn't
give us all zeros too? We know it can happen since we're also
implementing the bootloader in this case, but that's not much better
than not knowing. And there is the 'trust_bootloader' flag too. Do we
want to warn about the bootloader seed if trust_bootloader=3D=3Dfalse?
There's also the minor issue that in 1-in-a-gazillion times, the
random value is all 0s. Does that matter? IDK. Really, you should ask
the folks that implemented this feature in the first place.


> > >  3. Kexec_file code is modified to delete the zeroed property if it
> > >     can't fill it with valid seed.
> > >  4. Proper error handling is added for the case when DTB exceeds 2MB.
> > >
> > > The change was tested in QEMU arm64 environment. To do so, kernel
> > > containing the change was built and included in buildroot initramfs.
> > > Subsequently, kernel was started in QEMU. Using kexec_file, new kerne=
l
> > > was loaded and kexec reboot was issued. DTB size was noted in this st=
ep.
> > > After new kernel has booted, another kexec_file was issued. DTB size
> > > was confirmed not to change.
> > >
> > > Signed-off-by: Bartosz Szczepanek <bsz@amazon.de>
> > > ---
> > >  arch/arm64/kernel/machine_kexec_file.c |  5 +++++
> > >  drivers/of/fdt.c                       | 18 +++++++++++++++---
> > >  drivers/of/kexec.c                     | 12 +++++++++++-
> > >  3 files changed, 31 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kern=
el/machine_kexec_file.c
> > > index af1ca875c52c..af0e39f6c96d 100644
> > > --- a/arch/arm64/kernel/machine_kexec_file.c
> > > +++ b/arch/arm64/kernel/machine_kexec_file.c
> > > @@ -170,6 +170,11 @@ int load_other_segments(struct kimage *image,
> > >         /* trim it */
> > >         fdt_pack(dtb);
> > >         dtb_len =3D fdt_totalsize(dtb);
> > > +       if (dtb_len > MAX_FDT_SIZE) {
> > > +               pr_err("DTB exceeds the maximum size: 0x%lx > 0x%x", =
dtb_len, MAX_FDT_SIZE);
> >
> > You can't check restrictions of the kexec'ed kernel in the current
> > kernel. That restriction could be removed at any point and might not
> > be a problem for the kexec'ed kernel.
>
> Fair point.
>
> What would you say then for making it a warning? That could be a middle g=
round
> that would 1) allow us to kexec into more capable kernel without restrict=
ion,
> but also 2) help avoid lengthy investigations about early_init_dt_scan_ch=
osen
> failures. Keep in mind that the function is so early that early consoles =
are
> not plugged in, so from reader perspective it's "Bye!" from the outgoing =
kernel
> followed by eternal silence.

Well, I checked DTBs in the tree and the biggest is 178K, so we are a
lot further off from this being a problem than I thought. So I guess a
warning would be fine.

Rob
