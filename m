Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D5D1DE4DF
	for <linux-kernel@vger.kernel.org>; Sat, 26 Apr 2025 23:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745711345; cv=none; b=IsxsCHp2vTRBclNZqxI4gM983FDvn5DR92hwTRhhCYJqVWcaKP8zJ1n7ImWc4EwS38QT+T2GOQguszBpjflUxtZFicaC6G/Rn31UlbWQPPuopfntuaE6SAbwDnJFG8HD6vSJP5Z8eyMcSyafqflxsA1WknGNpuGhQiaDtMyA+4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745711345; c=relaxed/simple;
	bh=cNnFbmcOxluOqpVm87bmg+nEvQGjnRHFYkJH3XCiqMc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=J4vgYqzsdmrzyDY/jw+qCwD2MvJnF1BgJGXx+syuBSSpp7W60trCTP9QhVr22XNm4Ctemu6VaNxHp7tYW2RGc4OsyoSRR2MYMp4Q1E9D1xwcHq1seffHitALBItbD+eEPBIIdoe7f4hwIhP4HVSVeJZ1VR1rhebvw+V7dEX6nnI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=P/Rt4kQ5; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="P/Rt4kQ5"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53QNluFV1005984
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Sat, 26 Apr 2025 16:47:56 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53QNluFV1005984
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745711278;
	bh=Efb+Y8rvKueZmGY8ER6BRva8Iw8OWCsIsGFLE56vRl8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=P/Rt4kQ555chle4fd6u83fkO61mpaRrGHqm3uByh8N3lSMxZL/q460tfYdHlheP8D
	 zCd6F1t4iXrNqELKFnHXUCOQ/j/okZUtsZ+m1VvTuNl8RP6BakxW6AJMqLmqeP+PRX
	 WRWME5XpaX3pon4G6Gjgr5VwgN7q2kEhYXEJ2mkNQ1/tWXM2to1QTJ2dHmoSCFu9Fw
	 RYM+J+2G/74cxHOb37CJsFnYnT1MbeYVASdC4yzDxcjJq+7SlbM4Yh0gbwhPVVEfbi
	 IlCTiTr2iuwOGGe4BxrpiBB9hrwS4hIC/GM1d4ghRCf0ORnOHD5F39l8rB4RtlZmJx
	 Zd0khTJhmaBpw==
Date: Sat, 26 Apr 2025 16:47:55 -0700
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
Message-ID: <9D1971C6-8C13-4526-8D2B-37A1D3B0B066@zytor.com>
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

The undefined zero case applies to family < 6 as far as I know=2E=2E=2E th=
e same platforms which don't have cmov=2E=2E=2E
