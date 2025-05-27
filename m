Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9821E32B7
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 18:50:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748371823; cv=none; b=Lnaf2I/4fNuTVHgri0UzAu40yPrLmGDjyxbHtZUWaVX2656NNlabUH5OVyi11cMqqkgmQfahUToFRy9Vlujk+vgMe0dVE8vy01H1MBzwBrHmNBq1dHqkG9ZsbTn+pkmgSqRgQwd937mULaZ8eR3fkUhGiT4bjBbI61GOijU437o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748371823; c=relaxed/simple;
	bh=6arYoFIhtasrIwdyo9c3OArXFmv3IflHhEXcgqbsST4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=arsl1eZv7BMzNUh74PrgH4xGcfrY1Yy6NiVXkdaF6hS6k3y7LUH1o9UpteeRGVGJNwJtqD1in9PZvjhBnXusJIEApWTRiYJk7nQvWG6xVV3d1CXwEuEvXr/12Juw+NQp+dGo3C+Zx4h+4FlXP5OZ4CLvW4UDOPQsB4qOnbQbMD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nh//koH/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nh//koH/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92D47C4CEE9;
	Tue, 27 May 2025 18:50:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748371822;
	bh=6arYoFIhtasrIwdyo9c3OArXFmv3IflHhEXcgqbsST4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nh//koH/ba3SjdfBFtVrFMJwyd7JBy+pCyzJQ9VGsAIFjCAeP8Ezw5ZCw5dukdW8i
	 yiqLOww0NWNom+jP0HdCk6Z3ulLcjU2RAItZsQShxg05tM7QxBowPlN88AiTAXzEVS
	 8ZE8Wd8Hnu3LnSOdk3DEVkYfE5gomZA5OQOuOAGexADIZPjeSVlu2neEkB1ekJb7d7
	 uEFRPoDefHgXAdXeTaoLpveKPAvj37K9JLlAMbDAjD7/TuLYJvlYxGwHo7v7vZcjte
	 zlRH545AGA6GXUSrsapmyGb929Oikz5Bk9zarB385sqYnmVWGtMF8mMLrV1uFs9wsc
	 eSOS8CdVaitEA==
From: SeongJae Park <sj@kernel.org>
To: Bharata B Rao <bharata@amd.com>
Cc: SeongJae Park <sj@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com,
	gourry@gourry.net,
	hannes@cmpxchg.org,
	mgorman@techsingularity.net,
	mingo@redhat.com,
	peterz@infradead.org,
	raghavendra.kt@amd.com,
	riel@surriel.com,
	rientjes@google.com,
	weixugc@google.com,
	willy@infradead.org,
	ying.huang@linux.alibaba.com,
	ziy@nvidia.com,
	dave@stgolabs.net,
	nifan.cxl@gmail.com,
	joshua.hahnjy@gmail.com,
	xuezhengchu@huawei.com,
	yiannis@zptcorp.com,
	akpm@linux-foundation.org,
	david@redhat.com
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
Date: Tue, 27 May 2025 11:50:19 -0700
Message-Id: <20250527185019.12457-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <ad5e9cdc-9bdd-4824-9c11-171bfcc39b38@amd.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 26 May 2025 10:50:02 +0530 Bharata B Rao <bharata@amd.com> wrote:

> Hi SJ,
> 
> On 22-May-25 12:15 AM, SeongJae Park wrote:
> > Hi Bharata,
> > 
> > On Wed, 21 May 2025 13:32:36 +0530 Bharata B Rao <bharata@amd.com> wrote:
> > 
> >> Hi,
> >>
> >> This is an attempt to convert the NUMA balancing to do batched
> >> migration instead of migrating one folio at a time. The basic
> >> idea is to collect (from hint fault handler) the folios to be
> >> migrated in a list and batch-migrate them from task_work context.
> >> More details about the specifics are present in patch 2/2.
> >>
> >> During LSFMM[1] and subsequent discussions in MM alignment calls[2],
> >> it was suggested that separate migration threads to handle migration
> >> or promotion request may be desirable. Existing NUMA balancing, hot
> >> page promotion and other future promotion techniques could off-load
> >> migration part to these threads. Or if we manage to have a single
> >> source of hotness truth like kpromoted[3], then that too can hand
> >> over migration requests to the migration threads. I am envisaging
> >> that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
> >> and CXL HMU would push hot page info to kpromoted, which would
> >> then isolate and push the folios to be promoted to the migrator
> >> thread.
> > 
> > I think (or, hope) it would also be not very worthless or rude to mention other
> > existing and ongoing works that have potentials to serve for similar purpose or
> > collaborate in future, here.
> > 
> > DAMON is designed for a sort of multi-source access information handling.  In
> > LSFMM, I proposed[1] damon_report_access() interface for making it easier to be
> > extended for more types of access information.  Currenlty damon_report_access()
> > is under early development.  I think this has a potential to serve something
> > similar to your single source goal.
> > 
> > Also in LSFMM, I proposed damos_add_folio() for a case that callers want to
> > utilize DAMON worker thread (kdamond) as an asynchronous memory
> > management operations execution thread while using its other features such as
> > [auto-tuned] quotas.  I think this has a potential to serve something similar
> > to your migration threads.  I haven't started damos_add_folio() development
> > yet, though.
> > 
> > I remember we discussed about DAMON on mailing list and in LSFMM a bit, on your
> > session.  IIRC, you were also looking for a time to see if there is a chance to
> > use DAMON in some way.  Due to the technical issue, we were unable to discuss
> > on the two new proposals on my LSFMM session, and it has been a bit while since
> > our last discussion.  So if you don't mind, I'd like to ask if you have some
> > opinions or comments about these.
> > 
> > [1] https://lwn.net/Articles/1016525/
> 
> Since this patchset was just about making the migration batched and 
> async for NUMAB, I didn't mention DAMON as an alternative here.

I was thinking a clarification like this could be useful for readers though,
since you were mentioning the future work together.  Thank you for clarifying.

> 
> One of the concerns I always had about DAMON when it is considered as 
> replacement for existing hot page migration is its current inability to 
> gather and maintain hot page info at per-folio granularity.

I think this is a very valid concern.  But I don't think DAMON should be a
_replacement_.  Rather, I'm looking for a chance to make existing approaches
help each other.  For example, I recommend running DAMON-based memory
tiering[1] together with the LRU-based demotion.  I think there is no reason to
discourage using it together with NUMAB-2 based promotion, if the folio
granularity is a real issue.  That is, still NUMAB-2 will do synchronous
promotion, but DAMON will do it asynchronously, so the amount of synchronous
promotions and its overhead will reduce.

I didn't encourage using NUMB-2 based promotion together with DAMON-based
memory tiering[1] not because I show a problem at such co-usage, but just
because I found no clear benefit of that from my test setup.  In theory, I
think running those together makes sense.

That said, we're also making efforts for overcoming the folio-granularity issue
on DAMON side, too.  We implemented page-level filters that motivated by SK
hynix' test results, and developed monitoring intervals auto-tuning for overall
monitoring results accuracy.  We proposed damon_report_access() and
damos_add_folios() as yet another opportunitis to better deal with the issue.
I was curious about your opinion to damon_report_access() and
damos_add_folios() for the reason.  I understand that could be out of the scope
of this patch series, though.

> How much 
> that eventually matters to the workloads has to be really seen.

Cannot agree more.  Nonetheless, as mentioned abovely, my test setup[1] didn't
show the problem.  That said, I'm not really convinced with my test setup, and
I don't think the test setup is good for verifying the problem.  Hence I'm
trying to make a better test setup for this.  I'll share more of the new setup
if I make some progress.  I will also be more than happy to learn about other's
test setup if they have a good one or suggestions.

[1] https://lore.kernel.org/20250420194030.75838-1-sj@kernel.org


Thanks,
SJ

[...]
