Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A8C29B8C3
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 18:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747073708; cv=none; b=l0FzmPSjw0lijmgmqWLpOaLEB+y+p4UWgJdo6T64vR8Lc2AVklyF44v9vGkaQap8wtecdW3P0jDMM9IZKbAGz7dxw8XFYlsgFsyleMR972i7pTI4Aej14pRdIsrdj+5Kf5pMfB4Y/vn8RbvLeVXAfR936TFXfhEEfy4AsaQOb9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747073708; c=relaxed/simple;
	bh=XRgxPrQuWwX712fF2KflNnXoQ502wCaR5BHoTUuXB04=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bzEXF7tR45NDtcT06RbsZp/udNhZrG+6RI/jMXGU6/WCuyvawH7wveK5XxY8H51FHIRkvTaInuSOtmnkw5iHYbVsPaEhMKTd4U4nuo8kh1RYikr0dC9TlAT1tnA1M9ZJt+aoP+zgFwOxk1g3dFaMuaIXgb89mbNMnGdTW4+krLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ug+h8PqF; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ug+h8PqF"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30a59538b17so4582729a91.3
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747073706; x=1747678506; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OawiPZy4beozboh+ADi996BCPJ4CwdxLLRfTTirpfYY=;
        b=ug+h8PqFIOYv+/rpwt+0myhrSFKCuhi5YOUYAIGZOSzdmaKzrg8MmIe8cDEXBxcTea
         eOwjhDae5vTE4LFccjbA4e6foVEUaHXr72EhBIqLTanKanPn+AXl8B7osRwjQhuoXBZb
         TK1ELQe8jMw228FsGuZORMmIQaylSTRcCzHzVuw2yXY3Xg2jjgNtBKDF5uxOGkKmAADk
         vnzJB23Prm0q5jLj/j/S+ekp4m1FKLH8U5LOGJ4Sy8uZ+oGvstxLOy2WLiY+ydnpoHIx
         iMJEUzS/OCvR20fdzks7g5zP98BLxJCDWGeCcih11YTKxo+L7MivgH6MFt44QxLD98DI
         3RMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747073706; x=1747678506;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OawiPZy4beozboh+ADi996BCPJ4CwdxLLRfTTirpfYY=;
        b=aVUevjaP141pCRiHIGnsKYEhw4y39kxSctOPV0d4FY56IjfYXX5lb1B4vZX6Xzv0BD
         aYEtURzhBvddXWPHQVmPqsmkXnmjSTP5LoEs9dpuNDnTfnNKC+aPcsNHrfFmE3dynWIN
         vw18MYSzk3xz6wifEhqmgTTH1ccZhrnVwyt0FVNo2k9F4fDVRyyObVPGitjKEsWiX3nR
         6LMRYX+FoMNzxVfyrfi57Sgh1woeizFi7IN85nmLDlQhDfB8BaeKgYiKqdg62Uux7yBG
         ZvLazYDHbw4dzZbVjefXpGy51RzHfLo2WaBhY7kbFV9djbdzvUG2LwKi+Wj2e7MhJMrL
         rFlg==
X-Forwarded-Encrypted: i=1; AJvYcCWDJP5pZEFUV4XwE5ncpddXrHeBL3T1Wnwxr/V3uGPtWpShaB/2fNJbSQQaqdngd44c7j+0/82JwfsuhOA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxve53wRmLrtklqtDGDQ2jwif++e6JrtzYNXAe/EAxpHcj6ghxg
	mj56gYPPsjwOo4hjv53wQb8hBW5y8s7KZKSv2oa/uKlswzL4OUjd8k3BgaHpkSd5bfemTZ13eZg
	XTA==
X-Google-Smtp-Source: AGHT+IGyau0PoBP95Yo7LfzxSiqa/oArBrnyxawTOxipXchYIU5+/lMqeUCH5/FZBJvvi0+YCIuI2+JTqkk=
X-Received: from pjh4.prod.google.com ([2002:a17:90b:3f84:b0:2ea:aa56:49c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1843:b0:301:9f62:a944
 with SMTP id 98e67ed59e1d1-30c3d64f332mr26562923a91.33.1747073705884; Mon, 12
 May 2025 11:15:05 -0700 (PDT)
Date: Mon, 12 May 2025 11:15:04 -0700
In-Reply-To: <20250313203702.575156-6-jon@nutanix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250313203702.575156-1-jon@nutanix.com> <20250313203702.575156-6-jon@nutanix.com>
Message-ID: <aCI6qMg6OjT-cWzR@google.com>
Subject: Re: [RFC PATCH 05/18] KVM: x86: Add pt_guest_exec_control to kvm_vcpu_arch
From: Sean Christopherson <seanjc@google.com>
To: Jon Kohler <jon@nutanix.com>
Cc: pbonzini@redhat.com, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Thu, Mar 13, 2025, Jon Kohler wrote:
> Add bool for pt_guest_exec_control to kvm_vcpu_arch, to be used for
> runtime checks for Intel Mode Based Execution Control (MBEC) and
> AMD Guest Mode Execute Control (GMET).
> 
> Signed-off-by: Jon Kohler <jon@nutanix.com>
> 
> ---
>  arch/x86/include/asm/kvm_host.h | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index fd37dad38670..192233eb557a 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -856,6 +856,8 @@ struct kvm_vcpu_arch {
>  	struct kvm_hypervisor_cpuid kvm_cpuid;
>  	bool is_amd_compatible;
>  
> +	bool pt_guest_exec_control;

Again, aside from the fast that putting this in kvm_vcpu_arch is wrong, this not
worth of a separate patch.
