Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39F1A24BD04
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:39:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743680400; cv=none; b=MpKHW9BaBZLNDblg7NXZluDZPx4scY2OAT8ZGVAi9hn3SpH+4iXLpVqcYgu+QY9GWGJiQUWab5qGE5Ve/GHo3mBLf5uCmmTfSM0lW36OQ4YGyM6ATfMaRoQmy1Axcy5qe2Y772GJIxTLXxLh5zKRC7Ghyk8a+Vi/b/8zT/Kqago=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743680400; c=relaxed/simple;
	bh=n0o+csPwq+NqjUtGPi4wPVM7g0Cl0Vh3t7uEp0CCEXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TqO6zoP0YViN514TulaUdQCakZgszHEyYj7dqm2Obk7xxI98EXmzFQX8/PSqaCXG90dXIwjk5doPWqqERVPZxDKSt2/4QKdUi3AH2mVloMftgdMp0pb8eNplZwcVI8vnXSWraq/r9ykZ0tvqULXFoEyu+RxP3mxj8GrzqMmTxAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=gfh+g3Yt; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="gfh+g3Yt"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 10D1C40E0214;
	Thu,  3 Apr 2025 11:39:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tcTB4Mk1quv1; Thu,  3 Apr 2025 11:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743680393; bh=16e+Tg1EbKS56ay0gZLZ8mzKZnNEs06n3ekKkYBAoco=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gfh+g3Ytdfkwt57Ir5fq5hqKy/VtDca+CwRv751h9GbbtkkLgnoSKcHKvFdsMZmHd
	 9QS8VOiBzDXaaQpGzCuB6+GhUcZQIukgkU0pOQA9ke928UXBCXHv0RoDoVAg0NZ1Fj
	 DwtcANpKu3DkopWVPPaA29pYcY8DRoxFZEsMsfEc5tavkjqzqBVM9LF/0sW0yH4gOD
	 iW7qblM22JO4bAO4NaLUe31LqJx4gAY5aDBCZy72uK7YTFaCgGxoZonDFrT9Dmx1bv
	 hec+844R3aGQK4/QCOcfcd9SGtzkhWQUERVotheVrJzsY1DJX88S9CgU+NzN+K4WWF
	 +9mkXM1vbqshYfQYvF09N2NGd/UwmEXww5IQz8kf5wnI2uVK8eInN31FAda11K9wf8
	 0Um7nrZ053+C3QHAsmtKTO6nnHeLOV1Ps6jAfut3PzvDrf/scJcMomaLBHFiQtD+QC
	 /S8Tn9DlrKXkxfD2E/phmBHmuNrq+RGLv4qT2ZNVOlIpksxPVOVHaECIt5lDndrk8y
	 0VwNxiQolk06KrPTV6rqm0GY/CXYXugTO2Q14B8KnqB6rEXQhkdGZ9jzBRoVvCILS5
	 Y809YUvWJLVviizUBxhEnj7vFY4RZ1pA2JRD8d0KDkCWdYXMbzBiAkVa6rnO+07pw5
	 1NavWK68zgMgqF0O8lZd/oGs=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id DA39C40E0232;
	Thu,  3 Apr 2025 11:39:46 +0000 (UTC)
Date: Thu, 3 Apr 2025 13:39:41 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ingo Molnar <mingo@kernel.org>
Cc: Borislav Petkov <bp@kernel.org>, X86 ML <x86@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Rik van Riel <riel@surriel.com>, "H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/tlb: Simplify choose_new_asid()
Message-ID: <20250403113941.GEZ-5zfeSoAcGN1Ygo@fat_crate.local>
References: <20250403085623.20824-1-bp@kernel.org>
 <Z-5ytG_1vnf3uj8t@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <Z-5ytG_1vnf3uj8t@gmail.com>

On Thu, Apr 03, 2025 at 01:36:20PM +0200, Ingo Molnar wrote:
> Note how the cleaned up return signature not only makes the code easier 
> to read, but also helps the compiler generate better code:

Yap, and the psABI guarantees that struct is returned in a u32 reg so the asm
looks pretty good.

>   # arch/x86/mm/tlb.o:
> 
>    text	   data	    bss	    dec	    hex	filename
>    9341	    753	    516	  10610	   2972	tlb.o.before
>    9213	    753	    516	  10482	   28f2	tlb.o.after
> 
> Personally I also like the non-bool new_asid::need_flush easier to read 
> in this 'HW interface' context.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
