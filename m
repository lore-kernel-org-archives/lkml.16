Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4E022A4EB
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011154; cv=none; b=so72ZcCPkpxOVXsY0zHUqyiH4yeFG66byH62f3gcwHdi0AuuWZMf4A83eariidkTehjQ4mRdxl1gqQ+LJwsXNpqkgc0rBlhEyYE371jibfH4E8nXAEeOTgE5mfRovGeBMv8JtXzz9Fj5aEkEm/eRL3/kH+YXC/kvuEZq51Q38OQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011154; c=relaxed/simple;
	bh=L+ZZOa8XaEDSQVrNy6HRtl+1pHVA46x0IEJzjJWdT4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E6+sJG5bRcVsEmD/PdN+6BDniYmczblkBxFQjiO6cbGBRCS9TX2k1+N/Fd1vvEVCJH6NLhAeRhtib25zRfQ7jB8qUm2T0NRgcwjDPiHa35x4klViEYcZheZ8qPxS0PDWlcbNBK5Vbwc6m/loZpz6IQ6qDzSNVXH4Uj/9WqU0i+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=l379TvQw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="l379TvQw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=L+ZZOa8XaEDSQVrNy6HRtl+1pHVA46x0IEJzjJWdT4s=; b=l379TvQwZ7I3IbWLgSb7fEoVrj
	ghJI3dvzRdZx54yKEXp9F9uSCGtubRtXMDKd/AQpDjBx0DGOOOyvunPHVg9frVimsNdf2EuuHNNga
	2KFF8vXCJWDE4zHJqzmiCHydWAdGJvhQjlc2h5AZZQdcUvFvTYzgM+ADb8dGM8TRuawPDat9CSLk+
	EqFTz9c4uRXLagew77YMYETmxwdpC6coq88g8Sa/kH+UVpKaSUSOujdwc1LFqavz8oyMlHTUmXX2T
	YkGAPE1O+9CCsgsXG5jh4yXPW4d9DgafA3BqY0wJSemK3NiShFQ3foNM1fUus6UD+GWbwGtXrPaRj
	4MVndI4w==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV3zG-0000000DYTh-1NGh;
	Fri, 27 Jun 2025 07:59:06 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id DDCA1300222; Fri, 27 Jun 2025 09:59:05 +0200 (CEST)
Date: Fri, 27 Jun 2025 09:59:05 +0200
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
Subject: Re: [PATCH v2 01/11] x86: kcov: disable instrumentation of
 arch/x86/kernel/tsc.c
Message-ID: <20250627075905.GP1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-2-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626134158.3385080-2-glider@google.com>

On Thu, Jun 26, 2025 at 03:41:48PM +0200, Alexander Potapenko wrote:
> sched_clock() appears to be called from interrupts, producing spurious
> coverage, as reported by CONFIG_KCOV_SELFTEST:

NMI context even. But I'm not sure how this leads to problems. What does
spurious coverage even mean?
