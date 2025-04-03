Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 715B525DB06
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743711034; cv=none; b=aKxkTK6B8GSAkPaGS5MGQTddOnbKlVdwmOQwMEc+tm4VjsISmmFGU3n4CrefMkFWpVIEV3Fts7YolOsF4KCiJgDbMrimc0sYrDARg4nuXWqtAxz7S9L70/w0DWOFykY8uuN9kOMVUmK88Pps3f86Un7ah/pbgqjOxHZPq/J0UqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743711034; c=relaxed/simple;
	bh=D26HNSNydq0vhTezmBXrbOpJ4YYH6UhhcDMgeoQd/tE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=U54DHXuHvL60e6IXq5NrdQwpOeS7GvNaOwXbwug4okVky0QgESp1WTcoAT/RD/6OohNvPqmPyi0OPshDy45YT3DPK4VBmw4Mv6XcOJF7W91PvpNnE6Ow+Fanw0fWqB7ols+gVWM1/35pYCfwDKtWM+prwNKEFXum2LbSYVJcpXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AX0ffJ/g; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AX0ffJ/g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743711028;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=s5hUYLT5Mkdx8Zf+eFJbT1CNzreTFwCPqVChesRtvo8=;
	b=AX0ffJ/gQDja6anDlRiXgkLEdIGpt0k7nXSG81cvAzw98As/vKYEEBV3+rGwMbw3FNa0/j
	l7jrrqGtSO5ajLRV8Z07z3dhpYbNzTLcvQ8+lVsTtCzD5m9Q8DvrWPZeYTjydbGO/gnhs1
	oVM3MmQBGKgp81nVDpbb8GVQ4u5HFws=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-37-5Xx-gy9fNtW7OGnW0MlKDw-1; Thu, 03 Apr 2025 16:10:26 -0400
X-MC-Unique: 5Xx-gy9fNtW7OGnW0MlKDw-1
X-Mimecast-MFC-AGG-ID: 5Xx-gy9fNtW7OGnW0MlKDw_1743711025
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-4768f9fea35so30312871cf.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:10:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743711025; x=1744315825;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s5hUYLT5Mkdx8Zf+eFJbT1CNzreTFwCPqVChesRtvo8=;
        b=qbvvm+aShF3UkVeBQJ2XqeMzUfmfPHlUsL7lnbbmOJaYtWRtqvp9zBZNLr4R2vGUK2
         KOToz+akC9vHzJzK5um3+LQ4b461lYrBSgJ8YxTRBQ1iOH5Wl/va4286svADv3FUboPO
         Oj31ePsQi0zpshF+UDnHUpxlyVuUIY2k+YbZ1YnkbmHG4uCGeOJhKlrdDzR61iktYoVO
         YC5XwgzZ1ja6uUf//R+9Lvo3hYfWOgfPtbyFBjyU/8UE5IWYd4qGxJhoK3TCBt95hFkh
         7Y/UzoityyHyu4GYm4AZb+MVgpxRrkv3pwS49Zt5DnJgK1+vILIrBnODbhMxm3isiL1s
         P3Kg==
X-Forwarded-Encrypted: i=1; AJvYcCWotS5W6oSX2j1d4t5FBfMWnNIYwbYKcP+gPUbk9m5x7PXC0hEqdopaZbfNQJbXKZ24/b1BvjE1gAMNs1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNaAciYbHXpDcyGpOWBKYddXWfVakWAhE5Yp2iuF4oiVCLn93q
	MxUVqWTO8MC7WUm0j+haxCrgRHTOinQSBJ0hRUZ6vuKH8hHHl/tiu7H2VYSHkblsPoqZqaqAQ+/
	L54CjhCF8CElxYb1CIRQm+jb473W8m49XTWRKy2N0spA1A17+BP4PTaBhl/k32w==
X-Gm-Gg: ASbGncuMxlElx/PcWDluIWYw+GfBm3590f67rW6N6jZ+TLzp0RGcCP7xaBOS4anKCuj
	PcDXTTBm+dSh5rEPmw2cQ5SpwwtCrQHtcgZRPR/wjYxVM6ZINrfIcGIaHeorEE2mVmDyJLkTyXQ
	hXkehIcDZwFajlU87RTWYX1dmIf2cv7D7UQdYvYHvwr3E8vXzB0H7KKAs7F1l2zXJ1QQ50VznNm
	wo4HTueBuxL50liebvFlX6wuxKIE9L6UVrvhdNkAdk4bEP+ANnArCD1HJ4sX+mDHfmVeOa6qBcC
	E1+caJKHjVjmpbE=
X-Received: by 2002:a05:622a:191e:b0:476:95dd:521c with SMTP id d75a77b69052e-479249d5bf8mr10465941cf.45.1743711025463;
        Thu, 03 Apr 2025 13:10:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzJVWMoaVpWh2K232paPphG0v1QG/Q2e884aySDX7gMKjgXUK3/eB6I/ba2r9ahGTGP6zSsA==
X-Received: by 2002:a05:622a:191e:b0:476:95dd:521c with SMTP id d75a77b69052e-479249d5bf8mr10465651cf.45.1743711025204;
        Thu, 03 Apr 2025 13:10:25 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4791b121970sm11540121cf.50.2025.04.03.13.10.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:10:24 -0700 (PDT)
Message-ID: <032981892a2ed9ff596ded9b5945342894fdb9ba.camel@redhat.com>
Subject: Re: [RFC PATCH 16/24] KVM: x86/mmu: Allow skipping the gva flush in
 kvm_mmu_invalidate_addr()
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:10:23 -0400
In-Reply-To: <20250326193619.3714986-17-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-17-yosry.ahmed@linux.dev>
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
> Refactor a helper out of kvm_mmu_invalidate_addr() that allows skipping
> the gva flush. This will be used when an invalidation is needed but the
> GVA TLB translations that require invalidation are not of the current
> context (e.g. when emulating INVLPGA for L1 to flush L2's translations).
> 
> No functional change intended.
> 
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/mmu/mmu.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> index 4a72ada0a7585..e2b1994f12753 100644
> --- a/arch/x86/kvm/mmu/mmu.c
> +++ b/arch/x86/kvm/mmu/mmu.c
> @@ -6355,15 +6355,15 @@ static void kvm_mmu_invalidate_addr_in_root(struct kvm_vcpu *vcpu,
>  	write_unlock(&vcpu->kvm->mmu_lock);
>  }
>  
> -void kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> -			     u64 addr, unsigned long roots)
> +static void __kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> +				      u64 addr, unsigned long roots, bool gva_flush)
>  {
>  	int i;
>  
>  	WARN_ON_ONCE(roots & ~KVM_MMU_ROOTS_ALL);
>  
>  	/* It's actually a GPA for vcpu->arch.guest_mmu.  */
> -	if (mmu != &vcpu->arch.guest_mmu) {
> +	if (gva_flush && mmu != &vcpu->arch.guest_mmu) {
>  		/* INVLPG on a non-canonical address is a NOP according to the SDM.  */
>  		if (is_noncanonical_invlpg_address(addr, vcpu))
>  			return;
> @@ -6382,6 +6382,12 @@ void kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
>  			kvm_mmu_invalidate_addr_in_root(vcpu, mmu, addr, mmu->prev_roots[i].hpa);
>  	}
>  }
> +
> +void kvm_mmu_invalidate_addr(struct kvm_vcpu *vcpu, struct kvm_mmu *mmu,
> +			     u64 addr, unsigned long roots)
> +{
> +	__kvm_mmu_invalidate_addr(vcpu, mmu, addr, roots, true);
> +}
>  EXPORT_SYMBOL_GPL(kvm_mmu_invalidate_addr);
>  
>  void kvm_mmu_invlpg(struct kvm_vcpu *vcpu, gva_t gva)

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



