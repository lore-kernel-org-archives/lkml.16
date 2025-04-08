Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43C71265CD2
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744108321; cv=none; b=DpZ3TRJ0pnmEPqwlaMOsCuF9R++GBquSD/llW+ZPLxewTf8jdUzpTNdmSYrajnFrpXcT0euwH1TuUlwiizxK9TQz/JrdIN3m6N4gH/y7OLY+EXNM1tkK28yCLkyKIgUZiaTg/Eh/F/xtcm9QqXXjrg5IebnWTNeG9spWZAI2Z6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744108321; c=relaxed/simple;
	bh=k9zRiJ4d17EHoa9/0+QQ92/Kmo+VviABgfQm/UeBk98=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y9mVwMfZBmucE1fcGXqsEZtilVNgrqe4gUqA3HpH0rIIlSJDaFFsIausTnuFr3k0ifw5XWhT0sXRDvfCseyNHJZ3SeTZwcRe8vykfihgXcFeJtoX0NtSZgJ8Z0hOU7k+J9+0DSSsgbki6cKxf20CUsd41+qkXnYYhHTP+HpvcfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=jDvPrh/m; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="jDvPrh/m"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id E549540E015D;
	Tue,  8 Apr 2025 10:31:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id hi3AFr1WNFfU; Tue,  8 Apr 2025 10:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744108313; bh=HDRBeioAm4LTIyC2ul0JuE8maUgRHO+tjWOcEWQiI5U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jDvPrh/mB4gvPrn5LcV+8XrfsCgSmkT7+xP98Brahoj6BJawfzK92vW+Q46rkQ4ID
	 v2bPpTo9wR8Fc64qsR6b5BI8oasADyw7FWahZrKOk+8kkwJ7yDDo8hJEISfy01M8fr
	 ffSZqUfs1iJ3BxFs2bRd6I5YcZth+Km4VQkC77+pVoWMfbJa0CmkPVvc10Tr9R2Y3K
	 cO7zdB103MaxRcxNNCIstSvaP+p7mBx2dvSR4UyDMWwnaabEJ7Ta/48AvPdfKlPgTX
	 5TcJ+T50bkKm+FcyfJWDIpKjILYQ4DJmDB4yh7qhMu2gW5Vka215Qwd0mK6GCewNld
	 6S8o69ZGmH+akOK8BNYi20r9xGVQCHz29UDj94ZhJk1KhK7Dy+228UymGZYsP6DZDn
	 dwqgENYzmmN2LwGmgO7ry+iXyL7f5Jd1XoYz5dltjx+fetFtNTbswbB8ifV5aLNf3D
	 GD+14VH2+s4T475/DbXgYKZ2lj5mYms/ulW4+lBquwvzfIi1xfqybVdPIDvw8UwdfA
	 wBD2JdLy5gG2U8+h2gufiNu0nrr7pvT3fUxjg/BO0uVipHtPGv4PcpS042A3xg1FtS
	 5kJC1jxKKXYcT8W02PpsfkNtIgU216T+G68gCsywT0TluS2HjvbtNrJlGua3kHUEmh
	 fF24xAqMknQazeV7qF5ZuVuU=
Received: from zn.tnic (pd95303ce.dip0.t-ipconnect.de [217.83.3.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 8602C40E016D;
	Tue,  8 Apr 2025 10:31:44 +0000 (UTC)
Date: Tue, 8 Apr 2025 12:31:37 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc: Kevin Koster <lkml@ombertech.com>, Thomas Gleixner <tglx@linutronix.de>,
	Oerg866 <oerg866@googlemail.com>, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: Re: [PATCH] x86/microcode: Fix crashes on early 486 CPUs due to
 usage of 'cpuid'.
Message-ID: <20250408103137.GAZ_T7CfnHx7cgU7CA@fat_crate.local>
References: <CANpbe9Wm3z8fy9HbgS8cuhoj0TREYEEkBipDuhgkWFvqX0UoVQ@mail.gmail.com>
 <20250405130306.ca9822c1f27db119cc973603@ombertech.com>
 <20250405093127.GAZ_D4b6NdyTS-UW1J@fat_crate.local>
 <20250406164049.c0666bc18073e3b88c92d1f1@ombertech.com>
 <20250406174633.2c581923c145687476191753@ombertech.com>
 <20250406190253.GAZ_LP3RPZInWKcHN7@fat_crate.local>
 <alpine.DEB.2.21.2504081107390.29566@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2504081107390.29566@angie.orcam.me.uk>

On Tue, Apr 08, 2025 at 11:16:26AM +0100, Maciej W. Rozycki wrote:
>  C'mon, these are good room heaters with nice extra side effects. ;)

Maybe we should intentionally prevent booting Linux on such machines and make
this our community's contribution in the fight against global warming!

:-P

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
