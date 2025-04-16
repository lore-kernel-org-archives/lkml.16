Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646ED1CAA85
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 09:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744795137; cv=none; b=UCOUwYNVcjiS10ydUlsj8s6By+V1GGVh4NJ9RC2a+ZbjnPyNPMqcKxQOamPY6+i+b/HqgWLNgTD2wKZiK9i2PZIIjrVenxicfKTMJ/dgu+sxIawP2kSmuX20sVbl3OB/QrjAJ4x4pLjoqf7FprwKbnYzz+/XUzyqD0m69Ga2QyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744795137; c=relaxed/simple;
	bh=sL7Ti8xvt3zTXyskQwRv8lkOu/S58ozeaOijpgOANFk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmJlGL8OdnGiUMOwR9pk5L5ZsnqxX8Y2q0CWpDzSfdojJ8oRgmPm3hyTRqEtr+GAkvk6TJL2ImNrGcgYlKmMjqxcQ1oiqhsXZGpxkFR/9cG92vZU2jL9evFH5lWCP0CGK7uludJ85l6DA8hJ3UhAT9IKpbP2+bbQ5DQ9Z2cnjPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=THNiEvyA; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="THNiEvyA"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id 4D49E40E01FF;
	Wed, 16 Apr 2025 09:18:50 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id BID_kJvVBf17; Wed, 16 Apr 2025 09:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1744795125; bh=y1QLvckCadDCnHJ2JOMwlWjAwE8+7hRdZ6en0oGF7fs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=THNiEvyAZVBO3aHs/N3Y5F/Nsb0oeiq/CU/bUtFWa2vBOt3/zHOFS3r4Ja5Oe8Amv
	 g9duM4/tTJYMR7YgJMMFqwIA/h2N3jszg/THVEkIpnBEDP8kWdtahyI5PlYen3ubRT
	 u1+WXlQ7xsfNIhe94xhLaNZXuZ+rKK2DsUK/Gme5mw3ptisP9RoUonhzdYpQ2tvXNm
	 NgxT7yLtn+exA03sRLRwA+Ex+/aNndLHojLxEv8Z5o0WMF/zJuJaV8OwiHxRTTfLM/
	 1VdpLkC/kja8gpYVTwIev2geVtunRPqW9Q52v6XZfGVaDa5f7iP+qDYJ42aayHeaIi
	 +sCJJbucN56HLo3PVsKg0dowoaL0ltiuXkLvyRccMT1ZBQU4G4zWRS+cleBRhxnkbO
	 u/ZqX3ylemGKh2gr06OzWbplbrdzoL85b7k/a8ZNKT3oaojkCohM5ClOXn0n54eidx
	 XDol/jKP0TbPzG9qf0cEvHrGnSaSrDjsXKnGi/INbwNvjbrdenLiFWB0qal5leeQEW
	 sXT4LVOiXNhpNv9snSV5/Q0cmr0Gg7AlChf8dJ0iRHZGQD8AyEls/+0Isd7j4ljGId
	 8eyrq6ZAKCTFdSUJkLmDz/Hm7UIM1X+iXxLosjXw1g8Y9CNyhIV2/qmcUoSG38BkEI
	 Oya5Xsr+SJWQwqrgwPO16SYw=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 183BD40E016E;
	Wed, 16 Apr 2025 09:18:37 +0000 (UTC)
Date: Wed, 16 Apr 2025 11:18:30 +0200
From: Borislav Petkov <bp@alien8.de>
To: David Gow <davidgow@google.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, thomas.lendacky@amd.com,
	"x86@kernel.org" <x86@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>
Subject: Re: sev_es_trampoline_start undefined symbol referenced errors
 during kunit run
Message-ID: <20250416091830.GBZ_915oVG0seSQp0O@fat_crate.local>
References: <7c5f9e2a-2e9d-46f2-89b2-83e0d68d3113@linuxfoundation.org>
 <20250414230047.GHZ_2Tnysv9zCD6-tX@fat_crate.local>
 <995cfca8-c261-4cf0-96f6-b33ca5403ee5@linuxfoundation.org>
 <20250415180128.GJZ_6e-B3yFuwmqWWS@fat_crate.local>
 <8b08e040-fee7-4344-8ba6-bbbd4f73e318@linuxfoundation.org>
 <20250415221702.GMZ_7a3meDh4e0L11s@fat_crate.local>
 <88a4052c-ac37-4958-af2a-a3066e8b82bd@linuxfoundation.org>
 <CABVgOSmXfoEonJ6w33sj1sb5F2Ak5Kek0AxskSmjq=d=D=PiVw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CABVgOSmXfoEonJ6w33sj1sb5F2Ak5Kek0AxskSmjq=d=D=PiVw@mail.gmail.com>

On Wed, Apr 16, 2025 at 08:32:08AM +0800, David Gow wrote:
> - make ARCH=um mrproper # Clean the source tree, but incompletely, as
> the original kernel was built with ARCH=x86_64, not ARCH=um
> # As a result, the pasyms.h file will be left in the tree, as it's not
> part of the UML build

Yeah, or you do:

$ git clean -dqfx

and the thing is gone. :-P

> - ./tools/testing/kunit/kunit.py run --arch x86_64 # Attempt to
> build/run an out-of-tree x86_64 kernel.
> # This will not tell you to clean the source tree, as it was
> (incorrectly) cleaned for the wrong architecture, but will fail due to
> the wrong pasyms.h still being present.
> 
> I'm not sure if this is the same cause as what you're seeing, Shuah,
> but it seems plausible enough. If so, this is really an issue with the
> Makefiles suggesting the wrong make mrproper command (assuming that
> the architecture hasn't changed), or failing to detect that the source
> tree still isn't clean. Maybe that's something we could work around in
> either the arch/um makefiles or in kunit.py (or at least the
> documentation), if we don't want to rework how dirty trees are
> detected.

ARCH=um has always been weird in that regard and we have had "bugs" like that in
the past.

I guess the simplest thing to do is to whack ARCH=um too when you clean, in
addition to x86_64. Or use the above git command if you're in a git repo...

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
