Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7942550B0
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711023; cv=none; b=dfK74Sgi56xT+2fbNO1AeWmmOH4Upp3rM0NSspWUfC7zeyQBvWNGZh5ac4BLnjMVtCGlUvvHv6dMcf5pg1v3HhrDwFVTWCblYZitzs76MIFiOx9hfQz3v3UuXQSJMBmo+q4eAZp1g4tFpLDeBu0Vpwe5Lkx8Wmut3y+uOx1qORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711023; c=relaxed/simple;
	bh=ARHuqMUFBa6EBIqx3FjwFk0m9wzztwUMkSlCIakG680=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KAEO9qFl/8eV7sgnU8oVdxpJUP76rH2p3xtLgPcbxjXGgTy5swz04yG65DjWk36juNzXBY2/bvl55y2KpqHQ2Rev6eHbLJ7HKb+MsMgJB8sPDeRfptlxy+aArtU+KkbYViRM+eY003PuEkTZeuhFTEE+eoniHOI+9Up4nqnNybA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UHVTOpGg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UHVTOpGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743711020;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0BwHIPwV3rI7qIkcJhhOaSvRbMhK1Ui6OQS4Co5poDA=;
	b=UHVTOpGg46R9zSYveCVLLD8H09N2mJadmQRtu4bylrDwPqxKsD8cbzdprDsJM9d2hb7HML
	cnemuLwcKapNYflNNoUVppcIFktgUriEr9z0vH8kk35FCR2SzndvyCjidreI8+n3gL7xr1
	kqQEH930qx/h8eUzhVRYFdGRQw+YqXM=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-88-RxenNWU1Naayb0eEAmuXrg-1; Thu, 03 Apr 2025 16:10:18 -0400
X-MC-Unique: RxenNWU1Naayb0eEAmuXrg-1
X-Mimecast-MFC-AGG-ID: RxenNWU1Naayb0eEAmuXrg_1743711017
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6e90788e2a7so22685146d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711017; x=1744315817;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0BwHIPwV3rI7qIkcJhhOaSvRbMhK1Ui6OQS4Co5poDA=;
        b=SI3p+AbLF7hRmmU0ydbYXXriWJ03bDq/8sc1YfmVYkErQEjLU/gXUdiFxSa9MhNnzC
         t+qnDmA0Tcp3Z7/zz2GxAyKIx8z8XWlajqrO4fvNx/c/wH5a+VSBIH1H6qvfD1sUZQuc
         snkr0b2/XvrkZ+L3UKDGGrb1+eUbVqVrAcV6hM8utICZJzIilHfPtmgV9ofj2ZxgNm5w
         oL9ZSlRvPHcZshDaAffZmLS+TiVBqn8t+CU5hjmG/GHPn+ePPG2Z7Lp86ojrxyHuZB1O
         j9N3WFhoiOUOFic8B4A7r3t0ElUcaGsHrBum7tePUnxwhnMn/ImdHQ3pXa2IATzG9TS4
         HKzA==
X-Forwarded-Encrypted: i=1; AJvYcCXETDByeztz9iZOPgJibOHSeembVwkFzoxT2gEqyiS8V9k5jKDEbj7JgReg3ioPSz7lKo/kvktOp9rvFjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1VoakDXBeiOkTEhWRfWV2M3ASeEPZARkEs/oWzdLtIybwPLCE
	4CZooFqSRd/saLZJCvPCXmaprmHoKQLP/j5ox+czGEVqZuehSRJ+m/GPudb46HZXrDAsGMGojCZ
	vjGpCuc1qBpWzqqbgJH5UE+QdX7J7T/ht+UXV2ZqcVIj7ow46NIprq7B/ZxXQog==
X-Gm-Gg: ASbGncuxgtagynxKvaBy5Y/UtOs0rULu1/JdGJkDJYSspUzy81u0P3jXc75wavFox0s
	Cj9tzZMyIVTEg5ZdqOTbvHfDM/26bp+pGmW/Ypkq6zw3BFxGNPU0Iq/KXsOrzn92gw+NNZt8Zvz
	Jsskam7k25Ldl4DV1YkfRZ9ap8P41v20xNtRjIl9UL30IwYky0El4SU3/aoIeD3PjkV8yBgogxw
	tGdkaSm7/WXwntQDiX4fMQfrxBQBxt/jrMnPMVwVFy5pnruRPEEVfJidNsdc987MCd0mZQI5IHb
	GyX54xBXJMeKdN0=
X-Received: by 2002:ad4:5d63:0:b0:6e4:5317:64a0 with SMTP id 6a1803df08f44-6ef0bec79a6mr76325136d6.13.1743711017644;
        Thu, 03 Apr 2025 13:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/Z3nXXtzkhi6L9ZJ/I+L1ALXbuENimr3h0WF6vMnmAXGGpI7ggBqt/YYh2/kFXiLPUaBJ0Q==
X-Received: by 2002:ad4:5d63:0:b0:6e4:5317:64a0 with SMTP id 6a1803df08f44-6ef0bec79a6mr76324756d6.13.1743711017338;
        Thu, 03 Apr 2025 13:10:17 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f1393dcsm11339676d6.78.2025.04.03.13.10.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:10:17 -0700 (PDT)
Message-ID: <616df4f9191cb59af8776775ad2577e412c5f71d.camel@redhat.com>
Subject: Re: [RFC PATCH 15/24] KVM: x86/mmu: rename
 __kvm_mmu_invalidate_addr()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:10:16 -0400
In-Reply-To: <20250326193619.3714986-16-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-16-yosry.ahmed@linux.dev>
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
> In preparation for creating another helper for
> kvm_mmu_invalidate_addr(), rename __kvm_mmu_invalidate_addr() to
> kvm_mmu_invalidate_addr_in_root().
> 
> No functional change intended.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/mmu/mmu.c | 9 +++++----
>  1 file changed, 5 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 63bb77ee1bb16..4a72ada0a7585 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6317,8 +6317,9 @@ void kvm_mmu_print_sptes(struct kvm_vcpu *vcpu, gpa_t gpa, const char *msg)
>  }
>  EXPORT_SYMBOL_GPL(kvm_mmu_print_sptes);
>  
> -static void __kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> -				      u64 addr, hpa_t root_hpa)
> +static void kvm_mmu_invalidate_addr_in_root(struct kvm_vcpu *vcpu,
> +					    struct kvm_mmu *mmu,
> +					    u64 addr, hpa_t root_hpa)
>  {
>  	struct kvm_shadow_walk_iterator iterator;
>  
> @@ -6374,11 +6375,11 @@ void kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
>  		return;
>  
>  	if (roots & KVM_MMU_ROOT_CURRENT)
> -		__kvm_mmu_invalidate_addr(vcpu, mmu, addr, mmu->root.hpa);
> +		kvm_mmu_invalidate_addr_in_root(vcpu, mmu, addr, mmu->root.hpa);
>  
>  	for (i = 0; i < KVM_MMU_NUM_PREV_ROOTS; i++) {
>  		if (roots & KVM_MMU_ROOT_PREVIOUS(i))
> -			__kvm_mmu_invalidate_addr(vcpu, mmu, addr, mmu->prev_roots[i].hpa);
> +			kvm_mmu_invalidate_addr_in_root(vcpu, mmu, addr, mmu->prev_roots[i].hpa);
>  	}
>  }
>  EXPORT_SYMBOL_GPL(kvm_mmu_invalidate_addr);

Reviewed-by: Maxim Levitsky<mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



