Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 506CC24E018
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711112; cv=none; b=X/IbkZ+gOPhxyLoIAMqUbjVvsiTWKi3097c09tRKo9FgK9Up8LHD4d3ubp0sR2X+m/+uhEEWq66j5gB+Cwmgm2vaq+LtYrlUxcOugfohReWVqaRjdZp0V0lMyAsQnxigRoElLljUNK7k1r8weAJPUUove2c/UPaSkxehEGZrTu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711112; c=relaxed/simple;
	bh=ttNlm+gSJEcJOq5rABNpckTqxwtMmPs7GEXQ+yUg8PI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=ApYe7+jsWwgkLBPbLthfIDDDV0J57jSyE+iEQgj+RQIATGFSn354TqH105QjhO7cPQfORWRtOuYXzInRjBHejQkUDuF91gkBjzPybkLuMZXJ65LRBfKTW3vikNrD/Y7+TLvaibx4UM7TgmgKPYSm/E6SGELttiRmrxX1GxkcFik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UxtNE7js; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UxtNE7js"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743711110;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2JjK2lSJyzrBkcD3tmnBpQOWlUj6xEy7/a1BNny+0HM=;
	b=UxtNE7js3Cdp7RVD2dRpavI+IHHi/sNHBj6PcT4xSXzHNDzu1Fd/guCR7QQuPZQf3KEP/X
	Lct/hgLG5joUTazxFT2jQkJUevQuhKJfLKrfIrjL9s6CjxoT5pIlVRTF+XYO2ZaGAtpQ8A
	rZoTKVc4hiBgHcA4lBwOJYU7MJvlCe8=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-635-z_NwjL8EPBeSgDnKYm4UUA-1; Thu, 03 Apr 2025 16:11:49 -0400
X-MC-Unique: z_NwjL8EPBeSgDnKYm4UUA-1
X-Mimecast-MFC-AGG-ID: z_NwjL8EPBeSgDnKYm4UUA_1743711109
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5c9abdbd3so132517085a.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711109; x=1744315909;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2JjK2lSJyzrBkcD3tmnBpQOWlUj6xEy7/a1BNny+0HM=;
        b=L1iGAE/mgPQcXwJJHUMGDNWWnP8XxhOeqmamCBoOulwEZpJRQFyDAMlEU5dIDsdxUD
         8gPYjRdWwxyX2+SPSoS5EAHigwaoom0CjiTvgUFYGoqTyIXdaz108yeCijy8KdYejKBg
         bdlYiApJwCSctJ83gawbc6C5+7RQ+QZQNm4Wr1GdMUgGJSvvEGTtNTH0f7dUc/mb+w3V
         Nq+F2MJntxcaIqhhF7qKZkAoR3FSRzhAg9EZCBaGVQ+/dric+EBrQWBc2UkAnwalERyV
         1ZL4QS/Qv/4/UUu4Cx2u5oZCLrmnHscomXofQYKKnyCJr7rN07Hu0sKPQUGhe8uwRMn9
         SQ8A==
X-Forwarded-Encrypted: i=1; AJvYcCX1u/pXAXbbHpVVyU+BzC5PlGYG+yMelXxKm7ywLMuzvARNmsdqMkJkYX6ZS5TVy+OLAxJUa8uMC8/5JKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxohnyl9OwnLTAbJ6cK6vBLXIiOBRdSjtyOEEMly7H6a1AV8CuT
	J8nOQWIGaja3B+RC0FYTpwQB00MBN8Mft9dNe3eMdCs4C2q4wS1lRSUQgvsEpnpboIkHhsU9J3a
	7SPtARN0mTDi+/EVN1CwzcQ41Qrq+kLdinTeFFAKKvc0Uq7FryrtlEaUl5hblqA==
X-Gm-Gg: ASbGncvpeJJZt5rQoJ7xWsOnK8aYp+KyvihEWVcfP5VnQsIK5w506i1Pk0+SUo7zLke
	JOe3l15LJTIGjqVQlama3usZOhhIM1RGlIbSoV10vFjMFk7udIslc06vb4EpdiC3QUbbt7BVU9t
	swjXAuudwj3vSPMi2mPHHUAjWU2ftlDTivdgjo8yQbNNUAZC3i79qn5ykXgVrMgRHmBwa0rsjRC
	JXP2czVzhKofjMkexDiYxoXuLQfW0Qu/DnJrIesi0q/0AAOGtb2Fjan42xbLjrQYcdf3JKk4gJO
	HDOpwF9HEZOWTF4=
X-Received: by 2002:a05:620a:f0e:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c7758951ecmr22338685a.0.1743711108703;
        Thu, 03 Apr 2025 13:11:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGKPkIPW1VJjqFtzQQY4BZDQKcp6b4iFxg0ZhjtfUFoqySucUdGhdETv+oO5Xe6MjAlU7r0vA==
X-Received: by 2002:a05:620a:f0e:b0:7c5:a435:8c98 with SMTP id af79cd13be357-7c7758951ecmr22335585a.0.1743711108355;
        Thu, 03 Apr 2025 13:11:48 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b07125asm11785871cf.20.2025.04.03.13.11.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:11:48 -0700 (PDT)
Message-ID: <5f714d7fb68aef92f1bea58a10deb4de1a10a5b8.camel@redhat.com>
Subject: Re: [RFC PATCH 23/24] KVM: nSVM: Allocate a new ASID for nested
 guests
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:11:47 -0400
In-Reply-To: <20250326194423.3717668-4-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326194423.3717668-1-yosry.ahmed@linux.dev>
	 <20250326194423.3717668-4-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2025-03-26 at 19:44 +0000, Yosry Ahmed wrote:
> Now that nested TLB flushes are properly tracked, start allocating a
> separate ASID for nested guests. This allows dropping the unconditional
> TLB flushes on nested transitions and doing finer grained TLB flushing
> when necessary.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/nested.c | 11 +++++++++--
>  arch/x86/kvm/svm/svm.c    |  5 +++--
>  arch/x86/kvm/svm/svm.h    |  3 +++
>  3 files changed, 15 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
> index 544913461693c..0c887c91bd50d 100644
> --- a/arch/x86/kvm/svm/nested.c
> +++ b/arch/x86/kvm/svm/nested.c
> @@ -1204,6 +1204,7 @@ int svm_allocate_nested(struct vcpu_svm *svm)
>  {
>  	struct kvm_svm *kvm_svm = to_kvm_svm(svm->vcpu.kvm);
>  	struct page *vmcb02_page;
> +	unsigned int asid;
>  
>  	if (svm->nested.initialized)
>  		return 0;
> @@ -1221,8 +1222,14 @@ int svm_allocate_nested(struct vcpu_svm *svm)
>  
>  	svm->nested.initialized = true;
>  
> -	if (!kvm_svm->nested_asid)
> -		kvm_svm->nested_asid = kvm_svm->asid;
> +	if (!kvm_svm->nested_asid) {
> +		asid = kvm_tlb_tags_alloc(&svm_asids);
> +		if (asid && !svm_register_asid(asid)) {
> +			kvm_tlb_tags_free(&svm_asids, asid);
> +			asid = 0;
> +		}
> +		kvm_svm->nested_asid = asid ?: fallback_asid;
> +	}

Nitpick: AFAIK at least nested KVM doesn't enable EFER.SVME,
unless it actually runs a guest thus most of the time we will waste a ASID on a VM
which once did run a VM nested and since then doesn't run anything else.

So maybe we want to free the nested ASID in the svm_free_nested?

>  
>  	return 0;
>  
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 4b95fd6b501e6..196f5bca57a0e 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -249,8 +249,8 @@ static unsigned long iopm_base;
>  
>  DEFINE_PER_CPU(struct svm_cpu_data, svm_data);
>  
> -static struct kvm_tlb_tags svm_asids;
> -static unsigned int fallback_asid;
> +struct kvm_tlb_tags svm_asids;
> +unsigned int fallback_asid;
>  
>  /*
>   * Only MSR_TSC_AUX is switched via the user return hook.  EFER is switched via
> @@ -5127,6 +5127,7 @@ static void svm_vm_destroy(struct kvm *kvm)
>  	avic_vm_destroy(kvm);
>  	sev_vm_destroy(kvm);
>  	kvm_tlb_tags_free(&svm_asids, kvm_svm->asid);
> +	kvm_tlb_tags_free(&svm_asids, kvm_svm->nested_asid);
>  }
>  
>  static int svm_vm_init(struct kvm *kvm)
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index 0c44133bc05ca..220d10d2b1a5c 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -630,6 +630,9 @@ static inline void svm_vmgexit_no_action(struct vcpu_svm *svm, u64 data)
>  
>  extern bool dump_invalid_vmcb;
>  
> +extern struct kvm_tlb_tags svm_asids;
> +extern unsigned int fallback_asid;
> +
>  u32 svm_msrpm_offset(u32 msr);
>  u32 *svm_vcpu_alloc_msrpm(void);
>  void svm_vcpu_init_msrpm(struct kvm_vcpu *vcpu, u32 *msrpm);


Best regards,
	Maxim Levitsky



