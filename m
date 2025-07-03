Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D97A2E1742
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:02:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751536936; cv=none; b=MrXaVLTe26JdvuVxUvXXYIF6qvJmgGkAI3X86OWMyIjk5RvmZ7h/yiAKAaNfc2ehJae1E/UqTb/K7R9YPZB7j/BAQ+UKPOwurLKrPXvHw7KAzFkg+La5sNIrdct0MVLo+CnGjJNZGd7myCfrSQxOtWICD+u6t1ymEEnk8prgKr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751536936; c=relaxed/simple;
	bh=JmWBIaZIEXTqWgc1d9lJjj7obLmoLdMEe/kLaCBoJ9A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j8Qgkng/fMCgDoyqKTUd2veoVV/a+MbiV3HYVSGaMXfJOnmsgSDji/C7W7MbBaPtgsvWaHw990/g2Lw11nwvmSppaj7g5EgcV8HM2V7ZHMGXyTI75HHBmjvDxV8EwE1Wi2D5+Oq0xEG7qPQ2XTb/COZ5Ve5l2LRx7SApe94juY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=XKfi85jX; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="XKfi85jX"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DD9B640E0218;
	Thu,  3 Jul 2025 10:02:09 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 6o0ZalNZ2Ozj; Thu,  3 Jul 2025 10:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751536926; bh=TsyabOvKr1X++m2XWt3fdAjbToxnuDzJpUamwg7eCas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XKfi85jX3gGnE3za3KFVqla6c4AZiJ+IbYY/KdLw3GCyWyeyAtvVSaxipbLGtd84L
	 hexkZjXToqgfg6muNvuq2TiGVdRHhcSrCHwkCpxElAYm+rKyYlm/msFoe5v9gvQx6l
	 TtTi7/WzhJsDQAFVZZmFu8C7STrncRj/32SLLiDvYxYJhn6DLYR694EW0DNS3i9OwO
	 Kx5wfOzb0ljZqox/XpRblrCD2rBmuLI9Q+byVvT6vOsA8z/EJ180Qjx3T4dU7v48M0
	 qbIpLyVqWmFtmF3Hxwk8pldZ3yURywgdCApg/y56q9leT7I7CJ4DBOwxd9l5F5hluT
	 yBbnjlySoyQZjwbbhEbf11nOu0f3JjlLoXoq+GyREPy6nIKnDj/ZDsZBDr5NbknkQR
	 ge56bcH5zQ0h+rErrF8ZXojdZJ1/iPmfdr1bA8n6U40DrBaRQmQDkodvWzQJDUzmdg
	 R3GfKfjm43Jg6DNZtVCORONU5yw4ZMpEBjCUnIOrB6Fu6JkGMVMFZWv/+7IqbMW5qp
	 X8sbQkjSEgz7hmC7SSJNBUyBiiZDWEIGsnUIQIR4+GaOOLjGISqhebXW8AxvMPyG3T
	 4N3x21MVT5EEF/Z9Gu+T/3GhKyCrT4VCi0TtK+yiPvZaj6AUK10QrE+jsBVGKH40RS
	 3aI8Kr7skn6/SWHws2jajB6c=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 921B740E0205;
	Thu,  3 Jul 2025 10:01:56 +0000 (UTC)
Date: Thu, 3 Jul 2025 12:01:55 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Kaplan, David" <David.Kaplan@amd.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"x86@kernel.org" <x86@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v5 14/20] x86/bugs: Add attack vector controls for BHI
Message-ID: <20250703100155.GAaGZVEwI9BWv9Cwjs@fat_crate.local>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250509162839.3057217-15-david.kaplan@amd.com>
 <20250630124038.GFaGKFxtAiYEBUAFRy@fat_crate.local>
 <LV3PR12MB926540104F695798EDD4240C9441A@LV3PR12MB9265.namprd12.prod.outlook.com>
 <20250701114537.GAaGPKYTbiLl4ABJ0l@fat_crate.local>
 <LV3PR12MB9265FD7451212DFA64F8B4009440A@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265FD7451212DFA64F8B4009440A@LV3PR12MB9265.namprd12.prod.outlook.com>

On Wed, Jul 02, 2025 at 06:24:31PM +0000, Kaplan, David wrote:
> So probably the right answer here is to split this up.  I'll change the
> patch to just use the existing mitigations and structure it like your
> snippet above.  If someone wants to add a new user->kernel only option for
> BHI, that can be done in a separate patch later.  There's actually probably
> several other mitigations that could similarly be split up based on attack
> vector (e.g. have separate controls for VERW in various places), if we
> wanted to have more mitigation options based on attack vectors (instead of
> just a simple on/off).

Yeah, the thought that our mitigations are not really consistent wrt vectors
did cross my mind. We should definitely keep this in mind and perhaps
restructure them into a common pattern later, if it turns beneficial.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
