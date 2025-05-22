Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5736826D4F0
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747952160; cv=none; b=sglbrPTkuCftOHShC6GTWmIsaJ/kehWBsJXkngCQupRfWshwAjHN9AAasdwEWSeTCn3JozXF0HkJhOJbTk3TJ6HehAXTMrF4pU3kj3LVTRoTF0SYgJ6nTKPvSLRThzkYviUGoBRQn6GFBtZbmPzohHKbm4NXtCUpK8sv7mmJeaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747952160; c=relaxed/simple;
	bh=LW+MUjjgFxmY4AsGxQLPysxlArJG7cv+3/2gt31yCqc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mYmHcy0xlOO+Zr1K09PaXx9D4uEAhVLZout+vdZ9Fpq6HQWKnkorMclJt9xCdy5BIEf80BxD8sl7ZPcOrn6dmX50KKa0JTWDKYcfQLddWe49Qo0XuuErEOvo7hQUnJe9wJIlWFd/V1FH644gTkUN45Q2BXJQn1pZDk8ATgyj7RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=na0UG0FZ; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="na0UG0FZ"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7394792f83cso6786686b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747952158; x=1748556958; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=XxUISslG9B59ofXzKWqHmNS0LqVEIEBut6Uu0RQ9388=;
        b=na0UG0FZhHKDWAQHpdT+p4WtnLWFf8u60KeDmVtKXtVdd3b+wiyBAJ64dh3OXNQeuz
         AoFJ9Lxp6+8d2rlbcA7PmlY6ez3pOwjvGeN7nr0Nr1Lkiv2WQDu6MWzlJMfZEBixMBJA
         mIADDFU806bnJ9IpH6Inw/zpCILgFwDw/5Knc8EKzIyWJ+ECnfnwSbLFmOURq8pCjpzK
         W/a0OsTEQN0H1Hq0BqlXHV+MV7ITnkPoTl4HqLdHDAds2F+iRrma1kkBP/Tkb9M45ff+
         1miODzCi6yQm+a/GnoLlzoY/xooc7d0LjHy7GfoH/KVklzP32xD0Rdk183mPnPt2VX6u
         ghsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747952158; x=1748556958;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XxUISslG9B59ofXzKWqHmNS0LqVEIEBut6Uu0RQ9388=;
        b=s4pPJGIsDjgT758LevkmVuSvScyhzATs+PA/NbNKJ+vY1+RwqbAq99Ga/HZw2siCPg
         DMLavCOzqmHiFKeKz96RwITL8oADUMF1VvbTqpHpZ2K9MnjjAbNRWE9xryZy9Y8P6/Y7
         b+xmDtvGmzVE1CEwzctgWVOd5u5Pu8tnnKnn15gZQ7r37D0PTSEhm/ywBD95VgU0OANJ
         /rc/OvRiiebEDULF/bPCzDT0qQmtTFg/UWoC9VCXbwKHZhvi65evYbOrpwg5FVm9V+C7
         Fxug0XPL2zXgJ9zQG2WnSSlcVirMjOaVYp2eE2ipWOpo2WHT5SwNEDc9sS4tWTThIWgP
         W9UA==
X-Forwarded-Encrypted: i=1; AJvYcCW/LAtveKugzIEnLfHMmZb9FpMW6em5CwNB1ld/yJuk6YiTxlhKtrbDeCzpSowCZf2nirlugZCNKcG6f74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4HUA0oRZOK4CWvMnZwse6Ppmdqh5XFTj1aqiRJWp0YtdbSlZe
	shOXWA38Plzq3oPGloxHDUZW05cA3YIW1xj1YB8NScWG1IdqF78i/mMXyTjjH+B0PVzoTQs8iD1
	rf3Vk3g==
X-Google-Smtp-Source: AGHT+IGyRULfTNKX9wKPHMVLGQE0IQU5Z1GV3srVw7WcCwXk+0qXNLGqzbMfgQlIwQ1yx9mkZyKSwWAhdiY=
X-Received: from pfwz39.prod.google.com ([2002:a05:6a00:1da7:b0:740:3f40:b53b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12c3:b0:1f5:6c94:2cd7
 with SMTP id adf61e73a8af0-216219f81dcmr37864857637.42.1747952158537; Thu, 22
 May 2025 15:15:58 -0700 (PDT)
Date: Thu, 22 May 2025 15:15:57 -0700
In-Reply-To: <87h61cquww.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com> <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local> <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local> <874ixernra.ffs@tglx>
 <20250522075553.GG24938@noisy.programming.kicks-ass.net> <aC896zTw_z7Bx6I2@google.com>
 <87h61cquww.ffs@tglx>
Message-ID: <aC-iHUcRmgYoE59E@google.com>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	"Ahmed S. Darwish" <darwi@linutronix.de>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 22, 2025, Thomas Gleixner wrote:
> On Thu, May 22 2025 at 08:08, Sean Christopherson wrote:
> > On Thu, May 22, 2025, Peter Zijlstra wrote:
> >> On Wed, May 21, 2025 at 05:23:37PM +0200, Thomas Gleixner wrote:
> >> 
> >> >    4) Drivers having access to CPUID is just wrong. We've had issues
> >> >       with that in the past because drivers evaluated CPUID themself and
> >> >       missed that the core code had stuff disabled.
> >> 
> >> I had this patch that read the module instructions and failed loading if
> >> they used 'fancy' instructions. Do you want me to revive that?
> 
> Once we have the new infrastructure in place....
> 
> > Unless you want to grant exceptions, that's not going to fly for KVM.  KVM makes
> > heavy use of CPUID, the consumption/output of which is firmly entrenched in KVM's
> > ABI.
> 
> If there is a full in memory copy of all CPUID leafs, then what needs KVM beyond
> reading it from there?

Ah, I missed that context.  If it's a truly full (e.g. includes the XSTATE sizes
sub-leafs and all that jazz) and unmodified copy, then it'll work.

If it's a modified/filtered copy, it might work?  I'd have to think/dig more.
I'm pretty sure the only CPUID-based feature that KVM supports based solely on
hardware capabilities is LA57, and it sounds like that will have special handling
anyways.

My bigger concern is cases where the kernel _adds_ features.  KVM's default
handling of features is to advertise support if and only both the host kernel
and hardware support a feature.  I.e. KVM does a bitwise-AND of CPUID and
boot_cpu_data.x86_capability.  KVM does opt-in for a handful of features, but
they are the exception, not the rule.  I don't see an obvious way to maintain
that behavior without KVM doing CPUID itself.
