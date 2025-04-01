Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 749294501A
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 13:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743515420; cv=none; b=J+ZRvjjnaExSluMcIU8ofAcWX1REOPbOOq3tYEqdKy6jZquVMR+K0Y3XyqgszNM8+g4IuegD5YMLnSsl0uA8R9zmjvmBkX5PPVFCSUd+s/TT1blej3MryEcDnRy4l1Qd/lw5iItiWscNCbbBfLRr+vi9Nl0oDmAyQ67OtMvF4XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743515420; c=relaxed/simple;
	bh=kxYpSXKSKJucMKz3E/8MQnh+WsHDCdZkUei+bUW3CYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iG7GMd6WqPNBsXl3EBdKOG24r2+vttG3aeb5720B28TEy2jaPjrEY79vhkVmShAWHKircMxjPibC5MTK0hkrPlczJvWLaZBdXg1XCiZGEXrRd/DiY6f2zKbqopXfb5JtbXhVd0ZgzV7h7SicdEJsmsuBqtwdwN9sQtlyCA0riyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=deqBQyvE; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="deqBQyvE"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39973c72e8cso625449f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 06:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1743515416; x=1744120216; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9P+fF9fpYpfTVx5gCe9hfT4nuifVBl/K7xkHGPdzgJA=;
        b=deqBQyvEywj4gCEoiY2P7lK8sNWBfl7rKKg5OC5PmrpOWnSvWwZspx0U8zePqseVvE
         9LozthMqKDvUO0h5gW5KJUM1/8Rsh6i1VlMxKj1wxTPGlZ7KOwkVUYGJDchg5Y5DSRQD
         O9BetecQM6tZLeSXIgaUinfRu0ybEvHx1qF4+dNUb689s9RKMsMfU9+1aFmjjobMbR3i
         HU6zJgsXJ9dxSd/CDX28lAZbFeOVoOBS5F1h2xNGJ3TsbFgimuFCEyTYGqScTy/phmwl
         3nb0AjpY0jK8WZpKvbH63XsI+dMaMKYZxhTjuzrJzPhzfuQrMNeQJ0tcuH7GAi02DhwZ
         Iz7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743515416; x=1744120216;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9P+fF9fpYpfTVx5gCe9hfT4nuifVBl/K7xkHGPdzgJA=;
        b=TI1HanCcVpb9/KCmoLC1Tm6ENEwHckP2Yk+sl3s+7F3MDRpUrMgZujdL14lx+olexo
         w7xgZQpAdSzq6HKeiS6YSW1jjQ18HrradiO3MPTi9EhXV0PNmnqyadiRYRxkdldK+bn9
         I6PhDRIY1Y9I+S+aWnNoVmxEnBeb38fLRsqEbvTSK9lIfb0PKUFOmsYCkjqlX31GxdUL
         Ytm6aaBmCD4mRUZL20XPmHMCfLVfOYo73/0iT3MmwAW6LDBQ9WGu62ptLAuBjAV699Yc
         eyP+Wmfhp+Pd49zpPkM5+I2pM5J7ILIHpSnu/IvVOBeVh19tubod6tR1ubOHBcAXIIlH
         lPDw==
X-Forwarded-Encrypted: i=1; AJvYcCUh7vez80YjJr3Dt5kOopjtcINcwDpjuUHLlARqG/B4V63YzaucgQ/szk6A226W/4+TiRuB5nBGoFC1Av4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwVLUkPc8oTkJdJU+t+UBT6CJIOejumCAIvWqLAY/6bHR4RJ3BX
	CkscFwswZftF9UVLfMK926N7Ph6rTd+HnTfA1NB3lRpn0Xm+zu2fY14UTM4YcYHpw9z/Do8QKjM
	g
X-Gm-Gg: ASbGncsNlTcCdpb6VBp2f959LSPJTbHf7JfscbRw44PPmiwTwoaAb7BRKFWJh6WBL0C
	rsYqgRq9IQBPEAm4hx5Q+KKAPUjRI4A+gm6CHgq5wCoMfppeNRiTbf4+c7n7m6UMXaTrQZCqkRS
	lALW1Geh5Bc/5af7K065ba8atjCK2doGjkA5Z38abPZbTVpcRDPoHKJaJ7jZKKEtDuYHXs5uPJK
	Up4Wa2FVN+9ZpXc+33l78zM3c8iM9hPTvvJMF2T9aPA2Wal9YudsG3R31/xmuAr9ywoB7GzcTBb
	Yza693rhhdXP/oFQK4n4cvPTlqt80LN3zjCuu5h7rzAAnc84fkg=
X-Google-Smtp-Source: AGHT+IFeEH9jhZKwnr8x3ZJJJBnIE5gNVWdGiYPe1dVwHat7xiN7bnIbTqFyoY3d6SJVvNKsmqRNhA==
X-Received: by 2002:a05:6000:1acd:b0:39a:be16:9f1e with SMTP id ffacd0b85a97d-39c247401d2mr718292f8f.12.1743515415643;
        Tue, 01 Apr 2025 06:50:15 -0700 (PDT)
Received: from [10.202.112.30] ([202.127.77.110])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739710d4761sm8870404b3a.167.2025.04.01.06.50.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 06:50:15 -0700 (PDT)
Message-ID: <590fe587-0df7-4aa4-a8c0-b9120d658f6f@suse.com>
Date: Tue, 1 Apr 2025 21:50:10 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ocfs2: fixing global bitmap allocating failure for
 discontig type
To: Joseph Qi <joseph.qi@linux.alibaba.com>
Cc: ocfs2-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 gautham.ananthakrishna@oracle.com
References: <20250327062209.19201-1-heming.zhao@suse.com>
 <e1014674-51a4-4d40-9bc9-0906ffbeadac@linux.alibaba.com>
From: Heming Zhao <heming.zhao@suse.com>
Content-Language: en-US
In-Reply-To: <e1014674-51a4-4d40-9bc9-0906ffbeadac@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/1/25 19:38, Joseph Qi wrote:
> 
> 
> On 2025/3/27 14:22, Heming Zhao wrote:
>> The commit 4eb7b93e0310 ("ocfs2: improve write IO performance when
>> fragmentation is high") introduced a regression. In the discontiguous
>> extent allocation case, ocfs2_cluster_group_search() is comparing with
>> the wrong target length, which causes allocation failure.
>>
>> Call stack:
>> ocfs2_mkdir()
>>   ocfs2_reserve_new_inode()
>>    ocfs2_reserve_suballoc_bits()
>>     ocfs2_block_group_alloc()
>>      ocfs2_block_group_alloc_discontig()
>>       __ocfs2_claim_clusters()
>>        ocfs2_claim_suballoc_bits()
>>         ocfs2_search_chain()
>>          ocfs2_cluster_group_search()
>>
>> Reported-by: Gautham Ananthakrishna <gautham.ananthakrishna@oracle.com>
>> Fixes: 4eb7b93e0310 ("ocfs2: improve write IO performance when fragmentation is high")
>> Signed-off-by: Heming Zhao <heming.zhao@suse.com>
>> ---
>>   fs/ocfs2/suballoc.c | 14 +++++++++++---
>>   fs/ocfs2/suballoc.h |  1 +
>>   2 files changed, 12 insertions(+), 3 deletions(-)
>>
>> diff --git a/fs/ocfs2/suballoc.c b/fs/ocfs2/suballoc.c
>> index f7b483f0de2a..3dea082f6e91 100644
>> --- a/fs/ocfs2/suballoc.c
>> +++ b/fs/ocfs2/suballoc.c
>> @@ -698,10 +698,12 @@ static int ocfs2_block_group_alloc(struct ocfs2_super *osb,
>>   
>>   	bg_bh = ocfs2_block_group_alloc_contig(osb, handle, alloc_inode,
>>   					       ac, cl);
>> -	if (PTR_ERR(bg_bh) == -ENOSPC)
>> +	if (PTR_ERR(bg_bh) == -ENOSPC) {
>> +		ac->ac_which = OCFS2_AC_USE_MAIN_DISCONTIG;
>>   		bg_bh = ocfs2_block_group_alloc_discontig(handle,
>>   							  alloc_inode,
>>   							  ac, cl);
>> +	}
>>   	if (IS_ERR(bg_bh)) {
>>   		status = PTR_ERR(bg_bh);
>>   		bg_bh = NULL;
>> @@ -2365,7 +2367,8 @@ int __ocfs2_claim_clusters(handle_t *handle,
>>   	BUG_ON(ac->ac_bits_given >= ac->ac_bits_wanted);
>>   
>>   	BUG_ON(ac->ac_which != OCFS2_AC_USE_LOCAL
>> -	       && ac->ac_which != OCFS2_AC_USE_MAIN);
>> +	       && ac->ac_which != OCFS2_AC_USE_MAIN
>> +	       && ac->ac_which != OCFS2_AC_USE_MAIN_DISCONTIG);
>>   
>>   	if (ac->ac_which == OCFS2_AC_USE_LOCAL) {
>>   		WARN_ON(min_clusters > 1);
>> @@ -2427,7 +2430,12 @@ int ocfs2_claim_clusters(handle_t *handle,
>>   			 u32 *cluster_start,
>>   			 u32 *num_clusters)
>>   {
>> -	unsigned int bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
>> +	unsigned int bits_wanted;
>> +
>> +	if (ac->ac_which == OCFS2_AC_USE_MAIN)
>> +		bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
>> +	else /* ac_which == OCFS2_AC_USE_MAIN_DISCONTIG */
>> +		bits_wanted = min_clusters;
> 
> This looks wried. Why can not be other alloc type?
> 
> Or it seems you intend to:
> 
> unsigned int bits_wanted = ac->ac_bits_wanted - ac->ac_bits_given;
> 
> if (ac->ac_which == OCFS2_AC_USE_MAIN_DISCONTIG)
> 	bits_wanted = min_clusters;
> 
> Thanks,
> Joseph

Yes, you are right.
We should use OCFS2_AC_USE_MAIN_DISCONTIG to handle the special discontig case.
Will send v2 patch for this mistake.

- Heming
> 
>>   
>>   	return __ocfs2_claim_clusters(handle, ac, min_clusters,
>>   				      bits_wanted, cluster_start, num_clusters);
>> diff --git a/fs/ocfs2/suballoc.h b/fs/ocfs2/suballoc.h
>> index b481b834857d..bcf2ed4a8631 100644
>> --- a/fs/ocfs2/suballoc.h
>> +++ b/fs/ocfs2/suballoc.h
>> @@ -29,6 +29,7 @@ struct ocfs2_alloc_context {
>>   #define OCFS2_AC_USE_MAIN  2
>>   #define OCFS2_AC_USE_INODE 3
>>   #define OCFS2_AC_USE_META  4
>> +#define OCFS2_AC_USE_MAIN_DISCONTIG  5
>>   	u32    ac_which;
>>   
>>   	/* these are used by the chain search */
> 

