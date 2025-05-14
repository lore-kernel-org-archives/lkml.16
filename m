Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78528282F1
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 01:52:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747187564; cv=none; b=uYvzvFiYMft3VRCz4vQOCZlpRWWNpJ5LgPCxVZKsr6xKi1Bbr9F1xjzNcgOQUzSz/ztEfm+z7jsZbqooXj7+b8IKlGngQ+rq7xE55buitzIr3c52+SRbtFjKUlWP47BWzt9xCWtUvWHxy5AG42xIafWwoOxoc6bTZWqkxfvKXwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747187564; c=relaxed/simple;
	bh=ArzmPrUUimxgO3OLbTZZyHprCgkECw047we4m+4Wy3Q=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=DS5PEwVOxbUbSMLl3ykFOP0ILOI9Ip5G/CVwjXsg8DJn3VWMsm4IVvCSjVURdi55EfCunhzyJZfhtfPVhQWo5D0ZfW7BYtpRmEv0ep4c5Tv1K91t7OwOcm6urJv8NiyiAOSn5vzHHGhynmKuJJnuUvM2FczVaBKrYbBB8MPljD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=PezMostV; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="PezMostV"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747187552; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=PcUnhacTHmV8p2KHssTwLk+L9RMh0PlQReOgV31H3LA=;
	b=PezMostViuOX8PYL0tHTiMPDn1VSiZrOty+I2+3sPIIsz6pXBxs4iTo4FmJapzI3zkbZuU3FO4TnUDjZJE4NtaChiWqjwF7BTBbJN8D0iZnMKXQ7mhaAzz8j4ORRuGpAAsXBPXsJZTegaoYcBpvEE+UHBYB65fF/9bWf8ORUZVU=
Received: from DESKTOP-5N7EMDA(mailfrom:ying.huang@linux.alibaba.com fp:SMTPD_---0WajTcAk_1747187551 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 14 May 2025 09:52:32 +0800
From: "Huang, Ying" <ying.huang@linux.alibaba.com>
To: Zi Yan <ziy@nvidia.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,  David Hildenbrand
 <david@redhat.com>,  Alistair Popple <apopple@nvidia.com>,  Matthew Brost
 <matthew.brost@intel.com>,  Joshua Hahn <joshua.hahnjy@gmail.com>,  Rakie
 Kim <rakie.kim@sk.com>,  linux-mm@kvack.org,  linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH] MAINTAINERS: add mm memory policy section
In-Reply-To: <F5EEDDBD-C151-42CB-8880-CCA9A841A4DC@nvidia.com> (Zi Yan's
	message of "Tue, 13 May 2025 12:06:28 -0400")
References: <20250513160007.132378-1-lorenzo.stoakes@oracle.com>
	<F5EEDDBD-C151-42CB-8880-CCA9A841A4DC@nvidia.com>
Date: Wed, 14 May 2025 09:52:32 +0800
Message-ID: <87wmakt0v3.fsf@DESKTOP-5N7EMDA>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Zi Yan <ziy@nvidia.com> writes:

> On 13 May 2025, at 12:00, Lorenzo Stoakes wrote:
>
>> As part of the ongoing efforts to sub-divide memory management
>> maintainership and reviewership, establish a section for memory policy a=
nd
>> migration and add appropriate maintainers and reviewers.
>>
>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> ---
>>
>> REVIEWERS NOTES:
>>
>> I took a look through git blame, past commits, etc. and came up with what
>> seems to be a reasonable list of people here, if you don't feel you ought
>> to be here, or if you feel anybody is missing (including yourself!) let =
me
>> know :)
>
> +Ying, who added batched TLB flushing to page migration code. Let=E2=80=
=99s see
> if he is interested in mm/migrate.c.

Hi, Zi,

Thank you very much to nominate me!

Hi, Lorenzo,

I have contributed the batched TLB flushing to page migration and some
review comments for weighted interleave policy.  Please feel free to add
me to the reviewer list if you think that it's appropriate.

R: Ying Huang <ying.huang@linux.alibaba.com>

>>
>> David has kindly already agreed to be co-maintainer for this section.
>>
>>  MAINTAINERS | 18 ++++++++++++++++++
>>  1 file changed, 18 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 80aa09f2e735..29d73593038c 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -15567,6 +15567,24 @@ W:	http://www.linux-mm.org
>>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>  F:	mm/gup.c
>>
>> +MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION
>> +M:	Andrew Morton <akpm@linux-foundation.org>
>> +M:	David Hildenbrand <david@redhat.com>
>> +R:	Zi Yan <ziy@nvidia.com>
>
> Acked-by: Zi Yan <ziy@nvidia.com>
>
>> +R:	Alistair Popple <apopple@nvidia.com>
>> +R:	Matthew Brost <matthew.brost@intel.com>
>> +R:	Joshua Hahn <joshua.hahnjy@gmail.com>
>> +R:	Rakie Kim <rakie.kim@sk.com>
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

---
Best Regards,
Huang, Ying
