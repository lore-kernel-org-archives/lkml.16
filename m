Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A4531AD3FA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 16:09:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749830980; cv=none; b=FiXp0xzTFBwtxmV9ZUc1fEcc3EVMytfn27qCfWkKT/B21sMu2WorZkwXCUXRCzPIQS1Wpt2VBiIOXoU6j52TtKrrX57v/gIilgY0ibI+sB8wpeFeNJyd7BkRsC8NKIeIT8GZDy6cvmCDi9E966Huci5qN7aITYj3tVqMeSLs61A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749830980; c=relaxed/simple;
	bh=bURaKvfe9SxljqTl8ZNfTZFqvIAxyx0oqsFKHm0HimE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S+zHDGqX8lYfKJQmGlXQNQMYz/rj/Y8wXJSKT71n5s5xhdH/NC3uu4IQxCwr7UobAjMgi95GfrN0OQa91cfxkV6Wc4tqD/bMfkgzL4mfTJ9T8o3/OdYrCXwpTC9ouldVGygf9E6b8W9596xD467rTxJj77qsygR3+yLVHQgSDoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kYIFwfMi; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5Tz6VQ8a; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kYIFwfMi";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5Tz6VQ8a"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749830977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cnN2wDLdCnEWeBVo2iLPm2cmeNWXSxWE9M4pDJxs7wk=;
	b=kYIFwfMiiYo6SpRBNIrHBFwidOWIu+qGzGvProKGuiOm/fjV/e/QPUxPfS0HsdEhfNdHB5
	ZjpoQhaHWfkKU3ThPMujnbZHFrq+EZwZtTwkKSR/4P1LV7J6YHO88FpQh5zhoNrsUzwpk1
	M/b6CKeAk5fkkaLcBwQ0l9vfsVxGDSoO+Wvu1IQyb6jTI6it0TlwMIjpgcdqvqt9055sDT
	+B9ypj2Kr1M+Yk2IGNIs4SQXLKQTKQ+fstqY+PrZnKBF55v2jGyoPCE89GJxagM0QeL+VO
	dT8xqaFdPjGFBEQ5CCFKMfbaSdsTh1QdbtI+Bw+R+Jysqs/AUEif+3jnwA88Yw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749830977;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cnN2wDLdCnEWeBVo2iLPm2cmeNWXSxWE9M4pDJxs7wk=;
	b=5Tz6VQ8aketHnFPrAdoqlE0d5hhk95bq56XeYrU0SX65v4poN5yFdxnVDw8Z5MU2YITCtZ
	2Lhe0c6XlyNY9TBg==
To: Khalid Ali <khaliidcaliy@gmail.com>, peterz@infradead.org, luto@kernel.org
Cc: linux-kernel@vger.kernel.org, Khalid Ali <khaliidcaliy@gmail.com>
Subject: Re: [PATCH] kernel/entry: Remove some redundancy checks on syscall
 works
In-Reply-To: <20250611114810.785-1-khaliidcaliy@gmail.com>
References: <20250611114810.785-1-khaliidcaliy@gmail.com>
Date: Fri, 13 Jun 2025 18:09:36 +0200
Message-ID: <878qlvipxb.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jun 11 2025 at 11:43, Khalid Ali wrote:
> There is a redundant checks of thread syscall work.

Not really.

> After we read thread syscall work we are checking the work bits using

We are doing nothing. Please write your changelogs in imperative mood
and do not try to impersonate code.

> SYSCALL_WORK_ENTER and SYSCALL_WORK_EXIT on syscall entry and exit
> respectively, and at the same time syscall_trace_enter() and
> syscall_exit_work() checking bits one by one, the bits we already checked.
> This is redundancy. So either we need to check the work bits one by one as I
> did, or check as whole. On my prespective, i think the way code is
> implemented now checking work bits one by one is simpler and gives us
> more granular control.

That's just wrong and absolutely not redundant. Care to look at the
definition of SYSCALL_WORK_ENTER:

#define SYSCALL_WORK_ENTER	(SYSCALL_WORK_SECCOMP |			\
				 SYSCALL_WORK_SYSCALL_TRACEPOINT |	\
				 SYSCALL_WORK_SYSCALL_TRACE |		\
				 SYSCALL_WORK_SYSCALL_EMU |		\
				 SYSCALL_WORK_SYSCALL_AUDIT |		\
				 SYSCALL_WORK_SYSCALL_USER_DISPATCH |	\
				 ARCH_SYSCALL_WORK_ENTER)

So this initial check avoids:

    1) Doing an unconditional out of line call

    2) Checking bit for bit to figure out that there is none set.

Same applies for SYSCALL_WORK_EXIT.

Your change neither makes anything simpler nor provides more granular
control.

All it does is adding overhead and therefore guaranteed to introduce a
performance regression.

Not going to happen.

Thanks,

        tglx
