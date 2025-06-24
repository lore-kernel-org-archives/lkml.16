Received: from out30-118.freemail.mail.aliyun.com (out30-118.freemail.mail.aliyun.com [115.124.30.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2988245009
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.118
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750729744; cv=none; b=Fo+H/t9UdpXBs/xRRAxRsYT+3f9LogDL5jdfFM6XxAyJ6ZSuN/L0Vv4EpXUeLfe2/ezHs7ihpc+pXnKFRGLxDKXzeS573UW6yBc8YJ0OKvzA7Wooivw8/wYqFD6xu3w10K4hFme/K1s2J3G3+OWPpRHpoInlbi6IsQ+ObJbufMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750729744; c=relaxed/simple;
	bh=O/GeTSmrcAYsZdvbj/wx7+9vVlopRs2s3FlvuxB82tY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tDhrObG+ROC+rvFizhpngky1XHKbWp89iN1R8uAfOhu9Ou2+C2p6fMQctrAZ7ii6Foq2k/aUtgyDlC56AWGQxuBIcXgTd6PbsVJWcgp2pTPRb/ohboSC2fM2M6yidUjHtr7YZ83NAi/k3wF6/M8ULkfJ6VCfx0yzuhQVJBO+v2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RMjaKuue; arc=none smtp.client-ip=115.124.30.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RMjaKuue"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750729734; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=JGJ5GFOHEsME24UlCT9tOsuTHYhBxxkoMWmuCUFx++w=;
	b=RMjaKuuen+F30wEdBTaAVzNA3LbE/TCK3WyQ0R0ZbIcF+X10l36Bu9ua0gYkh+A3zjvCMZleLJlWadL5Aqj6lQtV8ERmNh7UXA8K0v0ue3M4mA3OXCyXgWPO1SswHwYU8+8WJa+TQONtWoTS2xNVzcgAaVfcIGFSxbXZ/HTB6EU=
Received: from 30.74.144.102(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WeeLBR6_1750729732 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 09:48:53 +0800
Message-ID: <ae78feb2-d044-41ba-bc4f-e3085428bc10@linux.alibaba.com>
Date: Tue, 24 Jun 2025 09:48:52 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] mm: huge_memory: disallow hugepages if the
 system-wide THP sysfs settings are disabled
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <cover.1750666536.git.baolin.wang@linux.alibaba.com>
 <adb8d5032ecc7b6935e3197cafffe92cbc7581e6.1750666536.git.baolin.wang@linux.alibaba.com>
 <a9f77007-78c1-4980-bd31-af5dff741f27@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <a9f77007-78c1-4980-bd31-af5dff741f27@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/23 21:54, David Hildenbrand wrote:
> 
>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/ 
>> selftests/mm/khugepaged.c
>> index 4341ce6b3b38..85bfff53dba6 100644
>> --- a/tools/testing/selftests/mm/khugepaged.c
>> +++ b/tools/testing/selftests/mm/khugepaged.c
>> @@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg, 
>> char *p, int nr_hpages,
>>       printf("%s...", msg);
>> -    /*
>> -     * Prevent khugepaged interference and tests that MADV_COLLAPSE
>> -     * ignores /sys/kernel/mm/transparent_hugepage/enabled
>> -     */
>> -    settings.thp_enabled = THP_NEVER;
>> +    settings.thp_enabled = THP_ALWAYS;
> 
> 
> Would MADVISE mode also work here? If we don't set MADV_HUGEPAGE, then 
> khugepaged should be excluded, correct?

I tried this, but some test cases failed. As I replied to Barry, it's 
because some tests previously set MADV_NOHUGEPAGE, and now there is no 
way to clear the MADV_NOHUGEPAGE flag except by setting MADV_HUGEPAGE.
