Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB44219ED
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:04:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744945487; cv=none; b=FjVGYl6R4r2/Mn3pZfEpulfq61pmi6pk/TNFXmNSjIImr72j6XsY5XsGjERLMJGSC+oef6hNewHL11wFusV36QO77kZuABRSWxw9oMPmfFWvpq/3dG1VdzX6UF9WHfwrv4Ns/Flv/Q+CWbSOmFdJWwnajgKhlFCqzco6gBcOS28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744945487; c=relaxed/simple;
	bh=POlyqR7bxQJ/BpFBsufNtXDCrH5Btr8A0wQhLed120M=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=hOhanCrbGKB/yQeqLABLBlGkeyXDb9JUW+FqWy53rsTt6vXxL5NJEXbx4CnH4nYY0JO7b55gU1T1CKSfSesIs59Q1DrLRhNgDJjbR48apneQrLBrIlgsYjJUzKFkp4iSNQKKUc27yTYfBBgBAQwAcXuDNyBp/3wuB9w7j1FP8xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=BgXaWFb/; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="BgXaWFb/"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744945482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QW73lLVQDBY9HtHolp7BHyp40jQLsHqENKUtxI23Uy4=;
	b=BgXaWFb/z/6fIAeyooi3ncmg1VmTUKlE9phpAZgqbaA4RHskhpG7t4Luln+2WtKYBozZwV
	Lchr5k+Rcjod13GCpPf/zg664IGhet4uJuQIdiakGJL/67CHGcPtIXjR42fdQ5h8zHXw+W
	Ktf30sYm6Y2cWRzf3T1r6cv+STEImz0=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH 3/3] mm/hugetlb: Refactor __unmap_hugepage_range() to take
 folio instead of page
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aAEteJh4Gb8R7gPm@debian>
Date: Fri, 18 Apr 2025 11:03:59 +0800
Cc: Sidhartha Kumar <sidhartha.kumar@oracle.com>,
 willy@infradead.org,
 mcgrof@kernel.org,
 a.manzanares@samsung.com,
 dave@stgolabs.net,
 akpm@linux-foundation.org,
 david@redhat.com,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <363E4489-76E8-4FD2-AD17-2E0B46160CAB@linux.dev>
References: <20250417155530.124073-1-nifan.cxl@gmail.com>
 <20250417155530.124073-3-nifan.cxl@gmail.com>
 <daaeffe6-f9b8-4923-a273-0dab573aa749@oracle.com> <aAEteJh4Gb8R7gPm@debian>
To: Fan Ni <nifan.cxl@gmail.com>
X-Migadu-Flow: FLOW_OUT



> On Apr 18, 2025, at 00:34, Fan Ni <nifan.cxl@gmail.com> wrote:
>=20
> On Thu, Apr 17, 2025 at 12:21:55PM -0400, Sidhartha Kumar wrote:
>> On 4/17/25 11:43 AM, nifan.cxl@gmail.com wrote:
>>> From: Fan Ni <fan.ni@samsung.com>
>>>=20
>>> The function __unmap_hugepage_range() has two kinds of users:
>>> 1) unmap_hugepage_range(), which passes in the head page of a folio.
>>>    Since unmap_hugepage_range() already takes folio and there are no =
other
>>>    uses of the folio struct in the function, it is natural for
>>>    __unmap_hugepage_range() to take folio also.
>>> 2) All other uses, which pass in NULL pointer.
>>>=20
>>> In both cases, we can pass in folio. Refactor =
__unmap_hugepage_range() to
>>> take folio.
>>>=20
>>> Signed-off-by: Fan Ni <fan.ni@samsung.com>
>>> ---
>>>=20
>>> Question: If the change in the patch makes sense, should we try to =
convert all
>>> "page" uses in __unmap_hugepage_range() to folio?
>>>=20
>>=20
>> For this to be correct, we have to ensure that the pte in:
>>=20
>> 	page =3D pte_page(pte);
>>=20
>> only refers to the pte of a head page. pte comes from:
>>=20
>> 	pte =3D huge_ptep_get(mm, address, ptep);
>>=20
>> and in the for loop above:
>>=20
>> 	for (; address < end; address +=3D sz)
>>=20
>> address is incremented by the huge page size so I think address here =
only
>> points to head pages of hugetlb folios and it would make sense to =
convert
>> page to folio here.
>>=20
>=20
> Thanks Sidhartha for reviewing the series. I have similar =
understanding and
> wanted to get confirmation from experts in this area.

I think your understanding is right. BTW, you forgot to update =
definition of
__unmap_hugepage_range() under !CONFIG_HUGETLB_PAGE case.

>=20
> Thanks.
> Fan

