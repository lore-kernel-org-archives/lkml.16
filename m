Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EFBC23A994
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 18:01:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746813681; cv=none; b=p2YzkTkZZ+/sSwORBSVGtQFaY8sFf/KmrDkgdxJxNC/0dZT3kggRLJLZA7e/xjXu9hsUnpe9qt4UcTOmI6j2NqZnUdE/CAPoh/uu0LtUzWJ42rCwGPXM+d7HYCookIYymV7MK8mg+POLbA2IPgiEsPKkU/x3W5to3IG9CM+nSy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746813681; c=relaxed/simple;
	bh=tNtA/ghD4yYhkWMVmbtoJeuBQdcldy0k7jneiIGKcAM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=nWq6OH0ovRuSN45VSgFL6xJAGtWvMoWa4t/6kXVmLxctgrGYZ5uBcy+rUs1VqDyqbtZL9EndhUukAXqXNf/Kugt/DJAYXo9nPrilu5Z6oruKr0bEEPZto40qdtP6s9mIsfUfsALAFdlKdB8f8LMOQfce9imNMDAJIO2GM8BqPzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=K6Tuakqn; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="K6Tuakqn"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 549I0Mkm323139
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 9 May 2025 11:00:22 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 549I0Mkm323139
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1746813626;
	bh=L9b74jmm8o/E56aD60CdfIG13StCKwV7kjIT1+NLhUY=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=K6TuakqnrjEURmLde3J2SBsDECgJSNxFMb6l2SRJLcfhIDmc4OJ7EKEx7C4cnOKJW
	 RhVp2Fva6AdzoQ0H4I27MAJGALDt2cLfK4IvcRGhdGlHYmm/j6DViJ+Ta4k+hXdk+P
	 3atOSMKGJm5d2eFfZFJ3H1geMncT6HYcynbh/dhsTHWsdKM57N8wym19tHK9J5JUQs
	 CPFrBDIq/+Pod8YwQNyu9MhIkZpCss8wCXHpNoJAGclk2yqgp4bBWKARRlHOgnvbu/
	 gK+Q/lFKyW9ViqGmhtb0n28aq9k1ZMSPyXZXr0k53uEkcnw+RpHHg8gkV/ICsWY+x6
	 c1H1vkjc59qhw==
Date: Fri, 09 May 2025 11:00:20 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: David Laight <david.laight.linux@gmail.com>,
        Ingo Molnar <mingo@kernel.org>
CC: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>, Borislav Petkov <bp@alien8.de>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Ard Biesheuvel <ardb@kernel.org>, David Woodhouse <dwmw@amazon.co.uk>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Michal Marek <michal.lkml@markovi.net>
Subject: Re: [PATCH 04/15] x86/kbuild: Introduce the 'x86_32' subarchitecture
User-Agent: K-9 Mail for Android
In-Reply-To: <20250509130438.309220f5@pumpkin>
References: <20250506170924.3513161-1-mingo@kernel.org> <20250506170924.3513161-5-mingo@kernel.org> <cd541739-4ec5-4772-9cef-e3527fc69e26@app.fastmail.com> <aBr_GZ9P7k_I7RU6@gmail.com> <20250509130438.309220f5@pumpkin>
Message-ID: <1F6EBA7E-C859-47B3-8D8E-0788A1C9A13F@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 9, 2025 5:04:38 AM PDT, David Laight <david=2Elaight=2Elinux@gmail=
=2Ecom> wrote:
>On Wed, 7 May 2025 08:35:05 +0200
>Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>=2E=2E=2E
>> Let's just have x86_32 as the internal primary subarchitecture name,=20
>> with support for historic aliases like 'i386'=2E That it cleans up thin=
gs=20
>> for defconfig naming is a bonus=2E
>
>Aren't there 3 variants?
>Although the 3rd x32? running ILP32 in 'long mode' isn't used much
>(if at all?)
>
>	David

x32 is user space only=2E
