Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19F01F4CBD
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370363; cv=none; b=iUnt/Ehk/ZIkSBw0fgBudL499ODatkHhiBuvcwkXFb32KTmPmX8qjMKG07Uo/Plv3eXvQxMs+4sf8c25H+pR5xaNa3GBkTRCP8o+MyLTpvcmJVV3MSrQCmiqZiS8icgwIGV6jEHRDIBTsfKcJB9oAyY87SYuDTOa0d377pV/VEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370363; c=relaxed/simple;
	bh=WUov3zffPEABuD8X7qZURasOUkj09ob+Od8PU6uZBwY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HE3NtywUnN5t7JdZX1M+8PIpRiosZw1Yx8qRpcJFQpOlL2ZBUwopk9D0SGUe6efRsBprhFL90gKP9WDfQD+bXIXU2yKJKtLGozPNcr1o+/ZJngl/OwsyAFxw3KNUy2w7VbL42Bh7XLeGEp9ESGYbGhZB0209wTmT0RiG4lUQp9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=R1oW1z7r; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="R1oW1z7r"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2BADD40E020E;
	Tue,  1 Jul 2025 11:45:57 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id k5EpbPJ8aK3k; Tue,  1 Jul 2025 11:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1751370353; bh=JwxrMiCqrfSNo3sLXL2l1pAhBThNccgGxFeTgS7+l+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1oW1z7rUUd47NafZ9JyJIoP7Ao8HACI6wZLlfBn5cz+yV6XUC7ZWL9vkYifmdwwz
	 lFBxqwWmKfU+i1Nf8MG+gTPsQsH2cqSqbI7KmZKUFEjORXI0yFOIWXFaBC4nbdhDST
	 KLFSGaOk+PRmQOxv/tTlou8xh6BKAU4QZyjpkhYT3nbe4kX0QISl8wLJNzr7hUNWRU
	 cAXp1T/Jq1unGf8PNiRKZDpYLEOwb3VpbnqyAXrjGRMxIyIS19h64KPYLzyl5WWgyY
	 HL+Jlc96q4E66uvMMMB0SnMbw+VmDmNRdCH7HgKWEB69LHC+BTh76fOCLn4avWH4vD
	 jxCfxa+5lOQhlOzGbtTkUvT/vE4+7tTrlUXNTkAozpo2PNLgMRnNKRraiZTCJmnSlG
	 BbH7FwaeIuuu5a+8pObxX0WTu5PKCHYnqKqRKLTTlyK7v6x6UU+AZOW+NMiD/ovPy0
	 6ICqHKcIJ0UQbD+6Sj4KKpNqFauZlTbi5be/b46gfMsjWcDuQuuiPaTdc6nN6UCbe2
	 YzIPU1cKKHYqySodhmnmLyBz8uOZqavC5MA+FYVUjzL5xSZQ8dk+vGm1oyTP5Klkv3
	 LNgjcd5IiUsJrDwP1yONd2bgvP0l8a9ARRrluUMvHPvhJtHghlLQNutGSlvByIGQxC
	 atJsDnLQe5NXNFk6C+vWGpOI=
Received: from zn.tnic (p57969c58.dip0.t-ipconnect.de [87.150.156.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 9331940E0208;
	Tue,  1 Jul 2025 11:45:43 +0000 (UTC)
Date: Tue, 1 Jul 2025 13:45:37 +0200
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
Message-ID: <20250701114537.GAaGPKYTbiLl4ABJ0l@fat_crate.local>
References: <20250509162839.3057217-1-david.kaplan@amd.com>
 <20250509162839.3057217-15-david.kaplan@amd.com>
 <20250630124038.GFaGKFxtAiYEBUAFRy@fat_crate.local>
 <LV3PR12MB926540104F695798EDD4240C9441A@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB926540104F695798EDD4240C9441A@LV3PR12MB9265.namprd12.prod.outlook.com>

On Tue, Jul 01, 2025 at 03:27:00AM +0000, Kaplan, David wrote:
> Eh, I'm not a big fan of that.  It's basically overloading an existing
> mitigation setting with a new meaning depending something else.  That's
> unnecessarily complex imo, and in this case is actually incorrect.  The
> attack vectors are supposed to be lower priority than bug-specific command
> line options (as attack vectors are generic).  So if you pass in
> "spectre_bhi=vmexit" for instance, that should only mitigate bhi for vmexit,
> even if you have general user->kernel protections enabled.  The code below
> appears to not observe that correctly.
> 
> That issue aside, the enums I believe should ideally map to specific
> mitigation decisions.  There are two potential mitigations for BHI, so it
> makes sense to have mitigation choices for all 4 potential outcomes.

But then having a _FULL enum for both while *also* having USER_KERNEL and
GUEST_HOST which both mean _FULL is kinda confusing, no?

And when you look at the final code, that's kinda not really easy to grok for
something which is actually simple.

So I'm not sure the renaming and adding of another mitigation option is really
needed. If you want to set mitigations based on the vectors, you can simply
do:

	if (cpu_attack_vector_mitigated(CPU_MITIGATE_GUEST_HOST)) {
                if (cpu_attack_vector_mitigated(CPU_MITIGATE_USER_KERNEL)) {
                        bhi_mitigation = BHI_MITIGATION_ON;
                else    
                        bhi_mitigation = BHI_MITIGATION_VMEXIT_ONLY;
                }
        }

no?

Using the existing switches.

Because you have VMEXIT_ONLY already, so you check that first and only if
USER_KERNEL is also mitigated, you select _ON.

And then you don't need to touch bhi_apply_mitigation() at all.

Or am I missing a corner case?

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
