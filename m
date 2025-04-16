Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61198188735
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744827885; cv=none; b=XJQWB0481kdi0HsUBjn02y4UxA2r7kAC0uu6WHTtvcAwzmaUqp4pyjAqcAL3x0VaQ4LpzFS+93A3heE8IY0+Tm8ycQP44XD6DNMEZAaLTc4yfire8EnOQ6wHUrCspi99ykBeUaEscwkuHrmUi82L/V9eLOrVshgpvL8qJcfNx+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744827885; c=relaxed/simple;
	bh=oWT/F7XNGMua84md0xB7i6qKpkZiaDT6KbfyOZrXN4U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BsI42efe4gXSkBiaWhpL13X6It1CcKe273OvQSjb0QyNqwoz1uv3pLasxuZi86En/dSEDmEcJF3V98PvExFfAHCBuJVijXoyCwwImMZMRODJ9kjPq3Ileac352ff34FosreF++TeafFO5CLcSyEgXlm/vvc5cD9HodCHalYPYc4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Mnh2R253; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Mnh2R253"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2264c9d0295so25315ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 11:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744827883; x=1745432683; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wOK0Vf+KbobwJmYW/gQ4vGafXzu+jG9W32EG6FGCWPQ=;
        b=Mnh2R253H9M9WGf3/4vXTN4xAYUfoLXSKuZ43/2JPlLo686tKR0ovZCYp3wEbEiyW/
         Wy6/YovEwRXvIb5hGDKNlmwhWsb3b0VkZbx41tDYAM6/hmsCrAIS0t2FT6IAExcXZZyq
         x7zGYJPzfB001XD2ZDXOH+Rg79sSqk1yyDCm4fRfWPV8RBk9zDNaVSX8UQQ3KS8IfVJg
         TUKj9q272r2VWZEjlMgdF6RC55ir+MnQscZ8FRpT20rpgSZJSxW3v6xrIZdU04E1zTTS
         gPV/PgtVsk6A328UEwx/0VY6G5mD8e72d9FhWyRMYwsSX7e2f5UCpbNkTIagCz5L1oGl
         zfng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744827883; x=1745432683;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOK0Vf+KbobwJmYW/gQ4vGafXzu+jG9W32EG6FGCWPQ=;
        b=vo3Aq1TcSSkHQQvOJZ5sRnXxL0Glm8uZld6l6lA9ELuCQ4enpGd2Jkm+Kq0YoQMwUi
         xwl1gwg77e4s638U8UnFwcKeqptpWh8IdWLKij5i7agsV8LaYJdGgMnD73Ji5sIX2kAH
         JCJPr6ekrpfsDpIgOKb9Utm0j8krJH3Be9lKsGDgQ5isZ9oLQbxZrFguDf0AUq8yfGAW
         l3WZwPIkthTu9qLajWW4Hk87zTLKrxfe3bXVsHkUNbjtPPHH3UzIx1pCg/Uy2IP2f45v
         pLKcILTCvvXrkcaHXJUS44CpfxJh4SNtQ2wtmkjQp+qjrOpzp1lcx3kC9q3fNpdtFzWW
         TNMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWX+Pm7pZHueCwdWIumcltZBx5OE9sG7IkrmTRu9XELc6NCHswiIH4CWiVNTbENgKTq9DZR/hylq91+Vps=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzvtHGJUwjG1B/iV+lI+l3Jljg+Z2KB5rKWa+DSH+OPmeM4Czl
	pNvi0thaDybsiJQpcuH0WBAd7WBEfyV059zsd68p81Hrs2FIuRVYgBB/CHtq6w==
X-Gm-Gg: ASbGnctJhmlBgTRPv7aXdpLI17IanOD56AMgzsmsy+TmU9+2JjRmmOcaNyGjfpvZG8G
	zKnjJbsVAUcH8Rgx8ZkQWLIAStQk0BzKp8DKVZqTNJI4WPzxEXF9HXFzR5lzu8DASAZBF9td58o
	MitOOsmoDVH+GgZ1DLbrDvu4RAQyAUlAjd2iV5hlDts79Yzz82hOslJyqjDZIGRRwaXY/euKgl9
	bnOz8NGgizfaG8X6nOhQKuwrsC60y9TxpOYVI9JQKKpZc3Nixs/93XQBNXmYBfLgI69ASDnyXTg
	7b/UYd5ntw2K8ozEg0F4it2iJQubKxX3FOPqHYTTe5qDZ5EfjanD1L7jtcD73nxQdXBxXVh5REh
	6UQ==
X-Google-Smtp-Source: AGHT+IEpHyqavKPJ4ronBax5JpMqCt2LPq1gE7nGAr42leNu8PkO8Q/dBpQStv9Xhaw0weJzShRUgQ==
X-Received: by 2002:a17:902:ef11:b0:215:aca2:dc04 with SMTP id d9443c01a7336-22c412344e8mr232485ad.26.1744827883313;
        Wed, 16 Apr 2025 11:24:43 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-308612299basm1963232a91.33.2025.04.16.11.24.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 11:24:42 -0700 (PDT)
Date: Wed, 16 Apr 2025 11:24:37 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] KVM: x86: Allocate kvm_vmx/kvm_svm structures
 using kzalloc()
Message-ID: <20250416182437.GA963080.vipinsh@google.com>
References: <20250401155714.838398-1-seanjc@google.com>
 <20250401155714.838398-3-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401155714.838398-3-seanjc@google.com>

On 2025-04-01 08:57:13, Sean Christopherson wrote:
> Now that the size of "struct kvm" is less than 2KiB, switch back to using
> kzalloc() to allocate the VM structures.  Add compile-time assertions in
> vendor code to ensure the size is an order-0 allocation, i.e. to prevent
> unknowingly letting the size balloon in the future.
> 
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 2 +-
>  arch/x86/kvm/svm/svm.c          | 1 +
>  arch/x86/kvm/vmx/vmx.c          | 1 +
>  3 files changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index e523d7d8a107..6c7fd7db6f11 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1940,7 +1940,7 @@ void kvm_x86_vendor_exit(void);
>  #define __KVM_HAVE_ARCH_VM_ALLOC
>  static inline struct kvm *kvm_arch_alloc_vm(void)
>  {
> -	return __vmalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT | __GFP_ZERO);
> +	return kzalloc(kvm_x86_ops.vm_size, GFP_KERNEL_ACCOUNT);
>  }
>  
>  #define __KVM_HAVE_ARCH_VM_FREE
> diff --git a/arch/x86/kvm/svm/svm.c b/arch/x86/kvm/svm/svm.c
> index 8abeab91d329..589adc5f92e0 100644
> --- a/arch/x86/kvm/svm/svm.c
> +++ b/arch/x86/kvm/svm/svm.c
> @@ -5536,6 +5536,7 @@ static int __init svm_init(void)
>  	if (r)
>  		goto err_kvm_init;
>  
> +	BUILD_BUG_ON(get_order(sizeof(struct kvm_svm) != 0));

There is a typo here. It is checking sizeof(struct kvm_svm) != 0, instead
of checking get_order(...) != 0.

>  	return 0;
>  
>  err_kvm_init:
> diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
> index b70ed72c1783..01264842bf45 100644
> --- a/arch/x86/kvm/vmx/vmx.c
> +++ b/arch/x86/kvm/vmx/vmx.c
> @@ -8755,6 +8755,7 @@ static int __init vmx_init(void)
>  	if (r)
>  		goto err_kvm_init;
>  
> +	BUILD_BUG_ON(get_order(sizeof(struct kvm_vmx) != 0));

Same as above.

>  	return 0;
>  
>  err_kvm_init:
> -- 
> 2.49.0.472.ge94155a9ec-goog
> 
