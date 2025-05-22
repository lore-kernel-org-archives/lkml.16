Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10A942222A7
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 07:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747898070; cv=none; b=mhH+e2ypSPjVPrzlM/MghJMSodypmgqtZRLYmgE9ON4mdf4I7g/DfG75TYb7i/YqwoOcHvyOZ7VEXhXhLNu2AQl2JVR7da9EaWbNxRBxtxZ8w8fFOnQFUdkVXwkQwOMQuGJCGVf5boXVOL9zpBb1y8HIRmDzyWU3J9fUidGcd4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747898070; c=relaxed/simple;
	bh=ZPXMvyJncnOSPn+KFA6L0BPzzxvja+21kaYiqM/017I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=td2joqlNnyZ9JU0XXiBvLrvbussuOqf96hg3CLpFVjMD46w+qg+CmVAyjkRJtxZ8RDoDmZw8NlkmE9Jtk1au6SN4JLF8vQ3v4D7tHlgAR3hS1s/pyZLMtTyVU8VYXFanQios8M8RChfmm+c3hjAIGeahrz/qVWy8k1vU9Im0rZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nz7YsQFu; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nz7YsQFu"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747898056;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c0y7gJ4cOrVsehNbWughqJepfz7W/QByEig+k3NtHTc=;
	b=nz7YsQFuIa7nrdgDsoaHb7j5MDbfb2+J+cOEDBDeRZuf7qcnUeVSCOOzy8+qs4EbDpvKsf
	OrNFaHUN/ygleWNvCEahkEKcTBttf7Dr+zzUVAYbTT8hTcBXAPdx9TTMLxLHb44MqT9ofJ
	eEb8Kg5FOQEoplq4md8QS9CjVRtevMA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.500.181.1.5\))
Subject: Re: [PATCH] mm/hugetlb: fix kernel NULL pointer dereference when
 replacing free hugetlb folios
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <aC63fmFKK84K7YiZ@localhost.localdomain>
Date: Thu, 22 May 2025 15:13:31 +0800
Cc: yangge1116@126.com,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 21cnbao@gmail.com,
 david@redhat.com,
 baolin.wang@linux.alibaba.com,
 liuzixing@hygon.cn
Content-Transfer-Encoding: quoted-printable
Message-Id: <065093C4-3599-456F-84B7-EDCC1A3E8AFC@linux.dev>
References: <1747884137-26685-1-git-send-email-yangge1116@126.com>
 <644FF836-9DC7-42B4-BACE-C433E637B885@linux.dev>
 <aC63fmFKK84K7YiZ@localhost.localdomain>
To: Oscar Salvador <osalvador@suse.de>
X-Migadu-Flow: FLOW_OUT



> On May 22, 2025, at 13:34, Oscar Salvador <osalvador@suse.de> wrote:
>=20
> On Thu, May 22, 2025 at 11:47:05AM +0800, Muchun Song wrote:
>> Thanks for fixing this problem. BTW, in order to catch future similar =
problem,
>> it is better to add WARN_ON into folio_hstate() to assert if =
hugetlb_lock
>> is not held when folio's reference count is zero. For this fix, LGTM.
>=20
> Why cannot we put all the burden in =
alloc_and_dissolve_hugetlb_folio(),
> which will again check things under the lock?

I've also considered about this choice, because there is another similar
case in isolate_or_dissolve_huge_page() which could benefit from this
change. I am fine with both approaches. Anyway, adding an assertion into
folio_hstate() is an improvement for capturing invalid users in the =
future.
Because any user of folio_hstate() should hold a reference to folio or
hold the hugetlb_lock to make sure it returns a valid hstate for a =
hugetlb
folio.

Muchun,
Thanks.

> I mean, I would be ok to save cycles and check upfront in
> replace_free_hugepage_folios(), but the latter has only one user which
> is alloc_contig_range(), which is not really an expected-to-be =
optimized
> function.
>=20
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index bd8971388236..b4d937732256 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -2924,13 +2924,6 @@ int replace_free_hugepage_folios(unsigned long =
start_pfn, unsigned long end_pfn)
>=20
>   	while (start_pfn < end_pfn) {
>   		folio =3D pfn_folio(start_pfn);
> - 		if (folio_test_hugetlb(folio)) {
> - 			h =3D folio_hstate(folio);
> - 		} else {
> - 			start_pfn++;
> - 			continue;
> - 		}
> -
>   		if (!folio_ref_count(folio)) {
>   			ret =3D alloc_and_dissolve_hugetlb_folio(h, =
folio,
>         						&isolate_list);
>=20
>=20
>=20
> --=20
> Oscar Salvador
> SUSE Labs

