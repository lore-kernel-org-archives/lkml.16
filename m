Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690E52AEFE
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 08:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748248430; cv=none; b=udlhbsZGYtnF55wh/qLQELe5NTSOTbQjoQalTFdePVqoi+/zLCh5rRsnTudsdYEihGnxrP346uf4ucmrDCFi3tTRgtDyZcYarX5/FJuy5o7HxepiNC98nnPhqvYU3sRpawqfMyvI6hqchp/esCNyaaDad8BA+42IRzaKdyfeM/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748248430; c=relaxed/simple;
	bh=t8ynj2qfi/Xuzvg2NLFh0g7z58FPNtCTjM8r4ECd3uo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=CYbWfE7TZ1fRe0ZK1DNdXQM3fo+hv5hLSsz58PNL3ekjf9a3rIB6kf/BtC4cX7aM9oZairAn5Rnc7H80mB8ZbjTV/VahOfEMEmZSanbPsClBTq1bBAVLxXRnDlE7QaS0d2qFQrTheYKI9CPM+bbuTt646g+0JJaOAB1YWNngImA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=L3acg2qE; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="L3acg2qE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748248418; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=VPwPW0avOtzhWIYNFKRbT9qL1dQ35N08OEEC01EhqzQ=;
	b=L3acg2qEMfvCV/YEY0Nm2X1rWDSmOx/70IPVQhBJ8FMkO9eohymU1IwRqXAob6tUriA8eSJ3L74Y/XaD53tbVep3oXEbgtF3YzyLjBPegTLa1xsfQVHdOs0UjF4vGJEcFsFjTVDLdiQ89XJTCoU7U5m2n5pvk1YgcfN/0SIS5eo=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WbmnakE_1748248415 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 26 May 2025 16:33:36 +0800
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
In-Reply-To: <FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com> (Zi Yan's
	message of "Thu, 22 May 2025 13:30:06 -0400")
References: <20250521080238.209678-1-bharata@amd.com>
	<20250521080238.209678-3-bharata@amd.com>
	<62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
	<AE28D27C-58C2-41A4-B553-50049E963745@nvidia.com>
	<5d6b92d8-251f-463b-adde-724ea25b2d89@redhat.com>
	<996B013E-4143-4182-959F-356241BE609A@nvidia.com>
	<382839fc-ea63-421a-8397-72cb35dd8052@redhat.com>
	<FF2F9A08-9BD8-4207-901D-AC9B21443BF6@nvidia.com>
Date: Mon, 26 May 2025 16:33:34 +0800
Message-ID: <87wma3bwkh.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Zi Yan <ziy@nvidia.com> writes:

> On 22 May 2025, at 13:21, David Hildenbrand wrote:
>
>> On 22.05.25 18:38, Zi Yan wrote:
>>> On 22 May 2025, at 12:26, David Hildenbrand wrote:
>>>
>>>> On 22.05.25 18:24, Zi Yan wrote:
>>>>> On 22 May 2025, at 12:11, David Hildenbrand wrote:
>>>>>
>>>>>> On 21.05.25 10:02, Bharata B Rao wrote:
>>>>>>> Currently the folios identified as misplaced by the NUMA
>>>>>>> balancing sub-system are migrated one by one from the NUMA
>>>>>>> hint fault handler as and when they are identified as
>>>>>>> misplaced.
>>>>>>>
>>>>>>> Instead of such singe folio migrations, batch them and
>>>>>>> migrate them at once.
>>>>>>>
>>>>>>> Identified misplaced folios are isolated and stored in
>>>>>>> a per-task list. A new task_work is queued from task tick
>>>>>>> handler to migrate them in batches. Migration is done
>>>>>>> periodically or if pending number of isolated foios exceeds
>>>>>>> a threshold.
>>>>>>
>>>>>> That means that these pages are effectively unmovable for other
>>>>>> purposes (CMA, compaction, long-term pinning, whatever) until
>>>>>> that list was drained.
>>>>>>
>>>>>> Bad.
>>>>>
>>>>> Probably we can mark these pages and when others want to migrate the page,
>>>>> get_new_page() just looks at the page's target node and get a new page from
>>>>> the target node.
>>>>
>>>> How do you envision that working when CMA needs to migrate this exact page to a different location?
>>>>
>>>> It cannot isolate it for migration because ... it's already isolated ... so it will give up.
>>>>
>>>> Marking might not be easy I assume ...
>>>
>>> I guess you mean we do not have any extra bit to indicate this page is isolated,
>>> but it can be migrated. My point is that if this page is going to be migrated
>>> due to other reasons, like CMA, compaction, why not migrate it to the target
>>> node instead of moving it around within the same node.
>>
>> I think we'd have to identify that
>>
>> a) This page is isolate for migration (could be isolated for other
>>    reasons)
>>
>> b) The one responsible for the isolation is numa code (could be someone
>>    else)
>>
>> c) We're allowed to grab that page from that list (IOW sync against
>>    others, and especially also against), to essentially "steal" the
>>    isolated page.
>
> Right. c) sounds like adding more contention to the candidate list.
> I wonder if we can just mark the page as migration candidate (using
> a page flag or something else), then migrate it whenever CMA,
> compaction, long-term pinning and more look at the page. In addition,
> periodically, the migration task would do a PFN scanning and migrate
> any migration candidate. I remember Willy did some experiments showing
> that PFN scanning is very fast.

I think that this could be a second step optimization after the simple
implementation has been done.

---
Best Regards,
Huang, Ying
