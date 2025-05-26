Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C96E213BC3F
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:17:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748247443; cv=none; b=Xn7V+Vzg0FZhzCrMRQXTZzxIyvTAk3QPO/tCoZIVslCt2mZNPEY2YZOCyRIvhKiDZd7/Rnuxg/Mykx4I1VYvqos5Oa7UewhSK9C5iPCh8FUcmv6injdsJ1B8rj8+K6BOKkzLQ2Wo9C4/irBT8LQjsZM2wB1fetnpKuTJu2+nTdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748247443; c=relaxed/simple;
	bh=MIXfHY6sOeRkc2Mn1pmkJI+xlrF09B3eUiKuFzrBZ+A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RvVSTUegHvjEr5/+I5n0gG+98ERBeHjjZabCvGOspTPtvbVIWf7Q4cwVtA/EsypmJRo1xmo6aqWjtCHldQEYLoy4BHbhtL6nydsu5d2kzIO6xn7jREKGQlseSWUQqxWXzcpPNlBg3zOJDmeXhqbXbXP4lcvuH2jWsmOdpuyGrXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=ZzUiDgRV; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="ZzUiDgRV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748247429; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ZfYIQZDZ3jae9SXir7MKTbFoTwWvnvk/F4s97c9ME2I=;
	b=ZzUiDgRVFb37RqPrnRvHiCPQNayaWNb+cW4Pku3+DqutojjjizpjwdNb4n+5OIkc5emHPPWCNMr+VlMTzJkEybRgzVt1StTBTo8FD4jNfVCgNKGJiXBbZR0Eo2tzjnx3ULysa8QKyYy7n2FCDAyHeDE8iOfHkEpgB4HH8yyIf5k=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WbmONlS_1748247416 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 May 2025 16:17:07 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Bharata B Rao <bharata@amd.com>,  <gourry@gourry.net>
Cc: <linux-kernel@vger.kernel.org>,  <linux-mm@kvack.org>,
  <Jonathan.Cameron@huawei.com>,  <dave.hansen@intel.com>,
  <hannes@cmpxchg.org>,  <mgorman@techsingularity.net>,
  <mingo@redhat.com>,  <peterz@infradead.org>,  <raghavendra.kt@amd.com>,
  <riel@surriel.com>,  <rientjes@google.com>,  <sj@kernel.org>,
  <weixugc@google.com>,  <willy@infradead.org>,  <ziy@nvidia.com>,
  <dave@stgolabs.net>,  <nifan.cxl@gmail.com>,  <joshua.hahnjy@gmail.com>,
  <xuezhengchu@huawei.com>,  <yiannis@zptcorp.com>,
  <akpm@linux-foundation.org>,  <david@redhat.com>
Subject: Re: [RFC PATCH v0 1/2] migrate: implement
 migrate_misplaced_folio_batch
In-Reply-To: <20250521080238.209678-2-bharata@amd.com> (Bharata B. Rao's
	message of "Wed, 21 May 2025 13:32:37 +0530")
References: <20250521080238.209678-1-bharata@amd.com>
	<20250521080238.209678-2-bharata@amd.com>
Date: Mon, 26 May 2025 16:16:55 +0800
Message-ID: <871psbdbwo.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Bharata B Rao <bharata@amd.com> writes:

> From: Gregory Price <gourry@gourry.net>
>
> A common operation in tiering is to migrate multiple pages at once.
> The migrate_misplaced_folio function requires one call for each
> individual folio.  Expose a batch-variant of the same call for use
> when doing batch migrations.
>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Bharata B Rao <bharata@amd.com>
> ---
>  include/linux/migrate.h |  6 ++++++
>  mm/migrate.c            | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 37 insertions(+)
>
> diff --git a/include/linux/migrate.h b/include/linux/migrate.h
> index aaa2114498d6..c9496adcf192 100644
> --- a/include/linux/migrate.h
> +++ b/include/linux/migrate.h
> @@ -145,6 +145,7 @@ const struct movable_operations *page_movable_ops(struct page *page)
>  int migrate_misplaced_folio_prepare(struct folio *folio,
>  		struct vm_area_struct *vma, int node);
>  int migrate_misplaced_folio(struct folio *folio, int node);
> +int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
>  #else
>  static inline int migrate_misplaced_folio_prepare(struct folio *folio,
>  		struct vm_area_struct *vma, int node)
> @@ -155,6 +156,11 @@ static inline int migrate_misplaced_folio(struct folio *folio, int node)
>  {
>  	return -EAGAIN; /* can't migrate now */
>  }
> +static inline int migrate_misplaced_folio_batch(struct list_head *foliolist,
> +						int node)
> +{
> +	return -EAGAIN; /* can't migrate now */
> +}
>  #endif /* CONFIG_NUMA_BALANCING */
>  
>  #ifdef CONFIG_MIGRATION
> diff --git a/mm/migrate.c b/mm/migrate.c
> index 676d9cfc7059..32cc2eafb037 100644
> --- a/mm/migrate.c
> +++ b/mm/migrate.c
> @@ -2733,5 +2733,36 @@ int migrate_misplaced_folio(struct folio *folio, int node)
>  	BUG_ON(!list_empty(&migratepages));
>  	return nr_remaining ? -EAGAIN : 0;
>  }
> +
> +/*
> + * Batch variant of migrate_misplaced_folio. Attempts to migrate
> + * a folio list to the specified destination.
> + *
> + * Caller is expected to have isolated the folios by calling
> + * migrate_misplaced_folio_prepare(), which will result in an
> + * elevated reference count on the folio.
> + *
> + * This function will un-isolate the folios, dereference them, and
> + * remove them from the list before returning.
> + */
> +int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)
> +{
> +	pg_data_t *pgdat = NODE_DATA(node);
> +	unsigned int nr_succeeded;
> +	int nr_remaining;
> +
> +	nr_remaining = migrate_pages(folio_list, alloc_misplaced_dst_folio,
> +				     NULL, node, MIGRATE_ASYNC,
> +				     MR_NUMA_MISPLACED, &nr_succeeded);
> +	if (nr_remaining)
> +		putback_movable_pages(folio_list);
> +
> +	if (nr_succeeded) {
> +		count_vm_numa_events(NUMA_PAGE_MIGRATE, nr_succeeded);
> +		mod_node_page_state(pgdat, PGPROMOTE_SUCCESS, nr_succeeded);
> +	}
> +	BUG_ON(!list_empty(folio_list));
> +	return nr_remaining ? -EAGAIN : 0;
> +}
>  #endif /* CONFIG_NUMA_BALANCING */
>  #endif /* CONFIG_NUMA */

migrate_misplaced_folio_batch() looks quite similar as
migrate_misplaced_folio(), can we merge them?

---
Best Regards,
Huang, Ying
