Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCDCA1D6DC5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 15:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748531396; cv=none; b=GPaSt+lhkLXY+YnNIl2KQ1OV15pfNQwmSS+UUSK3ZRlzao0ffrCaj3PMpqcyhuYGIXY7ydw5uGaQ3EMaxbRqd9dAOxEwiEJ2LwRbRCLPnrpUv3fATr2tY+jhZAgJ02x8eFvOvzSzxizikGkqmsm1GKUwU9+ncpfzgI7eCWpGMk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748531396; c=relaxed/simple;
	bh=MbDIIPTJ+3YpzeLUOGwKjYeoG3l0D/XW5ur6LLtAtLo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lSl8xOYcdgqf/37ZvpezpJHQPLM4DF8OdnFN67uKSazvHOz7yCYQHQ2K6mT4ncf2gYiDoWRcl7ZEVSAc6qEIZhc+iuF8HQazK7GivCRsTEj65UhTrDcNu2BGIWyIlKbqMk+1mVMmvnd5li3mzq7OT0V1xtf5tmcZJYk+TlOSHPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.163.235])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4b7VCf4VrlzKHMm5
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:09:50 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 0F2771A0CCC
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:09:49 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgDHz2K7eDhoQlEcNw--.51209S2;
	Thu, 29 May 2025 23:09:48 +0800 (CST)
Message-ID: <58d522f5-751a-44ff-9581-bc772c8d5c60@huaweicloud.com>
Date: Thu, 29 May 2025 23:09:47 +0800
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
To: Oleg Nesterov <oleg@redhat.com>, lorenzo.stoakes@oracle.com
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com, pfalcato@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527142314.GA8333@redhat.com>
 <fcb3b061-ca4b-44d7-a9fc-ecd0713c3fda@huaweicloud.com>
 <20250527172018.GF8333@redhat.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20250527172018.GF8333@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgDHz2K7eDhoQlEcNw--.51209S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Ww1xWFyxCw43Kw18Ary5Jwb_yoW8Cr4Upa
	1qqF15KF4Dtw4Ut3srX34kKFy0yFy3tr4UWry5G34furnIg3409Fy2gFZIkF9xZr4xX3WU
	ta13W34Iya4UZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUv0b4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x
	0267AKxVW0oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG
	6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFV
	Cjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0En4kS
	14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I
	8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8
	ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x
	0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_
	Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU1
	7KsUUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/28 1:20, Oleg Nesterov wrote:
> Hi Lehui,
> 
> On 05/28, Pu Lehui wrote:
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
>> `directly related commit`.
> 
> I feel I am totally confused...
> 
> but _may be_ you have used the initial reproducer which used PROT_NONE in
> 
> 	void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> 
> ?
> 
> If yes. I _think_ we should have the same problem with or without 78a320542e6c,
> just you need to s/PROT_NONE/PROT_EXEC/.
> 
>> In fact, I think the issue was introduced in the
>> original commit 2b1444983508 ("uprobes, mm, x86: Add the ability to install
>> and remove uprobes breakpoints") # v3.5-rc1.
> 
> probably yes... Damn I don't know ;)
> 
> Oleg.

Hi Oleg, Lorenzo,

Upon verification, the issue was first introduced by the commit 
2b1444983508 ("uprobes, mm, x86: Add the ability to install and remove 
uprobes breakpoints"). Uprobe only became available for user use after 
commit f3f096cfedf8 ("tracing: Provide trace events interface for 
uprobes"), but at that time, the issue was obscured by another 
problem—specifically, the always failure of uprobe_mmap processing for 
the newly allocated new_vma during copy_vma. After commit 6dab3cc078e3 
("uprobes: Remove copy_vma()->uprobe_mmap()") addressed that, the 
original issue was exposed.

Therefore, I believe the Fixes tag should best reference commit 
2b1444983508 ("uprobes, mm, x86: Add the ability to install and remove 
uprobes breakpoints").

