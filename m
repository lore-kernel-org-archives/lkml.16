Received: from mailout2.samsung.com (mailout2.samsung.com [203.254.224.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3770B2C3242
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:01:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.254.224.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749106915; cv=none; b=ALIFmZJjnvKbYqJTBeCPtDHavOafAQNi0ENV54QJxcfWDPLlVUUTMhvYyYzFoUDqh242Z3nxCnDM+LVSnyha1aQywr0tIm/j0JAXYS5Mo2lSWkdGUoeEoRl6PyBglMW44YzdeEmIbzmDIGnkqAqY1aWNy22ibNygbRoc38nwMmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749106915; c=relaxed/simple;
	bh=/n+2rnWWXed5mSDKIdbxwsvVrRRZfjs9qi15dEL/cEc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:In-Reply-To:
	 Content-Type:References; b=ZQxmvlLgKT5CC3xNkGPgbyrqQPOgvFE/zfrARgU9sh7amvv1YrX530n9nnPP+k+5LAuJMw65+XqBpU8jbuIjSMNbhAniy0yLkUd1Ys9aU62AJyFpt1o9MFtKLp/JnSE4zLZ2u6g+AiF0CuZJNJCHxnQidjUmcLzAwq5cy6ac7Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=YlLpWaYF; arc=none smtp.client-ip=203.254.224.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="YlLpWaYF"
Received: from epcas2p4.samsung.com (unknown [182.195.41.56])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250605070149epoutp029fb81a800e6c8aac67f40681ba4a7395~GE3emAK1u1731517315epoutp02C
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:01:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250605070149epoutp029fb81a800e6c8aac67f40681ba4a7395~GE3emAK1u1731517315epoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1749106909;
	bh=juWpwMCYYA8ie+48ojJr38xgptZSqgOPV6ZW7qY+lwk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=YlLpWaYFfCe4vauaYh0dYgf/8ZzfCf2INW443F9trN082QaDRkfxM1XhSmeYsL5bU
	 tzJRc0dyzT517W58/ciSyjlr6Cpm15yGUz1+Yf91gBsBUpOn5d9Dc3NTD0hp8sduxU
	 ceTL/EViQO0JWv+k6KFt2GgvSouEDoUiXA734oLU=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPS id
	20250605070149epcas2p3d0c1eb806235acac945eb32c3c6127e9~GE3d6wXbV2972529725epcas2p3n;
	Thu,  5 Jun 2025 07:01:49 +0000 (GMT)
Received: from epcas2p4.samsung.com (unknown [182.195.36.92]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4bCb3J41bZz6B9mT; Thu,  5 Jun
	2025 07:01:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas2p3.samsung.com (KnoxPortal) with ESMTPA id
	20250605070147epcas2p3cafdf3d7a160ba01b763449873a3d2c4~GE3cgZ7_T2972529725epcas2p3g;
	Thu,  5 Jun 2025 07:01:47 +0000 (GMT)
Received: from tiffany (unknown [10.229.95.142]) by epsmtip2.samsung.com
	(KnoxPortal) with ESMTPA id
	20250605070147epsmtip2db1c635974005d8dd679fbff9654e5e7~GE3ccv0Jr2418224182epsmtip28;
	Thu,  5 Jun 2025 07:01:47 +0000 (GMT)
Date: Thu, 5 Jun 2025 15:59:59 +0900
From: Hyesoo Yu <hyesoo.yu@samsung.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
	jaewon31.kim@gmail.com, david@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>,
	John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Message-ID: <20250605065959.GA3678683@tiffany>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250604222400.63203f9b10ae5b4c25f6de0b@linux-foundation.org>
X-CMS-MailID: 20250605070147epcas2p3cafdf3d7a160ba01b763449873a3d2c4
X-Msg-Generator: CA
Content-Type: multipart/mixed;
	boundary="----bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_3385f_"
X-Sendblock-Type: AUTO_CONFIDENTIAL
CMS-TYPE: 102P
cpgsPolicy: CPGSC10-234,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
	<CGME20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551@epcas2p4.samsung.com>
	<20250605033210.3184521-3-hyesoo.yu@samsung.com>
	<20250604204323.95a646ae67f6800069a11e36@linux-foundation.org>
	<20250605051131.GA3407065@tiffany>
	<20250604222400.63203f9b10ae5b4c25f6de0b@linux-foundation.org>

------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_3385f_
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Jun 04, 2025 at 10:24:00PM -0700, Andrew Morton wrote:
> On Thu, 5 Jun 2025 14:11:31 +0900 Hyesoo Yu <hyesoo.yu@samsung.com> wrote:
> 
> > We have confirmed that this regression causes CMA pages to be pinned
> > in our kernel 6.12-based environment.
> > 
> > In addition to CMA allocation failures, we also observed GUP longterm
> > failures in cases where the same VMA was accessed repeatedly.
> > 
> > Specifically, the first GUP longterm call would pin a CMA page, and a second
> > call on the same region would fail the migration due to the cma page already
> > being pinned.
> > 
> > After reverting commit 1aaf8c122918, the issue no longer reproduced.
> > 
> > Therefore, this fix is important to ensure reliable behavior of GUP longterm
> > and CMA-backed memory, and should be backported to stable.
> 
> Great, thanks.  Please add this to the patch's changelog.
> 
> 
> The problem is, this series combines a non-urgent cleanup with an
> important, backportable regression fix.  We shouldn't backport the
> cleanup into earlier kernels - that just adds undesirable noise.
> 
> So can I ask you to prepare a single standalone fix for the regression
> against current -linus and to later propose the cleanup patch for
> 6.17-rc1?
> 
> In other words, pleas reverse the patching order, send the patches
> separately and test the regression fix without the presence of the
> cleanup?
> 
> (I could do these manipulations locally but then what I have for the
> regression fix wasn't standalone tested by yourself).
> 
> Thanks.
> 

Thanks for the clarification. I'll prepare a standalone v3 patch with just the fix,
and send the cleanup separately for 6.17-rc1 as suggested.

Thanks,
Regards.

------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_3385f_
Content-Type: text/plain; charset="utf-8"


------bfByJ-ZIY6BJv7sVO1BMUP1RgQAR8Q.m4BWNyUsw_2ev9GnZ=_3385f_--
