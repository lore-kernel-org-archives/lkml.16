Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AB8D153BD9;
	Thu, 12 Jun 2025 23:49:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749772185; cv=none; b=Xq4drNTGQk++GwZKQOV0+hqoGlRxEsLJk0zGja0wBKu8LBQ/yM7kMs7eg4u3pQcepORRjOCwmZjt7rn4TdLCoqycjWhYwDjVQzwnmfjwpa+mBMHvXVrUxJxqxGqmvyn5/baplAlZBKQ7RAoS6Kq84lxlZSvQd2uRZEDugx0Qj2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749772185; c=relaxed/simple;
	bh=uIMcM27gohI3J+ynYmO2SMZAip0Yq+Kvvb6h6OZBqks=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DSQl3gHjbDOtPcmDGSb8Olaaa+3Cim9jMzwihk7rgXzMf9nlK4vnZv96920UqWfEBBAV6VUcstLDAg/dWz7zmNphcn/RfyfamSAs3KQ8zWb0LX4sjyStBhuQEo71h43n5BDo5qfbNA4pp00NayBtrspoh6FpSiCyfPgbwLMT5aI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8xmdhrA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8xmdhrA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF41BC4CEEA;
	Thu, 12 Jun 2025 23:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749772185;
	bh=uIMcM27gohI3J+ynYmO2SMZAip0Yq+Kvvb6h6OZBqks=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=r8xmdhrA040Vz6UGOGQEzJoFD62AxIdQFlGIueEU65Rq3IlpTix/urLrKEIC3rd6H
	 ulXKmLGCbFl3emHATKiXfxEgymtsyY0x+gGjpdKe0v2P49j/FbBx7HPOhLolLPQkte
	 O91NVwGVcpwY/AgQwtT9O1LKwoTpsxEvBOOxc6QDOTCUh2C4YdBNVUl9Ot3q779fVj
	 S/xDFfgoKmBQ0N8u334+BjPzPYaePQav/YbyunFOrFF3PkIHPLtsR/f9qRpG10K7Zk
	 EkguMsG7nsvk/0httMySIGcTQHwU65F2p/Ml5+X21kA41o9Ai9HhfSEdkZyRBf6hAg
	 Bx1MCZgKt/Teg==
From: SeongJae Park <sj@kernel.org>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data across nodes
Date: Thu, 12 Jun 2025 16:49:42 -0700
Message-Id: <20250612234942.3612-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250612181330.31236-1-bijan311@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Bijan,

On Thu, 12 Jun 2025 13:13:26 -0500 Bijan Tabatabai <bijan311@gmail.com> wrote:

> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> A recent patch set automatically set the interleave weight for each node
> according to the node's maximum bandwidth [1]. In another thread, the patch
> set's author, Joshua Hahn, wondered if/how these weights should be changed
> if the bandwidth utilization of the system changes [2].

Thank you for sharing the background.  I do agree it is an important question.

> 
> This patch set adds the mechanism for dynamically changing how application
> data is interleaved across nodes while leaving the policy of what the
> interleave weights should be to userspace. It does this by adding a new
> DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with both
> paddr and vaddr operations sets. Using the paddr version is useful for
> managing page placement globally. Using the vaddr version limits tracking
> to one process per kdamond instance, but the va based tracking better
> captures spacial locality.
> 
> DAMOS_INTERLEAVE interleaves pages within a region across nodes using the
> interleave weights at /sys/kernel/mm/mempolicy/weighted_interleave/node<N>
> and the page placement algorithm in weighted_interleave_nid via
> policy_nodemask.

So, what DAMOS_INTERLEAVE will do is, migrating pages of a given DAMON region
into multiple nodes, following interleaving weights, right?  We already have
DAMOS actions for migrating pages of a given DAMON region, namely
DAMOS_MIGRATE_{HOT,COLD}.  The actions support only single migration target
node, though.  To my perspective, hence, DAMOS_INTERLEAVE looks like an
extended version of DAMOS_MIGRATE_{HOT,COLD} for flexible target node
selections.  In a way, DAMOS_INTERLEAVE is rather a restricted version of
DAMOS_MIGRATE_{HOT,COLD}, since it prioritizes only hotter regions, if I read
the second patch correctly.

What about extending DAMOS_MIGRATE_{HOT,COLD} to support your use case?  For
example, letting users enter special keyword, say, 'weighted_interleave' to
'target_nid' DAMON sysfs file.  In the case, DAMOS_MIGRATE_{HOT,COLD} would
work in the way you are implementing DAMOS_INTERLEAVE.

> We chose to reuse the mempolicy weighted interleave
> infrastructure to avoid reimplementing code. However, this has the awkward
> side effect that only pages that are mapped to processes using
> MPOL_WEIGHTED_INTERLEAVE will be migrated according to new interleave
> weights. This might be fine because workloads that want their data to be
> dynamically interleaved will want their newly allocated data to be
> interleaved at the same ratio.

Makes sense to me.  I'm not very familiar with interleaving and memory policy,
though.

> 
> If exposing policy_nodemask is undesirable,

I see you are exposing it on include/linux/mempolicy.h on the first patch of
this series, and I agree it is not desirable to unnecessarily expose functions.
But you could reduce the exposure by exporting it on mm/internal.h instead.
mempolicy maitnainers and reviewers who you kindly Cc-ed to this mail could
give us good opinions.

> we have two alternative methods
> for having DAMON access the interleave weights it should use. We would
> appreciate feedback on which method is preferred.
> 1. Use mpol_misplaced instead
>   pros: mpol_misplaced is already exposed publically
>   cons: Would require refactoring mpol_misplaced to take a struct vm_area
>   instead of a struct vm_fault, and require refactoring mpol_misplaced and
>   get_vma_policy to take in a struct task_struct rather than just using
>   current. Also requires processes to use MPOL_WEIGHTED_INTERLEAVE.

I feel cons is larger than pros.  mpolicy people's opinion would matter more,
though.

> 2. Add a new field to struct damos, similar to target_nid for the
> MIGRATE_HOT/COLD schemes.
>   pros: Keeps changes contained inside DAMON. Would not require processes
>   to use MPOL_WEIGHTED_INTERLEAVE.
>   cons: Duplicates page placement code. Requires discussion on the sysfs
>   interface to use for users to pass in the interleave weights.

I agree this is also somewhat doable.  In future, we might want to implement
this anyway, for non-global and flexible memory interleaving.  But if memory
policy people are ok with reusing policy_nodemask(), I don't think we need to
do this now.

> 
> This patchset was tested on an AMD machine with a NUMA node with CPUs
> attached to DDR memory and a cpu-less NUMA node attached to CXL memory.
> However, this patch set should generalize to other architectures and number
> of NUMA nodes.

I show the test results on the commit messages of the second and the fourth
patches.  In the next version, letting readers know that here would be nice.
Also adding a short description of what you confirmed with the tests here
(e.g., with the test we confirmed this patch functions as expected [and
achieves X % Y metric wins]) would be nice.

> 
> Patches Sequence
> ________________
> The first patch exposes policy_nodemask() in include/linux/mempolicy.h to
> let DAMON determine where a page should be placed for interleaving.
> The second patch implements DAMOS_INTERLEAVE as a paddr action.
> The third patch moves the DAMON page migration code to ops-common, allowing
> vaddr actions to use it.
> Finally, the fourth patch implements a vaddr version of DAMOS_INTERLEAVE.

I'll try to take look on code and add comments if something stands out, but
let's focus on the high level discussion first, especially whether to implement
this as a new DAMOS action, or extend DAMOS_MIGRATE_{HOT,COLD} actions.

I think it would also be nice if you could add more explanation about why you
picked DAMON as a way to implement this feature.  I assume that's because you
found opportunities to utilize this feature in some access-aware way or
utilizing DAMOS features.  I was actually able to imagine some such usages.
For example, we could do the re-interleaving for hot or cold pages of specific
NUMA nodes or specific virtual address ranges first to make interleaving
effective faster.

Also we could apply a sort of speed limit for the interleaving-migration to
ensure it doesn't consume memory bandwidth too much.  The limit could be
arbitrarily user-defined or auto-tuned for specific system metrics value (e.g.,
memory bandwidth balance?).

If you have such use case in your mind or your test setups, sharing those here
or on the next versions of this would be very helpful for reviewers.

> 
> [1] https://lore.kernel.org/linux-mm/20250520141236.2987309-1-joshua.hahnjy@gmail.com/
> [2] https://lore.kernel.org/linux-mm/20250313155705.1943522-1-joshua.hahnjy@gmail.com/


Thanks,
SJ

[...]
