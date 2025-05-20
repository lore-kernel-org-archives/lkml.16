Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D4A5283141
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 16:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747757750; cv=none; b=FpgNe2NNX08buo3a/pIpR45M4/UtcpNcZw+5luyuHkeb5iBuy+iQMsaG30EdxyG0q63BWRm4FDoj9jXzN3oa96rQBSZc9c319se/uBuTpCRDuPXUGH5Ek6dJJhtuxTdhILytID61G/hRj/GsDjjIxAdqGgPXnahWD20iSM9KSEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747757750; c=relaxed/simple;
	bh=+Vcw99hArJNg96u9C+1xlSH1x7gl3AusJncKN9s2FM8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=p/gkglPIUEoVbNyP3ez9zFh5q0nWktGrvKcyu7wAFIx5HtZkfmjm1VrqD6FuhgbmIu7psqWIZrb/fddmkuWloyOAmPGYMcSxyugC0KghW3uTSHxRxUl2LLx0ShyFcXxXZBKp71jSuXuC93qOr7XipIWPJQp50ruisVjPt9ys04o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jLQZTfnu; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jLQZTfnu"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30e8baf5754so3082805a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 09:15:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747757748; x=1748362548; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZGR3h8ZXjmEa2GSMvAS+bskJuHQ62fc+lc2T3EMCe8=;
        b=jLQZTfnuHDUJ8TIB5y/9OFJwvlV5qOS7cXrKOcTIIE/hC4UAaRHBvEzPrgCCOHCz/L
         pmb3vv8ujSdYolXXXKckOFTHji7lYbpkWOa4Hf8GrR35d7YSaWgNJhDvG+YzNZyLeQc0
         D+2jXn5MaDXCjpZX3hcUloEGj+cVQozqxBcw0+GR9Gzv4OlZfzzokILHRvDSovVhc//E
         6jsBxqOnnzxQxKNkWkECnIbNW2QbXRQUEcQhGyfwt3acaI1O8Ff/ihBMwwONkrzUus/7
         VLX0YypBFm76/R5TklOGWsR2gVpXeHRoUk+Kd+0dHxnRFj5F7w+SVgkJvy45UG+t87Ge
         OZPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747757748; x=1748362548;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bZGR3h8ZXjmEa2GSMvAS+bskJuHQ62fc+lc2T3EMCe8=;
        b=I+b3CYCK5+DK+ZG6g2XpJ/85BQA1Y3DDwitEWI1r6S+u469RnK95Q8MHPrBC+Jny55
         h3ORbAe4WBlRcBiYHcTCCCbgJHUEaNmCGAXvC09YTU4bPXQonWg63Bswz1AiIAwegF52
         zvOU69MHtoKoqrUGnjO2grS1So2MUWPFa9V30IEZShEg6+KJ5eheBniBO9ENWstWhmU5
         /UOyrRE707D2GqcmS2UcqSZy1dIMUxj/roI7VAGWEDx+hfSfxtvmTFnIz+hQjhoswSAc
         KqlEdIaaGjjbNO3EGqaglUFknKE2SK5Ke1NoBWzhSoByrA+4UYYDpXqOCt/F/IKZ2D1B
         J0Kw==
X-Forwarded-Encrypted: i=1; AJvYcCUrX3NiWY5Arnq6bddZccI/JvwuaNGzjOmMREnW85fyD7SD227cc7UPGZOfis3SH/Ep1LSPsVDSRXFLfNA=@vger.kernel.org
X-Gm-Message-State: AOJu0YygSZiv68zaezxwstt0gpjGHXlZu7wePHiMMQiJ0rt3NUG3Zddc
	z13RRuYbipHwa6+j0mxpXwI8lIjPzRsqCd4faUQuKuFLmWqAePlTnySoVT0d47fHkEEbCpRgOwz
	wk/sU+Q==
X-Google-Smtp-Source: AGHT+IEOGvM3znTeHBFpGt+G8+/5jz10loCWHUqdckQa0FPVp/EK8lWGYjsG7vLyd1Y+UJ5BtLugpTJwv5E=
X-Received: from pjp15.prod.google.com ([2002:a17:90b:55cf:b0:2ea:5084:5297])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:dfcd:b0:2fa:13d9:39c
 with SMTP id 98e67ed59e1d1-30e83121243mr27086604a91.14.1747757748369; Tue, 20
 May 2025 09:15:48 -0700 (PDT)
Date: Tue, 20 May 2025 09:15:47 -0700
In-Reply-To: <20250516215422.2550669-3-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516215422.2550669-1-seanjc@google.com> <20250516215422.2550669-3-seanjc@google.com>
Message-ID: <aCyqs4VdPsw4mA_F@google.com>
Subject: Re: [PATCH v3 2/3] KVM: x86: Use kvzalloc() to allocate VM struct
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vipin Sharma <vipinsh@google.com>
Content-Type: text/plain; charset="us-ascii"

On Fri, May 16, 2025, Sean Christopherson wrote:
> +/*
> + * Assert that "struct kvm_{svm,vmx,tdx}" is an order-0 or order-1 allocation.
> + * Spilling over to an order-2 allocation isn't fundamentally problematic, but
> + * isn't expected to happen in the foreseeable future (O(years)).  Assert that
> + * the size is an order-0 allocation when ignoring the memslot hash tables, to
> + * help detect and debug unexpected size increases.
> + */
> +#define KVM_SANITY_CHECK_VM_STRUCT_SIZE(x)						\
> +do {											\
> +	BUILD_BUG_ON(get_order(sizeof(struct x) - SIZE_OF_MEMSLOTS_HASHTABLE) &&	\
> +		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
> +	BUILD_BUG_ON(get_order(sizeof(struct x)) < 2 &&					\

Ugh, I jinxed myself.  My severe ineptitude and inability to test persists.  I
inverted this check, it should be:

		     get_order(sizeof(struct x)) >= 2

> +		     !IS_ENABLED(CONFIG_DEBUG_KERNEL) && !IS_ENABLED(CONFIG_KASAN));	\
> +} while (0)
> +
>  #define KVM_NESTED_VMENTER_CONSISTENCY_CHECK(consistency_check)		\
>  ({									\
>  	bool failed = (consistency_check);				\
> -- 
> 2.49.0.1112.g889b7c5bd8-goog
> 
