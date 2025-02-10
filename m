Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB42724C69B
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 22:23:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739226223; cv=none; b=Ju4v3xRwHBT68DNjTpzqoMVLTIKvbXoG0iYI9So6tHdQoLxci6Rs40OmAAixamKtnyNZlpXAuWHx/w1/oxJQRocPe2bDTtnAPkMx4jSYt9X7DjQM0QyfIABxH11ISOSquM5Cm6c0tbWmJsGFLE//37PPwTb9BFAR+THfqJPyBbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739226223; c=relaxed/simple;
	bh=hF8Vf4v4gr1R+Shd48LsTyb/BYZwoN0AaP4YvUCD6FU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=oPLd7JTeLi3kmAi6mLMSQVPW7hccegjv/mD6F3uSnHE6yWTjRtXyfTm4mjJJfJVYgBbju9D2wkJh4P9N8tK1b4mhQlLkzcWCSD4386MnT1j+RieRLm0nvpb5HwK+OouopmMkRTBzWZdTKxWH76U8JBED/e3qiMk8FppjmydZcv8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4c/Gi0Pz; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4c/Gi0Pz"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2fa34e65bc1so10138517a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 14:23:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739226220; x=1739831020; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pUXvYzG8eRKf2w27XFFoCbVFPZhMAFQZ2tlWsem28oM=;
        b=4c/Gi0PzVH8a9EgDCiqitnq8V4knhIxPHxi0eLI/uVXtuqLMYY8ZaWLXZS8g0KxtHU
         oph7inMFINU2v/IINGVFmiGkV5PmUM6jOcFmseBRlmyPaqJBc08XKeujNLWafnPUQd79
         WLzG7Ngq54f052sQi1i+GmMuIVLo5AcOv5deboj/oR9Zdf+dePcOooHebU8WK6oLCnGp
         Vl8F90a/KJut6ytynnRpTUH2y5m5N2emPwVkZM+aeWyqV3+R6iBrOuDLKtVsj25H1SGc
         3/DeVNbAKaQzco+1MFWXaWmXZU9/dKT57o4nMMrpXHBx9i33yj70bmA38VkDigPAgC/7
         +h4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739226220; x=1739831020;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pUXvYzG8eRKf2w27XFFoCbVFPZhMAFQZ2tlWsem28oM=;
        b=qmRjqlofOuF6A1E35BDaODhy5TE9//+E9nwOdKPxxUUA/L0AL20/3zMHSsyGoRas1J
         Xi+WsLrM4LsVgYWQxxtGEV0nkiuD6HjMrU2a+saGQjRN1XYrAw4fZPw4cj7HRIvr+rrj
         9EXZb2OSOhSaYeVTBMMrxRidMygOnkf4fIvwy/2BA2sr0qfg42M7pnWrCoXgfe5J6+6I
         9tV9OExmr+cQGKwJs6pbr7pk7YcDhKK2YBl7IH3obg1nhpUQ1dFgW6UFvuPK6xUnf6fL
         iX/lBaZI1OlEd9U+Fy8Lebp8graUUx5543XE10Ph8Y8qJA63ba7MIV6/LONtnc35Q+ow
         rN4w==
X-Forwarded-Encrypted: i=1; AJvYcCWarXTAjy3qIEy2d6OXKdAB/hJcmnylfn5usQxejr30UOHlnTqAh8eLKiiFEGHQzxnuzYCdcPNI7grJCKA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2ywwkT+JCkSsJSmoY4+92jO0nWlC1GGeb35OKt5BdW5vjar2u
	yAj+5N69MzZlCuTpxlorISUv+T1iNS3PyqQJ28M8aJCGZxj9SLg/h8ziI8SF7J5fQOjRnZPON8P
	b7Q==
X-Google-Smtp-Source: AGHT+IEy3+bVFo6JcMsoWvq+cYL38XbyKOeuF/tQSdUVXK2R0Wk67Xr5wVNUmJlCk3rS7iPBAN0yLqQOGnk=
X-Received: from pfmu14.prod.google.com ([2002:aa7:838e:0:b0:730:9617:a4c9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:3989:b0:730:f1b7:9bb2
 with SMTP id d2e1a72fcca58-730f1b79cfdmr3734751b3a.13.1739226220172; Mon, 10
 Feb 2025 14:23:40 -0800 (PST)
Date: Mon, 10 Feb 2025 14:23:38 -0800
In-Reply-To: <Z6bDZWzePT6CAreU@yzhao56-desk.sh.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250207030640.1585-1-yan.y.zhao@intel.com> <20250207030900.1808-1-yan.y.zhao@intel.com>
 <Z6Yhmg2nmUAtp4yn@google.com> <Z6bDZWzePT6CAreU@yzhao56-desk.sh.intel.com>
Message-ID: <Z6p8aukJgpKqg3Rn@google.com>
Subject: Re: [PATCH 3/4] KVM: x86/mmu: Make sure pfn is not changed for
 spurious fault
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: pbonzini@redhat.com, rick.p.edgecombe@intel.com, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"

On Sat, Feb 08, 2025, Yan Zhao wrote:
> On Fri, Feb 07, 2025 at 07:07:06AM -0800, Sean Christopherson wrote:
> > On Fri, Feb 07, 2025, Yan Zhao wrote:
> > > Make sure pfn is not changed for a spurious fault by warning in the TDP
> > > MMU. For shadow path, only treat a prefetch fault as spurious when pfn is
> > > not changed, since the rmap removal and add are required when pfn is
> > > changed.
> > 
> > I like sanity checks, but I don't like special casing "prefetch" faults like this.
> > KVM should _never_ change the PFN of a shadow-present SPTE.  The TDP MMU already
> > BUG()s on this, and mmu_spte_update() WARNs on the transition.
> However, both TDP MMU and mmu_set_spte() return RET_PF_SPURIOUS directly before
> the BUG() in TDP MMU or mmu_spte_update() could be hit.

Ah, that's very different than treating a prefetch fault as !spurious though.  I
would be a-ok with this:

	if (is_shadow_present_pte(iter->old_spte) &&
	    (fault->prefetch || is_access_allowed(fault, iter->old_spte)) &&
	    is_last_spte(iter->old_spte, iter->level)) {
		WARN_ON_ONCE(fault->pfn != spte_to_pfn(iter->old_spte));
		return RET_PF_SPURIOUS;
	}
