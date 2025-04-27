Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FCB024633C
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 08:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745742367; cv=none; b=fZDR8YmUkh6ne85pNVfpjmT/ek8Hm4TGm7CseVaLZEFrHJP60KXmm0OB5G9Y1TvQ9knZ59vcQwksBTZTTe9n6rd2s4JhmuSJT45O2nQE5NmtZGQFiS6Oss5Se0C1yfZsVcPUxO+s0Nj6YQBnjLw0PJNrnJKUSkF59MOHb926G2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745742367; c=relaxed/simple;
	bh=2lTkGpjuVaiHemAJyC6zG/W9tYCkJYk/HO4SNHQcq1o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EtIcLkAdcc6xgejP0HbZzMdQLNA+7yh7pQodUh/6nXiEQbVBD1YNFNLHkr+Lj0DNwOKI8vo8SqZAZbMt89j9yVUxrapYYGfNCAy2hzp2A8vCRStm3vN12FiqeeCtIp/t7AkJKYpFGQWvSJE4kcmlpVDchE/N2mt5hYj7J6mQCBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bUagof68; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bUagof68"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3501BC4CEE3;
	Sun, 27 Apr 2025 08:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745742366;
	bh=2lTkGpjuVaiHemAJyC6zG/W9tYCkJYk/HO4SNHQcq1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bUagof68sE48Oo8Jj/G8kBhjSoai2URy/CLveb7hIU4rcYtgHLKkL7kOjdZ/wam9S
	 2lqsH7ZxAD2McNWSpkzruxkciXl+0gFs40rMtKqCATXgqnVTcdTKT2H67ZshecU8RJ
	 LOy89X6GMKl4o1KtZ0Szo7YW7drTOsvjBnHzoyXy50qIj+ZRkOCfcGQjmaZCIovtO4
	 To9Woiy8FWICKdML6+UkrZHhweECx07r+baR3YPvMH8JMHBNyN+mIqjsgXlg0YTWuc
	 zbyrT/xTNVQrfVS/RjBdSIaKf9zod+u4Ym7HNxMUX0NTOSmy3XxlHjNu+DrVNrIMNT
	 ecXw4YxGW/HTQ==
Date: Sun, 27 Apr 2025 10:26:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 15/15] x86/atomics: Remove !CONFIG_X86_CX8 methods
Message-ID: <aA3qGMf759kePUFI@gmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-16-mingo@kernel.org>
 <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5c175b6a-e9c8-2546-a4fe-98572c3f4935@gmail.com>


* Uros Bizjak <ubizjak@gmail.com> wrote:

> 
> 
> On 25. 04. 25 10:42, Ingo Molnar wrote:
> 
> > -#endif
> > +#define arch_cmpxchg64			__cmpxchg64
> > +#define arch_cmpxchg64_local		__cmpxchg64_local
> > +#define arch_try_cmpxchg64		__try_cmpxchg64
> > +#define arch_try_cmpxchg64_local	__try_cmpxchg64_local
> >   #define system_has_cmpxchg64()		boot_cpu_has(X86_FEATURE_CX8)
> 
> #define system_has_cmpxchg64()		1

Thanks, I've updated the patch with the change below.

	Ingo

===========>
 arch/x86/include/asm/cmpxchg_32.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/cmpxchg_32.h b/arch/x86/include/asm/cmpxchg_32.h
index 5902fa5af93b..6c7b37bc65c1 100644
--- a/arch/x86/include/asm/cmpxchg_32.h
+++ b/arch/x86/include/asm/cmpxchg_32.h
@@ -74,6 +74,6 @@ static __always_inline bool __try_cmpxchg64_local(volatile u64 *ptr, u64 *oldp,
 #define arch_try_cmpxchg64		__try_cmpxchg64
 #define arch_try_cmpxchg64_local	__try_cmpxchg64_local
 
-#define system_has_cmpxchg64()		boot_cpu_has(X86_FEATURE_CX8)
+#define system_has_cmpxchg64()		1
 
 #endif /* _ASM_X86_CMPXCHG_32_H */
