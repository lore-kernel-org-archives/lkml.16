Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 489E31CA84
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 02:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744253549; cv=none; b=fXIkpv3BEXlNm2GEpYqqEO1Z6P1TYcLWY+/TEsy/9pMLCTXMVOlUnvzLTc7sIiE1qQBdZcWaUu1blZE8vStD0VIWcaojCzPFMkejHigULE8V3NjrsATxBcifNfryiO0o8kpKwuHrA1O8K+YdcSYFpPclXPAse4hktKmkyujhJYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744253549; c=relaxed/simple;
	bh=3GMKJMyO6XbTppXxJ4t5YNnNmyH44h7Kci21jGO8V5g=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=HOHCyKCPcOwijTIJrpbXzcz2iuaq0LW84pX6Hih6fp9b8D4/ZnaCiKw+wa7IRxFQYDQicrYhzKPMc1ls7G1PqA0gUiOB2rgIg7l/xjvjDzvyzfVn49wxRjcmr6jYNevwtXqeZ6hjPBU1iNUfKnANNIGS866ZhTd6ij2YSC/uINc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4ZY44h41zSzvX2s;
	Thu, 10 Apr 2025 10:48:20 +0800 (CST)
Received: from dggpemf200006.china.huawei.com (unknown [7.185.36.61])
	by mail.maildlp.com (Postfix) with ESMTPS id D3FE6180468;
	Thu, 10 Apr 2025 10:52:23 +0800 (CST)
Received: from [10.67.120.129] (10.67.120.129) by
 dggpemf200006.china.huawei.com (7.185.36.61) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 10 Apr 2025 10:52:23 +0800
Message-ID: <04f4cff4-be7c-48d8-b24e-535ccc67d908@huawei.com>
Date: Thu, 10 Apr 2025 10:52:23 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] alloc_tag: handle incomplete bulk allocations in
 vm_module_tags_populate
To: Suren Baghdasaryan <surenb@google.com>, Andrew Morton
	<akpm@linux-foundation.org>
CC: "T.J. Mercier" <tjmercier@google.com>, <kent.overstreet@linux.dev>,
	<janghyuck.kim@samsung.com>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>
References: <20250409225111.3770347-1-tjmercier@google.com>
 <20250409171238.494fd49979b4607bff9791b7@linux-foundation.org>
 <CAJuCfpHaocOVHf673X1nn_R0cpz=GtDZEZ+ceo+5OptRcBUjcw@mail.gmail.com>
Content-Language: en-US
From: Yunsheng Lin <linyunsheng@huawei.com>
In-Reply-To: <CAJuCfpHaocOVHf673X1nn_R0cpz=GtDZEZ+ceo+5OptRcBUjcw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemf200006.china.huawei.com (7.185.36.61)

On 2025/4/10 9:44, Suren Baghdasaryan wrote:
> On Thu, Apr 10, 2025 at 12:12 AM Andrew Morton
> <akpm@linux-foundation.org> wrote:
>>
>> On Wed,  9 Apr 2025 22:51:11 +0000 "T.J. Mercier" <tjmercier@google.com> wrote:
>>
>>> alloc_pages_bulk_node may partially succeed and allocate fewer than the
>>> requested nr_pages. There are several conditions under which this can
>>> occur, but we have encountered the case where CONFIG_PAGE_OWNER is
>>> enabled causing all bulk allocations to always fallback to single page
>>> allocations due to commit 187ad460b841 ("mm/page_alloc: avoid page
>>> allocator recursion with pagesets.lock held").
>>>
>>> Currently vm_module_tags_populate immediately fails when
>>> alloc_pages_bulk_node returns fewer than the requested number of pages.
>>> When this happens memory allocation profiling gets disabled, for example
>>>
>>> [   14.297583] [9:       modprobe:  465] Failed to allocate memory for allocation tags in the module scsc_wlan. Memory allocation profiling is disabled!
>>> [   14.299339] [9:       modprobe:  465] modprobe: Failed to insmod '/vendor/lib/modules/scsc_wlan.ko' with args '': Out of memory
>>>
>>> This patch causes vm_module_tags_populate to retry bulk allocations for
>>> the remaining memory instead of failing immediately which will avoid the
>>> disablement of memory allocation profiling.
>>>
>>
>> Thanks.  I'm assuming we want cc:stable on this?
>>
>> btw, it looks like the "Clean up and error out" code in
>> vm_module_tags_populate() could use release_pages().

For the 'Clean up and error out' part:
next_page[] array might need to be reset to NULL if user is able to
reenable the memory allocation profiling when the above happens as the
current page bulk alloc API are only populating NULL elements.

> 
> True. I'll add that into my TODO list. Thanks!
> 
>>
> 
