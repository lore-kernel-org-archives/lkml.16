Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41BE51547D8
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 19:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738698828; cv=none; b=OMlH55tQenjRggVsmmG79RUzwtksbzeYi3NyT7L96qjC6yOcl/87WLml1kRmjoZa95we8fEEvflAxq0DYYNhAoXmnjCZXJL27GSvn5S/xuzzsfQWetAXnZvAOUyayNI79z2WO6GykVP019+jUPPI2kJviBTwASfJP+3IUi0wmZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738698828; c=relaxed/simple;
	bh=YE7iLCsVMIkRgrPseqapZzwyo9OsMGafX9hSn73e1LY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GQ0kjsquwUAFOulGtTQevOc8pqeMD7FxWr+3Om92n8NCxKL/HxV6Tto8ttvLb1QIiL6gswoIuOVyn0znzo+jZBq5yU6RNHmab4FjyHWRpH8sIruo2CNRw1cLiis2Pie4d/gOViIzFdFiAFEiaqVfkaZ4DxI+yIyM1ua48Sl1wxo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HuIiVLu2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HuIiVLu2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78770C4CEDF;
	Tue,  4 Feb 2025 19:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738698827;
	bh=YE7iLCsVMIkRgrPseqapZzwyo9OsMGafX9hSn73e1LY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HuIiVLu2PXRDvemu9WId344WZtFX8wSPlWNOiXQy305xuk9fxJUcrmg7rdIWzHOA8
	 a5gtwgiQlAEUcSqzMk8jxdF2oBsGKjK4I47N8vpHL2hU74dKdrDCE5OlN5roQzhGx5
	 PauTbEezbxmGiXCkX8ojJV0Ril2jsDqINSWrt3VJCPDg+7zYLfej2fkOpXWmdiPZDY
	 cseCFoFUE+oab6OGbbHYSDh38EuaXVBAIbsoLDZ1kdb4kGIrSI9FXDzRfe0GqpO7vf
	 DxFmsrUuJxNpP198ZfoHmA8uBZcp57Kh5jY6BkzvXSf/p3MFy7u59zd2vUq/9fRC5L
	 eBGmxUk0xXQNA==
From: SeongJae Park <sj@kernel.org>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [RFC PATCH v2 4/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Tue,  4 Feb 2025 11:53:43 -0800
Message-Id: <20250204195343.16500-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <5fc4e100-70d3-44c1-99f7-f8a5a6a0ba65@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 31 Jan 2025 17:51:45 +0000 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Jan 31, 2025 at 12:47:24PM -0500, Liam R. Howlett wrote:
> > * Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> > > On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> > >
> > > > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > > > Optimize redundant mmap lock operations from process_madvise() by
> > > > > directly doing the mmap locking first, and then the remaining works for
> > > > > all ranges in the loop.
> > > > >
> > > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > >
> > > > I wonder if this might increase lock contention because now all of the
> > > > vector operations will hold the relevant mm lock without releasing after
> > > > each operation?
> > >
> > > That was exactly my concern. While afaict the numbers presented in v1
> > > are quite nice, this is ultimately a micro-benchmark, where no other
> > > unrelated threads are impacted by these new hold times.
> >
> > Indeed, I was also concerned about this scenario.
> >
> > But this method does have the added advantage of keeping the vma space
> > in the same state as it was expected during the initial call - although
> > the race does still exist on looking vs acting on the data.  This would
> > just remove the intermediate changes.
> >
> > >
> > > > Probably it's ok given limited size of iov,

I think so.  Also, users could adjust the batching size for their workloads.

> > > > but maybe in future we'd want
> > > > to set a limit on the ranges before we drop/reacquire lock?
> > >
> > > imo, this should best be done in the same patch/series. Maybe extend
> > > the benchmark to use IOV_MAX and find a sweet spot?
> >
> > Are you worried this is over-engineering for a problem that may never be
> > an issue, or is there a particular usecase you have in mind?
> >
> > It is probably worth investigating, and maybe a potential usecase would
> > help with the targeted sweet spot?

I think the sweet spot may depend on the workload and the advice type.  So
selection of the benchmark will be important.  Do you have a benchmark in your
mind?  My humble microbenchmark[1] does only single-thread usage performance
evaluation, so may not be appropriate to be used here.  I actually do the
evaluation with batching size up to the IOV_MAX (1024), but show no clear
evidence of the sweet spot.

> >
> 
> Keep in mind process_madvise() is not limited by IOV_MAX, which can be rather
> high, but rather UIO_FASTIOV, which is limited to 8 entries.

process_madvise() indeed have iovec array of UIO_FASTIOV size, namely iovstack.
But, if I understood the code correctly, iostack is used only for a fast path
that the user requested advicing less than UIO_FASTIOV regions.

I actually confirmed I can make the loop itrate 1024 times, using my
microbenchmark[1].  My step for the check was running the program with
'eval_pmadv $((4*1024*1024)) $((4*1024)) $((4*1024*1024))' command, and
counting the number of the itration of the vector_madvise() main loop using
printk().  Please let me know if I'm missing something.

> 
> (Some have been surprised by this limitation...!)
> 
> So I think at this point scaling isn't a huge issue, I raise it because in
> future we may want to increase this limit, at which point we should think about
> it, which is why I sort of hand-waved it away a bit.

I personally think this may still not be a huge issue, especially given the
fact that users can test and tune the limit.  But I'd like to hear more
opinions if available.

[1] https://github.com/sjp38/eval_proc_madvise/blob/master/eval_pmadv.c


Thanks,
SJ

> 
> > Thanks,
> > Liam
> >
> 
