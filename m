Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D47361F03D3
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679206; cv=none; b=iPEPeDdMZNgoJhrnIedMrBeh9sh4E4yjmr6fiVrxfuLWBu2JH1KsgeFT7fvT8a7/uERjaO+Ole8HMqEAq4JKvf1w9ul1cJr5WpFFPitx3XH41PMmjJldnuy2zvKpnykorZ6PgHAI866WvFQJcRUULqtNhAOokGjVOUk8nc20BRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679206; c=relaxed/simple;
	bh=k/U2bl4kww5/L/4ABbxa5XieKnoubtwag8Dt65pOf4o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oJy/qAe6jjz4lYZEErz8JOp47L6sp+M0z79TpkMLNcIt3lwur7lXC2wkP7mL646G1C2HOG6zTPgTkl4kN8r96mDZmml9evMbU+Bz5M1wetNmRx8djS2fn2Ugi2J1X/jub14F4h1sSnE/05rI11lGhBiDoLr4Me6iRzvFllzvG9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=KEfAFIqm; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="KEfAFIqm"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 750E340E023B;
	Thu,  3 Apr 2025 11:20:00 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id r0XAwWTrqA3v; Thu,  3 Apr 2025 11:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1743679197; bh=lyi7V8D3zQXWg0PnBnb50Fi5zbVepvMfApKgNeQc2eE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KEfAFIqmljgtu03/6/1cWXsJeQ3cejbkLJYDo02KQYmDC/Ia0rFpeRKMaClAJRclu
	 MOzfrkuZ279lEyu1CnnnS2V83MnJrgo9Ov92e0S7UF6jK1IgS3MFEJ1xTb3fPGdzYi
	 h3bRv0xTDNEi4cmWRH++eiybW7NoxJcGcn1vrTScKYMAnAP8kwdxSiDkqr6KvzCZb3
	 MtIyohDZ8PMLemB/FneZ6VS6Qa/qxsh10fYsvPthbxysVC6EvEPsqE9wAbTQCU0wuI
	 hOxLW4TKwAW1KEnwXw4v9L9vS0UUFe3CEYVaUpOqJzSVhEoLVflBc+54vB3cnNF0gB
	 XrGHhTN8/5MeFrBtR5bRa0uRm9yjKoZUR+E0mqyHFntOxQtcxpJVkdE/NtVmFoH/MC
	 bkjF82L2/CBSd1cDyC4+p2y0+uz/ErbTTszV0PTtbVNNQ8/bqG+ACY9iq80rxGUjnR
	 WUm6L35mmnPs7m0GVItpU2nWAag073o0Hee5kboe3UnYrdf/VgsR0HGjERSVO3X+pN
	 rHSm7soheOUZnXW4geUGRloqcnIi/prPbBNRYZGugRyJTm8zErmtu+JSIrsMqV/qjZ
	 XssfWfXruS1srsIx8FxPnIB4jXvz940lyYudWyJL9eo2HIw6962DRW0Okhlounrz5E
	 w4k2S4QNoSbAoPdJqTtcbIlQ=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 40E9F40E0232;
	Thu,  3 Apr 2025 11:19:49 +0000 (UTC)
Date: Thu, 3 Apr 2025 13:19:43 +0200
From: Borislav Petkov <bp@alien8.de>
To: Uros Bizjak <ubizjak@gmail.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH -tip] x86/idle: Work around LLVM assembler bug with
 MONITOR and MWAIT insn
Message-ID: <20250403111943.GCZ-5uzyd-HuhAcNui@fat_crate.local>
References: <20250403070453.214190-1-ubizjak@gmail.com>
 <20250403082508.GAZ-5F5EMVZq3-6Zoo@fat_crate.local>
 <CAFULd4a49RRMKrSVh3Q5zpeK4EJVW61tm=fCN4aOWX8=x8rKnw@mail.gmail.com>
 <20250403092218.GBZ-5TSiyjNRAcBxQo@fat_crate.local>
 <CAFULd4axo8ZOVJwRkqhi0nFYAveX6mBpd0Bwte+rYp=umHTP8Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAFULd4axo8ZOVJwRkqhi0nFYAveX6mBpd0Bwte+rYp=umHTP8Q@mail.gmail.com>

On Thu, Apr 03, 2025 at 11:27:02AM +0200, Uros Bizjak wrote:
> IMO, in this case the fixup also documents the LLVM bug, so perhaps
> the fixup on top is desirable for documentation purposes.

No.

1. You put a comment over the function so that someone sees it and *actually*
   fixes it in the compilers

2. Explain in the commit message of the correct patches *why* it cannot be
   done like you were trying initially and leave a lore link into them so that
   people can find the old discussion.

Lemme zap those patches so that they can be done properly.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
