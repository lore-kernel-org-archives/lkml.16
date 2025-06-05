Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB5FF9EC
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 03:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749095004; cv=none; b=lrSrLRaPiwHv/59g+TBhIDpr4N//s/1de5Djs6fL5+UIqVdUXsNi0oCGVD0cWzPnlm8QVEXR7n4YAKDnzEVOWDMNTxpacPQr4MKtf3EkCCYJPnKAHA1w14i3RcN0Mj3CyWOUJzNY0TdOJSCmwrsDAf9mgvavONLbMr8cfnRjIlI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749095004; c=relaxed/simple;
	bh=sAWDLLVExfSdqrwYieUPJUq0LX0W8qh3MRDgC7cddeo=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=aTqB/XW99MECDcmyu7624GZqz+VWVA41rkQ15uh4szqDdsYUoymXe81/loBfM4ljmhMDyD8u9wKAVUvHsYa76hmgqcz4NNrUhOidMKDNI+easS/kb8nrLN8tVrnk8OHaxjg/6u8cEMTm+OE8F3Dzr3cpIsIE+eJJNqr0QYWNmEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=vE3Z5nrD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="vE3Z5nrD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2970C4CEEB;
	Thu,  5 Jun 2025 03:43:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1749095004;
	bh=sAWDLLVExfSdqrwYieUPJUq0LX0W8qh3MRDgC7cddeo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vE3Z5nrDR8c5pmkqLn1SwM2W0BeGhJB2EvfmuNmtbmOJh93W2LxDAzy9uc50eO3hl
	 uNNoo1nigjkQqUrYItUttGwYsNZNtzwaMwCvdUvO6pYI0KRUUSOy8UxJorxqc7y+N2
	 WRb4zXm2b7qNuA4qjOACNY9eNKf3PpuCzTl30414=
Date: Wed, 4 Jun 2025 20:43:23 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Hyesoo Yu <hyesoo.yu@samsung.com>
Cc: janghyuck.kim@samsung.com, zhaoyang.huang@unisoc.com,
 jaewon31.kim@gmail.com, david@redhat.com, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] mm: gup: avoid CMA page pinning by retrying
 migration if no migratable page
Message-Id: <20250604204323.95a646ae67f6800069a11e36@linux-foundation.org>
In-Reply-To: <20250605033210.3184521-3-hyesoo.yu@samsung.com>
References: <20250605033210.3184521-1-hyesoo.yu@samsung.com>
	<CGME20250605033432epcas2p4c024a9d05246b18c217f3562b3f53551@epcas2p4.samsung.com>
	<20250605033210.3184521-3-hyesoo.yu@samsung.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu,  5 Jun 2025 12:32:07 +0900 Hyesoo Yu <hyesoo.yu@samsung.com> wrote:

> Commit 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")
> introduced an issue where CMA pages could be pinned by longterm GUP requests.
> This occurs when unpinnable pages are detected but the movable_page_list is empty;
> the commit would return success without retrying, allowing unpinnable
> pages (such as CMA) to become pinned.
> 
> CMA pages may be temporarily off the LRU due to concurrent isolation,
> for example when multiple longterm GUP requests are racing and therefore
> not appear in movable_page_list. Before commit 1aaf8c, the kernel would
> retry migration in such cases, which helped avoid accidental CMA pinning.
> 
> The original intent of the commit was to support longterm GUP on non-LRU
> CMA pages in out-of-tree use cases such as pKVM. However, allowing this
> can lead to broader CMA pinning issues.
> 
> To avoid this, the logic is restored to return -EAGAIN instead of success
> when no folios could be collected but unpinnable pages were found.
> This ensures that migration is retried until success, and avoids
> inadvertently pinning unpinnable pages.
> 
> Fixes: 1aaf8c122918 ("mm: gup: fix infinite loop within __get_longterm_locked")

v6.14.

As ever, a question is "should we backport this fix".  To answer that
we should understand the effect the regression has upon our users. 
Readers can guess, but it's better if you tell us this, please?


