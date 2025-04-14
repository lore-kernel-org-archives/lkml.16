Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 268BC1624E9
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 02:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744597775; cv=none; b=JXHCRd/03gNVqutB8SKJio+x6Z9G53C2ASwk7mkiQ6Nqp13id66F4Oda7+ePNkHZ+aCkKhrbiXNge/UAMYpaJVOVGaoVubnabekkQc4H7V7ICZy8RwEh5R4xWQYSmTWW+5LTMl0g8Buu0ZGg2X1+VIyHz7ThK6LYSrXhjhM2cX8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744597775; c=relaxed/simple;
	bh=duUdqV/PyusSf4IrhTIyC8v5JbWgR40LB41+sVv0tUs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EmkQp0PqlqWCu3WjYWOvWIzoQkqYcJlR1EPfNeV9M7H2l3MEEOfCJvr8ygFl6V9HqFktY1MoNxdE2gA6HOkzZLxg/N7dC/pqFlkLLkCGpjnO10zQbWWTc8mO/V11FvEhM0weMhtIESNVtunOA9MNocoEKNn8XjBEiH9aqn5s4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Exx7YzVs; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Exx7YzVs"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3912ebb8e88so184503f8f.0
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 19:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744597769; x=1745202569; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hR0gizsErti/TGxroMR8utxXV6Vg5v4cpuJKOHjP578=;
        b=Exx7YzVsHGZC9VNeVjbEHmP6PMLO25U0I4Vqhqa2PqWbR/iSgMi3sVLVPJ/aDnF4pV
         Zye16m+1CIun4bDGjOGJJL6BuJAglbf0N36ZfWUTVmJyZS1b331T9yYksCMqrPw5bA4k
         7yiuJ/oqV6F1EeIab+lBgoq50y53wPRc/ba3xRot1HTLJbXLvhsnP0t1dLn4aH5ryVuT
         iTw5BXDXJY4e10zTH+PBGRsE8Pt91461+i1XI1IsaEKg0/xD6n4P5jdLgqHz6+JHANsK
         j1QGcefcuI40PcwC9bG1xTCgAiakfi+pKjlwlGgNwuFEkpxbbXt1INAWqq2ac7k03awd
         irhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744597769; x=1745202569;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hR0gizsErti/TGxroMR8utxXV6Vg5v4cpuJKOHjP578=;
        b=vpLc/oNWdpthVtjWev9CSyFNIlgazFrlR5M7AcLhZf66eqOEU2jiC6V15SHtdWqrkp
         kXlWmY/VLUH810aWgqAwwwRqERAcMyW3wAo24YXkDv7JId6aFfVyPMlRlw1ByRSQh91j
         VzKefQedioBhWayZRG2JjWE4a1leJsuk4fkp7ukBiKnSHuVC8dor6sJwxFJqaPDqbJJk
         k7JLXkUQEvKvNtlgQFH2DoVIBLnFDpkn/VQFpOdGAn7Ar45FcGalNQ9pii9Gd93ujavH
         dYQAwSI5JKlX5QEJUKonFKOHJHuwWFWSwaHOvl4n5eDbJtqovuGNz3IaO3xQQuD7abKU
         jLkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDqi/w3wf83yiYlfooJCO5nyDrNfp5TU258zK0C/r4h8L3LuV0983sJmdHlhrDDNARDfy8r+SOJVj1WaA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywdt7CcFVDR6f83JvfGigzbhpQYb+tKuXcEXUweka0Y9skX4qFE
	flIWSn+jOk7GCzx4nF4G3SJ73kOp5ppG9qO/jqifdvz9+mo5BaXBZFDogLOfskk=
X-Gm-Gg: ASbGnctMebm8Hl7xQYZ0BcCBqUKfrC6wg3E84xBNGtl78AqluktIthRGO0y8U8xAKE2
	jPVWjAeT3jfGaKp4xSdzEPyX9QZuFlLfwxPfHxxTqowUMpHfAblvD6OCCyrCCU8SrNNnzXLNJtt
	vtZu3R0G0kynYMrje9kn1Wh4r8n2QPFXBDxByk7ehKPrB0HVCo9TM/4scCV9Le3diITi5YMkkJU
	mfv21Iqkex+Gwze+pX/RO+PE0X+z8xj/0ZDEUZAAGGjgMBUubaKTeL75NkLWaqODOot+kVVHDGA
	n8B8jNqeRQ+f8aULX/a9ChMzYxo8jhJURw7grrGzm7XGacY=
X-Google-Smtp-Source: AGHT+IFmUpcwPvEBGN8XjxBXwOtk2acq8URqHo+Q36iwySwg1DCxzO2m9xibFGCavUkHKNEgnyHH+w==
X-Received: by 2002:a05:6000:2484:b0:39c:1258:2c32 with SMTP id ffacd0b85a97d-39ec37565b1mr2676998f8f.16.1744597769246;
        Sun, 13 Apr 2025 19:29:29 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a11d2654sm8369962a12.35.2025.04.13.19.29.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 19:29:28 -0700 (PDT)
Message-ID: <b8c3e32e-02d8-4f80-8c2c-5bad9a31ac59@suse.com>
Date: Mon, 14 Apr 2025 10:29:24 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ocfs2: fix the issue with discontiguous allocation in
 the global_bitmap
To: Joseph Qi <joseph.qi@linux.alibaba.com>, akpm <akpm@linux-foundation.org>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 gautham.ananthakrishna@oracle.com
References: <20250408152311.16196-1-heming.zhao@suse.com>
 <20250408152311.16196-2-heming.zhao@suse.com>
 <d48df38c-ff38-45c2-b941-8f51990e4699@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <d48df38c-ff38-45c2-b941-8f51990e4699@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joseph & Andrew,

On 4/13/25 09:06, Joseph Qi wrote:
> 
> 
> On 2025/4/8 23:23, Heming Zhao wrote:
>> The commit 4eb7b93e0310 ("ocfs2: improve write IO performance when
>> fragmentation is high") introduced another regression.
>>
>> The following ocfs2-test case can trigger this issue:
>>> ${RESV_UNWRITTEN_BIN} -f ${WORK_PLACE}/large_testfile -s 0 -l \
>>> $((${FILE_MAJOR_SIZE_M}*1024*1024))
>>
>> In my env, test disk size (by "fdisk -l <dev>"):
>>> 53687091200 bytes, 104857600 sectors.
>>
>> Above command is:
>>> /usr/local/ocfs2-test/bin/resv_unwritten -f \
>>> /mnt/ocfs2/ocfs2-activate-discontig-bg-dir/large_testfile -s 0 -l \
>>> 53187969024
>>
>> Error log:
>>> [*] Reserve 50724M space for a LARGE file, reserve 200M space for future test.
>>> ioctl error 28: "No space left on device"
>>> resv allocation failed Unknown error -1
>>> reserve unwritten region from 0 to 53187969024.
>>
>> Call flow:
>> __ocfs2_change_file_space //by ioctl OCFS2_IOC_RESVSP64
>>   ocfs2_allocate_unwritten_extents //start:0 len:53187969024
>>    while()
>>     + ocfs2_get_clusters //cpos:0, alloc_size:1623168 (cluster number)
>>     + ocfs2_extend_allocation
>>       + ocfs2_lock_allocators
>>       |  + choose OCFS2_AC_USE_MAIN & ocfs2_cluster_group_search
>>       |
>>       + ocfs2_add_inode_data
>>          ocfs2_add_clusters_in_btree
>>           __ocfs2_claim_clusters
>>            ocfs2_claim_suballoc_bits
>>            + During the allocation of the final part of the large file
>> 	    (around 47GB), no chain had the required contiguous
>>              bits_wanted. Consequently, the allocation failed.
>>
>> How to fix:
>> When OCFS2 is encountering fragmented allocation, the file system should
>> stop attempting bits_wanted contiguous allocation and instead provide the
>> largest available contiguous free bits from the cluster groups.
>>
>> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
>> Fixes: 4eb7b93e0310 ("ocfs2: improve write IO performance when fragmentation is high")
>> ---
>>   fs/ocfs2/suballoc.c | 36 +++++++++++++++++++++++++++++-------
>>   1 file changed, 29 insertions(+), 7 deletions(-)
>>
>> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
>> index fde75f2af37a..2e1689fc6cf7 100644
>> --- a/fs/ocfs2/suballoc.c
>> +++ b/fs/ocfs2/suballoc.c
>> @@ -1796,6 +1796,7 @@ static int ocfs2_search_chain(struct ocfs2_alloc_context *ac,
>>   {
>>   	int status;
>>   	u16 chain;
>> +	u32 contig_bits;
>>   	u64 next_group;
>>   	struct inode *alloc_inode = ac->ac_inode;
>>   	struct buffer_head *group_bh = NULL;
>> @@ -1821,10 +1822,23 @@ static int ocfs2_search_chain(struct ocfs2_alloc_context *ac,
>>   	status = -ENOSPC;
>>   	/* for now, the chain search is a bit simplistic. We just use
>>   	 * the 1st group with any empty bits. */
>> -	while ((status = ac->ac_group_search(alloc_inode, group_bh,
>> -					     bits_wanted, min_bits,
>> -					     ac->ac_max_block,
>> -					     res)) == -ENOSPC) {
>> +	while (1) {
>> +		if (ac->ac_which == OCFS2_AC_USE_MAIN_DISCONTIG) {
>> +			contig_bits = le16_to_cpu(bg->bg_contig_free_bits);
>> +			if (!contig_bits)
>> +				contig_bits = ocfs2_find_max_contig_free_bits(bg->bg_bitmap,
>> +						le16_to_cpu(bg->bg_bits), 0);
>> +			if (bits_wanted > contig_bits)
>> +				bits_wanted = contig_bits;
>> +			if (bits_wanted < min_bits)
>> +				bits_wanted = min_bits;
> 
> This seems only valid when bits_wanted changed?
> 
> BTW, the previous fix hasn't been merged yet:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/fs/ocfs2?h=next-20250411&id=767ba8b7cba3ca7a560d632f267f7aea35d54810
> 
> So should we drop that first and fold it into a whole one?

Thanks for the reminder, I rechecked the ocfs2-test cases.
In my view, in Gautham's patch, the analysis is wrong.
the call stack isn't from ocfs2_mkdir(), the correct one should be
OCFS2_IOC_RESVSP64.

Let's recall the first patch, and let me resend the v2 patch with a whole one.

- Heming
