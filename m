Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6619E41C64
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749133293; cv=none; b=PV2hqnVGEifsvG++5didjntgrv7YSf9ZVej04526hbg67ZotKtFVP0eespaeYvtspCUAyILTQw76VRPeWvDaIitGEA1RI2dLantlOAfDdi4u7TgQa0KP83sg+iTe45LZg6iGSF4IO+FS33kpkdKrSvtR42vB4+wC6x+Zkjq3314=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749133293; c=relaxed/simple;
	bh=E0pSKv+izDzrlBsPHmSxnYo8Z3/s33BmLN66PmHHiFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RDcjxJEhQBojNgNp3JNssUDY5oPXvPBEiL2SW1+1qyrDuwVvnV4jO9zmtydKmZBwWsABIWXKkuosE3Eie04UsygP80I/eAcF2spmvYD3tIpqNtfznKBBpDm/6BVP0swTwr/bilyPQwFtunFih/E/eUPpkEaZHY0adicRm2cv8BI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=DSotHWSY; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="DSotHWSY"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0wmHwsuhGSPTxGDnvwdI84SgADDq0c08NA96XNhokDU=; b=DSotHWSYok75xBC5ZWWLAIWP0g
	LqxbXqO3F9SyhaaokE2o2uMaUmdxMO9G11lKaIDj54vvBRSImWc2ZmNbe+g73Nn7i+ZBoLMM1ARkB
	lvwpVOp218Jp6ilCKViGrxqVL9sfmRwMBCHykNlZXVak88vd5jc+JoyDcgcTr4ItV0JLee9/8K6oX
	Y4qvNUayNzunncc9BkuXtD7pRfuMeavpN2zABHNMFSlUOxUnlkN/22pJWA649SzqzAPnY+De0YteA
	fBXy+4eVGKRxowSH4ZY8mgrO4ssE8rAJMh5BRNvZnwitvjaBAxLzwpTmvajjf7TDzHDg3urGMuZjF
	O/JjdUzw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNBTB-00000001Aog-0fDf;
	Thu, 05 Jun 2025 14:21:25 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 65FA230057C; Thu,  5 Jun 2025 16:21:24 +0200 (CEST)
Date: Thu, 5 Jun 2025 16:21:24 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Kai Huang <kai.huang@intel.com>
Cc: dave.hansen@intel.com, tglx@linutronix.de, bp@alien8.de,
	mingo@redhat.com, hpa@zytor.com, kirill.shutemov@linux.intel.com,
	rick.p.edgecombe@intel.com, x86@kernel.org, samitolvanen@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Message-ID: <20250605142124.GT39944@noisy.programming.kicks-ass.net>
References: <20250604003848.13154-1-kai.huang@intel.com>
 <20250605140739.GS39944@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250605140739.GS39944@noisy.programming.kicks-ass.net>

On Thu, Jun 05, 2025 at 04:07:39PM +0200, Peter Zijlstra wrote:
> On Wed, Jun 04, 2025 at 12:38:48PM +1200, Kai Huang wrote:
> > Build warnings about missing ENDBR around making SEAMCALLs[*] were
> > observed when using some randconfig[1] to build today's Linus's tree.
> > 
> > In the C code, the low level SEAMCALL assembly functions (__seamcall(),
> > __seamcall_ret() and __seamcall_saved_ret()) are indirectly called via
> > the common sc_retry() function:
> > 
> >     static inline u64 sc_retry(sc_func_t func, u64 fn,
> > 		    	       struct tdx_module_args *args)
> >     { ... }
> > 
> >     #define seamcall(_fn, _args) sc_retry(__seamcall, (_fn), (_args))
> > 
> > It turns out compilers may not always be smart enough to figure out how
> > to call those assembly functions directly.
> 
> Did you try something like so?

This seems to cure things for me.

---

diff --git a/arch/x86/include/asm/tdx.h b/arch/x86/include/asm/tdx.h
index 4a1922ec80cf..e8cd717f4f0f 100644
--- a/arch/x86/include/asm/tdx.h
+++ b/arch/x86/include/asm/tdx.h
@@ -100,8 +100,8 @@ void tdx_init(void);
 
 typedef u64 (*sc_func_t)(u64 fn, struct tdx_module_args *args);
 
-static inline u64 sc_retry(sc_func_t func, u64 fn,
-			   struct tdx_module_args *args)
+static __always_inline u64 sc_retry(const sc_func_t func, u64 fn,
+				    struct tdx_module_args *args)
 {
 	int retry = RDRAND_RETRY_LOOPS;
 	u64 ret;
diff --git a/arch/x86/virt/vmx/tdx/tdx.c b/arch/x86/virt/vmx/tdx/tdx.c
index 7fdb37387886..ed87eae7b414 100644
--- a/arch/x86/virt/vmx/tdx/tdx.c
+++ b/arch/x86/virt/vmx/tdx/tdx.c
@@ -69,7 +69,7 @@ static inline void seamcall_err_ret(u64 fn, u64 err,
 			args->r9, args->r10, args->r11);
 }
 
-static inline int sc_retry_prerr(sc_func_t func, sc_err_func_t err_func,
+static __always_inline int sc_retry_prerr(const sc_func_t func, sc_err_func_t err_func,
 				 u64 fn, struct tdx_module_args *args)
 {
 	u64 sret = sc_retry(func, fn, args);
