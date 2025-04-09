Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4136D26A085
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 15:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744213888; cv=none; b=gqrOOhASh2afrvENHJqfeyCw1Vducc2PtQryn27IvC2AorxxfouMpQKGCTg1EVLzkPgd2jL76hQnMiEdBy/SvkODekK2EiKirtwJy9ALqHZUM19E64CCUPgFClgui2f3cgS0zjEf1I99ihIpaxj+VlL2NdK1Ehl4xoMfcHC+LJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744213888; c=relaxed/simple;
	bh=Dq6dHHPYmSjlOD/Kgg4/4XEfD6hkJkfImhiGkZXmJBc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XlWJzd4BLcymjZho9Q6La3y7JFgxpbGko/7OzXaobvf2nFC+nP7Sl6Ts3KkTH79R3orLg8R1DFQWHjNnN09ISUD0cNFnkFCD18jp652+plX/w2Yg82W9lRYQjHHamZKIxoldkUsWV3EDqc45H56Is46BWtr/ApiVvAkyiAH232s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=BbZ7RnMm; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="BbZ7RnMm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id F00F840E0230;
	Wed,  9 Apr 2025 15:51:23 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hh-W27klhieP; Wed,  9 Apr 2025 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744213880; bh=q4NZoW9zZYjyVoEnIfke0UamQPZzyA1mCfd5/MB9sGc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BbZ7RnMmwbQ4cQ8nYVynvondfABnUpDG3VgVja3p6Cs98z/i3XSYssmgInZ2OZ6zY
	 RXlHvUntzG7WLC1K56ZRYrY36otxU7+2mtDiKAJODIRMxOGR1L+vAUlL0jMWtzbUWy
	 MY6zQTrkUE5zVUrOJpxLfl/JfLSP0c12oJ/Ue7sCXvO+2UU5I83n0NcwMUoJA0KAxp
	 0q8L5Q/zD5TZcIHmjKrH36+gnF+7CPwLITdBRL4c/xTUWuJGM5XtYCM4IWrjt+LlY9
	 +98thpONADmddeuQM9flQa2r22AkAyFptmu+qmoxVK/SKpxmuzAF2UWb5M2ev0vvI9
	 XUUFti3J6sFQ5Dy85jnwh3C5BOnt6zbX81rWhc/MHyVn92d6DRNALr2lw7ZZH8nh/G
	 0n28BeT7sY89eJPnEhaiZv6onEXce+Jd3KEY3/YsuOx6KuTHdM/dUx+wJyxIUcXr1q
	 SfOKS4uWGGED5oBRLMJBkNF7ny8LqG5J7G90NQntJ6Q/BfeBVUvjkKVR3kPUaxJD/h
	 mYfeLtKvYBLU3YwXRNtEAZq4KtmWLutrXtmYVWxYNoVG/74iZG4LXWKGbhCTF5lCcZ
	 V+gYuOzyayWkxiF96mqxfK1XcS2bLxExQ1x+fTN1Q4Pv4FfzHz7JkOgaNbFJVMl3WX
	 gWwCbcb1hUPUKirollIIuDJA=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4A7D740E022F;
	Wed,  9 Apr 2025 15:51:14 +0000 (UTC)
Date: Wed, 9 Apr 2025 17:51:13 +0200
From: Borislav Petkov <bp@alien8.de>
To: Dirk Gouders <dirk@gouders.net>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Linux Kernel <linux-kernel@vger.kernel.org>,
	Linux x86 <x86@kernel.org>
Subject: Re: AMD Ryzen 7 PRO 7735U: 8 instead of 16 CPUs?
Message-ID: <20250409155113.GJZ_aXccanDyIyhAP4@fat_crate.local>
References: <ghlds9lidx.fsf@gouders.net>
 <20250409112414.GFZ_ZY3k88JhYTbYJ0@fat_crate.local>
 <ghplhl1qm2.fsf@gouders.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ghplhl1qm2.fsf@gouders.net>

On Wed, Apr 09, 2025 at 02:11:49PM +0200, Dirk Gouders wrote:
> Oh well, thanks for the hint: CONFIG_NR_CPUS=8

Yeah, that option has been known to be very strict, stingy and not giving even
a single CPU more than specified!

:-P :-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
