Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37F3A28FAA4
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:08:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926511; cv=none; b=aOotqLxmntIL4YnVvy3AaWdWjxB2Beugvbxwcoh9P+G4d5xAhiWKAxUi5mG/MApeODw5GIzrn/J7R/JPBAPT5Bv5c1mOb2zd2OCmnmKnnTDxkOiDBQRS7M7lYll/rtZU70yfiDmg4fgOLkdfptCczFvDe8rCK/oDJB2NKw7iVbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926511; c=relaxed/simple;
	bh=8Ri5WrICyPzPzRSsicf5C3pSlv1MhV9K/oJy5oyMHNI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wb9QuwzKP0G9zaVitxKXgHl2BrdFWzZsgSOT5B9ddKeSmSYMxxRq7P7Pwjic0cSOYbVCqoYLZkkls277JMgCjULDnWBNPrYqRAE7QsAIDD7uogZfxq+IkdCifbYwwlTeGC7MFBmq1Sdq+WXdBVX/W+qOnwtJdpE3tMxcl5fUcvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B9DGfCRm; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B9DGfCRm"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b0f807421c9so4982881a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 08:08:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747926509; x=1748531309; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=BEBLuBqQXhmi2BMHkf4ov7bmteqaGfMWaLVMUxnRkMw=;
        b=B9DGfCRmYe8cE4pG1R9zlVTMVBBZ9hO17rJ7nyTmES7bSxCuElRt7PDOKQ9zJ0sD2b
         0egua0qxIw8ug9me4ZjIa4rT1aT4tXkhHu5jAx5nY69d4nolQR3OVb6ZSF9cxImczEhi
         vDABZY0B9rS5EYwP2Hxgm4qjD60QmYZi8N37yBdtIYXk12ZiHPLaIWxEtIsdrq23ssQl
         qpDoLRHxoGZICyBLiJqnoXpn4Ewo6KsE6VPhY6sMbCYL/PFrCQMTKNpy3BaWW7QABq4J
         vvTk+gsrkig8nDmrhEWoSru+iMlNnBXl5/n976TIKEeCRE2Eav05NJEPololMCWOlM1Y
         bD8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747926509; x=1748531309;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BEBLuBqQXhmi2BMHkf4ov7bmteqaGfMWaLVMUxnRkMw=;
        b=DHF9TTdDfaQbu6DmdBqtrw2RSSgIAbziCYB/p26jRZtQLPdh4jugTZtDQS+34/QQSz
         U+/GKG8c5cWQWnWa+g+djDDOKeccrPlRQVLblWTd0s52v/Wti63GMR+20Jg5RGvM1Hej
         YDdTzxZ1ptM9malRDmCczcvYITvHQTs/OKRj5a8kFKW3J5VXSt2zVL36LGjPGfG+L9gt
         NYiAmFJPd5sQQt/xp5W+tOBXakaUPsK+/aqJJx5ALk6wdMCIj2EXN5LOPD6GnLAn/6VL
         7ewDXqSo0QLETVApd8xM6+3QDQzY6n6K7I9YJu9vKRaX2A/1t5pLTuT5m5eo+30ryCZb
         CNlA==
X-Forwarded-Encrypted: i=1; AJvYcCWUF/5xdSoTDt5AmE3GVofIaPeXx7M+bFxWvdZyjQM4RmmQ4Ulohn4JCJ8wALXJM6bKHXv25ddFGteZSUk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1zcJV63lxg3M21gfajdaBqLa6uitzKnXC8U+B5urK4USGckvw
	Tj0SSU5ZcIeyMLoKzpQkAGgtHiDYmUwhcHgo9U3K8DlyJWv9rHFuTEbgnyFC3q0brnyC3/ibBMs
	uBaH7XA==
X-Google-Smtp-Source: AGHT+IHDy4N3kP+9w5FUQWlHqLiOT/W33iU0PkAntA2CZoYSEu1INy5wr5ahi5sgxuNbgy00fBvZ0NKZmd0=
X-Received: from pjbsp7.prod.google.com ([2002:a17:90b:52c7:b0:2fe:7f7a:74b2])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4ecb:b0:30e:823f:ef34
 with SMTP id 98e67ed59e1d1-30e823ff066mr30586885a91.23.1747926509468; Thu, 22
 May 2025 08:08:29 -0700 (PDT)
Date: Thu, 22 May 2025 08:08:27 -0700
In-Reply-To: <20250522075553.GG24938@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250517091639.3807875-8-ardb+git@google.com> <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local> <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local> <874ixernra.ffs@tglx> <20250522075553.GG24938@noisy.programming.kicks-ass.net>
Message-ID: <aC896zTw_z7Bx6I2@google.com>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
From: Sean Christopherson <seanjc@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, 
	"Ahmed S. Darwish" <darwi@linutronix.de>, Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org, 
	x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Brian Gerst <brgerst@gmail.com>, 
	"Kirill A. Shutemov" <kirill@shutemov.name>
Content-Type: text/plain; charset="us-ascii"

On Thu, May 22, 2025, Peter Zijlstra wrote:
> On Wed, May 21, 2025 at 05:23:37PM +0200, Thomas Gleixner wrote:
> 
> >    4) Drivers having access to CPUID is just wrong. We've had issues
> >       with that in the past because drivers evaluated CPUID themself and
> >       missed that the core code had stuff disabled.
> 
> I had this patch that read the module instructions and failed loading if
> they used 'fancy' instructions. Do you want me to revive that?

Unless you want to grant exceptions, that's not going to fly for KVM.  KVM makes
heavy use of CPUID, the consumption/output of which is firmly entrenched in KVM's
ABI.
