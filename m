Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67CC1A3145
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 22:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745620652; cv=none; b=atSGdfvG0nWyn9HxBghykjEy+o7i2pi/MTj9FHne4MmB/5TAsc90qcxPrAcRzdHhHP2e2kNO2ytbS/+tFs6ZirKCX/lcVzwwUISLBwOB8Q9t6qmdEO57r57sPJ+4cWNsRC56piov/ZTh0mia9YmmkZVIGww4PmDoMM9tVgCs+xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745620652; c=relaxed/simple;
	bh=3KArTu/2RUkabCmBtv0e7fMu9ZeDP06C6FtALBblSxI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kUJ5qxifoTUuWqktrcUuE2ZeaatPz/ctcTlhsNgIUPIvpQz0YxDkTCAlIdPVauHcWWjSh6z8eYX2v0suCCYqizbtgnVXipb7q9WYT0RDoQAH2w1w+dfQdPfHPyIQMToBvuRxFulzv4WpcKVNYdHj0m41bQSIuKxqbcKmAow816o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=t+DQ0tSt; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="t+DQ0tSt"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-308677f7d8cso2511560a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745620650; x=1746225450; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=4wtD+GeTJ9u0QHb0+YR6eCa58uhDG2aJS2glA/Qc9l0=;
        b=t+DQ0tStN9s7v/HazE8xr5ZnphR2BzFtr+Dk4ApcPzKxpnLTwi94rAtfg4jkgap3oN
         f2imSHiCqfvIf/rVX1gDlkMIs/5cFsrh7ayV7jbwXzE5yxpPyk8CxnbeNWp4g6UACvIH
         PAnJMc5mQubHaW3MUbZu63I5RZ5VZAdmBc5rhTWXjrD1FimC4HSG5wX5dRSyT1BqYX5l
         bakYB3oECrnb67N3+wbb2GqdahyvISq+4jCINFzPc+LVekX1XeRhvai5F63l3SW32IiG
         mqLa5hY2h4iPb/A/ydGnBCQtCSZzmdkh/fsBNydX0RQmyFB37nJrWJo01wMQ0AS1Xxgu
         HQLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745620650; x=1746225450;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4wtD+GeTJ9u0QHb0+YR6eCa58uhDG2aJS2glA/Qc9l0=;
        b=Dc+96AedsJ23J0qyI4sg8NhER2KO+tXk8A5jxiVmOlnrDXbmX2TPgThwgwiU2Wf94U
         DxCXH/4rPTtGjKeEOVGIdxHEo3BHJgE4ICbc0sGSUOzGy5HvD7Gnr46EWVkBvnw8UGLw
         N9kMyUvl1dL5mWWo21+c1ulkd0LBMBaeXxA/JVlHa+LYkswIQ+ch+enzMay2xMFiQzNN
         s6ijGnA9MZHhZnZVBIBi/nI1ZY2Ku0YdufC6cAX2JA3POl6alUxZmjjQXeTuufX5cGbq
         bcRg6bfCdWf16CnX3MND9oSyDYIXdGcnUA4TJkHKUukJF9Kpe9hV4XCHy2GrM7q4xjEE
         SooQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNzublEiXWQoJQ/vgfEwjTIeBrr6RXQ9ponM2Eoa0nhk5AmBBSo/jt2dpRco4kF0IYvG3+u6Xmu5z4GL0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyiwksboQ+A4B3B5xpvZvPvIeC0UWog86OQ+qtyb/qb1uENjTv
	rMjdy1L4lS/7nCVQbBbXq3gJcLpIHd9yAKPr8uQWn9PMF4U0Ra5YR5Um5PPCpluxUHgqR3+JzHb
	1hQ==
X-Google-Smtp-Source: AGHT+IGgiNwVkXSP9zfX8Bwz9AFDrYnzhJff3zo34deIREPzgpgi0hqQsE0ginF6C31hQ2DJIXsWXGg0zEc=
X-Received: from pjbkl16.prod.google.com ([2002:a17:90b:4990:b0:2fc:201d:6026])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2810:b0:2ff:502e:62d4
 with SMTP id 98e67ed59e1d1-309f7e8ec70mr5160431a91.32.1745620649938; Fri, 25
 Apr 2025 15:37:29 -0700 (PDT)
Date: Fri, 25 Apr 2025 15:37:17 -0700
In-Reply-To: <20250221163352.3818347-1-yosry.ahmed@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250221163352.3818347-1-yosry.ahmed@linux.dev>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174559612575.886958.13255435526046364721.b4-ty@google.com>
Subject: Re: [PATCH 0/3] Unify IBRS virtualization
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, x86@kernel.org, Yosry Ahmed <yosry.ahmed@linux.dev>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Jim Mattson <jmattson@google.com>, 
	David Kaplan <David.Kaplan@amd.com>, kvm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, 21 Feb 2025 16:33:49 +0000, Yosry Ahmed wrote:
> To properly virtualize IBRS on Intel, an IBPB is executed on emulated
> VM-exits to provide separate predictor modes for L1 and L2.
> 
> Similar handling is theoretically needed for AMD, unless IbrsSameMode is
> enumerated by the CPU (which should be the case for most/all CPUs
> anyway). For correctness and clarity, this series generalizes the
> handling to apply for both Intel and AMD as needed.
> 
> [...]

Applied to kvm-x86 misc, thanks!

[1/3] x86/cpufeatures: Define X86_FEATURE_AMD_IBRS_SAME_MODE
      commit: 9a7cb00a8ff7380a09fa75287a3f2642c472d562
[2/3] KVM: x86: Propagate AMD's IbrsSameMode to the guest
      commit: 65ca2872015c232d6743b497e3c08ff96596b917
[3/3] KVM: x86: Generalize IBRS virtualization on emulated VM-exit
      commit: 656d9624bd21d35499eaa5ee97fda6def62901c8

--
https://github.com/kvm-x86/linux/tree/next
