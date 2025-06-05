Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C221E24B26
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:13:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749100407; cv=none; b=BcRn4fhHiWo8t5boGBVje0FQeue0y4aMToG+j+7yCDnk1Cni76MFdwDPkS1z3VXWP0jtciG6q6qzFRRLeiY+9GJ5uBJhKvG9Y7C01pomROrKJv38/VurzC1JiUgSeVXdhTAt7FmWgJVXzlRRthC7GR+3kAJe4CJy7596KflPmgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749100407; c=relaxed/simple;
	bh=yjKcUVsaOzsXlLaQQ6sVYum/jf/YVTmjmTtuD4pHD+Y=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=lJhJokML7ALZ+co0VtPMOHuMXAiPxh3DC9pcBtLmHdEZ4DJpSXDlLr+5NyqNpVqksiM25IwHKO+nggmjYVhEvRclVwQZuHVqhZr7wUWI5z0HIiSu9USJXHVZlSWQELMXPff4vFxjlDqw0d/dmuU3AELM95onsgvVUIeNY75uljU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=O50PM8nT; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="O50PM8nT"
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250605051322epoutp02a17a35543e53e6cbbc43ed7d53c3433c~GDYyERrSY3266132661epoutp02H
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 05:13:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250605051322epoutp02a17a35543e53e6cbbc43ed7d53c3433c~GDYyERrSY3266132661epoutp02H
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749100402;
	bh=TWZJnqmiFPsSy1+ILLqtvM1BwPxqpl14A88a5Y7yhVg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=O50PM8nTZjeAH6peznjsVNd6ROJAp6sMkDLlxgluh1/bV+AZuGG13WvvLXqX+q4Eq
	 R+5KEY0Fwt6gST2XIhanC4g0pZIV6FcfCNUQnjJfRLXT4HdPf/jyyLXU4u1RtZarV6
	 t1iUo0u+CinRkl2OzZLqFCL24N1yV2abe0xQq4UA=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p4.samsung.com (KnoxPortal) with ESMTPS id
	20250605051321epcas2p41d48d5da8ce26a73ad4b5de424a807f6~GDYxoACPw3115231152epcas2p4R;
	Thu,  5 Jun 2025 05:13:21 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.89]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bCXf930Kmz6B9m5; Thu,  5 Jun
	2025 05:13:21 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250605051320epcas2p31ea8aec2cbc88346cd08b2200a96e53f~GDYwk3cVo1550815508epcas2p3O;
	Thu,  5 Jun 2025 05:13:20 +0000 (GMT)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip1.samsung.com
	(KnoxPortal) with ESMTPA id
	20250605051320epsmtip116d0132b5d4ad98ba02e5f10b4ee2d5f~GDYwhojvp2376823768epsmtip1Z;
	Thu,  5 Jun 2025 05:13:20 +0000 (GMT)
Date: Thu, 5 Jun 2025 14:11:31 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Message-ID: <20250605051131.GA3407065@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250604204323.95a646ae67f6800069a11e36@linux-foundation.org>
X-CMS-MailID: 20250605051320epcas2p31ea8aec2cbc88346cd08b2200a96e53f
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_322ae_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
	<CGME20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551@epcas2p4.samsung.com>
	<20250605033210.3184521-3-hyesoo.yu@samsung.com>
	<20250604204323.95a646ae67f6800069a11e36@linux-foundation.org>

------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_322ae_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2025 at 08:43:23PM -0700, Andrew Morton wrote:
> On Thu,  5 Jun 2025 12:32:07 +0900 Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
> 
> > Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> > introduced an issue where CMA pages could be pinned by longterm GUP requests.
> > This occurs when unpinnable pages are detected but the movable_page_list is empty;
> > the commit would return success without retrying, allowing unpinnable
> > pages (such as CMA) to become pinned.
> > 
> > CMA pages may be temporarily off the LRU due to concurrent isolation,
> > for example when multiple longterm GUP requests are racing and therefore
> > not appear in movable_page_list. Before commit 1aaf8c, the kernel would
> > retry migration in such cases, which helped avoid accidental CMA pinning.
> > 
> > The original intent of the commit was to support longterm GUP on non-LRU
> > CMA pages in out-of-tree use cases such as pKVM. However, allowing this
> > can lead to broader CMA pinning issues.
> > 
> > To avoid this, the logic is restored to return -EAGAIN instead of success
> > when no folios could be collected but unpinnable pages were found.
> > This ensures that migration is retried until success, and avoids
> > inadvertently pinning unpinnable pages.
> > 
> > Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> 
> v6.14.
> 
> As ever, a question is "should we backport this fix".  To answer that
> we should understand the effect the regression has upon our users. 
> Readers can guess, but it's better if you tell us this, please?
>

Hi Andrew.

We have confirmed that this regression causes CMA pages to be pinned
in our kernel 6.12-based environment.

In addition to CMA allocation failures, we also observed GUP longterm
failures in cases where the same VMA was accessed repeatedly.

Specifically, the first GUP longterm call would pin a CMA page, and a second
call on the same region would fail the migration due to the cma page already
being pinned.

After reverting commit 1aaf8c122918, the issue no longer reproduced.

Therefore, this fix is important to ensure reliable behavior of GUP longterm
and CMA-backed memory, and should be backported to stable.

Thanks,
Regards.

> 
> 

------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_322ae_
Content-Type: text/plain; charset="utf-8"


------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_322ae_--
