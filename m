Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F2D66FC5
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 08:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743064738; cv=none; b=lGbt5d6uW00pB+Zp1NDFFGj6zu85U3NoojYvZ9C0CDA0RTTZUWwnD+ZNmwS0ysWv5rN43TqXtoL1uaVU8HqlKreD3lRzw5eDPOOOPd66f8y7BE0KhxBe+sYTw1Q3TDcZs8ZS1MbSgvd75yay364mt9ol6Elb/KHpRUMbYXj+Azc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743064738; c=relaxed/simple;
	bh=pdRXr/GuYOG67qAaFReyMNE3zeQj+8amifkusK4chWE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Wdqo1HYY+NCoYVWzY8e6sFopPaVspulBGRC8641DD0pkf/N4I9xHmLX0f86X224UVEwCs2j1GFVbqRPDOj4idYAZuNPg2szjJfmryjhRtWGM0EC/pCHDxKfdS0DmiTHPqXPHl40BBidV1+26LVJCO0CuniuaqyXkF3XBkzYSFvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lBInM3Ho; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lBInM3Ho"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4513C4CEDD;
	Thu, 27 Mar 2025 08:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743064737;
	bh=pdRXr/GuYOG67qAaFReyMNE3zeQj+8amifkusK4chWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lBInM3Hoi+mbzMtF+9i6ej2WkXZU6y7HSd5LpruhlASVm+fnY0vq7wai+McrOkVq7
	 eC6o4vlr5u5x7u628Wna6akW/1rF7lfLToofAuqBVRpAk+SGiPuJgzE/R4kuClbAEm
	 P3nkeJP2umY7QfAdc5m7AGWtycXbYrZgeXVIUvPjv05jElzCHAqsxll9emYLff6Efd
	 baqzPlVHy/tqKc23uTcA3pzhB95TnXv5JAhbtOs8g3/50+W8Chh54dcA++pD7xxBoW
	 t1SZAxjd0fThfeBH5JaCP6fhgj/4Mp/pdXLd+y3gm0o1Byc8epZzU8aI+irFDbt8fN
	 whvBeNJx2Ne3A==
Date: Thu, 27 Mar 2025 09:38:54 +0100
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: Re: [COMBO PATCH 6/5] bugs/arch: Wire in the 'cond_str' string to
 the WARN/BUG output machinery of PowerPC, LoongArch, S390, RISC-V, PA-RISC
 and SH
Message-ID: <Z-UOnlDWeII5IbI6@gmail.com>
References: <20250326084751.2260634-1-mingo@kernel.org>
 <20250326084751.2260634-5-mingo@kernel.org>
 <20250326085343.GB25239@noisy.programming.kicks-ass.net>
 <Z-UI6KGxZyw4hsej@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z-UI6KGxZyw4hsej@gmail.com>


* Ingo Molnar <mingo@kernel.org> wrote:

> ... some time later:
> 
>  b2becbe8b469 bugs/s390: Pass in 'cond_str' to __EMIT_BUG() and use it

> --- a/arch/s390/include/asm/bug.h
> +++ b/arch/s390/include/asm/bug.h
> @@ -8,7 +8,7 @@
>  
>  #ifdef CONFIG_DEBUG_BUGVERBOSE
>  
> -#define __EMIT_BUG(x) do {					\
> +#define __EMIT_BUG(cond_str, x) do {				\
>  	asm_inline volatile(					\
>  		"0:	mc	0,0\n"				\
>  		".section .rodata.str,\"aMS\",@progbits,1\n"	\
> @@ -20,14 +20,14 @@
>  		"	.short	%0,%1\n"			\
>  		"	.org	2b+%2\n"			\
>  		".previous\n"					\
> -		: : "i" (__LINE__),				\
> +		: : "i" (cond_str __LINE__),			\
>  		    "i" (x),					\
>  		    "i" (sizeof(struct bug_entry)));		\
>  } while (0)
>  
>  #else /* CONFIG_DEBUG_BUGVERBOSE */
>  
> -#define __EMIT_BUG(x) do {					\
> +#define __EMIT_BUG(cond_str, x) do {				\
>  	asm_inline volatile(					\
>  		"0:	mc	0,0\n"				\
>  		".section __bug_table,\"aw\"\n"			\
> @@ -42,12 +42,12 @@
>  #endif /* CONFIG_DEBUG_BUGVERBOSE */
>  
>  #define BUG() do {					\
> -	__EMIT_BUG(0);					\
> +	__EMIT_BUG("", 0);				\
>  	unreachable();					\
>  } while (0)
>  
>  #define __WARN_FLAGS(cond_str, flags) do {		\
> -	__EMIT_BUG(BUGFLAG_WARNING|(flags));		\
> +	__EMIT_BUG(cond_str, BUGFLAG_WARNING|(flags));	\
>  } while (0)
>  
>  #define WARN_ON(x) ({					\

So the fix below makes it build on S390, but it won't link:

 kernel/exit.o:(__bug_table+0x8): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 kernel/exit.o:(__bug_table+0x14): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 kernel/exit.o:(__bug_table+0x20): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 kernel/exit.o:(__bug_table+0x2c): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 kernel/exit.o:(__bug_table+0x38): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 kernel/exit.o:(__bug_table+0x44): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 kernel/exit.o:(__bug_table+0x50): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 init/main.o:(__bug_table+0x8): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 init/main.o:(__bug_table+0x14): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 init/main.o:(__bug_table+0x20): relocation truncated to fit: R_390_16 against `.rodata.str1.2'
 init/main.o:(__bug_table+0x2c): additional relocation overflows omitted from the output

From the _16 name my rough guess is that the larger string table has 
overflown 16 bits (64k)?

At which point I'd much rather go back to plan-A: pass in cond_str to 
__WARN_FLAGS(), and wash my hands and leave architectures to make use 
of them as they wish to. :-)

Thanks,

	Ingo

=====================>

 arch/s390/include/asm/bug.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index e3d839517c17..7eb9b44f78cb 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -20,7 +20,7 @@
 		"	.short	%0,%1\n"			\
 		"	.org	2b+%2\n"			\
 		".previous\n"					\
-		: : "i" (cond_str __LINE__),			\
+		: : "i" (__stringify(cond_str __LINE__)),	\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
