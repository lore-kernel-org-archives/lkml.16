Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D3111DFD84
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 14:35:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747751755; cv=none; b=RTWwKXp51wF9UckC4LI/ea/9L6LvL+jEJQaF4/nZiBzEipHGYRCMrC6HpGGPNaiScx7nSzx6fA97tM+ahClT3bxBAHmcZpU10S2Bd3034a0/v6TodrsYlTRtEoGkVAU8fZBir0UCeeQXXRyH/GS5hSa+9I3CxHoNXRcnThqIQjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747751755; c=relaxed/simple;
	bh=oJBQOa2GEwHEtA5Wa1brzfL4kjnHeEJxtnJPod039Uo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbjKqzdFf7jv+cm37TO3+Q35o0Gjw8M0NWzOWpImQ0dOId95/BVSLIpmgvUrmIsrZ3gD2cMtVerqTKRzo7OAGM9zeMkrOSeKPjh6TiJ/UxZiRbLSIsD8m1PpdNpKVc+M0Q0RdO37y1a4AHQzEmNU7ilfOOa7muh8mKa9UrD0zCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=Q3Uh0ATL; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="Q3Uh0ATL"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4233440E01FA;
	Tue, 20 May 2025 14:35:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id tgluREqaE9dV; Tue, 20 May 2025 14:35:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1747751746; bh=WFmTxWsVyZNK7w/tKFuaV2DiUsno6+F95Y+v9aOJP0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q3Uh0ATLnVP+ytWULY2ytyVSEu5P4PxtY4d1OiPEPsPDAs52G39impKzumvqeBqhp
	 XTnju9ZbZIfEmLfFhPguEYTlWqTrtoT7yj1ln9BZnbmINoe/7ODWUtPIDkab/zwGMT
	 adCuz2+SHRgBdDdS1DmpH3LMSPve8PZGWhhNLDZckt+m6q6mPB5JiIKz2t28tawpWT
	 TLpEEV6HBZx2qRnQ61tZtUoBCIqk46BvTBCKpuXceCVclZDJIRmNrGiLDmvEMzoqpu
	 PDJEbpUOWENyZlorV7hjQqHTckh5Co1h+J9ThNdT8REFsKuepW228vYj9DdIRrWey2
	 8SIxk0C0Lxzjd6gp9EkRDeW4fje2vofthNowL966dTL0mxVhAdwL/TKvLqvfnSEjwq
	 XC7YAIf4A0BFPop2Bl6+p2IytPZwoWH3EC/ou/k7VeEcXYTNzbYs82MbsluOWCy2H7
	 rCCErCiI3gdlwxZdlybssw/N+wG8YYe5bhogGdwHSxIZ9e5YJQTDEN+WRSycuQflm4
	 /pSWpTLxOjBMb5E4AC6zibU7N4OReRfSOYGdlHf1wdx5iS0Q9Rzc7CrmtQNg1DLbPS
	 DhJyY5ezqGpsYo+xSvpY5dmY5sW+r5LnL1uIqCFR5HTfSZPEKDvarEtFiu1P8Ieujd
	 tV7raaYr+yKVu377ti0SDzBo=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 4A86540E016A;
	Tue, 20 May 2025 14:35:38 +0000 (UTC)
Date: Tue, 20 May 2025 16:35:32 +0200
From: Borislav Petkov <bp@alien8.de>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>,
	Ard Biesheuvel <ardb+git@google.com>, linux-kernel@vger.kernel.org,
	x86@kernel.org, Ingo Molnar <mingo@kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Brian Gerst <brgerst@gmail.com>
Subject: Re: [PATCH v5 2/7] x86/mm: Use a single cache hot per-CPU variable
 to record pgdir_shift
Message-ID: <20250520143532.GMaCyTNJqH_T2LR8q5@fat_crate.local>
References: <20250520104138.2734372-9-ardb+git@google.com>
 <20250520104138.2734372-11-ardb+git@google.com>
 <awmpxjln22i5zmnv3wcwhzvpbbjqmhiw3onmpq66owbtdoujs5@f336cwpvlasn>
 <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAMj1kXE+2P6_y0SnmtmD=J42pe67itnr5jQs6NxjMTvV7HHp0A@mail.gmail.com>

On Tue, May 20, 2025 at 01:28:52PM +0200, Ard Biesheuvel wrote:
> Are you saying we shouldn't optimize prematurely? You must be new here :-)

Right, but do you see __pgdir_shift on a seriously hot path to warrant this?

I'd expect this to happen the other way around, really: "Hey, pgdir_shift is
getting accessed a lot, let's stick it somewhere where we can access it
quickly..."

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
