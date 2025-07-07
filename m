Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 283482E3712
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 09:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751881006; cv=none; b=BqvxdEnAeRoufKbHHVYOZvWvInRfr8jHnZt4tcZkEWrLSMQFua6q+LUxA7gzDWrJCD7n70OUdj4sBtrDyqhhCMc20qtiSH7tyQCfrno59FbY57iZPhnZplu5cXTl2vknZTtO5uhK/zX/KuiI3MY7ARWLNx54MSbo2Redp0Nl0Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751881006; c=relaxed/simple;
	bh=DGeTEH85lKz/uXZLDgd0k3j6Cimz11NqJI0lDNPPBFI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tWbtrS8mKyl+1pjGud6m8wteTpAAGm5yVLbMq2LEPhSseA9jsDXxKso3jMcrxdVl03xBdyD0exOMizMLEIcOCt7W6RIfsE9hWYlBJrItWT7KOUuaUJfVfpBVy6Z/VWr1SfifD7A+ZT8czz2t/eH+QwXPTT7cIZ7UAGqmFW62tik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-e5-686b95243bed
Date: Mon, 7 Jul 2025 18:36:31 +0900
From: Byungchul Park <byungchul@sk.com>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Jonathan.Cameron@huawei.com, dave.hansen@intel.com,
	gourry@gourry.net, hannes@cmpxchg.org, mgorman@techsingularity.net,
	mingo@redhat.com, peterz@infradead.org, raghavendra.kt@amd.com,
	riel@surriel.com, rientjes@google.com, sj@kernel.org,
	weixugc@google.com, willy@infradead.org,
	ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
	nifan.cxl@gmail.com, xuezhengchu@huawei.com, yiannis@zptcorp.com,
	akpm@linux-foundation.org, david@redhat.com,
	kernel_team@skhynix.com
Subject: Re: [RFC PATCH v1 3/4] mm: kmigrated - Async kernel migration thread
Message-ID: <20250707093631.GA18924@system.software.com>
References: <20250616133931.206626-1-bharata@amd.com>
 <20250616133931.206626-4-bharata@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616133931.206626-4-bharata@amd.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFrrFIsWRmVeSWpSXmKPExsXC9ZZnka7q1OwMg8tBFnPWr2GzWDrxHbPF
	p5cPGC1W31zDaPF1/S9mi593j7NbrN7ka7Fq4TU2i8u75rBZ3Fvzn9Vix9J9TBaXDixgsvi7
	bS+jxfHeA0wWr6b8YLW4tmkrq0Xbko1MFoe/vmGyeH/tI7vF7x9Abd/fMlt8vdPHZLF6TYbF
	7KP32B0kPFov/WXzOPzmPbPHzll32T0WbCr16G67zO7RcuQtq8fmFVoei/e8ZPLYtKqTzWPT
	p0nsHidm/Gbx2PnQ0qO3+R2bx/t9V9k8ps6u99iz6ipjgHAUl01Kak5mWWqRvl0CV8b+uUcZ
	C25nVDw//ZulgXG1ZxcjJ4eEgInE+8932WDsFd+PgtksAioSE2/PYAex2QTUJW7c+MkMYosI
	KEuc2/qdsYuRi4NZYBmLxNW3y5hAEsICvhIX7+1jAbF5BSwkfl1bDVTEwSEkkCix9rkHRFhQ
	4uTMJ2AlzAJaEjf+vWQCKWEWkJZY/o8DJMwpYCbx9d97RhBbFGjVgW3HmSBOe8susfc41MmS
	EgdX3GCZwCgwC8nUWUimzkKYuoCReRWjUGZeWW5iZo6JXkZlXmaFXnJ+7iZGYIwvq/0TvYPx
	04XgQ4wCHIxKPLwG4VkZQqyJZcWVuYcYJTiYlUR429iyM4R4UxIrq1KL8uOLSnNSiw8xSnOw
	KInzGn0rTxESSE8sSc1OTS1ILYLJMnFwSjUwSsdaVK+ps7eJZhD7yTE7sHIhV/Bs2ftuu5Z3
	GBY3dN3aEXf21qrQTYrXl+8z7vWXajtU2MT+0y5i4YPtL0UlV0qypcz5efrWRc4ozZ+BAm7i
	lZERLcpSDRrW1kJWOkypRe/qj/De1ul97aLYn2czO3Xlso+5TLWtn+Wlq0L3XvgRWPb7V6cS
	S3FGoqEWc1FxIgBX47dW7QIAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA02Ra0hTYRzGe885OzvOBmdz0VG/TSMZZctLvVJEkNBbaAUhQgU59NCZm1M2
	XRqFgmVlWE20zAuszOsW1kJTyTU0MynCNpSJF1IkWzln4vCWmqeI/PbjeZ4f/w9/CpfaiRBK
	rctm9TqVVk6KCNGpQ4V7w8s1nPLe8whY3WIlYZ1pFofzni8AWoatAPpbVnC4PNYnhBZbImx+
	PETCnpp+AXR1VpNw3LohgO11dgw6HWYMrrV1AdhX4sDg97IlARyytQpg0dMXGOzxz2DQN/RT
	CFeXNrVFLw79o3cxaLFysKp3XHg0GN1wrpGoZ8aHo47KMSEy23LQnSKXEF1/6xWgl40KVPva
	gyFb820S2eZLheh9xSqBOibiUEnhLIl89kES1X6bw1B5Vf4Z2TnR4TRWqzay+n1HUkTcm5pe
	kDXC5U5/WCUKgOVEMQigGDqGaVzsJXkm6HDGNFIh5JmkdzNu9zLOs4wOYz61LoJiIKJwup5g
	Br31GF8E0YnM53E7wbOYhszKkGVzRFFSWsU8m0Z/YwnT/2jqzwSnFYx73YPxE5wOZRrWKT4O
	oA8w/nUf4HnH5ilHWx92H4grt9iVW+zK/7YZ4M1AptYZM1RqbWykQcPl6dS5kamZGTaw+dX6
	a79M7WDBdbwb0BSQbxcrk9M5qUBlNORldAOGwuUycRGp4aTiNFXeFVafeVGfo2UN3SCUIuQ7
	xSeT2RQpfUmVzWpYNovV/2sxKiCkAMTFl+dHBDdJpMeiHiRgvkBjtGsqfMKaJBk21ymfyKQf
	A7vaHU2nG3wXolMV9V/jypQmZ6nJN+NBZwMTnXKFs7+zML40qsWjlD28PBk09WpbTNTCZIOk
	XD4afcs9wHpq0wvnYlvDNq4O7LFXcAnvvHUDsw03nTDp/I+Dg7tccsLAqfYrcL1B9Rsw4+GW
	0QIAAA==
X-CFilter-Loop: Reflected

On Mon, Jun 16, 2025 at 07:09:30PM +0530, Bharata B Rao wrote:
> 
> kmigrated is a per-node kernel thread that migrates the
> folios marked for migration in batches. Each kmigrated
> thread walks the PFN range spanning its node and checks
> for potential migration candidates.
> 
> It depends on the fields added to extended page flags
> to determine the pages that need to be migrated and
> the target NID.
> 
> Signed-off-by: Bharata B Rao <bharata@amd.com>
> ---
>  include/linux/mmzone.h   |   5 +
>  include/linux/page_ext.h |  17 +++
>  mm/Makefile              |   3 +-
>  mm/kmigrated.c           | 223 +++++++++++++++++++++++++++++++++++++++
>  mm/mm_init.c             |   6 ++
>  mm/page_ext.c            |  11 ++
>  6 files changed, 264 insertions(+), 1 deletion(-)
>  create mode 100644 mm/kmigrated.c
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index 283913d42d7b..5d7f0b8d3c91 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -853,6 +853,8 @@ enum zone_type {
> 
>  };
> 
> +int kmigrated_add_pfn(unsigned long pfn, int nid);
> +
>  #ifndef __GENERATING_BOUNDS_H
> 
>  #define ASYNC_AND_SYNC 2
> @@ -1049,6 +1051,7 @@ enum pgdat_flags {
>                                          * many pages under writeback
>                                          */
>         PGDAT_RECLAIM_LOCKED,           /* prevents concurrent reclaim */
> +       PGDAT_KMIGRATED_ACTIVATE,       /* activates kmigrated */
>  };
> 
>  enum zone_flags {
> @@ -1493,6 +1496,8 @@ typedef struct pglist_data {
>  #ifdef CONFIG_MEMORY_FAILURE
>         struct memory_failure_stats mf_stats;
>  #endif
> +       struct task_struct *kmigrated;
> +       wait_queue_head_t kmigrated_wait;
>  } pg_data_t;
> 
>  #define node_present_pages(nid)        (NODE_DATA(nid)->node_present_pages)
> diff --git a/include/linux/page_ext.h b/include/linux/page_ext.h
> index 76c817162d2f..4300c9dbafec 100644
> --- a/include/linux/page_ext.h
> +++ b/include/linux/page_ext.h
> @@ -40,8 +40,25 @@ enum page_ext_flags {
>         PAGE_EXT_YOUNG,
>         PAGE_EXT_IDLE,
>  #endif
> +       /*
> +        * 32 bits following this are used by the migrator.
> +        * The next available bit position is 33.
> +        */
> +       PAGE_EXT_MIGRATE_READY,
>  };
> 
> +#define PAGE_EXT_MIG_NID_WIDTH 10
> +#define PAGE_EXT_MIG_FREQ_WIDTH        3
> +#define PAGE_EXT_MIG_TIME_WIDTH        18
> +
> +#define PAGE_EXT_MIG_NID_SHIFT (PAGE_EXT_MIGRATE_READY + 1)
> +#define PAGE_EXT_MIG_FREQ_SHIFT        (PAGE_EXT_MIG_NID_SHIFT + PAGE_EXT_MIG_NID_WIDTH)
> +#define PAGE_EXT_MIG_TIME_SHIFT        (PAGE_EXT_MIG_FREQ_SHIFT + PAGE_EXT_MIG_FREQ_WIDTH)
> +
> +#define PAGE_EXT_MIG_NID_MASK  ((1UL << PAGE_EXT_MIG_NID_SHIFT) - 1)
> +#define PAGE_EXT_MIG_FREQ_MASK ((1UL << PAGE_EXT_MIG_FREQ_SHIFT) - 1)
> +#define PAGE_EXT_MIG_TIME_MASK ((1UL << PAGE_EXT_MIG_TIME_SHIFT) - 1)
> +
>  /*
>   * Page Extension can be considered as an extended mem_map.
>   * A page_ext page is associated with every page descriptor. The
> diff --git a/mm/Makefile b/mm/Makefile
> index 1a7a11d4933d..5a382f19105f 100644
> --- a/mm/Makefile
> +++ b/mm/Makefile
> @@ -37,7 +37,8 @@ mmu-y                 := nommu.o
>  mmu-$(CONFIG_MMU)      := highmem.o memory.o mincore.o \
>                            mlock.o mmap.o mmu_gather.o mprotect.o mremap.o \
>                            msync.o page_vma_mapped.o pagewalk.o \
> -                          pgtable-generic.o rmap.o vmalloc.o vma.o vma_exec.o
> +                          pgtable-generic.o rmap.o vmalloc.o vma.o vma_exec.o \
> +                          kmigrated.o
> 
> 
>  ifdef CONFIG_CROSS_MEMORY_ATTACH
> diff --git a/mm/kmigrated.c b/mm/kmigrated.c
> new file mode 100644
> index 000000000000..3caefe4be0e7
> --- /dev/null
> +++ b/mm/kmigrated.c
> @@ -0,0 +1,223 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * kmigrated is a kernel thread that runs for each node that has
> + * memory. It iterates over the node's PFNs and  migrates pages
> + * marked for migration into their targeted nodes.
> + *
> + * kmigrated depends on PAGE_EXTENSION to find out the pages that
> + * need to be migrated. In addition to a few fields that could be
> + * used by hot page promotion logic to store and evaluate the page
> + * hotness information, the extended page flags is field is extended
> + * to store the target NID for migration.
> + */
> +#include <linux/mm.h>
> +#include <linux/migrate.h>
> +#include <linux/cpuhotplug.h>
> +#include <linux/page_ext.h>
> +
> +#define KMIGRATE_DELAY MSEC_PER_SEC
> +#define KMIGRATE_BATCH 512
> +
> +static int page_ext_xchg_nid(struct page_ext *page_ext, int nid)
> +{
> +       unsigned long old_flags, flags;
> +       int old_nid;
> +
> +       old_flags = READ_ONCE(page_ext->flags);
> +       do {
> +               flags = old_flags;
> +               old_nid = (flags >> PAGE_EXT_MIG_NID_SHIFT) & PAGE_EXT_MIG_NID_MASK;
> +
> +               flags &= ~(PAGE_EXT_MIG_NID_MASK << PAGE_EXT_MIG_NID_SHIFT);
> +               flags |= (nid & PAGE_EXT_MIG_NID_MASK) << PAGE_EXT_MIG_NID_SHIFT;
> +       } while (unlikely(!try_cmpxchg(&page_ext->flags, &old_flags, flags)));
> +
> +       return old_nid;
> +}
> +
> +/*
> + * Marks the page as ready for migration.
> + *
> + * @pfn: PFN of the page
> + * @nid: Target NID to were the page needs to be migrated
> + *
> + * The request for migration is noted by setting PAGE_EXT_MIGRATE_READY
> + * in the extended page flags which the kmigrated thread would check.
> + */
> +int kmigrated_add_pfn(unsigned long pfn, int nid)
> +{
> +       struct page *page;
> +       struct page_ext *page_ext;
> +
> +       page = pfn_to_page(pfn);
> +       if (!page)
> +               return -EINVAL;
> +
> +       page_ext = page_ext_get(page);
> +       if (unlikely(!page_ext))
> +               return -EINVAL;
> +
> +       page_ext_xchg_nid(page_ext, nid);
> +       test_and_set_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags);
> +       page_ext_put(page_ext);
> +
> +       set_bit(PGDAT_KMIGRATED_ACTIVATE, &page_pgdat(page)->flags);
> +       return 0;
> +}
> +
> +/*
> + * If the page has been marked ready for migration, return
> + * the NID to which it needs to be migrated to.
> + *
> + * If not return NUMA_NO_NODE.
> + */
> +static int kmigrated_get_nid(struct page *page)
> +{
> +       struct page_ext *page_ext;
> +       int nid = NUMA_NO_NODE;
> +
> +       page_ext = page_ext_get(page);
> +       if (unlikely(!page_ext))
> +               return nid;
> +
> +       if (!test_and_clear_bit(PAGE_EXT_MIGRATE_READY, &page_ext->flags))
> +               goto out;
> +
> +       nid = page_ext_xchg_nid(page_ext, nid);
> +out:
> +       page_ext_put(page_ext);
> +       return nid;
> +}
> +
> +/*
> + * Walks the PFNs of the zone, isolates and migrates them in batches.
> + */
> +static void kmigrated_walk_zone(unsigned long start_pfn, unsigned long end_pfn,
> +                               int src_nid)
> +{
> +       int nid, cur_nid = NUMA_NO_NODE;
> +       LIST_HEAD(migrate_list);
> +       int batch_count = 0;
> +       struct folio *folio;
> +       struct page *page;
> +       unsigned long pfn;
> +
> +       for (pfn = start_pfn; pfn < end_pfn; pfn++) {

Hi,

Is it feasible to scan all the pages in each zone?  I think we should
figure out a better way so as to reduce CPU time for this purpose.

Besides the opinion above, I was thinking to design and implement a
kthread for memory placement between different tiers - I already named
it e.g. kmplaced, rather than relying on kswapd and hinting fault, lol ;)

Now that you've started, I'd like to think about it together and improve
it so that it works better.  Please cc me from the next spin.

	Byungchul

> +               if (!pfn_valid(pfn))
> +                       continue;
> +
> +               page = pfn_to_online_page(pfn);
> +               if (!page)
> +                       continue;
> +
> +               if (page_to_nid(page) != src_nid)
> +                       continue;
> +
> +               /*
> +                * TODO: Take care of folio_nr_pages() increment
> +                * to pfn count.
> +                */
> +               folio = page_folio(page);
> +               if (!folio_test_lru(folio))
> +                       continue;
> +
> +               nid = kmigrated_get_nid(page);
> +               if (nid == NUMA_NO_NODE)
> +                       continue;
> +
> +               if (page_to_nid(page) == nid)
> +                       continue;
> +
> +               if (migrate_misplaced_folio_prepare(folio, NULL, nid))
> +                       continue;
> +
> +               if (cur_nid != NUMA_NO_NODE)
> +                       cur_nid = nid;
> +
> +               if (++batch_count >= KMIGRATE_BATCH || cur_nid != nid) {
> +                       migrate_misplaced_folios_batch(&migrate_list, cur_nid);
> +                       cur_nid = nid;
> +                       batch_count = 0;
> +                       cond_resched();
> +               }
> +               list_add(&folio->lru, &migrate_list);
> +       }
> +       if (!list_empty(&migrate_list))
> +               migrate_misplaced_folios_batch(&migrate_list, cur_nid);
> +}
> +
> +static void kmigrated_do_work(pg_data_t *pgdat)
> +{
> +       struct zone *zone;
> +       int zone_idx;
> +
> +       clear_bit(PGDAT_KMIGRATED_ACTIVATE, &pgdat->flags);
> +       for (zone_idx = 0; zone_idx < MAX_NR_ZONES; zone_idx++) {
> +               zone = &pgdat->node_zones[zone_idx];
> +
> +               if (!populated_zone(zone))
> +                       continue;
> +
> +               if (zone_is_zone_device(zone))
> +                       continue;
> +
> +               kmigrated_walk_zone(zone->zone_start_pfn, zone_end_pfn(zone),
> +                                   pgdat->node_id);
> +       }
> +}
> +
> +static inline bool kmigrated_work_requested(pg_data_t *pgdat)
> +{
> +       return test_bit(PGDAT_KMIGRATED_ACTIVATE, &pgdat->flags);
> +}
> +
> +static void kmigrated_wait_work(pg_data_t *pgdat)
> +{
> +       long timeout = msecs_to_jiffies(KMIGRATE_DELAY);
> +
> +       wait_event_timeout(pgdat->kmigrated_wait,
> +                          kmigrated_work_requested(pgdat), timeout);
> +}
> +
> +/*
> + * Per-node kthread that iterates over its PFNs and migrates the
> + * pages that have been marked for migration.
> + */
> +static int kmigrated(void *p)
> +{
> +       pg_data_t *pgdat = (pg_data_t *)p;
> +
> +       while (!kthread_should_stop()) {
> +               kmigrated_wait_work(pgdat);
> +               kmigrated_do_work(pgdat);
> +       }
> +       return 0;
> +}
> +
> +static void kmigrated_run(int nid)
> +{
> +       pg_data_t *pgdat = NODE_DATA(nid);
> +
> +       if (pgdat->kmigrated)
> +               return;
> +
> +       pgdat->kmigrated = kthread_create(kmigrated, pgdat, "kmigrated%d", nid);
> +       if (IS_ERR(pgdat->kmigrated)) {
> +               pr_err("Failed to start kmigrated for node %d\n", nid);
> +               pgdat->kmigrated = NULL;
> +       } else {
> +               wake_up_process(pgdat->kmigrated);
> +       }
> +}
> +
> +static int __init kmigrated_init(void)
> +{
> +       int nid;
> +
> +       for_each_node_state(nid, N_MEMORY)
> +               kmigrated_run(nid);
> +
> +       return 0;
> +}
> +
> +subsys_initcall(kmigrated_init)
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index f2944748f526..3a9cfd175366 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1398,6 +1398,11 @@ static void pgdat_init_kcompactd(struct pglist_data *pgdat)
>  static void pgdat_init_kcompactd(struct pglist_data *pgdat) {}
>  #endif
> 
> +static void pgdat_init_kmigrated(struct pglist_data *pgdat)
> +{
> +       init_waitqueue_head(&pgdat->kmigrated_wait);
> +}
> +
>  static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
>  {
>         int i;
> @@ -1407,6 +1412,7 @@ static void __meminit pgdat_init_internals(struct pglist_data *pgdat)
> 
>         pgdat_init_split_queue(pgdat);
>         pgdat_init_kcompactd(pgdat);
> +       pgdat_init_kmigrated(pgdat);
> 
>         init_waitqueue_head(&pgdat->kswapd_wait);
>         init_waitqueue_head(&pgdat->pfmemalloc_wait);
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index c351fdfe9e9a..546725fffddb 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -76,6 +76,16 @@ static struct page_ext_operations page_idle_ops __initdata = {
>  };
>  #endif
> 
> +static bool need_page_mig(void)
> +{
> +       return true;
> +}
> +
> +static struct page_ext_operations page_mig_ops __initdata = {
> +       .need = need_page_mig,
> +       .need_shared_flags = true,
> +};
> +
>  static struct page_ext_operations *page_ext_ops[] __initdata = {
>  #ifdef CONFIG_PAGE_OWNER
>         &page_owner_ops,
> @@ -89,6 +99,7 @@ static struct page_ext_operations *page_ext_ops[] __initdata = {
>  #ifdef CONFIG_PAGE_TABLE_CHECK
>         &page_table_check_ops,
>  #endif
> +       &page_mig_ops,
>  };
> 
>  unsigned long page_ext_size;
> --
> 2.34.1
> 
