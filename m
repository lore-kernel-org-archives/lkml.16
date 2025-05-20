Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F077182BC
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 21:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747777731; cv=none; b=klYpGzWCaqM3T64OUPedVNJVrdbYnK2oJGJej+2rMabkyhNka6cCDyNneL0tYFY9y9QZluwJngnnwkMKB2Dq1PtdTGONep7hOcgtqlt1bmY2zu9neoaN4K1AIFnH2vNq3izkRmvrRIsi1eh3pWLmwlUTa7L07A/KtyFmzRE6Bag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747777731; c=relaxed/simple;
	bh=5LoP3oqgkFKk6ICaoX4/klDyU+9dYXEmA86kg6cSZJA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BNcqLuh4xuiSFABjOwF39oJWL01cAmlWXlqHcYv+cPSVnXkBsIom0uvZOmYp2P9Wq3k7vWUMllggPPH1zygRqy0l7whGmOcOQQKEh2vnXUwmq15QiaLKdsc9u9mt0eysQv2TZKZBgYNJbGCV2w22ZirGk9aL/zfKOD8eiyIWo1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQBdt9sW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQBdt9sW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747777728;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EutPvaaVGl0ODINF9E/bZzQuSm+ScWKoBRiRqN3WqE0=;
	b=EQBdt9sWsqQToJ4TO0fTQltngSKDF90P2D9lJetBSJDQKcTk+J7s8tZudN5/0KW3yGyIFp
	Aeod+dkTrem55+bh7mitOesdKQTccuYSioGbKczqz9FqAKzMlIYIiq3bXuyiIu9mZ2FbDS
	kgHSutlh8XgcnmpIVa8Rn9nlyW4GiMY=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-627-FqDUdSpCORCSsZ1Ua26KUg-1; Tue, 20 May 2025 17:48:47 -0400
X-MC-Unique: FqDUdSpCORCSsZ1Ua26KUg-1
X-Mimecast-MFC-AGG-ID: FqDUdSpCORCSsZ1Ua26KUg_1747777727
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8e7b78eebso23594796d6.2
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747777727; x=1748382527;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EutPvaaVGl0ODINF9E/bZzQuSm+ScWKoBRiRqN3WqE0=;
        b=g/Vc8Qv6euPtpbhf944GM8nrLQw0HPHfGohOLni+q6cXF4XX9qn2PKPV6DnHoQobRO
         25QFpDnDoKGa/kTPUnTNcFDnUh8/BETpc4vtimvxrPO6qGBL+o0hF+qDqrKgLjclRny4
         tLIor3hcItcSPfbnxuFK24efH0Er5wn3xQCh6jxEgEiJLeeUlGtzor5BEYwfea27oLqK
         5xfIuMhH2qeHl7lF9fovKBif5zahGo0FiR0hmsbKRBEn/E1/tXnWop0QaCePFuD/jlE2
         OrGADXSahEkDLkADp4g+SbsBignAmCM4xTkDxzyW/i4+gGJf1/CL18S7MXzlyunZIa0s
         s1pA==
X-Forwarded-Encrypted: i=1; AJvYcCUDnmiHu3F7SMjz+d5KhepWdc9u1wivmxzGoOoNbFIAMSMNqurF2X9POhMTWpoDwESijgU2zbVXdjqsYro=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3W33KR7UlyfwF3JquVL13TtcWeDvzKEGyMgqybdJhAY8rVao3
	S83CaIyGc+yO3q7P9UeQo9A0qXrXhAxjv49i5WcJC5OzK0vzIEbPhOts9BtRk16Z3qqhTucfrP+
	EpMdudp1tfaoVcPoOHG6ufokU4gY8tlhVWCBN3S6eYqfgWMAlCo5FsclTW1OkT6JKjQ==
X-Gm-Gg: ASbGncuQP43hwwEgKqpo5tdXg4e9jDAMCGlgradihatZX/Q5opi+4AJBrVPwkTzoxZ5
	2BmwfI15fhg0fn7H1u6ilhEHnYzgR57hXFi6bj9LCf8nksblXuu22Vqa/g/1BlakDGczO2aLh5L
	Sy1VpKS3lGOU4QrE0z/oJO55bEjLn7PfqOl6hv8u4zeU8pXI3/3R/1OUGDhlgjmZIguFVBInbrl
	40RDYLk3FU92tvcx0mUkaKl8oAMjn4Uqfc0/H7daV9tD+kJmtknwe8sOAoFQA1z2QS70ddCYzyy
	r2Kca4zSDs9FndINgBUNT/8y4KQ+TT32r61J2PRx3WNlkJ6KR764OOjZV/s=
X-Received: by 2002:a05:6214:482:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f8b2d0d13dmr346107896d6.32.1747777726547;
        Tue, 20 May 2025 14:48:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuvUphlpNVXWMjMR0Rm0/W8jolN5rQHYmWgteLlMDTRklWTSbWCq/+mU2Z1OwSeR6pXhISOg==
X-Received: by 2002:a05:6214:482:b0:6f2:c88a:50c5 with SMTP id 6a1803df08f44-6f8b2d0d13dmr346107576d6.32.1747777726204;
        Tue, 20 May 2025 14:48:46 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f8b096ddb4sm76528256d6.78.2025.05.20.14.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 14:48:45 -0700 (PDT)
Message-ID: <fababe6628c448a4aa96e1ad47ad862eddf90c24.camel@redhat.com>
Subject: Re: [PATCH v4 3/4] x86: nVMX: check vmcs12->guest_ia32_debugctl
 value given by L2
From: mlevitsk@redhat.com
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Sean
 Christopherson <seanjc@google.com>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, Ingo Molnar <mingo@redhat.com>, 
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Paolo
 Bonzini <pbonzini@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>
Date: Tue, 20 May 2025 17:48:44 -0400
In-Reply-To: <d9ea18ac1148c9596755c4df8548cdb8394f2ee0.camel@redhat.com>
References: <20250515005353.952707-1-mlevitsk@redhat.com>
	 <20250515005353.952707-4-mlevitsk@redhat.com> <aCaxlS+juu1Rl7Mv@intel.com>
	 <d9ea18ac1148c9596755c4df8548cdb8394f2ee0.camel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-05-16 at 10:50 -0400, mlevitsk@redhat.com wrote:
> On Fri, 2025-05-16 at 11:31 +0800, Chao Gao wrote:
> > On Wed, May 14, 2025 at 08:53:52PM -0400, Maxim Levitsky wrote:
> > > Check the vmcs12 guest_ia32_debugctl value before loading it, to avoi=
d L2
> > > being able to load arbitrary values to hardware IA32_DEBUGCTL.
> > >=20
> > > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > > ---
> > > arch/x86/kvm/vmx/nested.c | 4 ++++
> > > arch/x86/kvm/vmx/vmx.c=C2=A0=C2=A0=C2=A0 | 2 +-
> > > arch/x86/kvm/vmx/vmx.h=C2=A0=C2=A0=C2=A0 | 2 ++
> > > 3 files changed, 7 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > > index e073e3008b16..0bda6400e30a 100644
> > > --- a/arch/x86/kvm/vmx/nested.c
> > > +++ b/arch/x86/kvm/vmx/nested.c
> > > @@ -3193,6 +3193,10 @@ static int nested_vmx_check_guest_state(struct=
 kvm_vcpu *vcpu,
> > > 	=C2=A0=C2=A0=C2=A0=C2=A0 CC((vmcs12->guest_bndcfgs & MSR_IA32_BNDCFG=
S_RSVD))))
> > > 		return -EINVAL;
> > >=20
> > > +	if ((vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS) &&
> > > +	=C2=A0=C2=A0=C2=A0=C2=A0 CC(vmcs12->guest_ia32_debugctl & ~vmx_get_=
supported_debugctl(vcpu, false)))
> > > +		return -EINVAL;
> > > +
> >=20
> > How about grouping this check with the one against DR7 a few lines abov=
e?
>=20
> Good idea, will do.

Besides the above change, is there anything else to change in this patchset=
?
If not I'll sent a new version soon.

Thanks,
Best regards,
	Maxim Levitsky




> >=20
> > > 	if (nested_check_guest_non_reg_state(vmcs12))
> > > 		return -EINVAL;
> > >=20
> > > diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> > > index 9953de0cb32a..9046ee2e9a04 100644
> > > --- a/arch/x86/kvm/vmx/vmx.c
> > > +++ b/arch/x86/kvm/vmx/vmx.c
> > > @@ -2179,7 +2179,7 @@ static u64 nested_vmx_truncate_sysenter_addr(st=
ruct kvm_vcpu *vcpu,
> > > 	return (unsigned long)data;
> > > }
> > >=20
> > > -static u64 vmx_get_supported_debugctl(struct kvm_vcpu *vcpu, bool ho=
st_initiated)
> > > +u64 vmx_get_supported_debugctl(struct kvm_vcpu *vcpu, bool host_init=
iated)
> > > {
> > > 	u64 debugctl =3D 0;
> > >=20
> > > diff --git a/arch/x86/kvm/vmx/vmx.h b/arch/x86/kvm/vmx/vmx.h
> > > index 6d1e40ecc024..1b80479505d3 100644
> > > --- a/arch/x86/kvm/vmx/vmx.h
> > > +++ b/arch/x86/kvm/vmx/vmx.h
> > > @@ -413,7 +413,9 @@ static inline void vmx_set_intercept_for_msr(stru=
ct kvm_vcpu *vcpu, u32 msr,
> > > 		vmx_disable_intercept_for_msr(vcpu, msr, type);
> > > }
> > >=20
> > > +
> >=20
> > stray newline.
> >=20
> > > void vmx_update_cpu_dirty_logging(struct kvm_vcpu *vcpu);
> > > +u64 vmx_get_supported_debugctl(struct kvm_vcpu *vcpu, bool host_init=
iated);
> > >=20
> > > /*
> > > =C2=A0* Note, early Intel manuals have the write-low and read-high bi=
tmap offsets
> > > --=20
> > > 2.46.0
> > >=20
> > >=20
> >=20
>=20
> Best regards,
> 	Maxim Levitsky

