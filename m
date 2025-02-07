Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE5961F8697
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 12:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738931323; cv=none; b=ANdJWQZReNTbWj383xJxg48HCKeUF7xJOG+Mfp9FR27piQcg52Jpw1VahWp8QJO6LLZp6032NNGiRRXe4LHM6C1412qEXqrUvG6qU+kV01driBrdEU0GIC8cxG5PpEquu9VSgNSQYfnYNEtmGQHgtvgxSaNFPi0xFvyhqtIdqus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738931323; c=relaxed/simple;
	bh=s3M+NkV0tESd6HPi0p7Oe7KL+c5J0dxnA8hEAnIxKh0=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=M3ZP2MwBMZrF8IhdNLwmPzJJQYUfphrrQrKV0oaAHs46sp79XbNWH1aX+MGoAAKFtl4/he7BdIt5Gi0QgEukdfH1GdSYUJPZCcTo7ybofIsQPckGq2IB8fE/DlcFarjebWHEOdxnervbsCyZtGcP+MtxWhiehLOLthGFd2S7soI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=iHz6KG+u; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iHz6KG+u"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=eRROD8MHw5KbWF+hIKE4+BwnoGjptOnpyqPd+fBz2Os=; b=iHz6KG+uqE5bkQiZ1avRflLvWN
	8hXQO4IB8b+PnCnbkl8nzJTUzn/RbVfTADXl14sctp0Kk7x7vadvYbMNm4W6XCx5XqZQEfU+iDASr
	OaKeDQnH32SfDwZ++FqfEDaGgZWzmvuKHVMYaFI3YAsu8PrmOReR5ZOpPATHkQADEVUufcFvnaF0j
	0LXwjuHhXBxLL4nLLXVMed1d4khQqNIm6rfg7HPf02Gv/sFOzaT3OSo49ghgbSZ6D/kTFrbELV5YC
	B1erMj1A/8PQYt3/ROVmdU78a/JyySR1RNoETYmUkUueRoDCziFfyy+fNTMHHERc6RPYKMUU13am8
	qyfjr6VA==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tgNT8-0000000HAef-48yP;
	Fri, 07 Feb 2025 12:28:38 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id 3D2403031DE; Fri,  7 Feb 2025 13:28:25 +0100 (CET)
Message-ID: <20250207122546.815505775@infradead.org>
User-Agent: quilt/0.66
Date: Fri, 07 Feb 2025 13:15:37 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 alyssa.milburn@intel.com,
 scott.d.constable@intel.com,
 joao@overdrivepizza.com,
 andrew.cooper3@citrix.com,
 jpoimboe@kernel.org,
 jose.marchesi@oracle.com,
 hjl.tools@gmail.com,
 ndesaulniers@google.com,
 samitolvanen@google.com,
 nathan@kernel.org,
 ojeda@kernel.org,
 kees@kernel.org,
 alexei.starovoitov@gmail.com,
 mhiramat@kernel.org
Subject: [PATCH 08/11] x86/ibt: Clean up poison_endbr()
References: <20250207121529.222723073@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Basically, get rid of the .warn argument and explicitly don't call the
function when we know there isn't an endbr. This makes the calling
code clearer.

Note: perhaps don't add functions to .cfi_sites when the function
doesn't have endbr -- OTOH why would the compiler emit the prefix if
it has already determined there are no indirect callers and has
omitted the ENDBR instruction.

Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 arch/x86/kernel/alternative.c |   43 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 36 insertions(+), 7 deletions(-)

--- a/arch/x86/kernel/alternative.c
+++ b/arch/x86/kernel/alternative.c
@@ -865,14 +865,12 @@ __noendbr bool is_endbr(u32 *val)
 
 static void poison_cfi(void *addr);
 
-static void __init_or_module poison_endbr(void *addr, bool warn)
+static void __init_or_module poison_endbr(void *addr)
 {
 	u32 poison = gen_endbr_poison();
 
-	if (!is_endbr(addr)) {
-		WARN_ON_ONCE(warn);
+	if (WARN_ON_ONCE(!is_endbr(addr)))
 		return;
-	}
 
 	DPRINTK(ENDBR, "ENDBR at: %pS (%px)", addr, addr);
 
@@ -897,7 +895,7 @@ void __init_or_module noinline apply_sea
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
 
-		poison_endbr(addr, true);
+		poison_endbr(addr);
 		if (IS_ENABLED(CONFIG_FINEIBT))
 			poison_cfi(addr - 16);
 	}
@@ -1200,6 +1198,14 @@ static int cfi_rewrite_preamble(s32 *sta
 		void *addr = (void *)s + *s;
 		u32 hash;
 
+		/*
+		 * When the function doesn't start with ENDBR the compiler will
+		 * have determined there are no indirect calls to it and we
+		 * don't need no CFI either.
+		 */
+		if (!is_endbr(addr + 16))
+			continue;
+
 		hash = decode_preamble_hash(addr);
 		if (WARN(!hash, "no CFI hash found at: %pS %px %*ph\n",
 			 addr, addr, 5, addr))
@@ -1220,7 +1226,10 @@ static void cfi_rewrite_endbr(s32 *start
 	for (s = start; s < end; s++) {
 		void *addr = (void *)s + *s;
 
-		poison_endbr(addr+16, false);
+		if (!is_endbr(addr + 16))
+			continue;
+
+		poison_endbr(addr + 16);
 	}
 }
 
@@ -1353,9 +1362,23 @@ static inline void poison_hash(void *add
 
 static void poison_cfi(void *addr)
 {
+	/*
+	 * Compilers manage to be inconsistent with ENDBR vs __cfi prefixes,
+	 * some (static) functions for which they can determine the address
+	 * is never taken do not get a __cfi prefix, but *DO* get an ENDBR.
+	 *
+	 * As such, these functions will get sealed, but we need to be careful
+	 * to not unconditionally scribble the previous function.
+	 */
 	switch (cfi_mode) {
 	case CFI_FINEIBT:
 		/*
+		 * FineIBT prefix should start with an ENDBR.
+		 */
+		if (!is_endbr(addr))
+			break;
+
+		/*
 		 * __cfi_\func:
 		 *	osp nopl (%rax)
 		 *	subl	$0, %r10d
@@ -1363,12 +1386,18 @@ static void poison_cfi(void *addr)
 		 *	ud2
 		 * 1:	nop
 		 */
-		poison_endbr(addr, false);
+		poison_endbr(addr);
 		poison_hash(addr + fineibt_preamble_hash);
 		break;
 
 	case CFI_KCFI:
 		/*
+		 * kCFI prefix should start with a valid hash.
+		 */
+		if (!decode_preamble_hash(addr))
+			break;
+
+		/*
 		 * __cfi_\func:
 		 *	movl	$0, %eax
 		 *	.skip	11, 0x90


