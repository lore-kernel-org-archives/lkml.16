Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6737221FDC
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 20:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745613414; cv=none; b=JprNODKmMrClpsFiHd7wftnoOeCYZNXMq9SbglATmm4zcA/0GEly9jAV6oi9TgTd0sz/iO+pgJzQ+0UBH4eP+9AeFUKklcYZ/TFDhhHn7V5tAPyhOzsX0BuZN0TRifx/V2V0Kes9Ops0WL+jrETAqLQwRDfR8M8wvrwVj/uYUxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745613414; c=relaxed/simple;
	bh=3nzVjEcE2xggqucP2MD09GZAul3TXmXVkI9pWmfEni4=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=l3pEb8JXMQmXXcoOC8zXlKjpDDNJCWVx2x+MO0QY10uvOIwaRmON5SwhQXhO4Tu4AnyKHjtdAChqiGa2pnjEt27LiFBL5jUPzxBnC1Y23q+rxTvpj4KB30UyxecxrJ4pHne1PugFYT3yh//S3sCol3Vtun/9HtWDMd/4rvlAVJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=desiato.srs.infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=Ozmu3L3/; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=desiato.srs.infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ozmu3L3/"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=X9M4+Ej+Gp96bqz6Glzq05lkUeeT+EqqEuZ4uSjjb/8=; b=Ozmu3L3/XX/1Rz5n0br39c98sd
	+NM+y4+unDGM/MrvEKTK/35ZtI36W65bKg9otOaUTiH5nuTHHge9h2J3fIyexX87+eghKwQTqVLe1
	DWAyvg7xQedASA+j9wiEu60qU2u+FLyZQzDSE8007fe9MJV/MTlbUlLAjqKx9LOQ08ZueOuXPhnsI
	CD1//9V6AICKD4exT4AU26/bumSbWGpKnka9TBocsVVWog9HZ4HvZT1aPLdcmEToIZWOrveJOBV8S
	XCOVqBBRc+hmycf3nRqByJtqnDF4TDeIC/x8/7h/05EKHTmN7Y5UcvkZUC1w4xrowGhC9m8qPxItJ
	ckWGF3sg==;
Received: from [2a00:23ee:1cc0:5c4b:b264:5a63:8637:c285] (helo=[IPv6:::1])
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u8Pma-0000000C9YR-2BZs;
	Fri, 25 Apr 2025 20:36:27 +0000
Date: Fri, 25 Apr 2025 21:36:21 +0100
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
In-Reply-To: <8fd728cf-bc54-433d-8701-234a67933a97@redhat.com>
References: <20250423133821.789413-1-dwmw2@infradead.org> <20250423133821.789413-8-dwmw2@infradead.org> <cabc322e-d5ab-4371-a506-c7809717b38b@redhat.com> <91CA8854-2E86-4AF3-BAD0-8C47833F59D4@infradead.org> <8fd728cf-bc54-433d-8701-234a67933a97@redhat.com>
Message-ID: <0D5ABF4F-B1F2-4EB2-BD3B-A8312629D55E@infradead.org>
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

On 25 April 2025 21:12:49 BST, David Hildenbrand <david@redhat=2Ecom> wrote=
:
>On 25=2E04=2E25 21:08, David Woodhouse wrote:
>> On 25 April 2025 17:17:25 BST, David Hildenbrand <david@redhat=2Ecom> w=
rote:
>>> On 23=2E04=2E25 15:33, David Woodhouse wrote:
>>>> From: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>>>=20
>>>> Currently, memmap_init initializes pfn_hole with 0 instead of
>>>> ARCH_PFN_OFFSET=2E Then init_unavailable_range will start iterating e=
ach
>>>> page from the page at address zero to the first available page, but i=
t
>>>> won't do anything for pages below ARCH_PFN_OFFSET because pfn_valid
>>>> won't pass=2E
>>>>=20
>>>> If ARCH_PFN_OFFSET is very large (e=2Eg=2E, something like 2^64-2GiB =
if the
>>>> kernel is used as a library and loaded at a very high address), the
>>>> pointless iteration for pages below ARCH_PFN_OFFSET will take a very
>>>> long time, and the kernel will look stuck at boot time=2E
>>>>=20
>>>> Use for_each_valid_pfn() to skip the pointless iterations=2E
>>>>=20
>>>> Reported-by: Ruihan Li <lrh2000@pku=2Eedu=2Ecn>
>>>> Suggested-by: Mike Rapoport <rppt@kernel=2Eorg>
>>>> Signed-off-by: David Woodhouse <dwmw@amazon=2Eco=2Euk>
>>>> Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel=2Eorg>
>>>> Tested-by: Ruihan Li <lrh2000@pku=2Eedu=2Ecn>
>>>> ---
>>>>    mm/mm_init=2Ec | 6 +-----
>>>>    1 file changed, 1 insertion(+), 5 deletions(-)
>>>>=20
>>>> diff --git a/mm/mm_init=2Ec b/mm/mm_init=2Ec
>>>> index 41884f2155c4=2E=2E0d1a4546825c 100644
>>>> --- a/mm/mm_init=2Ec
>>>> +++ b/mm/mm_init=2Ec
>>>> @@ -845,11 +845,7 @@ static void __init init_unavailable_range(unsign=
ed long spfn,
>>>>    	unsigned long pfn;
>>>>    	u64 pgcnt =3D 0;
>>>>    -	for (pfn =3D spfn; pfn < epfn; pfn++) {
>>>> -		if (!pfn_valid(pageblock_start_pfn(pfn))) {
>>>> -			pfn =3D pageblock_end_pfn(pfn) - 1;
>>>> -			continue;
>>>> -		}
>>>=20
>>> So, if the first pfn in a pageblock is not valid, we skip the whole pa=
geblock =2E=2E=2E
>>>=20
>>>> +	for_each_valid_pfn(pfn, spfn, epfn) {
>>>>    		__init_single_page(pfn_to_page(pfn), pfn, zone, node);
>>>>    		__SetPageReserved(pfn_to_page(pfn));
>>>>    		pgcnt++;
>>>=20
>>> but here, we would process further pfns inside such a pageblock?
>>>=20
>>=20
>> Is it not the case that either *all*, or *none*, of the PFNs within a g=
iven pageblock will be valid?
>
>Hmm, good point=2E I was thinking about sub-sections, but all early secti=
ons are fully valid=2E
>
>(Also, at least on x86, the subsection size should match the pageblock si=
ze; might not be the case on other architectures, like arm64 with 64K base =
pages =2E=2E=2E)
>
>>=20
>> I assumed that was *why* it had that skip, as an attempt at the kind of=
 optimisation that for_each_valid_pfn() now gives us?
>
>But it's interesting in this code that we didn't optimize for "if the fir=
st pfn is valid, all the remaining ones are valid"=2E We would still check =
each PFN=2E
>
>In any case, trying to figure out why Lorenzo ran into an issue =2E=2E=2E=
 if it's nit because of the pageblock, maybe something in for_each_valid_pf=
n with sparsemem is still shaky=2E
>

A previous round of the patch series had a less aggressively optimised ver=
sion of the sparsemem implementation=2E=2E=2E?

Will see if I can reproduce in the morning=2E A boot in QEMU worked here b=
efore I sent it out=2E
