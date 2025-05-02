Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E426920FAB4
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 21:51:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746222691; cv=none; b=bGBdhAVSTASpmJZCBgR6VaDFuokdCqwRH/G2wxNFvxjpxKhbc4E6w4PFOAN7d+Jf2nWcLSLqsI397PlYUzqbTmLWgTjK5hf2EyUnHm6Sz9CzqCn5qO0eai2QoWKJFkPfXjm7Qr4lTXPXsyzeFZtg9wecuXgWzdL5cLwM/W3HQoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746222691; c=relaxed/simple;
	bh=2txtXmkPas782tuJZyId1VB56basPkhr7R2WNHcvWIg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HLHIHxGjO1UIJQccNfr6/Dg44kyjIrC+s/G6gmUVbvv+4ymHFw8DntGL0gke/fVn/O+eqEwu5QDDy8ZCccOpN7tppRdBIOdY5A4EYUbJgPve3O4duG4jn3Jtv/dLFneJu7GncBc2+SUcyh+7dj1X4jjEXu+pGOR7iNbVqikLLzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wD//zs9O; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wD//zs9O"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ff58318acaso3787471a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 14:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746222689; x=1746827489; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=xuMrCSQLCVm3rK1Z/M2Y8ljgy1BUHkh9BuXdAIH55U0=;
        b=wD//zs9Od0fk/M8vUPqNfa7tymOClDvngp9LxY8jqYE7BzG7xnIe6qssmh/PWcjbdx
         TT4qT1c9bccHGUlZIQD7Djqc3TWLziYRy3CFHUPSa8dVhjjIS3+1gdqcZ3LGxNxQH/qq
         su+0FJnYU8en3hp8K6APDx2mS35GVSVveYMHUDc6swtzpEVXJVGMEklggbxspvbE0/52
         twi7MrxS06f6czu1uNQRmPFuCGygKAEOEu8lcoQ2mu03t40xnfiB0l77jCX5/hn37b5X
         RsL3uJdxIZX/Nyo3/GdVepZADoYqji+nPnkmVQkH1j3FpnIGf/0K4P1GwCgKULwhYFO6
         yGJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746222689; x=1746827489;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xuMrCSQLCVm3rK1Z/M2Y8ljgy1BUHkh9BuXdAIH55U0=;
        b=ExIjHpdxQaU/BVAr/3WtAw+bB+r7lJfJ+H2r2B7eSBwfbvgOwNH2NMRmF3PME9QdfF
         8hmZRqERX01YyG5SJAOENP4goI49BOwbVsVoG8D1ML1uRa47Xivwhqzv0woEXJyJPOSx
         Lz6qBO69fcH8aP3xAF9ILHu69d9ev1swGw9/I+cC+9wR6UXjB4nIoOcYRfVgc1tJqhqp
         +O97ZlyFSjQEYCj4zd6XJiAKFhwsjXSIQS3Ccwu/Fr6N/r1jtdJVyAkIZMWNb2zoJgvs
         n/ZtDXXhKlgLYuhDCcq1EhV5LtKHy5ckIkIRnCXTFccQGdQjOp6Ilx7OOJ1MAoScTP6o
         7yUQ==
X-Gm-Message-State: AOJu0YwBqiAxG4gpgMQdOKHP84pn9VgOpeVmwnsepYZV+j8XvrgcTDmy
	UId1e8G8UoZckJ/uFTxmuRN6iSbf7v+/E09B/nOVHyH3Fh6SVSvwssAVv8Kbjx0lt6lcUmsNWSt
	nGA==
X-Google-Smtp-Source: AGHT+IHot8nmmRowbrr226toKHfu1fQGbiC4az4KlzIrJYJnyZxG2Id1cugNtpGKpX82rmlgpPY7cq4QJok=
X-Received: from pjzz16.prod.google.com ([2002:a17:90b:58f0:b0:2fc:13d6:b4cb])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:5404:b0:30a:4c44:cc05
 with SMTP id 98e67ed59e1d1-30a4e5ab0acmr4754053a91.10.1746222689088; Fri, 02
 May 2025 14:51:29 -0700 (PDT)
Date: Fri,  2 May 2025 14:50:55 -0700
In-Reply-To: <20250318013038.5628-1-yan.y.zhao@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318013038.5628-1-yan.y.zhao@intel.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <174622239486.882502.1450694184969543673.b4-ty@google.com>
Subject: Re: [PATCH v2 0/5] Small changes related to prefetch and spurious faults
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, pbonzini@redhat.com, Yan Zhao <yan.y.zhao@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, 18 Mar 2025 09:30:37 +0800, Yan Zhao wrote:
> This is v2 of the series for some small changes related to
> prefetch/prefault and spurious faults.
> 
> Patch 1: Checks if a shadow-present old SPTE is leaf to determine a
>          prefetch fault is spurious.
> 
> Patch 2: Merges the checks for prefetch and is_access_allowed() for
>          spurious faults into a common path.
> 
> [...]

Applied 1-4 to kvm-x86 mmu, and patch 5 to fixes.  Thanks!

[1/5] KVM: x86/mmu: Further check old SPTE is leaf for spurious prefetch fault
      https://github.com/kvm-x86/linux/commit/ea9fcdf76d3d
[2/5] KVM: x86/tdp_mmu: Merge prefetch and access checks for spurious faults
      https://github.com/kvm-x86/linux/commit/d17cc13cc484
[3/5] KVM: x86/tdp_mmu: WARN if PFN changes for spurious faults
      https://github.com/kvm-x86/linux/commit/988da7820206
[4/5] KVM: x86/mmu: Warn if PFN changes on shadow-present SPTE in shadow MMU
      https://github.com/kvm-x86/linux/commit/11d45175111d
[5/5] KVM: x86/mmu: Check and free obsolete roots in kvm_mmu_reload()
      https://github.com/kvm-x86/linux/commit/20a6cff3b283
--
https://github.com/kvm-x86/linux/tree/next
