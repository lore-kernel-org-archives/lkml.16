Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C73427A91F
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 15:39:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748360346; cv=none; b=U19C9I0E6rzodoL0w5Tb7CQKLSO11HN765RaPqoXxhleyetYBk6ba9297BIciGyA7VA67z6aSdt4vIo+zClHqDLf2ldtw1lLQ9s70rMJmT0LCxPDDs68bXOin6gjVV8gbxN6WNXOBNiCDGpZubC7S8J3hpX9jDfYtpz9/+U0ly4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748360346; c=relaxed/simple;
	bh=t4a4M7gHbtuDfX6w0wocs9AUesKsdxo2pyY5YjnaIwA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p89/pNrJydAxtE0gb3vERawdG72gMAI6OsAYDUpsW3Eug85NR2WNqxy8bmE0ndJsK+Eqph+d3Ai83XANLOvjsc9Cqs1SqwNiwn6nSiXjAH1FCgTuKPmYFXS1WPcovrbAujoVCtC1a0KmJjZxklvLgioMPSjJAGwO/dHFukmTZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=zfwbCeIc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=7IDdTbsf; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="zfwbCeIc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="7IDdTbsf"
Date: Tue, 27 May 2025 17:39:01 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1748360342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hF0TaXQZJhyz2kje/Q3JOCHYy0vPq7Q63K8fR4fhmXk=;
	b=zfwbCeIcm6iphB4DPlzTGxZFVpm9NzERqg9mCo+dXMt7N2svf6C6gpERCz17H7OEnTis7K
	4ex8Pp4yBxLeDXVjMcZQGI9pCfwdnUZ/Lp8QYQ56pm82gZqGqJb2CXV5ZtRPHK093SvNLz
	+y/LohDoZRCVUo6BjdYlIBFTTmW2OQ+C35ARM6qABz3Tb4USeE6aC1lU+ttKXgXVpzgZZC
	5RBemzrj8GWDVru7rCtf4CLzwK3RToZv/1ga6rDG9Any0eqU7Yg9BbaMr6jcw1rzU8w3g1
	m9d5FvGUqFxZUG9/PBOsqYcaYL7ydLoBT5HY6Cq6VI6etpQAogq/v2ZZ9t1DVQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1748360342;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hF0TaXQZJhyz2kje/Q3JOCHYy0vPq7Q63K8fR4fhmXk=;
	b=7IDdTbsfhCqffbh/Z6svtqgq2QTA7c92uwxN9AIY6rWVqFguinUg/T3v5/B3N614i7SDuk
	0nzRcxkiIqL3lwAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Peter Zijlstra <peterz@infradead.org>
Cc: syzbot <syzbot+9afaf6749e3a7aa1bdf3@syzkaller.appspotmail.com>,
	andrealmeid@igalia.com, dave@stgolabs.net, dvhart@infradead.org,
	linux-kernel@vger.kernel.org, mingo@redhat.com,
	syzkaller-bugs@googlegroups.com, tglx@linutronix.de
Subject: Re: [syzbot] [kernel?] KASAN: wild-memory-access Read in
 get_futex_key
Message-ID: <20250527153901.ifh9HzZ_@linutronix.de>
References: <6835bfe3.a70a0220.253bc2.00b5.GAE@google.com>
 <20250527142217.GA7747@noisy.programming.kicks-ass.net>
 <20250527153106.WFmvR15N@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250527153106.WFmvR15N@linutronix.de>

On 2025-05-27 17:31:07 [+0200], To Peter Zijlstra wrote:
> On 2025-05-27 16:22:17 [+0200], Peter Zijlstra wrote:
> > >  get_futex_key+0x595/0x1540 kernel/futex/core.c:587
> > 
> > Does the this help?
> 
> it avoids boom but reject FUTEX_NO_NODE. What about

maybe

diff --git a/kernel/futex/core.c b/kernel/futex/core.c
index 19a2c65f3d373..558c523766461 100644
--- a/kernel/futex/core.c
+++ b/kernel/futex/core.c
@@ -583,8 +583,9 @@ int get_futex_key(u32 __user *uaddr, unsigned int flags, union futex_key *key,
 		if (futex_get_value(&node, naddr))
 			return -EFAULT;
 
-		if (node != FUTEX_NO_NODE &&
-		    (node >= MAX_NUMNODES || !node_possible(node)))
+		if ((node != FUTEX_NO_NODE) &&
+		    (node < 0 || node > MAX_NUMNODES ||
+		     !node_possible(node)))
 			return -EINVAL;
 	}
 
to avoid the memory access on nr_node_ids since we need to go through
node_possible() we could use a constant to ensure it is not too big.

Sebastian
