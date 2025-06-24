Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D7E1C07C4
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750758448; cv=none; b=u2g/fEu2/NgsIe35NXLu4Mlr/D++etLXWrZEbyOu4AzOeYnaa7t0oFBmLNIcUUJ6fNOjjaMdt1WGHZFIz9vzyxBGZWwNpy6HozxFYsNN1/NtWDt7idVbaSke0I56XDIREAVkg0DaD/iEUTrgMmrXZCpQZCcxCpuooiF6svwf+8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750758448; c=relaxed/simple;
	bh=8rR4TgJpip5g/XvJwoVV7iyGd6lp1NNv6BYYgLnbeH0=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=KKWnmAKguEX/s9lppbG6R3CemrGCvw0PDde01r2n1iE7IFx0fqyPlUxwjZZ5RZXQ9kV5vv/aEjjy3VdQnfjXaQFvTGRLrtJVZVZuSGHuLbq+9xHV0Pk+plS9/X/GzgofZNTxy0FXP00tYYnkOysaXNWO4/HU12Eb3C81yHNaC2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bRKqT1h2Tz5DBq2;
	Tue, 24 Jun 2025 17:47:17 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 55O9l9iv067596;
	Tue, 24 Jun 2025 17:47:09 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp02[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 24 Jun 2025 17:47:11 +0800 (CST)
Date: Tue, 24 Jun 2025 17:47:11 +0800 (CST)
X-Zmail-TransId: 2afa685a741fffffffffdb9-d505a
X-Mailer: Zmail v1.0
Message-ID: <20250624174711752wxRCqiy0LZGukb1R7z_6D@zte.com.cn>
In-Reply-To: <910a462a-8d4d-4b5d-941c-ba1396e287dc@kylinos.cn>
References: 202506181714096412Nvp5B3BkFpi3-CKLQ9ep@zte.com.cn,910a462a-8d4d-4b5d-941c-ba1396e287dc@kylinos.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xialonglong@kylinos.cn>
Cc: <david@redhat.com>, <akpm@linux-foundation.org>,
        <chengming.zhou@linux.dev>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <shr@devkernel.io>, <corbet@lwn.net>,
        <lorenzo.stoakes@oracle.com>, <Liam.Howlett@oracle.com>,
        <vbabka@suse.cz>
Subject: =?UTF-8?B?562U5aSNOiBbUEFUQ0ggMS8xXSBtbS9rc206IGFkZCBrc21fcGFnZXNfc2hhcmluZyBmb3IgZWFjaCBwcm9jZXNzIHRvIGNhbGN1bGF0ZSBwcm9maXQgbW9yZSBhY2N1cmF0ZWx5?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55O9l9iv067596
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 685A7425.000/4bRKqT1h2Tz5DBq2

> >>>> and /proc/self/ksm_stat/ to indicate the saved pages of this process.
> >>>> (not including ksm_zero_pages)
> >>> Curious, why is updating ksm_process_profit() insufficient and we also
> >>> have to expose ksm_pages_sharing?
> >>>
> >> Since ksm_process_profit() uses ksm_merging_pages(pages_sharing +
> >> pages_shared) to calculate the profit for individual processes,
> >>
> >> while general_profit uses pages_sharing for profit calculation, this can
> >> lead to the total profit calculated for each process being greater than
> >> that of general_profit.
> >>
> >> Additionally, exposing ksm_pages_sharing under /proc/self/ksm_stat/ may
> >> be sufficient.
> >>
> > Hi,
> >
> > Althorugh it's true, however, this patch maybe not okay. It can only ensure
> > that the sum of each process's profit roughly equals the system's general_profit
> > , but gives totally wrong profit result for some one process. For example, when
> > two pages from two different processes are merged, one process's page_shared
> > increments by +1, while the other's pages_sharing increments by +1, which
> > resulting in different calculated profits for the two processes, even though
> > their actual profits are identical. If in more extreme cases, this could even
> > render a process's profit entirely unreadable.
> >
> > Lastly, do we really need each process’s profit sum to perfectly match the general
> > profit, or we just want a rough estimate of the process’s profit from KSM ?
> >
> Hi,
> 
> In extreme cases, stable nodes may be distributed quite unevenly, which 
> is due to stable nodes not being per mm, of course.
> There are also situations where there are 1000 pairs of pages, with the 
> pages within each pair being identical, while each pair is different 
> from all other pages.
> This results in the number of page_sharing and page_shared being the 
> same. This way, using ksm_merging_pages(page_sharing + page_shared) 
> averages a 50% error.

In your tests, I don't agree 50% error because your
assumption that process benefit equals pages_sharing is fundamentally flawed.

The issue lies in what is the most accurate definition of process KSM profit.
Since stable_node isn't per-mm, we cannot calculate a process's
benefit solely based on pages_sharing. The cost of stable_node should be split
fairly among every process sharing this stable_node, rather than being assigned
to a single individual.

It's inaccurate to claim that when two processes' pages merge into a
single KSM page, one process gains 4k - sizeof(rmap_item) while
the other gains 0 ? This is unfair to the second process, as it actively
participated in the KSM merge.


The most accurate and fair profit caculation should be:

    profit = (ksm_merging_pages - united_stable_nodes)*PAGE_SIZE - sizeof(rmap_items)*ksm_rmap_items

where 'united_stable_nodes' is (stable_node)/shared_process. This is too complex.

For example: process A with one page is merged with process B with one page

process A      process B
    page          page
     \           /
      \         /
       \       /
        \     /
        Ksm Page

A: pages_sharing(1), pages_shared(0)
B: pages_sharing(0), pages_shared(1)

then

profit(A) = (pages_sharing + pages_shared - united_stable_nodes)*4K- sizeof(rmap_items)*ksm_rmap_items

          = (1 + 0 - 1/2)*4k-sizeof(rmap_items)*ksm_rmap_items

          = 0.5*4k - sizeof(rmap_items)*ksm_rmap_items

profit(A) = (pages_sharing + pages_shared - united_stable_nodes)*4K- sizeof(rmap_items)*ksm_rmap_items

	  = (0 + 1 - 1/2)*4k-sizeof(rmap_items)*ksm_rmap_items

          = 0.5*4k - sizeof(rmap_items)*ksm_rmap_items


> In practical testing, we may only need to enable KSM for specific 
> applications and calculate the total benefits of these processes.
> Since page_shared is also included in the statistics, this may lead to 
> the calculated benefits being higher than the actual ones.
> In practical testing, the error may reach 20%. For example, in one test, 
> the total benefits of all processes were estimated to be around 528MB,
> while the profit calculated through general_profit was only around 428MB.
> The theoretical error may be around 50%.
> 
> If we expose the ksm_pages_sharing for each process, we can not only 
> calculate the actual benefits
> 
> but also determine how many ksm_pages_shared there are by the difference 
> between ksm_merging_pages and ksm_pages_sharing of each process.
