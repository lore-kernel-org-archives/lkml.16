Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2068B6D17
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 06:42:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749105727; cv=none; b=mMC6FLT0Gj/P8jmASI6fHJkFJmH+ZBSiD2GAtKFp1vDOVbjl1gDp4MWObUW+WenidNhOdjDI1IzizjkxAdsY53BGTjDgjLoSz6OPJzec11gjHo3zfmJIerNOhpdk7aXsKDyOwnFQM6dFx1I/AVT1mKJHSEy64mtlogiBVlqA8Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749105727; c=relaxed/simple;
	bh=CWwilyd8DsatWcvNuR/Q5R3fwbO2qSva5uLdXp2uX+Y=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=ODgrLfoAFPG2qsZgF+TBS6KCL85B4znf2R/TZOaIEAjFE8Qxu8Q7HmVSCdTCTwatd7GJa6/Ba4RmMpBtwsuk2pGI9fRxdn2RMDffga3Pzs37Q3b9N/xj5uBOZqjRZfIQ/RY6bOqyB3ErBv/XwQEAjkkwN9iN1fX2y4fT0sswezQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=p10Hzjlt; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="p10Hzjlt"
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 5556fM2D357827
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 4 Jun 2025 23:41:23 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 5556fM2D357827
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025052101; t=1749105683;
	bh=Lj0QPMaoNN//NUIcs8+QZOBIqJ8N8XAmiP0Wm85OEsM=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=p10Hzjlt+lsneXYm78u39WHR//VRbrhyRwOYFOUk6ED7VJO2/hJVHLq0h/tzLRVVS
	 XnTiP63Cz0gVkslIwOS2pIoHighsyvErcQNWugRWF4WUwIVxf/c/yfbx4CpnKcZy3k
	 hlIo7o+7U6fKnYhKgQXGZjb4TqGEKFtlj/FC4A5hFrxKbEIgQuos3XWwM88RjD4nLR
	 Yy4rDK+PN7jspvSd9i3MY/jKEtJ/JSVbSDNn15EBZn5idf6w8gjKXUBk7vsclkHScK
	 Tm3pAXJFV6Q9HwwTF6HVmT8lN4wFqwK0Wh8KHsqKLI5BbttxHb1lVpbjs9fo/0ahbG
	 MyjLGe6/sMYFg==
Date: Wed, 04 Jun 2025 23:41:21 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Ingo Molnar <mingo@kernel.org>, Em Sharnoff <sharnoff@neon.tech>
CC: linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
        Borislav Petkov <bp@alien8.de>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
        Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
Subject: Re: [PATCH] x86/mm: Handle alloc failure in phys_*_init()
User-Agent: K-9 Mail for Android
In-Reply-To: <aEE6_S2a-1tk1dtI@gmail.com>
References: <9f4c0972-a123-4cc3-89f2-ed3490371e65@neon.tech> <aEE6_S2a-1tk1dtI@gmail.com>
Message-ID: <70530630-6781-485C-9F2A-531E121692D1@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On June 4, 2025 11:36:45 PM PDT, Ingo Molnar <mingo@kernel=2Eorg> wrote:
>
>* Em Sharnoff <sharnoff@neon=2Etech> wrote:
>
>> tl;dr:
>>=20
>> * When setting up page table mappings for physical addresses after boot=
,
>>   alloc_low_page() uses GFP_ATOMIC, which is allowed to fail=2E
>> * This isn't currently handled, and results in a null pointer
>>   dereference when it occurs=2E
>> * This allocation failure can happen during memory hotplug=2E
>>=20
>> To handle failure, change phys_pud_init() and similar functions to
>> return zero if allocation failed (either directly or transitively), and
>> convert that to -ENOMEM in arch_add_memory()=2E
>
>> +		/*
>> +		 * Bail only after updating pgd/p4d to keep progress from p4d across=
 retries=2E
>> +		 */
>> +		if (!paddr_last)
>> +			return 0;
>> +
>>  		pgd_changed =3D true;
>
>> -	init_memory_mapping(start, start + size, params->pgprot);
>> +	if (!init_memory_mapping(start, start + size, params->pgprot))
>> +		return -ENOMEM;
>
>I agree that it makes total sense to fix all this (especially since you=
=20
>are actively triggering it), but have you tried also changing it away=20
>from GFP_ATOMIC? There's no real reason why it should be GFP_ATOMIC=20
>AFAICS, other than some historic inertia that nobody bothered to fix=2E
>
>Plus, could you please change the return flow from this zero=20
>special-case over to something like ERR_PTR(-ENOMEM) and IS_ERR()?
>
>*Technically* zero is a valid physical address, although we=20
>intentionally never use it in the kernel AFAIK and wouldn't ever put a=20
>page table there either=2E ERR_PTR()/IS_ERR() is much easier on the eyes=
=20
>than the zero special-case=2E
>
>Finally, could you make this a 2-patch fix series: first one to fix the=
=20
>error return path to not crash, and the second one to change it away=20
>from GFP_ATOMIC?
>
>Thanks,
>
>	Ingo

Specifically, zero is a valid *user space* address=2E
