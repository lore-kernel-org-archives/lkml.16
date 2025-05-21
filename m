Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37C050276
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 19:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747856465; cv=none; b=WIP2PMRwDgZ4PvmUL0RIGgs2+wYdLQdNaaYsEbzaPVctbCUoYI8jaadRFMwNpYXhX+b9m8pr0iElJOalYQATYnHh1qu+AYKkTALuD+HkoaLRMjUdPUCHS1cLNqeIpEhmboJjsryA2AD618IeI0HWk7zWCtYYn/L1XSA4BmMTjw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747856465; c=relaxed/simple;
	bh=pBHC3Mjak2KciklMuFvJO1Y8WFtbtGJPLznHS4ZlJSQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bXM1KxlfNSAjMlnJCeq0AS2U4VCHZF0zq+NsYCnq7dG2p8KlCdwbwa4AEdqmwvFzXFtNEHI9tH7q0DJ3o2UEH0CJGUYT0EaMORMElf3rjT2Qc4p8MonRSU3oPh2h21EGQCV1WGvTzK9/K1AxdeJldOaVJ42TsFwqrj4jWsdoYes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=e52uj3nq; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FyW2LI5p; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="e52uj3nq";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FyW2LI5p"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747856461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apPcKnQasEGx/KZ5HwaleHwcwQsOKyGCUy9B7CyfDDQ=;
	b=e52uj3nqxG0SS8UC8m94TypDN1iU5u2l/Rj96E7C1QqhDYBq55oxiOoqus71j3BcCePSRt
	GamnlDQhqoTnzGAWksJ8q0cIsqR8dMr9HmOAAIAl3MyI4g3WOgX2XAvL63EvwE+aUyls0+
	bh6iYBjrZy3OkGdzNV6BQYBLnVq9oQ41+bb6Z88A80Q68SpaGesQbC39SYhzmA2NGQfD/Q
	WqCfVGfvzgfalFGpGj3nDbtia8RaCVe+yL3CLsiMsOVPqxrfIvqO3LKJ+Qz+BnkRHrUbvj
	huOXjsEMridM4Z9JeyJi0+zm+6ty+S7KXPkyy+lXAEVK67pO6jGujo9Rzn2H4w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747856461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=apPcKnQasEGx/KZ5HwaleHwcwQsOKyGCUy9B7CyfDDQ=;
	b=FyW2LI5pFIQNM2Z7iLUgKH1kcgBF5gm8fCJJ4unM8EV/K02kVXX7i2vhjf66sml/2uVljL
	OEEoAIVxAq36daAw==
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, "Ahmed S. Darwish"
 <darwi@linutronix.de>, Ard Biesheuvel <ardb+git@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Brian
 Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
In-Reply-To: <20250521192930.GEaC4pmmpuktvClDxj@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local> <874ixernra.ffs@tglx>
 <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local> <87sekxrdws.ffs@tglx>
 <20250521192930.GEaC4pmmpuktvClDxj@fat_crate.local>
Date: Wed, 21 May 2025 21:41:00 +0200
Message-ID: <87msb5rbub.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 21 2025 at 21:29, Borislav Petkov wrote:
> On Wed, May 21, 2025 at 08:56:19PM +0200, Thomas Gleixner wrote:
>> But in fact, "clearing" the hardware view is the wrong thing to do from
>> a conceptual point of view. The hardware view is "cast in stone" no
>> matter what and having a clear distinction of a separate software view
>> will make things way more clear and understandable.
>
> Right, if I had a time machine, I would fly back and define this thing in
> a whole different way: X86_FEATURE would be what the kernel has enabled and if
> the bits completely or partially overlap with the definition of a respective
> CPUID bit, so be it. But they would not parrot CPUID.
>
> IOW, I would completely decouple X86_FEATURE_ bits from CPUID and have all
> in-kernel users check X86_FEATURE flags and not touch CPUID at all.
>
> But ok, in another life...

We can do that now.

>> I've stared at code for hours just to figure out that there was some
>> obscure way to end up with a disabled feature bit.
>> 
>> Having a software view in the first place makes it clear that this is
>> subject to a logical operation of 'hardware capable' _and_ 'software
>> willing' instead of some hidden and obscure 'pretend that the hardware
>> is not capable' magic.
>> 
>> Clear conceptual seperation is the only way to keep sanity in this ever
>> increasing complexity nightmare.
>
> As long as we all agree and follow this, I'm a happy camper. Ofc, there will
> be confusion where: "hey, I'm checking the CPUID bit but the kernel has
> disabled it and marked this in the synthetic bit, blabla..." but once we know
> and agree to what goes where, it should work.

The fact that user space can check CPUID and make uninformed assumptions
about the kernel's view was a design fail in the first place. Of course
everyone assumed that nothing needs the kernel to be involved and all of
this will magically support itself, but that was delusional as we all
know.

In the long run we really want to disable user space CPUID and emulate
it when the hardware supports CPUID faulting, which should be made an
architectural feature IMO.

>> Claiming that saving 5 bits of extra memory is a brilliant idea was
>> even wrong 30 years ago when all of this madness started.
>> 
>> I freely admit that I was thinking the same way back then, because I was
>> coming from really memory constraint microcontroller systems. But in the
>> context of Linux and contemporary hardware complexity we really need to
>> shift the focus to comprehensible concepts and strict abstractions
>> between the hardware and software point of view.
>
> Right.
>
> And as said, arch/x86/ should be solely looking at the hw view and
> representing to the rest what is enabled or not. But I'm preaching to the
> choir here.

Let me restrict this further:

    arch/x86/kernel/cpu/cpuid_eval.c::cpuid_eval() (or whatever name the
    bikeshed painting debate agrees on) should be the only place which
    can use the actual CPUID instruction.

Thanks,

        tglx
