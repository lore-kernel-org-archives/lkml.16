Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6C77213240
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:56:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749833766; cv=none; b=paFhQhJhe3LGT67NnnbDhjjGqZ+3txCnTFIn3EDF2C0fp6EOwacoxseOrr0geW/CJYucDksKJoDY9OpKls86YXvOtohlYJXLuOeQ/cHF93WjlzxWF3xsjoInXqdJFt8J37ya5rjqnLfjhkc63PM+MsFWC4g6dtJjZX/pGnH3R3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749833766; c=relaxed/simple;
	bh=LsQI6oWpW9xr0gFcEF8Mb/56TkWlRGyrAaZea5bY4AI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UFdDPaei8r8LFEZjeIhPK2NeVth+bB3vbQ/3T5IhioyVUvhqlUaou9i8Z3sIL5WF71SbyVu4KKsPEvAi9bv0EE7S3veTa97cbhwJ4mO1SJsy1WSJgaaeyRWuFiSI1Ofngd5lb5y3RdLj1/ai7Fp9Pd9O+rD+EFr1ApIi4j/Zfgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=cmE5a9bP; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=VQfd0ySW; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="cmE5a9bP";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="VQfd0ySW"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749833762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LsQI6oWpW9xr0gFcEF8Mb/56TkWlRGyrAaZea5bY4AI=;
	b=cmE5a9bPMq6Xnm4JdkckO8dGLlR+AsEUZkoWe/gkRslproQ8FVeRnnXP0Z4yjTNTHCyb7k
	YumM31WNIAOegqrNvT6TXtC69xfbMrEkwoBq5UYwzptRPEyaQ+PhhF5k0nLTv26KjkYyrH
	nnRTcwi0fdQH7E2PUhU6T0INb2gI/Bo+x13hPN55jBNolfvaHq/KyJKQJY6mrtnEo3pQSI
	3+srdIJs+1jhe94r86ydG6WI6eIsBx0WJmIPuvi3b/0oHbUnt6lVgfCa0E1WXRTTWK/a0j
	myYxVJsadNKEO5pJb+tByvK2b8F3TO6eMPuAqomqhHLbH7njj/IPGddUbREx6Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749833762;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=LsQI6oWpW9xr0gFcEF8Mb/56TkWlRGyrAaZea5bY4AI=;
	b=VQfd0ySWXuqbF7NU4r/dG9H8T/LJTcq91j/jgvQfQ44wycBlSVYKUFh07Yo1y6VuOGFEvs
	ylOqRg8Eid3cUMAw==
To: Yury Norov <yury.norov@gmail.com>
Cc: I Hsin Cheng <richard120310@gmail.com>, linux@rasmusvillemoes.dk,
 jstultz@google.com, sboyd@kernel.org, linux-kernel@vger.kernel.org,
 eleanor15x@gmail.com, visitorckw@gmail.com, jserv@ccns.ncku.edu.tw,
 skhan@linuxfoundation.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [RFC PATCH 2/2] clocksource: Use cpumask_first_but() in
 clocksource_verify_choose_cpus()
In-Reply-To: <aExR9fLgCNHOaBMS@yury>
References: <20250613033447.3531709-1-richard120310@gmail.com>
 <20250613033447.3531709-3-richard120310@gmail.com> <aEuw7ls9hieUv_Ox@yury>
 <87ldpvsyr8.ffs@tglx> <aExR9fLgCNHOaBMS@yury>
Date: Fri, 13 Jun 2025 18:56:01 +0200
Message-ID: <87v7ozpom6.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 13 2025 at 12:29, Yury Norov wrote:
> On Fri, Jun 13, 2025 at 12:48:43PM +0200, Thomas Gleixner wrote:
> At this point it looks more like a lack of professionalism rather than
> an evil will, and I hope he'll do better next time.

Indeed.

> This doesn't mean that I revoke my NAK, or willing to give him any
> credit for this work. But I will review and take his patches in case
> he'll send something valuable to me; with reasonable precautions.

Fair enough.
