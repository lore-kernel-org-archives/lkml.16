Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EC4F226D00
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 12:37:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746103071; cv=none; b=FNtYPsHpJswDboISEEqw2xKdw/sU0SEwvb5SnsqniMlJ4WbgufpNXxfOredxcPBu6EBWvrxKb1a2kHEXQVhHihtDga/cX5ehbkiGbGi2b73NzBWN4+WLHsTKR+oSD0w0SZ23qlfhp+5shWvDl+5wF3cVCu6Kc3J6yONyS8i6wDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746103071; c=relaxed/simple;
	bh=Xjt+QXWCzdgawzUfwnzPfQshx6+qjUN1px4VexEIgK0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RxRAcJn3ix3ABvESBmo1xOzsvzPqYOWdNFbiMV7/FcLazsTS8ibexfLtwRAbMuE9lEk263RcF6GIN8hz51GEWaDnnUTx6nj28n6pQ4Rg/50wwtDkUEFg4zSGk6qAZzT24uEr+7WNSJdh5FeyhJYvOYLTYnnDSVSOZTab0p51HcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=MFYKE2Cy; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="MFYKE2Cy"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=RFLqDtj9WCiupbjGiNWaG8bfOzw+8VuthN4hxWe4ohQ=; b=MFYKE2Cy1elX/LO4cC4GfixDVb
	OlHXACoCCTjMoHcesJOM8eF3EJzCk0A15yU10fk15ENOtzDU/tUru352e6GF7m/3pjUtGvpXH7UQk
	zL/nTr8eE4H/+HOTVMlhdHeYzrzsPbm9Hmp2jvyzfbfJMln6I7VCy8DCyBK00UZxdK76E/tYl4gyU
	S9Al7vkK9bi6hMQWMQJ1FDy0MX9YV8vwADfONwGE+yv9pxe3qp/CRTRZ7InEKRqB/U2+akWw++7DU
	N48LvKM8REOwZSCb4jN6fzXukEHN1dcYiJhvqUqKL25R9o8FXuVia7S2TF3SnKmnDMFVf2e4+aOjy
	Ys4XltNw==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uATAX-00000000BZe-21Y2;
	Thu, 01 May 2025 12:37:37 +0000
Date: Thu, 1 May 2025 13:37:37 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, shaggy@kernel.org, david@redhat.com,
	wangkefeng.wang@huawei.com, jane.chu@oracle.com, ziy@nvidia.com,
	donettom@linux.ibm.com, apopple@nvidia.com,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Subject: Re: [PATCH V5 0/2]  JFS: Implement migrate_folio for
 jfs_metapage_aops
Message-ID: <aBNrEbVkpLHkK7eF@casper.infradead.org>
References: <20250430100150.279751-1-shivankg@amd.com>
 <20250430142135.099ecfa33963f0895b0f2c1d@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250430142135.099ecfa33963f0895b0f2c1d@linux-foundation.org>

On Wed, Apr 30, 2025 at 02:21:35PM -0700, Andrew Morton wrote:
> On Wed, 30 Apr 2025 10:01:49 +0000 Shivank Garg <shivankg@amd.com> wrote:
> > This patch addresses a warning that occurs during memory compaction due
> > to JFS's missing migrate_folio operation. The warning was introduced by
> > commit 7ee3647243e5 ("migrate: Remove call to ->writepage") which added
> > explicit warnings when filesystem don't implement migrate_folio.
> 
> Do we think these patches should be backported into -stable kernels?
> 
> Or maybe we should simply remove the warning from -stable kernels then
> re-add it when we're confident that all in-tree filesystems are good?

7ee3647243e5 is not yet in Linus' tree, let alone in -stable.
