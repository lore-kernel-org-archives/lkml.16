Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35E0413D8B2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747943941; cv=none; b=jHH9R5KTI1RhZjFmw6yEoQxgtJzpYNii40rHYifCj6k4kF4Z5vrzTsrhZhNXbaYmxS5cusBQ3hU3sY6NoxKAAu8EbzgSOW78TKFT+nT/jsICmavImuXsm79y8qR0PS6+cUN400UHFn/TiDqL4TWkUW7RN3ASzRCGR+kCBTKm1WM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747943941; c=relaxed/simple;
	bh=XpCZh8im7mQz3sPF6YHTvXtYV6egSBThN/eGnFtY1e0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=K1T+wwYpnIJtvDx/RJALAOpftJ8LmXHHvxvF0H/iOSsHHaqEc+sdQt0Exb/2HGllQfeOgP017h9TJb6kTzaYulbJOmIuo2zohTprLBgk+pVeqzD1w08kkPjJ+R77oj1vO5CYvFSjTI2Kifagb8TJzGEip2C9CvDOmLhUndB3aMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Xt/5SyiQ; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oV9Zueag; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Xt/5SyiQ";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oV9Zueag"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747943936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EN8YX7a/wwUvQts32gfKjaxrewAJeisrGAlcdg2eing=;
	b=Xt/5SyiQcXke7dyck4zJ8bQuumDBS9i38SJeOiGwY5HqUrFUbB+odBq+oEd+aU47W5nPSA
	rDdwJ825gUNaw1W05fYl2bBba0hkXZ+2/UTyvYruVn7NxF+6jTdW7DJSELyjTJRmm3r5Wa
	snqMcITO/NNI+ApdiP74yhKRmmJZOzxKkgjjKENRy8/xdEIZYDHwtajGk+r41Mq6TCQwGq
	0BxZAhP4C9WeimEHu9ohIxMnFBJlIBNDe4GS7Akxmy2BpiNHyd80RkSwa90TqfEIdfOnEc
	ygrpPZolYvnK7FOa7dn9eJa/4WCginr4fMLbkfSTogrdQ1RFM3vnVkKTVr3gsQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747943936;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EN8YX7a/wwUvQts32gfKjaxrewAJeisrGAlcdg2eing=;
	b=oV9ZueagnbslUNZ3FsvFYeMDUDE37tRerM4N+lt3yfu4D1TTTf7UBXbbncRxYxjX0v/VsD
	UQPHQuX7KBYvhyDg==
To: Sean Christopherson <seanjc@google.com>, Peter Zijlstra
 <peterz@infradead.org>
Cc: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>, "Ahmed
 S. Darwish" <darwi@linutronix.de>, Ard Biesheuvel <ardb+git@google.com>,
 linux-kernel@vger.kernel.org, x86@kernel.org, Ard Biesheuvel
 <ardb@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Brian
 Gerst <brgerst@gmail.com>, "Kirill A. Shutemov" <kirill@shutemov.name>
Subject: Re: [PATCH v4 1/6] x86/cpu: Use a new feature flag for 5 level paging
In-Reply-To: <aC896zTw_z7Bx6I2@google.com>
References: <20250517091639.3807875-8-ardb+git@google.com>
 <20250517091639.3807875-9-ardb+git@google.com>
 <20250519094038.GIaCr8ltHvLBYjk8iI@fat_crate.local>
 <aCstaIBSfcHXpr8D@gmail.com>
 <20250519131944.GCaCsv8A71vn21AB1W@fat_crate.local> <874ixernra.ffs@tglx>
 <20250522075553.GG24938@noisy.programming.kicks-ass.net>
 <aC896zTw_z7Bx6I2@google.com>
Date: Thu, 22 May 2025 21:58:55 +0200
Message-ID: <87h61cquww.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, May 22 2025 at 08:08, Sean Christopherson wrote:
> On Thu, May 22, 2025, Peter Zijlstra wrote:
>> On Wed, May 21, 2025 at 05:23:37PM +0200, Thomas Gleixner wrote:
>> 
>> >    4) Drivers having access to CPUID is just wrong. We've had issues
>> >       with that in the past because drivers evaluated CPUID themself and
>> >       missed that the core code had stuff disabled.
>> 
>> I had this patch that read the module instructions and failed loading if
>> they used 'fancy' instructions. Do you want me to revive that?

Once we have the new infrastructure in place....

> Unless you want to grant exceptions, that's not going to fly for KVM.  KVM makes
> heavy use of CPUID, the consumption/output of which is firmly entrenched in KVM's
> ABI.

If there is a full in memory copy of all CPUID leafs, then what needs KVM beyond
reading it from there?

Thanks,

        tglx
