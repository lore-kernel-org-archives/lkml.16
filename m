Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC6434CF5
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 11:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751628885; cv=none; b=mt0Pl0Ndx1/TwSSE4UNMJdBCqFgdXUzGEDSFq/eV8lv9NJbA2TASrgydwjySyckSXLA04AoTC1I6k/DWoE1TpL6++LMaRPB+9C6AyW+zvpa73JdAGZc9FgWCsou5Qnc3KOUtUsu4xeC6sGhT1SlFemzBFslJwgK25kGDMhlN0DI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751628885; c=relaxed/simple;
	bh=jauJUXOgS9CxVwOrtviqQhH8NcfG+vcev+cr7jqa3EQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mJUTCYiq3MdhEwn9qunYoNr7iAesX3bN9stv9O5bZhuSfL2C/ZO5FaHn7OhE+edtyEC+tKbMgHna1OgXQ4TRiy/1n76ZqU1NJPxEmrJ9gz102YqpstZ8rAyUa72CymU1Bms4oBJx92vpwMITwtTIhe3AdoVJPQJhOP5Co7AFr8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=MxpGVQ1V; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="MxpGVQ1V"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 747DF40E021F;
	Fri,  4 Jul 2025 11:34:41 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id WCeqKQIl9r34; Fri,  4 Jul 2025 11:34:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751628876; bh=5hapxyWfX3xGCoNmgWLrd+ASas9ckfy21LbXXSp6WT4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MxpGVQ1VJI7b2NMa2BiOtjZ1c2ldwbCfpKwTnLZlCqi7YWnkuWU2IvMfIhcXHoEWs
	 1b2fxAUpxZy4ELVGKvZfErID2oYI/wTc68c8BNNyLK7Gylv+hMJ/guxEGulst8RM1r
	 PdAaqVOLieAPtmK4Z3KZEwveDS1ZvZ540r8BVm8quwPdizXwjupKHw1aMJBHyclBRj
	 VR+fY8KjLH/NMDJZ4pmbHRu2FQS7IXBCWUw3q42hRh6tTnA1F8LZcKu47OfcDq52CH
	 NDCPYtjRxN6YY6d/dgOh5UUVnx1d4WWjfViwkuy8+J4Fd1Oc/S7KH+bN1E01EQhdBQ
	 nv66IonGVsm+bLjyLT0c8VGvVVfBZlDvPF0vI4amPNy+MnPQ2PvIkY2VQ5UJGLTktV
	 mML/VpLuC4b8fgdaUADQF4aSmJldytpmNsG+y0QuOlWyZqilMflQkKu/Nw9ZWdU1KP
	 +CJoW++6rkmbWF08R3PcBBp4/6DvWIKkDil5QOsEFHf8adsOS114qkSMUI7KtO+NgV
	 ZFQySTXj/bxg9nWuzu91hU/pxSFk2hH0bbjYmAWKj/DfzRPwWUwnVn0psKfq+ffWuQ
	 t6twlli7FAwOUbkZ6sj+mcefxEVMV7WmOZUIyAY2sbCGz293466u3h1ffAMGvheisy
	 09lB5S5ye5YGKRgOIJkfTXpY=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4C73C40E021C;
	Fri,  4 Jul 2025 11:34:22 +0000 (UTC)
Date: Fri, 4 Jul 2025 13:34:21 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Ahmed S. Darwish" <darwi@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Sean Christopherson <seanjc@google.com>,
	Sohil Mehta <sohil.mehta@intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	John Ogness <john.ogness@linutronix.de>, x86@kernel.org,
	x86-cpuid@lists.linux.dev, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v3 16/44] thermal: intel: Reorder headers alphabetically
Message-ID: <20250704113421.GNaGe8PbALdikAapIf@fat_crate.local>
References: <20250612234010.572636-1-darwi@linutronix.de>
 <20250612234010.572636-17-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250612234010.572636-17-darwi@linutronix.de>

On Fri, Jun 13, 2025 at 01:39:42AM +0200, Ahmed S. Darwish wrote:
> The source file uses cpuid_*() macros, but it does not include
> <asm/cpuid/api.h>.  Sort its include lines so that the CPUID header can
> be included next.
> 
> Signed-off-by: Ahmed S. Darwish <darwi@linutronix.de>
> ---
>  drivers/thermal/intel/x86_pkg_temp_thermal.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)

Can we merge all those silly includes sorting patches into a single, per-topic
or per-tree patch respectively please?

A single includes sorting patch is fine too since the whole pile will go
through tip eventually.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
