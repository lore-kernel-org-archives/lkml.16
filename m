Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F7E194094
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738875894; cv=none; b=X6tnTWXWdY2lbg4OS7WS8loQK9OtEdTY/T6BtpoH6FoaHnDwz7bGLv/koXcPsOQINk4WviFSUQ6pjeU11z2U4GMxiaq0fwqPkQL6tYk8f4pLCsyBuhU7/v4v2ojU2ziAhqmbgvkR+TbscSNF81Mwinll74M2Ru1cwOh81FcF+cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738875894; c=relaxed/simple;
	bh=pb7/XNdnnK1w6FtRI4yQZQ+u+eWUBHpqaDTyoqm55zQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=OEpYmtTQ7PqPJ8oxY/K2wYLGmSHvsx0YMKTHA/w7ZE4wh5309I2TK0CTX8q/NVMVO5iu2eBWFR09qNHywlpRwuoNyg6GH63rrvRWwj7az4I6sX7OBm4o0NuUADvH8TehCrQr+GrthEwQAfondVk9PxIQPGrMuPMUnzo0V5Khfh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=oyq03uhI; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gik5NJWq; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="oyq03uhI";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gik5NJWq"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738875890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xuy5F8jBgNhp7rFb6zzHIopTNAT5p6ks4ffzDKISCIw=;
	b=oyq03uhIP0ea05YK9r2CM0CfdI6XiLvBiP+Kj8Ooyx4eVMj9b1B0U+DFzPTKtyX0eB/oMs
	PsZOq5b3n3SbH9hgC9S1z9xTzUKT76rpfW8KH7uYdG2+QujZwiemZixBSrATA6usoSoL4p
	YLgYQGnfWW4+6UI4NSEozFZYGK70Ap11B+uAuOvnAiQlkSUMc90ekdhFxQaif3xV3e/gfd
	Ku/Tl6DjGghtH0TJoqeb0bBGuGLd1vvDAp10jR2NWib2PYneAVeh6lTTJL7JctIT0xwZ1b
	CkGApYt0p/nSX32WaCkp+/rQVZfHLBd1QrzsditEDsSooSjkWtG1W9YgIPp0Gw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738875890;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Xuy5F8jBgNhp7rFb6zzHIopTNAT5p6ks4ffzDKISCIw=;
	b=gik5NJWqzoDEakMH4aPaD8KRWjt82iQnixzU91Jq23RNOe8yvZwpy8APwZB9r3qtZ24qsr
	GnJkxyIUcTkf1WCA==
To: Oleg Nesterov <oleg@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, "Eric W. Biederman"
 <ebiederm@xmission.com>, Frederic Weisbecker <frederic@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Mateusz Guzik <mjguzik@gmail.com>,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] exit: change the release_task() paths to call
 flush_sigqueue() lockless
In-Reply-To: <20250206162301.GC5209@redhat.com>
References: <20250205175136.GA8702@redhat.com>
 <20250205175159.GA8714@redhat.com> <874j17nk11.ffs@tglx>
 <20250206162301.GC5209@redhat.com>
Date: Thu, 06 Feb 2025 22:04:49 +0100
Message-ID: <87o6zen5se.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Oleg!

On Thu, Feb 06 2025 at 17:23, Oleg Nesterov wrote:
> On 02/06, Thomas Gleixner wrote:
>> > 	- do_sigaction() can hit the similar problem
>>
>> Indeed, but that's a tough on to solve.
>
> Yeah... Although I have to admit that yesterday I had a very simple
> (and wrong) solution in mind ;)

I can relate. My initial "brilliant" idea to solve that turned out to be
broken after less than 10 seconds... :)

That needs some more thought to the whole signal handling business and
unfortunately the recent posix-timer changes do not help much in that
context. Let me think about it some more.

Thanks,

        tglx


