Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF002973DF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 23:24:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745623483; cv=none; b=X139peunE85h9USVEnYeTinWKb1RD4HQTyPQ86//Nfb8bfJGWqRvuG9ZebGr56S3ai+jdd03lNQS2viqyYO5RDhs+ACfSpDL7p3SAZNAlUNi0P1W9770u61VWoJPDUfNUqg1vedIMHTuvvIrMMtwHkbjxpHqdLJ8kf4GWk49UlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745623483; c=relaxed/simple;
	bh=nVDQgzk9MTWYJbDcDF++FdR8xhDTEC2J6wgBtjXqDMY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jfulbTUdGSxWcH3SvTkqgXqIhjseI+swIuHAaYnq3J/pT3DV3LaGYCHDpDPZ24BC0Uz5/ci/bdmADalPTuvCzqI4cLpfUgOxL0L+Kj+yxRP6soeWeWT8CKJKQBxTHiohO9x/wJi1SgBr6Oo/N72oQ3KrbdS+pltxpH2zsFaHqas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=skD1XPuC; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="skD1XPuC"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-309f0d465bdso3037329a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745623481; x=1746228281; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=5TIotqybJfVVtqD0mPHQ8iXkDld4uBjHXDVACnmlQXU=;
        b=skD1XPuC2DJWDQ7nb5Vn4j5i2cm2+4L2pW6GbmBnJkedvq2CxevHn1uRld3BMaQFGA
         G/iDhaFz45zTXbqmFmShVzML3yyWYhDhiWn5sSljMsaDDRGWY4cw4y2ppRQ0ttjl/vXP
         NOyW67S258tKNFRp/OxUnUDU3nhLSQs6zsNnnSMnmvZtxWAAzv2AK8Hp7yJ2AvkFIldM
         Be8Q/82h3TMhCCGpg+mHPEs6JfmWC5qd83Ckx5rVUSEOGTP/w/r6jwg8pz4RHMJXrgZf
         taQBKOPnI5lv2/sgPKZwDcowCOtWbJPggNGkc429V10WJVqdwtWp1FMk81TM00fuUzrZ
         QNng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745623481; x=1746228281;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5TIotqybJfVVtqD0mPHQ8iXkDld4uBjHXDVACnmlQXU=;
        b=G+Cpd/HuMb9GY0IE8001/gkqUOLr9TNzAnE74d1zKJu1fa7u6WfuXZVf3Lc0e9EYiE
         cppBkFNFGZhr3Yes/UmwG2QztYTAXjnzpgp+cbpYCyfN72OPWOgsQLWxyJ3UvVPjrrB/
         lr8PphDBPsikYSOc7xKaJofrVfLP+Zan9C2B8jQ7h0l5rBW0brXT0fJZuxIMn/CKgcfH
         KWSVxXBpceOW9QsNySV/fdpYh2TfjaGhOrYu9p5XxP7Kt66rpQjFhv1vdROoeHWEnw9q
         sJxepHC1/TJ/gJZbVc/x8xsn/VaJkVL89hjDyE7H7vGn3Jpbwm5bhlacxPJjbxtYX2Fp
         KmEw==
X-Forwarded-Encrypted: i=1; AJvYcCW6MoK8rlVddIBZc45bmjz5Rl3J7Fz7hu3Z4+4MAY8uIqtT4SN5AiOQMUQo0wGESr78X0EOsll4RmJR2mo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9SDO7erDYkFYfx0HSK6ybq7rD35w2gC3ASOvk0xwop9+LIN64
	/uT1kxfwyKaLgTsZ5ZjQxmWZwDnBlmgZ0dYnhq099QGrysZ0+jaZ0j1bFE03JB9TLyuvvDJqJNU
	qdw==
X-Google-Smtp-Source: AGHT+IEU/t1KcpBVlYbsUmO35tg/tIo19v7ZgxfdP9bHjbn+PFIJICTxz9CCXgqmy5TxepN6ZZT3PzrH0As=
X-Received: from pjbsn3.prod.google.com ([2002:a17:90b:2e83:b0:2fc:2f33:e07d])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:7343:b0:309:fd87:820e
 with SMTP id 98e67ed59e1d1-309fd878b25mr2455088a91.26.1745623481717; Fri, 25
 Apr 2025 16:24:41 -0700 (PDT)
Date: Fri, 25 Apr 2025 16:23:26 -0700
In-Reply-To: <20250414081131.97374-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414081131.97374-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.49.0.850.g28803427d3-goog
Message-ID: <174562168599.1002600.6563774484304415147.b4-ty@google.com>
Subject: Re: [PATCH 1/2] KVM: x86: Use asm_inline() instead of asm() in kvm_hypercall[0-4]()
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, x86@kernel.org, 
	linux-kernel@vger.kernel.org, Uros Bizjak <ubizjak@gmail.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>
Content-Type: text/plain; charset="utf-8"

On Mon, 14 Apr 2025 10:10:50 +0200, Uros Bizjak wrote:
> Use asm_inline() to instruct the compiler that the size of asm()
> is the minimum size of one instruction, ignoring how many instructions
> the compiler thinks it is. ALTERNATIVE macro that expands to several
> pseudo directives causes instruction length estimate to count
> more than 20 instructions.
> 
> bloat-o-meter reports minimal code size increase
> (x86_64 defconfig, gcc-14.2.1):
> 
> [...]

Applied patch 2 to kvm-x86 vmx (I'll let Paolo grab the guest change). Thanks!

[1/2] KVM: x86: Use asm_inline() instead of asm() in kvm_hypercall[0-4]()
      (no commit info)
[2/2] KVM: VMX: Use LEAVE in vmx_do_interrupt_irqoff()
      https://github.com/kvm-x86/linux/commit/798b9b1cb0e5

--
https://github.com/kvm-x86/linux/tree/next
