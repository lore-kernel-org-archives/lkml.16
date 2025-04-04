Received: from out-188.mta0.migadu.com (out-188.mta0.migadu.com [91.218.175.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3C791ACED9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743759572; cv=none; b=gWcKwtX7+AYjtC+h3rABToRoXBZ7OwB5CLeQCEM3Wgru6haV200mMGiFSl34qwUWxvKj/xOAqBlqxEhLetsLoM2IyDnrOM1W1N16g+m7gR33noqBLSjgjpRS4bkVjQbQt4VDa+jCc4PXBwirk+CcVe0CG9t+aYhoInUwEWKz3JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743759572; c=relaxed/simple;
	bh=JsO2DCBi+8esMKHuOLikLhu2OLtnCeJi3aVwUcFStVo=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=PyUoi/TTVbZ9SDcHKMpeZHhOnXzPCnu7entzOf1HlLLymo4sKwmmtA3rVFX6t5SIICTcHsV9hqLyhMyJ1W9j69MUt67ETQeqBXTwwJgliffkQqA2go1N4k9f+HsMK8iMepmdSo9LEG+SjMI9lI7UG00/C1xYWqOWVCrVPwOv8og=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Fmnwubo2; arc=none smtp.client-ip=91.218.175.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Fmnwubo2"
Content-Type: text/plain;
	charset=us-ascii
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743759557;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HvCbJgJnFGne+TAMBgY6cQ6iJ4WbAlnhHeP54hSBG3U=;
	b=Fmnwubo2TjnwNa23ZsXq1DE1aQDCxDMZQTSrFaDHVwxBUA4J7T93QPMm4Mpo25S6FDBWbe
	hXnzoy6iMBRZc/lE9/ZTBBkQdIyDbrfWZG45bfRlKvTTSNLK55OyHl+b9lko2taHXfZnfn
	MDBdQ6PxRyGu3r5IhprHpajQ+cgmImM=
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Re: CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is broken, was Re: [RFC
 PATCH 0/6] Deep talk about folio vmap
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20250404090111.GB11105@lst.de>
Date: Fri, 4 Apr 2025 17:38:35 +0800
Cc: Huan Yang <link@vivo.com>,
 bingbu.cao@linux.intel.com,
 Matthew Wilcox <willy@infradead.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Shuah Khan <shuah@kernel.org>,
 linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org,
 linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org,
 opensource.kernel@vivo.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <9A899641-BDED-4773-B349-56AF1DD58B21@linux.dev>
References: <20250327092922.536-1-link@vivo.com>
 <20250404090111.GB11105@lst.de>
To: Christoph Hellwig <hch@lst.de>
X-Migadu-Flow: FLOW_OUT



> On Apr 4, 2025, at 17:01, Christoph Hellwig <hch@lst.de> wrote:
>=20
> After the btrfs compressed bio discussion I think the hugetlb changes =
that
> skip the tail pages are fundamentally unsafe in the current kernel.
>=20
> That is because the bio_vec representation assumes tail pages do =
exist, so
> as soon as you are doing direct I/O that generates a bvec starting =
beyond
> the present head page things will blow up.  Other users of bio_vecs =
might
> do the same, but the way the block bio_vecs are generated are very =
suspect
> to that.  So we'll first need to sort that out and a few other things
> before we can even think of enabling such a feature.
>=20

I would like to express my gratitude to Christoph for including me in =
the
thread. I have carefully read the cover letter in [1], which indicates
that an issue has arisen due to the improper use of `vmap_pfn()`. I'm
wondering if we could consider using `vmap()` instead. In the HVO =
scenario,
the tail struct pages do **exist**, but they are read-only. I've =
examined
the code of `vmap()`, and it appears that it only reads the struct page.
Therefore, it seems feasible for us to use `vmap()` (I am not a expert =
in
udmabuf.). Right?

[1] =
https://lore.kernel.org/linux-mm/20250327092922.536-1-link@vivo.com/T/#m05=
5b34978cf882fd44d2d08d929b50292d8502b4

Thanks,
Muchun.

