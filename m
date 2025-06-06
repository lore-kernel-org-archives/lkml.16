Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3E204F8C
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749201919; cv=none; b=nbli7ZpfHqg7u6jYPMifDNHeT1I+XRJ8wJbsVI5Co3ujkOs2/3VmG0lb80PSdzn1JCsDJ32J6hxIwxw93rhquRH3QvA3dU0rZ38j93pARR5NuZ/YG3sQJHmMgQSHbTdyHDElkRh9ChB8pgX3sZ8G+BsdGF2UUjGVtsi7OQ4/58Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749201919; c=relaxed/simple;
	bh=I6PsUegXvW4sKwtm2hBSON/3SVKA+xQsbUV7xdVlBvs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HSw06wJidOQQQddD5QDKBTSDRyXmfhK1+eO10RAIqfZ6yp60qqe1lugnPhrcNkgepPkrc8SuuhnDQrEYrW3zICSQxHpYoN99vZJgk2Ji4J2+TysIj9S0wNC6JtYVMebxIlglpJQRralSHgczhVNYOH/+svFZTiKQiJEkEhDQhPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=j78M4blQ; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="j78M4blQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1749201916;
	bh=7KRt2HEAfw/QBgPweBInY7JAo1KxrGLTcf3nOhyjppw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=j78M4blQyuDMZi/77ULjiVFRXBNYmihmFbvvGrUR/B76MB7mrcwxkWfW9kqmQO1BH
	 2MfZ5X/TiSQsmiG33p1FFcYDNKXaQKOv4TLD5dsG1s6tGrWl6pTwzOjZAjtUCseJ9w
	 QzGV0D0poPJXgwN3JDEI7zAo78IJLROfuUkRtv7w=
Received: from stargazer.. (unknown [113.200.174.7])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id BF41E65992;
	Fri,  6 Jun 2025 05:25:14 -0400 (EDT)
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A . Donenfeld" <Jason@zx2c4.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Guo Ren <guoren@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xi Ruoyao <xry111@xry111.site>
Subject: [PATCH v2] RISC-V: vDSO: Correct inline assembly constraints in the getrandom syscall wrapper
Date: Fri,  6 Jun 2025 17:24:44 +0800
Message-ID: <20250606092443.73650-2-xry111@xry111.site>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
References: <20250605091112-7cd6b3bd-a466-486a-aebc-7bf0b2a8ac31@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

As recently pointed out by Thomas, if a register is forced for two
different register variables, among them one is used as "+" (both input
and output) and another is only used as input, Clang would treat the
conflicting input parameters as undefined behaviour and optimize away
the argument assignment.

Per an example in the GCC documentation, for this purpose we can use "="
(only output) for the output, and "0" for the input for that we must
reuse the same register as the output.  And GCC developers have
confirmed using a simple "r" (that we use for most vDSO implementations)
instead of "0" is also fine.

Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12d6dfbdd0@linutronix.de/
Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variables.html
Link: https://gcc.gnu.org/pipermail/gcc-help/2025-June/144266.html
Cc: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---

v1 -> v2: Keep using "r" for buffer to follow the existing convention
(that the GCC developers have confirmed fine).

 arch/riscv/include/asm/vdso/getrandom.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/asm/vdso/getrandom.h
index 8dc92441702a..c6d66895c1f5 100644
--- a/arch/riscv/include/asm/vdso/getrandom.h
+++ b/arch/riscv/include/asm/vdso/getrandom.h
@@ -18,7 +18,7 @@ static __always_inline ssize_t getrandom_syscall(void *_buffer, size_t _len, uns
 	register unsigned int flags asm("a2") = _flags;
 
 	asm volatile ("ecall\n"
-		      : "+r" (ret)
+		      : "=r" (ret)
 		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
 		      : "memory");
 

base-commit: dc5240f09bca7b5fc72ad8894d6b9321bce51139
-- 
2.49.0

