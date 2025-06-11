Received: from mail.zytor.com (terminus.zytor.com [198.137.202.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDB742517AF
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.136
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682638; cv=none; b=VypXO3YCaD/yKSlhs+MFQ5z6nuvTHbu2HbvNiyjo/x6cEQJlib1tDHhPC0o36ah2aHL93SwrTQ/e5r4CtCyYwRH2+vhDtPj40v1WqrjXvcyZveE7NSoCtB69VCpqb97W7M5z850fNOr+JuIF8I0Bg3etxseQT/y6v64FJPa9AAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682638; c=relaxed/simple;
	bh=BPznrVf2IehxVbb0FFTWzg/8ye7EFESVgQEaW7o912k=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=pkH8wxalX2AtcW2OmpEyU0V2keP8rj68/7PUe75E2aAIrw6MXmt1vxJeFVZCMVeTfM/alKLkTzsWlU42DG/UOetxyUBHtqVnFMSgho47Q1aQqn/b+lTeNhLqWhavkZCj1sw4vJMNP+4ANeWiiewGtoIB2eV68fozGR69l6UboEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com; spf=pass smtp.mailfrom=zytor.com; dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b=O4MhcUDg; arc=none smtp.client-ip=198.137.202.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zytor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zytor.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=zytor.com header.i=@zytor.com header.b="O4MhcUDg"
Received: from [127.0.0.1] (c-76-133-66-138.hsd1.ca.comcast.net [76.133.66.138])
	(authenticated bits=0)
	by mail.zytor.com (8.18.1/8.17.1) with ESMTPSA id 55BMuI4E3130383
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NO);
	Wed, 11 Jun 2025 15:56:19 -0700
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.zytor.com 55BMuI4E3130383
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zytor.com;
	s=2025052101; t=1749682580;
	bh=HRZvuFvmDl7vUxLKEf/1Ga4q3J4NdeqxPqtstFvTi9o=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=O4MhcUDgP8tNHapkN69TPtoQXJFL32L5k9ia4JEv5Uw7E9TFQUjZDnkFkCb1um1Y3
	 BPAUFx1Sp+XJsMHZThHE4/PaYN3S/MCnBbS/ymPoKseuSFXJl4dLjTIKDEdk7NQ1FB
	 qMOt2e1PEx/0a0X5ipLy46iiLGtHU9orAqiGw/tAL6idxkUfTZFSq/kXQtLdUXgOkE
	 jiZZTdtZlq9E/+hZlRSIeoU4AM9XjB3en0CbzdEjJ4uUHcT0IC0xAO5wmO6GtY3YSM
	 3NV66mOrUBE006svKYfR1zfQf6jyCY2uRexYNRlCuxyEYSgMfXA0OEyP1PJxKzQixm
	 yaCByH2GhGjEg==
Date: Wed, 11 Jun 2025 15:56:17 -0700
From: "H. Peter Anvin" <hpa@zytor.com>
To: Dave Hansen <dave.hansen@intel.com>, Em Sharnoff <sharnoff@neon.tech>,
        linux-kernel@vger.kernel.org, x86@kernel.org, linux-mm@kvack.org
CC: Ingo Molnar <mingo@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
        "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
        Oleg Vasilev <oleg@neon.tech>, Arthur Petukhovsky <arthur@neon.tech>,
        Stefan Radig <stefan@neon.tech>, Misha Sakhnov <misha@neon.tech>
Subject: Re: [PATCH v3 1/2] x86/mm: Handle alloc failure in phys_*_init()
User-Agent: K-9 Mail for Android
In-Reply-To: <22cd0fa8-d14d-4d37-a6a1-5e6827d6182b@intel.com>
References: <a31e3b89-5040-4426-9ce8-d674b8554aa1@neon.tech> <a404d023-e0bb-4dc8-8952-accba299ab50@neon.tech> <22cd0fa8-d14d-4d37-a6a1-5e6827d6182b@intel.com>
Message-ID: <8DA842BD-929D-4CB2-88D8-405F33C9B559@zytor.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

On June 10, 2025 7:55:36 AM PDT, Dave Hansen <dave=2Ehansen@intel=2Ecom> wr=
ote:
>On 6/10/25 03:16, Em Sharnoff wrote:
>> +		if (!pmd)
>> +			return (unsigned long)ERR_PTR(-ENOMEM);
>
>All of this casting isn't great to look at=2E Just about every line of
>code that this patch touches also introduces has a cast=2E
>
>Could you please find a way to reduce the number of casts?
>
>> +		/*
>> +		 * We might have IS_ERR(paddr_last) if allocation failed, but we sho=
uld
>> +		 * still update pud before bailing, so that subsequent retries can p=
ick
>> +		 * up on progress (here and in phys_pmd_init) without leaking pmd=2E
>> +		 */
>
>Please write everything in imperative voice=2E No "we's", please=2E
>
>> -	for (i =3D 0; i < nr_range; i++)
>> +	for (i =3D 0; i < nr_range; i++) {
>>  		ret =3D kernel_physical_mapping_init(mr[i]=2Estart, mr[i]=2Eend,
>>  						   mr[i]=2Epage_size_mask,
>>  						   prot);
>> +		if (IS_ERR((void *)ret))
>> +			return ret;
>> +	}
>
>Are there any _actual_ users of 'paddr_last'? I see a lot of setting it
>and passing it around, but I _think_ this is the only place it actually
>gets used=2E Here, the fact that it's an address doesn't even matter=2E
>
>

Given that ERR_PTR and IS_ERR are basically just casts to and from pointer=
s, why have them at all?
