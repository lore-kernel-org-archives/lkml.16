Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E01DED5E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 20:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746478478; cv=none; b=Mszgp6yfqORgrKOBptFzzhj/IibDeHS/M21/xUJlAVLup46ojZSnn6gFBsrKspxDA6Zsmli5nMhi0wZ0ej8GqDd68wxxjABbwnrjdwfLlmNWNWu02PuvsB7gWX95J/kdMudmQDwDkcZL1SYAhiFfSQMfNVqizzIYR0kmOEcwajE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746478478; c=relaxed/simple;
	bh=pfa+PYeg4WPVwVxgRN4mqVIVdS5dCfF6BR4NmCcohGY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N8iShCNQWW4MeKNR8q0++OPppsodN3GgOs1mtdLNfSobGF03TTkCG6YRLSpVkNPDWXwO7BgMo4ezkwsMovaTOG4jyu6xIGPF+p1YgNwJzIMh5hl/8gHDYf78WYMtVH38cuQyekXzX0JO5lVBMR9fZMrXXmDiiGrDl2Llut/vRLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=HySrKJbO; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="HySrKJbO"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id B302E40E0173;
	Mon,  5 May 2025 20:54:32 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id su_X-5hhMmCg; Mon,  5 May 2025 20:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746478468; bh=NF9NxKE8++1cFpk51jh/WPMkv9XRVzQgo4qOw9yfOj0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HySrKJbOVoSqEUY6UOwErCXwDMheKjL0vOUBNa9bQ5yNLJw1fkR4nQBz5w97FNSjq
	 yLiCyl6Ydu6rnB9xv1bp70reSMddbZ1IodX3QJ1ZoVfduy+hZvBmW4j0AqoZBLJjK1
	 NXFqlXaEnalLc4kMQpGzdrwZrIkWNEw8vlu2OD4HYUoult1DIZGb3d3AL17SvMeITP
	 6sgWyQWeTfvMMmFDeQesOtmxeyMFRf5uLiND5hHutAC3Z9715ljTGCgOaOQRKQHtic
	 E86W8vPhQ7/oafCEppXTYOcAmLFUSg5wxXXLl0+zqLcaK8uaQ3viYX04wawtlIXar5
	 t4xxjxBXLko/0zUQwNXJvIvkOrOvz+qxHIx79PzZalpYYmWP4oeXvJBL7f6ekLcP0i
	 hgejLlF566u00ot50dfqEn2Rtyxkuz3pnlJ9TUsPvaJVbbbooFanoCJjNVxiaPW86o
	 SJRHweAftyLlo5phwRlGwYxkTAALlAI3fRTBlve+itPS1QViV7zkaC2kjWfUvQdadz
	 32NoFzKugBAxN8CK647T1KXs4cpKzd//bOXNJnDW4XKm8XjFKzgpcWXzLO4nAMkd+7
	 NLE97zLIQtzemP9SpHQKuuKDWPHQ44pm/yQHDy4n7nelDEvBXIliAw/MORBMpvPY1s
	 /Mko/vBobHIjN5Kqu7MIhMI0=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 322EB40E01FA;
	Mon,  5 May 2025 20:54:14 +0000 (UTC)
Date: Mon, 5 May 2025 22:54:05 +0200
From: Borislav Petkov <bp@alien8.de>
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org,
	"Ahmed S . Darwish" <darwi@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	John Ogness <john.ogness@linutronix.de>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: Re: [RFC PATCH 0/15] x86: Remove support for TSC-less and CX8-less
 CPUs
Message-ID: <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
 <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>

On Mon, May 05, 2025 at 12:57:40PM -0700, H. Peter Anvin wrote:
> One thing that happened with i386 was that we found out that the only
> remaining "users" were people dragging out an old machine to test if the
> kernel still booted.

Follow this thread:

https://lore.kernel.org/r/CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com

People booting latest kernel on 486 without CPUID support. 

I can't find it in me to care for that old rust and yet I did it again. :-\

So yeah, +1 for removing old code which ain't worth maintaining.

There's stable and older kernels, those folks can use those and that's it.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
