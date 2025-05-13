Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2543A28F3
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747108124; cv=none; b=kQ45+4yN4dMA03P+P9oFPqfILfGyZAtx4ZqtFyOxFXJy/A5/Z+buiZg70Yt7SPoHJ/PtPEu133y9aRa4r3p+W0KRxlL2nQbdGJsyA35pyM7FCF4D3aYaCm7Vr78nUSX/1LVcKFQI0cMxY2Q+SSp+GgT7Od8uXUkkrRX79s3sEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747108124; c=relaxed/simple;
	bh=7yIOD/sGmG/UYDvWhsn07tGxc9dikF8d616fMdYIHkc=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=DmTU5UR7lUajeXGvtt+MoGSIECkLpYKcltFlQ5yBf2Y9EonOK0SxiGcE0YFpG98Y2nawGXn6Ft8nG2+FSpbZGa7tfFaXeh3AG6iuTnVrekoR4y/i7OEhs0J/46q4Iriu1CvKPdnp/lR2rJ7e3dOWIEywW+NC4uQ5ACXw483tjk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=QqwsXbum; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="QqwsXbum"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 54D3m2f72093237
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Mon, 12 May 2025 20:48:03 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 54D3m2f72093237
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1747108085;
	bh=7DH4owl5hznv5t971Wn+Jo2Qm/ntpfBthMYXhiqQEAg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=QqwsXbumHSxY09ZZQmY/Gh8kI3hncNCS/4Xuh5S5PvzWfWYIi+HzRGiPo/PdvZeas
	 MkdWYHbyyLw/mD++Bli0Z9T4LlqUiQOSl8Nh4qzN32viPLwsOFLy/aSNiREtOBGYqI
	 cE4s5xjYbQbg0T7UPb67lq+NnKvMfKelie1m6VlkpNAU9bLyAIJbFicVkdq4JAxdtx
	 e7T0ERmk3O2qU8ELxOd4vDJ8RILbYwMF8FPejoltvmRw22IcUVJYaT3fEkGeyK6Uob
	 xPpJMGLY4Zf1Dz/5Ybm0mhuSgd0HsyU11A8DNU7YOYLhqPyaW6FvnVM4FPucp8xenz
	 aB6CbShI5g9hg==
Date: Mon, 12 May 2025 20:48:02 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>
CC: Borislav Petkov <bp@alien8.de>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org,
        "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_PATCH_0/15=5D_x86=3A_Remove_su?=
 =?US-ASCII?Q?pport_for_TSC-less_and_CX8-less_CPUs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
References: <alpine.DEB.2.21.2505050944230.31828@angie.orcam.me.uk> <98C88CE8-C3D5-4B75-8545-71DD47C67614@zytor.com> <alpine.DEB.2.21.2505051356340.31828@angie.orcam.me.uk> <1E50C160-EB89-4C5C-B9F0-6441026EE380@zytor.com> <20250505205405.GNaBklbdKLbadRATbr@fat_crate.local> <alpine.DEB.2.21.2505060059010.31828@angie.orcam.me.uk> <20250506141631.GEaBoZvzPCWh88xDzu@fat_crate.local> <alpine.DEB.2.21.2505062228200.21337@angie.orcam.me.uk> <8C172B63-38E1-427B-8511-25ECE5B9E780@alien8.de> <alpine.DEB.2.21.2505121225000.46553@angie.orcam.me.uk> <20250512134853.GGaCH8RUjJwgHq25qx@fat_crate.local> <alpine.DEB.2.21.2505121810040.46553@angie.orcam.me.uk> <CAADWXX8+-=pcOUeu_cwX_vkkkGp6jn0GQLUhZX8MxGGRjKz=Lg@mail.gmail.com>
Message-ID: <8FED9E91-8221-4F37-8F3B-EDAD66C024A2@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On May 12, 2025 7:00:55 PM PDT, Linus Torvalds <torvalds@linux-foundation=
=2Eorg> wrote:
>On Mon, May 12, 2025 at 10:29=E2=80=AFAM Maciej W=2E Rozycki <macro@orcam=
=2Eme=2Euk> wrote:
>>
>>  Thank you=2E  It seems it'll be tough for me though to fulfil the GPG =
key
>> trustability requirement=2E  While I've used PGP/GPG since 1995, I have=
n't
>> been active collecting signatures with my more recent keys/IDs and neit=
her
>> I have appeared in public among Linux kernel developers often enough fo=
r
>> me to be identified by face over a video call=2E  Oh well=2E=2E=2E
>
>I don't think this has been insurmountable before, particularly for
>anybody who has been around for as long as you have=2E  Even your
>current email goes back to at least the beginnings of git=2E
>
>If "two decades+ of active kernel development involvement using the
>same email address" doesn't make you eligible for a kernel=2Eorg
>account, we're doing something wrong=2E
>
>                Linus
>

Yeah, we have dealt with this before :)
