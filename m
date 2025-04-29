Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0528915855E
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:11:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745964691; cv=none; b=VJxQUux9526SfWXVOvrYsum4WiLqh2mSDlC6E2kHj2/hUExfKvWkPrLOVvC03G16/yIJlTRQ8m3jHV+f6E/XCbLveVDr7jJ+Gp7eBNK6qY0uJwVUZOG+ygVCABPx5iJJYJyo0nCflDoslGwHtVyWjWqlDaHYCW9Sj6/bc4cc2JE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745964691; c=relaxed/simple;
	bh=qwSrv85FzS4N1cZKlEj2pkhExL+Zm80lFhRWY4LqKTY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pZPbM64VTHWL115dtXcVYZw00Ka1z5GZFJhU3qIlEKwTwJc8LTQWyd5NlS4+hWYNBY6jlFF/bqJKnHsXiZJTX2BqUyQ3gFhCVnQyEnizF/ZBnhxmZHuTFSxhQGEt/stl3CjVLMMq+FE+PaT+4ddXL4VRhWguUcy8ryOW26loPng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=Xjw5H3Em; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="Xjw5H3Em"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53TMAU8h607259
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 29 Apr 2025 15:10:31 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53TMAU8h607259
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745964632;
	bh=79WW/6GCYUlxzkcwU8Me7t87railGlC3HuM0E/D7/IM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=Xjw5H3EmU1OOsdeN6B7NCthuT7/JRKqee6lbs8tDXyZO9l1JGIjb2HPeYmZP9ormv
	 mll2/szrCJYckCbt9XRseZYa4/tRSJJLNfKDlY7G248v0b6xAeRgcbWu7x1u1qAteG
	 bxEGtWLwMllizT6/3fDQYYIZiPEm452XikBN7hJMlMJYeOcecQaTlPZ2VeypVhxIac
	 WUkrsKg9fV/v2LN+znAZmv4KAid1hh8rTgEV5ndZRjFduvDIghwiij3Ol+QFIA8Kv0
	 KrYnaw9cAROWzzu1/J7HOn+wIDic3+LnQSPTjjWNp2ynXfiTMJ1/29ADy0dVKp/Til
	 Yvf0M+in91uVA==
Date: Tue, 29 Apr 2025 15:10:29 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Cooper <andrew.cooper3@citrix.com>
CC: Ingo Molnar <mingo@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
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
In-Reply-To: <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com> <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com> <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com> <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com> <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com> <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com> <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com> <CAHk-=wi=nuDW6yCXSA-dEztZhXNuzLOaH--s_V7GOAE7n6RsRw@mail.gmail.com> <565ac06a-005f-4b77-930e-d63285c025b9@citrix.com> <CAHk-=wiMN7eMYE=SiA07f2aFFeuEV0YJ-ewoW4rJ3yQfbviuJA@mail.gmail.com>
Message-ID: <D843E4F2-0983-4D67-B346-A77134608196@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 29, 2025 3:04:30 PM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Tue, 29 Apr 2025 at 14:59, Andrew Cooper <andrew=2Ecooper3@citrix=2Eco=
m> wrote:
>>
>> do_variable_ffs() doesn't quite work=2E
>>
>> REP BSF is LZCNT, and unconditionally writes it's output operand, and
>> defeats the attempt to preload with -1=2E
>>
>> Drop the REP prefix, and it should work as intended=2E
>
>Bah=2E That's what I get for just doing it blindly without actually
>looking at the kernel source=2E I just copied the __ffs() thing - and
>there the 'rep' is not for the zero case - which we don't care about -
>but because lzcnt performs better on newer CPUs=2E
>
>So you're obviously right=2E
>
>            Linus

Yeah, the encoding of lzcnt was a real mistake, because the outputs are di=
fferent (so you still need instruction-specific postprocessing=2E)
