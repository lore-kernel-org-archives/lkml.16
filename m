Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D592857C4
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747679148; cv=none; b=dpiqMiXuv0xetisPKWx7gdVmtv8EVaUYlMQBFPGd5GeIIIS26gvXI6CFdSKr51uVc9lGg9vAn+UKabK6ch8noQr+EVRmDmGJMqszPt766rd50mvYRZBFpnE80qNETtWDvHRpjJ6E2csmiG8TDeQ75SQ9i9iopf+AwvGElaMYB0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747679148; c=relaxed/simple;
	bh=NIDBPzXUqQ3vtMsBWBp5K7llFn1Vg+0Pe1G6c7OuNEM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Sk9fbmo1Osn7Qd04OjQt4A32Zjgc3YFhyPyEHLlQ2cfdFzmxKSoMuy4rRRASQWLrLsD/Za/dE2gJpTFEBwbzLDNdqfP3zTnseFVjnKmZ2i82S+dKtRyYMSRI8SQA5aXlzYq+7IJcS1v82aS6ZaoYml0QfhXVBjgVqQdA1sk4j+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OWaSNc+a; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OWaSNc+a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72BFC4CEE4;
	Mon, 19 May 2025 18:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747679148;
	bh=NIDBPzXUqQ3vtMsBWBp5K7llFn1Vg+0Pe1G6c7OuNEM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OWaSNc+a/MGXZl7VvatWyMP1U6uYkMg6Yt9tWz1bxHCCUhWPz5170lWukvKEzixcU
	 2WlqmJSSiGtyL8VMgxWcfDGqrtrAStpKz63mjf6yj+qRrSXwQZviWcnlpynHuAvYNB
	 yx18mmSYjNCcgllxx6jpxJ/6aGBTbghg6hs9Ln5xVbSSYiHcdmnFu/x865k0IC/4Wq
	 ETTtIz4fy28cSO/kPRppamhby63aCGZAg7RTTAwJTjzcuTt/wmZIWZcZYJRO3HrGGv
	 WmCDK3bgi4VhToYu9ZjzWIuVs2EritLOpJZ1BalQ52bZNLBfvhm9cMaKFh1+DGX9OW
	 8qdFky4nmdKXA==
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
Date: Mon, 19 May 2025 11:25:44 -0700
Message-Id: <20250519182544.45603-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <371ec2c6-01d9-4deb-a234-aacad94680c5@lucifer.local>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Sat, 17 May 2025 20:28:49 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:

> On Fri, Jan 31, 2025 at 05:51:45PM +0000, Lorenzo Stoakes wrote:
> > On Fri, Jan 31, 2025 at 12:47:24PM -0500, Liam R. Howlett wrote:
> > > * Davidlohr Bueso <dave@stgolabs.net> [250131 12:31]:
> > > > On Fri, 31 Jan 2025, Lorenzo Stoakes wrote:
> > > >
> > > > > On Thu, Jan 16, 2025 at 05:30:58PM -0800, SeongJae Park wrote:
> > > > > > Optimize redundant mmap lock operations from process_madvise() by
> > > > > > directly doing the mmap locking first, and then the remaining works for
> > > > > > all ranges in the loop.
> > > > > >
> > > > > > Signed-off-by: SeongJae Park <sj@kernel.org>
> > > > >
> > > > > I wonder if this might increase lock contention because now all of the
> > > > > vector operations will hold the relevant mm lock without releasing after
> > > > > each operation?
> > > >
> > > > That was exactly my concern. While afaict the numbers presented in v1
> > > > are quite nice, this is ultimately a micro-benchmark, where no other
> > > > unrelated threads are impacted by these new hold times.
> > >
> > > Indeed, I was also concerned about this scenario.
> > >
> > > But this method does have the added advantage of keeping the vma space
> > > in the same state as it was expected during the initial call - although
> > > the race does still exist on looking vs acting on the data.  This would
> > > just remove the intermediate changes.
> > >
> > > >
> > > > > Probably it's ok given limited size of iov, but maybe in future we'd want
> > > > > to set a limit on the ranges before we drop/reacquire lock?
> > > >
> > > > imo, this should best be done in the same patch/series. Maybe extend
> > > > the benchmark to use IOV_MAX and find a sweet spot?
> > >
> > > Are you worried this is over-engineering for a problem that may never be
> > > an issue, or is there a particular usecase you have in mind?
> > >
> > > It is probably worth investigating, and maybe a potential usecase would
> > > help with the targeted sweet spot?
> > >
> >
> > Keep in mind process_madvise() is not limited by IOV_MAX, which can be rather
> > high, but rather UIO_FASTIOV, which is limited to 8 entries.
> >
> > (Some have been surprised by this limitation...!)
> 
> Surprised, perhaps because I was wrong about this :) Apologies for that.
> 
> SJ raised this in [0] and the non-RFC version of this series is over at [1].
> 
> [0]: https://lore.kernel.org/all/20250517162048.36347-1-sj@kernel.org/
> [1]: https://lore.kernel.org/all/20250206061517.2958-1-sj@kernel.org/

I actually mentioned[1] I think the real limit is UIO_MAXIOV but still that
wouldn't be a real problem since users can tune the batching size.  Actually
jemalloc has made a change to use process_madvise() with up to 128 batching
size.

I impatiently sent[3] the next revision without giving you enough time to
reply, though.

> 
> We should revisit this and determine whether the drop/reacquire lock is
> required, perhaps doing some experiments around heavy operations using
> UIO_MAXIOV entries?
> 
> SJ - could you take a look at this please?

We had a chance to test this against a production workload, and found no
visible regression.  The workload is not intesively calling process_madvise()
though.  Our internal testing of kernels having this change also didn't find
any problem so far, though process_madvise() calls from the internal testing is
also not intensive to my best knowledge.

So my thought about UIO_MAXIOV is same.  I anticipate no issue (until someone
yells ;) ) and didn't find an evidence of the problem.  But also same to the
previous discussion[1], I agree more testing would be good, while I have no
good list of benchmarks for this.  It would be nice if someone can give me the
name of the benchmarks.

> 
> >
> > So I think at this point scaling isn't a huge issue, I raise it because in
> > future we may want to increase this limit, at which point we should think about
> > it, which is why I sort of hand-waved it away a bit.
> 
> Again as I said here, I suspect _probably_ this won't be too much of an
> issue - but it is absolutely one we need to address.

Yes, I agree :)

[1] https://lore.kernel.org/20250204195343.16500-1-sj@kernel.org
[2] https://github.com/jemalloc/jemalloc/pull/2794/commits/c3604456d4c1f570348a
[3] https://lore.kernel.org/20250206062801.3060-1-sj@kernel.org


Thanks,
SJ

[...]
