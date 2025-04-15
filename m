Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2DB733991
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744679152; cv=none; b=gEe10XJh7ZdzahwT4PD3CpkQQypeDbNm9NV0D6x8J/KsWneG6OzbVXiEpQe2r6L4/fcZQsomFNftqEIEgJLGpAD90vtK++xjVtPISoyekfXjx/GGKLekXN/PVkWYFV8kZI9SOmScGanrZU1UzKOkQulsOQHOOSPDDJ+Sx2quhaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744679152; c=relaxed/simple;
	bh=kmQ6eBY4CNUxjNfOexNgsrdDcNzfRZcNC8pQ2YAlb2w=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bYgrYAaLQKPlYWV0w7mLWK8IpJBQaKxuV2VmLH1Lt83cdFOE4N9+LD0auPYuiEq2QbpUQv8ZmF2jktFbNeloCJ1+F0+TCAWDyAt7kCOa0d4q+Bk8V9RD6STUtCZVOMlRyTHeSznW3EG00s5vDCM4cD3n/JxhNbilUitYPYnCmv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QUJr4LSG; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QUJr4LSG"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22406ee0243so36828975ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 18:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744679150; x=1745283950; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tE1adoT0PMRc2ZI2MNLpe+tvwhjFP5aL0rCGtHCJJ4w=;
        b=QUJr4LSGk10u+0oDlGbHHJyX4pZWGohqi7sxarvh7/EqZQIzgBMEDYMxQX0M9HnFwe
         5eE017nQn01wJKEmjeTB6wlfZAoNhTgfoRzqZpG+a6ysfkjCR2DaO/O+lmDh+dPhoB5f
         7SFxcGCTzOma89h5PgrDnMZyC1zPFBSqXXP60u+X0nDSjF5Frmfm+EJFQHk+JGWMPiHs
         ACZSMgWP/Rpq7lXf/XOlBd4bAfGSOQZPsCQe/qTM711O/rEqAPudhhtTcMx2GYomI5bz
         DK81VuZxklBthmHFQLC255ZXDnW9Mc3DQOySomCOGlKRhs+i4oh3HLk7GJIBVgZqCK2O
         4tVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744679150; x=1745283950;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tE1adoT0PMRc2ZI2MNLpe+tvwhjFP5aL0rCGtHCJJ4w=;
        b=oOwLTAqJ5DVKA953JCjEHCoJ/fIJhQfZj+Iss9dNCgzxXp20U/wBhuWCZVfmwHr1/E
         NxYt46HGRN4oN+hIthdQ5Dkt5xBKv9AhxGr3aYp81edQx3ytpO9XpWxjjTpd4FXd2QiG
         O5Vi0S2xkV8eiQKaPlN91NkkiNuVg+sgYCiyyYyZOAF0+drnfz2XWi7TQdTi7KPrJWj7
         2APfBufCybyqC3OOzkkklU07EI0glXtaoImp/lug7+o9KfMGAvOirEm712qhm2mLq5Rs
         Qy/ybwqnPzk4FVexw8TD+6t8S4TyNj1H7at7y1/vPT6cifd6wjLJdUSguERSLLt7Mc3w
         29Ug==
X-Forwarded-Encrypted: i=1; AJvYcCWiSCkJLYZKQUx3JomYvhPqTE5c2TOq+RUz6MomMVmyil+oygHr45UgQsaZLi43RVHNMPmAFqMLSKWs0uk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaCnjqe3i1v8GHQ8oxgWJprEmUODM5VdZpBTAfTdx7UqPm5HDI
	oTLQIBSuJiG/7V9aUX8ZKAR5+FyV3iSwkGaXo+Bm8eMi3VKWkELBdololhpRy2wGlnSrydqCTQV
	aqQ==
X-Google-Smtp-Source: AGHT+IFbFP3u+rs3c8JoY3Z9h6FkMSEmt0p/0gguW8s8qvS+PwTJMpqhnW2RNbzoz4XXWA0j7ScY9/Ze8c8=
X-Received: from plrb10.prod.google.com ([2002:a17:902:a9ca:b0:223:f7e6:116d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:cec4:b0:224:e33:889b
 with SMTP id d9443c01a7336-22bea4ade03mr221654375ad.12.1744679150211; Mon, 14
 Apr 2025 18:05:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 18:05:49 -0700
In-Reply-To: <20250414081131.97374-2-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414081131.97374-1-ubizjak@gmail.com> <20250414081131.97374-2-ubizjak@gmail.com>
Message-ID: <Z_2w7XJ0LI65qo0i@google.com>
Subject: Re: [PATCH 2/2] KVM: VMX: Use LEAVE in vmx_do_interrupt_irqoff()
From: Sean Christopherson <seanjc@google.com>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: kvm@vger.kernel.org, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="us-ascii"

On Mon, Apr 14, 2025, Uros Bizjak wrote:
> Micro-optimize vmx_do_interrupt_irqoff() by substituting
> MOV %RBP,%RSP; POP %RBP instruction sequence with equivalent
> LEAVE instruction. GCC compiler does this by default for
> a generic tuning and for all modern processors:

Out of curisoity, is LEAVE actually a performance win, or is the benefit essentially
just the few code bytes saves?

> DEF_TUNE (X86_TUNE_USE_LEAVE, "use_leave",
> 	  m_386 | m_CORE_ALL | m_K6_GEODE | m_AMD_MULTIPLE | m_ZHAOXIN
> 	  | m_TREMONT | m_CORE_HYBRID | m_CORE_ATOM | m_GENERIC)
> 
> The new code also saves a couple of bytes, from:
> 
>   27:	48 89 ec             	mov    %rbp,%rsp
>   2a:	5d                   	pop    %rbp
> 
> to:
> 
>   27:	c9                   	leave
> 
> No functional change intended.
> 
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Sean Christopherson <seanjc@google.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
> Cc: Thomas Gleixner <tglx@linutronix.de>
> Cc: Ingo Molnar <mingo@kernel.org>
> Cc: Borislav Petkov <bp@alien8.de>
> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> Cc: "H. Peter Anvin" <hpa@zytor.com>
> ---
>  arch/x86/kvm/vmx/vmenter.S | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/arch/x86/kvm/vmx/vmenter.S b/arch/x86/kvm/vmx/vmenter.S
> index f6986dee6f8c..0a6cf5bff2aa 100644
> --- a/arch/x86/kvm/vmx/vmenter.S
> +++ b/arch/x86/kvm/vmx/vmenter.S
> @@ -59,8 +59,7 @@
>  	 * without the explicit restore, thinks the stack is getting walloped.
>  	 * Using an unwind hint is problematic due to x86-64's dynamic alignment.
>  	 */
> -	mov %_ASM_BP, %_ASM_SP
> -	pop %_ASM_BP
> +	leave
>  	RET
>  .endm
>  
> -- 
> 2.49.0
> 
