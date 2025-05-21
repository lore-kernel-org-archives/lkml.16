Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7701322F15E
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 18:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747853784; cv=none; b=VbEgbccW6wmd1cxfnOmkzWnIbU9Ic6g8aH/uF+hJMMpzwbYBAHreklicU3sn/6g+2thacj0jA1URCfbG/2/2XFv2v9Lbt4idASWQyIhJHj36Dm7rHP1sGd/wdLQzgZtboArFcHM96+orTTxY9CZV7EjDvmlBP/qKyfDi0Ezuymg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747853784; c=relaxed/simple;
	bh=bGPSy0+YD6cQHaXx8Ue0ONJh3Y+wNW+bjWa2dogEwyY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PKqPyX1MnLUUkt40P9AfBZT81QBdaMCJeK/uYsEyNOGC/+aEy/luGCEZ+dvZ/XijGSmSZJblRXAE5bOBkxCpDGrkQ86k1Otq7sbEkV4IStMGK/oxkXScfsMositteXPPvwPFTa4Z4/W6aUsNyPjV5pC91piQr3k1v9rwb0WyRVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=bJd67sRU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=uNULY8bn; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="bJd67sRU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="uNULY8bn"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747853780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MWjvfPcrcsP2Spen+qbA9dIQii5siDbTqhdBm82QdAs=;
	b=bJd67sRUWc64BWBaToxN2dRsqspUaqJRbzE1MENkDjsNQwhjAJqb4+MvNd7xFIntKTG9rh
	6ye3j0uWa9WRBK3wetekil9CvIuKKg5Alm38io2u+eho3k5RaTWAi/U4dhuwlRoDwZNuD3
	jrvOoWUe2y0seCV6Ztl12bWDBl1/heT+HDiotNIj5J11d5+n1g+1xlrm7SLMqmY24wtOEd
	tNGLtjUSGwzyeNWe4YhHQcsjydED98PV3DYopiPFtRNqLgBxyFuOoZxUp1UKqnLnul825+
	9JIOw7VIy1ZDdCRcDOsWOhhirk6JP9v+T/R57JrNVickJUrlDFVDmoFcqNamww==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747853780;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=MWjvfPcrcsP2Spen+qbA9dIQii5siDbTqhdBm82QdAs=;
	b=uNULY8bnHq3Hi8C8G5x5m4wZoF7H7flbzjIxBhclO9+OAw6Re1UdhOJiByck6N4yoeVcXK
	CNBWw416aC+fL6Cw==
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, "Ahmed S. Darwish"
 <darwi@linutronix.de>, Ard Biesheuvel <ardb+git@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Brian
 Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
In-Reply-To: <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local> <874ixernra.ffs@tglx>
 <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local>
Date: Wed, 21 May 2025 20:56:19 +0200
Message-ID: <87sekxrdws.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 21 2025 at 20:11, Borislav Petkov wrote:

> On Wed, May 21, 2025 at 05:23:37PM +0200, Thomas Gleixner wrote:
>> Now what about software defined (artificial) feature bits including BUG
>> bits?
>> 
>> We still need them and there is no reason why we would replace them with
>> something else. But, what we want to do here, is basically the same as
>> we do for the real CPUID information:
>> 
>>    Create and document real artifical leafs (there is enough reserved
>>    number space in the CPUID numbering scheme) and put those into the
>>    CPUID database as well.
>
> I presume here, when the kernel patch is being sent, the accompanying CPUID db
> patch needs to go out too?

Yes, and the process is that the leaf/bit needs to be in the data base so
that the headers containing the new leaf/bit can be auto generated.

>> This also means, that we switch to a model where the software defined
>> bits are not longer subject to random introduction and removal. We
>> simply keep them around, mark them as not longer used and introduce new
>> ones with proper documentation. That requires due process, which
>> prevents the adhoc messing around with feature bits, which has us bitten
>> more than once in the past.
>
> Right, so in this particular example with la57, the CPUID bit which denotes
> that the hw is capable of doing 5-level paging is needed only during kernel
> init so that we can know whether we should even try to setup 5-level paging.
>
> After that, the rest of the kernel will need to look only at "our" bit which
> means, 5-level is *enabled*.
>
> Because that's what the code cares for - whether it is running on 5-level or
> not.
>
> And 5-level *enabled* implies 5-level possible. So that first bit is kinda
> redundant and perhaps even confusing. That's why I think merging the two bits
> simplifies things.
>
> You're already basically doing that with proc="false" but it should be even
> less visible. No one besides us cares if the hw is capable - users care if the
> feature is enabled or not.

Kinda, but you're conflating things here. leaf_7.la57 is a hardware
property and leaf_linux_$N.la57 is a software property.

Of course you might say, that clearing leaf_7.la57 is sufficient to achieve
this.

But in fact, "clearing" the hardware view is the wrong thing to do from
a conceptual point of view. The hardware view is "cast in stone" no
matter what and having a clear distinction of a separate software view
will make things way more clear and understandable.

I've stared at code for hours just to figure out that there was some
obscure way to end up with a disabled feature bit.

Having a software view in the first place makes it clear that this is
subject to a logical operation of 'hardware capable' _and_ 'software
willing' instead of some hidden and obscure 'pretend that the hardware
is not capable' magic.

Clear conceptual seperation is the only way to keep sanity in this ever
increasing complexity nightmare.

Claiming that saving 5 bits of extra memory is a brilliant idea was
even wrong 30 years ago when all of this madness started.

I freely admit that I was thinking the same way back then, because I was
coming from really memory constraint microcontroller systems. But in the
context of Linux and contemporary hardware complexity we really need to
shift the focus to comprehensible concepts and strict abstractions
between the hardware and software point of view.

Thanks,

        tglx
