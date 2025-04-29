Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD5E01DE4F3
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745937248; cv=none; b=k/ZyzQle0w2laOyeUxuz9FQ34wpro9oFvOB50RGM/g0EFtaoUnEh5eLGZKr5y8BGOscPHmUuOvpHj+7aJ43NJnjqpOso1nEEVNAlVk7XzWDDobBvJRGkljByBnRIyHpIcqjRvXIHoIAiOocxTuw9kXtjNpyZj++rKUxu+xPM98Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745937248; c=relaxed/simple;
	bh=dvDfbAIk6ND6JChsdJII8xgWpJQZsIE/dY9EvsSmBYY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=niIY3Sc07NBPsO4u9bKj2RIvXo3JZkIt+/H+rNy/f8QVmjepeSiz+w04UHfcCETI07RuIw8OoAIgMSSE+gAFU00kjZW3F5/0U9G+AxoSXhNBIAE1AXwveE7x9o2WZvXv2aS8jFNORWB++jCe2QqVJvhhxar6jFd8TBM1EDJEfwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Jdj/Z600; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Jdj/Z600"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53TEWCFi442559
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 29 Apr 2025 07:32:13 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53TEWCFi442559
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745937135;
	bh=LNjYixlftM0TocmwTWxp55iaVDYvdvPlmjeF4Wk1QKQ=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Jdj/Z600Zm+gH8++WJ3coUVX3bxm/9kz6VzSlcTsunLE2QdkL7cc+My/6OWOPvfBO
	 3ktp4xGOb8Bi6yvo/Hv2ijFkM36AaqGcUPxWLErP4AyLU7V+MIoqT9uXMvBs/R+KOc
	 Por8iQOetV42XpxMSzzjgtqyWZEX/qdTBR73GcL2v6YWZVDTG08lWKAhAQnRcUZeq9
	 KueXqPQFQcIZca9owJdh852QSvT/UyXI+1TueFr/tWQpGYwgPkpz0VS1kXYHRBTgjr
	 n5BNPcFGo8ojEJ4rqOyIxRCjUisbmkmZyRSIXeBA12UP6KFGaD71bFXBQGqGNZTqiz
	 RBOkL2e7VGWbA==
Date: Tue, 29 Apr 2025 07:32:10 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
CC: Andrew Cooper <andrew.cooper3@citrix.com>, Arnd Bergmann <arnd@arndb.de>,
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
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH=5D_bitops/32=3A_Convert_variable?=
 =?US-ASCII?Q?=5Fffs=28=29_and_fls=28=29_zero-case_handling_to_C?=
User-Agent: K-9 Mail for Android
In-Reply-To: <aBClAy837xcLnVpp@gmail.com>
References: <aAyiganPp_UsNlnZ@gmail.com> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <aA8q4Ot-1zTzv_Kt@gmail.com> <CAHk-=wh5DUS+nhfTxPEEbaB9dsFib39gWatrX4NoFq_MpdOzGw@mail.gmail.com> <aBClAy837xcLnVpp@gmail.com>
Message-ID: <3A122140-5646-46D7-91A0-0A3E5B21C951@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 29, 2025 3:08:03 AM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Linus Torvalds <torvalds@linux-foundation=2Eorg> wrote:
>
>> On Mon, 28 Apr 2025 at 00:14, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>> >
>> > And, just out of intellectual curiosity, I also tried to measure the
>> > code generation price of the +1 standards-quirk in the fls()/ffs()
>> > interface as well:
>> >
>> > =2E=2E=2E and unless I messed up the patch, it seems to have a surpri=
singly
>> > low impact - maybe because the compiler can amortize its cost by
>> > adjusting all dependent code mostly at build time, so the +1 doesn't
>> > end up being generated most of the time?
>>=20
>> No, I think one issue is that most users actually end up subtracting
>> one from the return value of 'ffs()', because the "bit #0 returns 1"
>> semantics of the standard ffs() function really is insane=2E
>>=20
>> It's not just that it doesn't match sane hardware, it's also that it
>> doesn't match sane *users*=2E If bit #0 is set, people want '0', so the=
y
>> typically subtract 1=2E
>>=20
>> So when you stop adding one, you aren't actually removing code -
>> you're often adding it=2E
>>=20
>> Just see how many hits you get from
>>=20
>>     git grep '\<ffs(=2E*)=2E*-=2E*1'
>>=20
>> which is obviously not a very precise pattern, but just look at the
>> output and see just *how* common that "subtract one" thing is=2E
>>=20
>> I really don't understand how anybody *ever* thought that the whole
>> "return one bigger" was a good idea for ffs()=2E
>
>Yeah=2E No argument from me that it's a badly thought out interface - I=
=20
>was just surprised that it doesn't seem to impact performance as badly=20
>as I expected=2E I have to add that a lot of work went into absorbing the=
=20
>negative effects of the ffs()/fls() interfaces:
>
>  starship:~/tip> git grep -Ee '__ffs\(|__fls\(' | wc -l
>  1055
>
>So it impacts code quality negatively, which is arguably the worse side=
=20
>effect=2E
>
>> But maybe people really were poisoned by the Pascal mindset=2E Or maybe=
=20
>> it was invented by some ancient Roman who hadn't heard of the concept=
=20
>> of zero=2E Who knows?
>
>Hey, ancient Romans didn't even have the concept of *whitespaces* and=20
>punctuation to begin with:
>
>    https://historyofinformation=2Ecom/images/Vergilius_Augusteus,_Georgi=
ca_121=2Ejpg
>
>Lazy stonemasons the lot of them=2E
>
>Romans were the worst ever coders too I suspect=2E What have the Romans=
=20
>ever done for us??
>
>	Ingo

Well, they did build the roads=2E=2E=2E =F0=9F=A4=A3

Roman numerals obviously were not a positional system, but at least in acc=
ounting they used N for zero (nulla=2E)

ROMANI=E2=80=A2ITE=E2=80=A2DOMVM
