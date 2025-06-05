Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2851C861D
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749132470; cv=none; b=UhSNdLyPPrxHXKwN5cjLxYtreh4iNYgKjZ/YsONGDdkmaccpttosAMurT49pDXcjDZZJ8fHpZBbcLesRdR6clxbI/uwp8Qy5rggtrtEmirbPnoDwxMNBa7IVSxzYPLY0JkX6kurZU85KpHFBay6Fqhj+NeoOu8F3LVI1rbmvRJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749132470; c=relaxed/simple;
	bh=0TwxPMBqGhov8X+SHV6wMITlIH+ZCz5u1KNTawJxaG8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i9s+wNxyfzG6+a8OC7hoJ39/bPN8OtZx8PIkSfLDxO0PV4aLW9Ge3lUsjSJnwlWZ4aX7/nQUB7TeUZW86WevF7N5ds7OLyWjwRKDQ9qHWVdzNasJLN42E960toXdH5lZLaduVQxOt8g58ogFR9TI55q4RgdpDrNnXGqSwXNHlmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fs1b/xtR; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fs1b/xtR"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=fdp4l9Uo1aGOVtRPVaf4GJSta5iWj+VWx1Q7EQV/vyg=; b=fs1b/xtR9K+1vdMAXjwXi+9EMc
	O/ygCI3sa7ewBmWG/YOdnuGUG3EsJocvKHj0ptoJPRW3ErsT7KImHVOgvXonHd3H6hg7lXjRzRJfU
	tmvgq+LPfpO5X5J9WVh4lo3eYvb1CCNnDp6/UKDe4MnEQ1Mrwxk6IhmqGENOW9w07mq7INVHBuykI
	Bpgqsjg90mIdlR+4AhfPMcqy2pyP9vriZygtHK0Lyvs43SC9t5toJLA+wu68oWzw1c65L1tgKlsdO
	nrCx5Ms2zdt8lv5NK7X5FCUG/8tAMky5OokIdb6HOH0NjiZ4mogn9RZR2T7rgO6g0Y/5Sdg3vZ3Y9
	JQ1TCkvw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBFt-00000001Akl-1OdG;
	Thu, 05 Jun 2025 14:07:41 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id D8C73300348; Thu,  5 Jun 2025 16:07:39 +0200 (CEST)
Date: Thu, 5 Jun 2025 16:07:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kai Huang <kai.huang@intel.com>
Cc: dave.hansen@intel.com, tglx@linutronix.de, bp@alien8.de,
	mingo@redhat.com, hpa@zytor.com, kirill.shutemov@linux.intel.com,
	rick.p.edgecombe@intel.com, x86@kernel.org, samitolvanen@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Message-ID: <20250605140739.GS39944@noisy.programming.kicks-ass.net>
References: <20250604003848.13154-1-kai.huang@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604003848.13154-1-kai.huang@intel.com>

On Wed, Jun 04, 2025 at 12:38:48PM +1200, Kai Huang wrote:
> Build warnings about missing ENDBR around making SEAMCALLs[*] were
> observed when using some randconfig[1] to build today's Linus's tree.
> 
> In the C code, the low level SEAMCALL assembly functions (__seamcall(),
> __seamcall_ret() and __seamcall_saved_ret()) are indirectly called via
> the common sc_retry() function:
> 
>     static inline u64 sc_retry(sc_func_t func, u64 fn,
> 		    	       struct tdx_module_args *args)
>     { ... }
> 
>     #define seamcall(_fn, _args) sc_retry(__seamcall, (_fn), (_args))
> 
> It turns out compilers may not always be smart enough to figure out how
> to call those assembly functions directly.

Did you try something like so?


diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 8b19294600c4..9662580c4b94 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -106,8 +106,8 @@ void tdx_init(void);
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
-static inline u64 sc_retry(sc_func_t func, u64 fn,
-			   struct tdx_module_args *args)
+static __always_inline u64 sc_retry(const sc_func_t func, u64 fn,
+				    struct tdx_module_args *args)
 {
 	int retry = RDRAND_RETRY_LOOPS;
 	u64 ret;
