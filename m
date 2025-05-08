Received: from mail.alien8.de (mail.alien8.de [65.109.113.108])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9A0128A1D7
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 20:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=65.109.113.108
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746735148; cv=none; b=FOfqax42d7Z7B2Oa2ph+2FHS/IMYNhHNrzFMqPLjWEUryOr/SxuahM4+FUj+PsqhrOdOQgEIgqQEogi0nKz0cVYS/RlDOGpPhbEqTmlP9mwg8gChDUXxYHHn8gyLg+PFBVO8FZZriuDyw2VhGjFn4prmx2Kj7eN9c/QeScS3WJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746735148; c=relaxed/simple;
	bh=FGnh79h1JaPibhOon8q3InpS01FVYRvIoEJMbXV/Tso=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mUC7C/XNTjldw8Nu5B7W8Scjj31GbLKh05l1l4YsTvcF3cEUHkY7pzv1wmu37rAp0qPNH3MXnuhPq+y9wX7NohuQV7oycaVzm8/EK8AcSTML2ykMeiCalIbLBO8ubN+zlWGSNgA0c+vZ5jwS73diXc4lGueVadiiZV1Ag53LVE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de; spf=pass smtp.mailfrom=alien8.de; dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b=RzNCjsTa; arc=none smtp.client-ip=65.109.113.108
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=alien8.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=alien8.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=alien8.de header.i=@alien8.de header.b="RzNCjsTa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTP id A944240E0238;
	Thu,  8 May 2025 20:12:20 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at mail.alien8.de
Authentication-Results: mail.alien8.de (amavisd-new); dkim=pass (4096-bit key)
	header.d=alien8.de
Received: from mail.alien8.de ([127.0.0.1])
	by localhost (mail.alien8.de [127.0.0.1]) (amavisd-new, port 10026)
	with ESMTP id 8mA2UOe24vF6; Thu,  8 May 2025 20:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=alien8.de; s=alien8;
	t=1746735133; bh=n6te/N3ZjRlAVY96QaLIowZ30H+qc32fuwt23LQZkHA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=RzNCjsTanmn9ZojxkjpkUhWglzfkJ/qkLwjq0PPKtwTIgC5BHsRPLbLPfDE8Y+xSv
	 6PzZYNHYy5Naa2/p67Z8/iUJmhCGk/zwctslrqf2ZnV1BRzIDgVNFQYNVp/q4M2UJN
	 Jax9+8sZcYd6Cwqqv7EHoxA15m5QgLny2srnXPZR3Az4qJLv/RooSvRJhWcomEjdvL
	 40RUeRr7FSRGNXjrMSZhyHsRvpqn5V4hRI6rLBMg5ZRzORapfenUGGcMzGP0wL+WOq
	 LG7/hFaWttAi82FYwa3nkbVqWqKMoun5cl8ehqyrex6G6kWvNp0zYG39ritHoQ/z1F
	 8XX9/UBTHWnTa1Uby4J3U3ORfv8BO3MwbM1jLUxPhiWSEtm+PGrJzklpWcgnI3dr0U
	 cwPOUdisheowW/e0O5IkGsq4Cv8NsFr/MXZGTYOfdHD4GayQJ6SnrUW+llGVYyd39d
	 iYp/iRg9UkTNlDotIn5/IyT3Z0EDkk85GXrsScEr83WRvcaHhX5jIVYTqGuP6Vxs3P
	 aUF6Uv+tDY3d/oRbYxR0Jve4gb9uuwZaqGfFGo2Vb8hcg5joevZ/lMCso9MK5EjQUy
	 SjwK4SbxnASzbZwoKapa1BHWtZIdURt6YQGnT4lBZMh2ykJRvI8r6ESSMs3kIIUd54
	 Fiv1LQhS7UYFBmLxZ09CRGAY=
Received: from [IPv6:::1] (unknown [IPv6:2a02:3038:202:c9f1:9086:67fa:4e11:3647])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (P-256) server-digest SHA256)
	(No client certificate requested)
	by mail.alien8.de (SuperMail on ZX Spectrum 128k) with ESMTPSA id 0918A40E015E;
	Thu,  8 May 2025 20:11:58 +0000 (UTC)
Date: Thu, 08 May 2025 22:11:52 +0200
From: Borislav Petkov <bp@alien8.de>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
CC: "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@kernel.org>,
 linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 John Ogness <john.ogness@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/15=5D_x86=3A_Remove_su?=
 =?US-ASCII?Q?pport_for_TSC-less_and_CX8-less_CPUs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com> <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local> <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local> <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk>
Message-ID: <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 8, 2025 4:51:27 PM GMT+02:00, "Maciej W=2E Rozycki" <macro@orcam=2Em=
e=2Euk> wrote:
>On Tue, 6 May 2025, Borislav Petkov wrote:
>
>> >  Doesn't work for ongoing driver maintenance
>>=20
>> Dunno, I'd concentrate my efforts on something, a *little* *bit* more m=
odern=2E
>> At some point this is old rusty hw no matter from which way you look at=
 it and
>> it might as well be left to rest in its sunset days=2E
>
> One doesn't exclude the other=2E  I do POWER9 or RISC-V stuff too=2E  Is=
n't=20
>it modern enough?
>
>> What I have problem with is wasting my time maintaining old, ancient hw=
 which
>> is not worth the electricity it needs to run=2E Especially if you can g=
et
>> something orders of magnitudes better in *any* aspect you can think of,=
 and
>> actually get some real work done=2E
>
> I don't want you let alone expect to waste time on anything you're not=
=20
>interested in=2E  I'm trying to find a solution that saves you from that=
=20
>while preferably keeping everyone happy enough, including myself=2E
>
> Real work?  I find engineering challenges enjoyable regardless of the ag=
e=20
>of hardware involved and I don't want to take away anyone's daily bread=
=20
>(including mine) by spending my free time on a project someone might have=
=20
>commercial interest in and should pay for=2E  An obsolete platform is ide=
al=20
>for this purpose=2E
>
> And what's better and what's not is subjective=2E  I don't find all the =
new=20
>stuff better, just as I don't all the old stuff=2E  At least the old gear=
=20
>tends to be sturdy (once you've contained issues with the PSU) and likely=
=20
>won't suffer from electromigration in a few years' time=2E  It can be eas=
ier=20
>to repair too if a component does fail=2E
>
> NB people also fancy old cars, or boats, or trains even, not because=20
>they're faster, more comfortable, or have any real advantage over modern=
=20
>alternatives=2E


This fits very well, IMO, with Linus' suggestion to support this stuff out=
 of tree=2E I think this solution is the optimal one for all parties involv=
ed=2E=2E=2E

--=20
Sent from a small device: formatting sucks and brevity is inevitable=2E 
