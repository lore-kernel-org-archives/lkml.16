Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C696527FB0C
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:41:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748364108; cv=none; b=q9eh4+GOAhs8BkfRPCLLzU/vObfe3deqVZLsrPHgB43WuDPTFYwrvfMvBy+aFtNbzWEnlUUn2MRJEN9Yoi9F2eP1KU+QGATjPbLrS4AduXKmtyCqmhUKFHwHDwsmRG7b/dmSs/3kdtH7HTmF++Sw6mBoV6eS24uu72c2inlnbIE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748364108; c=relaxed/simple;
	bh=4tnOYGjqks8PWbRfbKPEZttiQM5neLtKjOpQESFmv4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UjlQ6N6SQ6x9AVtJ89mw2Z+zs3tGvMl/fMjdbpyGLRRloStIwfrJYyvzHsykXzxoD3u+dvcRu3S74YEBjZK6JSwADXTpkwmT/eC1KqQYIUUvg1Lx9sJRWGpCeoC2F3g2psvAubJlGQ1TIlHdNO7WyOTK1DpEpQDeVpZ27CjBDUw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4b6JLc4LPXzYQv3Q
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:41:44 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id B50701A018D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:41:43 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP2 (Coremail) with SMTP id Syh0CgDXk2ZG6zVo+FlUNg--.42217S2;
	Wed, 28 May 2025 00:41:43 +0800 (CST)
Message-ID: <82692c51-a599-49ee-8830-f5c7afbd6b14@huaweicloud.com>
Date: Wed, 28 May 2025 00:41:42 +0800
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
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Oleg Nesterov <oleg@redhat.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, vbabka@suse.cz, jannh@google.com, pfalcato@suse.de,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527153007.GD8333@redhat.com>
 <b16e6120-9f02-4a3a-8f85-394ea55bf516@lucifer.local>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <b16e6120-9f02-4a3a-8f85-394ea55bf516@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:Syh0CgDXk2ZG6zVo+FlUNg--.42217S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uryrCrWfArWDuFy5tFyfXrb_yoW8Jw1kpF
	Wqya15KFs5trWUJwn2y34Ut3Wrt393Jr43XF90q34UAFZ0qFnagFW8JFWY9F1q9rs7K3WY
	va98Gr93XFy2vaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Sb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
	kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE
	5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r4UMcvjeV
	CFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwACI402YVCY1x02628vn2kIc2xKxwCY1x02
	62kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwCFI7
	km07C267AKxVWUXVWUAwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r10
	6r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxV
	WUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG
	6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr
	1UYxBIdaVFxhVjvjDU0xZFpf9x07UG-eOUUUUU=
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/27 23:33, Lorenzo Stoakes wrote:
> On Tue, May 27, 2025 at 05:30:08PM +0200, Oleg Nesterov wrote:
>> Not that this is really important, but the test-case looks broken,
>>
>> On 05/27, Pu Lehui wrote:
>>>
>>> #define _GNU_SOURCE
>>> #include <fcntl.h>
>>> #include <unistd.h>
>>> #include <syscall.h>
>>> #include <sys/mman.h>
>>> #include <linux/perf_event.h>
>>>
>>> int main(int argc, char *argv[])
>>> {
>>>      int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
>>
>> FNAME is not defined
>>
>>>      struct perf_event_attr attr = {
>>>          .type = 9,
>>
>> Cough ;) Yes I too used perf_event_attr.type == 9 when I wrote another
>> test-case. Because I am lazy and this is what I see in
>> /sys/bus/event_source/devices/uprobe/type on my machine.
>>
>> But me should not assume that perf_pmu_register(&perf_uprobe) -> idr_alloc()
>> will return 9.
>>
>>>      write(fd, "x", 1);
>>
>> looks unnecessary.
>>
>> Oleg.
>>
> 
> While I agree we should probably try to do this nicely, in defence of Pu I think
> this is adapted from the syzkaller horror show :P and that code does tend to
> just insert random integers etc.
> 
> It would be good to refine this into something more robust if possible and
> ideally add as a self-test, however!

Yeah, just trying to make the commit message more compact, but miss a 
lot. Will do better next.

