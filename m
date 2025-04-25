Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81DF217A2FB
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745612172; cv=none; b=rZh6/Tp3FdwXiOy2tE9IMKu2yUp4+FdO9efoN6iuQMUQvbsr6CPTJ5jpl22WGnJ0uQpc7urDfSY2Ds1FIWlI5Wlivzr3/OzFYa7MKXfPjCdnsL4+WgkGu8yQ48OO2FdURz51INLgvcR+rf93FPmG0rSHzK1KSOrE3vs+iD85kN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745612172; c=relaxed/simple;
	bh=S3CUCsgERC2lKABr0RTijZNgynMNJ43s4foiri6FX1Q=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=RJLiQvwNxNQt50XzAEZh1rCFFU303TVw8SODH9E09KJZaaOlQT60C7tQay+QWNxfda3kZcCsaW3Zh9v7vzHubema7PJ5WVF1H5NZXzDP+e0REErgtkpblbNAgHJOvw+IHyBX+4AdcsYiAUMLSZzlRc/CaRpnlJWr3kNmUXhqQhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=WlPgzDVg; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="WlPgzDVg"
Received: from [127.0.0.1] ([76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 53PKFQDg3256787
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Fri, 25 Apr 2025 13:15:27 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 53PKFQDg3256787
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025042001; t=1745612128;
	bh=QJR+ymoSxhx0ygaS36CxYeriy9wPOBKoGiphuOc/xYA=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=WlPgzDVgOvh/0/DFcOe5XvMF8cvfSpicLG3EPZT8AMttk1GaTl6jNj6ES6WfPTR68
	 /wWU89V8Qwj+O9E78AFFFUU6eJy1kkRMV6xfexWC7bAX3Bc0V7jqD9eNN0QRkhkkI5
	 EziKxByPLhsc++tIDRVYnZbSrWAnma9tJh9y/9AJvo/5s1sbgoJQmb9k55q41YazSd
	 hKfRYhop6s0UAF/DuvR4d/qrnx8GfOMSyYS2pYZjkvcz8Lok4x3GyYIB5frgJytZw+
	 2PFF5/JtlfLV8fXzKXntPUxJIcmIaKtaARWNiHF7P3QM2WfemqbJojqVOZWOt4eQs2
	 5y20v1j/VdOXQ==
Date: Fri, 25 Apr 2025 13:15:24 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org
CC: Juergen Gross <jgross@suse.com>,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>,
        Alexander Usyskin <alexander.usyskin@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        =?UTF-8?Q?Mateusz_Jo=C5=84czyk?= <mat.jonczyk@o2.pl>,
        Mike Rapoport <rppt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org
Subject: Re: [PATCH] [RFC] x86/cpu: rework instruction set selection
User-Agent: K-9 Mail for Android
In-Reply-To: <09e26f91-9a62-45c8-b94e-eddb307251f4@app.fastmail.com>
References: <20250425141740.734030-1-arnd@kernel.org> <7CEE8E85-D7B1-4066-AD4D-747CA4340F65@zytor.com> <09e26f91-9a62-45c8-b94e-eddb307251f4@app.fastmail.com>
Message-ID: <49675319-D30C-417C-9BE6-20D2AB8E259A@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On April 25, 2025 9:13:31 AM PDT, Arnd Bergmann <arnd@arndb=2Ede> wrote:
>On Fri, Apr 25, 2025, at 17:34, H=2E Peter Anvin wrote:
>> On April 25, 2025 7:15:15 AM PDT, Arnd Bergmann <arnd@kernel=2Eorg> wro=
te:
>>
>> I really don't like testing an unrelated feature (CMOV for PAE);=20
>
>How about a new symbol with the opposite polarity, e=2Eg=2E CONFIG_CPU_58=
6?
>In that case, X86_HAVE_PAE and X86_CMOV could both depend on that
>not being set=2E
>
>I only picked the X86_CMOV symbol because it already exists in =2Econfig
>files, but that is not the important bit here=2E
>
>> furthermore, at least some old hypervisors were known to have
>> broken PAE=2E
>
>I'm not following=2E What does that have to do with my patch?
>
>     Arnd

This seems overly complex to me=2E
