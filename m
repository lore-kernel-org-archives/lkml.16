Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D29198823
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 19:52:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738957933; cv=none; b=Sh/5QFMS1MRgA7GedtROxJP8XJG35m/LH034VurIsaMCzYklMoI+RF1/viIEdMcCHaP7Uq2Hl23WC3dXC7VnMUfYrFKDuwzMGrwrbJ8SBtVzOLahKJKa6EqsBDJzx623Gc80wLN0Oz8835dpuDtx6dsRHJjwpxHjstvLrf0FeHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738957933; c=relaxed/simple;
	bh=YD6Vnw1Zes8qZzj1Vzq2xXKOSpCh7rLVAGQgkXot9Ck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=SqDisyeFGB2dst4jzHob7/MnPGx7+rXFHU01OTET9ZmfGAOyQJbzt/f32P+ifL7OfVfW3Pz04Okg5mBiGXW0qbU8N73z/DVxP3FRgCEX4Wb0jtG1wQMcij3kzBX0GiTD7rXv3IPRaFyaVk8Lv0WEwRixw92biBc7HgCXCc6/yMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S+EaCJ4k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S+EaCJ4k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E2E4EC4CED1;
	Fri,  7 Feb 2025 19:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738957933;
	bh=YD6Vnw1Zes8qZzj1Vzq2xXKOSpCh7rLVAGQgkXot9Ck=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S+EaCJ4kZ8MjJkJkm812+G2E3W3aw0QbXrMkuc0wqhXmTZeEtj74U/xAelzdfGq5f
	 1Az5itXg3wOdTN1gJ2wOcefR6nDNTDXYKNTuRhvb22pvQT3PYn7gJNnRDeuOFmWWNI
	 rhpZt+yqzFckk5ioxJpvnszYA6VP+0dqP5khEzZNBIZVAlmBOY1p2NVkJInbTKGLnW
	 xMxetbFM6pMlRJuYAeikV45bl3OkL0UShJdg/G9KHtXIWetZolIKqurIQ5WAZfaPrm
	 TeQcqjBHVKTjb+nv4fY2pMVX6YDtrSKM7nXOJvytFuGkDWS3THw0Hwx+NSO0kjDcfK
	 22Ibntn0MxVbw==
From: SeongJae Park <sj@kernel.org>
To: "Huang, Ying" <ying.huang@linux.alibaba.com>
Cc: SeongJae Park <sj@kernel.org>,
	Bharata B Rao <bharata@amd.com>,
	Raghavendra K T <raghavendra.kt@amd.com>,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	lsf-pc@lists.linux-foundation.org,
	gourry@gourry.net,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	nphamcs@gmail.com,
	hannes@cmpxchg.org,
	feng.tang@intel.com,
	kbusch@meta.com,
	Hasan.Maruf@amd.com,
	david@redhat.com,
	willy@infradead.org,
	k.shutemov@gmail.com,
	mgorman@techsingularity.net,
	vbabka@suse.cz,
	hughd@google.com,
	rientjes@google.com,
	shy828301@gmail.com,
	liam.howlett@oracle.com,
	peterz@infradead.org,
	mingo@redhat.com,
	nadav.amit@gmail.com,
	shivankg@amd.com,
	ziy@nvidia.com,
	jhubbard@nvidia.com,
	AneeshKumar.KizhakeVeetil@arm.com,
	linux-kernel@vger.kernel.org,
	jon.grimm@amd.com,
	santosh.shukla@amd.com,
	Michael.Day@amd.com,
	riel@surriel.com,
	weixugc@google.com,
	leesuyeon0506@gmail.com,
	honggyu.kim@sk.com,
	leillc@google.com,
	kmanaouil.dev@gmail.com,
	rppt@kernel.org,
	dave.hansen@intel.com
Subject: Re: [LSF/MM/BPF TOPIC] Overhauling hot page detection and promotion based on PTE A bit scanning
Date: Fri,  7 Feb 2025 11:52:10 -0800
Message-Id: <20250207195210.43726-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <87ikpmgooo.fsf@DESKTOP-5N7EMDA>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, 07 Feb 2025 16:10:47 +0800 "Huang, Ying" <ying.huang@linux.alibaba.com> wrote:

> SeongJae Park <sj@kernel.org> writes:
> 
> > On Mon, 27 Jan 2025 10:41:07 +0530 Bharata B Rao <bharata@amd.com> wrote:
> >
> >> On 26-Jan-25 7:57 AM, Huang, Ying wrote:
> >> > Hi, Raghavendra,
> >> > 
> >> > Raghavendra K T <raghavendra.kt@amd.com> writes:
[...]
> >> > The drawbacks of asynchronous scanning including
> >> > 
> >> > - The CPU cycles used are not charged properly
> >> > 
> >> > - There may be no idle CPU cycles to use
> >> > 
> >> > - The scanning CPU may be not near the workload CPUs enough
> >> > 
> >> > It's better to involve Mel and Peter in the discussion for this.
> >> 
> >> They are CC'ed in this thread and hopefully have insights to share.
> >> 
> >> Charging CPU cycles to the right process has been brought up in other 
> >> similar contexts. Recent one is from page migration batching and using 
> >> multiple threads for migration - 
> >> https://lore.kernel.org/all/CAHbLzkpoKP0fVZP5b10wdzAMDLWysDy7oH0qaUssiUXj80R6bw@mail.gmail.com/
> >> 
> >> Does it make sense to treat hot page promotion from slow tiers 
> >> differently compared to locality based balancing? I mean couldn't the 
> >> charging of this async thread be similar to the cycles spent by other 
> >> system threads like kcompactd and khugepaged?
> >
> > I'm up to this idea.
> >
> > I agree the fairness is a thing that we need to aware of.  But IMHO, it is
> > something that the async approach can further be advanced for, not a strict
> > blocker for now.
> 
> Personally, I have no objection to async operations in general.
> However, we may need to find some way to control these async operations
> instead of adding more and more background kthreads blindly.  How to
> charge and constrain the resources used by these async operations is
> important too.  For example, some users may want to bind some async
> operations on some CPUs.
> 
> IMHO, we should think about the requirements and possible solutions
> instead of ignoring the issues.

I agree.  For DAMON, we implemented DAMOS quotas feature for such resource
control.  We also had a (non-public) discussion about splitting DAMON thread
for monitoring part and operation schemes execution parts for finer control.
I'm also thinking about making the quotas for monitoring part resource
consumption.  We didn't implement the ideas yet since the requirements on
real-world is unclear as of now, though.  We will keep collecting the
requirements and prioritize those or make another solution as the requirements
becomes clearer.

[...]
> >> > One drawback of physical address based scanning is that it's hard to
> >> > apply some workload specific policy.  For example, if a low priority
> >> > workload has many relatively hot pages, while a high priority workload
> >> > has many relative warm (not so hot) pages.  We need to promote the warm
> >> > pages in the high priority workload, while physcial address based
> >> > scanning may report the hot pages in the low priority workload.  Right?
> >> 
> >> Correct. I wonder if DAMON has already devised a scheme to address this. SJ?
> >
> > Yes, I think DAMOS quotas and DAMOS filters can be used to address this issue.
> >
> > For this case, assuming each workload has its own cgroup, users can add a DAMOS
> > scheme for promotion per workload.  The schemes will have different DAMOS
> > quotas based on the workloads' priority.  The schemes will also be controlled
> > to do the promotion for pages of the specific workloads using DAMOS filters.
> >
> > For example, below kdamond configuration can be used.
> >
> > # damo args damon \
> > 	--damos_action migrate_hot 0 --damos_quotas 100ms 1G 1s 0% 100% 100% \
> > 	--damos_filter reject none memcg /workloads/high-priority \
> > 	\
> > 	--damos_action migrate_hot 0 --damos_quotas 10ms 100M 1s 0% 100% 100% \
> > 	--damos_filter reject none memcg /workloads/low-priority \
> > 	--damos_nr_filters 1 1 --out kdamond.json
> > # damo report damon --input_file ./kdamond.json --damon_params_omit_defaults
> > kdamond 0
> >     context 0
> >         ops: paddr
> >         target 0
> >             region [4,294,967,296, 68,577,918,975) (59.868 GiB)
> >         intervals: sample 5 ms, aggr 100 ms, update 1 s
> >         nr_regions: [10, 1,000]
> >         scheme 0
> >             action: migrate_hot to node 0 per aggr interval
> >             target access pattern
> >                 sz: [0 B, max]
> >                 nr_accesses: [0 %, 18,446,744,073,709,551,616 %]
> >                 age: [0 ns, max]
> >             quotas
> >                 100 ms / 1024.000 MiB / 0 B per 1 s
> >                 priority: sz 0 %, nr_accesses 100 %, age 100 %
> >             filter 0
> >                 reject none memcg /workloads/high-priority
> >         scheme 1
> >             action: migrate_hot to node 0 per aggr interval
> >             target access pattern
> >                 sz: [0 B, max]
> >                 nr_accesses: [0 %, 18,446,744,073,709,551,616 %]
> >                 age: [0 ns, max]
> >             quotas
> >                 10 ms / 100.000 MiB / 0 B per 1 s
> >                 priority: sz 0 %, nr_accesses 100 %, age 100 %
> >             filter 0
> >                 reject none memcg /workloads/low-priority
> >
> > Please note that this is just one example based on existing DAMOS features.
> > This may have drawbacks and future optimizations would be possible.
> 
> IIUC, this is something like,
> 
> physical address -> struct page -> cgroup -> per-cgroup hot threshold

You're right.

> 
> this sounds good to me.  Thanks!

Happy to hear that, and looking forward to contiue improving it further with
you! :)


Thanks,
SJ

> 
> ---
> Best Regards,
> Huang, Ying
