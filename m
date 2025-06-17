Received: from mout-p-103.mailbox.org (mout-p-103.mailbox.org [80.241.56.161])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767DC2EF9AE
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:23:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.161
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750195405; cv=none; b=a0kqqcQ7Ag+XPkcNK61THzavPjK5vjRG8Vh1445bWWVwyZMlCnvfjcJ76sjmm0D9WHjkTZHBOjzS8tge330EHbG6Shs9SK1Gqga6keBT3/+Q1C+g7cdqmjrmxvs8RGsGBmOECLnhi/sLM226a0PxcJaQfKZZB+kEKh1Rdn45G7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750195405; c=relaxed/simple;
	bh=u3ETMSVlA0hsOUAbzx6Ga3TEuifvH8QFLOaGYjaHH0I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iYRRPVG5Mzsk+mabLkw4wy1m1+v/V5Ng29MByBoImavvvf+Enaij61HAp4tTPJ77eMobUapQAhXOWTTA1HC2fLy5uvS7U2fo8DB9sillMpCBT0TnTmjwuvzORVzgvqJVf4C1v4FcjttGJkBK/MFePDb4iOtiT7iKMdv3X8xFoBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz; spf=pass smtp.mailfrom=listout.xyz; dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b=bDMvtzXX; arc=none smtp.client-ip=80.241.56.161
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=listout.xyz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=listout.xyz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=listout.xyz header.i=@listout.xyz header.b="bDMvtzXX"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bMKbp4Yrtz9tCC;
	Tue, 17 Jun 2025 23:23:18 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=listout.xyz; s=MBO0001;
	t=1750195398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=jxjjjHrtAQnHI5BFkgc87LjWdlMiW2XFmZbt0j/xFEU=;
	b=bDMvtzXXN0C5GyxFNxDNKnKtCdazj0QBrA/xYV+Okhn/iH7OirejIg6aVXsW1sndZQ8xQe
	i28xlx/rort7RxGZJh4KIEqdt6NqKxevSxOwnxBLRwYL8KOsLbaV41k5mSN2+bb5HexxoO
	x/YItNXqORLYyb6HzAeN2q8q9A/O4GMltao5nbl8isTlTPqJmS6saeHUco9ZgaLWZZQOps
	B0NSMFrfeapixsNnRcoQpNg2LZMDAC1LEOwysWbtCdOV/1Mc2HzuqztIfwjQdlHOKtFHcc
	5arLkohBt4aCBhK2Xcw7pP8RF33hpgolbv/sDnh6RfIGsxiZRa8v2mAdaQtH7w==
Date: Wed, 18 Jun 2025 02:53:08 +0530
From: Brahmajit Das <listout@listout.xyz>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, linux@armlinux.org.uk, arnd@arndb.de, 
	akpm@linux-foundation.org
Subject: Failing to build mainline kernel for arm
Message-ID: <s6pt2qblbwmw5uz7u27ypyyercpm4fbd7qt7qaabceasxdtd3x@jucvfmzzcueg>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hello developers,

I was trying to build the mainline kernel (top commit
4663747812d1a272312d1b95cbd128f0cdb329f2) and came across a build
failure with allyesconfig.

$ make ARCH=arm CROSS_COMPILE=arm-none-eabi-
...
  CC      kernel/fork.o
In file included from kernel/fork.c:93:
./include/linux/kcov.h:113:6: error: mismatch in argument 1 type of built-in function ‘__sanitizer_cov_trace_cmp4’; expected ‘long unsigned int’ [-Werror=builtin-declaration-mismatch]
  113 | void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
./include/linux/kcov.h:117:6: error: mismatch in argument 1 type of built-in function ‘__sanitizer_cov_trace_const_cmp4’; expected ‘long unsigned int’ [-Werror=builtin-declaration-misma
tch]
  117 | void __sanitizer_cov_trace_const_cmp4(u32 arg1, u32 arg2);
      |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
cc1: all warnings being treated as errors
make[3]: *** [scripts/Makefile.build:287: kernel/fork.o] Error 1
make[2]: *** [scripts/Makefile.build:554: kernel] Error 2
make[1]: *** [/home/bdas/linux/Makefile:2003: .] Error 2
make: *** [Makefile:248: __sub-make] Error 2

I bisected it to commit e0ddec73fd4822d2ffe914d5ce3e2718f985276a
"kcov: add prototypes for helper functions"

While reverting the commit does help, but that would not be the correct
approach I guess.

Part of the commit modifies include/linux/kcov.h

	#ifdef CONFIG_64BIT
	+typedef unsigned long kcov_u64;
	+#else
	+typedef unsigned long long kcov_u64;
	+#endif
	+
	+void __sanitizer_cov_trace_pc(void);
	+void __sanitizer_cov_trace_cmp1(u8 arg1, u8 arg2);
	+void __sanitizer_cov_trace_cmp2(u16 arg1, u16 arg2);
	+void __sanitizer_cov_trace_cmp4(u32 arg1, u32 arg2);
	+void __sanitizer_cov_trace_cmp8(kcov_u64 arg1, kcov_u64 arg2);
	+void __sanitizer_cov_trace_const_cmp1(u8 arg1, u8 arg2);
	+void __sanitizer_cov_trace_const_cmp2(u16 arg1, u16 arg2);
	+void __sanitizer_cov_trace_const_cmp4(u32 arg1, u32 arg2);
	+void __sanitizer_cov_trace_const_cmp8(kcov_u64 arg1, kcov_u64 arg2);
	+void __sanitizer_cov_trace_switch(kcov_u64 val, void *cases);

Maybe we can do something similar to kcov_u64, like kcov_u32? But I'm
not sure.
-- 
Regards,
listout
