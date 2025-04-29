Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845CF1BDCF
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 21:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745961886; cv=none; b=oagj8wqhvE90wLYSons9VQ/KDFZUT3OTbZe++lZiUCj5bODHumCxAlijdQuu/dlGVm9T38qQOPCJhVf+9CGQsS+y3Sb7Q63q5xhxEh1F/esVRSCoMZKcFMXfT9NMbjbCdm+XD8AxnpA9z/eEH+2Zm/SSfuMOhBmpJMEF90mmmZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745961886; c=relaxed/simple;
	bh=DjaMFqvgK8uwoGNLCCBFfC/w9pdjJ9Dl5hsg89JX+xI=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=JOVG8ZXfY5BlkkmCTIzYZbxaiAyoPrornuyPC+kGH7gq3DRezUQhRuVh8y8RujxxLaO3VXHbVK93mlWCW6lr8ifOTbJQNjGmVR6coQEvUXgOQ5GUaf7QxjRo0IK4kRbSgM9aSo1ROYF8PEwlNhcD3FlBPf7SdbAlNoMPbWDdtzI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=GptDAUiL; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="GptDAUiL"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53TLNv1g590765
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Tue, 29 Apr 2025 14:23:57 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53TLNv1g590765
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745961839;
	bh=2hgQCzTKdk3Uvsh9HzNYV15KO5LcgVYjpcYF/N1EC2Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=GptDAUiLFSnvECxP4g2SMKvBGxA/OShf8WbZxWytwNlTEPozS2ivnt9iZK9CrUTrD
	 t2xISx5INb4yjLaOHjzcwO7j2Va8jx0/MissykANuNam6/GjB/bHsvuGPKrYh5OK7o
	 0MX2EPbPwQEWTRpHVlh58K7nrHSoZcRRb0OAZdUWWAN3dcndRRcSncMy8P/EYBGruz
	 7uty6+xNekNcvRQW8ZCcVioIqF+GynDEbxxGv+3MknxDzuK1hIZr1AJbjiBcF3+FRP
	 b05f+iVcFe+nuNYd0YIRSo2QSiZKNXzx6qQATnijyI1SAon1JQVCRZSgvKzwMrX3T5
	 8BFFrUDnZ7hMA==
Date: Tue, 29 Apr 2025 14:23:55 -0700
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
In-Reply-To: <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <d2b0e71c-e79b-40d6-8693-3202cd894d66@app.fastmail.com> <CAHk-=wh=TUsVv6xhtzYsWJwJggrjyOfYT3kBu+bHtoYLK0M9Xw@mail.gmail.com> <CAHk-=wgfk69H-T-vMWR33xUpVsWJLrF34d0OwUXa2sHhtpSwZg@mail.gmail.com> <e54f1943-e0ff-4f59-b24f-9b5a7a38becf@citrix.com> <CAHk-=wj0S2vWui0Y+1hpYMEhCiXKexbQ01h+Ckvww8hB29az_A@mail.gmail.com> <aA8nF0moBYOIgC5J@gmail.com> <aA8oqKUaFU-0wb-D@gmail.com> <CAHk-=wgJfWfWa2NTiTmev+Xr=e8Uo=aFkrXujLAQBVAVN-VigQ@mail.gmail.com> <B364FF6D-DFCC-42A7-ACA1-6A74E27EE57E@zytor.com> <67be5eee-b67b-409a-8309-829f891b9944@citrix.com> <916BD58C-E6A7-495E-9A60-722E130AC7A7@zytor.com> <e5e97ff8-9670-40d1-a0fa-69504d34c4c4@citrix.com> <956DB0ED-F3DB-456D-8D06-6F40DBDB815A@zytor.com> <06d04c13-76e8-45fb-a563-e365e1f19362@citrix.com> <CAHk-=wig1E4B-e1_6=it1LfVQ64DJsVgO6f6Ytnbzm2qChbAdw@mail.gmail.com> <81ed8b53-1a40-4777-ab87-4f4abe032dbc@citrix.com> <CAHk-=wiAPQFf-RUr=8ra1sYdfGPGLb4QbV8THE9zY3n820L94g@mail.gmail.com>
Message-ID: <72078B8D-F03E-4783-8AC2-A36464A4B6A1@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 29, 2025 1:12:48 PM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Tue, 29 Apr 2025 at 12:13, Andrew Cooper <andrew=2Ecooper3@citrix=2Eco=
m> wrote:
>>
>> That would improve code generation for 32bit, but generally regress 64b=
it=2E
>>
>> Preloading the destination register with -1 is better than the CMOV for=
m
>> emitted by the builtin; BSF's habit of conditionally not writing the
>> destination register *is* a CMOV of sorts=2E
>
>Right you are=2E So we'd need to do this just for the x86-32 case=2E Oh
>well=2E Ugly, but still prettier than what we have now, I guess=2E
>
>         Linus

Could you file a gcc bug? Gcc shouldn't generate worse code than inline as=
m =2E=2E=2E
