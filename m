Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 285334683
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 12:49:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746449355; cv=none; b=fEcClmVLN1DWiksQzMeUoZ56usDL6SB/H+Gqw8A9CGeuCl8zxnfsMMpK3r3cJx7UxiToAD8g6nE4mdQt85ql/i4bWZsOYlmLzY1NB0vX5dTvarxLh/lrxV56rPtSMNMGt8OVhF9cvklfUVWRLunwLzzAXVPNiUDfZplNKmiediI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746449355; c=relaxed/simple;
	bh=ymSG9IqEEy4egmcsyUGThJdUOkfEDmimGTb5ZTuNFZQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=mtDWmuHsQG1aVDt32AgSCCt7q9Gk+uUbmTNrfX2ISEAEA0MQsK1DhRMmEfY5fOo/T7XhjPwGXIkOdJ2VcDwt/kfOoW8OrBqW4kfPGRUhVP8d0BHvFdgxVJ99LVQwSOgB8C91727qMCVxtg5GXcgU/7qTlyYTn/PlafPc/WtRKY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=RXyO3rbI; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="RXyO3rbI"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 545CmbAS275820
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 5 May 2025 05:48:38 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 545CmbAS275820
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746449319;
	bh=9xfULg7P/qknoG0MeM2KOWzAXH9jr4Glh04sw3FjIuY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=RXyO3rbIuNBurZ+B2JvjxVn4LzO7AWXc6wOOrU2jKvgQY3bp2/Va/rV7q28ucmTMH
	 5pn4RMD4U1TF9qA9bc31gDfHCpcRmh7S6WsfqMZJPUgTAPO//HvXDptz9Llv9B0Tu5
	 d8lLF3tNZgKYAQ8X1Nd+iDKN6MdWAi9iyjCnDGCys027eGIphMNc3hKikvgZmHSLc1
	 A52yjDbY5Gbjdgcbm/aylj/NxBKu69dHnj+y2PKCmauLYgriydoAvw+oGoHiUVRIet
	 JWpi9K9gEsXVZbE0MWmeMHIFE2QeX8Y24oWpl83DLFUdvV/lzRKWXBzIOESda5TUHR
	 5J1ENJbCeWvwQ==
Date: Mon, 05 May 2025 05:48:37 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>, Ingo Molnar <mingo@kernel.org>
CC: linux-kernel@vger.kernel.org, "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/15=5D_x86=3A_Remove_su?=
 =?US-ASCII?Q?pport_for_TSC-less_and_CX8-less_CPUs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk>
Message-ID: <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 5, 2025 1:53:04 AM PDT, "Maciej W=2E Rozycki" <macro@orcam=2Eme=2Euk=
> wrote:
>On Fri, 25 Apr 2025, Ingo Molnar wrote:
>
>>  > I really get the feeling that it's time to leave i486 support behind=
=2E
>>  > There's zero real reason for anybody to waste one second of
>>  > development effort on this kind of issue=2E
>>=20
>> This series increases minimum kernel support features to include TSC an=
d
>> CX8 (CMPXCHG8B) hardware support, which removes 486 (and derivatives) s=
upport
>> and early-586 (and derivatives) support=2E
>
> FWIW I'm not happy about that at the very least because this will preven=
t=20
>me from using my 486 box for EISA defxx driver maintenance=2E  What exact=
ly=20
>is the problem with 486?
>
> I know the lack of TSC has security implications, but don't use the=20
>machine in a way for which it would be an issue and I don't expect anyone=
=20
>doing otherwise=2E  We have non-x86 platforms that lack a high-resolution=
=20
>timer and nobody's going to drop them=2E
>
> We also have platforms that lack atomics, let alone double-precision one=
s=20
>and they're fine too, so why is x86 different?
>
>  Maciej

Why is x86 different? Because it is a tightly integrated platform with cod=
e shared across a very large number of generations, without "silly embedded=
 nonsense hacks=2E"

I think if you have a use case, you need to speak up about it, rather than=
 for people to guess=2E
