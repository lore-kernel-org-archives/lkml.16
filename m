Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 292F12E337B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 08:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743582630; cv=none; b=e5sIl0fn89WqnR8FIBaDveiAV+KVatQjzpRTOT218hHjbJ47lHjZmCz0kdCLABMwcEYVODdqAW419DdQLU/NBOoolxwfYQjNXdh/qZAUiI85ft1J0sA1vJJNgL/hSMs0T05DCFGO0G8YkTbcR97c8h6beeSRSCf7kS6HsZY2+C4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743582630; c=relaxed/simple;
	bh=rK0JwRX7x93+AdZjMygjhNtrfe7HePAeND16fITKgX8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=thQYPT+vLOQLfKFoXETA1B/hg5yc5DGfVZqMFOPSDKvC1FCSBbGsxkvhtBTe+f8MOadCJMgrDEeiIaUxIJjheLKxla4O1vb2ns8jE3x0SM641NOSF/RPusPoz4o9e1IxLXaA6zI189wtqjMmbmLO5IBDERBdROKZBJZ0zozm4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=OvdaTovz; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="OvdaTovz"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1743582618; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=l35Z6/eiF4yIEdG7KwDegt7nCGOLRyuKZvtVkhl+284=;
	b=OvdaTovz+cMRpYWNO5QTFkWhd676bn1eH1DwNGAGtlArdRbF3FvERA1D4BX6tJDO0n6WT0dUsfeuU9p2R0tQv1NvfYJ2lJkfc1s45pSvUBfUmWdlHneQOpT4gdOwo2h/XlBxhQFSN0fbrNErMl0zqzgbhgo/gBamm4njjMGKeNo=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WUIZmQM_1743582617 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Apr 2025 16:30:18 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Songtang Liu <liusongtang@bytedance.com>
Cc: akpm@linux-foundation.org,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  zhengqi.arch@bytedance.com,
  songmuchun@bytedance.com
Subject: Re: [PATCH] mm: page_alloc: Remove redundant READ_ONCE
In-Reply-To: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
	(Songtang Liu's message of "Wed, 2 Apr 2025 03:41:16 -0400")
References: <CAA=HWd1kn01ym8YuVFuAqK2Ggq3itEGkqX8T6eCXs_C7tiv-Jw@mail.gmail.com>
Date: Wed, 02 Apr 2025 16:30:19 +0800
Message-ID: <87wmc3ufs4.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Songtang Liu <liusongtang@bytedance.com> writes:

> In the current code, batch is a local variable, and it cannot be
> concurrently modified. It's unnecessary to use READ_ONCE here,
> so remove it.
>
> Fixes: 51a755c56dc0 ("mm: tune PCP high automatically")
> Signed-off-by: Songtang Liu <liusongtang@bytedance.com>
> ---
>  mm/page_alloc.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index e3ea5bf5c459..6edc6e57d4f8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -2661,7 +2661,7 @@ static void free_frozen_page_commit(struct zone *zone,
>  		free_high = (pcp->free_count >= batch &&
>  			     (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) &&
>  			     (!(pcp->flags & PCPF_FREE_HIGH_BATCH) ||
> -			      pcp->count >= READ_ONCE(batch)));
> +			      pcp->count >= batch));

Nice catch!

Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>

>  		pcp->flags |= PCPF_PREV_FREE_HIGH_ORDER;
>  	} else if (pcp->flags & PCPF_PREV_FREE_HIGH_ORDER) {
>  		pcp->flags &= ~PCPF_PREV_FREE_HIGH_ORDER;

---
Best Regards,
Huang, Ying
