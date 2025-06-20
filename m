Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32F0030E844
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750401609; cv=none; b=drvi92Eu4qEd0nwx0dsBNCi+xg1SUwumtNA/y2+h/NkUj2SKM5KgeERmVd8sFdrTmc25yFrAryyHHVgQmXqcmdKipsh+/3oAJT9/MXS+4XQClzttZpTRSitNZSjz+2YZGoXDiFWbGHwoM/Vfz3rp1SIN72ces5gjHohY81l4ilQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750401609; c=relaxed/simple;
	bh=Mq037F326ieWiDZCBRJz1eB0PJSlgJFHj3qv0K+eU9I=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bzQ5F5Xgr2M8lwcb9ncFckFqZt1wVGkXSaYvWcGjhAiHeBIKZipCJ6rbn452iZfetpGnSA3DQ0OEAuSRgrfPcTMTCmjlrDKKHm41n2a1d2Xah3Ih5r5wvj1qp5br9mRTM6h0H4mp/Ws363eLH840raBCCrsNJYMHVRbZkHy60Uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=IGhrS2V4; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="IGhrS2V4"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750401598; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=gTbWGErp3uEQSrgLXr90+6lbvGnyC2JPi/dFkNyH/eM=;
	b=IGhrS2V4c6XcQOv8ddCPbOEgx+++wt9JEvWDT/qfYqXhCwLGrIGE50JosVR+4SVTCL8XAlUaOYOtjwD7tqc1ldqJ9dWKO1XvFaXIk6KQm98aHAcz+t+7g6znSBnBchfIZyfE1v698z9wP7du+wrk9AFeHr+BzDhO2f8d+RzgZ0E=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WeJuhrl_1750401595 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 20 Jun 2025 14:39:56 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Bharata B Rao <bharata@amd.com>
Cc: <linux-kernel@vger.kernel.org>,  <linux-mm@kvack.org>,
  <Jonathan.Cameron@huawei.com>,  <dave.hansen@intel.com>,
  <gourry@gourry.net>,  <hannes@cmpxchg.org>,
  <mgorman@techsingularity.net>,  <mingo@redhat.com>,
  <peterz@infradead.org>,  <raghavendra.kt@amd.com>,  <riel@surriel.com>,
  <rientjes@google.com>,  <sj@kernel.org>,  <weixugc@google.com>,
  <willy@infradead.org>,  <ziy@nvidia.com>,  <dave@stgolabs.net>,
  <nifan.cxl@gmail.com>,  <xuezhengchu@huawei.com>,  <yiannis@zptcorp.com>,
  <akpm@linux-foundation.org>,  <david@redhat.com>
Subject: Re: [RFC PATCH v1 0/4] Kernel thread based async batch migration
In-Reply-To: <20250616133931.206626-1-bharata@amd.com> (Bharata B. Rao's
	message of "Mon, 16 Jun 2025 19:09:27 +0530")
References: <20250616133931.206626-1-bharata@amd.com>
Date: Fri, 20 Jun 2025 14:39:54 +0800
Message-ID: <87bjqi3ohx.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Bharata B Rao <bharata@amd.com> writes:

> Hi,
>
> This is a continuation of the earlier post[1] that attempted to
> convert migrations from NUMA Balancing to be async and batched.
> In this version, per-node kernel threads are created to handle
> migrations in an async manner.
>
> This adds a few fields to the extended page flags that can be
> used both by the sub-systems that request migrations and kmigrated
> which migrates the pages. Some of the fields are potentially defined
> to be used by kpromoted-like subsystem to manage hot page metrics,
> but are unused right now.
>
> Currently only NUMA Balancing is changed to make use of the async
> batched migration. It does so by recording the target NID and the
> readiness of the page to be migrated in the extended page flags
> fields.
>
> Each kmigrated routinely scans its PFNs, identifies the pages
> marked for migration and batch-migrates them. Unlike the previous
> approach, the responsibility of isolating the pages is now with
> kmigrated.
>
> The major difference between this approach and the way kpromoted[2]
> tracked hot pages is the elimination of heavy synchronization points
> between producers(sub-systems that request migrations or report
> a hot page) and the consumer (kmigrated or kpromoted).
> Instead of tracking only the list of hot pages in an orthogonal
> manner, this approach ties the hot page or migration infomation
> to the struct page.

I don't think page flag + scanning is a good idea.  If the
synchronization is really a problem for you (based on test results),
some per-CPU data structure can be used to record candidate pages.

[snip]

---
Best Regards,
Huang, Ying
