Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33E7322E3FA
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 21:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750454103; cv=none; b=U4CbTWVzL2DMjtguE6q6xfIvAmzmrTdqlZNSYGx26mlk/BQhzdgdAw0PG+AFQoHALBrtrTwhVhYr6n30Zb+IHPe5B2nhAk4Q95qryANxZERs8hZ0NYCWmVay68z4wP93EE/LEMobQafAhWoo8RPR8shGMo8FMNAC2EDor/lsV9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750454103; c=relaxed/simple;
	bh=5r/CkVofuZA7EJFf7MFmIyLXxR3anpO+G72ytEr+YUY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fbYjf4qhh2rPLHgDDLEIgRoSu4yqahnxaEpqs5F+mitp8Jf+gtLmiLjq1aSJhlczFXVgt078dtZCWfVSRVt/f0AGe1qaul/zT7A373DTnNn+TBZYvxVQz+jGmAzt6y4xd17EjfqQpft8QobD40FtzY4fBtgdeHf689Gq1nxIFJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=L8CVxoAn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=inM3Q34V; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="L8CVxoAn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="inM3Q34V"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750454100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xDbHQcOycUUREm1YCW6mXPxgfuhfSj9P9iRDf90OR1s=;
	b=L8CVxoAno90oexVUd2OU5szNLiS2a+u+Sx5UMuj0NsYvh3XoPn8mP2sVMA9pndXBW4Cft7
	4upTneP2NQZ4Y5GSjP+FaAu07tReSMCv8sBNnv8J0bWulMS4l16cC7S/zGB/KOFZ8SQgyy
	hXEq1Ri1Zydp6adxzHuaMeU7ehixyMzj4okPqUHV/cQ1qWI/FgnSFX6BwDPvhBYnwQJ1Yp
	K7kPAc9s+FttN1xPhx7Bp+KmwZ1OYzQ3eKCyn9p7lwwOO5U7XNITAOWxruAKFpv2tugP3f
	LeWXvMBIGeBdkhQLSFGl5XkCYag1y4uEqN5RviHh+Tc0AJysLVihaq0o0WZreQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750454100;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=xDbHQcOycUUREm1YCW6mXPxgfuhfSj9P9iRDf90OR1s=;
	b=inM3Q34VcHSdlTXjgRYyyPltLbjBdBkkn9In1ZCSZ4NoIlzK45XRKIrj9/gQCHcgWBRSW0
	y/750MfdbyNd+yBA==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH v2] entry: Update outdated comment in entry_common.h
In-Reply-To: <20250618081305.1060-1-khaliidcaliy@gmail.com>
References: <20250618081305.1060-1-khaliidcaliy@gmail.com>
Date: Fri, 20 Jun 2025 23:14:59 +0200
Message-ID: <87pleyp12k.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 18 2025 at 08:12, Khalid Ali wrote:

$Subject: entry: Update outdated kernel doc for syscall_trace_enter()

The shortlog should describe the change concisely. 'in entry_common.h'
tells absolutely nothing.

> From: Khalid Ali <khaliidcaliy@gmail.com>
>
> The comment above syscall_enter_from_user_mode() refers to
> syscall_enter_from_user_mode_prepare(), which is no longer used. This can
> mislead readers trying to follow the entry path.
>
> Update the comment to reflect the current implementation by replacing
> syscall_enter_from_user_mode_prepare() with enter_from_user_mode().
>
> Signed-off-by: Khalid Ali <khaliidcaliy@gmail.com>
> ---
>  include/linux/entry-common.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
> index dad1f257e3dd..49f5d99b254c 100644
> --- a/include/linux/entry-common.h
> +++ b/include/linux/entry-common.h
> @@ -146,7 +146,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
>   * @syscall:	The syscall number
>   *
>   * Invoked from architecture specific syscall entry code with interrupts
> - * enabled after invoking syscall_enter_from_user_mode_prepare() and extra
> + * enabled after invoking enter_from_user_mode() and extra
>   * architecture specific work.

And how is that more correct? I explained it to you in great detail what
the prerequisites are:

 https://lore.kernel.org/all/87cyb6q1aj.ffs@tglx

No?

Thanks,

        tglx
