Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA1812B73
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 19:09:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745608143; cv=none; b=hUf0U5WPEiD2lHD+xlzXm7lEmsmVTGYd/zNa9K8yz8V2QFWw2HO3UEfrp3yEE6Nvg+N19ncQ/puYoFiDf4xuJAOSzDTvs0qpBxLDbYL7/u+rHCFv8I76JPXoAhiRdVxRNHS90NLXzgK1K2k8GrgILroPCRAlZ7bYmnQMf+k1R9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745608143; c=relaxed/simple;
	bh=p+ElZiCN6VkmCJmBqGDUIv0Pmi95UcrBmGKtg/GaUXg=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=hN5lg5dWpd0qOWHctqggaw+XWU4cStAJ0NAweRxaLz22N6Hgo6Qvjsay2rWyjnndWfpZu6WYI2rNZaTDpQDIxFAFNTBQS0i/BgOgr6zPytiItmmkDXgk78S1dI/QzWZbExSptze6hxFgoh3rBr5qhQpmyz/gMMkOI5OEVEdpwNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=jJmglLn2; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="jJmglLn2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=aKYzHIALNtDUUydkxeFhY6Lnu4RyTa/BxMviK7FEme0=; b=jJmglLn2xcvuWVpTYWDmM1yxR4
	qVMBGIZQw5UMNuetuPXAcU3EPY7NpfKppXxD6BrJ31gx/4dt5M6kcohNT5GgXxwrhcrOXo1Zwjmw/
	dzFpqy6pWN/d+8LikBV6Zbzh6uwxnAEpMF4hJTtPCTb5ddlhPD5uRJmx3/Y63w7ZUwNtUFxtD+UYj
	6btcOSXcALKynfnR6ZMafLNz9+jGHRhqtCOEdkoeuEWfkmNK8MTmkwjMtyZW4kpT8n2m/ucgdSJE9
	m91XZrQO75JIYnHxyrWT8XUSOQoluLCildSTBryKqtkyv/mfc+eQLmNchyVbM+sRjcXULs6fmteti
	YBxjqClg==;
Received: from [188.39.25.218] (helo=[127.0.0.1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8OPp-0000000C8dg-0e1C;
	Fri, 25 Apr 2025 19:08:49 +0000
Date: Fri, 25 Apr 2025 20:08:50 +0100
From: David Woodhouse <dwmw2@infradead.org>
To: David Hildenbrand <david@redhat.com>, Mike Rapoport <rppt@kernel.org>
CC: Andrew Morton <akpm@linux-foundation.org>,
 "Sauerwein, David" <dssauerw@amazon.de>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Ard Biesheuvel <ardb@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Ruihan Li <lrh2000@pku.edu.cn>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v4_7/7=5D_mm/mm=5Finit=3A_Use_for=5Fea?=
 =?US-ASCII?Q?ch=5Fvalid=5Fpfn=28=29_in_init=5Funavailable=5Frange=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
References: <20250423133821.789413-1-dwmw2@infradead.org> <20250423133821.789413-8-dwmw2@infradead.org> <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com>
Message-ID: <91CA8854-2E86-4AF3-BAD0-8C47833F59D4@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-SRS-Rewrite: SMTP reverse-path rewritten from <dwmw2@infradead.org> by desiato.infradead.org. See http://www.infradead.org/rpr.html

On 25 April 2025 17:17:25 BST, David Hildenbrand <david@redhat=2Ecom> wrote=
:
>On 23=2E04=2E25 15:33, David Woodhouse wrote:
>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>=20
>> Currently, memmap_init initializes pfn_hole with 0 instead of
>> ARCH_PFN_OFFSET=2E Then init_unavailable_range will start iterating eac=
h
>> page from the page at address zero to the first available page, but it
>> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
>> won't pass=2E
>>=20
>> If ARCH_PFN_OFFSET is very large (e=2Eg=2E, something like 2^64-2GiB if=
 the
>> kernel is used as a library and loaded at a very high address), the
>> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
>> long time, and the kernel will look stuck at boot time=2E
>>=20
>> Use for_each_valid_pfn() to skip the pointless iterations=2E
>>=20
>> Reported-by: Ruihan Li <lrh2000@pku=2Eedu=2Ecn>
>> Suggested-by: Mike Rapoport <rppt@kernel=2Eorg>
>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel=2Eorg>
>> Tested-by: Ruihan Li <lrh2000@pku=2Eedu=2Ecn>
>> ---
>>   mm/mm_init=2Ec | 6 +-----
>>   1 file changed, 1 insertion(+), 5 deletions(-)
>>=20
>> diff --git a/mm/mm_init=2Ec b/mm/mm_init=2Ec
>> index 41884f2155c4=2E=2E0d1a4546825c 100644
>> --- a/mm/mm_init=2Ec
>> +++ b/mm/mm_init=2Ec
>> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsigned=
 long spfn,
>>   	unsigned long pfn;
>>   	u64 pgcnt =3D 0;
>>   -	for (pfn =3D spfn; pfn < epfn; pfn++) {
>> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
>> -			pfn =3D pageblock_end_pfn(pfn) - 1;
>> -			continue;
>> -		}
>
>So, if the first pfn in a pageblock is not valid, we skip the whole pageb=
lock =2E=2E=2E
>
>> +	for_each_valid_pfn(pfn, spfn, epfn) {
>>   		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>>   		__SetPageReserved(pfn_to_page(pfn));
>>   		pgcnt++;
>
>but here, we would process further pfns inside such a pageblock?
>

Is it not the case that either *all*, or *none*, of the PFNs within a give=
n pageblock will be valid?=20

I assumed that was *why* it had that skip, as an attempt at the kind of op=
timisation that for_each_valid_pfn() now gives us?
