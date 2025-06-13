Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 390D91E51F6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:28:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749832138; cv=none; b=Rr0Up4v6BjOJDOJp/kdFWumtvZmIqhuSmHBWpF7VmE3tbvPFtlTJDG2wdNJHXL8rufQM3c0lUL7dRpOHzDS1oqsa79IF2CRV3+18tLmjeemHRBDf6r6nE3E5W5YsWERaTPuZKAuKrEUI1AZtozshKc70pACgqtq+rdbA6PHJRWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749832138; c=relaxed/simple;
	bh=1l0huYObH9Pf+vBCyJdSSUZXY1iB/amf4iGJWLwgaqk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=VsWaxu32hbPVsk3LNUTblrOaF38tDT6cclA7o59yDpMYCBB9rfH9ALgMx2+U+/GxLWZ2gYuJa0twDKoCX1gc/lGWWgwxf3b28PdLJWYk5mG1xL9kVanhjnTr2oRLPq/7eeoAfTMOLfyzvrYyfZ7pqTl/NiBsW9y9FOzOlzrQULw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=4qlTpYOD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Bc4b3D5+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="4qlTpYOD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Bc4b3D5+"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749832135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kfl96yMdaqHYF5RGtaj15D1EAPZ04aT6cCwSIKNZKbM=;
	b=4qlTpYODyC9tnyx707tUJCyiVeB3+x9ZnWMGNjqLCo4Zh1UIV6iBGiwoco8AW+uunqhQfP
	0UUBE7tSGDr/eaZMrtQTMK3OPuMXP9ONcHwoXxNc1rHw1p69jJT2+roxHhp2Wrz3wQjVK5
	aojomOJGJ0Cp5fbaqh3EiE/yKygmxCUVqssdZEvhN4/S1hSGgz01Dq1OhpX1E2gYkeIyoD
	0hGXdpIqoxI+7oiCMYrbkaEg7lqvjj1AUqvlHcDD2DGpzOebx2Hghq+B1p3qqjK4sNp+9B
	y7QKAb8P1Avv7yHx/qWa0PCQ7isO6rzBvNgi7WxiaivsQp/Jld/r1RhJ6XxHcg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749832135;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=kfl96yMdaqHYF5RGtaj15D1EAPZ04aT6cCwSIKNZKbM=;
	b=Bc4b3D5+W3x1uqwSm0Sunx5Mka5TxGXedOd97Q1bK75CeUFpZq2CHmtVt6te4kH5Zv2OHR
	Fr0cWLmj6salPeAQ==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH] include/linux: Fix outdated comment on entry-common.h
In-Reply-To: <20250608195043.4953-1-khaliidcaliy@gmail.com>
References: <20250608195043.4953-1-khaliidcaliy@gmail.com>
Date: Fri, 13 Jun 2025 18:28:54 +0200
Message-ID: <8734c3ip15.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Jun 08 2025 at 19:48, Khalid Ali wrote:

'include/linux:' is not a valid prefix. See the documentation I pointed
you to in the other reply.

> From: Khalid Ali <khaliidcaliy@gmail.com>
>
> On most calls to this function, syscall_enter_from_user_mode_prepare()
> never get called as the comment indicates.
>
> Privious kernel version i used to see things happen as the function documentation
> indicated (syscall_enter_from_user_mode_prepare() called before
> syscall_enter_from_user_mode_work), however it seems now some things
> have changed which makes that point irrevelant. Most preparations that
> function does is handled manually by enter_from_user_mode() and
> some other places. So this makes it misleading.
>
> The point is remove strict function call indication on documentation as might be outdated
> one day in the future. There multiple places currently called
> syscall_enter_from_user_mode_work() without
> syscall_enter_from_user_mode_prepare() get called so that will make it
> condition not met.

That's again incomprehensible word salad.

You are right that the comment is not longer accurate, but your fixup
makes it even worse.

The real condition for calling this function is:

    1) enter_from_user_mode() has been invoked

    2) interrupts have been enabled

    3) Architecture specific work has been done

#1 must be the first thing. #2 and #3 have no ordering requirements.

syscall_enter_from_user_mode_prepare() does #1 and #2 together and in
the original implementation this was used in more places. So yes, the
comment is outdated, but it needs to describe the above requirements and
not something pulled out of thin air.

Thanks,

        tglx




