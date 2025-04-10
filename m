Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02ED41EBA08
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 21:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744322133; cv=none; b=m8pn0hC8KmRoUUmfq1OoGL0LAOwpvVsGfMhivae82ghGFQ1Y8WiYkHu76/2V4celmtlP98FS5eNlGw21tjbyON3p/8PBVcU13IT8tYz4yDIL3kEudC9u+cOPXxscI30rmeMzpgawGz5QlvoXCfguVC6Bgxzl1lnellX8TSCdiPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744322133; c=relaxed/simple;
	bh=uLY8I6maT4UFagIK/J2FlvS/J47G0EzpLlTuVYY5OgI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=a+wGhJTj/U2ni6DpxkdbqdbupxT8j1X/p02HYvj6gvGv789Fkh+tWFhZ4PGqUAj3gCHmBs4pzvk5NEhvIb0cyQrYPEd5kOjrU8zKSZ3uXNDWtLfL66143lK+q7o76Ypu8Kd71Lmqv6c0pBIF363uekMjNmX2EKXX4UT3suXrLw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BPjoTfO7; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BPjoTfO7"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so1036937a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 14:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744322131; x=1744926931; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eZON/bvRB0xQ4KgArxCWwuHU4L3F2ba+q7zdPf7MR1Q=;
        b=BPjoTfO7E35qUh8HeRI9pTEW8ZVuee+0ckgJo4mp9yvU+GqtJkxjnrfOVyvvQmlJYa
         7TBXU+q7mKRhkS7oOOLkfevRxyG/sFv4PaAWM3fG5wJofFv+K80fgoSejw64+iZu75ws
         1YLoVLOc/ZLt6YoTyQcBZZXJ3L15UlkfEHi3UAnQTh12TbnOr3fp6VD8Z/jFs8lLxUnd
         /51SOX5f3sMLsQ9doKKuVBe8fxFq+1SYl0bUcal8NQjBR+ssDnduOO/1SB1Uje8ym48z
         GViUVTT/cKFHEFix/8IMon+YOYuHQYInhJ9TcUlK3zgpE8ro3L5GhhksiXFHAHMvYdOO
         IAFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744322131; x=1744926931;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eZON/bvRB0xQ4KgArxCWwuHU4L3F2ba+q7zdPf7MR1Q=;
        b=TJKs8LS9dp3OQBYhvbDUbFSWLOLbo4NM0/0o98fEKxzkdsIa15s2CDAfkGhh/cF8Rk
         vGUaGrdfPS4+xX73xnAT7YH/o6Etazt+xx1N7x6Mm4gObLtwzLsW9bDkTth1+McpKNTY
         9MlT9cngLUgWBdx4FNzSY5Rt1Eeyyk9Nj4N0ZJxD5wmRIwlhTDJdXRaP6DvlWGNVNok8
         J86VE/qk6sHuMCsfZio0EkL5uhd8V+8N6tS1X6m7p0crKGQ4BuGvFkM7QaHHfGah3VHU
         URVLvo2jZzwjvTTMW5hSkZSkMmcqmIM/W4PQT6GcZGu+5erooKQNMMzR2bQ7WvSeE6YW
         F9CA==
X-Forwarded-Encrypted: i=1; AJvYcCXW5jDbieqeoXBxP78vw81G4vYfiZKNWPmxnmTvi32GmbxW2W2pAUFb4Azlrg7baNm2uH8klnFRbkXjPiA=@vger.kernel.org
X-Gm-Message-State: AOJu0YznIWi7YJgK5XpGKCqkEZQCcAG9SMCKfc9bX0jUBjMWHb3XeYN5
	nH4itKNlbxZPrD8umQsWqwE2bGqVpr2PLBQHiS/+ONwgFwpRZLiyL1cGVmXsHLSwJdESpS20Kbs
	xJQ==
X-Google-Smtp-Source: AGHT+IHU8WSyAZMOUq/c6p8OxUHkDgUHU7YPx1ujmd9aqmeNLQCG1m/WPyuDQKcHU0YHCc5/ZOioTwIBpwk=
X-Received: from pjbsm14.prod.google.com ([2002:a17:90b:2e4e:b0:2fc:2e92:6cf])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5188:b0:301:98fc:9b51
 with SMTP id 98e67ed59e1d1-3082365a310mr654511a91.5.1744322131215; Thu, 10
 Apr 2025 14:55:31 -0700 (PDT)
Date: Thu, 10 Apr 2025 14:55:29 -0700
In-Reply-To: <20250324140849.2099723-1-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250324140849.2099723-1-chao.gao@intel.com>
Message-ID: <Z_g-UQoZ8fQhVD_2@google.com>
Subject: Re: [PATCH] KVM: VMX: Flush shadow VMCS on emergency reboot
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Mar 24, 2025, Chao Gao wrote:
> Ensure the shadow VMCS cache is evicted during an emergency reboot to
> prevent potential memory corruption if the cache is evicted after reboot.

I don't suppose Intel would want to go on record and state what CPUs would actually
be affected by this bug.  My understanding is that Intel has never shipped a CPU
that caches shadow VMCS state.

On a very related topic, doesn't SPR+ now flush the VMCS caches on VMXOFF?  If
that's going to be the architectural behavior going forward, will that behavior
be enumerated to software?  Regardless of whether there's software enumeration,
I would like to have the emergency disable path depend on that behavior.  In part
to gain confidence that SEAM VMCSes won't screw over kdump, but also in light of
this bug.

If all past CPUs never cache shadow VMCS state, and all future CPUs flush the
caches on VMXOFF, then this is a glorified NOP, and thus probably shouldn't be
tagged for stable.

> This issue was identified through code inspection, as __loaded_vmcs_clear()
> flushes both the normal VMCS and the shadow VMCS.
> 
> Avoid checking the "launched" state during an emergency reboot, unlike the
> behavior in __loaded_vmcs_clear(). This is important because reboot NMIs
> can interfere with operations like copy_shadow_to_vmcs12(), where shadow
> VMCSes are loaded directly using VMPTRLD. In such cases, if NMIs occur
> right after the VMCS load, the shadow VMCSes will be active but the
> "launched" state may not be set.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
>  arch/x86/kvm/vmx/vmx.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index b70ed72c1783..dccd1c9939b8 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -769,8 +769,11 @@ void vmx_emergency_disable_virtualization_cpu(void)
>  		return;
>  
>  	list_for_each_entry(v, &per_cpu(loaded_vmcss_on_cpu, cpu),
> -			    loaded_vmcss_on_cpu_link)
> +			    loaded_vmcss_on_cpu_link) {
>  		vmcs_clear(v->vmcs);
> +		if (v->shadow_vmcs)
> +			vmcs_clear(v->shadow_vmcs);
> +	}
>  
>  	kvm_cpu_vmxoff();
>  }
> -- 
> 2.46.1
> 
