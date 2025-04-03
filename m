Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 153302E62BE
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 22:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743719475; cv=none; b=TeeGYMMPjl5A79sdnvuJbOQVbFbCvKVrNjymSUfa/Cdr7dlLVzykcWFJKCpabhFJ3n7sXI3jkpy1703KyXR43gmwTIAXwpRb+xdcWzWUq9OBJUX98shHjVCgcxcZVcyNj0tDmwTZje2S8uDXYi+AlbnR1dsaPjRAy4N6pNqXDYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743719475; c=relaxed/simple;
	bh=rNZoM9d1tV00aAeGb6rlXU6Azx/yF9/5xSnVjIx6IH4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HpsN5OsePKIOsrvWSGLdqRQaHciNzOkEkWg1qXe1eBzjeK6qCcL2Mi7P2h9RbbmKe3XBfp25K3auYcu7s728tFW9hXD7yVmzW3VduOM4+Hfqf/T+gFmRvJAWXcC/jUUwWldcLvEt5W0RIOn3Dxs2XuZe7I70HWVekG+AhwwUd0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=GYrDPtC9; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="GYrDPtC9"
Date: Thu, 3 Apr 2025 15:31:03 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743719468;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=I2YMxJLVOxf5Msh8xAVkAPGRaQ5u2VBNP5i6pKAuBnA=;
	b=GYrDPtC9HxorWN2ME9LQ7pSdx/YJdj+EQGY3OMRUKYMmgayRquh9gX+r23skWfDktLqlTW
	tEOBWd18SmZq7OqgJ04y8eC653vvXUof2R7kKPXRLxQHTn6KELScewHN36PTjDt3YuOKBc
	gu9QIDcMGX+LwnQESFvFY2G2iA34jVY=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Shakeel Butt <shakeel.butt@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Rik van Riel <riel@surriel.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@meta.com, Vinay Banakar <vny@google.com>, 
	liuye <liuye@kylinos.cn>, Hugh Dickins <hughd@google.com>, 
	Mel Gorman <mgorman@techsingularity.net>, Yu Zhao <yuzhao@google.com>
Subject: Re: [PATCH v2] mm/vmscan: batch TLB flush during memory reclaim
Message-ID: <7u3xvh3sz54xg7nii7lakwggpifv3ez7ffgmxjudj54bq463un@iyjjt5zosmup>
References: <20250328142055.313916d1@fangorn>
 <20250403150055.94a38bc7e6e3f618fbc23ddd@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403150055.94a38bc7e6e3f618fbc23ddd@linux-foundation.org>
X-Migadu-Flow: FLOW_OUT

On Thu, Apr 03, 2025 at 03:00:55PM -0700, Andrew Morton wrote:
> On Fri, 28 Mar 2025 14:20:55 -0400 Rik van Riel <riel@surriel.com> wrote:
> 
> > The current implementation in shrink_folio_list() performs a full TLB
> > flush for every individual folio reclaimed. This causes unnecessary
> > overhead during memory reclaim.
> > 
> > The current code:
> > 1. Clears PTEs and unmaps each page individually
> > 2. Performs a full TLB flush on every CPU the mm is running on
> > 
> > The new code:
> > 1. Clears PTEs and unmaps each page individually
> > 2. Adds each unmapped page to pageout_folios
> > 3. Flushes the TLB once before procesing pageout_folios
> > 
> > This reduces the number of TLB flushes issued by the memory reclaim
> > code by 1/N, where N is the number of mapped folios encountered in
> > the batch processed by shrink_folio_list.
> 
> Were any runtime benefits observable?

Andrew, can you hold off this patch for now? I provided some feedback
privately but let me put it here as well.

This patch is very very hard to review. shrink_folio_list() has become a
beast over the years. This patch is moving a code block within the same
function and skipping a lot of stuff happening between the old place and
the new place. I still couldn't figure out how the actual freeing of
folios are happening as the patch completely skips
mem_cgroup_uncharge_folios() & free_unref_folios(). Also the lazyfree
counters are skipped. In addition buffer head, swap free, mlocked
handling will be skipped as well.

I think there is a need to explain why this patch is correct even with
skipping all those functionalities.
