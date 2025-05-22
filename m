Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6525728AAE9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747917631; cv=none; b=OnYOb2wqmFaDdetrc5fDjGZgtmAYoYkq61FCBLYQn/Kg7nLQ8k/hrzTDhg7hKeuVCFOFNQEqUq1umGhQNewGD4DPP0BjWfkXwrvPmjBCmyqQLc9BjBsEK2MyBNbDG6byE61+W7c+5Ae2NBDJ1f8fQ1NItrGYj9tQDlKsP063JC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747917631; c=relaxed/simple;
	bh=o/jJvwOkURxtxoRnJBvK627eN5WNgntlDWEx9DwDX9c=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=kmeds/ZLIW1xarp87yL1SvFLIInP5hMsrNjJ/Wa4PfvTOPzYmkuxgi2MK5O6AHsM2ux9KRChS/vDhb2mNGvwF82gn5SHpYH8MkEh9ZqhzWqjVtgDYnuDjDmby5iHOqOVMBqsOtadgsC2b6HcneXpVv6gVafrtIh1o7yvEvUEbVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=q1kXA6V4; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="q1kXA6V4"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747917615;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o/jJvwOkURxtxoRnJBvK627eN5WNgntlDWEx9DwDX9c=;
	b=q1kXA6V4zfGfrNy51OHqH8rO7FuEZmHb/i59g2jWLmszj+qNGOE9AN2vqsptKOXl5iHjaU
	fnvY86wo+qJ/P/NcfiS2H2yfXi36ba+5ZxJYamSbRxJ2FH31ymZTUnb1jiAeQalUXgczhM
	7OWlVUU/AI78YSia2VIR8bVvUdZPKwg=
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
In-Reply-To: <aC8PRkyd3y74Ph5R@localhost.localdomain>
Date: Thu, 22 May 2025 20:39:39 +0800
Cc: Ge Yang <yangge1116@126.com>,
 akpm@linux-foundation.org,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 21cnbao@gmail.com,
 david@redhat.com,
 baolin.wang@linux.alibaba.com,
 liuzixing@hygon.cn
Content-Transfer-Encoding: quoted-printable
Message-Id: <3B8641A1-5345-44A5-B610-9BCBC980493D@linux.dev>
References: <1747884137-26685-1-git-send-email-yangge1116@126.com>
 <644FF836-9DC7-42B4-BACE-C433E637B885@linux.dev>
 <aC63fmFKK84K7YiZ@localhost.localdomain>
 <ff6bd560-d249-418f-81f4-7cbe055a25ec@126.com>
 <aC8PRkyd3y74Ph5R@localhost.localdomain>
To: Oscar Salvador <osalvador@suse.de>
X-Migadu-Flow: FLOW_OUT



> On May 22, 2025, at 19:49, Oscar Salvador <osalvador@suse.de> wrote:
>=20
> On Thu, May 22, 2025 at 07:34:56PM +0800, Ge Yang wrote:
>> It seems that we cannot simply remove the folio_test_hugetlb() check. =
The
>> reasons are as follows:
>=20
> Yeah, my thought was whether we could move the folio_hstate within
> alloc_and_dissolve_hugetlb_folio(), since the latter really needs to =
take the
> lock.
> But isolate_or_dissolve_huge_page() also needs the 'hstate' not only =
to
> pass it onto alloc_and_dissolve_hugetlb_folio() but to check whether
> hstate is gigantic.

But I think we could use "folio_order() > MAX_PAGE_ORDER" to replace the =
check
of hstate_is_gigantic(), right? Then ee could remove the first parameter =
of hstate
from alloc_and_dissolve_hugetlb_folio() and obtain hstate in it.

>=20
> Umh, kinda hate sparkling the locks all around.
>=20
>=20
> --=20
> Oscar Salvador
> SUSE Labs

