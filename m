Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E630B86353
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743618169; cv=none; b=ppy/r4TCI8LYZHO2/xCrUIeBOODEdu1uUsWgdfUG6z6ADg7bWKbgQZUprX38Afg2iS1IT4F6CgzbsoUiS9+FPdZP6sn1wAt9Jzx+xvH2SnfPaoYKP2Xszfv+8JQY7veJCnXe6T4HJaY04vapZBdvMA/MsU91wKSLdAGIcbegJGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743618169; c=relaxed/simple;
	bh=M0221jI8ZQn3bL+goohj0JybEXb7ypD/tqjSZY09GB0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AhaY8QISijec70/sK8d98I88ZDL6efiZDVuL74BpY/dbjy5N/fZkNB9HXCSDpH3Uz4sUT41WMB+F+i/8a7VjwskjubjbcDS5bDc9Ql8cDcBb+K7DqJX3Nt9Qn0xW/6GzNzySB+an1DQDXYYLoJ9KfppgzHdjzy6OsoChqlrpKF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=hajQQ3GB; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="hajQQ3GB"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=QbgdiGRV6+79Ma2eIzkm451iF9HtAS5xzGDCFptMIB0=; b=hajQQ3GB5VaJ8Eay1IPSgvJFyj
	TSi09XCx22HkJ9DaLSaiv8W9Zy6SS8mXDIGuTsMA4WywWnT3VWFpeQK5Iut+0ey4o4MSDR/VfS6HE
	0Oyo1OQVz+1rYi02uHVFUfYkIUMUHWa4D+DYnlvuv1dvsta+A8HgUF25NDpXSqHJ0MuvNJ9oaA2ld
	0UnFqF6qV8j2jfhux6ndEsT4T3brTTS+k2LEEf+jKf3rjxVYv1LCXWp+VpwPJ5Sm2WqnbZU+Y5TU/
	zwF4Y7aE1wk2IxDszXctlfHWNtoAoZmUo18TAh8s79YEAIsQZsPMEPKH4nwe2UX0Eqxvlc1vaUGqN
	v8Owf5fA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02ja-000000074iK-0XSv;
	Wed, 02 Apr 2025 18:22:42 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 6554430049D; Wed,  2 Apr 2025 20:22:41 +0200 (CEST)
Date: Wed, 2 Apr 2025 20:22:41 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Andrew Cooper <andrew.cooper3@citrix.com>
Cc: mjguzik@gmail.com, linux-kernel@vger.kernel.org, mingo@redhat.com,
	torvalds@linux-foundation.org, x86@kernel.org
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
Message-ID: <20250402182241.GY5880@noisy.programming.kicks-ass.net>
References: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
 <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com>

On Wed, Apr 02, 2025 at 07:17:03PM +0100, Andrew Cooper wrote:
> > Please make this a gcc bug-report instead - I really don't want to
> > have random compiler-specific tuning options in the kernel. Because
> > that whole memcpy-strategy thing is something that gets tuned by a lot
> > of other compiler options (ie -march and different versions).
> 
> I've discussed this with PeterZ in the past, although I can't for the
> life of me find the bugzilla ticket I thought I opened on the matter. 
> (Maybe I never got that far).
> 
> The behaviour wanted is:
> 
> 1) Convert to plain plain accesses (so they can be merged/combined/etc), or
> 2) Emit a library call
> 
> because we do provide forms that are better than the GCC-chosen "REP
> MOVSQ with manual alignment" in the general case.
> 
> Taking a leaf out of the repoline book, the ideal library call(s) would be:
> 
>     CALL __x86_thunk_rep_{mov,stos}sb
> 
> using the REP ABI (parameters in %rcx/%rdi/etc), rather than the SYSV ABI.
> 
> For current/future processors, which have fast reps of all short/zero
> flavours, we can even inline the REP {MOV,STO}S instruction to avoid the
> call.
> 
> For older microarchitectures, they can reuse the existing memcpy/memset
> implementations, just with marginally less parameter shuffling.
> 
> How does this sound?

Right, vague memories indeed. We do something like this manually for
copy_user_generic().

But it would indeed be very nice if the compiler were to emit such thunk
calls instead of doing rep whatever and then we can objtool collect the
locations and patch at runtime to be 'rep movs' or not, depending on
CPU flags etc.
