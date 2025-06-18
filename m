Received: from mxhk.zte.com.cn (mxhk.zte.com.cn [160.30.148.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 834CE126C1E
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 09:14:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=160.30.148.35
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750238073; cv=none; b=go/Frtp/Vo1ai2SFpCmllGcjJ4GRdGtMfSeML3LqVMy1qLi67osjmuRcNdoXK+yHKe+xa8PDALET4WgL5FIE+jMUt8Qvcsalz37rM/Jd2SotUD5AP808HfFAyoniyJsGt0ymCithxsCpq4uXGVhhaX2negVtLkvfNGkfk9/mwVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750238073; c=relaxed/simple;
	bh=T91jqxIQYJ1f+y066EqLmtj2U9KVbmjMQ25ttMYhgvQ=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=DfERP0w7OV1n7CA+WW4Ty+lfNfHBISP5zeS4eYMlEd2mS3aEjmCiGJ2UJv5496fKznCJb0VkofHR5WY5W1cQl7j1cBF2QdoHVVaw4w8Lhbs62BdPiQ5Ln1SVFiSU0s7e/cug0U6GqYvJ4+KZeV6tSPuHiWyaYERr8DL/3cbShrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=160.30.148.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4bMdNL1MP4z8RTWX;
	Wed, 18 Jun 2025 17:14:26 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl2.zte.com.cn with SMTP id 55I9E7Cx078308;
	Wed, 18 Jun 2025 17:14:07 +0800 (+08)
	(envelope-from xu.xin16@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Wed, 18 Jun 2025 17:14:09 +0800 (CST)
Date: Wed, 18 Jun 2025 17:14:09 +0800 (CST)
X-Zmail-TransId: 2afc68528361114-19074
X-Mailer: Zmail v1.0
Message-ID: <202506181714096412Nvp5B3BkFpi3-CKLQ9ep@zte.com.cn>
In-Reply-To: <c6c628d9-5908-47f5-83f6-08d1621489fe@kylinos.cn>
References: 20250606070314.3028593-1-xialonglong@kylinos.cn,63145e68-76f7-44a1-b3fb-1213eaa959d0@redhat.com,c6c628d9-5908-47f5-83f6-08d1621489fe@kylinos.cn
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
From: <xu.xin16@zte.com.cn>
To: <xialonglong@kylinos.cn>, <david@redhat.com>
Cc: <david@redhat.com>, <akpm@linux-foundation.org>,
        <chengming.zhou@linux.dev>, <linux-mm@kvack.org>,
        <linux-kernel@vger.kernel.org>, <shr@devkernel.io>
Subject: =?UTF-8?B?UmU6IFtQQVRDSCAxLzFdIG1tL2tzbTogYWRkIGtzbV9wYWdlc19zaGFyaW5nIGZvciBlYWNoIHByb2Nlc3MgdG8gY2FsY3VsYXRlIHByb2ZpdCBtb3JlIGFjY3VyYXRlbHk=?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL:mse-fl2.zte.com.cn 55I9E7Cx078308
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 68528372.000/4bMdNL1MP4z8RTWX

> >
> >> and /proc/self/ksm_stat/ to indicate the saved pages of this process.
> >> (not including ksm_zero_pages)
> >
> > Curious, why is updating ksm_process_profit() insufficient and we also 
> > have to expose ksm_pages_sharing?
> >
> Since ksm_process_profit() uses ksm_merging_pages(pages_sharing + 
> pages_shared) to calculate the profit for individual processes,
> 
> while general_profit uses pages_sharing for profit calculation, this can 
> lead to the total profit calculated for each process being greater than 
> that of general_profit.
> 
> Additionally, exposing ksm_pages_sharing under /proc/self/ksm_stat/ may 
> be sufficient.
> 

Hi,

Althorugh it's true, however, this patch maybe not okay. It can only ensure
that the sum of each process's profit roughly equals the system's general_profit
, but gives totally wrong profit result for some one process. For example, when
two pages from two different processes are merged, one process's page_shared
increments by +1, while the other's pages_sharing increments by +1, which
resulting in different calculated profits for the two processes, even though
their actual profits are identical. If in more extreme cases, this could even
render a process's profit entirely unreadable.  

Lastly, do we really need each process’s profit sum to perfectly match the general
profit, or we just want a rough estimate of the process’s profit from KSM ?

> 
> 
> > Hm, I am wondering if that works. Stable nodes are not per MM, so 
> > can't we create an accounting imbalance for one MM somehow?
> >
> > (did not look into all the details, just something that came to mind)
> >
> Indeed, using the method in this patch to calculate ksm_pages_sharing 
> for each process to determine ksm_pages_shared
> 
> can sometimes result in negative values for ksm_pages_shared.
> 
> example for calculate mm->ksm_pages_shared：
> 
>          if (rmap_item->hlist.next) {
>              ksm_pages_sharing--;
>              rmap_item->mm->ksm_pages_sharing--;
> 
>          } else {
>              ksm_pages_shared--;
>               rmap_item->mm->ksm_pages_shared--; // can be negative
>          }
> 
>          rmap_item->mm->ksm_merging_pages--;
> 
> 
> Would it be possible to compare the ratio of each process's rmap_item to 
> the total rmap_item and the ratio of the process's page_shared to the 
> total page_shared
> 
> to assess this imbalance? For now, I don't have any better ideas.

Although stable_node is not per-mm, if you really add ksm_shared to mm,
it won't cause negative ksm_pages_shared, because the count of ksm_shared
will only be attributed to the process of the first rmap_item.
