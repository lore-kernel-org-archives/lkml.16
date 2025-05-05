Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFCD01D959B
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 19:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746475105; cv=none; b=GO5jCANmfJFxiSIUs+xPD/m9cTJVngFx9MIUnqSZqeudPuREEUrcMj4d4ldD6c+SiZj1Fpa9oYN2uBh6geVBLWDemAaWuxJrFh7PEbFThJzhP1yDwS+w6fVNCMigB0kPO7iuI/icUpRvXtkzGwuVkN2IRQifE8EqXgvGoHVX/sY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746475105; c=relaxed/simple;
	bh=GyfU+DZiBpK8lRLtIFAf+Xi3Qouz0MysyIidL+OUoK8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=b4WF321r1Zyh4GGLNjbMOOvHO1DaH+mPCRn2NkxsGQ8cUXMhR0H8lg0oziEc/Ep5JmyICl6LiyOwF3YO4i/vgIcDFl7mRoztSyBWGyUz26ObcIxRSFa7aG0mIFE+pbONPVYRnDog32fnigE6DtHM0isN6IIHy3TN8vFbqB4gR+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=FL11Usqq; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="FL11Usqq"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 545Jvgtn441117
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 5 May 2025 12:57:42 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 545Jvgtn441117
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746475064;
	bh=SAEe8v43wEjUktsbc88YLiuFdKJLtiH/B9TKjrSZxL8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=FL11UsqqD6VofHYYTI/0mroIrxuVo7PWgNsyRL3iW7cnvLmRKw4JhiScZ6g/Jkkoi
	 qACfQOynB95hwso1wuc90axpnf3qBNwB7zq6kzCG7JMYn3coAMAtBdWiStvmnOSRi4
	 ZqOeaRSvMu8Q9eYfoSVBet1zqpXAIUOd+pMJeVXei5pkPZNfcUlm8QOo7DkAlx8din
	 Hpxbezca5DiIlxpYsDhUWQcPrlUwFsAltXKq/4S59Oo+G0kDt4uhjayZNvW2fDkfKu
	 c7gGuvpnARiE/o0bbfN8xbyZJyFKVnij+Bb2LMwvHAhO/efmBY4a4yRQ+S+o3JUX8m
	 KHSTaauAwXaug==
Date: Mon, 05 May 2025 12:57:40 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: "Maciej W. Rozycki" <macro@orcam.me.uk>
CC: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
        "Ahmed S . Darwish" <darwi@linutronix.de>,
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
In-Reply-To: <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
References: <20250425084216.3913608-1-mingo@kernel.org> <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk>
Message-ID: <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 5, 2025 6:04:12 AM PDT, "Maciej W=2E Rozycki" <macro@orcam=2Eme=2Euk=
> wrote:
>On Mon, 5 May 2025, H=2E Peter Anvin wrote:
>
>> >>  > I really get the feeling that it's time to leave i486 support beh=
ind=2E
>> >>  > There's zero real reason for anybody to waste one second of
>> >>  > development effort on this kind of issue=2E
>> >>=20
>> >> This series increases minimum kernel support features to include TSC=
 and
>> >> CX8 (CMPXCHG8B) hardware support, which removes 486 (and derivatives=
) support
>> >> and early-586 (and derivatives) support=2E
>> >
>> > FWIW I'm not happy about that at the very least because this will pre=
vent=20
>> >me from using my 486 box for EISA defxx driver maintenance=2E  What ex=
actly=20
>> >is the problem with 486?
>> >
>> > I know the lack of TSC has security implications, but don't use the=
=20
>> >machine in a way for which it would be an issue and I don't expect any=
one=20
>> >doing otherwise=2E  We have non-x86 platforms that lack a high-resolut=
ion=20
>> >timer and nobody's going to drop them=2E
>> >
>> > We also have platforms that lack atomics, let alone double-precision =
ones=20
>> >and they're fine too, so why is x86 different?
>>=20
>> Why is x86 different? Because it is a tightly integrated platform with=
=20
>> code shared across a very large number of generations, without "silly=
=20
>> embedded nonsense hacks=2E"
>
> Thank you for the clarification=2E  By "silly embedded nonsense hacks" I=
=20
>suppose you refer to missing instruction emulation, which some platforms=
=20
>do so as to contain legacy support in a single place and let the rest of=
=20
>the code base assume the required feature is there, relieving maintainers=
=20
>from extra burden, correct?
>
>> I think if you have a use case, you need to speak up about it, rather=
=20
>> than for people to guess=2E
>
> Which I just did; I think that's exactly what an RFC is about, isn't it?
>
>  Maciej

No, with "silly embedded nonsense hacks" (Google for it) I mean ad hoc hac=
ks breaking the notion of a common platform=2E

As far as EISA is concerned, could you go into more detail? What are the r=
emaining users of EISA? One thing that happened with i386 was that we found=
 out that the only remaining "users" were people dragging out an old machin=
e to test if the kernel still booted=2E With bigsmp we had similar experien=
ces =E2=80=93 in at least one case we ended up maintaining support for a sy=
stem of which there were no machines left in existence=2E=2E=2E
