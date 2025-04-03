Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E779256C96
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 20:00:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743710456; cv=none; b=miA6fZ15U7TtqRvazzuppw17FFzEXksXEgkIpJJ+2GeMqD3dHUuvf6oNE8HRscQA6cl6fX5g8T3yGW0Q4kN4cw1OF1+vhSb0h+nKKhCIXEACoYGDRH9H58JmnmI1SCZZFd5yftKNESkwB7YBAsYIhuNCkObVMM4sfOGjrni3eOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743710456; c=relaxed/simple;
	bh=ryx0wKASwy0uhjPxQ442PdmmlD6H1YH4TXONa9Q+FyE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PslXRq05Q45MgpcmJuB7Hg0V3UYKrmi+z6m9L4tIksWxWv4xI2XH+VFGtj2v9gUaZm+zGR6OqJ+DN7LyHwGBQtPNjAvO4rSD2wbnzZzwIfZDD7TNyd3JVHfxZ5AajAI7nJbCTqd7SZ4Ll7r8RiUk0j8kSMm6DPYg1A6hDjyyX+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O0yOTGgO; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O0yOTGgO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743710453;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GLNI9VGp1Wm5rLYd57L0Xp4ipMewoWDjGcDvpy893AU=;
	b=O0yOTGgO+I742WZpx3pzHgX7yKQzPN1W+ddvhuMEGuA0JTFsL1M26jyZwyd5HtHIcDjvU2
	tzyeKCGPZh1TeHwqSB+6At+BBvXl/vpWLAmU6FkiB/u8/e9SRFfSXOHtFvUiFL7hkIBaku
	kk6elqJy7h64RGv1ADdWS3CTYp3rZy8=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325--Wz2Nj4cNjGTtqflAYt3gg-1; Thu, 03 Apr 2025 16:00:50 -0400
X-MC-Unique: -Wz2Nj4cNjGTtqflAYt3gg-1
X-Mimecast-MFC-AGG-ID: -Wz2Nj4cNjGTtqflAYt3gg_1743710450
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e8fae3e448so26878776d6.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 13:00:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743710450; x=1744315250;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GLNI9VGp1Wm5rLYd57L0Xp4ipMewoWDjGcDvpy893AU=;
        b=BWDuyaepCN/izUR5eHUEeIR7EJQcjcvaTZS9aC8b1FEn2CdAUc6xIGx+ErsantR0ke
         Yh7TITexAi1G1i1CGdOHg6jn+qhQM47rx1vRewiLdLO7cWuHGRkWC7318fXD47n+o7LX
         Oy/3WUpOtbVE12VoXbtH7QIgTsaxdebp5t1887i1ntumpQ88pledoena0Ek39FUfYxzQ
         GD6MrDTPP0nZU2hEaq5foc6StugnU2oCDqgwJ4gLEU0fVI89vjxXoQW80IptgTR8RF/K
         Jdji2ix3ydrqqgn7nEo0sd3OZiK3J+qOUyG1GYjB575Vm1ytKcN9kv+G6wfnecZnR7UZ
         rmEw==
X-Forwarded-Encrypted: i=1; AJvYcCWhJ+pD7bSlvzcsAmcc6JFIrzDKIEBYBn6LqnbchZAKZ5kdii5dyHaGEZNZ9S87cpyznMLquEqOr7cO878=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDJsmc8yT5p/P3JGWNYHn2XLw8m2mQaVGbEp4BQjyNn+lKu2AV
	mdElemMuc4ksfjS0VCVfcNBOWmHC/jBUEwr5YlI60faSvrkEg7oRXdeEg1fdARo0gl8vNAJIY4Q
	o/LI9eQKYj2hHw1EUkPSi5dStmX/jx95XQ6No77QFwVA22w7VqcOW4YyjD21sVA==
X-Gm-Gg: ASbGnctK/T/J6ZEUrN9m7ECW2jz93NGgjNXeRVrPm30AHFckK6iYJ4u4KG4nbYwuFlr
	aUUPTNEJ0TfDAVny42Eu0VU5uWqCSNTOPHjZCq7Sny0JLRYUiMC0K/54LkfQnkRXj2SZPnklPjm
	9FmkKp5iOZdmElyt3X8yYXbFeZynpoxnRf95PHA0xperbJqivchtouHDLpGWdOQDGq4uAC3RsO3
	ARPmP/oiBzeHtpzJM+Nepv5KGiyQLc26NcXzdffOVcgj0MjMQpTIWaiwZK6ZCFNV/5xciDG1Sj5
	3d47OF/mWbgZUDM=
X-Received: by 2002:a05:6214:248f:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6f00df1f687mr7864276d6.21.1743710450196;
        Thu, 03 Apr 2025 13:00:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEH3RbFcRIn58HCTEBNM31yCVKIBXI1JJ0q3Y51iA0rFaC8CQitL64IgDIZqaz1u52zOEzV7w==
X-Received: by 2002:a05:6214:248f:b0:6ed:df6:cdcd with SMTP id 6a1803df08f44-6f00df1f687mr7863656d6.21.1743710449849;
        Thu, 03 Apr 2025 13:00:49 -0700 (PDT)
Received: from starship ([2607:fea8:fc01:8d8d:6adb:55ff:feaa:b156])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f00ec2esm11313456d6.47.2025.04.03.13.00.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 13:00:49 -0700 (PDT)
Message-ID: <9db2d6e6124227fcda51bce5ac3169c3450685fb.camel@redhat.com>
Subject: Re: [RFC PATCH 04/24] KVM: SVM: Flush everything if FLUSHBYASID is
 not available
From: Maxim Levitsky <mlevitsk@redhat.com>
To: Yosry Ahmed <yosry.ahmed@linux.dev>, Sean Christopherson
 <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
 Vitaly Kuznetsov <vkuznets@redhat.com>, Rik van Riel <riel@surriel.com>,
 Tom Lendacky <thomas.lendacky@amd.com>,  x86@kernel.org,
 kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 03 Apr 2025 16:00:48 -0400
In-Reply-To: <20250326193619.3714986-5-yosry.ahmed@linux.dev>
References: <20250326193619.3714986-1-yosry.ahmed@linux.dev>
	 <20250326193619.3714986-5-yosry.ahmed@linux.dev>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5 (3.36.5-2.fc32) 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On Wed, 2025-03-26 at 19:35 +0000, Yosry Ahmed wrote:
> Currently, if FLUSHBYASID is not available when performing a TLB flush,
> the fallback is decrementing the ASID generation to trigger allocating a
> new ASID. In preparation for using a static ASID per VM, just fallback
> to flushing everything if FLUSHBYASID is not available. This is probably
> worse from a performance perspective, but FLUSHBYASID has been around
> for ~15 years and it's not worth carrying the complexity.
> 
> The fallback logic is moved within vmcb_set_flush_asid(), as more
> callers will be added and will need the fallback as well.
> 
> Suggested-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Yosry Ahmed <yosry.ahmed@linux.dev>
> ---
>  arch/x86/kvm/svm/svm.c | 5 +----
>  arch/x86/kvm/svm/svm.h | 5 ++++-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 0e302ae9a8435..5f71b125010d9 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -4005,10 +4005,7 @@ static void svm_flush_tlb_asid(struct kvm_vcpu *vcpu)
>  	 * unconditionally does a TLB flush on both nested VM-Enter and nested
>  	 * VM-Exit (via kvm_mmu_reset_context()).
>  	 */
> -	if (static_cpu_has(X86_FEATURE_FLUSHBYASID))
> -		vmcb_set_flush_asid(svm->vmcb);
> -	else
> -		svm->current_vmcb->asid_generation--;
> +	vmcb_set_flush_asid(svm->vmcb);
>  }
>  
>  static void svm_flush_tlb_current(struct kvm_vcpu *vcpu)
> diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
> index d2c49cbfbf1ca..843a29a6d150e 100644
> --- a/arch/x86/kvm/svm/svm.h
> +++ b/arch/x86/kvm/svm/svm.h
> @@ -416,7 +416,10 @@ static inline bool vmcb_is_dirty(struct vmcb *vmcb, int bit)
>  
>  static inline void vmcb_set_flush_asid(struct vmcb *vmcb)
>  {
> -	vmcb->control.tlb_ctl = TLB_CONTROL_FLUSH_ASID;
> +	if (static_cpu_has(X86_FEATURE_FLUSHBYASID))
> +		vmcb->control.tlb_ctl = TLB_CONTROL_FLUSH_ASID;
> +	else
> +		vmcb->control.tlb_ctl = TLB_CONTROL_FLUSH_ALL_ASID;
>  }
>  
>  static inline void vmcb_clr_flush_asid(struct vmcb *vmcb)

Reviewed-by: Maxim Levitsky <mlevitsk@redhat.com>

Best regards,
	Maxim Levitsky



