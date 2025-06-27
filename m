Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B355234994
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:27:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751012860; cv=none; b=UsTGsCdWfXNxM2MiRktJobAAlxW5yhmJ7aMGPW7dXaFsWCZcYPcoIWf84Az5AiqPD0NOZVJxDv3yOn0bjtgNiZBU87WmUGsIssRROr8wY+JI7pNSmaDrVcOajkpq4bM45/wBFgvLJBIZmr4Y9Rkz/CK+w+S9idrtLxa4IwwgihA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751012860; c=relaxed/simple;
	bh=ZeAO4OBjLQf6wovsW9Crpb96XV+o1K5q8+3fT2in1dg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SA0PjK+++0fHpCOcB3+NzNmjpUj9tw6b1zpyF2R6+dRGIQJJ9EJiRcCspGsNpx8Pkig4iX4BeCNuft07wLLWlWIqir8gtNTTWeMaEMfUSfG7Bf9C1TWa3FyRDYhlp3ncZqjR5SPJHu4xbsAO+ljJhLjkNw4Q69NYxa5VMVgoZ6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=bxAB4rB8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="bxAB4rB8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UUuri5ffyS/Mgik1WbOq5F0obfwWWCtPFTBMnttn1ek=; b=bxAB4rB8sFQy7nYWPFkrtNaTEJ
	pRwXJolQv/CGykn7aFi1RukOTPDpJSjef+7accoud5aAGYw2SMQfuSCqeFk4ZZQdh0s7wajYEigIZ
	xZx995ctPZ/khpyUyUhtOHWf4Aqp8KX8pNmHfTaLNviC3err2Djfj0/ta7gPbbfZZsEYCGi3rr+r5
	Qv27cyBxnALRxRdwcWhLYrSO6kRLCxv6GmIqGNHD3tAnkUhDNpcWWeOkvlR6RRMhAbCbdhwKorcu7
	+4e+b3vQcFZ6Pfrx4ov29/DdkZUjbUB5NOrtW3iYyEPWoHsAv3Id6bURwLuBu925/qtf8tYVu4Ap4
	jLD4Tc/A==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4Ql-00000006HAG-0I1e;
	Fri, 27 Jun 2025 08:27:31 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 9E70F300222; Fri, 27 Jun 2025 10:27:30 +0200 (CEST)
Date: Fri, 27 Jun 2025 10:27:30 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 08/11] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
Message-ID: <20250627082730.GS1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-9-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626134158.3385080-9-glider@google.com>

On Thu, Jun 26, 2025 at 03:41:55PM +0200, Alexander Potapenko wrote:
> ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
> in the presence of CONFIG_KCOV_ENABLE_GUARDS.
> 
> The buffer shared with the userspace is divided in two parts, one holding
> a bitmap, and the other one being the trace. The single parameter of
> ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
> bitmap.
> 
> Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
> pointer to a unique guard variable. Upon the first call of each hook,
> the guard variable is initialized with a unique integer, which is used to
> map those hooks to bits in the bitmap. In the new coverage collection mode,
> the kernel first checks whether the bit corresponding to a particular hook
> is set, and then, if it is not, the PC is written into the trace buffer,
> and the bit is set.

I am somewhat confused; the clang documentation states that every edge
will have a guard variable.

So if I have code like:

foo:	Jcc	foobar
...
bar:	Jcc	foobar
...
foobar:

Then we get two guard variables for the one foobar target?

But from a coverage PoV you don't particularly care about the edges; you
only care you hit the instruction. Combined with the naming of the hook:
'trace_pc_guard', which reads to me like: program-counter guard, suggesting
the guard is in fact per PC or target node, not per edge.

So which is it?

Also, dynamic edges are very hard to allocate guard variables for, while
target guards are trivial, even in the face of dynamic edges.

A further consideration is that the number of edges can vastly outnumber
the number of nodes, again suggesting that node guards might be better.

