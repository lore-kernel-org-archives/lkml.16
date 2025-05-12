Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E289C299A98
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:35:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747085705; cv=none; b=f16BcX1yk3+638fprIw56G2fNZKldsgrYF0u3T+IiSduSDnJHr6QMCFvgAgEfQEppyeWCEZbgkBse7ZUCEGm8y13FbKs3lnUSuZnY3tezxqw8JvN2ucmpl1hHkI9yMpzQI7O9mBQAXp44jjJj8kVj9oxO2G5Ugw2JURSbqgbzPs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747085705; c=relaxed/simple;
	bh=F4jUKxmmtFWbb0Phvnt982gTcM98ZUL8jjp2BIVdMn4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a5bcbRDf8fxq9jITo9AApOVQseAzHTdF4xX7R4kw4X7Rz7m+uWOeD6TVpsFCUugCZvXgMIjnCB5WlzHYcMK4RUyVBt02O+5jJ78H56MgrRNEP+MkbogH7CRQnb9gnQrTgNzqXiYYa2ydwPTyFX3WSKoLKNHX1NlHiUQsthXRMuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xVTSTO1u; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xVTSTO1u"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-742360cec7eso3365725b3a.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 14:35:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747085702; x=1747690502; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qBVT+AOygf4X2VMb+/bmTXiVeZNYP5SVSUzgnTYp+ls=;
        b=xVTSTO1u2DZeGuKt4GSupMXvnD2FXdQpQPElY1+Dt+YmRnyHFrslSsV1i3Hlp7pcQc
         ahXpHIMn0l6B/zwEkTbtJ2Z74fYb0up0Ezf06c/ugXgNpJaog/Jt95EWR2eEBEhnE4AN
         DJhUkO0aUK0tAgrDnGVaDrT6VuBh0+3C41qYLVCPi0KUJUIjol+zrEdQgQN1wW7rhnla
         iJ/7dxOtlAMmbRBPiwIiEzlj9YkkBQSD4LNzBTqjgzcaHcp2ae3sYXMDRDYAuBmZpCav
         rofbdNkg8Da2NA5JXxagjQy090q74lFOgnUSzES0v8GjxIVwooOwyUhpY0I8lKJtu1+l
         prOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747085702; x=1747690502;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qBVT+AOygf4X2VMb+/bmTXiVeZNYP5SVSUzgnTYp+ls=;
        b=tR0dISvJBN5dYQKVYBaH446jpFs7nFIWUjBB1KRj4Ghb33DTeyXwO/Kzubcfg+o5VO
         zqixkdJIfIOg8PqylbflmAm9MWiQvTVg4ewexH53RczgFIhhFezrFbX37E2MfqRlqXi2
         zy9nLWwzqd/Q1LmQOACRbsjRLwNagWTwuAc+B5ycy7x2YSsUIdymXMjfiQ1hZq2Mg479
         MQyalMfsVrsp4OKUcc1ZUlqanNGs66kUVX26kRIetR8afyHs251nv5DoTeQqvK0ujkr4
         kh6L3wFr2Or+RftuzmBfhJpId+5EDvJWzC1ktmw1tuPxEmTS12KvfFUgLFDv56wKMnAS
         3yEA==
X-Forwarded-Encrypted: i=1; AJvYcCVYu5WlgbBPilDAXVMgvWLjBAQnnG7T9V8cJObHelbQRz7Q+/EfJLT8WJdbQMU7Bca7riTS4M4/u6hTNpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV3EnXRetIRpHCTzMXg7mr75RSzaVol9VTH+K+Mdeq3eiRSU4z
	tDuKS/C/yo+8V6D/NPYU2SZaaLSVqXwu1nubELazSxdnlITH4gkiB6nBg3G8t1md75xaREGRCz2
	Msg==
X-Google-Smtp-Source: AGHT+IETNOptff3WUn3HPebpVtrn0fYXqa0NJJ/42KObUUcNlvnkufd+zmnkR58KW5wpkU5tztpkleZHP6A=
X-Received: from pgww3.prod.google.com ([2002:a05:6a02:2c83:b0:b1f:dd75:de2a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:cf84:b0:1fe:6bbf:af22
 with SMTP id adf61e73a8af0-215abb4fd86mr19752252637.1.1747085702206; Mon, 12
 May 2025 14:35:02 -0700 (PDT)
Date: Mon, 12 May 2025 14:35:00 -0700
In-Reply-To: <20250313203702.575156-18-jon@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250313203702.575156-1-jon@nutanix.com> <20250313203702.575156-18-jon@nutanix.com>
Message-ID: <aCJphDlQLyWri9kR@google.com>
Subject: Re: [RFC PATCH 17/18] KVM: VMX: Allow MBEC with EVMCS
From: Sean Christopherson <seanjc@google.com>
To: Jon Kohler <jon@nutanix.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vitaly Kuznetsov <vkuznets@redhat.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Mar 13, 2025, Jon Kohler wrote:
> Extend EVMCS1_SUPPORTED_2NDEXEC to understand MBEC enablement,
> otherwise presenting both EVMCS and MBEC at the same time will disable
> MBEC presentation into the guest.

A brief rundown on any relevant history of eVMCS support for MBEC would be
appreciated, if there is any.
 
> Signed-off-by: Jon Kohler <jon@nutanix.com>
> 
> ---
>  arch/x86/kvm/vmx/hyperv.c       | 5 ++++-
>  arch/x86/kvm/vmx/hyperv_evmcs.h | 1 +
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/hyperv.c b/arch/x86/kvm/vmx/hyperv.c
> index fab6a1ad98dc..941a29c9e667 100644
> --- a/arch/x86/kvm/vmx/hyperv.c
> +++ b/arch/x86/kvm/vmx/hyperv.c
> @@ -138,7 +138,10 @@ void nested_evmcs_filter_control_msr(struct kvm_vcpu *vcpu, u32 msr_index, u64 *
>  		ctl_high &= evmcs_get_supported_ctls(EVMCS_EXEC_CTRL);
>  		break;
>  	case MSR_IA32_VMX_PROCBASED_CTLS2:
> -		ctl_high &= evmcs_get_supported_ctls(EVMCS_2NDEXEC);
> +		supported_ctrls = evmcs_get_supported_ctls(EVMCS_2NDEXEC);
> +		if (!vcpu->arch.pt_guest_exec_control)
> +			supported_ctrls &= ~SECONDARY_EXEC_MODE_BASED_EPT_EXEC;

No idea what you're trying to do, but I don't see how this is necessary in any
capacity.

> +		ctl_high &= supported_ctrls;
>  		break;
>  	case MSR_IA32_VMX_TRUE_PINBASED_CTLS:
>  	case MSR_IA32_VMX_PINBASED_CTLS:
> diff --git a/arch/x86/kvm/vmx/hyperv_evmcs.h b/arch/x86/kvm/vmx/hyperv_evmcs.h
> index a543fccfc574..930429f376f9 100644
> --- a/arch/x86/kvm/vmx/hyperv_evmcs.h
> +++ b/arch/x86/kvm/vmx/hyperv_evmcs.h
> @@ -87,6 +87,7 @@
>  	 SECONDARY_EXEC_PT_CONCEAL_VMX |				\
>  	 SECONDARY_EXEC_BUS_LOCK_DETECTION |				\
>  	 SECONDARY_EXEC_NOTIFY_VM_EXITING |				\
> +	 SECONDARY_EXEC_MODE_BASED_EPT_EXEC |				\
>  	 SECONDARY_EXEC_ENCLS_EXITING)
>  
>  #define EVMCS1_SUPPORTED_3RDEXEC (0ULL)
> -- 
> 2.43.0
> 
