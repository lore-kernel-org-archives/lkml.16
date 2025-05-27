Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com [45.249.212.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBEDC27FB31
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 16:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748363756; cv=none; b=ruGXCG19uk4OMohlBmTsFgXCQJpemI/wizr2rHEwosb8dOudkBzltc+kWN8rmwlfuZuAP64OrPoDqz6hharTfqhLUitbah5rtL43Wu0YY5RwtETD8f7fpqyvtIccMTBgul878Mcl592SDto9OkSCPEnJUeDU6BrfmxBAdZynAEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748363756; c=relaxed/simple;
	bh=Zgi5wMYTKsRlTdoE9A101cAF42WsweY9EFhwvrNSEyc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EsXxJ6NJcPRXt96b/Vnw17iDQ7tZvovUvHir7L92ZbwMCLVzuyFYq4yY2MeFNw5pDeSFgwPjdMRAyzbSfirrfIuj3eCRfHqncBXaP3KOerAlRL9knyd8xZ/pYaadAOiQlI6rzbiT+ijSBvOQYU76Em230sXps22nVgcxLIjoniQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com; spf=pass smtp.mailfrom=huaweicloud.com; arc=none smtp.client-ip=45.249.212.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=huaweicloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huaweicloud.com
Received: from mail.maildlp.com (unknown [172.19.93.142])
	by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4b6JCL0J6Tz4f3jd9
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:35:26 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.252])
	by mail.maildlp.com (Postfix) with ESMTP id 501CC1A018D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 00:35:51 +0800 (CST)
Received: from [10.67.109.184] (unknown [10.67.109.184])
	by APP3 (Coremail) with SMTP id _Ch0CgC3CMPm6TVoloXvNQ--.37494S2;
	Wed, 28 May 2025 00:35:51 +0800 (CST)
Message-ID: <dba2601d-5e11-447c-946f-0717478f6ffa@huaweicloud.com>
Date: Wed, 28 May 2025 00:35:50 +0800
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
To: Oleg Nesterov <oleg@redhat.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
 Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
 jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, pulehui@huawei.com
References: <20250527132351.2050820-1-pulehui@huaweicloud.com>
 <20250527132351.2050820-2-pulehui@huaweicloud.com>
 <20250527153007.GD8333@redhat.com>
From: Pu Lehui <pulehui@huaweicloud.com>
In-Reply-To: <20250527153007.GD8333@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_Ch0CgC3CMPm6TVoloXvNQ--.37494S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JryfCF4fGw47GFyftr1xAFb_yoWfurgE9w
	nFkrykWryUWr1Yq3W7Xan2yr4qg3W5GF1UJ3s8X342grn8Xan8Cr45X34rtry8GFs2vrnI
	9FyUX3y5ur1a9jkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbIxYFVCjjxCrM7AC8VAFwI0_Gr0_Xr1l1xkIjI8I6I8E6xAIw20E
	Y4v20xvaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwV
	A0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x02
	67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7
	CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAq
	x4xG6I80ewAv7VC0I7IYx2IY67AKxVWUXVWUAwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6x
	CaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JM4IIrI8v6xkF7I0E8cxan2IY04v7MxkF7I0E
	n4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I
	0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWU
	tVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAF
	wI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa
	7IU10PfPUUUUU==
X-CM-SenderInfo: psxovxtxl6x35dzhxuhorxvhhfrp/



On 2025/5/27 23:30, Oleg Nesterov wrote:
> Not that this is really important, but the test-case looks broken,
> 
> On 05/27, Pu Lehui wrote:
>>
>> #define _GNU_SOURCE
>> #include <fcntl.h>
>> #include <unistd.h>
>> #include <syscall.h>
>> #include <sys/mman.h>
>> #include <linux/perf_event.h>
>>
>> int main(int argc, char *argv[])
>> {
>>      int fd = open(FNAME, O_RDWR|O_CREAT, 0600);
> 
> FNAME is not defined
> 
>>      struct perf_event_attr attr = {
>>          .type = 9,
> 
> Cough ;) Yes I too used perf_event_attr.type == 9 when I wrote another
> test-case. Because I am lazy and this is what I see in
> /sys/bus/event_source/devices/uprobe/type on my machine.
> 
> But me should not assume that perf_pmu_register(&perf_uprobe) -> idr_alloc()
> will return 9.
> 
>>      write(fd, "x", 1);
> 
> looks unnecessary.
> 
> Oleg.

Oops...Thanks Oleg, I think I should thoroughly verify it. Perhaps I 
shouldn't be working on patches so late at night.🥱

