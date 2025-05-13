Received: from out30-99.freemail.mail.aliyun.com (out30-99.freemail.mail.aliyun.com [115.124.30.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76FAB1E47BA
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 06:06:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747116417; cv=none; b=ULXwiPp5tJcNXKf/RETieSLbDoiGkuQE5IX02JkZ+jeGakmSd//BoW/+ePht08PkzbL7ra8x/8Ia+7vrl7zROAToNXA7MfoyY7/nuyXPo6gNzryy0JQ+3PcRAsKD9wyzWUtw0olXZebOcFoGhd70PeejqxuhZ9EzApAyJp2swLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747116417; c=relaxed/simple;
	bh=HlnGcNmsBXS7NICS76hHGOoW9gRPbN+aLVrm8YGH8Eo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JV8EEZjttHSUdDB+zI66W8MnuneH9dX/AJ+Qh0ptE7I7ck1OwRPObxFY1LPWr3oI4jb+KJXw76NnlDUW/a0Jce1jxDUj16QJm7PH3Y/fVn05oS6kMiHM4AAs544iQA9jV874Qu05pAarSDl8q5zHFj77BCYy1rqyh7O+oFpksqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=P4RKUP/c; arc=none smtp.client-ip=115.124.30.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="P4RKUP/c"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747116404; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=fUPTQE19Sg3GsFNuknlANEEVIykzFfRofXNpKO+DKkU=;
	b=P4RKUP/cAbsaulk1DcRY2lnt0kd1/h0zmxpfqlIQA0arM5eDiB79E+GagQQc6HkNN1rDJ1szBLRToZ1+Khf6qaLwrUlGVq0ax3vUldAYyHoalQ4M3xQrmgUDhmNH7tumqmgBzt46u8jty7RnoGNsrQ2Zodyr4Rp/FBbIlTay3nY=
Received: from 30.74.144.114(mailfrom:baolin.wang@linux.alibaba.com fp:SMTPD_---0WaULMRz_1747116401 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 13 May 2025 14:06:42 +0800
Message-ID: <f671e835-5cc2-4f1f-987d-b71b446c2275@linux.alibaba.com>
Date: Tue, 13 May 2025 14:06:41 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] mm: khugepaged: decouple SHMEM and file folios'
 collapse
To: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, npache@redhat.com,
 ryan.roberts@arm.com, dev.jain@arm.com, ziy@nvidia.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <fbdbb35301219f8fef5697006b58d82b045114f5.1747019851.git.baolin.wang@linux.alibaba.com>
 <5d5e50f1-ee5d-4fca-8d7a-31482a8482bb@redhat.com>
From: Baolin Wang <baolin.wang@linux.alibaba.com>
In-Reply-To: <5d5e50f1-ee5d-4fca-8d7a-31482a8482bb@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 2025/5/12 16:08, David Hildenbrand wrote:
>>   static unsigned int khugepaged_scan_mm_slot(unsigned int pages, int 
>> *result,
>>                           struct collapse_control *cc)
>> @@ -2436,7 +2427,7 @@ static unsigned int 
>> khugepaged_scan_mm_slot(unsigned int pages, int *result,
>>               VM_BUG_ON(khugepaged_scan.address < hstart ||
>>                     khugepaged_scan.address + HPAGE_PMD_SIZE >
>>                     hend);
>> -            if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
>> +            if (!vma_is_anonymous(vma)) {
>>                   struct file *file = get_file(vma->vm_file);
>>                   pgoff_t pgoff = linear_page_index(vma,
>>                           khugepaged_scan.address);
>> @@ -2782,7 +2773,7 @@ int madvise_collapse(struct vm_area_struct *vma, 
>> struct vm_area_struct **prev,
>>           mmap_assert_locked(mm);
>>           memset(cc->node_load, 0, sizeof(cc->node_load));
>>           nodes_clear(cc->alloc_nmask);
>> -        if (IS_ENABLED(CONFIG_SHMEM) && !vma_is_anonymous(vma)) {
>> +        if (!vma_is_anonymous(vma)) {
>>               struct file *file = get_file(vma->vm_file);
>>               pgoff_t pgoff = linear_page_index(vma, addr);
> 
> Yeah, I've been complaining about these checks for too long :)

Yes, I know:)

> I assume this is fine

I tested khugepaged selftest, and no issues found.

> Acked-by: David Hildenbrand <david@redhat.com>

Thanks.
