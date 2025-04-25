Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA027A110
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 15:16:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745594181; cv=none; b=fRoYaAImDF6FidHQjTDgkGJy585ETcUib/G4R2oSgPO9GJDni6o2ZnEip061KHl71fvHftFIfGHpZh6KBv2V+isKdT+t6LKovfwpZhNYtMh9t2gkj+IGgtK2F8Z/4VAz59G4xngx70e8uece70m8G+eBr1eDTVO12QiYwRMJ/Dk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745594181; c=relaxed/simple;
	bh=D4iWXXVHNmMTKjZlOtGGWK9tf8e1bNWVOJslTzIbRzA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=YLA3joOUJ90kiwILrfHqkIpxgjU48AuCcXIPhnDwji0aueKGilwhIli7RSCAkLmUF/HDaLYC+SVOTscm+wCa6YlCvgPdftVfJyhby1mZp/RxqPgR4XIQ1BwiVMuK7FF0QSrSRbuCKFSWGPZGCiSSDDMrQlEMoP1DKDqV6Z/T3UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=F9GrKR3h; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="F9GrKR3h"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PFFfdU2862808
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 25 Apr 2025 08:15:41 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PFFfdU2862808
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745594142;
	bh=gE/IkKdPpt4A/peP/xmGx7cgO8ulIVYWeaxcYLg30m8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=F9GrKR3hRjwwJAXn9Plz+zQ4LA1k6X6FadwqmM7ftmnSPCbNELG9dsh+Bwkjps0WI
	 EXaiLErD9iGby2/lWbcK+mInqsHS7DVnh3w4Y8PKkgP/3m9cDGngmX0dUyQ66o7x3e
	 /6vAqVYe7FQ7izXRBZGU6/brTbHAkCwQmBGFex5L15SLzQrw7z9yPWz4JTGybYPvFt
	 jjdZSSCXEPIOIOkvwalCrwI9jp7b5FOOATXC6dosgBOp2yFMTFq8SIc0R7GbFLuHMH
	 IuVGzmGsD9BkAvfj7VL+5MN/yOrzWb1/Ic0Bqs9OXIlj9GazWpsGYDtfspP/AVgFIi
	 NPa6QeN4ka0Qw==
Date: Fri, 25 Apr 2025 08:15:39 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@kernel.org>, Ingo Molnar <mingo@kernel.org>,
        linux-kernel@vger.kernel.org
CC: "Ahmed S . Darwish" <darwi@linutronix.de>,
        Andrew Cooper <andrew.cooper3@citrix.com>,
        Ard Biesheuvel <ardb@kernel.org>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        John Ogness <john.ogness@linutronix.de>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 13/15] x86/cpu: Make CONFIG_X86_CX8 unconditional
User-Agent: K-9 Mail for Android
In-Reply-To: <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
References: <20250425084216.3913608-1-mingo@kernel.org> <20250425084216.3913608-14-mingo@kernel.org> <956412a3-43c2-4d6e-bea2-2573c98233ae@app.fastmail.com>
Message-ID: <8D770F85-5417-4A9E-80DE-1B6A890DECEF@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 5:10:27 AM PDT, Arnd Bergmann <arnd@kernel=2Eorg> wrote:
>On Fri, Apr 25, 2025, at 10:42, Ingo Molnar wrote:
>> @@ -257,7 +256,7 @@ config X86_MINIMUM_CPU_FAMILY
>>  	int
>>  	default "64" if X86_64
>>  	default "6" if X86_32 && (MPENTIUM4 || MPENTIUMM || MPENTIUMIII ||=20
>> MPENTIUMII || M686 || MVIAC3_2 || MVIAC7 || MEFFICEON || MATOM || MK7)
>> -	default "5" if X86_32 && X86_CX8
>> +	default "5" if X86_32
>>  	default "4"
>>=20
>
>I just noticed this one: the final 'default "4"' is no longer possible
>here and can be removed=2E All the remaining CPUs report family "5" or
>higher=2E
>
>There is an old issue for some rare CPUs (Geode LX and Crusoe) that
>support CMOV but report family=3D6=2E These to boot a kernel with X86_MIN=
IMUM_CPU_FAMILY=3D6 because it triggers the boot time check=2E
>
>     Arnd

They report family=3D5 because family=3D6 implies fcomi and nopl support (=
in the case of Crusoe, they have fcomi but didn't support movl=2E)
