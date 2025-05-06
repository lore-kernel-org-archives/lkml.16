Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDD2F272E7E
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 14:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746541023; cv=none; b=YfLJjs1R00cpVt8eCEwca3qJr8BR/mGaT7t7BhH0aI0MtfcZLPZKV30xN/Dvx6h9ai5n7X3Fm5lXBiQ+1T9JIaRdMBsIP/msbtOK7CBEqXBJmvCwGogwNLzJflfGQ1jo1jwbrsjCK6G1BnFvOXVJNJpprpU0jryYo+eHFCL9MoU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746541023; c=relaxed/simple;
	bh=Fl2/IZykO5fo3DsiqvCeXEV6EFYBiFXUzvunvnzZGbI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GhpbGdSieMNgw1zqGB/e7FofDfgHtUsVlRcufW4uEQq80hsGD8RziEHyX7ZvxaRa2AIlawihgdvJLz3Sck9Scwc/fxuvpL4zIoJr1gVMkDzUoCw/JrIV8tLJm6zNxC7NCyo0knH+xxBSyBcT+p0BXyJYTIT9qXN91uhOZQ2QALk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=VubFrAYW; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="VubFrAYW"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id DD1C540E01FA;
	Tue,  6 May 2025 14:16:56 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id DV5r8T6erDJX; Tue,  6 May 2025 14:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746541012; bh=sm+ZeARaiuXhjoU/wKu8rMAtBmA6fQht8L/TJUh5E8Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VubFrAYWe6tvYPew6VLgUmtUy9cpKKlMqMjpYi5njbLDJT+riE9i6RgTyUjXeMviZ
	 TPrhqTHcq3GNn77DctBSR76M2olXo1AskhDTmS+OoTUqGo6P5YS0pZbD/AVNevlBHc
	 /ub5/U7Xrm7BGOjooU5TpF4IXeviTeVM8UdqjOxSCVOuiR9Qwtk6VjGkk4Iyy08KWY
	 rRwHjtwSI1rkZROQlm1slftjBOe13s5BKsLp4cBY9wUnmOg48j/GcLvtwKBkgvR9y6
	 SphvUb7glfnfKhLHfrkJtTVF7ozO8Ph9TX154ONYFBdQSPphV/nuew0NawHvCoUmYJ
	 R8sbXH+Pg+RfJdHWwrAwG0y5Fbccvh+y9PKwL8K7c38T2KoJ8cIVeOg0OEw0FGZoDM
	 liP9heUwnH51W99UovKQ8BdE2dL95ViOBtwfmZEBdHz/1BpTg4BEeE99HXFygDaZ+4
	 khtnclE6yBfFwpOEOnEGc4rouNp7B7B+J1V+7CTNt8uU8jfzOB6KzBkSi90A5L+Ic6
	 PsMmZO4gwNQ8vKG2wkK33BGYsO2z6hvnDVUOWcAzjt/K3gu166dwSjEIcJbTiaWwIs
	 1wa+vUo11DWtVTvuzX7EOYMnclXpMcZKwgHvhGuduybyEPp7qc+hKPEIf3i+e77niF
	 LbDCl9WP6Dbws8V01Yy1MD+I=
Received: from zn.tnic (p579690ee.dip0.t-ipconnect.de [87.150.144.238])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0BD7740E0196;
	Tue,  6 May 2025 14:16:37 +0000 (UTC)
Date: Tue, 6 May 2025 16:16:31 +0200
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
Message-ID: <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
 <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
 <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
 <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
 <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local>
 <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk>

On Tue, May 06, 2025 at 02:51:51PM +0100, Maciej W. Rozycki wrote:
>  Doesn't work for ongoing driver maintenance

Dunno, I'd concentrate my efforts on something, a *little* *bit* more modern.
At some point this is old rusty hw no matter from which way you look at it and
it might as well be left to rest in its sunset days.

But I certainly am not trying to tell you what to do with your time.

What I have problem with is wasting my time maintaining old, ancient hw which
is not worth the electricity it needs to run. Especially if you can get
something orders of magnitudes better in *any* aspect you can think of, and
actually get some real work done.

:-P

Thx.

-- 
Regards/Gruss,
    Boris.

https://people.kernel.org/tglx/notes-about-netiquette
