Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D492AE99
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 06:34:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749882872; cv=none; b=MitpXivnWaiNDEai05HigG69vqv/XCwgXDJzKwmb898O5Eam4Z2okb8UDdicg4/EmBkzP9JETl662JGgrMx4LmG1jlzQkQnt5xOFsA7ILCDXS8lRc6ddT931UgRevgCclpsQWxWom9TGa/qj7J+wS7DjTZmQBnB1S4B22UCpso4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749882872; c=relaxed/simple;
	bh=J5N3nx/i7C/GvRlaO3R5fbJHayuiB3XgkBDTBDj5XiE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=I7PplIl4Hm+4OxLGdUkeHnxRrmgRlAuu5ZrlJG5Oolph3VB/MUXrWrmHiEJCZHl1UbNKX67fqxZAMcYVyKd8533XsA4C9uT8dUyUMHgCvCsUkkjKpNcrDqmPThADmCu4sXa+poWVsKcICwADuuPI7w5AtoNPmzTJ9wYPbP2Y8gA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HR/Zj8LM; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=CjQy3Z67; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HR/Zj8LM";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="CjQy3Z67"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749882869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aEDC0s2sC1YfgElMwmbyYo9ZliDxcvHJo+DQQTCeYe0=;
	b=HR/Zj8LMajeF0CLDTt7fvkBIlf6hhfCVm2BhYbeaphbTI5a7Z7ZbH8fGcGq2djL+qkrqSc
	MMkLygr7HquWYaufdtsabbVgeTCzGdz3BK1lhFAIAN8B2N2COu9TdDyeGOcneTyl1Bd1+1
	I++tvV3ucxUZDgzfq7/0nFt6tPYobR9tt7YN3e4CIzHT1CMxaOaL0BvCdm3YKMtkImoTA6
	u3bHQ2YFPKRJE1YJuVLz/LaO5iaiAU6GBTNiq0LnUoeTjz5/qazIa+xgFoGkBGtdM3q3uQ
	u/H4Dwf2R/N+4yl2kZuzV0REU1Yx0UxSoc7RqHDC87wIVwUd9ZSimwIfVSb6EA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749882869;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aEDC0s2sC1YfgElMwmbyYo9ZliDxcvHJo+DQQTCeYe0=;
	b=CjQy3Z67PRrzwn94Iybd9Qit2a8eReUEfPKOQxnTgbqijVu1LpwOjlNoTFAFVE7g0rMom/
	WVPCAXX5nxIoBECQ==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: Re: [PATCH] include/linux: Fix outdated comment on entry-common.h
In-Reply-To: <20250613205810.773-1-khaliidcaliy@gmail.com>
References: <20250613205810.773-1-khaliidcaliy@gmail.com>
Date: Sat, 14 Jun 2025 08:34:28 +0200
Message-ID: <87cyb6q1aj.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri, Jun 13 2025 at 20:58, Khalid Ali wrote:
> Thanks and noted, however just asking why syscall_enter_from_user_mode() isn't calling
> syscall_enter_from_user_mode_prepare() i don't get it why #1 and #2 is redone, is it because
> of instrumentations since syscall_enter_from_user_mode_prepare() is calling instrumentation_end()?

Nothing is redone. All call sites of syscall_enter_from_user_mode() have
to:

    1) invoke enter_from_user_mode()

    2) enable interrupts

in that very order.

syscall_enter_from_user_mode_prepare() is a helper function which
combines both. It was more widely used in the early implementations of
this infrastructure, but it's usage got reduced to one call site.

All other call sites invoke enter_from_user_mode() and then enable
interrupts before calling syscall_enter_from_user_mode().

That has nothing to do with instrumentation_end(). See
Documentation/core-api/entry.rst for an explanation of noinstr and
instrumentation_begin/end().

> Maybe we need to determine if instrumentation_end() is neccessary for
> syscall_enter_from_user_mode_prepare().

It's already determined. See documentation...

> As i know the only place where syscall_enter_from_user_mode_prepare()
> is called is arch/x86/entry/syscall_32.c, on that source when the
> function returns they begin the instrumentation again using
> instrumentation_begin(). So i think with little adjusment of that
> source file and removing instrumentation_end() on
> syscall_enter_from_user_mode_prepare() then we can use
> syscall_enter_from_user_mode_prepare() as we did. Yet don't know the
> reason, however suspect some duplication.

Can you please stop making uninformed assumptions? It's documented how
this works and there is neither duplication nor anything you can remove.

> Another thing i should indicate if you don't agree with me is, can we
> change the comment the function to enter_from_user_mode(), and with
> little adjusment make steps as you mentioned.

Did you read what I wrote:

>> So yes, the comment is outdated, but it needs to describe the above
>> requirements and not something pulled out of thin air.

?

Thanks,

        tglx
