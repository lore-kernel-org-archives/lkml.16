Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993A613C816
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 15:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738854987; cv=none; b=WO8OAVpsR+F6TY9H/jujj+h9CzbN8CwCwQKLYNtFLO/4kVtBeqaobLVLKtP6D5G/xCpB7w6DotvwGmXZelCs3VbLf9/xVNORE001XMuogqCElD5r7c+On73zk1kFuQnSdKNBNjwrjpJ0xF+/oOWA32aMYWgg4sJSpXVMdEbeiWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738854987; c=relaxed/simple;
	bh=wrUO/pv3wuaL79TztGdwTHBbUZYh8NrHCiOXYPaysQw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QVIWZjqmXaAcXqhNoQkVeuczaccDSj4YRMvR6llaQ0SNC/muID/nziHBI0oZ3HlsG0ZBfe/ugBFsR91iijl031AQwtzohu0cU/pZjYxhPLYOczz87s7xyURHfD8VAlZtEnPPdz3f66Hg1q3aFlrd8hXPzSa2nDL2Y0oOnQ8+uNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1lRK8uym; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1lRK8uym"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-2166464e236so33912605ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 07:16:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738854985; x=1739459785; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/O+gmVjEiO0izHw1wyAH52hjvhtcTqnj2hmp9TBo5bg=;
        b=1lRK8uymqlKIs6snVbz/1dDLNX0RLawoBPiyPtfDI9tGq9BTqjMubT8i+h+NfvhCqe
         vIBBEiPenmYFnNAOagZUKSWGinRQtj66CHHBxFK3ZHS3IUasijflKJTe3DUYoJQH4UGL
         CGySGfqaXcfsAnBGW0trMyF9D/hMhcDeMUs3ieb2vFRkl3QVZjEAv68OjZLqUwMyJmj6
         9yTDtcEZBLUszhD3IMC3Eo445+bxjMQMJdElyD01zVbiDeMpGKvdnsfmbsTXrognOF3c
         6bD/2aHHkdZpzmnl7+Ba7tUD+KWlYnZiXOFxuXMjp70vn9EVuU7F/n2z8Q7QZsm56YkN
         80EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738854985; x=1739459785;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/O+gmVjEiO0izHw1wyAH52hjvhtcTqnj2hmp9TBo5bg=;
        b=haDt0xTLB0Uy+n2Y/6hk9sS6qi7OCn2qUFYRjGFOVQeJZ/h+PPPpFziMSFTZU4ehYL
         RNbirI8K8fjkNHrQiGGFeHtvtTozIZQ57onfmUVZjpcEt1GKTjA/BP1c9zjkMdEDwtWg
         Sohg1aXOvtqnwVGuAh044r46PHPrvHbk1iFeJI8+TEI4cvNxBbTXVD07teIiyFll261j
         Bymg4mppC0tySxyq1XotQc+JS7SFc8wKZ+g1LKpMnoKCjtwEx3jWh6NYTkQUpmQHy8oG
         9x3igA5Kcdd4XgrGoTlAdCf283r7QHNF1EwBne0oQBpFeCgjCoi9tWLZFYjfGUCYGaLM
         bZfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVzoqMr8S13F7NAe8fzQVLVzypb7CFNJLuxhbplQ2uYy/V5rwfU80NArFU57mEtPALrI5RmIry9QQci17E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXHylCdumnyTHzyNc8NWVQd3Uvk0ClCdlIlVQ2A6HNueZ4uv2l
	F0FB6bb2fXSvRKxg/nqtGi3gpGVmHdWE332jzfSlH4FYfekyHrCDwrQnR83F3SKHw3yh2LovnAe
	ABg==
X-Google-Smtp-Source: AGHT+IEqoERbvjL8QRLQoY1mFC+xOoqWn74MjyilsWi+ixkfWOF6DG/8rz3OjKhU93twnCTVaEwniXbu6Nc=
X-Received: from pgbft13.prod.google.com ([2002:a05:6a02:4a4d:b0:837:acbb:873a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:d705:b0:1e0:cf39:846a
 with SMTP id adf61e73a8af0-1ede88ab90amr14153239637.29.1738854984884; Thu, 06
 Feb 2025 07:16:24 -0800 (PST)
Date: Thu, 6 Feb 2025 07:16:23 -0800
In-Reply-To: <20250206022656.3752383-1-fuqiang.wng@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250206022656.3752383-1-fuqiang.wng@gmail.com>
Message-ID: <Z6TSR8UmtNNHFeUQ@google.com>
Subject: Re: [PATCH] kvm: delete unused variables iommu_noncoherent in struct kvm_arch
From: Sean Christopherson <seanjc@google.com>
To: fuqiang wang <fuqiang.wng@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	wangfuqiang49 <wangfuqiang49@jd.com>
Content-Type: text/plain; charset="us-ascii"

On Thu, Feb 06, 2025, fuqiang wang wrote:
> The code of legacy device assignment is deleted entirely in commit
> ad6260da1e23 ("KVM: x86: drop legacy device assignment") and the
> variable iommu_noncoherent in struct kvm_arch is also not referenced by
> any other code. So it is deleted in this patch.

Someone else beat you to it by a few weeks, I just haven't applied the patch
yet.  Thanks!

https://lore.kernel.org/all/20250124075055.97158-1-znscnchen@gmail.com

> 
> Signed-off-by: wangfuqiang49 <wangfuqiang49@jd.com>
> ---
>  arch/x86/include/asm/kvm_host.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
> index b15cde0a9b5c..98555afb6f10 100644
> --- a/arch/x86/include/asm/kvm_host.h
> +++ b/arch/x86/include/asm/kvm_host.h
> @@ -1354,7 +1354,6 @@ struct kvm_arch {
>  	u64 shadow_mmio_value;
>  
>  	struct iommu_domain *iommu_domain;
> -	bool iommu_noncoherent;
>  #define __KVM_HAVE_ARCH_NONCOHERENT_DMA
>  	atomic_t noncoherent_dma_count;
>  #define __KVM_HAVE_ARCH_ASSIGNED_DEVICE
> -- 
> 2.47.0
> 
