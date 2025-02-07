Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79C923ED69
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 15:22:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738941776; cv=none; b=lXzFskM6LEycjzsVJPfQiumRFY3KLufwfHRJBZBMZIBEMPffr1ST6qKMAN1gvmiBwu8d9nuF5uSludcg/InFbEhB4vHewtSN+ZVFzEaFFXzesGMqo1Vm7mdznTi4OPJOmS8HQ7h4PI/BkcRxAaf7XfHKg/66eCHUOEI6Ih+S1iE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738941776; c=relaxed/simple;
	bh=kcqXU0L80fJwg+01toXpktwYGd4IF+d2ulZzU+doSZc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=rjamQlCJh33cYUIYPKhHOHHawzA75DSCbmp3r4A/Qd87Ap12Px/lr/1FDr9w0cAm+Zj6zn8AT5A89okc339QoaV3ykroIePidnZQms/0Vgr0P4ytBMByCep7/5VXNlNu6JjcQ9h5TErTMIEtNknp42LTcXUfh8xtfHZtTY/lH5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Xliyxyo+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Xliyxyo+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2f83e54432dso7115258a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 07:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738941774; x=1739546574; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kySEHqcfMZJGhyvftSCQ9iS/BRr0aycsLdTwptb27hg=;
        b=Xliyxyo+WQKQ5TsP9skoZzTXrzYvw1tMbyle8W1Ifb6XImmS7vvCGG0YsNaSYglc+v
         +pe/S9+EtzkMaT2CqXBAPqMV/UhtzZOlocDe38+SL1UQW5I7dIKlLmy2QMs28VN2Eudg
         XygfmfdXCqfbfgW+KPjmVoXN12/y6rytx8ZtqM5fikyZ6NlvcVji2AOE049RRHuEtXB8
         V3owWKEN36VbsoH1c5DJ3+yiLNWJOCL+YkuNRDkNdG4McPJpZWeo4PAPRJjxkuMi1UFx
         mMopv13w/Mq0EQrs+g8PK8FsPQFl3F6dbfyN2P9xIPEXmuMLaJucxMiy9KA7q80FfJNv
         AFRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738941774; x=1739546574;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kySEHqcfMZJGhyvftSCQ9iS/BRr0aycsLdTwptb27hg=;
        b=sUkId2PH/SdFHJPS1ggf+fCSjA86PuUJ9kHomqmnW1nFfbynSR5SlbKGgQal/ugm1W
         dv2rckofNfJulPQDODqaMAjJYpKfUYhTYbI5WceFJRGVGOcRtTO9cyYHdVnV3ulwGbGz
         1jEHPJZ/RcO+U/QHNn0TiGW991riPe22eeDcnOsOLqAB5/5ku/U0NB5lPESOhqNaUYtO
         eTto1619r9A2fIrCaeYORzqzYu4fcwh/MdKhsQ6dMU+Bq8VvES16Bfi63xiTdVkBCixF
         9bHoq17ufgePkI3rQ2xb2E3doD9RFkuPhVzpvq99N8M8e0e2qhQ0SDCnOhPho+P4j3sm
         +Iqw==
X-Forwarded-Encrypted: i=1; AJvYcCUvBHX3aq68O0/mNbrLQzzg6SVmPYZP7DJrpWIJQfHmI+QMZTW70lW64HUD8Huehvu/j3QAVFiWSfNZflc=@vger.kernel.org
X-Gm-Message-State: AOJu0YydFHD5z4SCXFFwEmihrbE5Ge4yvD66eBElnYlW1onJwYkex3HJ
	sFNT6hpUrw9qJ6ea/b0cVSpxORG8zW/hkIgyOkuhf+k/cdbXALGjf4nmZ2QRxMAlKYbxMjxYuNb
	MBg==
X-Google-Smtp-Source: AGHT+IEU6jz6jlB8RaafTWWusxmACRAVwVTNLzOLEl4OKUDHMmuGMK2BqeIFN1+9CKAxpxYyavZXdA2p0Xg=
X-Received: from pjbsc1.prod.google.com ([2002:a17:90b:5101:b0:2f9:d9fe:e723])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:19c3:b0:2ea:5054:6c49
 with SMTP id 98e67ed59e1d1-2fa22b95ba5mr6440969a91.0.1738941774000; Fri, 07
 Feb 2025 07:22:54 -0800 (PST)
Date: Fri, 7 Feb 2025 07:22:52 -0800
In-Reply-To: <20250206222714.1079059-2-vannapurve@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206222714.1079059-1-vannapurve@google.com> <20250206222714.1079059-2-vannapurve@google.com>
Message-ID: <Z6YlTG3QV_Pv6nRo@google.com>
Subject: Re: [PATCH V3 2/2] x86/tdx: Emit warning if IRQs are enabled during
 HLT #VE handling
From: Sean Christopherson <seanjc@google.com>
To: Vishal Annapurve <vannapurve@google.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, pbonzini@redhat.com, 
	erdemaktas@google.com, ackerleytng@google.com, jxgao@google.com, 
	sagis@google.com, oupton@google.com, pgonda@google.com, kirill@shutemov.name, 
	dave.hansen@linux.intel.com, linux-coco@lists.linux.dev, 
	chao.p.peng@linux.intel.com, isaku.yamahata@gmail.com, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 06, 2025, Vishal Annapurve wrote:
> Direct HLT instruction execution causes #VEs for TDX VMs which is routed
> to hypervisor via TDCALL. safe_halt() routines execute HLT in STI-shadow
> so IRQs need to remain disabled until the TDCALL to ensure that pending
> IRQs are correctly treated as wake events.
> 
> Emit warning and fail emulation if IRQs are enabled during HLT #VE handling
> to avoid running into scenarios where IRQ wake events are lost resulting in
> indefinite HLT execution times.
> 
> Reviewed-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>@linux.intel.com>
> Signed-off-by: Vishal Annapurve <vannapurve@google.com>
> ---
>  arch/x86/coco/tdx/tdx.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
> index 5e68758666a4..ed6738ea225c 100644
> --- a/arch/x86/coco/tdx/tdx.c
> +++ b/arch/x86/coco/tdx/tdx.c
> @@ -393,6 +393,11 @@ static int handle_halt(struct ve_info *ve)
>  {
>  	const bool irq_disabled = irqs_disabled();
>  
> +	if (!irq_disabled) {

Wrap the check with WARN_ONCE(), doing so adds an unlikely to the <drum roll>
unlikely scenario.

> +		WARN_ONCE(1, "HLT instruction emulation unsafe with irqs enabled\n");

Newline is redundant, the WARN does that for you.  IMO, it's also worth adding
a comment, because this is like the fifth time "safe halt" has come up in the
context of TDX.

E.g.

	/*
	 * HLT with IRQs enabled is unsafe, as an IRQ that is intended to be a
	 * wake event may be consumed before requesting HLT emulation, leaving
	 * the vCPU blocking indefinitely.
	 */
	if (WARN_ONCE(!irq_disabled, "HLT emulation with IRQs enabled"))
		return -EIO;
