Received: from xry111.site (xry111.site [89.208.246.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 987541C9DC6
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 15:09:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=89.208.246.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749049799; cv=none; b=KcFWgltWXU7l4AKl1RZKxE0LSLVgs9epC+yhx2xrPgQ2DNHaeI795gUFflNsmBzu51sf6/deAbRJ/CUhzicwgQHQ377IbVqno9nlGMlz1qhO4pJSWrNB2Obu43v2SZZ9LXGqFK7x+h2iDJy5x01brUJvCAXZybNTUT2TxxcSgBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749049799; c=relaxed/simple;
	bh=zdu+2ETAGAUTf6aB9sj7/U9Uy8zeZ3qBo7VIpRAhIaE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Ykj5n+nw+1SdHb3DmFNrAG5EwbW8LVN9pw9o2GCdQHt0ZB+QjBdIvqpV2XSox614uhEvE2cGaHTZM9zb35e+yW7ZgT/Ri82BRWcClPFdS7GhbLBSO1Aq3QDifk2WeO6ce8nawUAaae0KDOkOkMi42remtLtX9mmDyYKNGssmTsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site; spf=pass smtp.mailfrom=xry111.site; dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b=KifjrDEx; arc=none smtp.client-ip=89.208.246.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=xry111.site
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=xry111.site
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=xry111.site header.i=@xry111.site header.b="KifjrDEx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1749049795;
	bh=q8h9kR1SVvQAsWuLnRY9YRkZHJsMjxdtRkk78Wgjdw4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=KifjrDExQCQTOpSkL0e//z15yMT5tQHomdzwY0IsE/kFg+gnlj8Sh7M/magBS4m3B
	 kO71Sukk0TpN+u0jKY1BRwYlsZp5UU7Yvq/WQ39ZSLDlKOnFkh+0Df0iTRovWI5DEs
	 XRtr7n5YcP+oQ8J3OLqCdkH7wf51FrunXFWVNRy0=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id 80F9465F62;
	Wed,  4 Jun 2025 11:09:53 -0400 (EDT)
Message-ID: <5065dcf8fe1995859874196aa9ea5c0bff056ae3.camel@xry111.site>
Subject: [PATCH] RISC-V: vDSO: Correct inline assembly constraints in the
 getrandom syscall wrapper
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Wed, 04 Jun 2025 23:09:52 +0800
In-Reply-To: <57a1ced6-406b-4197-96ca-6b83d99ca1a0@ghiti.fr>
References: <20250411024600.16045-1-xry111@xry111.site>
	 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
	 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
	 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
	 <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
	 <0f0eb024d7ed062141a8aa048017e6f7ef7c1fd4.camel@xry111.site>
	 <57a1ced6-406b-4197-96ca-6b83d99ca1a0@ghiti.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

As recently pointed out by Thomas, if a register is forced for two
different register variables, among them one is used as "+" (both input
and output) and another is only used as input, Clang would treat the
conflicting input parameters as undefined behaviour and optimize away
the argument assignment.

Per an example in the GCC documentation, for this purpose we can use "=3D"
(only output) for the output, and "0" for the input for that we must
reuse the same register as the output.  I'm not sure if using a simple
"r" for the input is safe or not here, so just follow the documentation.

Link: https://lore.kernel.org/all/20250603-loongarch-vdso-syscall-v1-1-6d12=
d6dfbdd0@linutronix.de/
Link: https://gcc.gnu.org/onlinedocs/gcc-15.1.0/gcc/Local-Register-Variable=
s.html
Cc: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
Cc: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Xi Ruoyao <xry111@xry111.site>
---
 arch/riscv/include/asm/vdso/getrandom.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/vdso/getrandom.h b/arch/riscv/include/a=
sm/vdso/getrandom.h
index 8dc92441702a..0d84a38e79da 100644
--- a/arch/riscv/include/asm/vdso/getrandom.h
+++ b/arch/riscv/include/asm/vdso/getrandom.h
@@ -18,8 +18,8 @@ static __always_inline ssize_t getrandom_syscall(void *_b=
uffer, size_t _len, uns
 	register unsigned int flags asm("a2") =3D _flags;
=20
 	asm volatile ("ecall\n"
-		      : "+r" (ret)
-		      : "r" (nr), "r" (buffer), "r" (len), "r" (flags)
+		      : "=3Dr" (ret)
+		      : "r" (nr), "0" (buffer), "r" (len), "r" (flags)
 		      : "memory");
=20
 	return ret;

base-commit: dc5240f09bca7b5fc72ad8894d6b9321bce51139
--=20
2.49.0
