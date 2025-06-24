Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05B57E1
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805341; cv=none; b=d4EaqqzFgj6TZ9szXk9SWkB+y1ewWqx6n7xjwhEaoC8FunckEWqcUooyirhuvlzzj0EtHNrRY9ygMVT0+SGGpR90Rk+UoVYa6+SqdEOwmNXfe3bdOoiM4W3MTVSABKfbEyF+sMeT38A7+ygQmaK+v/hAW1P3YtgFA25JaRWJe+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805341; c=relaxed/simple;
	bh=tKiCEWoC9S/+PezCVVnVqszcAo6lmpt/ehelyNKt5Xc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ipVRiYvM0DDPwsi4ZJxMc7jvUBegvrH0QLsg6e7DTdCrrdcjOWq0p4mkr0pgikFJQJEJH6yS+LBI+eej5S0ewz0dO+zlTs9BGdAipA/Z79M1eSUxmmA1hVUe4JZ3JBxobg0zKlvQ4Amy/RYM7kcmliv56HiDCpIH2cP1TV9sUF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bH2hfsEJ; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bH2hfsEJ"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-31202bbaafaso5876340a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750805339; x=1751410139; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pakrfgZ40BEaKLVsq66zFAHqKBjQfVwDd34V+Ag+OKE=;
        b=bH2hfsEJm8EGlg5Wj07/F4rQv9W3IoXnh/1TIidWr6xgI588vDZ+rndgakeov68mbt
         yuQioel4aQem9AZJpT01VvQhouLwMxYiSQ8BMt6KaUSaS4+HPdnGUsCQTPkmt0f2Q5I3
         xyUdzZOEGJJFAaVus23iab7i9WaSOwaXsZTNxosKBKctDMvLUaoj5kBqMclJ+dOpuVEM
         m3tixcd0z5jBJgzQy16ZPE66apRdeTvvR+fr8hx6Q9QP2CZ/zmIbnyNF8T+RPZjeT+Fl
         4jyDmt0Ab+bLzranm708SsCJJ72dB1opGYTO5pt8D3wcpvNBQe+KMOfctDJcetGrS9Wu
         SyPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805339; x=1751410139;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pakrfgZ40BEaKLVsq66zFAHqKBjQfVwDd34V+Ag+OKE=;
        b=HoBhV6eU5McxddaWl0ao4BvCK9I8yw6zG02StbC0Zxq3gybEjOiM4PwGOrhmd9/Mur
         eTz/+wayZ2uBrvR0eKDO05SNQ9sE1W55CaiBUddT5aAPdo6DOhNzAE0M8zqJN2Dez8bM
         eN2u7G16AqIGg6WdkCKLPOInEn295myDcsWYEh/IdRW8+bCWfBVp+UvpNOLwPtjqBngJ
         XJQB9n+rfeArHRXPvQnak2/e6KCCzA/5Pl/evnLKAqmxpAIpHVzUtu2Mk01j5SYzx3Gj
         jM0LRC6m528VmBDS1tciC95W/2Q97q00qFTlyUW65kGI+LbIITXlu2Hwb5mVwSCKyO6k
         5xJg==
X-Gm-Message-State: AOJu0YxQw7xNrnFwy5mSp6YhNnYhaHJDDCEokgWkuGTlJeKSkJXNMAFt
	Dmx64UAwmXg+HvdjS6JXc5Cc/KxirTUZEO6M+zGxefq3nVez8YmljGwHtnchXqQxfj9S3y0mNi8
	/Oxmvkg==
X-Google-Smtp-Source: AGHT+IFtxnJNBQX398hfbuOcQH3X57w1Ez2xpJMM8EDgXELaWyuLtPEm3RcRY9M/lHgpgKlMyhZIiePSNc0=
X-Received: from pjbsw11.prod.google.com ([2002:a17:90b:2c8b:b0:312:3b05:5f44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3948:b0:311:ef19:824d
 with SMTP id 98e67ed59e1d1-315f25e2e0fmr897420a91.2.1750805339102; Tue, 24
 Jun 2025 15:48:59 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:48:57 -0700
In-Reply-To: <20250612081947.94081-3-chao.gao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250612081947.94081-1-chao.gao@intel.com> <20250612081947.94081-3-chao.gao@intel.com>
Message-ID: <aFsrWYaF9Ces3lIl@google.com>
Subject: Re: [PATCH 2/2] KVM: SVM: Simplify MSR interception logic for
 IA32_XSS MSR
From: Sean Christopherson <seanjc@google.com>
To: Chao Gao <chao.gao@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, pbonzini@redhat.com, 
	dapeng1.mi@linux.intel.com
Content-Type: text/plain; charset="us-ascii"

On Thu, Jun 12, 2025, Chao Gao wrote:
> Use svm_set_intercept_for_msr() directly to configure IA32_XSS MSR
> interception, ensuring consistency with other cases where MSRs are
> intercepted depending on guest caps and CPUIDs.
> 
> No functional change intended.
> 
> Signed-off-by: Chao Gao <chao.gao@intel.com>
> ---
> With this patch applied, svm_enable_intercept_for_msr() has no user.
> Should it be removed?

I'd say leave it.  If it's a static inline, then there's no dead overhead in the
binary, and I like having parity between VMX and SVM.
