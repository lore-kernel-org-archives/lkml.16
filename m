Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB5A2F3E
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:18:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745309903; cv=none; b=Z0ygKoKaM3CEnpZBLYfkri0rj7CslySQfmtzXC4crpni5dRc7hxtLVx9LGdKXxg0feLmhxawBkiH8NjgJLg9ZRFOLxdwMq3TAObN2e4Um5I3VbelHscI3fRhCSGwhE0OPfawHbZvmtjc3zPzH6gCRKgoNLTgkrTYo3qOxXu3+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745309903; c=relaxed/simple;
	bh=3j9KmCJApaonvaVVCDKGNT+Bk1EHs/Wo8fA57ArxK/4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m16MivGWXPudnntRQdPkTZslgQisfw8FT9O3ASlgUfO1F278Nlxe0Z6Xq3RqenyrGNyExPprokSaXmbFzoG1OLw91YV3mCV3xv14A6/FjddFpQis1UcK0VDyaS5sBPbyhT71/ZdDvfDUEYS4xffTtqMSs2yxLOabey49d77z12o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=IPjqBn8O; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="IPjqBn8O"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 2D5D140E01FA;
	Tue, 22 Apr 2025 08:18:17 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id cuDzCVA6Ssju; Tue, 22 Apr 2025 08:18:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1745309892; bh=HwhtpIK+2aDf7mcEu6ymEhd5Z4cQ/YSLEOg5iBLtsPw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IPjqBn8OmxGHWK/vPjvphqH6LeS+n8OyTkiKs+g2HxVGUQjhqBxUwdIpkYwuXnH18
	 5y3esvmH/FnVKIRk9lnxObbfXoW9Q1HudLn4HAkppW793BRmmpgaXynsyBLEbP0IHY
	 d9nwQZeHLhQByzSNX8KA4EPX1HI4z30v2BxunCasREC31ZqXWAfHaoRJwGKGxP7HkC
	 pXiCBsYiAooQwptvGIHhg3D/WLupuy2tFZoUxqYM9iNArkfIeUL5ZMOTuzOgmpyvcQ
	 LHAPUcUurE9IAb46sJ3A7DmUTDf3R+8gbuPTdZ2xKkML7lOV7LH+4CLQzQup498nI9
	 nBpR0nRoV46pjaM6s1odAX8MwOdISche1iDaXUKQKp9ZT/q5qCb/MYn+ZYeHz3mRvs
	 pZu6SxbDcprlPhzE0dJuS0XBWrDnQZlVdhT5er8uW8fgJfia+kzz/TFuru676hnciQ
	 VU8iFxaGyx5kHmjqBWltbHFZYC8XMIz99acoRaNFgSItMIBLoerHiavtKq8tEk3jMo
	 tA9y9Yw+Qcshkd514BJVySImHNkJHgOvz3RYISaOO57n9o3uzNUC5LMmER1V9L/JHu
	 SoUirgqtFsiMOW+yV42iuTCXjDUEQZvarnujh0UzANjeSUZkl6uTa4/ykdWo2SMn82
	 C7RJzQGx+TZqJ1v9FqIZUUZU=
Received: from rn.tnic (unknown [78.130.214.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with UTF8SMTPSA id 20D3D40E01DA;
	Tue, 22 Apr 2025 08:18:02 +0000 (UTC)
Date: Tue, 22 Apr 2025 10:19:01 +0200
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
Subject: Re: [PATCH v5 01/16] x86/bugs: Restructure MDS mitigation
Message-ID: <20250422081901.GAaAdQ9aB5KTI5INO7@renoirsky.local>
References: <20250418161721.1855190-1-david.kaplan@amd.com>
 <20250418161721.1855190-2-david.kaplan@amd.com>
 <20250418204243.GQaAK5Q807BYWlABKV@fat_crate.local>
 <LV3PR12MB9265B16CFC9D3E02C1159DEA94B92@LV3PR12MB9265.namprd12.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <LV3PR12MB9265B16CFC9D3E02C1159DEA94B92@LV3PR12MB9265.namprd12.prod.outlook.com>

On Sun, Apr 20, 2025 at 09:00:56PM +0000, Kaplan, David wrote:
> I'm not sure this is right, it certainly diverges from upstream where
> mds is only marked as mitigated if the CPU is actually vulnerable to
> mds.  I also think that imo it generally does not make sense to mark
> a bug as mitigated if the CPU isn't vulnerable (seems to increase risk
> of future bugs in the logic).

Hmm, it still looks weird to me. So let's imagine the CPU is NOT
affected by MDS. The select function will leave it to OFF.

Then, some other select function will set verw_mitigation_selected.

Now, the mds_update_mitigation() comes in, X86_BUG_MDS is still NOT set
so we leave mds_mitigation to OFF even though it *technically* gets
mitigated?

I guess the reporting aspect does make sense - we don't want to start
reporting MDS-unaffected CPUs as being MDS mitigated because they're not
- not really. We just use their mitigation to mitigate other vulns.

Then this comment which explains the logic of verw_mitigation_selected:

	/* If TAA, MMIO, or RFDS are being mitigated, MDS gets mitigated too. */

should probably say that if the CPU is affected by MDS *in any way*
- the BUG bit is set - then it gets full mitigation.

And this should be the case for all inter-related VERW mitigations: if
the CPU is in any way affected, it gets mitigated too. If it is not,
then it gets only *reported* that it is not affected but the mitigation
technique can be used for others.

Does that make sense?

I'm basically thinking out loud here, trying to explain (to myself
mostly:)) how this verw_mitigation_selected is going to be employed.

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
