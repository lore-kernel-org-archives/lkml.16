Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80AB1101C8
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:57:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744235864; cv=none; b=D11CtciG25SqrJmZIcRjmUro6y4xyeWQXdJUrlvIKTbD5vhFA+hEcGaXAyPqmmc6gDt+4IVDwWwVu4AACmnLQi2P/bBg6/Efa3Z6SIG3MKjNu0NczIxic2ESdK0xzaehWWnldJymscQZWeNo3nxe3ChZjgnGtlUfVlfgFOFOxag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744235864; c=relaxed/simple;
	bh=g+nTPKE4Hg3n3gbhGO3GXjBoqEoPctOfPL0jB877PUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cwO8qy8bTfk3XM9O2NUeuYsFRj2hzcfUkj5wTbtKo/6Y6tY/qHuNm4zuN73os16Wjpa5oP5wQoZBMztpV3ASb+O6KuruZnhvvNYi0ms/ZLR2yvnqaePpP9s7wXoHl1V2XgIMEtxpUpRGBruvpD54U7jbei16g+FizwPX7ujvmeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=gKDcMMHF; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="gKDcMMHF"
Date: Wed, 9 Apr 2025 17:57:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744235859;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7wUe9pHBSuC5Oe0ZRJOjDIIZ/Co8LyEOQFuUiVOm0oA=;
	b=gKDcMMHFPwlL2p3jQJDm2SvVZx4WqiDfWZW01X1jUml7YX8R9p2G3ln76sPyQ9iph5tMhg
	/coZH/07NIWLPJHOP3Vu0mzSbRJzFb5jz6SMHTbmUuEHG5ZmgPHMoULYmRYv4i+wRuiLuQ
	8O1E3Q1Nv/0/B4KItY3UmYPmtvZSQSE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Suren Baghdasaryan <surenb@google.com>, Janghyuck Kim <janghyuck.kim@samsung.com>, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] alloc_tag: Handle incomplete bulk allocations in
 vm_module_tags_populate
Message-ID: <kamspewougkeipnlpdhbzyhu63ildqmfpuw46loqcjohrbr6bf@enpp5occ33eo>
References: <20250409195448.3697351-1-tjmercier@google.com>
 <20250409140848.da67768ac1f5e79d7296de4d@linux-foundation.org>
 <20250409141131.bd67f6b19ea7e770dce40ac7@linux-foundation.org>
 <CABdmKX3D-iCwkuAXLsFyyJD7LikoR0rygR6CnR4Fv-u9+OjnZg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABdmKX3D-iCwkuAXLsFyyJD7LikoR0rygR6CnR4Fv-u9+OjnZg@mail.gmail.com>
X-Migadu-Flow: FLOW_OUT

On Wed, Apr 09, 2025 at 02:51:18PM -0700, T.J. Mercier wrote:
> On Wed, Apr 9, 2025 at 2:11 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > On Wed, 9 Apr 2025 14:08:48 -0700 Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > > On Wed,  9 Apr 2025 19:54:47 +0000 "T.J. Mercier" <tjmercier@google.com> wrote:
> > >
> > > > alloc_pages_bulk_node may partially succeed and allocate fewer than the
> > > > requested nr_pages. There are several conditions under which this can
> > > > occur, but we have encountered the case where CONFIG_PAGE_OWNER is
> > > > enabled causing all bulk allocations to always fallback to single page
> > > > allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
> > > > allocator recursion with pagesets.lock held").
> > > >
> > > > Currently vm_module_tags_populate immediately fails when
> > > > alloc_pages_bulk_node returns fewer than the requested number of pages.
> > > > This patch causes vm_module_tags_populate to retry bulk allocations for
> > > > the remaining memory instead.
> > >
> > > Please describe the userspace-visible runtime effects of this change.  In a way
> > > which permits a user who is experiencing some problem can recognize that this
> > > patch will address that problem.
> > >
> > > ...
> > >
> > > Reported-by: Janghyuck Kim <janghyuck.kim@samsung.com>
> >
> > A Closes: link will presumably help with the above info.  checkpatch
> > now warns about the absence of a Closes:
> 
> Hi Andrew, This was reported on our internal bug tracker so there is
> no public link I can provide here. If it's better not to add a
> Reported-by in this case, then I will do that in the future.

In that case perhaps cut and paste the info from your internal bug
tracker?

Commit messages can include quite a bit more than just a short
description of the commit, when it's relevant - e.g. I try to include
the literal log of the oops being fixed when appropriate.

It really helps when looking at things weeks or months later and trying
to remember "ok, exactly what was that code path I need to watch out
for?"
