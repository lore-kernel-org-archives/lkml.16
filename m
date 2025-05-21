Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33CEC2673BA
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:43:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747860215; cv=none; b=KvreMTqIwwg7UYAmTDxXI9mRsc3ueFYMlQnMdlgGqI1TZkLguLeTcC2wKRPqQBMSjt0uhuIXFe4xhVfbEClsPlPWE6VdJFH6RwfHKpuJDbyz0jPF5uCP30wotc1RdU7Ix1y8MGjftv/xeRXuXr/TrkpMlQl7Fc6yBIqXdhGcKHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747860215; c=relaxed/simple;
	bh=0ceGMOHptUyIy0ypOVSOmofHrFvCX+ASufP889K450c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Z7QYAIfWsX4kkir27caz8lwnLJA6ZkuqmlBjAz0O88caawSJtr22sPte52YC9QjrgzdSPxZmwIbImP09RPqigAZWyo6uC5zTEZUv1mFGKQowxaCK/0+NRsofiOR0v/wPTPm1SE3UYDMkpM+7JJReQDXtJEfVH3WDvWdvu4ducDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dq3BuVLb; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dq3BuVLb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747860211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5QhVuiYHXnMKTT9hZMGdfVh8tHp1Qoyqf1HjxLRFKog=;
	b=dq3BuVLbEuOlu6G8iFXJJTxjZ4dt5qydWtbWNvwRMBFBpfIMBvYmaXTUaCMvVsm6GHyF4S
	PYPwdHY+rTEhaRdVkkey4FdWN4gOdQaSh2jBgLR1lqMOjSwJiz0do7HusWxKVbUlxn6Oan
	O2UVX68+M0puaGhHCOW41or+1VHZOR8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-66-VC2dFdosOSmuNG5kCblImw-1; Wed, 21 May 2025 16:43:28 -0400
X-MC-Unique: VC2dFdosOSmuNG5kCblImw-1
X-Mimecast-MFC-AGG-ID: VC2dFdosOSmuNG5kCblImw_1747860208
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c82c6d72so1288385285a.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:43:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747860208; x=1748465008;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5QhVuiYHXnMKTT9hZMGdfVh8tHp1Qoyqf1HjxLRFKog=;
        b=i/QT71dohfoHKRrr4VysqCw/vr3LChcqI1/knFmqtk3KR8mI9MW+zSAoSceaBbGYWw
         IqFDXuiiN7mFqaMLVJgqXgSn6BSq+etwaoV7dA6t956Dg/q0aJnbhuVZglGj3FdQ6qxi
         QCbIqfqpk+KqetHkFaxokAzHR+rFZFZ0e3+If4n9O4pJED36PTMPEfjEvCMrEDjLmjQb
         jcpVNXkRC6wbIiP93s2UYEF3+jCMiUi6QRw1sEfWn7ZI8+ny+Iwxp7eUE/R08R/0nwaB
         gb71tpsQDnWbzxB3AX39d9XBieQuXr0I5TrptbozH3DNPrk1qXsr95Fj+tM5LDOzxLNM
         jQQw==
X-Forwarded-Encrypted: i=1; AJvYcCUnclzuDtuZEsuwkRoLdvpRbXlDgchHFpO63qL1gJgHp1Y/fwXP7w2V0JcSaDEueiBE1Xj2jmAba6qBJ+c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzyu9wL7t0R2yDUV79TZDMOKJAMxm7CGs5Rkkh5gMJ2BtXkJPfc
	uou5nTy1fDBgahULzi6hXvvmwxSX+qB1YRQujkoB2Q3lD/KYVjiNy0GsbLdwsaWiToDdgWubLQw
	jzGAsh2n9Nbhtp2aljA41JG+FgIPrXwNDb44U5Rn6Dc/DIxsLwk8/7jUxvQQ/yy5ddg==
X-Gm-Gg: ASbGnctdKHMnPx48P8myv+QCJ3fX6T69b2OflT3uHobA3lB949e4OIlCLTgI+gqE3ry
	2wl1ilke/qoB710rko5Gl5MzF5SqIj5S8gpc8U/Aym4/kqpgOzem9piihvlhZAiK0H9kKtdMcgv
	7WjplFzqJTCvRRD9brK9skot1a/+au8jJJHFVuO/ELnintIgylwOWVJKyvIZn3cz5PcjUz72qqu
	Q1Kbnl73MwnBYWm0QiM8eazHqW3eFnFcxzGJEBiTnZxPryCJyDvjkWnm56oa4MX+CVVF2lVyuml
	IG2BZfQtSHjhWLXkS4x2ygJSJnQwX/L62WjMSKuAaDAcakOjBdD97GHyl3Y=
X-Received: by 2002:a05:620a:454b:b0:7ca:f41d:ce06 with SMTP id af79cd13be357-7cd4673c0acmr3595567085a.31.1747860207944;
        Wed, 21 May 2025 13:43:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/vUkExQdWyMJBBGahe35PDZUdiPaA5CMO+SY75XRIorypUiCDgVaDI/XRxEABMXS/iSSM5g==
X-Received: by 2002:a05:620a:454b:b0:7ca:f41d:ce06 with SMTP id af79cd13be357-7cd4673c0acmr3595563885a.31.1747860207591;
        Wed, 21 May 2025 13:43:27 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467bc2dbsm927205385a.15.2025.05.21.13.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 13:43:27 -0700 (PDT)
Message-ID: <24c39bb2f1e97ef2e6207894cb62e456bededce0.camel@redhat.com>
Subject: Re: [PATCH v4 4/4] x86: KVM: VMX: preserve DEBUGCTLMSR_FREEZE_IN_SMM
From: mlevitsk@redhat.com
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav
 Petkov <bp@alien8.de>, x86@kernel.org, Ingo Molnar <mingo@redhat.com>, 
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Wed, 21 May 2025 16:43:26 -0400
In-Reply-To: <aC0IwYfNvuo_vUDU@google.com>
References: <20250515005353.952707-1-mlevitsk@redhat.com>
	 <20250515005353.952707-5-mlevitsk@redhat.com> <aC0IwYfNvuo_vUDU@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-05-20 at 15:57 -0700, Sean Christopherson wrote:
> KVM: VMX:
>=20
> On Wed, May 14, 2025, Maxim Levitsky wrote:
> > Pass through the host's DEBUGCTL.DEBUGCTLMSR_FREEZE_IN_SMM to the guest
> > GUEST_IA32_DEBUGCTL without the guest seeing this value.
> >=20
> > Since the value of the host DEBUGCTL can in theory change between VM ru=
ns,
> > check if has changed, and if yes, then reload the GUEST_IA32_DEBUGCTL w=
ith
> > the new value.
>=20
> Please split this into two patches.=C2=A0 Add vmx_guest_debugctl_{read,wr=
ite}(), then
> land the FREEZE_IN_SMM change on top.=C2=A0 Adding the helpers should be =
a nop and
> thus trivial to review, and similarly the DEBUGCTLMSR_FREEZE_IN_SMM chang=
e is
> actually pretty small.=C2=A0 But combined, this patch is annoying to revi=
ew because
> there's a lot of uninteresting diff to wade through to get at the FREEZE_=
IN_SMM
> logic.

No problem.

>=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> > =C2=A0arch/x86/include/asm/kvm_host.h |=C2=A0 1 +
> > =C2=A0arch/x86/kvm/vmx/nested.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=
=C2=A0 4 ++--
> > =C2=A0arch/x86/kvm/vmx/vmx.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 | 22 +++++++++++++++++++---
> > =C2=A0arch/x86/kvm/vmx/vmx.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 2 ++
> > =C2=A0arch/x86/kvm/x86.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 7 +++++--
> > =C2=A05 files changed, 29 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm=
_host.h
> > index d2ad31a1628e..2e7e4a8b392e 100644
> > --- a/arch/x86/include/asm/kvm_host.h
> > +++ b/arch/x86/include/asm/kvm_host.h
> > @@ -1673,6 +1673,7 @@ static inline u16 kvm_lapic_irq_dest_mode(bool de=
st_mode_logical)
> > =C2=A0enum kvm_x86_run_flags {
> > =C2=A0	KVM_RUN_FORCE_IMMEDIATE_EXIT	=3D BIT(0),
> > =C2=A0	KVM_RUN_LOAD_GUEST_DR6		=3D BIT(1),
> > +	KVM_RUN_LOAD_DEBUGCTL		=3D BIT(2),
> > =C2=A0};
> > =C2=A0
> > =C2=A0struct kvm_x86_ops {
>=20
> ...
>=20
> > @@ -7368,6 +7381,9 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u6=
4 run_flags)
> > =C2=A0	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
> > =C2=A0		set_debugreg(vcpu->arch.dr6, 6);
> > =C2=A0
> > +	if (run_flags & KVM_RUN_LOAD_DEBUGCTL)
> > +		vmx_guest_debugctl_write(vcpu, vmx_guest_debugctl_read());
> > +
> > =C2=A0	/*
> > =C2=A0	 * Refresh vmcs.HOST_CR3 if necessary.=C2=A0 This must be done i=
mmediately
> > =C2=A0	 * prior to VM-Enter, as the kernel may load a new ASID (PCID) a=
ny time
> > diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> > index 1b80479505d3..5ddedf73392b 100644
> > --- a/arch/x86/kvm/vmx/vmx.h
> > +++ b/arch/x86/kvm/vmx/vmx.h
> > @@ -416,6 +416,8 @@ static inline void vmx_set_intercept_for_msr(struct=
 kvm_vcpu *vcpu, u32 msr,
> > =C2=A0
> > =C2=A0void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
> > =C2=A0u64 vmx_get_supported_debugctl(struct kvm_vcpu *vcpu, bool host_i=
nitiated);
> > +void vmx_guest_debugctl_write(struct kvm_vcpu *vcpu, u64 val);
> > +u64 vmx_guest_debugctl_read(void);
>=20
> I vote to make these static inlines, I don't see any reason to bury them =
in vmx.c

No problem as well.

>=20
> > =C2=A0/*
> > =C2=A0 * Note, early Intel manuals have the write-low and read-high bit=
map offsets
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 684b8047e0f2..a85078dfa36d 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -10752,7 +10752,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vc=
pu)
> > =C2=A0		dm_request_for_irq_injection(vcpu) &&
> > =C2=A0		kvm_cpu_accept_dm_intr(vcpu);
> > =C2=A0	fastpath_t exit_fastpath;
> > -	u64 run_flags;
> > +	u64 run_flags, host_debug_ctl;
> > =C2=A0
> > =C2=A0	bool req_immediate_exit =3D false;
> > =C2=A0
> > @@ -11024,7 +11024,10 @@ static int vcpu_enter_guest(struct kvm_vcpu *v=
cpu)
> > =C2=A0		set_debugreg(0, 7);
> > =C2=A0	}
> > =C2=A0
> > -	vcpu->arch.host_debugctl =3D get_debugctlmsr();
> > +	host_debug_ctl =3D get_debugctlmsr();
>=20
> This can probably just be debug_ctl to shorten the lines, I don't see a s=
trong
> need to clarify it's the host's value since all accesses are clustered to=
gether.
>=20
> > +	if (host_debug_ctl !=3D vcpu->arch.host_debugctl)
> > +		run_flags |=3D KVM_RUN_LOAD_DEBUGCTL;
> > +	vcpu->arch.host_debugctl =3D host_debug_ctl;
>=20
> Argh, the TDX series didn't get refreshed (or maybe it got poorly rebased=
), and
> now there's a redundant and confusing "host_debugctlmsr" field in vcpu_vt=
.=C2=A0 Can
> you slot in the below?=C2=A0 It's not urgent enough to warrant posting se=
parately,
> and handling TDX in this series would get a bit wonky if TDX uses a diffe=
rent
> snapshot.
>=20
> The reason I say that TDX will get wonky is also why I think the "are bit=
s
> changing?" check in x86.c needs to be precise.=C2=A0 KVM_RUN_LOAD_DEBUGCT=
L should
> *never* be set for TDX and SVM, and so they should WARN instead of silent=
ly
> doing nothing.=C2=A0 But to do that without generating false positives, t=
he common
> check needs to be precise.
>=20
> I was going to say we could throw a mask in kvm_x86_ops, but TDX throws a=
 wrench
> in that idea.=C2=A0 Aha!=C2=A0 Actually, we can still use kvm_x86_ops.=C2=
=A0 TDX can be exempted
> via guest_state_protected.=C2=A0 E.g. in common x86:
>=20
> 	debug_ctl =3D get_debugctlmsr();
> 	if (((debug_ctl ^ vcpu->arch.host_debugctl) & kvm_x86_ops.HOST_DEBUGCTL_=
MASK) &&
> 	=C2=A0=C2=A0=C2=A0 !vcpu->arch.guest_state_protected)
> 		run_flags |=3D KVM_RUN_LOAD_DEBUGCTL;
> 	vcpu->arch.host_debugctl =3D debug_ctl;

Makes sense. I need to remember that TDX has arrived so I have to take it
in the account from now on.

All right, thanks for the review, I will post a new patch series soon.


Best regards,
	Maxim Levitsky

>=20
> --
> From: Sean Christopherson <seanjc@google.com>
> Date: Tue, 20 May 2025 15:37:41 -0700
> Subject: [PATCH] KVM: TDX: Use kvm_arch_vcpu.host_debugctl to restore the
> =C2=A0host's DEBUGCTL
>=20
> Use the kvm_arch_vcpu.host_debugctl snapshot to restore DEBUGCTL after
> running a TD vCPU.=C2=A0 The final TDX series rebase was mishandled, like=
ly due
> to commit fb71c7959356 ("KVM: x86: Snapshot the host's DEBUGCTL in common
> x86") deleting the same line of code from vmx.h, i.e. creating a semantic
> conflict of sorts, but no syntactic conflict.
>=20
> Using the version in kvm_vcpu_arch picks up the ulong =3D> u64 fix (which
> isn't relevant to TDX) as well as the IRQ fix from commit 189ecdb3e112
> ("KVM: x86: Snapshot the host's DEBUGCTL after disabling IRQs").
>=20
> Link: https://lore.kernel.org/all/20250307212053.2948340-10-pbonzini@redh=
at.com
> Cc: Adrian Hunter <adrian.hunter@intel.com>
> Fixes: 8af099037527 ("KVM: TDX: Save and restore IA32_DEBUGCTL")
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
> =C2=A0arch/x86/kvm/vmx/common.h | 2 --
> =C2=A0arch/x86/kvm/vmx/tdx.c=C2=A0=C2=A0=C2=A0 | 6 ++----
> =C2=A02 files changed, 2 insertions(+), 6 deletions(-)
>=20
> diff --git a/arch/x86/kvm/vmx/common.h b/arch/x86/kvm/vmx/common.h
> index 8f46a06e2c44..66454bead202 100644
> --- a/arch/x86/kvm/vmx/common.h
> +++ b/arch/x86/kvm/vmx/common.h
> @@ -53,8 +53,6 @@ struct vcpu_vt {
> =C2=A0#ifdef CONFIG_X86_64
> =C2=A0	u64		msr_host_kernel_gs_base;
> =C2=A0#endif
> -
> -	unsigned long	host_debugctlmsr;
> =C2=A0};
> =C2=A0
> =C2=A0#ifdef CONFIG_KVM_INTEL_TDX
> diff --git a/arch/x86/kvm/vmx/tdx.c b/arch/x86/kvm/vmx/tdx.c
> index 7dbfad28debc..84b2922b8119 100644
> --- a/arch/x86/kvm/vmx/tdx.c
> +++ b/arch/x86/kvm/vmx/tdx.c
> @@ -778,8 +778,6 @@ void tdx_prepare_switch_to_guest(struct kvm_vcpu *vcp=
u)
> =C2=A0	else
> =C2=A0		vt->msr_host_kernel_gs_base =3D read_msr(MSR_KERNEL_GS_BASE);
> =C2=A0
> -	vt->host_debugctlmsr =3D get_debugctlmsr();
> -
> =C2=A0	vt->guest_state_loaded =3D true;
> =C2=A0}
> =C2=A0
> @@ -1056,8 +1054,8 @@ fastpath_t tdx_vcpu_run(struct kvm_vcpu *vcpu, u64 =
run_flags)
> =C2=A0
> =C2=A0	tdx_vcpu_enter_exit(vcpu);
> =C2=A0
> -	if (vt->host_debugctlmsr & ~TDX_DEBUGCTL_PRESERVED)
> -		update_debugctlmsr(vt->host_debugctlmsr);
> +	if (vcpu->arch.host_debugctl & ~TDX_DEBUGCTL_PRESERVED)
> +		update_debugctlmsr(vcpu->arch.host_debugctl);
> =C2=A0
> =C2=A0	tdx_load_host_xsave_state(vcpu);
> =C2=A0	tdx->guest_entered =3D true;
>=20
> base-commit: 475a02020ac2de6b10e85de75e79833139b556e0
> --
>=20

