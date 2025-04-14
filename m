Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA124187876
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 03:32:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744601558; cv=none; b=b9O6EGpws209hzk+c5jUAeQJnDa3eGZh3Hpf3sEUGXP0niNpuZ4N2DvCFwun7dVhh0zLV2O8yMJBujXJw/8sRlvxqzX6kU9DvrZKm5q/F/GsxiajsCUvV7wELEY1RfP++KlfUAF7kpm8KibN+j0WNNfLS6mU+l90r8JaeZQVbCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744601558; c=relaxed/simple;
	bh=HtBRew0JrEvOtBYq4QPsIKQr0DvikryI56JZjDM9q6U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X+uGkCth3+QhrF6moPbEp8khF4c1/J6EsZyfbRoS+oScTJt+W3Ou7bBezyEfkA5l9ptXvXNofN2DzzRwKLsNuAc5RTQMajEbzjQTH29qU4s3uD/O0qgzfdoewyCk5a2yjFuJnf3FUSDFAijXlhTuRIBnlEIXX7ASE1Khi5ZWxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RYtBYAu/; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RYtBYAu/"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43f106a3591so3290715e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:32:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1744601553; x=1745206353; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kxvzAVD+b+K7b2LEXDynHWcZkMZbyWAEc+btpOiEFgY=;
        b=RYtBYAu/tLMOQLs7y2iSt/GKOjtNgLOtxrUDepN76h5+VVplegJcvgiE+zCSrGJa26
         gM76wgA6x5ayomD2GqW7x+rbT2QMc046r3bfkuKzzx4n3yag7FwiXUACxbBX+kz0wTeP
         F7GBITI/cuJcoxxK+0KRXYDBfCnHtbGjK92rS+zvbZbEHhqM//IRlEW+v/lSfbyzLYPk
         2vq8/IBXKKK4KD4FVODdKK+krhnI1tVnGg4Jeu1xvEIxXfqq93W5qpg1l/HqQleKDCSH
         6kUbi0VBi7J59IwamvuHpldvpM/3DCYglBXX3kGyGyW33XaBvf69ZQb9RPDAE74azMT9
         yDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744601553; x=1745206353;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kxvzAVD+b+K7b2LEXDynHWcZkMZbyWAEc+btpOiEFgY=;
        b=Nz7UG16uQAlAJAv7BhzuyiWFjq3njDkbdsUBe0Nx7UTNWSFnO976SpOqr7xgWCuiyJ
         1dR9iBb+ILIhBhdNkufKEU/1spiJo/6Xn6WEK3N0D7MkeeOCNDzXj5dgT3rknjHE1bPB
         4CUKeYu7bkSstv/kNf6MrGODDnBJvHEhVg3nIWPUcsml0/ZjBcw0OkJ9wORhzA3tifa6
         reV14KUWYwlDqi99eV4sN3roH/+jeuCCVjmEVe+z9f3nRXw1Gug6RtBV4Ik7HPQSUMAx
         YkhLUuauYWSenFIiYTbyPIpPBoTHE94Q5pCP+Ajtb+IQpbPBetmbPvkYWHNBxatUs1Gk
         Bfcg==
X-Forwarded-Encrypted: i=1; AJvYcCXS1P4oJPyCUQTT7HbKlPwXME6xR/ZjyOUjS2VkVOdyFBYY7Tb7dNvvxMoTI/97fP/cMLxZ8Kj/udGDLhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRAYnDIfuWLdE79QleeaJpSWystvs4MNVWSNKBd6UGF2bd2+Cs
	O1Eak5L5B/UViv/NXQM+Q3ukSlhTitk5eA3w1ZKW8QiGDynSCoTI2MguPTk+Cec=
X-Gm-Gg: ASbGncsYKXG7PfUDI3olwEPgZ3rb9tum8lT3ekqy/ZuBWhLo921frfQfNKQPU6nhytG
	/I9RPkMImcP6IXTWcayShsX8MiAgathTK1jFhh4RsoCxRcpZYL0Z2ZhqeasuBeIg6m2PKRHL4A2
	ANn+lwbbaAEOjc4Tjylsu5Hx50d2v3NhMDHm88pb8N/SJA5dFWLPq7iCQT6IB9azj2FsK0WHFRa
	WZEm7gzbNLejNgtv9A9/pdv6XR4l07mXglksJHNm55DN4/E4JyI5X5m851fOZ8+ohQQusvK6Wxi
	nW5mDEuT3bKMrMS0sIvMpkTH6eG/dp5Dpq7TPHdL+4HpcPs=
X-Google-Smtp-Source: AGHT+IH9FkFVmN72NScAmq1zaLdvdfVAUzzhsAs0uyDSeninS3qW8FoG2MiHfljiAzxIPGlcXl0EzQ==
X-Received: by 2002:a05:6000:2504:b0:385:de67:229e with SMTP id ffacd0b85a97d-39eaaec374dmr2807309f8f.11.1744601552828;
        Sun, 13 Apr 2025 20:32:32 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd219d98bsm5861828b3a.11.2025.04.13.20.32.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 20:32:32 -0700 (PDT)
Message-ID: <7241eee3-8d6b-4034-a124-c04e9d06614a@suse.com>
Date: Mon, 14 Apr 2025 11:32:29 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] ocfs2: fix the issue with discontiguous allocation in
 the global_bitmap
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 akpm <akpm@linux-foundation.org>, gautham.ananthakrishna@oracle.com
References: <20250408152311.16196-1-heming.zhao@suse.com>
 <20250408152311.16196-2-heming.zhao@suse.com>
 <d48df38c-ff38-45c2-b941-8f51990e4699@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <d48df38c-ff38-45c2-b941-8f51990e4699@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Joseph,

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

Good catch. the correct style:

if (bits_wanted > contig_bits && contig_bits > min_bits)
         bits_wanted = contig_bits;

- Heming

> 
> BTW, the previous fix hasn't been merged yet:
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/fs/ocfs2?h=next-20250411&id=767ba8b7cba3ca7a560d632f267f7aea35d54810
> 
> So should we drop that first and fold it into a whole one?
> 
> Thanks,
> Joseph
