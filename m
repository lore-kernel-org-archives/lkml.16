Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2D82798F8
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 13:24:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751462681; cv=none; b=h/CBYZ+7HlZOqnGsXtdavtWE7R1a3Fuu0OgCJcApDtJwA4ncmJoLUFSwGVSTY5gpzcuvOd8U+vdYj5HpaXcfKfocBljzEecuQVmc3kcaCC3EZ+qH4MKx9WoEICyfyQ+vtHMbFNDHQ+vAaM89jsjLDrbccAIAIR6hymYXoDYhRbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751462681; c=relaxed/simple;
	bh=Niz+m0D1JqkH5aTX+Uv8Rcb69sVNw/rYIAm7h3Hs6Mo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a6jP1A1+xVtMj9p1NRU4q0+rgGL7ubEKJXPuLS7yQC+UeQzw40Z6ErXCzWCkB9n0J2wD52AvLjtzvYth00zHeKOMMr2aQwXZUmGb6cbNB77z2HM1JYFVaFsYPKMqpJsmoMc0UKFTvgIa17hA4gRnSkXlhMs2oClZCOLKr0IP3VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=c1yDFmGs; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="c1yDFmGs"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2799B40E021D;
	Wed,  2 Jul 2025 13:24:36 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id mqwxr6HJcW_k; Wed,  2 Jul 2025 13:24:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751462672; bh=5eqncYxutXgmX6kJnSEQAbsb0Ij4/aMXV0r2ck6ZhQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c1yDFmGsnzJXOSIA3Db9yDsJRM5HUtD9DCDsqz5acK6Q8RDhrd1UzhHXK+DORXBNj
	 n6JxT1jW+ME9Ghq9MoDQJEc9mLwCr5hQVmAeDDOvOmq5JcD2sJ1kguoEsqpHRe09io
	 em2blc4SK67v5Gw2zdwksl03wmhO4gkihMBSww8oDGtwXca3+w7msc6QoA4Vs6XMD5
	 UFh6uYYglxKDLT1VZh0y157pq9DRMkBuuEgtmHGO+1UD9droeuXl/yL5iDLUVTeJVa
	 nsnmLAyWl0okfbi/cnteU+OvkyHhi9PMpPTmV+S13paU7+VBG9OtVfA6oaDY/8eHVH
	 BJ6dHjn4GCe0A3gc1g2Z584oXOEbTe4hs34PR1Eygxd7c3feGbTrKBn6iH8ZMnP6nA
	 XpOUJ4uB/4+K5jgKEI2IE/QFh/1MJWLbdYvlwfe0jr28Lkyb6ZRlVxReIiqr9xCI8F
	 dikg/byc493ndCFdc8X/lFxz6sJb5gQAzbWtIgjtsnNsQlvTYma+kmiD/H+fBGjODK
	 GiYHsxrwfcxPwtp4aNfE+ENb/SD1us6+heSCJSkjj+vvSrBeBqPuxHi0BZDRkprVXR
	 Wjd548mn6cXZ/v8+bicOCck3OJ68gJVcTGairKCIoYR6UTtjGmM8DKFACjF1etiz+9
	 wlZk1QuNIG1hnaiLGlFIJWng=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 7EA4940E0218;
	Wed,  2 Jul 2025 13:24:22 +0000 (UTC)
Date: Wed, 2 Jul 2025 15:24:15 +0200
From: Borislav Petkov <bp@alien8.de>
To: Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>
Cc: kernel test robot <lkp@intel.com>, Thomas Gleixner <tglx@linutronix.de>,
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	linux-kernel@vger.kernel.org, x86@kernel.org,
	Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>

On Wed, Jul 02, 2025 at 02:16:15PM +0100, Mark Rutland wrote:
> Sounds like a plan.

As we figured out on IRC:

https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/

"clang's integrated assembler only supports concatenating strings with
'.ascii'. There was discussion of allowing '.string' / '.asciz' but it
was decided against [1] because it was undesirable to match the behavior
of released binutils at the time, where"

and this seems to fix it here:

---
diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index a185855ab158..46d9eb64bd18 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -9,7 +9,7 @@
 #else
 #define __BUGVERBOSE_LOCATION(file, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
-	10002:	.string file;					\
+	10002:	.ascii file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\


I leave it to Mr. Z to sort out.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
