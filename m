Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C81025DB1B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711039; cv=none; b=bjyga1McB06J1FP3lAq5f5YutW41zy/YmEv0zz7Zh5dHn+ZByPOjezGfWAap04TCt2yckBej28jmRbfd2rc1cK03PVBmm0KgUGgZ99mWn5rpcaPS15CBs78zZmN+pYY1pzMENIXdzshUUS+fmaccD41cC7gPYj4+woZXcwBvcQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711039; c=relaxed/simple;
	bh=lKwS24qlMJz7qt2FuBC0A07MddXWYIbdcvU5/ac6Y0g=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=pJ1OPOhpPzYj16uUc0JIj2qj4UucJ2qBhrgAitlZNyrvF3ejInnPpEVHv2oBcOOOl+t0obrT6sQiOQajPPg6MJEaUT0c9S80RBbutgXJ/ereHkX8TIeos7WkGQFL5KLyDip6U5midoyH7OZG2JsfChzz8WV+zn3rmXTlHSV0ruo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EQrH+J3b; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EQrH+J3b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743711036;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NQfRBMmfXvl2EtXcu+A1ryta0Jtqgfvr8XjFX8n/Bo4=;
	b=EQrH+J3bdl/qWrJ9TsexMdzKmJ+DWE5bEX+ZKd0CmfmFrIi8Oc7VmBLvF5uC1j2LTntoMM
	310TPkTnXDUogHbNMQNfjQIra4aLLZt1UfihopIdBGzv+j07qEtmcg3lmqauLUTMj8yPfm
	RvZcFbkfOJUdUJtZkSsc7pr+P7ax1KE=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-616-WxvZAqfNMyW5UjirLjeSvQ-1; Thu, 03 Apr 2025 16:10:35 -0400
X-MC-Unique: WxvZAqfNMyW5UjirLjeSvQ-1
X-Mimecast-MFC-AGG-ID: WxvZAqfNMyW5UjirLjeSvQ_1743711035
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-4770cbdb9c7so30636841cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:10:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711034; x=1744315834;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NQfRBMmfXvl2EtXcu+A1ryta0Jtqgfvr8XjFX8n/Bo4=;
        b=HyqajYKymKxlDR44kaP+srTsXZk1SCDvmWQVdqxzWr5arv+/uHRqZXloGWyS5eO5g7
         Ud1f6t9WRCfey6mfO3zo72WR+YzfigilqMgiP/2cssDwCtz74FtNxPbeqyHuKZEyO3tT
         l5/qn5fAtM02dloZrlvkWnl2bwSQvY/ZjGSwlUJo/PWqe87Q1QPBx72FV08jB6+cNJt8
         fdD7XAIczqCV6IeydjkPL8Dozpd5gT+JySkumV82CbTuvYT6Wg5ISLlJ+PnSTocz8dRC
         Wl7898r0ZTnOi6AdPYAHDJbsylLb9lkfiPQ6Q0dnqjqbwyBd4Yw93PM3V6l8fV3rt+df
         22Tw==
X-Forwarded-Encrypted: i=1; AJvYcCXV3+ylmqHZXZsHpur9U+v0yz8r4qamcdsTv7bnrb1C1V7yCDCHgeT48VqASMHYunjn4wQvsw6w7aEdOxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YylpJAsVZ7gMte28cC+rZJIcn5lu1YcVR84pzO2aCo4/asWI790
	rcIlzws32DmRAywoiXcpK6YqM33GL//I3Vl4lZtJeD1zgGN5aZL15EXyIB/TmxN3NKW/4gsrzPo
	wojRc2wmiFa9DZYdjLyCGjsK/SqCpf2oawziDk0VOI9hlBJ9p/y7lUvv6w1stTgxvyZGTAQ==
X-Gm-Gg: ASbGncvDWbeti+W/advaPZmbxKBK4cOf1C4nx5N3oGZFRlGx9bX04IsaSiFCHvbbC+L
	x5yEvlKjX1cyJamP2pzqzjU7xj+4lyz7y6zFx1OF1YpG5GBEosOjpEiQNhqHzgZCOT+I8dALlZx
	ftqGJCvBsdjAQMGKwgKorKtQYirlI7Ul2pM3He+xw8RtLiKX1IcFykkzh4lqOZrrczjX7riMOO8
	9QmkScbhpIGqN9ITjqGTbGE0sn0+PkIfw8m8edV19beLZ6DZpQNk0ukxIpSrxDHkGOdGjLAtEgW
	sO+HfaOFHOihO0o=
X-Received: by 2002:ac8:5889:0:b0:476:7d74:dd06 with SMTP id d75a77b69052e-479249db1bfmr10412461cf.51.1743711034348;
        Thu, 03 Apr 2025 13:10:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEiUEiCUHJTJfibAxa5AGVMBjsOkQnjxbSJU3EuUsbs9Vq7cDKMyvdSvO0TjSiHxiVONUSxyA==
X-Received: by 2002:ac8:5889:0:b0:476:7d74:dd06 with SMTP id d75a77b69052e-479249db1bfmr10412131cf.51.1743711034055;
        Thu, 03 Apr 2025 13:10:34 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b05895dsm11593541cf.11.2025.04.03.13.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:10:33 -0700 (PDT)
Message-ID: <a377b99b3bc3f6417d098d50351915ddb410fb55.camel@redhat.com>
Subject: Re: [RFC PATCH 17/24] KVM: nSVM: Flush both L1 and L2 ASIDs on
 KVM_REQ_TLB_FLUSH
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:10:32 -0400
In-Reply-To: <20250326193619.3714986-18-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-18-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2025-03-26 at 19:36 +0000, Yosry Ahmed wrote:
> KVM_REQ_TLB_FLUSH is used to flush all TLB entries for all contexts
> (e.g. in kvm_flush_remote_tlbs()). Flush both L1 and L2 ASIDs in
> svm_flush_tlb_all() to handle it appropriately.
> 
> This is currently not required as nested transitions do unconditional
> TLB flushes, but this is a step toward eliminating that.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/nested.c |  1 -
>  arch/x86/kvm/svm/svm.c    | 10 ++--------
>  2 files changed, 2 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index c336ab63c6da3..56a4ff480bb3d 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -491,7 +491,6 @@ static void nested_svm_entry_tlb_flush(struct kvm_vcpu *vcpu)
>  	 * TODO: optimize unconditional TLB flush/MMU sync.  A partial list of
>  	 * things to fix before this can be conditional:
>  	 *
> -	 *  - Flush TLBs for both L1 and L2 remote TLB flush
>  	 *  - Honor L1's request to flush an ASID on nested VMRUN
>  	 *  - Sync nested NPT MMU on VMRUN that flushes L2's ASID[*]
>  	 *  - Don't crush a pending TLB flush in vmcb02 on nested VMRUN
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index fb6b9f88a1504..4cad1085936bb 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4064,14 +4064,8 @@ static void svm_flush_tlb_all(struct kvm_vcpu *vcpu)
>  	if (WARN_ON_ONCE(svm_hv_is_enlightened_tlb_enabled(vcpu)))
>  		hv_flush_remote_tlbs(vcpu->kvm);
>  
> -	/*
> -	 * Flush only the current ASID even if the TLB flush was invoked via
> -	 * kvm_flush_remote_tlbs().  Although flushing remote TLBs requires all
> -	 * ASIDs to be flushed, KVM uses a single ASID for L1 and L2, and
> -	 * unconditionally does a TLB flush on both nested VM-Enter and nested
> -	 * VM-Exit (via kvm_mmu_reset_context()).
> -	 */
> -	svm_flush_tlb_asid(vcpu, is_guest_mode(vcpu));
> +	svm_flush_tlb_asid(vcpu, false);
> +	svm_flush_tlb_asid(vcpu, true);
>  }
>  
>  static void svm_flush_tlb_gva(struct kvm_vcpu *vcpu, gva_t gva)

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



