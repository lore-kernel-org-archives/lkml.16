Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82C628F533
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 20:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747858061; cv=none; b=TYwUis3ocXiyg3RH93JLcHp5hbBDunrA0eQMWYvIGjzZ0Ox7R86zTyQ5lmIWnUfh2OgceqaqYbHpUE+j5w8oH02MrFYvg0BlPzQvzONWthHZZRH9wTryGVSmEN+ENIWINx26LrX6YssBDUROUsgl3hwV2mhScLV1Rklm/0DxdYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747858061; c=relaxed/simple;
	bh=yb4RyfahCLgd9JUQxRRBKeS2b5P1spgGT3FftlNWWqM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=cq29N0FlaOzifvtFLxi6N1CzRaJSedCZ315rJ9STGOHRm/aYf6+4ZYZ6uZOjMCb6gueESJvu4NzwttoY7Mk+lTgXbPPGOdrnEKcLDufAb6e0G8wLsfyJ3mGmTSDZgXdkTDxuGrpIBKYTBbG+bXp8LavkQeY+SL8iRGPpQvQXvx4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wbjBA2VM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=u3QvcBJd; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wbjBA2VM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="u3QvcBJd"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747858057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OOgBnC3B2liDmsdvhhy71yLQzCiTnV1Gk4hOEfVZRUU=;
	b=wbjBA2VMMJ7DrsDwgoElVUZEMIXfvvzjwUoqMdWNKTdOLSAlhEkiaCPWVcdTm1uw72uMn3
	CMs/JKBaJImpLyGJsIuOrKjTYEwO75wTZ0/vSnePXcuh3lYGw2fQObRffoXiot2AJcX8fe
	zwiBOiqO6JAJkididlRQw3l0FKm4OeGZlQHxTG1lKdnH3h5domWez7YNdrD18DwzV8WtfZ
	kH6NU6HuXrAXfA7nL1N0fdydxWbJ1iDKv+tb36fgc3zmP7mf5l8ICDJHwAXmupdtWCsNLr
	dJ+GAVyyOhlj0trscQ0HaelBLioB+09qhaXnbULEAZheR4LPXKDvnuicOBU6DQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747858057;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=OOgBnC3B2liDmsdvhhy71yLQzCiTnV1Gk4hOEfVZRUU=;
	b=u3QvcBJdQ2iGmyBTNyLR5QkWOyRMLS7n7rag+VtO8jI/wevVK79xZw9wsp+TOpso7CmX02
	UCY2GtN2hQ9ZxgDQ==
To: Borislav Petkov <bp@alien8.de>
Cc: Ingo Molnar <mingo@kernel.org>, "Ahmed S. Darwish"
 <darwi@linutronix.de>, Ard Biesheuvel <ardb+git@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Brian
 Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
In-Reply-To: <20250521194819.GGaC4uA6mwlMBoqDMt@fat_crate.local>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local> <874ixernra.ffs@tglx>
 <20250521181141.GDaC4XXW8BmtvJFy6a@fat_crate.local> <87sekxrdws.ffs@tglx>
 <20250521192930.GEaC4pmmpuktvClDxj@fat_crate.local> <87msb5rbub.ffs@tglx>
 <20250521194819.GGaC4uA6mwlMBoqDMt@fat_crate.local>
Date: Wed, 21 May 2025 22:07:37 +0200
Message-ID: <87jz69raly.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, May 21 2025 at 21:48, Borislav Petkov wrote:
> On Wed, May 21, 2025 at 09:41:00PM +0200, Thomas Gleixner wrote:
>> In the long run we really want to disable user space CPUID and emulate
>> it when the hardware supports CPUID faulting, which should be made an
>> architectural feature IMO.
>
> Both vendors do support it. I probably should do the AMD side. It is about
> time...

Both vendors support it, but it's not an architectural feature and it
really should be one.

That ensures it can't go away just because some hardware dude thinks
again that the three extra gates are overkill as all of this can be
handled in software ....

Thanks,

        tglx
 
