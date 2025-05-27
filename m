Received: from out30-110.freemail.mail.aliyun.com (out30-110.freemail.mail.aliyun.com [115.124.30.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E77C24DD10
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 09:05:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.110
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748336729; cv=none; b=GeUKOnpUJQ/mhG2N70B3hoYBFLMM6kjeQFeVk7QIFbedcSG44Sjv3rnUypDlAGY6Z3pnqb54JeDGi2Qxkqt02kfvMmIXezWJp3xxK4QcPnQvj7gJqFCYkjOEEbDMfCjPVEDS06JA4Vuge54ujyvYJix45adSAI9JGYWhPTiLr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748336729; c=relaxed/simple;
	bh=CeqyVjYJXY5gNLnSFK8rGhR6vDYi3IcREM2wPzYC82k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Zw4jfhlLovNMYYU+3s2OP5lu43WcgNmcul3d0Z8arRXLZqCw+VUFkESdt6P7nZQAAP+vl2U9HLvCTNFhGDcEt/EZmafftMcKtbKnt2Y0ugYQkcXB4j+sB9f7rGlmuz7badK3BCQJfsmVb4k0Mp67Nra1Gis4kbCnnqfviDFbOrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=CZvtfoAE; arc=none smtp.client-ip=115.124.30.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="CZvtfoAE"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1748336724; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=g3UmXVOxJL0IKWUMXDh3p6MkUMRqvLMyZGb15DpuS6c=;
	b=CZvtfoAEwbUdC+ftJvS5UKsY+pPrkwZ4XUvZ9Ai01M+b2bbeUMR4UH09dE0wepRWwjPY8PPNFF1olTxFC6JgZiTU/YSnNlRHoX9f2SrCGmOkIGUy75Du/QL6g9+YgdKA95u6IF8oa16QpTAMKBb4nY9fXmtrhjoNgvyq4a/iP/Q=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WbzeqpI_1748336721 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 27 May 2025 17:05:22 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Bharata B Rao <bharata@amd.com>
Cc: linux-kernel@vger.kernel.org,  linux-mm@kvack.org,
  Jonathan.Cameron@huawei.com,  dave.hansen@intel.com,  gourry@gourry.net,
  hannes@cmpxchg.org,  mgorman@techsingularity.net,  mingo@redhat.com,
  peterz@infradead.org,  raghavendra.kt@amd.com,  riel@surriel.com,
  rientjes@google.com,  sj@kernel.org,  weixugc@google.com,
  willy@infradead.org,  ziy@nvidia.com,  dave@stgolabs.net,
  nifan.cxl@gmail.com,  joshua.hahnjy@gmail.com,  xuezhengchu@huawei.com,
  yiannis@zptcorp.com,  akpm@linux-foundation.org,  david@redhat.com
Subject: Re: [RFC PATCH v0 0/2] Batch migration for NUMA balancing
In-Reply-To: <55c51f34-b41d-49b2-96a2-dcc5f425f966@amd.com> (Bharata B. Rao's
	message of "Tue, 27 May 2025 14:23:27 +0530")
References: <20250521080238.209678-1-bharata@amd.com>
	<87sekrbvyr.fsf@DESKTOP-5N7EMDA>
	<55c51f34-b41d-49b2-96a2-dcc5f425f966@amd.com>
Date: Tue, 27 May 2025 17:05:21 +0800
Message-ID: <87cybua0fi.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Bharata B Rao <bharata@amd.com> writes:

> On 26-May-25 2:16 PM, Huang, Ying wrote:
>> Hi, Bharata,
>> Bharata B Rao <bharata@amd.com> writes:
>> 
>>> Hi,
>>>
>>> This is an attempt to convert the NUMA balancing to do batched
>>> migration instead of migrating one folio at a time. The basic
>>> idea is to collect (from hint fault handler) the folios to be
>>> migrated in a list and batch-migrate them from task_work context.
>>> More details about the specifics are present in patch 2/2.
>>>
>>> During LSFMM[1] and subsequent discussions in MM alignment calls[2],
>>> it was suggested that separate migration threads to handle migration
>>> or promotion request may be desirable. Existing NUMA balancing, hot
>>> page promotion and other future promotion techniques could off-load
>>> migration part to these threads.
>> What is the expected benefit of the change?
>
> Initially it is about cleanliness and separation of migration into its
> own thread/sub-system.
>
>> For code reuse, we can use migrate_misplaced_folio() or
>> migrate_misplaced_folio_batch() in various promotion path.
>
> That's what I have done in this patchset at least. We thought we could
> go full length and off-load migration to its own thread.

Even if we migrate pages in another thread, the migrated pages will be
unmapped, copied, remapped during migrating.  That is, the workload
threads may be stalled to wait for migrating.  So, we need to measure
the real benefit firstly.

>> For workload latency influence, per my understanding, PTE scanning
>> is
>> much more serious than migration.  Why not start from that?
>
> Raghu's PTE A bit scanning is one effort towards that (Removing PTE
> scanning from task context.

---
Best Regards,
Huang, Ying
