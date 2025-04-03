Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60BB825D548
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710987; cv=none; b=bpYxUw+OrOTSH/HfBMTYprnA4IDTvffnVZd6aYE6wy+y6ceLZB0+jIBniyhi8W6mcC9klTq9T0Zis/4/z+PKP+S+Kq0CNylEFroL2GBHXdekk+LkvUCK9DF/KsID044SXZkwTyy6DUd4d1kzn/c3TcAtckbo9YmFoN8PyNh2rkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710987; c=relaxed/simple;
	bh=KuAuPC2Kc5A2gf9Br08oeF8OB+Zc9OXztUj1fYLftnc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V+vPR4n5gUnpYj/FUcbY7TQ1T2x8D6cCEx3Jz7Pq+AycdVilo+43JkOylXPFJfb9v8HJwY04M5adhiObKdoQIQonzVrdX+oGq+dhM0DwegoLgrkBvnYZFkfrGp8i1YZ9tW6+Eb1zXPkuMOk+dzOvzxJ7MLSdL76tMrUvsQEw5Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CohNH8fu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CohNH8fu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o38mcyc5s3JRsdW3YB6YPHjbQdyEBV4D3I4i1S6k6to=;
	b=CohNH8fuakVW+EbFrBHvo1DCFS1RFLgyrHYzbK+Oy/45gI1N0bCkwD18gmQgLVxux0XFn+
	E33eMwLh/kvoYi+BwVU3J1cdSewYLEwApNY4C+3pqAWpd1R18yf+ogbaI/tOhVWIu2+TFx
	cfFJ1XpnMyJ0m0EtjlTNSb9HGSsm4Yw=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-80N5zEqgO6Ok8rT9EmY5fA-1; Thu, 03 Apr 2025 16:09:42 -0400
X-MC-Unique: 80N5zEqgO6Ok8rT9EmY5fA-1
X-Mimecast-MFC-AGG-ID: 80N5zEqgO6Ok8rT9EmY5fA_1743710982
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c572339444so198811385a.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:09:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710982; x=1744315782;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o38mcyc5s3JRsdW3YB6YPHjbQdyEBV4D3I4i1S6k6to=;
        b=J4Xb66vJ975Fe7DfnGxVo0sXfWlWREHDPGqzUeTGwUARMJvkw7XiZSyw/dyOn9z4do
         Gb1dR5eRaKmCPvNuGTvCNr3uhZa0y+d7DXR/Rr6cVMpaV41ksDlM2hm03bmrkgRMnZxh
         zusAZtGjOVg42G1sRaisZNwS5zFY+/kmko6lFSOU/OYDytfB9SwWKTZiCgpGNCgdsCSy
         3ynKBBL2o/JKfPCJduJa4IrCjt9M43RQw0s9Iy+jb/EUiIUhOryyFkyJ1fqgBNyPAqLd
         ky1QwK0pJ1wfEJeU/tj+Vo/IcqHlS3ywAqtFeNn9RxEJPd+rJE0njCCpTnSHeqSP2o32
         nkLA==
X-Forwarded-Encrypted: i=1; AJvYcCVuoGiju0vny0vBGWnU+ThKkjAnWmBDSyOwdshef/kedOtnRboBngZ6gZylqJgKfLVZMuphSsIahyIoExw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzaZof9xII3YzBMOo+QlkaehJdOKLwGJaspPAcchLniLI+m/HHz
	qovdJilgOKKSABI6rXzHkoJggB1lWbZ4ZRS4PlJXp0nhGQk7QbUUxzTbJbyLu1T3qsmxzSRSsyZ
	IPbhfqsQVjEXyQeExMPt5NPY+IaeryYnPXrSA2cmqi0UcZ8kqG7cLnYs7LXB87A==
X-Gm-Gg: ASbGncvBlnWqzkqSk/50K1z/jlM+pjud4Ac//MZDBUrEW9kj4s/iHT9CPj7C0XC0z4j
	owvPbaGPyrCoF0YxFjccyvKqbKI/6qUMFpRGzKac2XqYeSPwVWx3BVNp1HiKI9ehXzcDFV7PBwK
	REXchJg23KDsmja0bO+vgJauXdD03d0Gh5Sz14FjCVZuDBaJVhiHLivHZzgaFzMMVCRb5IAKqPd
	onhENOlbU2JQRY0k5LWFXjdr9rMl8Dnt8LrfEXxuwHwMyb7t86Df2Nev3XkdTD/Yav+c6RA72+h
	Pq0CB+T3ZqB4/DY=
X-Received: by 2002:a05:620a:4625:b0:7c5:4eee:53f8 with SMTP id af79cd13be357-7c774dad123mr90918785a.41.1743710981896;
        Thu, 03 Apr 2025 13:09:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGp7BcesIEd44ayqQbs+gVIFhGnWkPjIAyem/IbMBRBP4H6O6igve2fPOHCQZcgJGBgM1OgHw==
X-Received: by 2002:a05:620a:4625:b0:7c5:4eee:53f8 with SMTP id af79cd13be357-7c774dad123mr90915085a.41.1743710981558;
        Thu, 03 Apr 2025 13:09:41 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c76e96cf0esm116192785a.53.2025.04.03.13.09.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:09:41 -0700 (PDT)
Message-ID: <e255fa3ee192b136eeef7e9a63e8d1506d5e85a8.camel@redhat.com>
Subject: Re: [RFC PATCH 12/24] KVM: x86: hyper-v: Pass is_guest_mode to
 kvm_hv_vcpu_purge_flush_tlb()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:09:40 -0400
In-Reply-To: <20250326193619.3714986-13-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-13-yosry.ahmed@linux.dev>
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
> Instead of calling is_guest_mode() inside kvm_hv_vcpu_purge_flush_tlb()
> pass the value from the caller. Future changes will pass different
> values than is_guest_mode(vcpu).
> 
> No functional change intended.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/hyperv.h  | 8 +++++---
>  arch/x86/kvm/svm/svm.c | 2 +-
>  arch/x86/kvm/x86.c     | 2 +-
>  3 files changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/hyperv.h b/arch/x86/kvm/hyperv.h
> index 913bfc96959cb..be715deaeb003 100644
> --- a/arch/x86/kvm/hyperv.h
> +++ b/arch/x86/kvm/hyperv.h
> @@ -203,14 +203,15 @@ static inline struct kvm_vcpu_hv_tlb_flush_fifo *kvm_hv_get_tlb_flush_fifo(struc
>  	return &hv_vcpu->tlb_flush_fifo[i];
>  }
>  
> -static inline void kvm_hv_vcpu_purge_flush_tlb(struct kvm_vcpu *vcpu)
> +static inline void kvm_hv_vcpu_purge_flush_tlb(struct kvm_vcpu *vcpu,
> +					       bool is_guest_mode)
>  {
>  	struct kvm_vcpu_hv_tlb_flush_fifo *tlb_flush_fifo;
>  
>  	if (!to_hv_vcpu(vcpu) || !kvm_check_request(KVM_REQ_HV_TLB_FLUSH, vcpu))
>  		return;
>  
> -	tlb_flush_fifo = kvm_hv_get_tlb_flush_fifo(vcpu, is_guest_mode(vcpu));
> +	tlb_flush_fifo = kvm_hv_get_tlb_flush_fifo(vcpu, is_guest_mode);
>  
>  	kfifo_reset_out(&tlb_flush_fifo->entries);
>  }
> @@ -285,7 +286,8 @@ static inline int kvm_hv_hypercall(struct kvm_vcpu *vcpu)
>  {
>  	return HV_STATUS_ACCESS_DENIED;
>  }
> -static inline void kvm_hv_vcpu_purge_flush_tlb(struct kvm_vcpu *vcpu) {}
> +static inline void kvm_hv_vcpu_purge_flush_tlb(struct kvm_vcpu *vcpu,
> +					       bool is_guest_mode) {}
>  static inline bool kvm_hv_synic_has_vector(struct kvm_vcpu *vcpu, int vector)
>  {
>  	return false;
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index e664d8428c792..865c5ce4fa473 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4025,7 +4025,7 @@ static void svm_flush_tlb_asid(struct kvm_vcpu *vcpu)
>  	 * A TLB flush for the current ASID flushes both "host" and "guest" TLB
>  	 * entries, and thus is a superset of Hyper-V's fine grained flushing.
>  	 */
> -	kvm_hv_vcpu_purge_flush_tlb(vcpu);
> +	kvm_hv_vcpu_purge_flush_tlb(vcpu, is_guest_mode(vcpu));
>  
>  	/*
>  	 * Flush only the current ASID even if the TLB flush was invoked via
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 182f18ebc62f3..469a8e5526902 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -3615,7 +3615,7 @@ static void kvm_vcpu_flush_tlb_guest(struct kvm_vcpu *vcpu)
>  	 * Flushing all "guest" TLB is always a superset of Hyper-V's fine
>  	 * grained flushing.
>  	 */
> -	kvm_hv_vcpu_purge_flush_tlb(vcpu);
> +	kvm_hv_vcpu_purge_flush_tlb(vcpu, is_guest_mode(vcpu));
>  }
>  
>  

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



