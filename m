Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C440A20102B
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 12:10:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747656647; cv=none; b=LFoScq/tzf3t0sTXNcqHttFdbjAzaEIg9Dxu4upguUmd5XXKWAqLnB1A9gR7w5U+MSj0iPQn3dYKNqGsMzLjFzbud9JvhKQ6QL5XXh0gAovRL/AJkiXSjQT6xdvAGCKyULm1y+RQUMKYrnTTuFmky7gOi7ncOu6bWqFXanbat0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747656647; c=relaxed/simple;
	bh=jS7W/OQfhloeRDbKosQAwm7ioICWhn7Ru8KJpfOQGc8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMLVc5VRDz2nnakjXaVqJZofa72uR+Sv0sL8pk0SDoLS3GATsF6TCDzB5q0Z1gvyi2HfOXsWSnN32/BiZUX4f/yDjS+ek3ew2Cv0bVjEJRWPjSK/WOzML5uMyvRWG+CKa5Sg/JXXLTCUybLS2etOTqk1lN+VSJW0QZSGpLFJcS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=vrTjvypu; arc=none smtp.client-ip=209.85.160.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="vrTjvypu"
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-476f4e9cf92so32701261cf.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 05:10:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1747656644; x=1748261444; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sxj5tV4ZjtLTjypVmyMI86S9Wm14CRi4YEthyQjDYJE=;
        b=vrTjvypuMshQCVidlLl8tRR4bFvQLTSI/6HyP7y5EzYqgPZwUDV4e2J0nrF1liL6yT
         cwxCXmPi3xLnN1Ee0+3Mo1tHcob6cxwGyWTEDNdaQnofqyn5TG1RcyP+QGelVl/xqC+1
         aw7P2xVEIlfl7V1Y7VDCvFwP/CoWnx4Oi7uwZ6db3bmkK6MCZDjBBxmLzop8F7ddpke0
         MEVcHWVozwtnQGEZ2Os1f8Aaz9ykZl7p2b8aCMEIorYXY/XDKrgF02kLuh7Qm1pGQo8o
         DCnH+Acrp9TIjQpdoUqD7Qus6IBgXhYl1+r6S23uljAjv3GGNVtQmU5j3D7lpOyK9AD8
         95DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747656644; x=1748261444;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sxj5tV4ZjtLTjypVmyMI86S9Wm14CRi4YEthyQjDYJE=;
        b=IflMzFjw5mAHbo+LbwEuUi5MGjEABsH0E+QtyO6j6wFkj5sfydALSr9QBQ/EjPAu4P
         iaYmomF6jsp+Ko+pTEONAANHNW65qEvB9MQoreTQMQyBooWPyiFQMXcCDZDeH4XPwpTp
         RaqJQNy+ZeKSkYYm1WvQy7Z7/4JOx6C2WWMyfhNkbgMCeM3C8Ej0vboqAsGyvPkFrui3
         5D5kQWHuRIUv9y6cMO02y/f0GMSClcGIcaXVERjI0Yd4whdCsczwB3mNAuqV2sh39pDO
         Yg25J9dtsluO4RbhjzPHW4y3zJOy8GqL8eCQchAreqpXQtg/oKSZScpZ3YbbXcaiIMYD
         gS4w==
X-Forwarded-Encrypted: i=1; AJvYcCWjpjnpteYY/6V/04yJC8riETefP4JBBijXBatwLJ2ZRHT1lO0wFV2k9q/K3VTcG4qfLtXoQR+pWHUv+GY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9LzHgw7rlzWNiv+22K09JC127PQgudSGKMscHBH8MQfCmRt06
	69uxxDLEgO79rGCZ72YgGH9cFrBqfbn46CkkIf7r8jUMYBdN6CWO6/HfCuCdfQyNsDkIcsEF8Tc
	VS3ExYTuRDCc1eI9ZHShOgagp/cRRJmXHyw/BXgFAnA==
X-Gm-Gg: ASbGncutqMn2zjiEPIXHrX0bgVbn2eBWU4IuKEtaO2ItXnmwaq47Oeay/CzblBKy6C4
	2JebZr/w4ENLOKIOnzoaKI/obr/zNP9Eu6NkqqiP22ug48iB+j7qbLaGglVP4K5fM0jIkSw/Bgh
	bORvGzyM8CNazMaSu7VysE+PelJIZqFA==
X-Google-Smtp-Source: AGHT+IHFVZaN/KoXQKmix7VBW6TAlcDBvQWjHHP9O9i0WPdPw4x+eCBlpXYOmcHm5M0gwFeXPJdS+ox//5pK2zRXTgs=
X-Received: by 2002:a05:622a:1b10:b0:48a:d21f:4ea with SMTP id
 d75a77b69052e-494ae377aadmr250581171cf.13.1747656644392; Mon, 19 May 2025
 05:10:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250518142315.241670-1-changyuanl@google.com>
 <20250518142315.241670-3-changyuanl@google.com> <aCoB6KkQr4xFBlEu@kernel.org>
In-Reply-To: <aCoB6KkQr4xFBlEu@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 19 May 2025 08:10:07 -0400
X-Gm-Features: AX0GCFvC73OzkVuPTBSZiZm6D6fkjt14tbJiCBHbeRPZlSwcNy9mM8PHVLc8h78
Message-ID: <CA+CK2bD7Zf_zvzi6zvQamUTJR19vKkWB8eux5vcwn-8ns=ZRKA@mail.gmail.com>
Subject: Re: [PATCH 2/2] KHO: init new_physxa->phys_bits to fix lockdep
To: Mike Rapoport <rppt@kernel.org>
Cc: Changyuan Lyu <changyuanl@google.com>, akpm@linux-foundation.org, graf@amazon.com, 
	bhe@redhat.com, kexec@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, chrisl@kernel.org, jasonmiu@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 18, 2025 at 11:51=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Sun, May 18, 2025 at 07:23:15AM -0700, Changyuan Lyu wrote:
> > From: Pasha Tatashin <pasha.tatashin@soleen.com>
> >
> > Lockdep shows the following warning:
> >
> > INFO: trying to register non-static key.
> > The code is fine but needs lockdep annotation, or maybe
> > you didn't initialize this object before use?
> > turning off the locking correctness validator.
> >
> > [<ffffffff810133a6>] dump_stack_lvl+0x66/0xa0
> > [<ffffffff8136012c>] assign_lock_key+0x10c/0x120
> > [<ffffffff81358bb4>] register_lock_class+0xf4/0x2f0
> > [<ffffffff813597ff>] __lock_acquire+0x7f/0x2c40
> > [<ffffffff81360cb0>] ? __pfx_hlock_conflict+0x10/0x10
> > [<ffffffff811707be>] ? native_flush_tlb_global+0x8e/0xa0
> > [<ffffffff8117096e>] ? __flush_tlb_all+0x4e/0xa0
> > [<ffffffff81172fc2>] ? __kernel_map_pages+0x112/0x140
> > [<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
> > [<ffffffff81359556>] lock_acquire+0xe6/0x280
> > [<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
> > [<ffffffff8100b9e0>] _raw_spin_lock+0x30/0x40
> > [<ffffffff813ec327>] ? xa_load_or_alloc+0x67/0xe0
> > [<ffffffff813ec327>] xa_load_or_alloc+0x67/0xe0
> > [<ffffffff813eb4c0>] kho_preserve_folio+0x90/0x100
> > [<ffffffff813ebb7f>] __kho_finalize+0xcf/0x400
> > [<ffffffff813ebef4>] kho_finalize+0x34/0x70
> >
> > This is becase xa has its own lock, that is not initialized in
> > xa_load_or_alloc.
> >
> > Modifiy __kho_preserve_order(), to properly call
> > xa_init(&new_physxa->phys_bits);
> >
> > Fixes: fc33e4b44b27 ("kexec: enable KHO support for memory preservation=
")
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > ---
> >  kernel/kexec_handover.c | 29 +++++++++++++++++++++++++----
> >  1 file changed, 25 insertions(+), 4 deletions(-)
> >
> > diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
> > index 69b953551677..f0ac6a9170f8 100644
> > --- a/kernel/kexec_handover.c
> > +++ b/kernel/kexec_handover.c
> > @@ -144,14 +144,35 @@ static int __kho_preserve_order(struct kho_mem_tr=
ack *track, unsigned long pfn,
> >                               unsigned int order)
> >  {
> >       struct kho_mem_phys_bits *bits;
> > -     struct kho_mem_phys *physxa;
> > +     struct kho_mem_phys *physxa, *new_physxa;
> >       const unsigned long pfn_high =3D pfn >> order;
> >
> >       might_sleep();
> >
> > -     physxa =3D xa_load_or_alloc(&track->orders, order, sizeof(*physxa=
));
> > -     if (IS_ERR(physxa))
> > -             return PTR_ERR(physxa);
> > +     physxa =3D xa_load(&track->orders, order);
> > +     if (!physxa) {
> > +             new_physxa =3D kzalloc(sizeof(*physxa), GFP_KERNEL);
> > +             if (!new_physxa)
> > +                     return -ENOMEM;
> > +
> > +             xa_init(&new_physxa->phys_bits);
> > +             physxa =3D xa_cmpxchg(&track->orders, order, NULL, new_ph=
ysxa,
> > +                                 GFP_KERNEL);
> > +             if (xa_is_err(physxa)) {
> > +                     int err_ret =3D xa_err(physxa);
> > +
> > +                     xa_destroy(&new_physxa->phys_bits);
> > +                     kfree(new_physxa);
> > +
> > +                     return err_ret;
> > +             }
> > +             if (physxa) {
> > +                     xa_destroy(&new_physxa->phys_bits);
> > +                     kfree(new_physxa);
> > +             } else {
> > +                     physxa =3D new_physxa;
> > +             }
> > +     }
>
> You are nearly duplicating xa_load_or_alloc() here.
> Is xa_destroy() is really needed here? In the end we destroying an empty
> xarray.
>
> Unless xa_destroy() is a must something like this would be simpler IMHO:

I wanted to do proper xa_destroy(), as the whole point of this patch
is to satisfy lockdep, and do a proper xa_init(). The patch fixes a
warning in linux-next, and I think should be taken as is. We can do a
separate clean-up once the series lands, where xa_load_or_alloc()
could either take another argument, or split into two functions.

Pasha
