Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01E0C33EA
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 00:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745712202; cv=none; b=oKLYqa/B37K6rz0KNzaMowtDqhJ495p+UzzFr2+4kiA3X1mLACgf0KnOzx6t9bCxMoRQ7pQZV7GnY1XLkJjzumfN6lVt39WvqeyXFWWqls+nXei2WQ7/SP80hqKjCmmzpXMiu7nS9xuyZXjJt+yvb7Mp5PGg9Xxn+ayYoj1Vcvk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745712202; c=relaxed/simple;
	bh=3SfQbIv4OvLq6P21nmEpbcGExFkyFSCw89XsCc7aY2Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=dzA3nbggHUwN8gqC24TzbXiR6X32UhYhvqT/zzqm3OU8ND9SJ89btJ+OFng2IJPe14Mjf+yhjSkyQjKy0qPDW30m7X+nmgu5MU7SkKa90ftJ5+auDZjRfnBTWRcJL9ELcxCaozJxheDRTBowmFCAdZX1wf4JbVmmIb4KzQTc2SQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GUyFr7K2; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GUyFr7K2"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53R02fAD1021270
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 26 Apr 2025 17:02:41 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53R02fAD1021270
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745712163;
	bh=jlk0WySUzgwBSqt89FwWE6HuFZFIM3PirCQAzgIEfcA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=GUyFr7K2Ifwtz4UyT6aZbS1skxkjefr619W1KEmSvlIYIusEr8s2C5D/56D1S/gaj
	 5TIg5JaG2cI23TADG/Bsd+kXCKGboPeBrpMjXmOtBC0A/41RaH+c8Dp5bjiIZT9zr7
	 4JGSVevyBY0e+wYSYf2+bharQF9IOMt9JRGOYXsi1GFL+LCkjoNrZwcocIy66HQz37
	 9qZ8STeOk05F+fX/1GmMUejEYb4soCu0SkgLOdQRJe2GhWq+ZTPfr9xuib8WfJZRWv
	 lod+D8/4hNBdCeO1yair463GuclnA5ooNhp2eVTr2xpsX1fF40aHLA7M92L4ghUwlQ
	 bYOdRku2zWt7Q==
Date: Sat, 26 Apr 2025 17:02:41 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Arnd Bergmann <arnd@arndb.de>
CC: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com>
Message-ID: <F6CAB3B2-B8CB-4A66-AF4A-B2CD3767BE04@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 26, 2025 12:55:13 PM PDT, Linus Torvalds <torvalds@linux-foundatio=
n=2Eorg> wrote:
>On Sat, 26 Apr 2025 at 12:24, Linus Torvalds
><torvalds@linux-foundation=2Eorg> wrote:
>>
>> (And yes, one use in a x86 header file that is pretty questionable
>> too: I think the reason for the cmov is actually i486-only behavior
>> and we could probably unify the 32-bit and 64-bit implementation)
>
>Actually, what we *should* do is to remove that manual use of 'cmov'
>entirely - even if we decide that yes, that undefined zero case is
>actually real=2E
>
>We should probably change it to use CC_SET(), and the compiler will do
>a much better job - and probably never use cmov anyway=2E
>
>And yes, that will generate worse code if you have an old compiler
>that doesn't do ASM_FLAG_OUTPUTS, but hey, that's true in general=2E If
>you want good code, you need a good compiler=2E
>
>And clang needs to learn the CC_SET() pattern anyway=2E
>
>So I think that manual cmov pattern for x86-32 should be replaced with
>
>        bool zero;
>
>        asm("bsfl %[in],%[out]"
>            CC_SET(z)
>            : CC_OUT(z) (zero),
>              [out]"=3Dr" (r)
>            : [in] "rm" (x));
>
>        return zero ? 0 : r+1;
>
>instead (that's ffs(), and fls() would need the same thing except with
>bsrl insteadm, of course)=2E
>
>I bet that would actually improve code generation=2E
>
>And I also bet it doesn't actually matter, of course=2E
>
>           Linus

It is unfortunate, if understandable, that we ended up using a convention =
other than what ended up becoming standard=2E (Return the size in bits if t=
he input is 0=2E)

This would let us use __builtin_ctz() > tzcnt which I believe is always in=
line on x86, and probably would help several other architectures too=2E

How much of a pain would it really be to fix this interface?
