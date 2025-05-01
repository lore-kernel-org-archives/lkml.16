Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2AE22253FB
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 20:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746131713; cv=none; b=s0KRFKov6qmPDr6UHabU/5R3UTSe2NL1iWaEl0XAdGpL0V8D6yrCMtLdTHI/bznpqKUn6EqYTPfJM0u7azyyQuLQS685Kq7MYc8GMmh5VGZ7q9byYMqQ93EgDLptWdTsOlhPHOkZ2l8EBY595xVHMDA6w/zsVVG5J2SjMJoTX8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746131713; c=relaxed/simple;
	bh=744IgpeZI8AQ86NxfJtwPzupuE+/l+50aWVDFLPfm1s=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AjVAS7d03Ka3uphoIhH2lKuT/oNkeQL3BZTyouMaAalj/SB6xvXL4Ue8OBM7zqWh4hSr5jGbLMbry8AJYSPxuhDH7j1+ULoyRWulNChoFLJbCiiAoK3jZPURzRm/kYug9dnM4+IT8GtbmALyo+U6i4/OtblP78rjGTZncrrHY3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OZMWryCR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OZMWryCR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746131710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hdVWSIZLz1k/wCeHJMz+JEKUkQKBnamYo2OoM4WNzZo=;
	b=OZMWryCRuyQz1nw2G9ZDUvABjXBUMvlBDij1l93ODS2rxA0l+VsCKk4DQRfMgu3P3dCYvX
	AbRTySdq7v9empn0Uu4iVpfLCh+caHnCwC+EDIzAOWk7gAMonLyEFSZNfBeco7ZfUAIb18
	OlWg1r7wRgBUBF3ociNN4+xv9AvX6fE=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-475-4HzENHE1MWGalgcG8lwwCw-1; Thu, 01 May 2025 16:35:09 -0400
X-MC-Unique: 4HzENHE1MWGalgcG8lwwCw-1
X-Mimecast-MFC-AGG-ID: 4HzENHE1MWGalgcG8lwwCw_1746131709
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f0e2d30ab4so28417586d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 13:35:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746131709; x=1746736509;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hdVWSIZLz1k/wCeHJMz+JEKUkQKBnamYo2OoM4WNzZo=;
        b=h3WALQ/c6mlYtPtoEkJZkRaHQ+GuDubJFgpCIh8Y5Zy1aWSDEij4sE5H3FmBYuxRRp
         ycCsTPsGtn0vKXJOs0E9EJNlU5pflfqeEqXiIAvHQkygcR5ELLNt2FNZ1WeZJwgJgg6D
         HrJvW6pXuz2QLxybrU159o1QCngFTrf5FwyQiA6LbJiTKE3mUVhukBAE6OfYLzkxF0JQ
         ohoPoTNWRPQipwLYqj/EMxbq0d4ZDvGIWL0XmiCkLGANFQy+fUVkhdSR7hJ3FrdNL/2X
         mtEotw7pEUY7OS24ekYfG+fS1A8rdgsb3bv81zKWz2iClrRdFO0Svign9ZRvlLE3K49K
         J5zA==
X-Forwarded-Encrypted: i=1; AJvYcCXf6YxrL5DVGkk7Dtacn7ZIKEF4XK6oViyNITJuJyLgaVX51qPzVEv0/AsiF2yw6fGXgtjpFUGEJuMHCoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXu7OjIw9lmLD/g/rRkhOy9vDwp+fzqr0htxeYzhfh6uxVlrpE
	AIpuQ5LwVU9wgNFG2OejzK+CzBghVltLh4oPfTg5T4NF2a3XyLXE5n4qA+86eqOwoFgJs7doFq8
	JwdBzravB4Pj9DSeuGhkHQMLKOfOBmVamjT5UQcTDUzGg5ve/B48leQ0RzcjbHQ==
X-Gm-Gg: ASbGnctzDwRGr3UAg8w9PUKOENjfTOU+CUQDfKFWNarbnR2UFb8Wjb0PEfXPaMNXMbn
	NZdV7c2O3cNQ12rLwzt18VHUITzgWWNT1gePlwUusk7FzyRCTSzjBYj55QfPbKI8PejC3uxw3Fl
	ZEYXbRehW8JC+qXa3LSaQIatOX/e5ooaVEybNQvVbFnESA8/OMn99PvvDkp1s6tzRdAxc/nalxc
	Mc2MCsBFRqfnG/EbRjkyLUjC1ZsLswy0obsSeHa4s37eTopnv6be9ghd3GwOZ2Wq/Talfz2X3HU
	w/xLeC5uzH3WE6dlhqzN7XxpxB3NBulN98Wfbj0XiQmb3THr+8FJp0sL9CA=
X-Received: by 2002:a05:6214:124d:b0:6f2:b14e:46e6 with SMTP id 6a1803df08f44-6f51526d362mr11171326d6.17.1746131709090;
        Thu, 01 May 2025 13:35:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGb8Nz4DcL3Cu1Ltf4oqxo2dugA5EurJTjUsbVrmXo5j90y4igGFrBf/DqJmp7vnSttsl2I0A==
X-Received: by 2002:a05:6214:124d:b0:6f2:b14e:46e6 with SMTP id 6a1803df08f44-6f51526d362mr11170946d6.17.1746131708713;
        Thu, 01 May 2025 13:35:08 -0700 (PDT)
Received: from ?IPv6:2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38? ([2607:fea8:fc01:8d8d:5c3d:ce6:f389:cd38])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3b05a3sm8993096d6.22.2025.05.01.13.35.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 13:35:08 -0700 (PDT)
Message-ID: <14eab14d368e68cb9c94c655349f94f44a9a15b4.camel@redhat.com>
Subject: Re: [PATCH 1/3] x86: KVM: VMX: Wrap GUEST_IA32_DEBUGCTL read/write
 with access functions
From: mlevitsk@redhat.com
To: Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Borislav
 Petkov <bp@alien8.de>, Paolo Bonzini <pbonzini@redhat.com>, x86@kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, Ingo Molnar <mingo@redhat.com>, 
 linux-kernel@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>
Date: Thu, 01 May 2025 16:35:07 -0400
In-Reply-To: <aAgnRx2aMbNKOlXY@google.com>
References: <20250416002546.3300893-1-mlevitsk@redhat.com>
	 <20250416002546.3300893-2-mlevitsk@redhat.com>
	 <aAgnRx2aMbNKOlXY@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2025-04-22 at 16:33 -0700, Sean Christopherson wrote:
> On Tue, Apr 15, 2025, Maxim Levitsky wrote:
> > Instead of reading and writing GUEST_IA32_DEBUGCTL vmcs field directly,
> > wrap the logic with get/set functions.
>=20
> Why?  I know why the "set" helper is being added, but it needs to called =
out.
>=20
> Please omit the getter entirely, it does nothing more than obfuscate a ve=
ry
> simple line of code.

In this patch yes. But in the next patch I switch to reading from 'vmx->msr=
_ia32_debugctl'
You want me to open code this access? I don't mind, if you insist.

>=20
> > Also move the checks that the guest's supplied value is valid to the ne=
w
> > 'set' function.
>=20
> Please do this in a separate patch.  There's no need to mix refactoring a=
nd
> functional changes.

I thought that it was natural to do this in a the same patch. In this patch=
 I introduce
a 'vmx_set_guest_debugctl' which should be used any time we set the msr giv=
en
the guest value, and VM entry is one of these cases.

I can split this if you want.

>=20
> > In particular, the above change fixes a minor security issue in which L=
1
>=20
> Bug, yes.  Not sure it constitutes a meaningful security issue though.

I also think so, but I wanted to mention this just in case.

>=20
> > hypervisor could set the GUEST_IA32_DEBUGCTL, and eventually the host's
> > MSR_IA32_DEBUGCTL
>=20
> No, the lack of a consistency check allows the guest to set the MSR in ha=
rdware,
> but that is not the host's value.

That's what I meant - the guest can set the real hardware MSR. Yes, after t=
he
guest exits, the OS value is restored. I'll rephrase this in v2.

>=20
> > to any value by performing a VM entry to L2 with VM_ENTRY_LOAD_DEBUG_CO=
NTROLS
> > set.
>=20
> Any *legal* value.  Setting completely unsupported bits will result in VM=
-Enter
> failing with a consistency check VM-Exit.

True.

>=20
> > Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
> > ---
> >  arch/x86/kvm/vmx/nested.c    | 15 +++++++---
> >  arch/x86/kvm/vmx/pmu_intel.c |  9 +++---
> >  arch/x86/kvm/vmx/vmx.c       | 58 +++++++++++++++++++++++-------------
> >  arch/x86/kvm/vmx/vmx.h       |  3 ++
> >  4 files changed, 57 insertions(+), 28 deletions(-)
> >=20
> > diff --git a/arch/x86/kvm/vmx/nested.c b/arch/x86/kvm/vmx/nested.c
> > index e073e3008b16..b7686569ee09 100644
> > --- a/arch/x86/kvm/vmx/nested.c
> > +++ b/arch/x86/kvm/vmx/nested.c
> > @@ -2641,6 +2641,7 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu, =
struct vmcs12 *vmcs12,
> >  	struct vcpu_vmx *vmx =3D to_vmx(vcpu);
> >  	struct hv_enlightened_vmcs *evmcs =3D nested_vmx_evmcs(vmx);
> >  	bool load_guest_pdptrs_vmcs12 =3D false;
> > +	u64 new_debugctl;
> > =20
> >  	if (vmx->nested.dirty_vmcs12 || nested_vmx_is_evmptr12_valid(vmx)) {
> >  		prepare_vmcs02_rare(vmx, vmcs12);
> > @@ -2653,11 +2654,17 @@ static int prepare_vmcs02(struct kvm_vcpu *vcpu=
, struct vmcs12 *vmcs12,
> >  	if (vmx->nested.nested_run_pending &&
> >  	    (vmcs12->vm_entry_controls & VM_ENTRY_LOAD_DEBUG_CONTROLS)) {
> >  		kvm_set_dr(vcpu, 7, vmcs12->guest_dr7);
> > -		vmcs_write64(GUEST_IA32_DEBUGCTL, vmcs12->guest_ia32_debugctl);
> > +		new_debugctl =3D vmcs12->guest_ia32_debugctl;
> >  	} else {
> >  		kvm_set_dr(vcpu, 7, vcpu->arch.dr7);
> > -		vmcs_write64(GUEST_IA32_DEBUGCTL, vmx->nested.pre_vmenter_debugctl);
> > +		new_debugctl =3D vmx->nested.pre_vmenter_debugctl;
> >  	}
> > +
> > +	if (CC(!vmx_set_guest_debugctl(vcpu, new_debugctl, false))) {
>=20
> The consistency check belongs in nested_vmx_check_guest_state(), only nee=
ds to
> check the VM_ENTRY_LOAD_DEBUG_CONTROLS case, and should be posted as a se=
parate
> patch.

I can move it there. Can you explain why though you want this? Is it becaus=
e of the
order of checks specified in the PRM?

Currently GUEST_IA32_DEBUGCTL of the host is *written* in prepare_vmcs02.=
=C2=A0
Should I also move this write to nested_vmx_check_guest_state?

Or should I write the value blindly in prepare_vmcs02 and then check the va=
lue
of 'vmx->msr_ia32_debugctl' in nested_vmx_check_guest_state and fail if the=
 value
contains reserved bits?=C2=A0
I don't like that idea that much IMHO.


>=20
> > +		*entry_failure_code =3D ENTRY_FAIL_DEFAULT;
> > +		return -EINVAL;
> > +	}
> > +
> > +static void __vmx_set_guest_debugctl(struct kvm_vcpu *vcpu, u64 data)
> > +{
> > +	vmcs_write64(GUEST_IA32_DEBUGCTL, data);
> > +}
> > +
> > +bool vmx_set_guest_debugctl(struct kvm_vcpu *vcpu, u64 data, bool host=
_initiated)
> > +{
> > +	u64 invalid =3D data & ~vmx_get_supported_debugctl(vcpu, host_initiat=
ed);
> > +
> > +	if (invalid & (DEBUGCTLMSR_BTF|DEBUGCTLMSR_LBR)) {
> > +		kvm_pr_unimpl_wrmsr(vcpu, MSR_IA32_DEBUGCTLMSR, data);
> > +		data &=3D ~(DEBUGCTLMSR_BTF|DEBUGCTLMSR_LBR);
> > +		invalid &=3D ~(DEBUGCTLMSR_BTF|DEBUGCTLMSR_LBR);
> > +	}
> > +
> > +	if (invalid)
> > +		return false;
> > +
> > +	if (is_guest_mode(vcpu) && (get_vmcs12(vcpu)->vm_exit_controls &
> > +					VM_EXIT_SAVE_DEBUG_CONTROLS))
> > +		get_vmcs12(vcpu)->guest_ia32_debugctl =3D data;
> > +
> > +	if (intel_pmu_lbr_is_enabled(vcpu) && !to_vmx(vcpu)->lbr_desc.event &=
&
> > +	    (data & DEBUGCTLMSR_LBR))
> > +		intel_pmu_create_guest_lbr_event(vcpu);
> > +
> > +	__vmx_set_guest_debugctl(vcpu, data);
> > +	return true;
>=20
> Return 0/-errno, not true/false.

There are plenty of functions in this file and KVM that return boolean.

e.g:=C2=A0

static bool nested_vmx_check_eptp(struct kvm_vcpu *vcpu, u64 new_eptp)
static inline bool vmx_control_verify(u32 control, u32 low, u32 high)
static bool nested_evmcs_handle_vmclear(struct kvm_vcpu *vcpu, gpa_t vmptr)

static inline bool nested_vmx_prepare_msr_bitmap(struct kvm_vcpu *vcpu,
						=C2=A0struct vmcs12 *vmcs12)


static bool nested_vmx_check_eptp(struct kvm_vcpu *vcpu, u64 new_eptp)
static bool nested_get_vmcs12_pages(struct kvm_vcpu *vcpu)

...


I personally think that functions that emulate hardware should return boole=
an values
or some hardware specific status code (e.g VMX failure code) because the re=
al hardware
never returns -EINVAL and such.


Best regards,
	Maxim Levitsky




>=20

