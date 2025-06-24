Received: from out30-112.freemail.mail.aliyun.com (out30-112.freemail.mail.aliyun.com [115.124.30.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6535D182BC
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.112
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750756862; cv=none; b=DH2bA4Wi+p3kzjZpbxctPJphq/CxYABcV0Y75WdP19elwQApBqxpSPPHLkB9e94xIl05xHJihWgBFYQqiDuTzSni0sWhz1MpplFiNz0tXSzfJlGiajTWiOzgMkU61amku8BagY8qdgcdJVXvgp/OTEqyfFl0IT5m4q7aceloclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750756862; c=relaxed/simple;
	bh=E8SKyUpjetN1J92KOakPpEOAzTB9/3cdczxURfbSM/s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ALo7/0FHZAhRaJyfChF7XLxigT7Ahe+cWkC2IVQkpd5dcUa/WN0hl4zqjTc8b6AgN1n+9Q3xgCxKJ9ob3MJFfcNoL1AXZnMgqy+RvmV8CUv/6Kc3CF+HOtG84MoJqNdDbz756APwTQOvoMqGkplkcAPDEGXqE87k8nBnYUYrhXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Hg1DZeuq; arc=none smtp.client-ip=115.124.30.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Hg1DZeuq"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750756857; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=dLsT6vIUOkiWqe9khgfw1CalTOzKAVaMh9ZCazfucIY=;
	b=Hg1DZeuqYUekbjQ1e4M6PTJnbIsh4kzQIP/+oPF4FsmdnvnOw8e0adwcFQpVn6bYPp8PV9hZcAwrhh1kNOTwQf4dtRmt1QTU2u/MTSIoNpnvHKxwOSL71Enu0FrbrnteXCSW7lA/GLfzS62NgyIxGE6hqo4bv0dbK7FXvlmfwlQ=
Received: from 30.74.144.102(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0Wegbozo_1750756855 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 17:20:56 +0800
Message-ID: <40e13005-0ed1-4d76-8961-fc6fced06681@linux.alibaba.com>
Date: Tue, 24 Jun 2025 17:20:55 +0800
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
 <ae78feb2-d044-41ba-bc4f-e3085428bc10@linux.alibaba.com>
 <44c805d7-000a-440e-995b-106f324eff15@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <44c805d7-000a-440e-995b-106f324eff15@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/6/24 16:29, David Hildenbrand wrote:
> On 24.06.25 03:48, Baolin Wang wrote:
>>
>>
>> On 2025/6/23 21:54, David Hildenbrand wrote:
>>>
>>>> diff --git a/tools/testing/selftests/mm/khugepaged.c b/tools/testing/
>>>> selftests/mm/khugepaged.c
>>>> index 4341ce6b3b38..85bfff53dba6 100644
>>>> --- a/tools/testing/selftests/mm/khugepaged.c
>>>> +++ b/tools/testing/selftests/mm/khugepaged.c
>>>> @@ -501,11 +501,7 @@ static void __madvise_collapse(const char *msg,
>>>> char *p, int nr_hpages,
>>>>        printf("%s...", msg);
>>>> -    /*
>>>> -     * Prevent khugepaged interference and tests that MADV_COLLAPSE
>>>> -     * ignores /sys/kernel/mm/transparent_hugepage/enabled
>>>> -     */
>>>> -    settings.thp_enabled = THP_NEVER;
>>>> +    settings.thp_enabled = THP_ALWAYS;
>>>
>>>
>>> Would MADVISE mode also work here? If we don't set MADV_HUGEPAGE, then
>>> khugepaged should be excluded, correct?
>>
>> I tried this, but some test cases failed. As I replied to Barry, it's
>> because some tests previously set MADV_NOHUGEPAGE, and now there is no
>> way to clear the MADV_NOHUGEPAGE flag except by setting MADV_HUGEPAGE.
> 
> Okay, can you add that detail to the patch description. 

Sure. Will do.

> I suspect we 
> really want a way to undo what MADV_NOHUGEPAGE/MADV_NOHUGEPAGE did (if 
> only naming wouldn't be complicated: MADV_DEFAULT_HUGEPAGE, hmmmm).
