Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0477224AE0
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:12:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011926; cv=none; b=JOKm/iTkz6zFJctSxFbDLk+4WhAM8AyD/gh4CuRAjv2fgk6q7wIkPIfrpt9W7gPKIXhgRKck9yo/ZbedbugYmIz0SmkPiuwtGx6jRKRclh/UJxb4HgipLNmZ5nzBoFJzP6w2SpYFoQIgaEUtXCwnIOeetAUp7S7VSNydwLw1LCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011926; c=relaxed/simple;
	bh=O1TjrfX+XcUJcUDsjmUAke4tj0FyB9CYeAjZvBX+ts0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=E8khVStowdZ+VZYxwtqTVhy8pTehaZDUcL70scaSCfaMa3RmuggcvIG8vGItKd1ulGtPQU66JBXV8wOhU7KaoO1z/0AtGh5NEzJb8JxYoNodqHHpZrDbv2d8MMiuaiIKLMpQBIYJ5EuqbUvRWqBaqTItw06b9jK26L1z58QrORU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=pkjFDojl; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pkjFDojl"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=OZxKizN0JpjR36/RT3EOCTRtfhdellHAaqC3esyhcTg=; b=pkjFDojlMbBl0oo/PyMO4DhI+m
	kRgBbOyh5GQBSn56Ixa9migDSRI2hozftxGXGzm3CUytx8RL3ZFtdR+za/XSN1fO0G8HbsxzGA0P5
	kjMmh+9xU3fUOAihOBfLAc25xxxwCuQ57O0FidwlZPJA6VhTEZNvkzKrZX80ONekbvvOYTNAoF63g
	p89s8kK52xwpd/RB8+rb96YRyoEA+HoBYSMfDIGiXA4p7TqQKMb9Ek82XVmiChgi3CoJwxqpXhb4f
	cYJ++X3uWFJ9Wi2TLDMwPnH89FI2TbBSi81io1hFWrxUOnRSIx8tf7kML+eHiTQXRERDCuc/YP5C2
	h3UmBXJA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV4BX-00000006H4F-230u;
	Fri, 27 Jun 2025 08:11:47 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 8D644300222; Fri, 27 Jun 2025 10:11:46 +0200 (CEST)
Date: Fri, 27 Jun 2025 10:11:46 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Alexander Potapenko <glider@google.com>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org,
	kasan-dev@googlegroups.com, x86@kernel.org,
	Aleksandr Nogikh <nogikh@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Dmitry Vyukov <dvyukov@google.com>, Ingo Molnar <mingo@redhat.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Marco Elver <elver@google.com>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v2 06/11] kcov: x86: introduce CONFIG_KCOV_UNIQUE
Message-ID: <20250627081146.GR1613200@noisy.programming.kicks-ass.net>
References: <20250626134158.3385080-1-glider@google.com>
 <20250626134158.3385080-7-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250626134158.3385080-7-glider@google.com>

On Thu, Jun 26, 2025 at 03:41:53PM +0200, Alexander Potapenko wrote:
> The new config switches coverage instrumentation to using
>   __sanitizer_cov_trace_pc_guard(u32 *guard)
> instead of
>   __sanitizer_cov_trace_pc(void)
> 
> This relies on Clang's -fsanitize-coverage=trace-pc-guard flag [1].
> 
> Each callback receives a unique 32-bit guard variable residing in the
> __sancov_guards section. Those guards can be used by kcov to deduplicate
> the coverage on the fly.

This sounds like a *LOT* of data; how big is this for a typical kernel
build?
