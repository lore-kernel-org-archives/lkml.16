Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210A2260A21
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 17:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739294750; cv=none; b=YW2ll8qrpctYek2kvL7kwtbnch93Kh/nSEuHlhoJd4UoBfxo1dlHlYCepfTN6+d07ng6VKDXP39NEN4ttcycR53D3xytxnmAa4agQs6neXYtrVqJi3IoXmQkUo4/2l8HmLQJrUcU0ovZcbebHElOhCnO1sPXJ7z4JKF/KBq5NLI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739294750; c=relaxed/simple;
	bh=yIyg4O5yYiMN7oIJCMQaW69afuHiK1Kltro4y0FMxoU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ciOqTxXnEDmRl3SpsB0QnqvKVIzARMYvQd79AsmAzw6la3QzZcdAb/3Ki+eW5YaDhcY7ee1R0ZWrYRj9lK2QHg7xSfRXiIGkjj25g2t7ms49ZuG4mVaJmSb/3FZKXznLhe+PMLraRhwb6YjsfkrIidLpBVkVnLQkThFghKgVXRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4h6VTmq5; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4h6VTmq5"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2fa6409c0baso8008877a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 09:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739294748; x=1739899548; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fehn8/FKPdzBZiJ7SaATTiqPDXAlgIYGKuuyWYqseyE=;
        b=4h6VTmq5YsASoFycDSK8sm3fFCJfqspqCGsBcpvc+KhpNyBFRQJgj+JC4canHcJ2nU
         o1B6uRMedbeP+teFkRkYRlHIRahMiPhUc1qVXJMfRh0l/Tioav37v9pSpbDKjwlfCwS9
         myi0XYJrguCke3qGCoJJOPocswp1Zpf+d/hH+EASs6Sr/mb8RJj6zYwo7lCW3s2D6MQp
         3wRnAQAufckzdkCQbzjvElKcZqP2Cpe3MzAhkew46ktDi+TTAaUFrPILpPh1SgE7/dVX
         JjN1ns1RXL9HHwvkCl7Bx8UlGnTCTpbAG8mnusbD27ZvUqucCSmOFvey98Q6iNkk2Ivx
         bwqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739294748; x=1739899548;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fehn8/FKPdzBZiJ7SaATTiqPDXAlgIYGKuuyWYqseyE=;
        b=HFUGkcG0Mc6nWZHJL3lQjG/jAwlcQP/ZPMBtIYxgYr2bEjVl7rbZX20Aico4VsqfEe
         lVaj+eWr0dzzsLxb5qsSSjVzxDSc2X1yBMBPhYRSjSxD3gUXin1suQ6GIbNjRhEjt0LE
         KxupaxqwFAjysq1SLUUse6hUya0Rk5GlzO6ieebB0NfQeHo2I3u/+rzZI/fKM6OUH6AJ
         rLYkz9vRqMBpuaktT3VoVgXLxzvQ6S+nCt12uXBJLFoipqGHzQPwhwroQOztnjzc5Lr6
         r1UL7EiyjyNxO70KwE07SDQ6/2H+f8ZJHMdFuGTURUu70jvetTgPl1nsnA4DQp6Ksioz
         A7oQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpxH01gLDlnkJwNDtoTkjaxHFg3NoIwrSZDUSqb+CWpHPnBSzc6JGwlvr4UvAtE7bNDkEFWwPNFjVV9To=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTJ2LsXBNuoXFOnn7G8oJXeVvpRZ8ivYxYYv4y0IikVGg2G6RY
	wt/MYyZCYUme4dOqUQAjizgxjIHT+dvt9EZLxtzVXjOo03cNJ6D7+IyH9Zs+H21DIsf4BuUuRwl
	SFg==
X-Google-Smtp-Source: AGHT+IFueIXltnSm3F29jVZndsq5T+j40lmj4UcIsQhmLdRSEShGqUPy9fjOgqE9JAinoOmES588AgdHP5k=
X-Received: from pjyf5.prod.google.com ([2002:a17:90a:ec85:b0:2fa:1481:81f5])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:184d:b0:2ea:4c8d:c7a2
 with SMTP id 98e67ed59e1d1-2fa243db893mr28913562a91.24.1739294748442; Tue, 11
 Feb 2025 09:25:48 -0800 (PST)
Date: Tue, 11 Feb 2025 09:25:47 -0800
In-Reply-To: <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com> <20250201021718.699411-2-seanjc@google.com>
 <20250211150114.GCZ6tmOqV4rI04HVuY@fat_crate.local>
Message-ID: <Z6uIGwxx9HzZQ-N7@google.com>
Subject: Re: [PATCH 01/16] x86/tsc: Add a standalone helpers for getting TSC
 info from CPUID.0x15
From: Sean Christopherson <seanjc@google.com>
To: Borislav Petkov <bp@alien8.de>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org, 
	linux-coco@lists.linux.dev, virtualization@lists.linux.dev, 
	linux-hyperv@vger.kernel.org, jailhouse-dev@googlegroups.com, 
	kvm@vger.kernel.org, xen-devel@lists.xenproject.org, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="us-ascii"

On Tue, Feb 11, 2025, Borislav Petkov wrote:
> On Fri, Jan 31, 2025 at 06:17:03PM -0800, Sean Christopherson wrote:
> > Extract retrieval of TSC frequency information from CPUID into standalone
> > helpers so that TDX guest support and kvmlock can reuse the logic.  Provide
> > a version that includes the multiplier math as TDX in particular does NOT
> > want to use native_calibrate_tsc()'s fallback logic that derives the TSC
> > frequency based on CPUID.0x16 when the core crystal frequency isn't known.
> > 
> > No functional change intended.
> > 
> > Signed-off-by: Sean Christopherson <seanjc@google.com>
> > ---
> >  arch/x86/include/asm/tsc.h | 41 ++++++++++++++++++++++++++++++++++++++
> >  arch/x86/kernel/tsc.c      | 14 ++-----------
> >  2 files changed, 43 insertions(+), 12 deletions(-)
> > 
> > diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
> > index 94408a784c8e..14a81a66b37c 100644
> > --- a/arch/x86/include/asm/tsc.h
> > +++ b/arch/x86/include/asm/tsc.h
> 
> Bah, why in the header as inlines?

Because obviously optimizing code that's called once during boot is super
critical?

> Just leave them in tsc.c and call them...
> 
> > @@ -28,6 +28,47 @@ static inline cycles_t get_cycles(void)
> >  }
> >  #define get_cycles get_cycles
> >  
> > +static inline int cpuid_get_tsc_info(unsigned int *crystal_khz,
> > +				     unsigned int *denominator,
> > +				     unsigned int *numerator)
> 
> Can we pls do a
> 
> struct cpuid_tsc_info {
> 	unsigned int denominator;
> 	unsigned int numerator;
> 	unsigned int crystal_khz;
> 	unsigned int tsc_khz;
> }
> 
> and hand that around instead of those I/O pointers?

Ah, yeah, that's way better.
