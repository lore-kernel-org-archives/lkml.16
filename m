Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8019E297A76
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723533; cv=none; b=BjNjAVWb7iSQ57gN+pcI1vma88hHP6gY+qO4C0RHDFyzvgakg8MjrC+dD0btwvgd+xxL5cNF+PhU7Pzb/YS5EkJFny8z/TfTlhbFCxxXplgabVhxZrGqq6j6LvnBbw43EtYN13CTGRW0ClGSszxTb/9hihgLW0t4YmZA3cuuiNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723533; c=relaxed/simple;
	bh=CMteX3n2e10SVA4k3BwSSymaRK5pVqkJwxuE7DvwdAQ=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=JdoNd0yTgG+M+/k6bEtmltKiBsKY6uQjz3x3YzGiuO5lishIUVgW03v/pWCR96aLaDjL/dyB+1LJ024v29ozvKq4GhkpW1nCbQk+BKsSQf7+RTn47dx1I1s7j23YH6pyGt9nEHebgMtyAOcFdBW/bP6rBjJuS0lZrnmHIJ3g6fg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=oalai9G1; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="oalai9G1"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744723529;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMteX3n2e10SVA4k3BwSSymaRK5pVqkJwxuE7DvwdAQ=;
	b=oalai9G1DzkbiJAzhH5f3EvBWYeqve1FiBziFRPzaUuTUm4+wz4WYWhbRf0jY4L7a/9yRr
	ARlT9eLPqXovlBBCWom2x+utQZWjlsa/8kXth3l9yPNa2l0SgkFDJjhU2PsGNuEsVcS6tJ
	1YZNm6+5Ckn9fdS+aUKso/zQ0j2y3DA=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: [PATCH] mm, hugetlb: Increment the number of pages to be reset on
 HVO
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250415111859.376302-1-osalvador@suse.de>
Date: Tue, 15 Apr 2025 21:24:52 +0800
Cc: Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@redhat.com>,
 linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <BDEBB9B4-D3D3-4CEA-8BE0-1E2947F688D4@linux.dev>
References: <20250415111859.376302-1-osalvador@suse.de>
To: Oscar Salvador <osalvador@suse.de>
X-Migadu-Flow: FLOW_OUT



> On Apr 15, 2025, at 19:18, Oscar Salvador <osalvador@suse.de> wrote:
>=20
> commit 4eeec8c89a0c ("mm: move hugetlb specific things in folio to =
page[3]")
> shifted hugetlb specific stuff, and now mapping overlaps =
_hugetlb_cgroup field.
>=20
> Upon restoring the vmemmap for HVO, only the first two tail pages are =
reset, and
> this causes the check in free_tail_page_prepare() to fail as it finds
> an unexpected mapping value in some tails.
>=20
> Increment the number of pages to be reset to 4 (head + 3 tail pages)
>=20
> Fixes: 4eeec8c89a0c ("mm: move hugetlb specific things in folio to =
page[3]")
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Oscar Salvador <osalvador@suse.de>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

Thanks.

