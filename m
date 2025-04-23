Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22FAE35950
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 00:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745368588; cv=none; b=cm8GDtjCkTcNZb+h4ec9TnDmDXv+9ZjM2PfwCZ1UKD7zSvN0MEaAtXS8M7Jek9q9ZLVfCY/GvEme/mjghWGWjkwVSPj4zr7YhihyzCCCqPw3SxCHhdVGOW9Ayyhu+YRMxMo9ihTs1PytVLQI3oF+DRb+l+jdrgte6qyiiqeRzHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745368588; c=relaxed/simple;
	bh=JXAYLxEBJPlGREhE4DebtR5owMbNCSA8bKimQ7xu7I4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DQh/dXqtz+dfc1DJJkbjaWBEfzpwpeQ0wmOubIwgmZhaVZhMoxW/v3dcqgatmsdq/fpbJhzGl+UHY9feUT2YCXIwDqEpKd0wnDMxvjkaTnxTABPvljXNfLVjtf4PBMByY0SJF3vcQXQQDOlRIVydMn8lSM6hwJUtW/Zjz3PUC0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=mtvA48Mw; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="mtvA48Mw"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=opbjpmtV+QjU6K14eXPT731fTnozvdVx1b0MGih+sWU=; b=mtvA48MwYQ/XQaE9ry9JNzBTgo
	O8ZFwpYn+gJZ/A6oY7W7xqeAMlnkR8JCMkMLBpFPouTT01y1oUoNAQMcvcvfforxd0FbWO6iDW1by
	QzdXGkLb2xfAPK6MHDPuWvYJvk3yFibK9A07nIRj2+ESe6vdFReaV6FcGh2lWxvlulLQX5fBvdkPA
	UtAV0iE8Y47ka+e3ej+M5j31EHFSCt8s1CAdqVwODgI51Ff2kbhYIBjOxCKb79LQInZ/Kd8/F/D+m
	WBCAJfRLmQhFLc0PHVKWcwonFtmqzAMb2bYjUUFttAsuJoDe91rP1Y8/xzGDOqV794UdDQMemX/NZ
	xkDD6RDQ==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7O5z-00000006Uw5-0YtJ;
	Wed, 23 Apr 2025 00:36:11 +0000
Date: Wed, 23 Apr 2025 01:36:10 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Shivank Garg <shivankg@amd.com>, shaggy@kernel.org, david@redhat.com,
	wangkefeng.wang@huawei.com, jane.chu@oracle.com, ziy@nvidia.com,
	donettom@linux.ibm.com, apopple@nvidia.com,
	jfs-discussion@lists.sourceforge.net, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	syzbot+8bb6fd945af4e0ad9299@syzkaller.appspotmail.com
Subject: Re: [PATCH V4 1/2] mm: add folio_migration_expected_refs() as inline
 function
Message-ID: <aAg1-hZ0a-44WW6b@casper.infradead.org>
References: <20250422114000.15003-1-shivankg@amd.com>
 <20250422114000.15003-2-shivankg@amd.com>
 <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250422164111.f5d3f0756ad94d012180ece5@linux-foundation.org>

On Tue, Apr 22, 2025 at 04:41:11PM -0700, Andrew Morton wrote:
> > +/**
> > + * folio_migrate_expected_refs - Count expected references for an unmapped folio.
> 
> "folio_migration_expected_refs"

Please run make W=1 fs/jfs/ in order to run kernel-doc on this file.
It'll flag this kind of error.

> It's concerning that one particular filesystem needs this - one
> suspects that it is doing something wrong, or that the present API
> offerings were misdesigned.  It would be helpful if the changelogs were
> to explain what is special about JFS.

It doesn't surprise me at all.  Almost no filesystem implements its own
migrate_folio operation.  Without going into too much detail, almost
all filesystems can use filemap_migrate_folio(), buffer_migrate_folio()
or buffer_migrate_folio_norefs().  So this is not an indication that
jfs is doing anything wrong (except maybe it's misdesigned in that the
per-folio metadata caches the address of the folio, but changing that
seems very much too much work to ask someone to do).

What I do wonder is whether we want to have such a specialised
function existing.  We have can_split_folio() in huge_memory.c
which is somewhat more comprehensive and doesn't require the folio to be
unmapped first.

I currently lack the capacity to write pseudo-code illustrating what I
mean, but I'll have a try tomorrow.
