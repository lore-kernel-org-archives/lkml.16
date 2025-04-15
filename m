Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EBE24A05A
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744747604; cv=none; b=MBm1C1zRwE1hryhMZgOYX8B0Wnjmpmmgg2zEwKwm0l+TB/SErFOdlhPqG+OxUQr87VFZuqmlIpXu/wxxuYkgJfkuuvPgcQVoCT658O5ORfNf3l47vQRXB0NEMOzlQ7MO/Pjj/XFbUoDogLFdRvcQ+YZdCb5Kg0tVV5eh5OcEW+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744747604; c=relaxed/simple;
	bh=dgoGJIl+kDZZs+vuhPvPzFpoBbJLbWi7bg0+VMxJ7i8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ip5BXSj8yVw5W1ZCEH3bOPOJVEf2iezwsiy48o48p+CBKSr8oGV6rBbebtnfz+xhMgVsUTBIaj9bSUe6ZcPNmB7WA9XZw9qZDoNEA6JdU9CgY27nkipvQpi6YCyqRvZt1d6lUypdehx7hwlWDmh1mazRzT+FUjmRemmuQLp9uuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E80ppLH0; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E80ppLH0"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2242ac37caeso7725ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744747602; x=1745352402; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=D3HaMUmTHz0CCTDWNltKWF71+xXQyeA8j8iLjK2r2fA=;
        b=E80ppLH0iz0ldOXcEPzVnesbmYdv/BPwKPMUDm+tgi1qQba9KG7g0DY9DOkNb7Cjip
         FPKH8bmbo7vWp67QUseTLqUz0tYyGOBlt58y2PQ3roMItcor+QMbNhakZAgogt/uYJwd
         bMmWSvTMDhTVqu7p29iTZbEHj2y6gEl2aCSDu8nA9MI9DV+VydRyotFp5254FiolUOAs
         gYLZG/QLhti78ia39/LFR1tzemWarkMj+3BgyCH72TH3e2rD5pxaMJigtxOQ6W6KseM9
         +x9nMcs8F4s4c1sykPa2HnWsACOZu5lRThkBbRenq7cEERx+j/94l/L3xjUenkbmFcoz
         aiQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744747602; x=1745352402;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D3HaMUmTHz0CCTDWNltKWF71+xXQyeA8j8iLjK2r2fA=;
        b=JIqwkhwXSoJewiJJ0t2at2UDrglZ5oLuDrMcf/3RgxE5Xk4e53X98SBtBr5tQ58025
         5ZzGRnJ/8gTWi/4oFAnrSA55TalHtwOiRiEIKaf2lhGkgcGNFlOwjIO3LpVEPSMhHlj6
         cVdjrHWJX1T7RmgI/LlWcv3Q4DVk11Ue8J5Dph2C9WQgTGva/vBbIqskMSq/d8Q6c0kd
         oIEwzccxL+wMun1lBObhJ1ORi5WZIiZ/LefuRMse31xSXVtwP0tG48hFlkQ3yIWtujlk
         /FuwnmHuPfYrMtmVvB/fOs3P7c4YW+he/vHPo/RlyvgyKUEWnFhjm93qTYsRV8gtX3c4
         cptQ==
X-Forwarded-Encrypted: i=1; AJvYcCUIO3KA4zfbw5cbqkjiWU1s4Y0SL6ug7W19fzztelyvhmyQckYhkr3Yq8d5I9JdaO0yj1fYuEo08h8bDLg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3Pw6/CFTBO5w6D3mzR6Bs71WvUzFqX/FJCNIVxQRwrSXBrdfG
	YR0SvOJ5SSHMAwLNPdMXWxhCRdKj6cvoucpkBCFc58qjpoKJVHttE3bUw2uGZNB3ioQ/8jpjqjm
	W4Q==
X-Gm-Gg: ASbGncuMTNWOV2uAigQ2dPbHNtvv7xV2JS+C6jXTWHvKT3v/qVKhzF8vCM5S1isZlJa
	7/YXNm6KrhYmECsVQ7FGToTbRT5RZe+f5IPbezc2c/tniiE6n+18iX+Pokm9ZSQbahCK7cK3DAi
	BPPehs5YDWQUn8pKGpqrMwFvdNXPScTKRSY94aExkokI/ZjdvBnDCwApzl18Eo7laAjXMose+Ft
	A2z1xj8pBaVrZjNAM+h8lOgitYR8VZZ5dT1ACyucwAG1lOPqPQhqtbqQXeyyM/aSF+u/r9Gm42E
	DNJFj2wcT/4KU8Oo/uEarymDzhfVMmeKjx1BVcLhQE+5J4CUNlQ8d/YFAKHwsZ1eKKQQmY9zZJv
	PVnQgqE380jTX
X-Google-Smtp-Source: AGHT+IFDl2oce5DnOwllJhmUftKGTx0b849xp6MecE8YT2xG1nKWZIjIRct1geHzZgP+NzxFXOQN0Q==
X-Received: by 2002:a17:902:ef48:b0:215:7ced:9d67 with SMTP id d9443c01a7336-22c318a9ddemr627965ad.24.1744747601407;
        Tue, 15 Apr 2025 13:06:41 -0700 (PDT)
Received: from google.com (176.13.105.34.bc.googleusercontent.com. [34.105.13.176])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb79esm121945215ad.243.2025.04.15.13.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 13:06:40 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:06:35 -0700
From: Vipin Sharma <vipinsh@google.com>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] KVM: x86/mmu: Defer allocation of shadow MMU's
 hashed page list
Message-ID: <20250415200635.GA210309.vipinsh@google.com>
References: <20250401155714.838398-1-seanjc@google.com>
 <20250401155714.838398-4-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401155714.838398-4-seanjc@google.com>

On 2025-04-01 08:57:14, Sean Christopherson wrote:
> +static __ro_after_init HLIST_HEAD(empty_page_hash);
> +
> +static struct hlist_head *kvm_get_mmu_page_hash(struct kvm *kvm, gfn_t gfn)
> +{
> +	struct hlist_head *page_hash = READ_ONCE(kvm->arch.mmu_page_hash);
> +
> +	if (!page_hash)
> +		return &empty_page_hash;
> +
> +	return &page_hash[kvm_page_table_hashfn(gfn)];
> +}
> +
>  
> @@ -2357,6 +2368,7 @@ static struct kvm_mmu_page *__kvm_mmu_get_shadow_page(struct kvm *kvm,
>  	struct kvm_mmu_page *sp;
>  	bool created = false;
>  
> +	BUG_ON(!kvm->arch.mmu_page_hash);
>  	sp_list = &kvm->arch.mmu_page_hash[kvm_page_table_hashfn(gfn)];

Why do we need READ_ONCE() at kvm_get_mmu_page_hash() but not here? My
understanding is that it is in kvm_get_mmu_page_hash() to avoid compiler
doing any read tear. If yes, then the same condition is valid here,
isn't it?

