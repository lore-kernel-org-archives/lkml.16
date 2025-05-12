Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB38C20322
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 13:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747057757; cv=none; b=TZF/yfZ3D6iGmuWfwi7WQZeZq7TnMAjITMB2R1z7NeEbIMxqMngB6gpY4laRFOKooGbBjQgzcDPFW9DrVxcSKY8zoR2b1GKO0xBQWevHAAFAVAzvkeCvX6CFrOKNVIOjhngK3/Gcsw3IV5YzpR7f19v4rR9OZ8WjuAtnmlFaOO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747057757; c=relaxed/simple;
	bh=W46sKoTAcXzSZ14kvpbvNaqoM5PlozMi0I1Gakngk3A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LlpOm6Vv+QAQEsQuHv3dgwWOLvVxdyKPXA2C7sUkSrrbrg0p/LRI3WzEU0xdjSi/NqC1yTd4k5yHbSpOBJ4mrfY2TmWQPxovMKRBfVzluFVQSfsC2OfxYhURaddKMr/5biZOpPoW+oHza936d+GH4paQOppy7zT7dM/ZBi1msQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=ZggClBqr; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="ZggClBqr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 82E3840E0241;
	Mon, 12 May 2025 13:49:12 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 9e8mVcqvAY75; Mon, 12 May 2025 13:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747057748; bh=cPK2BZeF54LQ+QUrzr2RXlQkhK+9iLtBaUWwpT1rT3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZggClBqrBYWecc5FS45GhGuQ5qZAkFTxkI61L5BFNFlxTukcLyU6PO4o4R9TIPa4C
	 /EhVZZOO0RcBQzin6AnMDu2zSkUfyORwXl7r9CBOuaeiya1B3zzAUZi1Ok2rJi9fak
	 1aC2YCsGlcUNQfhnBHUKPCs9AHlVkhyD+dVQmHRkesBZeyrBBmV0OLC797AZ2jHkCb
	 JtdRDpH8Yhltb4VYwDvMhsN6rVFuFWW7fqlM2WeTgB51h27eNjxriz/6iYO9x83SoN
	 8YKdRJqvSv9nvFQTySXK2cY/83aYGqulk7LOIfV4udSyxlD+oMtkpO2cQP/bE+0ltz
	 0RYuyfulHyFbWB32BN/Qbn38T32cZUxlfJBkgQVBpOwJOoYMHXn/3PHu35d9Z8F1W/
	 Aek5KnVad+8BN5mdixcQVPzGkiaRpYuAjAFtgUVudEioglTSA04fCQGR1upig38v/4
	 gP1Zej4HDIX52Rlsc5ObPaQE8QVmFi8pWhexlQvFky7HcNK6ZYNrKxO65n8Rkg0I1E
	 ynn9prkYJTTWEERwdFOemP2tirYbZBdzGJBLnUp+W4WklTkXaSYw7tcoobCltm3bXX
	 462my9EhGFrMKjMg/A1dk5XP/0JIwXbi0zG69FINrxZqFt78AUulh9ZdDwDtgpp8mt
	 /vPt5wmTFRNE3dyzZamh0mTo=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 3425240E023B;
	Mon, 12 May 2025 13:48:54 +0000 (UTC)
Date: Mon, 12 May 2025 15:48:53 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
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
Message-ID: <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
 <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>
 <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
 <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
 <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
 <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk>

On Mon, May 12, 2025 at 01:55:35PM +0100, Maciej W. Rozycki wrote:
> On Thu, 8 May 2025, Borislav Petkov wrote:
> 
> > > NB people also fancy old cars, or boats, or trains even, not because 
> > >they're faster, more comfortable, or have any real advantage over modern 
> > >alternatives.
> > 
> > 
> > This fits very well, IMO, with Linus' suggestion to support this stuff 
> > out of tree. I think this solution is the optimal one for all parties 
> > involved...
> 
>  Would kernel.org git infrastructure be available for such a project?

as in hosting your repo there?

I don't see why not:

https://korg.docs.kernel.org/accounts.html

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
