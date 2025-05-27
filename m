Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8DE249F9
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 01:18:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748308700; cv=none; b=mqSrjHGU9EyWzoa9ZJAVQWRDjwy0Z7nAJiSkTik65ePJsiI7NhgS4HKTd7WvTJb/Y2cXQ4nOsQ8BOhgpgHITxgU4XRQqRuLPZj4k+r1/4Uk9xFPj49WC2JpVwamRly8O7BTNIpKJsfm1SVU04WpV9939mruC4K3YNrh1WgXHKk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748308700; c=relaxed/simple;
	bh=xu3s7LH523naF5xkkfOiaQ9+Sz+N88qCwSYADD3keiU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XgZp2X3FntbjjzYLql6DDBr3PPHgvHwCkj45+fv9pN1Q788RPeW+Cwn3KXtm2DmJWKTixBhvLrm8AEA/wuQ125YLIng7FkHm9vf0K2HYhmst88eGNtSbftXZk8purBiYP9bY7p3q/Tg2Vp43gAXc8fHGLhhb1pxck9ummoXPD/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=P5+itliU; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="P5+itliU"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748308695; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=JcqVq5H72s7TakAUQdq3XZtzg5uRXBK5cREK+OnCK9A=;
	b=P5+itliU09diCEvQlI2Zopz+0YoSzWj5IQpJ7j3L8XoW19uJ8sYrWsmgcOKJiJXsvJmdtYEAGUNqLQsqHEmW/BNL06DnhG/p4WawgtnbRiUC5IBu86jyyiIbXSoNEdM1qeu+5KfM0IzBAfFF86dLTpLZDXXeaEX371TP3pMSXLM=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WbveRtX_1748308692 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 May 2025 09:18:13 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Zi Yan <ziy@nvidia.com>
Cc: David Hildenbrand <david@redhat.com>,  Bharata B Rao <bharata@amd.com>,
  linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  Jonathan.Cameron@huawei.com,  dave.hansen@intel.com,  gourry@gourry.net,
  hannes@cmpxchg.org,  mgorman@techsingularity.net,  mingo@redhat.com,
  peterz@infradead.org,  raghavendra.kt@amd.com,  riel@surriel.com,
  rientjes@google.com,  sj@kernel.org,  weixugc@google.com,
  willy@infradead.org,  dave@stgolabs.net,  nifan.cxl@gmail.com,
  joshua.hahnjy@gmail.com,  xuezhengchu@huawei.com,  yiannis@zptcorp.com,
  akpm@linux-foundation.org
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
In-Reply-To: <94BF4806-ABCD-4D01-8577-9E138A634815@nvidia.com> (Zi Yan's
	message of "Mon, 26 May 2025 10:20:39 -0400")
References: <20250521080238.209678-1-bharata@amd.com>
	<20250521080238.209678-3-bharata@amd.com>
	<62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
	<AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
	<5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
	<996B013E-4143-4182-959F-356241BE609A@nvidia.com>
	<382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
	<FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
	<dbc7c66b-24c9-49f4-8988-a7eec1280ca8@redhat.com>
	<94BF4806-ABCD-4D01-8577-9E138A634815@nvidia.com>
Date: Tue, 27 May 2025 09:18:12 +0800
Message-ID: <87a56yc0mj.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Zi Yan <ziy@nvidia.com> writes:

> On 26 May 2025, at 5:29, David Hildenbrand wrote:
>
>> On 22.05.25 19:30, Zi Yan wrote:
>>> On 22 May 2025, at 13:21, David Hildenbrand wrote:
>>>
>>>> On 22.05.25 18:38, Zi Yan wrote:
>>>>> On 22 May 2025, at 12:26, David Hildenbrand wrote:
>>>>>
>>>>>> On 22.05.25 18:24, Zi Yan wrote:
>>>>>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>>>>>
>>>>>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>>>>>> Currently the folios identified as misplaced by the NUMA
>>>>>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>>>>>> hint fault handler as and when they are identified as
>>>>>>>>> misplaced.
>>>>>>>>>
>>>>>>>>> Instead of such singe folio migrations, batch them and
>>>>>>>>> migrate them at once.
>>>>>>>>>
>>>>>>>>> Identified misplaced folios are isolated and stored in
>>>>>>>>> a per-task list. A new task_work is queued from task tick
>>>>>>>>> handler to migrate them in batches. Migration is done
>>>>>>>>> periodically or if pending number of isolated foios exceeds
>>>>>>>>> a threshold.
>>>>>>>>
>>>>>>>> That means that these pages are effectively unmovable for
>>>>>>>> other purposes (CMA, compaction, long-term pinning, whatever)
>>>>>>>> until that list was drained.
>>>>>>>>
>>>>>>>> Bad.
>>>>>>>
>>>>>>> Probably we can mark these pages and when others want to migrate the page,
>>>>>>> get_new_page() just looks at the page's target node and get a new page from
>>>>>>> the target node.
>>>>>>
>>>>>> How do you envision that working when CMA needs to migrate this exact page to a different location?
>>>>>>
>>>>>> It cannot isolate it for migration because ... it's already isolated ... so it will give up.
>>>>>>
>>>>>> Marking might not be easy I assume ...
>>>>>
>>>>> I guess you mean we do not have any extra bit to indicate this page is isolated,
>>>>> but it can be migrated. My point is that if this page is going to be migrated
>>>>> due to other reasons, like CMA, compaction, why not migrate it to the target
>>>>> node instead of moving it around within the same node.
>>>>
>>>> I think we'd have to identify that
>>>>
>>>> a) This page is isolate for migration (could be isolated for other
>>>>     reasons)
>>>>
>>>> b) The one responsible for the isolation is numa code (could be someone
>>>>     else)
>>>>
>>>> c) We're allowed to grab that page from that list (IOW sync against
>>>>     others, and especially also against), to essentially "steal" the
>>>>     isolated page.
>>>
>>> Right. c) sounds like adding more contention to the candidate list.
>>> I wonder if we can just mark the page as migration candidate (using
>>> a page flag or something else), then migrate it whenever CMA,
>>> compaction, long-term pinning and more look at the page.
>>
>> I mean, all these will migrate the page either way, no need to add another flag for that.
>>
>> I guess what you mean, indicating that the migration destination
>> should be on a different node than the current one.
>
> Yes.
>
>>
>> Well, and for the NUMA scanner (below) to find which pages to migrate.
>>
>> ... to be this raises some questions: like, if we don't migrate
>> immediately, could that information ("migrate this page") actually
>> now be wrong? I guess a way to
>
> Could be. So it is better to evaluate the page before the actual migration, in
> case the page is no longer needed in a remote node.
>
>> obtain the destination node would suffice: if the destination node
>> matches, no need to migrate from that NUMA scanner.
>
> Right. The destination node could be calculated by certain metric like most recent
> accesses or last remote node access time.

Do we have the necessary information available?  last_cpupid have either
last accessing CPU or last scanning timestamp, not both.  Any other
information source?

---
Best Regards,
Huang, Ying

> If most recent accesses are still coming
> from a remote node and/or last remote node access time is within a short time frame,
> the page should be migrated. Since it is possible that the page is frequently accessed
> by a remote node but when it comes to migration, it is no longer needed by a remote
> node and the access pattern would look like 1) a lot of remote node accesses, but
> 2) the last remote node access is long time ago.
>
>>
>> In addition,
>>> periodically, the migration task would do a PFN scanning and migrate
>>> any migration candidate. I remember Willy did some experiments showing
>>> that PFN scanning is very fast.
>>
>> PFN scanning can be faster than walking lists, but I suspect it
>> depends on how many pages there really are to be migrated ... and
>> some other factors :)
>
> Yes. LRU list is good since it restricts the scanning range, but PFN scanning
> itself does not have it. PFN scanning with some filter mechanism might work
> and that filter mechanism is a way of marking to-be-migrated pages. Of course,
> a quick re-evaluation of the to-be-migrated pages right before a migration
> would avoid unnecessary work like we discussed above.
>
> --
> Best Regards,
> Yan, Zi
