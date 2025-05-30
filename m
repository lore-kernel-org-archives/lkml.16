Received: from dggsgout11.his.huawei.com (dggsgout11.his.huawei.com [45.249.212.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46AEF205E16
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 22:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748645351; cv=none; b=pspRAC3eYW5WXJrJACdHzCv0cAKwuEdIyKzykJJL1t4dXcgp0dtD7QszFOI9X90heeRNXRDABofEXgxlE5lzBXx9YmCRkVSb/xwKI+Td0htvH4/y1pckoaTK1yFcI6+REi9h0CgFCvCJWy3aGylENDK5HIAkn7gJnrRinyqhRRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748645351; c=relaxed/simple;
	bh=f+WC+n+HJyyafimeO1O9qVAO4GLSXRIklXlLnCrE57Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Bn5EJXlpCZXz+vdLslMZy/V5EkGH8ozmT4I00IOVZEBROEWbRhK8GdmTm7QYPfIq/C8OTruVE5GhZk3nD5LvznODtE61rHkEJuMTc95zbU9xaeWGcSznj+CwHlZyF54TEysWsvZIoS6HkC5xjiSF7EMt02qM/ckOZZ6aExTEeZw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4b8JM13CkwzYQvBn
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 06:49:01 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
	by mail.maildlp.com (Postfix) with ESMTP id 871F01A0F3C
	for <linux-kernel@vger.kernel.org>; Sat, 31 May 2025 06:49:00 +0800 (CST)
Received: from [10.82.57.70] (unknown [10.82.57.70])
	by APP2 (Coremail) with SMTP id Syh0CgCnsWTYNTpoIKGjNw--.13722S2;
	Sat, 31 May 2025 06:48:58 +0800 (CST)
Message-ID: <0a91d1bd-eaa1-4ae3-9212-e63d456f7754@huaweicloud.com>
Date: Sat, 31 May 2025 06:48:56 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
To: David Hildenbrand <david@redhat.com>
Cc: Oleg Nesterov <oleg@redhat.com>, lorenzo.stoakes@oracle.com,
 mhiramat@kernel.org, peterz@infradead.org, Liam.Howlett@oracle.com,
 akpm@linux-foundation.org, vbabka@suse.cz, jannh@google.com,
 pfalcato@suse.de, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 pulehui@huawei.com
References: <62b5ccf5-f1cd-43c2-b0bc-f542f40c5bdf@redhat.com>
 <afe53868-5542-47d6-8005-71c1b3bec840@huaweicloud.com>
 <13c5fe73-9e11-4465-b401-fc96a22dc5d1@redhat.com>
 <4cbc1e43-ea46-44de-9e2b-1c62dcd2b6d5@huaweicloud.com>
 <20250526154850.GA4156@redhat.com>
 <06bd94c0-fefe-4bdc-8483-2d9b6703c3d6@redhat.com>
 <57533126-eb30-4b56-bc4d-2f27514ae5ad@huaweicloud.com>
 <cba0155e-d2b9-41fa-bc51-f3738ae73cff@redhat.com>
 <956124be-c73c-4023-9edd-25372f3f865a@huaweicloud.com>
 <ccf359b0-8baa-4209-b2c3-75e3813ca804@redhat.com>
 <20250530180920.GC25160@redhat.com>
 <0dcec9f4-eef8-499d-a96a-dc6ab3433039@redhat.com>
Content-Language: en-US
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <0dcec9f4-eef8-499d-a96a-dc6ab3433039@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:Syh0CgCnsWTYNTpoIKGjNw--.13722S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Cr1rGF4fWFWfWr1fJr4UCFg_yoW8Xw18pa
	yFvayYgr4rKr18Ar4Ika109F4Yv3yfG3yUCr15Jw13CFWjgF1akrWI9r4Y9Fnruwsa9F10
	ywsFgFy0y34jvaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvjb4IE77IF4wAFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k2
	6cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4
	vEj48ve4kI8wA2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7Cj
	xVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I
	0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40E
	x7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x
	0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc7CjxVAaw2AF
	wI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4
	xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43
	MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I
	0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWU
	JVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjxUF1
	v3UUUUU
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 5/31/2025 2:34 AM, David Hildenbrand wrote:
> On 30.05.25 20:09, Oleg Nesterov wrote:
>> Well, let me say this again ;) I can't really comment, I don't understand
>> this code enough.
>>
>> That said...
>>
>> On 05/30, David Hildenbrand wrote:
>>>
>>> I wonder if there might be a clean way to move the uprobe_mmap() out of
>>> vma_complete().
>>
>> Me too.
>>
>> Not only the uprobe_mmap() calls in vma_complete() doesn't look right
>> "in general" (at least to me).
>>
>> To remind, vma_complete/uprobe_mmap/install_breakpoint is not even called
>> in, say, this case when VMA grows and moves. See
>> https://lore.kernel.org/all/20250526173845.GC4156@redhat.com/
>> I guess we don't really care, but still...
>>
>>
>> But just in case... I agree with Lehui and Lorenzo in that we need a 
>> short
>> term fix, and the last patch from Lehui seems to fix the immediate 
>> problem.
> 
> Oh, there was a new patch yesterday. Too bad I wasn't CCed on that.
> 
Oops...I just realized that you weren't included in the CC list. I had 
been using the send script which referencing the get_maintainer.pl list 
from the initial RFC, and I sincerely apologize for the oversight. I 
have already submitted three versions and would greatly appreciate your 
review.

RFC v1：
https://lore.kernel.org/all/20250521092503.3116340-1-pulehui@huaweicloud.com/

RFC v2:
https://lore.kernel.org/all/20250527132351.2050820-1-pulehui@huaweicloud.com/

v1:
https://lore.kernel.org/all/20250529155650.4017699-1-pulehui@huaweicloud.com/

