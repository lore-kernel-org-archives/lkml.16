Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461C23BD06
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747931427; cv=none; b=L3q/a/67Bxe7xgnox88eM0Rtxh650BcjfptSmfHwFHoBV9lCjUhC9ePqY82eGcXr4LAZ1MZo/SLzK66c6Ji+T9vA+ERBDWKpzMigz7YQ72lKt8A7ZBqIM8/ch+ytm8sMfACxu2cFg+1UW9xgUkPz6/ajU8x5ij5M4D/I8UAk48g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747931427; c=relaxed/simple;
	bh=ErKNg1bZtjFKHE5owvEz7JuTEBOTcD3HzXcy1Gqq+jk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=O93zMYdfWidRG3BCTuDvASt1250BlhD98n27aVagmoILDHBH848O5bC9U0m1ZApRHaQap2IqocOeQ+Yg+uueABoUM4S1swt+pqwOgPlBsC64riFZxO5CWsRBT+WwyZz3zMJM8ReTgxjRE5izdATDF9d2DTX7jjyvd/klELwVXt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AHgxTcTm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AHgxTcTm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 399C6C4CEEA;
	Thu, 22 May 2025 16:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747931426;
	bh=ErKNg1bZtjFKHE5owvEz7JuTEBOTcD3HzXcy1Gqq+jk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AHgxTcTm17+aF8cZSJd1mab22/p1bbJ7/QX26FxtO7feOQKV0LktNGbBsRNfh93e9
	 IKWj3mmuMyNBv6QIW5xh7W86nQQMRcVtvCvH7IYFmZO5VWFVCU4tNxUD9ZpCAV75zy
	 c8XxudWYgz405jXNh3QagVTWoXRaSmeDxeVDp/Pe3xknWhgS76g082Hrye5z+QrjE4
	 7zO86KrDh/XJYJ+SYBXd6rXLavIHBsCl+3dWcatkXL4/t4i9AlupMOjV/qyNVIeEBk
	 qO1VolkmOSeCx6h5/lWe507ZZgNqcwaYvHtbhiDVbl+TkJvq9XZP7shvKTLmd+GWg3
	 P9Uwo2+JzmNsQ==
From: SeongJae Park <sj@kernel.org>
To: Gregory Price <gourry@gourry.net>
Cc: SeongJae Park <sj@kernel.org>,
	Bharata B Rao <bharata@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com,
	dave.hansen@intel.com,
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
Date: Thu, 22 May 2025 09:30:23 -0700
Message-Id: <20250522163024.56592-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <aC6VIG7GPnqr3ug-@gourry-fedora-PF4VCD3F>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 21 May 2025 23:08:16 -0400 Gregory Price <gourry@gourry.net> wrote:

> On Wed, May 21, 2025 at 11:45:52AM -0700, SeongJae Park wrote:
> > Hi Bharata,
> > 
> > On Wed, 21 May 2025 13:32:36 +0530 Bharata B Rao <bharata@amd.com> wrote:
> > 
> > > Hi,
> > > 
> > > This is an attempt to convert the NUMA balancing to do batched
> > > migration instead of migrating one folio at a time. The basic
> > > idea is to collect (from hint fault handler) the folios to be
> > > migrated in a list and batch-migrate them from task_work context.
> > > More details about the specifics are present in patch 2/2.
> > > 
> > > During LSFMM[1] and subsequent discussions in MM alignment calls[2],
> > > it was suggested that separate migration threads to handle migration
> > > or promotion request may be desirable. Existing NUMA balancing, hot
> > > page promotion and other future promotion techniques could off-load
> > > migration part to these threads. Or if we manage to have a single
> > > source of hotness truth like kpromoted[3], then that too can hand
> > > over migration requests to the migration threads. I am envisaging
> > > that different hotness sources like kmmscand[4], MGLRU[5], IBS[6]
> > > and CXL HMU would push hot page info to kpromoted, which would
> > > then isolate and push the folios to be promoted to the migrator
> > > thread.
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
> 
> It seems to me that DAMON might make use of the batch migration
> interface, so if you need any changes or extensions, it might be good
> for you (SJ) to take a look at that for us.

I started this subthread not for batch migration but the long term goal.  I
took only a glance on the migration batching part, and I'm still trying to find
time to take more deep look on batch migration.

Nonetheless, yes, basically I believe DAMON and Bharata's works have great
opportunities to collaborate and use each other in a very productive ways.  I'm
especially very intersted in kpromoted's AMD IBS code, and trying to make DAMON
easier to be used for Bharata's works.

For batch migration interface, though, to be honest I don't find very clear
DAMON's usage of it, since DAMON does region-based sort of batched migration.
Again, I took only a glance on migration batching part and gonna take more time
to the details.

Meanwhile, if you saw some opportunities, and if you don't mind, it would be
very helpful if you can share your detailed view of the opportunity (how DAMON
could be better by using the migration batching in what way?).


Thanks,
SJ


> 
> ~Gregory
