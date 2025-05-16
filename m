Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8858823AD
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747360315; cv=none; b=ag9WbTQSSPu4u6vhj3Uxj789eH6en2XU9/dFbwDHwY5q2rfgyniIqhIK5Xs9lMbXzm3cmdlKq1Nc5/B4FtdKD+I1btYrEawC1hhVBw+l/O0jy9nmoFDcegJpop7Hmd5SkYksTmWyBMympdU3nqq6OaaZCppkp7C5yVG8gshX+TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747360315; c=relaxed/simple;
	bh=Kvi3+MByPKVUnusiq/0ZjYdwk7l60C4sKMs/kucIHB8=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=PIUmMylPaui73HkhjFPGlca/eHhw5HOSTeTqC19vlDFz9fFX4eKUG6APZJuhmQj9jZRXC93TbMwBkvgnphpiP5on6ksNJeDjMTHO6qSZ4dl5MzCATPTg9o1nJeGohc0eQmHZess0gcqBSGeKDi2+VJbBPfolCuizyk3LqgKALTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=U6Zh2as+; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="U6Zh2as+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747360309; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=ASU4Fxc7OHYIafbgzFRpS/eCwbldDAYcq+8dy81di+w=;
	b=U6Zh2as+uxElW7kiMbyAWOw3FimN1ImicwIFNGoDMUJpabEvFtrPCWx23G04FVgxvR/Fy4URDmrKNRdBA7M9NXRndK428uJso0HSUsUtyXaabtEdMXrhtHgRoZDSqRjK8TzVNVff4UABMw9rrX1+Xdzo7oGgziwppKtpIPN9P6k=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WatLZYe_1747360306 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 16 May 2025 09:51:47 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,  Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@redhat.com>,  Alistair Popple <apopple@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,  Rakie
 Kim <rakie.kim@sk.com>,  linux-mm@kvack.org,
  linux-kernel@vger.kernel.org,  Byungchul Park <byungchul@sk.com>,
  Gregory Price <gourry@gourry.net>
Subject: Re: [PATCH] MAINTAINERS: add mm memory policy section
In-Reply-To: <ed6f0fc2-5608-4eea-b1be-07e3e19be263@lucifer.local> (Lorenzo
	Stoakes's message of "Thu, 15 May 2025 20:25:17 +0100")
References: <20250515191358.205684-1-lorenzo.stoakes@oracle.com>
	<ed6f0fc2-5608-4eea-b1be-07e3e19be263@lucifer.local>
Date: Fri, 16 May 2025 09:51:46 +0800
Message-ID: <87bjrtpbkd.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ascii

Lorenzo Stoakes <lorenzo.stoakes@oracle.com> writes:

> Hi Andrew,
>
> Could you also apply the attached fix-patch, as I accidentally missed Ying
> from the reviewer list.
>
> Thanks, Lorenzo
>
> On Thu, May 15, 2025 at 08:13:58PM +0100, Lorenzo Stoakes wrote:
>> As part of the ongoing efforts to sub-divide memory management
>> maintainership and reviewership, establish a section for memory policy and
>> migration and add appropriate maintainers and reviewers.
>>
>> Reviewed-by: Rakie Kim <rakie.kim@sk.com>
>> Acked-by: Matthew Brost <matthew.brost@intel.com>
>> Reviewed-by: Joshua Hahn <joshua.hahnjy@gmail.com>
>> Acked-by: David Hildenbrand <david@redhat.com>
>> Acked-by: Zi Yan <ziy@nvidia.com>
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> ---
>> v1:
>> * un-RFC'd as there seems to be consensus.
>> * Added Gregory and Byungchui who kindly offered to be reviewers also!
>> * Removed Alistair as he hasn't been active on-list lately. Alistair - hope
>>   you don't mind, We can very easily add you later, just don't want put you
>>   here without your positive consent :)
>>
>> RFC:
>> https://lore.kernel.org/all/20250513160007.132378-1-lorenzo.stoakes@oracle.com/
>>
>>  MAINTAINERS | 19 +++++++++++++++++++
>>  1 file changed, 19 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 314007e2befd..17403329d76f 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15577,6 +15577,25 @@ W:	http://www.linux-mm.org
>>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>  F:	mm/gup.c
>>
>> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
>> +M:	Andrew Morton <akpm@linux-foundation.org>
>> +M:	David Hildenbrand <david@redhat.com>
>> +R:	Zi Yan <ziy@nvidia.com>
>> +R:	Matthew Brost <matthew.brost@intel.com>
>> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
>> +R:	Rakie Kim <rakie.kim@sk.com>
>> +R:	Byungchul Park <byungchul@sk.com>
>> +R:	Gregory Price <gourry@gourry.net>
>> +L:	linux-mm@kvack.org
>> +S:	Maintained
>> +W:	http://www.linux-mm.org
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>> +F:	include/linux/mempolicy.h
>> +F:	include/linux/migrate.h
>> +F:	mm/mempolicy.c
>> +F:	mm/migrate.c
>> +F:	mm/migrate_device.c
>> +
>>  MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
>>  M:	Andrew Morton <akpm@linux-foundation.org>
>>  M:	Mike Rapoport <rppt@kernel.org>
>> --
>> 2.49.0
>
> ----8<----
> From 6e6b63cdce577718d939178625b62fe92e15565f Mon Sep 17 00:00:00 2001
> From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> Date: Thu, 15 May 2025 20:23:27 +0100
> Subject: [PATCH] add Ying as reviewer
>
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 17403329d76f..b4f74cdc5304 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15586,6 +15586,7 @@ R:	Joshua Hahn <joshua.hahnjy@gmail.com>
>  R:	Rakie Kim <rakie.kim@sk.com>
>  R:	Byungchul Park <byungchul@sk.com>
>  R:	Gregory Price <gourry@gourry.net>
> +R:	Ying Huang <ying.huang@linux.alibaba.com>
>  L:	linux-mm@kvack.org
>  S:	Maintained
>  W:	http://www.linux-mm.org

Thank Zi for nominating me!

It's my pleasure to be listed as reviewer.  Feel free to add my

Acked-by: Huang Ying <ying.huang@linux.alibaba.com>

in the future versions.

---
Best Regards,
Huang, Ying
