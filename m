Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52E6ADF59
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:07:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738768027; cv=none; b=L9nyp2qXSUb8B2fX4nb8EHn1P6xBYKE2EQRaiDXOJhzGIlkOa6aqQs7PK2NQQQDov4T87UmaAsgW+atrvAf2AWEvTRe72zvCxbewB1p4rH4P8Lanf3aptkO1mYwq3i2IjRjVc7W1tum84x1S2AVQZ/hwzguFNX7XOa4M9yF5Hog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738768027; c=relaxed/simple;
	bh=H9Hy4gOxKEd66YhBYkMkYPFJBkFFoDc4atCnWsCOGpI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gqr2Mz9mlyapY7GbkS5cIrSXJ3xTysewB9vNaAeU0GdXXmkqeVZ3iQvIUvP/GWnmvEndalg8oypoaF1uvoGoyEtIrJpJbnYOTMKIAxfVJC9iy9Uth+5boTpB7VIaedWXdkkr2NSJgBOghU2C5bXVUElFnFsdMeyhxSghqGp4YSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gsO61bSW; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gsO61bSW"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee86953aeaso12947718a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:07:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738768025; x=1739372825; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=x4oW/dAfjtIYVmLRtu5aqY7ul2Z1RIM2CtrfkUILPao=;
        b=gsO61bSW110ErjobseKoFM5n2BZAL5TM9uJxpvx5TWiU1kEFSQF0IZ3VzD3Fhj7tYz
         33c4rg/635u2atWKKB36HCeTvHiAQmDGqmSf4UDV93ZfB1mAD4Jc3lFJzihSTHLg7M7D
         7vc8uysACLMiFAPEGfP8umBWEnKCgQs0uDyEyQ4afkCuSR4ZbKAdCBOp8TpcVnmEfxHo
         qLgBZYVLzaxA5tE64Bk19tuD9nCXeTXumOjQYmChWxSaFmJZKzCInfSb4beEMu1DLOnk
         LIV2Bx3YMtH2pevYbgKcs8RDCuVRRTyg11NJnPHRcggkoind/+HM25ELaFF/EEtD87p7
         gGvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738768025; x=1739372825;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=x4oW/dAfjtIYVmLRtu5aqY7ul2Z1RIM2CtrfkUILPao=;
        b=qw0vX4M8eB5vaHMSun+SHGQ4WEgRsyM3fLjllswVmxxEgjhy/RdRX0jxFrgbARiHIg
         HbdWbk9RKGd8NI/UcvWU1mCHtuv/Ng6wEpYg6FmZpPVtA6RCfIDR6NjZMRONYGTR4+uM
         eQKdIjrS4cJDgrHmU6ihss3jXhrKJnUnU+v5IgqxPF2fKk6hDi9GXxSYQ6EW29p3iIys
         2E2ARjaYJ2ikrJvkVH0qAJlS5KUxukwZq18gMcvr6wPOGnA6+vjWxYOYdcsIlc6tfqXX
         1/zSsR3nT9ij+8TiESHL/45KU6+0Mme9dU6RHLGD7gLMpCct5K4U+1kmu7O6ccX0c1gB
         oyUw==
X-Forwarded-Encrypted: i=1; AJvYcCUrUpBJzvqWNmSmqbLkgt/j3D69FrKmAHylvdzGvrVl89nUs1H9pmQQzcSLR6j3r2qCXvXihiq2YDXml7Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLNG/Y7TJZkwmCUuP7bXkailXcbPuwCyLik37nEyOawfOWR1T
	Nbhqlj0/vch8TfuwwTbXezVZgeNBqty0aVzDFJZNrV/jRYWQ6n1gS2zmgzRxDUqL0wRrYkvMPjs
	X4w==
X-Google-Smtp-Source: AGHT+IHXf9TWBtdxouWYPQZ0tUW8cJ9QFjrqHbhdh6cqzplE7+BtUhY/bbSQzbcNUl1oWImGd1KSiadmTfM=
X-Received: from pfbfb15.prod.google.com ([2002:a05:6a00:2d8f:b0:725:eccc:e998])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:450a:b0:729:a31:892d
 with SMTP id d2e1a72fcca58-73035117eb6mr5841339b3a.8.1738768025226; Wed, 05
 Feb 2025 07:07:05 -0800 (PST)
Date: Wed, 5 Feb 2025 07:06:58 -0800
In-Reply-To: <43f702b383fb99d435f2cdb8ef35cc1449fe6c23.camel@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201011400.669483-1-seanjc@google.com> <20250201011400.669483-2-seanjc@google.com>
 <43f702b383fb99d435f2cdb8ef35cc1449fe6c23.camel@infradead.org>
Message-ID: <Z6N-kn1-p6nIWHeP@google.com>
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
> On Fri, 2025-01-31 at 17:13 -0800, Sean Christopherson wrote:
> > --- a/arch/x86/kvm/xen.c
> > +++ b/arch/x86/kvm/xen.c
> > @@ -1324,6 +1324,14 @@ int kvm_xen_hvm_config(struct kvm *kvm, struct k=
vm_xen_hvm_config *xhc)
> > =C2=A0	=C2=A0=C2=A0=C2=A0=C2=A0 xhc->blob_size_32 || xhc->blob_size_64)=
)
> > =C2=A0		return -EINVAL;
> > =C2=A0
> > +	/*
> > +	 * Restrict the MSR to the range that is unofficially reserved for
> > +	 * synthetic, virtualization-defined MSRs, e.g. to prevent confusing
> > +	 * KVM by colliding with a real MSR that requires special handling.
> > +	 */
> > +	if (xhc->msr && (xhc->msr < 0x40000000 || xhc->msr > 0x4fffffff))
> > +		return -EINVAL;
> > +
> > =C2=A0	mutex_lock(&kvm->arch.xen.xen_lock);
> > =C2=A0
> > =C2=A0	if (xhc->msr && !kvm->arch.xen_hvm_config.msr)
>=20
> I'd prefer to see #defines for those magic values.

Can do.  Hmm, and since this would be visible to userspace, arguably the #d=
efines
should go in arch/x86/include/uapi/asm/kvm.h

> Especially as there is a corresponding requirement that they never be set
> from host context (which is where the potential locking issues come in).
> Which train of thought leads me to ponder this as an alternative (or
> additional) solution:
>=20
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3733,7 +3733,13 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, stru=
ct msr_data *msr_info)
>         u32 msr =3D msr_info->index;
>         u64 data =3D msr_info->data;
> =20
> -       if (msr && msr =3D=3D vcpu->kvm->arch.xen_hvm_config.msr)
> +       /*
> +        * Do not allow host-initiated writes to trigger the Xen hypercal=
l
> +        * page setup; it could incur locking paths which are not expecte=
d
> +        * if userspace sets the MSR in an unusual location.

That's just as likely to break userspace.  Doing a save/restore on the MSR =
doesn't
make a whole lot of sense since it's effectively a "command" MSR, but IMO i=
t's not
any less likely than userspace putting the MSR index outside of the synthet=
ic range.

Side topic, upstream QEMU doesn't even appear to put the MSR at the Hyper-V
address.  It tells the guest that's where the MSR is located, but the confi=
g
passed to KVM still uses the default.

        /* Hypercall MSR base address */
        if (hyperv_enabled(cpu)) {
            c->ebx =3D XEN_HYPERCALL_MSR_HYPERV;
            kvm_xen_init(cs->kvm_state, c->ebx);
        } else {
            c->ebx =3D XEN_HYPERCALL_MSR;
        }

...

        /* hyperv_enabled() doesn't work yet. */
        uint32_t msr =3D XEN_HYPERCALL_MSR;
        ret =3D kvm_xen_init(s, msr);
        if (ret < 0) {
            return ret;
        }

Userspace breakage aside, disallowng host writes would fix the immediate is=
sue,
and I think would mitigate all concerns with putting the host at risk.  But=
 it's
not enough to actually make an overlapping MSR index work.  E.g. if the MSR=
 is
passed through to the guest, the write will go through to the hardware MSR,=
 unless
the WRMSR happens to be emulated.

I really don't want to broadly support redirecting any MSR, because to trul=
y go
down that path we'd need to deal with x2APIC, EFER, and other MSRs that hav=
e
special treatment and meaning.

While KVM's stance is usually that a misconfigured vCPU model is userspace'=
s
problem, in this case I don't see any value in letting userspace be stupid.=
  It
can't work generally, it creates unique ABI for KVM_SET_MSRS, and unless th=
ere's
a crazy use case I'm overlooking, there's no sane reason for userspace to p=
ut the
index in outside of the synthetic range (whereas defining seemingly nonsens=
ical
CPUID feature bits is useful for testing purposes, implementing support in
userspace, etc).
