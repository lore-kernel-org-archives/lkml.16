Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E839327A900
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:52:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364735; cv=none; b=n/gy1ZGLKJJRwYQUwGP5t1d32xHOBkW4vKffDhqC1yXD6gaIvQQejJIdBZwkEzTS/gobpiEHh12m/rl6HEsIlRBtXn+iSgBnW9JbT8fNH5F+IvPLZyyn9HOKd9rMOqlyP2BzBP3rndQUUzcso2ROpFkiVLyFUi7REmXF8m2CY1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364735; c=relaxed/simple;
	bh=VRCY1eehv/Ver0nzPaJ4wEd3cjUwdvWZSvAV4mWIkYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y0DEI+SrOJkgSd305j40cO+PD83wLIvdz0MjMBs1zto/w4tR45ZnqEmxI8w1l/Xd8xu/NUtuUXgiMYeZjwIZIhQgvOvWqhqFv+Q26WXBHK/g7df30TVkhQueYsvBPmp44ohod22Tuvw7Nm+nU5T5bwsnLY78uah6zAHcHzkPvfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4b6JTX6R3RzvWs5;
	Wed, 28 May 2025 00:47:44 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 5974F180B61;
	Wed, 28 May 2025 00:52:09 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 28 May 2025 00:52:08 +0800
Message-ID: <e9a85a82-750e-4ab8-aa1a-d760efd6a818@huawei.com>
Date: Wed, 28 May 2025 00:52:08 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v2 1/2] mm/mremap: Fix uprobe anon page be overwritten
 when expanding vma during mremap
Content-Language: en-US
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Pu Lehui
	<pulehui@huaweicloud.com>
CC: Oleg Nesterov <oleg@redhat.com>, <mhiramat@kernel.org>,
	<peterz@infradead.org>, <akpm@linux-foundation.org>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <jannh@google.com>,
	<pfalcato@suse.de>, <linux-mm@kvack.org>, <linux-kernel@vger.kernel.org>
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527142314.GA8333@redhat.com>
 <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
 <3f0f86a3-6ac4-47b5-8626-162b117dce0f@lucifer.local>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <3f0f86a3-6ac4-47b5-8626-162b117dce0f@lucifer.local>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemf100007.china.huawei.com (7.202.181.221)



On 2025/5/28 0:37, Lorenzo Stoakes wrote:
> On Wed, May 28, 2025 at 12:32:57AM +0800, Pu Lehui wrote:
>>
>> On 2025/5/27 22:23, Oleg Nesterov wrote:
>>> Well, I leave this to you / Lorenzo / David, but...
>>>
>>> On 05/27, Pu Lehui wrote:
>>>>
>>>> Fixes: 78a320542e6c ("uprobes: Change valid_vma() to demand VM_MAYEXEC rather than VM_EXEC")
>>>
>>> I don't think that commit could cause this problem.
>>
>> Hi Oleg,
>>
>> Me too! I was test that before and after commit 78a320542e6c, so call it the
>> `directly related commit`. In fact, I think the issue was introduced in the
>> original commit 2b1444983508 ("uprobes, mm, x86: Add the ability to install
>> and remove uprobes breakpoints") # v3.5-rc1.
> 
> Yeah I missed this! I concure that the cited fixes commit is probably not it :P
> 
> Your repro is delightfully consistent so could you bisect to be sure?

OK, I will try that tomorrow. PS: It is hard to work repro that for the 
so old kernel.😅

> 
> BTW did you just say v3.5... Good Lord :)
> 
>>
>>>
>>> Oleg.
>>
> 
