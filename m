Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9D79291C3F;
	Fri, 13 Jun 2025 09:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749808540; cv=none; b=u2dH6kMltQgJhzy87247ZmOHtrSYNRovp3XoULSoOOe0wYzONaiXlCy6ttvuVFVoiAXJxwXS017ZBDYp+vpQk4GASxHfsyRoDZfXY9yE//EWByrPeskcXdSgmaaYw+bVE/s5INPx4H7J+a+Q/emYiodYrApC2tyviEiOq4H6gwM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749808540; c=relaxed/simple;
	bh=q5gk6sV246NIfmcZtoNnX05im1nF33xmkiCPYWeZivk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ITHIeW59bUn/db3qzWdC15y0us2zFrYkkXJUViB/NTVyYDLvFxi8+JX6zVHMtVgUfEv6tPCFvpdEELW67B1tT+33To+8U4SxZygyGOIaQc6sTCGM7PxvdSGumDHJokPGN6KtBqUv91M4fAZ1yygltI8KH/QZwLgh33cuurOr0Kc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-669ff7000002311f-b3-684bf593d06c
From: Rakie Kim <rakie.kim@sk.com>
To: Bijan Tabatabai <bijan311@gmail.com>
Cc: sj@kernel.org,
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
	vtavarespetr@micron.com,
	damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel_team@skhynix.com
Subject: Re: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data across nodes
Date: Fri, 13 Jun 2025 18:55:17 +0900
Message-ID: <20250613095525.1845-1-rakie.kim@sk.com>
X-Mailer: git-send-email 2.48.1.windows.1
In-Reply-To: <20250612181330.31236-1-bijan311@gmail.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKIsWRmVeSWpSXmKPExsXC9ZZnoe7kr94ZBsc2mVus2NvKbjFn/Ro2
	i103Qiwafnxms1hw7zyjxZMD7YwWCy9uYbT4uv4Xs8WMD5fYLX7ePc5ucXzrPHaLhW1LWCwu
	75rDZnFvzX9Wi2990haHv75hstjZfIfJ4vi9SewWq9dkWMw+eo/dQcRj56y77B7dbZfZPRbv
	ecnksWlVJ5vHpk+T2D1OzPjN4rHzoaXH9I7nQMm+yawe39d3sHn0Nr9j83i/7yqbx+dNcgG8
	UVw2Kak5mWWpRfp2CVwZt9+/Zypo1ayY9WcHawPjW4UuRk4OCQETicvXelhg7Av3DgLZHBxs
	AkoSx/bGgIRFBDQkdny/w97FyMXBLDCdRWLZvVPsIAlhgXCJxmm/wWwWAVWJ6xt+MYHYvEBz
	VhzuYYOYqSnRcOkeWJxTwEJiXf9OsLiQAI/Eqw37GSHqBSVOznwCdgOzgLxE89bZzCDLJAQO
	sUus3n2GFWKQpMTBFTdYJjDyz0LSMwtJzwJGplWMQpl5ZbmJmTkmehmVeZkVesn5uZsYgZG3
	rPZP9A7GTxeCDzEKcDAq8fBa7PLKEGJNLCuuzD3EKMHBrCTCy3gFKMSbklhZlVqUH19UmpNa
	fIhRmoNFSZzX6Ft5ipBAemJJanZqakFqEUyWiYNTqoFx4rG890wvk89d69w7lYfptVGj8e+i
	y9tXtjTb91qqnKr5b3TQOOP4i+31/W7iqWufT/U5svBX/ooAT/b+fYZX9Ble9H/gSH3G9u96
	VdOZh7GCSi8uVXxrnC8RWC0zT2HZ9vbzomVn9/i+F4vblmm85Nvts24VhsdsBb4rXH7ld+6w
	8aKlJzZHK7EUZyQaajEXFScCABdFEka4AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprFIsWRmVeSWpSXmKPExsXCNUNNS3fyV+8MgwXv1CxW7G1lt5izfg2b
	xa4bIRYNPz6zWSy4d57R4tyU2WwWTw60M1osvLiF0eLr+l/MFjM+XGK3+Hn3OLvF8a3z2C0O
	zz3JarGwbQmLxeVdc9gs7q35z2rxrU/a4tC156wWh7++YbLY2XyHyeL4vUnsFqvXZFjMPnqP
	3UHcY+esu+we3W2X2T0W73nJ5LFpVSebx6ZPk9g9Tsz4zeKx86Glx/SO50DJvsmsHt/Xd7B5
	9Da/Y/N4v+8qm8e32x4ei198YPL4vEkugD+KyyYlNSezLLVI3y6BK+P2+/dMBa2aFbP+7GBt
	YHyr0MXIySEhYCJx4d5Bli5GDg42ASWJY3tjQMIiAhoSO77fYe9i5OJgFpjOIrHs3il2kISw
	QLhE47TfYDaLgKrE9Q2/mEBsXqA5Kw73sEHM1JRouHQPLM4pYCGxrn8nWFxIgEfi1Yb9jBD1
	ghInZz5hAbGZBeQlmrfOZp7AyDMLSWoWktQCRqZVjCKZeWW5iZk5pnrF2RmVeZkVesn5uZsY
	gTG2rPbPxB2MXy67H2IU4GBU4uG12OWVIcSaWFZcmXuIUYKDWUmEl/EKUIg3JbGyKrUoP76o
	NCe1+BCjNAeLkjivV3hqgpBAemJJanZqakFqEUyWiYNTqoGx/9vVaYZet1Z/dewrOPWyOObw
	4z3B7PpuO6xOZSnvSN9260Sb+YNZW71esd+ri5yy8LjvnuzuV5//9Tzs4ZZmalD6cFvhu8ax
	oLWhvy4znDSy7MmX/dIbuaCDO9t1muBEpTflAYwFTOwPlfsUixfrb8nsynz0U2ajcNTtpLk5
	VUU/6o0umz5WYinOSDTUYi4qTgQATQbrLq0CAAA=
X-CFilter-Loop: Reflected

On Thu, 12 Jun 2025 13:13:26 -0500 Bijan Tabatabai <bijan311@gmail.com> wrote:
> From: Bijan Tabatabai <bijantabatab@micron.com>
> 
> A recent patch set automatically set the interleave weight for each node
> according to the node's maximum bandwidth [1]. In another thread, the patch
> set's author, Joshua Hahn, wondered if/how these weights should be changed
> if the bandwidth utilization of the system changes [2].
> 
> This patch set adds the mechanism for dynamically changing how application
> data is interleaved across nodes while leaving the policy of what the
> interleave weights should be to userspace. It does this by adding a new
> DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with both
> paddr and vaddr operations sets. Using the paddr version is useful for
> managing page placement globally. Using the vaddr version limits tracking
> to one process per kdamond instance, but the va based tracking better
> captures spacial locality.

Hi Bijan,

Thank you for explaining the motivation and need behind this patch.
I believe it's important to consider the case where a new memory node
is added and the interleave weight values are recalculated.

If a new memory node (say, node2) is added, there are two possible
approaches to consider.

1. Migrating pages to the newly added node2.
   In this case, there is a potential issue where pages may be migrated
   to node2, even though it is not part of the nodemask set by the user.

2. Ignoring the newly added node2 and continuing to use only the existing
   nodemask for migrations.
   However, if the weight values have been updated considering node2
   performance, avoiding node2 might reduce the effectiveness of using
   Weighted Interleave.

It would be helpful to consider these two options or explore other
possible solutions to ensure correctness.

Rakie

> 
> DAMOS_INTERLEAVE interleaves pages within a region across nodes using the
> interleave weights at /sys/kernel/mm/mempolicy/weighted_interleave/node<N>
> and the page placement algorithm in weighted_interleave_nid via
> policy_nodemask. We chose to reuse the mempolicy weighted interleave
> infrastructure to avoid reimplementing code. However, this has the awkward
> side effect that only pages that are mapped to processes using
> MPOL_WEIGHTED_INTERLEAVE will be migrated according to new interleave
> weights. This might be fine because workloads that want their data to be
> dynamically interleaved will want their newly allocated data to be
> interleaved at the same ratio.
> 
> If exposing policy_nodemask is undesirable, we have two alternative methods
> for having DAMON access the interleave weights it should use. We would
> appreciate feedback on which method is preferred.
> 1. Use mpol_misplaced instead
>   pros: mpol_misplaced is already exposed publically
>   cons: Would require refactoring mpol_misplaced to take a struct vm_area
>   instead of a struct vm_fault, and require refactoring mpol_misplaced and
>   get_vma_policy to take in a struct task_struct rather than just using
>   current. Also requires processes to use MPOL_WEIGHTED_INTERLEAVE.
> 2. Add a new field to struct damos, similar to target_nid for the
> MIGRATE_HOT/COLD schemes.
>   pros: Keeps changes contained inside DAMON. Would not require processes
>   to use MPOL_WEIGHTED_INTERLEAVE.
>   cons: Duplicates page placement code. Requires discussion on the sysfs
>   interface to use for users to pass in the interleave weights.
> 
> This patchset was tested on an AMD machine with a NUMA node with CPUs
> attached to DDR memory and a cpu-less NUMA node attached to CXL memory.
> However, this patch set should generalize to other architectures and number
> of NUMA nodes.
> 
> Patches Sequence
> ________________
> The first patch exposes policy_nodemask() in include/linux/mempolicy.h to
> let DAMON determine where a page should be placed for interleaving.
> The second patch implements DAMOS_INTERLEAVE as a paddr action.
> The third patch moves the DAMON page migration code to ops-common, allowing
> vaddr actions to use it.
> Finally, the fourth patch implements a vaddr version of DAMOS_INTERLEAVE.
> 
> [1] https://lore.kernel.org/linux-mm/20250520141236.2987309-1-joshua.hahnjy@gmail.com/
> [2] https://lore.kernel.org/linux-mm/20250313155705.1943522-1-joshua.hahnjy@gmail.com/
> 
> Bijan Tabatabai (4):
>   mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
>   mm/damon/paddr: Add DAMOS_INTERLEAVE action
>   mm/damon: Move damon_pa_migrate_pages to ops-common
>   mm/damon/vaddr: Add vaddr version of DAMOS_INTERLEAVE
> 
>  Documentation/mm/damon/design.rst |   2 +
>  include/linux/damon.h             |   2 +
>  include/linux/mempolicy.h         |   2 +
>  mm/damon/ops-common.c             | 136 ++++++++++++++++++++
>  mm/damon/ops-common.h             |   4 +
>  mm/damon/paddr.c                  | 198 +++++++++++++-----------------
>  mm/damon/sysfs-schemes.c          |   1 +
>  mm/damon/vaddr.c                  | 124 +++++++++++++++++++
>  mm/mempolicy.c                    |   4 +-
>  9 files changed, 360 insertions(+), 113 deletions(-)
> 
> -- 
> 2.43.5
> 
> 
