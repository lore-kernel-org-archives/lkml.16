Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAAAB190072
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747406971; cv=none; b=nTqz1iEBZ4iHOS1x61pX/VzGBW94YFCvMIKdFL3nX/oBhdUwtBbCChrP2qp0MSIiBp3H2CyySWyvZbsREJa6PZg8/y0hSqtiO/p5mMH0qMFIAkWx3x7iwnVczH6Wz3qRw+HqgEy4r3mP2rxVoDnVsIEDnFPNJ6tUMhDoj1C/RrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747406971; c=relaxed/simple;
	bh=V1IhcdHuLlr/d6r+F0mxbsOxSnhxkIGaaWWorKm7lCk=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=GexrONAKIrON4wn8Cz6xzruGD00E5OsqXZNuGoG8xGBktgxWLKzMv0FNRhox5tyKkdrKhlJto3uq67PBMO75lG4KeQ8ble0VLp60gdnMrF/KBUATbtdPS27/wxu4WMPUNSF9o3Z/QGs72U0EsFhMdZrOV09ZVKNklK6fdq5pd1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hdVCbq/o; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hdVCbq/o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747406968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mUcEcOcsB6h+4BkG97q/0gEUCHaJixYyDJw3pTDwFoI=;
	b=hdVCbq/ohMerUW0vwm1VyKT/NMoXU0KbKJbHSOJXoEGIUN8okSLKz9ineb5xQdQMPOEICb
	vp75PNjCf1oprQci4TqGCcn9xJ/0o85Gqbm2ul3W713c7AUXi9yUqtSx1W76JI+GyOLsqP
	1oGZEIJfUmZzyZ5gn3NWVNdV0R2h1kQ=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-1yvL0lu8Mzm-EQrvc8qrbQ-1; Fri, 16 May 2025 10:49:27 -0400
X-MC-Unique: 1yvL0lu8Mzm-EQrvc8qrbQ-1
X-Mimecast-MFC-AGG-ID: 1yvL0lu8Mzm-EQrvc8qrbQ_1747406967
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5750ca8b2so313937785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:49:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747406967; x=1748011767;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mUcEcOcsB6h+4BkG97q/0gEUCHaJixYyDJw3pTDwFoI=;
        b=GzKM9bfHHn5oRsXD5+UunpjfP4wrw+OWU0e6HN0Vx2vQA9TbDPWyqp9vii3FWSfN7Z
         GI2TCafNNpds0mxBrJqg58rfZN7RDG3tXtGRUgypWW2APgBhQNd3dofwo90fmnOWsflo
         zmhvJNFwGkLLpJExO6IXoxWV6tV2We9kSGN4nfqH1+Spo616eXbsZYQ0vB11fp0iO6fI
         +QM4NorTLWJTYYRISTgd6H/bKeAGKkSusbrxavKhmQhbeqezAFSKGgw04nDIl4Gl8zk4
         bs+pTp/Xj82JcWDNAR5A0DlGNJHoQWN1X1clN3FlX7ewcfQh+kkC4T5Yziibx8Of4PHT
         Giow==
X-Forwarded-Encrypted: i=1; AJvYcCWKsLrb/eSz/03WP7xRMz1deGsDKAgVaZIoy6olMbmnWmyfd43MP7SShVHzwoseBU5wUDyUPKFhZo0Rcdw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5X2WYf8yvgcF3yl0GQ58rvoni6O24tfpnfatBOWFVzg9vpJo0
	aeJe2AttR+N/ch2zIEaVTYqp9YSdOUXp+dFEaz1yi3jd+hZf35D64bbqO+ndHfi1U+AZGOvuCT2
	L3CWJig23A/2jAvOGaSZ50PXwAlb7oE8bnvs8zrVB+EmDUOdnLH3KEyCKT4G48+DzYW7HbbDJkQ
	==
X-Gm-Gg: ASbGnctxfZJQNqBz/2Heh6mEpmm1uNLBFRMzIqKQ7zFlKghkRBxTfernShhqFEoTcMZ
	pP8in9tXfXdxXnQWT9pxZPGFBxW9lNw77bhON7xTENulgO6GZzDA0ZIGkUc9iMR4lf/4wjQYKWZ
	5TjRfa7alftMg7KT3tsCbqCQ4t3fL1UugLbHpskV/4DYYiMIjINkN0hD7smZyPIRGuoN1Qsf+wT
	6WvAasryNZImEsNjkak0o6Ebw9DYTC6EuhXKY+vaCUDWk/mdQzNVTjhy1FduGKCJbIerHUj7CGV
	RFqSxvK0XsobyexoBm5LbkaF/MqkAqySnCJUa6c54uyiHvbKkl2CTtpCP98=
X-Received: by 2002:a05:620a:29c3:b0:7ca:ef12:966d with SMTP id af79cd13be357-7cd467b103dmr613005385a.56.1747406966748;
        Fri, 16 May 2025 07:49:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0u0P+i81pUZ2hIpvTs4Eb+N0jEjlBklcN57ZAA9+FoG4QFTalDVFOAfKwNgrgmTQEBgRbdQ==
X-Received: by 2002:a05:620a:29c3:b0:7ca:ef12:966d with SMTP id af79cd13be357-7cd467b103dmr612999985a.56.1747406966341;
        Fri, 16 May 2025 07:49:26 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd467da087sm126161685a.41.2025.05.16.07.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 07:49:25 -0700 (PDT)
Message-ID: <5b43682cff05f0399c4d75cf6361374280f12c05.camel@redhat.com>
Subject: Re: [PATCH v4 4/4] x86: KVM: VMX: preserve DEBUGCTLMSR_FREEZE_IN_SMM
From: mlevitsk@redhat.com
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean
 Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, 
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Fri, 16 May 2025 10:49:24 -0400
In-Reply-To: <aCazfDoU8DV3s/mh@intel.com>
References: <20250515005353.952707-1-mlevitsk@redhat.com>
	 <20250515005353.952707-5-mlevitsk@redhat.com> <aCazfDoU8DV3s/mh@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-16 at 11:39 +0800, Chao Gao wrote:
> > @@ -7368,6 +7381,9 @@ fastpath_t vmx_vcpu_run(struct kvm_vcpu *vcpu, u6=
4 run_flags)
> > 	if (run_flags & KVM_RUN_LOAD_GUEST_DR6)
> > 		set_debugreg(vcpu->arch.dr6, 6);
> >=20
> > +	if (run_flags & KVM_RUN_LOAD_DEBUGCTL)
> > +		vmx_guest_debugctl_write(vcpu, vmx_guest_debugctl_read());
>=20
> ...
>=20
> > +
> > 	/*
> > 	 * Refresh vmcs.HOST_CR3 if necessary.=C2=A0 This must be done immedia=
tely
> > 	 * prior to VM-Enter, as the kernel may load a new ASID (PCID) any tim=
e
> > diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> > index 1b80479505d3..5ddedf73392b 100644
> > --- a/arch/x86/kvm/vmx/vmx.h
> > +++ b/arch/x86/kvm/vmx/vmx.h
> > @@ -416,6 +416,8 @@ static inline void vmx_set_intercept_for_msr(struct=
 kvm_vcpu *vcpu, u32 msr,
> >=20
> > void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
> > u64 vmx_get_supported_debugctl(struct kvm_vcpu *vcpu, bool host_initiat=
ed);
> > +void vmx_guest_debugctl_write(struct kvm_vcpu *vcpu, u64 val);
> > +u64 vmx_guest_debugctl_read(void);
> >=20
> > /*
> > =C2=A0* Note, early Intel manuals have the write-low and read-high bitm=
ap offsets
> > diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> > index 684b8047e0f2..a85078dfa36d 100644
> > --- a/arch/x86/kvm/x86.c
> > +++ b/arch/x86/kvm/x86.c
> > @@ -10752,7 +10752,7 @@ static int vcpu_enter_guest(struct kvm_vcpu *vc=
pu)
> > 		dm_request_for_irq_injection(vcpu) &&
> > 		kvm_cpu_accept_dm_intr(vcpu);
> > 	fastpath_t exit_fastpath;
> > -	u64 run_flags;
> > +	u64 run_flags, host_debug_ctl;
> >=20
> > 	bool req_immediate_exit =3D false;
> >=20
> > @@ -11024,7 +11024,10 @@ static int vcpu_enter_guest(struct kvm_vcpu *v=
cpu)
> > 		set_debugreg(0, 7);
> > 	}
> >=20
> > -	vcpu->arch.host_debugctl =3D get_debugctlmsr();
> > +	host_debug_ctl =3D get_debugctlmsr();
> > +	if (host_debug_ctl !=3D vcpu->arch.host_debugctl)
> > +		run_flags |=3D KVM_RUN_LOAD_DEBUGCTL;
> > +	vcpu->arch.host_debugctl =3D host_debug_ctl;
>=20
> IIUC, using run_flags here may only update the GUEST_DEBUGCTL field of a =
vmcs02,
> leaving vmcs01 not updated.

Hi,

Thankfully this should not be a problem because when KVM exits from vmcs02 =
to vmcs01 the
IA32_DEBUGCTL is reset to 0.=C2=A0

If I=E2=80=99m not mistaken, this always happens regardless of the VM_ENTRY=
_LOAD_DEBUG_CONTROLS.

Now since I wrapped the write of the with a helper function (vmx_guest_debu=
gctl_write),
it should pick up the new value.


Best regards,
	Maxim Levitsky

>=20
> >=20
> > 	guest_timing_enter_irqoff();
> >=20
> > --=20
> > 2.46.0
> >=20
> >=20
>=20

