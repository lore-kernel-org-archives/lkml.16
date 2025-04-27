Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F267B1ACEC8
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 21:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745788511; cv=none; b=RP6m6CXjSAhDtIMt2pWUGOu+POzyior5vgblTNlFiVZTop5zVCuD4WoR233BFPiJ+7k9eDbzS0y+ZhAY9Yh12ufB2tAZaoSOsxryQdrwvh5+40oWb9bWrqZOiMvucEvHv8eGRXqL/ZLRMgfOREPzJsHrgEe/6YAQYFAch6mlCx8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745788511; c=relaxed/simple;
	bh=v2Nb8fabxXIwuI9N/djlFYD8mSjAtxpvoEdkAW/MJ2A=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=gl6u3pjQzL/4+5hsDi/pjvg+G6yuaXfa/t3FSucwM8rh1szFQ6fPga6C/DqqMQiSdhvaGlQ4EUU1EguztNACvhX9LSKgUZq3ZY2ef9XXibkAiDJC5uFdovv0n/i/YNG3zOhNqBpcuWDmiHpcsdjlk3SJZ5mHu0H2hdOtw9UL9hA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=a2YmdlaI; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="a2YmdlaI"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53RLEA8k2362694
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sun, 27 Apr 2025 14:14:11 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53RLEA8k2362694
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745788453;
	bh=Ze1m1OgbxcZfPaCNHEsBfR0ywbk+v9kZ91CvQZouTMQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=a2YmdlaIpllK835AsIbUOmmWXu+BdsjFA1bIjZtd1rmCRff4rMiC+tSkF8J24IgC9
	 9p/avXlujTKy0r9goDgxLmoif74E6xkCuwoxS2CcjD1XCvHudk4BFNG/s24W4ylej+
	 G0H1C/e9P+j65UBjqmqvvcDjFyOOpq5stU3gxzJLbn2immFU+9L/XBEU361oQW7Xp1
	 TuWbeKVswwCjnVuPOTaa+CHfw1ZhXxpXtxYO3Spsha0qWTX/bv85jbqIyAd4gnCEHN
	 +D6Wyj0SrnQeaJOeQSEo1r1ePHt9AAxAsTLsWmNfuHD9CrCOKX3DqE6MMHKnLUha3t
	 Ke7xCgh5ffqTQ==
Date: Sun, 27 Apr 2025 14:14:08 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>
CC: Arnd Bergmann <arnd@arndb.de>, Ingo Molnar <mingo@kernel.org>,
        Arnd Bergmann <arnd@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
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
In-Reply-To: <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com>
Message-ID: <D7FA06C2-119D-4405-9116-AC3203216406@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 27, 2025 12:34:46 PM PDT, Linus Torvalds <torvalds@linux-foundatio=
n=2Eorg> wrote:
>On Sun, 27 Apr 2025 at 12:17, Andrew Cooper <andrew=2Ecooper3@citrix=2Eco=
m> wrote:
>>
>> ffs/fls are commonly found inside loops where x is the loop condition
>> too=2E  Therefore, using statically_true() to provide a form without th=
e
>> zero compatibility turns out to be a win=2E
>
>We already have the version without the zero capability - it's just
>called "__ffs()" and "__fls()", and performance-critical code uses
>those=2E
>
>So fls/ffs are the "standard" library functions that have to handle
>zero, and add that stupid "+1" because that interface was designed by
>some Pascal person who doesn't understand that we start counting from
>0=2E
>
>Standards bodies: "companies aren't sending their best people"=2E
>
>But it's silly that we then spend effort on magic cmov in inline asm
>on those things when it's literally the "don't use this version unless
>you don't actually care about performance" case=2E
>
>I don't think it would be wrong to just make the x86-32 code just do
>the check against zero ahead of time - in C=2E
>
>And yes, that will generate some extra code - you'll test for zero
>before, and then the caller might also test for a zero result that
>then results in another test for zero that can't actually happen (but
>the compiler doesn't know that)=2E But I suspect that on the whole, it
>is likely to generate better code anyway just because the compiler
>sees that first test and can DTRT=2E
>
>UNTESTED patch applied in case somebody wants to play with this=2E It
>removes 10 lines of silly code, and along with them that 'cmov' use=2E
>
>Anybody?
>
>              Linus

It's noteworthy that hardware implementations are now invariably using a d=
ifferent interface, which makes sense for the LSB case (tzcnt/ctz) but has =
its own drain bramage on for the MSB case (lzcnt/clz)=2E=2E=2E
