Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AACB62CCA5
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 19:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747163770; cv=none; b=auj9nRdFNtsAMsUNIleOJXjTsD+/0D6/6CPof+CgABQeDSKWyp0J8ESYFIadh3d2iQX3Dex0akY+AnxupSR9bVlLCeJS3U2olFb9g2w67O+BaLZIvPZT6LeAbG2dqjYAEcl/pBaicWnPTg8DbPpVQHaXPhBEPTf73wSkU9fDX2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747163770; c=relaxed/simple;
	bh=V5k52dYSA/PfZQQrQjSFHrnEBE6zy003veOdMuDJAQY=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=m88XTcf3W0nriRahe/W2//uz6hKEWUSDsbHSNwOduBsDAbP2iLHXs9pQKuOxPnquWaBIF8IgrX1jNb9fjSzC9J4JihCSdTBsnhwz+q/XT5derCsOS9uK/WJ4e2tN4EoDUjLTZM93IM0sMJxS0XSUfcw+Tm3VwpuMSPN3kRLEVLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vIpyhZuM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vIpyhZuM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF020C4CEEB;
	Tue, 13 May 2025 19:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747163770;
	bh=V5k52dYSA/PfZQQrQjSFHrnEBE6zy003veOdMuDJAQY=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vIpyhZuMig6+2KRQqd+4EEee0IL+YxvHG2ToxEHYvlS5v4a5UEcMJZvQxEWi2lxx3
	 15mvKpTYJkAlaO+R9g/HCZiJQ8uPhrXtoUTW17KXijcDILiVm/l+vkyIxw5HzBkTMy
	 mkRu52a24jJeZ7e5eNBuBCA+OXvxH6OiE9s3+jjI=
Date: Tue, 13 May 2025 12:16:09 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: Tianyang Zhang <zhangtianyang@loongson.cn>, Harry Yoo
 <harry.yoo@oracle.com>, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>, Michal Hocko <mhocko@suse.com>, Brendan
 Jackman <jackmanb@google.com>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan
 <ziy@nvidia.com>
Subject: Re: [PATCH] mm/page_alloc.c: Avoid infinite retries caused by
 cpuset race
Message-Id: <20250513121609.a9741e49a0e865f25f966de1@linux-foundation.org>
In-Reply-To: <CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com>
References: <20250416082405.20988-1-zhangtianyang@loongson.cn>
	<aAYXP4f417_bx6Is@harry>
	<025e3f51-2ab5-bc58-5475-b57103169a82@loongson.cn>
	<20250422171116.f3928045a13205dc1b9a46ea@linux-foundation.org>
	<CAJuCfpHbXmjAr2Rt0Mo_i32hpGOyXnVtXUd4qFjXriH9eYFDkQ@mail.gmail.com>
	<20250510200740.b7de2408e40be7ad5392fed9@linux-foundation.org>
	<CAJuCfpFdC6hgFSPy3M2sagkFobWeCuxLdcWiyV5pnzB55dgjZg@mail.gmail.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 13 May 2025 09:26:53 -0700 Suren Baghdasaryan <surenb@google.com> wrote:

> > > > This has been in mm-hotfixes-unstable for six days.  Hopefully we'll
> > > > see some review activity soon (please).
> > >
> > > I reviewed and provided my feedback but saw neither a reply nor a
> > > respin with proposed changes.
> >
> > OK, thanks.  Do you have time to put together a modified version of this?
> 
> I think the code is fine as is. Would be good to add Fixes: tag but it
> will require some investigation to find the appropriate patch to
> reference here.

Below is what is in mm-hotfixes.  It doesn't actually have any
acked-by's or reviewed-by's.

So... final call for review, please.


From: Tianyang Zhang <zhangtianyang@loongson.cn>
Subject: mm/page_alloc.c: avoid infinite retries caused by cpuset race
Date: Wed, 16 Apr 2025 16:24:05 +0800

__alloc_pages_slowpath has no change detection for ac->nodemask in the
part of retry path, while cpuset can modify it in parallel.  For some
processes that set mempolicy as MPOL_BIND, this results ac->nodemask
changes, and then the should_reclaim_retry will judge based on the latest
nodemask and jump to retry, while the get_page_from_freelist only
traverses the zonelist from ac->preferred_zoneref, which selected by a
expired nodemask and may cause infinite retries in some cases

cpu 64:
__alloc_pages_slowpath {
        /* ..... */
retry:
        /* ac->nodemask = 0x1, ac->preferred->zone->nid = 1 */
        if (alloc_flags & ALLOC_KSWAPD)
                wake_all_kswapds(order, gfp_mask, ac);
        /* cpu 1:
        cpuset_write_resmask
            update_nodemask
                update_nodemasks_hier
                    update_tasks_nodemask
                        mpol_rebind_task
                         mpol_rebind_policy
                          mpol_rebind_nodemask
		// mempolicy->nodes has been modified,
		// which ac->nodemask point to

        */
        /* ac->nodemask = 0x3, ac->preferred->zone->nid = 1 */
        if (should_reclaim_retry(gfp_mask, order, ac, alloc_flags,
                                 did_some_progress > 0, &no_progress_loops))
                goto retry;
}

Simultaneously starting multiple cpuset01 from LTP can quickly reproduce
this issue on a multi node server when the maximum memory pressure is
reached and the swap is enabled

Link: https://lkml.kernel.org/r/20250416082405.20988-1-zhangtianyang@loongson.cn
Fixes: 902b62810a57 ("mm, page_alloc: fix more premature OOM due to race with cpuset update").
Signed-off-by: Tianyang Zhang <zhangtianyang@loongson.cn>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Brendan Jackman <jackmanb@google.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Zi Yan <ziy@nvidia.com>
Cc: <stable@vger.kernel.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 mm/page_alloc.c |    8 ++++++++
 1 file changed, 8 insertions(+)

--- a/mm/page_alloc.c~mm-page_allocc-avoid-infinite-retries-caused-by-cpuset-race
+++ a/mm/page_alloc.c
@@ -4562,6 +4562,14 @@ restart:
 	}
 
 retry:
+	/*
+	 * Deal with possible cpuset update races or zonelist updates to avoid
+	 * infinite retries.
+	 */
+	if (check_retry_cpuset(cpuset_mems_cookie, ac) ||
+	    check_retry_zonelist(zonelist_iter_cookie))
+		goto restart;
+
 	/* Ensure kswapd doesn't accidentally go to sleep as long as we loop */
 	if (alloc_flags & ALLOC_KSWAPD)
 		wake_all_kswapds(order, gfp_mask, ac);
_

