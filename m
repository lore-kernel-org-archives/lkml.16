Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A399B1A254E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743684955; cv=none; b=XC3sx54nSBaRxwAKEtOdTbKm/U0KUdedLkSdhe/a3nCxTK91e9l+Mrqbb7x6c97eAvXVGRnlcNMk5ppudhO3wVW/Yb4o1Zw3jvQv1RuOvoMXgjgZ9ueB58Cynq0FgR3513RL2OJjJXKCmdNdn2lURNwGLZw8EuQ3FDD6L9d6bZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743684955; c=relaxed/simple;
	bh=C10OdcGBn33pJXCZiUpVw+j3nj2oQmdNb4O0hwzPZF8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PY9MASdDGUJuySdRT8i4j90G+Kk2lfHf5aHpEnHgvsIU0QVdoEUJFxqi0J8yiYno5fyvVAmcjAJbGfSqQPHl7Qoss/RHVVvJ5zi2vJVRf5OD49uoSt2LMox4WQxnCxoSWmlzvKppl9Ia6Qakndso0mux3u+lNMH+08L8k0q86Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=eUj8e+7p; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="eUj8e+7p"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 5A20940E023B;
	Thu,  3 Apr 2025 12:55:40 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id j9LdIdIV-FA2; Thu,  3 Apr 2025 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743684936; bh=QQeZ9ETgnT0tTFQs8mRusDd1YHuQGZf6nQMVjI+wCew=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eUj8e+7pqDTnV9wmh3ufWkyWy98zGx9yyja/z5DNtCw0gKg8yy6zFGYVdyywhUn+i
	 OuTdw20hvnCQe1uomndxatgDEqWmUQmWjg353Q8c6Y6RS3o3gCR+ex1E/bui7JkfYX
	 edV7rTWNCoDwblzP1kGOCuOkh6io51H9afuxNuaKUUbc3Xs4OUq+lFE9TlknWUyXOv
	 SkBaow2ul1I2cb6fIIXG7xL9+lH8L8tvBygoxq7334P5MRWsh8WeeZOP+ZVSvzJlBS
	 RkPplk1Ahhi1UZMt22Q7Ld37EJJ4i8Y/4I9mGFpjEV+as+pMwvUs4yvMU/ladt15cY
	 MXz3oBJ/VvVsNZHfEIvGpM2XtB7xlOSJ2chekrhwpwxgR2SgAnt3qlBRNttWVjQEtX
	 R0p0LsxPq1ZvfFJi7xgD80yW0+voAB/Jvt0w0IsVXasHhl07uXkqYBVjssyzdsa3F0
	 KolKDEvHkGzIUYK/xc5eLDLwFu//Px7575kT+mNq1qq7ehRK5XXtnZHJ6jfJo4Q9RH
	 Y0mBAqYPvtPgBcgv4I8wv7Ezzy8IaimjyPgu7wQip6Znak5r6bMFc6npupd/OCEmgs
	 VpZs8/C82o5giySU6M6A23heqaEWlxI8YVUyqg3sbQhnQ/QH6md/xRqx7qE8eF7Slo
	 w522pFVLws8buf3MQy5Zdvh0=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 6998E40E0232;
	Thu,  3 Apr 2025 12:55:29 +0000 (UTC)
Date: Thu, 3 Apr 2025 14:55:23 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH -tip v3] x86/idle: Use MONITOR and MWAIT mnemonics in
 <asm/mwait.h>
Message-ID: <20250403125523.GHZ-6FO2mNZcUta1RG@fat_crate.local>
References: <20250403125111.429805-1-ubizjak@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250403125111.429805-1-ubizjak@gmail.com>

On Thu, Apr 03, 2025 at 02:50:45PM +0200, Uros Bizjak wrote:
>  static __always_inline void __monitor(const void *eax, u32 ecx, u32 edx)
>  {
> -	/* "monitor %eax, %ecx, %edx;" */
> -	asm volatile(".byte 0x0f, 0x01, 0xc8;"
> -		     :: "a" (eax), "c" (ecx), "d"(edx));
> +	/* Use the instruction mnemonic with implicit operands, as the LLVM
> +	   assembler fails to assemble the mnemonic with explicit operands. */

mingo, pls fix up that comment style and in the other spot when applying.

Other than that:

Acked-by: Borislav Petkov (AMD) <bp@alien8.de>

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
