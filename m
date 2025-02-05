Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708D619068E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:51:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738770665; cv=none; b=exG/ugMFu+jTFgdhMaHcqg52kjXjFy8By4CmyuC6f0Vi+rFkYmfl2FmHqCCyNe+g/nnep+oAfnAmn6tyDP7gdpyjQyr292FVDrB/0r/bjsgxDjwHi1eA+S1YrwvNVWFHn9lfky9bEpHaODtimPtci2AU66eH0vRkQ+4L5TP4QZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738770665; c=relaxed/simple;
	bh=Z+PVNLJq+mK/iXgL2KWEfg2mQ3cxX7Xyg8qCCpfXfMA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d5R1NTqMFiTc9vDBhHP3H/srw7ZDxLF7tAw4INWoTACZJvlh+v0RuQctSCHL5Mb9mE/TKoMYUs15MvxycX44Jk2STw1k8rZ4vtvFzaCCdPMtgQq0wTjZLGj+z/ZXhhpr7UhWChRmyWadwUAm4tiQznzbZiosvuof+Od4s0mO79o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=o5hcDwRL; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="o5hcDwRL"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f129f7717fso13833436a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738770663; x=1739375463; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vfvx8h1ddS7WQA3bNzYo1NwEAV52+SClNlNsln7k7FI=;
        b=o5hcDwRLYk8U6CbGW2uycW7IO/PDWL5Yl89PhS1Cb5TDW1F8unsZk6CVxwvpDZFyic
         Fh0Oeqd/QSlAk/hxGf/UwO7P356+5gsDeyu2JLwffHHhMWDz7kqixp+6/MvF4Jl7cM9B
         j/rh1FjjyGtQPtb7cTeG/Gz/dRpQO28IOesSQD8LVzWSHiWYUpvGect+bcBMVCXU6SqI
         LflEPetnzrSCATqpLE5tlXTkyJTmEEuXk97FDwKWBASCVS8bSCLOb0lOAL4h4rISs8ea
         vPVu2ogdBlOJoiw+0i/lB/jUKBkgNcXDBSFT0H8ldREqiLv04nDq7JG+s8LTDh3cecLU
         wsBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738770663; x=1739375463;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vfvx8h1ddS7WQA3bNzYo1NwEAV52+SClNlNsln7k7FI=;
        b=JqpHGD9CbIBj+Sa03SK6t9IDddjIxkEeIHx0651xg6BLUFp3u9NjAolkOODuOeCPkD
         0T97JVBHiyzoBjFmpriYpu+HQzN3CFPYBf9k5yfkRRPCLW1HdqYGWPtCExZ5iZRnx0W0
         y5YsgYfxVTFjUR2yCirnWjOve5IkucIW1U3BeXCZhIFOuj97o5ACI+NR5LA5XCpQdZk3
         akl3/JeL4A7McsFanPDvHU7HKNwk9ak0RhjloeCngwcX9PkrB44uDLPqCj9kWZy2nQV8
         vdgmouTNoZyZk4lwtnWzEV+YQ5EC+0k0CgVagtiff1JEDlGC4YrJ8gjvv5xWZ+VTCe1I
         gYDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdShbU/2GZ+gJF5keVPaJ2F5pXlXDsk4cblItiqMrPlBggCRn35SCrRQda4lPuZyGALnn/STALgxc9rDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiYZbDk1vGgt8JIPD1oG1CbEq++UcCG/3SDajLNB+ijFT2aaAf
	n7DmLMwlKI6N2yuTTV1yrk0mbH75lwZnq8tAQdf6FWHRg9vgp0uzAY0dEH62LUmkm965lgHU7wI
	wRg==
X-Google-Smtp-Source: AGHT+IEi6HkFlEFq3xKkt+jYe06aQPZQAI1q0x52+uNtuIUhdse4C8DHeK4AS2iUYEs4jzZhoqPFjPm9tdI=
X-Received: from pfvx11.prod.google.com ([2002:a05:6a00:270b:b0:725:dec7:dd47])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2886:b0:728:b601:86ee
 with SMTP id d2e1a72fcca58-730351ec0acmr5339138b3a.16.1738770662738; Wed, 05
 Feb 2025 07:51:02 -0800 (PST)
Date: Wed, 5 Feb 2025 07:51:01 -0800
In-Reply-To: <cd3fb8dd79d7766f383748ec472de3943021eb39.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201011400.669483-1-seanjc@google.com> <20250201011400.669483-2-seanjc@google.com>
 <43f702b383fb99d435f2cdb8ef35cc1449fe6c23.camel@infradead.org>
 <Z6N-kn1-p6nIWHeP@google.com> <cd3fb8dd79d7766f383748ec472de3943021eb39.camel@infradead.org>
Message-ID: <Z6OI5VMDlgLbqytM@google.com>
Subject: Re: [PATCH 1/5] KVM: x86/xen: Restrict hypercall MSR to unofficial
 synthetic range
From: Sean Christopherson <seanjc@google.com>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Paul Durrant <paul@xen.org>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+cdeaeec70992eca2d920@syzkaller.appspotmail.com, 
	Joao Martins <joao.m.martins@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 05, 2025, David Woodhouse wrote:
> On Wed, 2025-02-05 at 07:06 -0800, Sean Christopherson wrote:
> > On Wed, Feb 05, 2025, David Woodhouse wrote:
> > > Especially as there is a corresponding requirement that they never be=
 set
> > > from host context (which is where the potential locking issues come i=
n).
> > > Which train of thought leads me to ponder this as an alternative (or
> > > additional) solution:
> > >=20
> > > --- a/arch/x86/kvm/x86.c
> > > +++ b/arch/x86/kvm/x86.c
> > > @@ -3733,7 +3733,13 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, =
struct msr_data *msr_info)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u32 msr =3D msr_info->inde=
x;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 u64 data =3D msr_info->dat=
a;
> > > =C2=A0
> > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (msr && msr =3D=3D vcpu->kvm=
->arch.xen_hvm_config.msr)
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 /*
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * Do not allow host-initi=
ated writes to trigger the Xen hypercall
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * page setup; it could in=
cur locking paths which are not expected
> > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 * if userspace sets the M=
SR in an unusual location.
> >=20
> > That's just as likely to break userspace.=C2=A0 Doing a save/restore on=
 the MSR doesn't
> > make a whole lot of sense since it's effectively a "command" MSR, but I=
MO it's not
> > any less likely than userspace putting the MSR index outside of the syn=
thetic range.
>=20
> Save/restore on the MSR makes no sense. It's a write-only MSR; writing
> to it has no effect *other* than populating the target page. In KVM we
> don't implement reading from it at all; I don't think Xen does either?

Hah, that's another KVM bug, technically.  KVM relies on the MSR not being =
handled
in order to generate the write-only semantics, but if the MSR index collide=
s with
an MSR that KVM emulates, then the MSR would be readable.  KVM supports Hyp=
er-V's
HV_X64_MSR_TSC_INVARIANT_CONTROL (0x40000118), so just a few hundred more M=
SRs
until fireworks :-)

If we want to close that hole, it'd be easy enough to add a check in
kvm_get_msr_common().

> Those two happen in reverse chronological order, don't they? And in the
> lower one the comment tells you that hyperv_enabled() doesn't work yet.
> When the higher one is called later, it calls kvm_xen_init() *again* to
> put the MSR in the right place.
>=20
> It could be prettier, but I don't think it's broken, is it?

Gah, -ENOCOFFEE.

> > Userspace breakage aside, disallowng host writes would fix the immediat=
e issue,
> > and I think would mitigate all concerns with putting the host at risk.=
=C2=A0 But it's
> > not enough to actually make an overlapping MSR index work.=C2=A0 E.g. i=
f the MSR is
> > passed through to the guest, the write will go through to the hardware =
MSR, unless
> > the WRMSR happens to be emulated.
> >=20
> > I really don't want to broadly support redirecting any MSR, because to =
truly go
> > down that path we'd need to deal with x2APIC, EFER, and other MSRs that=
 have
> > special treatment and meaning.
> >=20
> > While KVM's stance is usually that a misconfigured vCPU model is usersp=
ace's
> > problem, in this case I don't see any value in letting userspace be stu=
pid.=C2=A0 It
> > can't work generally, it creates unique ABI for KVM_SET_MSRS, and unles=
s there's
> > a crazy use case I'm overlooking, there's no sane reason for userspace =
to put the
> > index in outside of the synthetic range (whereas defining seemingly non=
sensical
> > CPUID feature bits is useful for testing purposes, implementing support=
 in
> > userspace, etc).
>=20
> Right, I think we should do *both*. Blocking host writes solves the
> issue of locking problems with the hypercall page setup. All it would
> take for that issue to recur is for us (or Microsoft) to invent a new
> MSR in the synthetic range which is also written on vCPU init/reset.
> And then the sanity check on where the VMM puts the Xen MSR doesn't
> save us.

Ugh, indeed.  MSRs are quite the conundrum.  Userspace MSR filters have a s=
imilar
problem, where it's impossible to know the semantics of future hardware MSR=
s, and
so it's impossible to document which MSRs userspace is allowed to intercept=
 :-/

Oh!  It doesn't help KVM avoid breaking userspace, but a way for QEMU to av=
oid a
future collision would be to have QEMU start at 0x40000200 when Hyper-V is =
enabled,
but then use KVM_GET_MSR_INDEX_LIST to detect a collision with KVM Hyper-V,=
 e.g.
increment the index until an available index is found (with sanity checks a=
nd whatnot).

> But yes, we should *also* do that sanity check.

Ah, I'm a-ok with that.
