Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE81223327
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 08:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751359617; cv=none; b=V7+2NSZd0pi0V5SGE/JLq9wERaJKoa/WBp/4sO0LsMgEnPePFdMe7JgErR/3f1Xc8Kez+Dz9XfDpuKCuj1a2sk/maDwoFc3Qfyhalm6WR4FwYQ5wEtzMNEVlhaecl6Ca0DxJOfWQPCFXlHNVVxYfsi6IV4H5CdYfZvAPyYARLg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751359617; c=relaxed/simple;
	bh=TT69TIIXqBRdxI6ifqTzAWNMTSGbpcNFpHxJipCq2oM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=TMG5po3MhHM4woFYpc7pZgAl/LspxoieamhTZ8l5UWyZxnqqkfQgGI0W2YMFIfMkQHYuqTVwmjX0+zTC4NtVNyunE/iSQJ/yg7zU996VWWi39OCCDs/iup58cRKFAbh8RPEvIwhJ4JwS89WQnwwfnlBvkaqpJ9ApQw7a4Qb560A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=BXAv44Mv; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=mfJossJN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BXAv44Mv";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="mfJossJN"
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751359614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URJZUNFsGOB3m/561Pc1omOcGI760cyTeR8NjRU0nqc=;
	b=BXAv44Mv6Uy5cFsJVzvy+YkKHQqOmaAVpMYtn7SxZqv1ImxvBwX+6RH8K9BzU27kOB5Zz5
	3yNnPrY9bd7LH37TmEHMcWmfpj/Hyc7rM1EBkSGttLzBF6l9B5IOvvhN4bcB43KJOY3UNM
	mNEg6mofcYlEXNX7+RZD84ZhlBXfb2MZlVgzehkaPYijJvCh0KhGFNU6IhacW4/WyDyZLm
	2XKyRWUIFJd4UoMXO3x8SwVu/h72iSYxmMOlXJxcMJA4OXq/iyKCSGL9i69vT2NW5uFcEI
	sSPNhrxFEPOD7EkZAcHFtMBmfR2wxBtEEiKtyw1gLhelP1Cqr9NR/rX0QILrtQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751359614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=URJZUNFsGOB3m/561Pc1omOcGI760cyTeR8NjRU0nqc=;
	b=mfJossJNlwcpyjSbzDLBBQBxngvKT4wxdy0IM+hXq09t1q9xt6n1rJWax7YPZpN+5/Sdev
	2RMgkhUXL3oRJFAg==
To: Prakash Sangappa <prakash.sangappa@oracle.com>,
 linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org,
 mathieu.desnoyers@efficios.com, bigeasy@linutronix.de,
 kprateek.nayak@amd.com, vineethr@linux.ibm.com
Subject: Re: [PATCH V6 7/7] Introduce a config option for scheduler time
 slice extension feature
In-Reply-To: <20250701003749.50525-8-prakash.sangappa@oracle.com>
References: <20250701003749.50525-1-prakash.sangappa@oracle.com>
 <20250701003749.50525-8-prakash.sangappa@oracle.com>
Date: Tue, 01 Jul 2025 10:46:53 +0200
Message-ID: <87a55omh6q.ffs@tglx>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01 2025 at 00:37, Prakash Sangappa wrote:
> Add a config option to enable schedule time slice extension.

This is so backwards that it's not even funny anymore.

> +config SCHED_PREEMPT_DELAY
> +	def_bool y
> +	depends on SMP && RSEQ

and hilariously fails to include a SCHED_HRTICK dependency.

Impressive....
