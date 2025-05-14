Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB8BB14AA9
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 14:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747232695; cv=none; b=Xusvgp3XVRyqKMzdoyuFGl5n3xVnTn6slcCDt7nBa6/l3PJ9jzqNULiv5tf5toz6tV1KqFcyb0y/3xpaBBcF7udKgtnDt5XkbAZpc+xlC6InIa1RumyCu93u0pQ3LLKWF6UBCZry/J/fDRwagKkAfc8+ULbg2MH9QrCrhIlOfFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747232695; c=relaxed/simple;
	bh=MuuTe8pEaEnZGB91w3Bj6dE4WTOPL83J27yFrXFPkqg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=te/njyRO6w8yTAyILV9iAa5YwIBVBRhzxNErQmaQTm+tw+9S29kAed4m/1WyVi1WmNtPWCOEtnxugMexdCta5x0DPTIFScBzYZ/sgxPp7bf5nPb+BCs++hQMR7r6t7hjtx7ZsvdpGEri95pBU93g/r28he8xIBIb8pEByr8azEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VE6PpN2k; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VE6PpN2k"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b115383fcecso4103308a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 07:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747232693; x=1747837493; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=smiZ9yTXFzGV6r9sdu0PppaxDoYdXRPTB6hmrElTWnc=;
        b=VE6PpN2kjAQMH4LwVhgfaU3r5guvWznT/Cu+lr8XwA0QONL7nMMmcKF9BQ3so4OCzy
         qMzqyGS4E6nHDLgBZ/TkaGUxcSqwDzXdQkHDzjx++rOXmLLtZ1NQF8O5hM9/UyXrIYIf
         tAfxhJqkUAq5VLNPNBXNufNc4sc7uEKV6QyGz44V1egwbF5cB6FnThN5xxWDPIwm0vVR
         jVGE/RYQaKLDZf1jwWPirHUQTZRgfHMzwAc/EHqorvWCcMGH7cUWmumpMyU0YRTaER6K
         RLYVz23FliRnp/tD60G6dxi07GDCMEikW1HShUiQbvYMenD8r8FZUOLveemuSF/fmJJk
         MrMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747232693; x=1747837493;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=smiZ9yTXFzGV6r9sdu0PppaxDoYdXRPTB6hmrElTWnc=;
        b=C704wHiruARgdOR5VTvwIQoloqJMFAZCBQUQoIbAZgNSyO035Pu06yMfFAKDz05hmp
         SH8H226HVfnzwVev5JOSWKephk4zB7EJOCsBk9XrjX6ePb5Bpopl2SNClnF04ognpeSR
         FRcfSrb8xtk6JF18hFzcdN3WRHrLYI0P3OUkMafGOAfAGPPFuiPpwWk37M/HPYmh6xJH
         5RpXqwCd/D/sMlJ0ykBHF8AWjTiYQj4JH8L0opJU82PJZyfNkmP5JifjjTrl7trwWiWe
         aujAwkPHjnxwTbsAT6y3ylZG37kc972D4LcyTC4c+3FmqzXFXLd6mpi1pzojGfncyvJn
         DlkA==
X-Forwarded-Encrypted: i=1; AJvYcCUZOyu+y2JMYhrlTj2F9OWS/VDUl6JvzdxV7lXKbVdp3g4eopd/Ewoz4SgNMU6x207llprk2EqmQQIeZBM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2krr8J7zQcOAbkjUaGSLK9roUPqOK8bads0Iy2XK8laRX9YTl
	F+1Js4wPQT1+fRu3i91+Q3U+9K9wkwl4DZiL5v00ufc4K2+/eYaFa/j2iQziY4GH0Pf+5zSuU26
	L7w==
X-Google-Smtp-Source: AGHT+IGR8cCwQ65JKzdowCPFZF+Ot5CwiJJwPsOIAvyPplzHyFXTPqNTsBjsK/Ms0jOSGOkUkahq0BN+Ats=
X-Received: from pjbnb5.prod.google.com ([2002:a17:90b:35c5:b0:2fc:201d:6026])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:1a6f:b0:223:5945:ffd5
 with SMTP id d9443c01a7336-231981a22efmr53401045ad.32.1747232693171; Wed, 14
 May 2025 07:24:53 -0700 (PDT)
Date: Wed, 14 May 2025 07:24:51 -0700
In-Reply-To: <CADrL8HUaofWTcV7X5b1AXEud03bC+gfZiecyFpux9m1tC25hOg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250508141012.1411952-1-seanjc@google.com> <20250508141012.1411952-4-seanjc@google.com>
 <CADrL8HURpnXgN0ux4sUk0nVze=A6d488i_ztiZTwGZUdDMoTvg@mail.gmail.com>
 <aCNTnXf5qZ1MMSNi@google.com> <CADrL8HUaofWTcV7X5b1AXEud03bC+gfZiecyFpux9m1tC25hOg@mail.gmail.com>
Message-ID: <aCSns6Q5oTkdXUEe@google.com>
Subject: Re: [PATCH v2 3/5] KVM: Conditionally reschedule when resetting the
 dirty ring
From: Sean Christopherson <seanjc@google.com>
To: James Houghton <jthoughton@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 13, 2025, James Houghton wrote:
> On Tue, May 13, 2025 at 7:13=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> > On Mon, May 12, 2025, James Houghton wrote:
> > > On Thu, May 8, 2025 at 7:11=E2=80=AFAM Sean Christopherson <seanjc@go=
ogle.com> wrote:
> > > > ---
> > > >  virt/kvm/dirty_ring.c | 10 ++++++++++
> > > >  1 file changed, 10 insertions(+)
> > > >
> > > > diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
> > > > index e844e869e8c7..97cca0c02fd1 100644
> > > > --- a/virt/kvm/dirty_ring.c
> > > > +++ b/virt/kvm/dirty_ring.c
> > > > @@ -134,6 +134,16 @@ int kvm_dirty_ring_reset(struct kvm *kvm, stru=
ct kvm_dirty_ring *ring,
> > > >
> > > >                 ring->reset_index++;
> > > >                 (*nr_entries_reset)++;
> > > > +
> > > > +               /*
> > > > +                * While the size of each ring is fixed, it's possi=
ble for the
> > > > +                * ring to be constantly re-dirtied/harvested while=
 the reset
> > > > +                * is in-progress (the hard limit exists only to gu=
ard against
> > > > +                * wrapping the count into negative space).
> > > > +                */
> > > > +               if (!first_round)
> > > > +                       cond_resched();
> > >
> > > Should we be dropping slots_lock here?
> >
> > Could we?  Yes.  Should we?  Eh.  I don't see any value in doing so, be=
cause in
> > practice, it's extremely unlikely anything will be waiting on slots_loc=
k.
> >
> > kvm_vm_ioctl_reset_dirty_pages() operates on all vCPUs, i.e. there won'=
t be
> > competing calls to reset other rings.  A well-behaved userspace won't b=
e modifying
> > memslots or dirty logs, and won't be toggling nx_huge_pages.
> >
> > That leaves kvm_vm_ioctl_set_mem_attributes(), kvm_inhibit_apic_access_=
page(),
> > kvm_assign_ioeventfd(), snp_launch_update(), and coalesced IO/MMIO (un)=
registration.
> > Except for snp_launch_update(), those are all brutally slow paths, e.g.=
 require
> > SRCU synchronization and/or zapping of SPTEs.  And snp_launch_update() =
is probably
> > fairly slow too.
>=20
> Okay, that makes sense.

As discussed offlist, dropping slots_lock would also be functionally proble=
matic,
as concurrent calls to KVM_RESET_DIRTY_RINGS could get interwoven, which co=
uld
result in one of the calls returning to userspace without actually completi=
ng the
reset, i.e. if a different task has reaped entries but not yet called
kvm_reset_dirty_gfn().

> > And dropping slots_lock only makes any sense for non-preemptible kernel=
s, because
> > preemptible kernels include an equivalent check in KVM_MMU_UNLOCK().
>=20
> I'm not really sure what "equivalent check" you mean, sorry. For preempti=
ble
> kernels, we could reschedule at any time, so dropping the slots_lock on a
> cond_resched() wouldn't do much, yeah. Hopefully that's partially what yo=
u
> mean.

Ya, that's essentially what I mean.  What I was referencing with KVM_MMU_UN=
LOCK()
is the explicit check for NEED_RESCHED that happens when the preempt count =
hits
'0' on preemptible kernels.

> > It's also possible that dropping slots_lock in this case could be a net=
 negative.
> > I don't think it's likely, but I don't think it's any more or less like=
ly that
> > droppings slots_lock is a net positive.  Without performance data to gu=
ide us,
> > it'd be little more than a guess, and I really, really don't want to se=
t a
> > precedence of dropping a mutex on cond_resched() without a very strong =
reason
> > for doing so.
>=20
> Fair enough.
>=20
> Also, while we're at it, could you add a
> `lockdep_assert_held(&kvm->slots_lock)` to this function? :) Not necessar=
ily
> in this patch.

Heh, yep, my mind jumped to that as well.  I'll tack on a patch to add a lo=
ckdep
assertion, along with a comment explaining what all it protects.
