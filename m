Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 844CB2343C0
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 10:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744022851; cv=none; b=GnJyZ9dN0wdUwLRT7AljIKB3CZO7ncY5ekM5CPUNfFfJiBMgE15ONbCeGXYOLHRpiNApTvcmKnGQfA9S297j1M1Resvr80i3oPRtzJxTAFwcbjkkgbSPr5eAoeLnjl6HsUJDRHFfuf5/DdBsL/Qz2E5nr/lwY9DNWc3nBGHzpWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744022851; c=relaxed/simple;
	bh=tQPS/8IV2CQ/su+cnht2pBG/aOHRN9fAOTeUAv1B4kU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d00YxsfBX6SKI0eAvSiKBfLIMZMxNtN6yMqCTeDy41giwmUC2kz1lL21Snq0FVVRlL3/NMjku3q+AhuhyMVbQyxl3SGfjPEGeQT9chBKKzh82mhEAc3MX2WTtjPa645rH7Zot86IGmHCrKAihxibBqi3zT4+l+6G8UP9i+tOqWA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BsmtbRxA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BsmtbRxA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744022848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p5WvegW14BicmFVOaxVbVa9+TlojjI8sm0GtsJZYUhI=;
	b=BsmtbRxAAaW4d9atUHxuQqRfEzULJcXQj5zvORCob42e2NrAJcm7aVj+oePAlh+yRh6jaI
	CbpBYOZNK4hMxyA0sKiTYHm7wao8E5MypnmtEduFfeC9ibTf3VoJF5UEr9m2iE+t/sk+KG
	mHrqIOEHFzX/m/8vdeLWcdAiV7BPJmY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-C3TTxlIuMMKq8v20S4ssCA-1; Mon, 07 Apr 2025 06:47:27 -0400
X-MC-Unique: C3TTxlIuMMKq8v20S4ssCA-1
X-Mimecast-MFC-AGG-ID: C3TTxlIuMMKq8v20S4ssCA_1744022846
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-391345e3aa3so2438244f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 03:47:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744022846; x=1744627646;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p5WvegW14BicmFVOaxVbVa9+TlojjI8sm0GtsJZYUhI=;
        b=t//QL9vnfy9dln3Se+qj8fdfZ8ErFvQoruec/cu5L6Zb8sqwVlYlcvBQhFVCXO7P6R
         g1oLV93R/ixibhrIiROAZ97GQEEFNfDCgZzvKvVSl2WUoFomF/d67Vq+5jWYEbYggnL7
         qvbi19kfW80Zv3MbTDZxkkGOW2AyEKqpiE2781NnXOTU0ta+KuaV+6vAEXRKfQPQWrwa
         ZaMEYkzf4tpNCXSmhSiGzP/iRHx8r+/dWxcu8A7hPzOZmOLx0HddupFoAQg8AnxOPGzH
         zykb9xJdnTozgl8rWvG/Dxts5MvHQc2WuUSHg4iNx3buiKKkfsJhVp5USNVJRicq/WYd
         aerQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvQY5NWT5Ls4YZrU5kRVBLDVBdLVcjtsKtuOshVGozcWpjAwLfl7mZLH7IDdCeiGnlfMHlyynN4wx9/cQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJO66twjbaYxzXaz2laEhu3b/PekMDsRposukBAFv8nU3Cs56R
	FJloROzAW9KE1XRrstE9bsYYpgBJXL3UJfPyQu1eVw6vUdtymzh/39P63LKQN8ZoSgFCOSOoe1W
	6dIfaXXDEa0NcGULjWN78M0gDMW0khup+7Lok0Y1wrtaEMcScsCB/AYaMk8O6iQ==
X-Gm-Gg: ASbGnctlWPmu6bvA6dKVxzh19H8Gga3jYz/0M3qK2afRFj8KzfjKXotCSQQ2jYBNNJG
	MUjufAVm6UDabxYFIikwn3rP0czRLOU2NGGldlEx/qFUt+m8pCJppVTV0fS7V8dHYoDuA+KigOF
	vJwKxp22KBI9uIWT6ydUlmHkAoSAAXDHfcznIWRYvNkrx4YRsVh9K9RAN4v2ZjrylSaFwbkAlPM
	XPNDMce0bAU5gy5rU0+0cm7myZRYCr9Ru3gM/ezDlf0L3c9Z5V0w/DlVpvF/+8igY4ot91zuoIk
	wFciH2PXof0MG1aw9+qf6K4MaJjFacf4rNc3OMergz0a
X-Received: by 2002:a5d:648c:0:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39d6fc48d22mr6333075f8f.14.1744022845795;
        Mon, 07 Apr 2025 03:47:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGcZwpMMV74k2xAExUYyBT36I7Zk5hVYn4ciKcjdpgmZy94eGv8XAzLYfRPs6dLjDpDsSW5Ew==
X-Received: by 2002:a5d:648c:0:b0:38d:d0ca:fbad with SMTP id ffacd0b85a97d-39d6fc48d22mr6333029f8f.14.1744022845286;
        Mon, 07 Apr 2025 03:47:25 -0700 (PDT)
Received: from [192.168.3.141] (p5b0c6a16.dip0.t-ipconnect.de. [91.12.106.22])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c300968cfsm11847622f8f.16.2025.04.07.03.47.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 03:47:24 -0700 (PDT)
Message-ID: <e69e6f79-f05b-47d5-8f04-36908e357fff@redhat.com>
Date: Mon, 7 Apr 2025 12:47:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/3] mm/mempolicy: Support memory hotplug in weighted
 interleave
To: Rakie Kim <rakie.kim@sk.com>
Cc: gourry@gourry.net, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org, joshua.hahnjy@gmail.com,
 dan.j.williams@intel.com, ying.huang@linux.alibaba.com,
 Jonathan.Cameron@huawei.com, osalvador@suse.de, kernel_team@skhynix.com,
 honggyu.kim@sk.com, yunjeong.mun@sk.com, akpm@linux-foundation.org
References: <20250407093926.450-1-rakie.kim@sk.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250407093926.450-1-rakie.kim@sk.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.04.25 11:39, Rakie Kim wrote:
> On Fri, 4 Apr 2025 22:45:00 +0200 David Hildenbrand <david@redhat.com> wrote:
>> On 04.04.25 09:46, Rakie Kim wrote:
>>> The weighted interleave policy distributes page allocations across multiple
>>> NUMA nodes based on their performance weight, thereby improving memory
>>> bandwidth utilization. The weight values for each node are configured
>>> through sysfs.
>>>
>>> Previously, sysfs entries for configuring weighted interleave were created
>>> for all possible nodes (N_POSSIBLE) at initialization, including nodes that
>>> might not have memory. However, not all nodes in N_POSSIBLE are usable at
>>> runtime, as some may remain memoryless or offline.
>>> This led to sysfs entries being created for unusable nodes, causing
>>> potential misconfiguration issues.
>>>
>>> To address this issue, this patch modifies the sysfs creation logic to:
>>> 1) Limit sysfs entries to nodes that are online and have memory, avoiding
>>>      the creation of sysfs entries for nodes that cannot be used.
>>> 2) Support memory hotplug by dynamically adding and removing sysfs entries
>>>      based on whether a node transitions into or out of the N_MEMORY state.
>>>
>>> Additionally, the patch ensures that sysfs attributes are properly managed
>>> when nodes go offline, preventing stale or redundant entries from persisting
>>> in the system.
>>>
>>> By making these changes, the weighted interleave policy now manages its
>>> sysfs entries more efficiently, ensuring that only relevant nodes are
>>> considered for interleaving, and dynamically adapting to memory hotplug
>>> events.
>>>
>>> Signed-off-by: Rakie Kim <rakie.kim@sk.com>
>>> Signed-off-by: Honggyu Kim <honggyu.kim@sk.com>
>>> Signed-off-by: Yunjeong Mun <yunjeong.mun@sk.com>
>>> ---
>>>    mm/mempolicy.c | 109 ++++++++++++++++++++++++++++++++++++++-----------
>>>    1 file changed, 86 insertions(+), 23 deletions(-)
>>>
>>> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
>>> index 73a9405ff352..f25c2c7f8fcf 100644
>>> --- a/mm/mempolicy.c
>>> +++ b/mm/mempolicy.c
>>> @@ -113,6 +113,7 @@
>>>    #include <asm/tlbflush.h>
>>>    #include <asm/tlb.h>
>>>    #include <linux/uaccess.h>
>>> +#include <linux/memory.h>
>>>    
>>>    #include "internal.h"
>>>    
>>> @@ -3390,6 +3391,7 @@ struct iw_node_attr {
>>>    
>>>    struct sysfs_wi_group {
>>>    	struct kobject wi_kobj;
>>> +	struct mutex kobj_lock;
>>>    	struct iw_node_attr *nattrs[];
>>>    };
>>>    
>>> @@ -3439,13 +3441,24 @@ static ssize_t node_store(struct kobject *kobj, struct kobj_attribute *attr,
>>>    
>>>    static void sysfs_wi_node_delete(int nid)
>>>    {
>>> -	if (!wi_group->nattrs[nid])
>>> +	struct iw_node_attr *attr;
>>> +
>>> +	if (nid < 0 || nid >= nr_node_ids)
>>> +		return;
>>> +
>>> +	mutex_lock(&wi_group->kobj_lock);
>>> +	attr = wi_group->nattrs[nid];
>>> +	if (!attr) {
>>> +		mutex_unlock(&wi_group->kobj_lock);
>>>    		return;
>>> +	}
>>> +
>>> +	wi_group->nattrs[nid] = NULL;
>>> +	mutex_unlock(&wi_group->kobj_lock);
>>>    
>>> -	sysfs_remove_file(&wi_group->wi_kobj,
>>> -			  &wi_group->nattrs[nid]->kobj_attr.attr);
>>> -	kfree(wi_group->nattrs[nid]->kobj_attr.attr.name);
>>> -	kfree(wi_group->nattrs[nid]);
>>> +	sysfs_remove_file(&wi_group->wi_kobj, &attr->kobj_attr.attr);
>>> +	kfree(attr->kobj_attr.attr.name);
>>> +	kfree(attr);
>>>    }
>>>    
>>>    static void sysfs_wi_release(struct kobject *wi_kobj)
>>> @@ -3464,35 +3477,80 @@ static const struct kobj_type wi_ktype = {
>>>    
>>>    static int sysfs_wi_node_add(int nid)
>>>    {
>>> -	struct iw_node_attr *node_attr;
>>> +	int ret = 0;
>>>    	char *name;
>>> +	struct iw_node_attr *new_attr = NULL;
>>>    
>>> -	node_attr = kzalloc(sizeof(*node_attr), GFP_KERNEL);
>>> -	if (!node_attr)
>>> +	if (nid < 0 || nid >= nr_node_ids) {
>>> +		pr_err("Invalid node id: %d\n", nid);
>>> +		return -EINVAL;
>>> +	}
>>> +
>>> +	new_attr = kzalloc(sizeof(struct iw_node_attr), GFP_KERNEL);
>>> +	if (!new_attr)
>>>    		return -ENOMEM;
>>>    
>>>    	name = kasprintf(GFP_KERNEL, "node%d", nid);
>>>    	if (!name) {
>>> -		kfree(node_attr);
>>> +		kfree(new_attr);
>>>    		return -ENOMEM;
>>>    	}
>>>    
>>> -	sysfs_attr_init(&node_attr->kobj_attr.attr);
>>> -	node_attr->kobj_attr.attr.name = name;
>>> -	node_attr->kobj_attr.attr.mode = 0644;
>>> -	node_attr->kobj_attr.show = node_show;
>>> -	node_attr->kobj_attr.store = node_store;
>>> -	node_attr->nid = nid;
>>> +	mutex_lock(&wi_group->kobj_lock);
>>> +	if (wi_group->nattrs[nid]) {
>>> +		mutex_unlock(&wi_group->kobj_lock);
>>> +		pr_info("Node [%d] already exists\n", nid);
>>> +		kfree(new_attr);
>>> +		kfree(name);
>>> +		return 0;
>>> +	}
>>> +	wi_group->nattrs[nid] = new_attr;
>>>    
>>> -	if (sysfs_create_file(&wi_group->wi_kobj, &node_attr->kobj_attr.attr)) {
>>> -		kfree(node_attr->kobj_attr.attr.name);
>>> -		kfree(node_attr);
>>> -		pr_err("failed to add attribute to weighted_interleave\n");
>>> -		return -ENOMEM;
>>> +	sysfs_attr_init(&wi_group->nattrs[nid]->kobj_attr.attr);
>>> +	wi_group->nattrs[nid]->kobj_attr.attr.name = name;
>>> +	wi_group->nattrs[nid]->kobj_attr.attr.mode = 0644;
>>> +	wi_group->nattrs[nid]->kobj_attr.show = node_show;
>>> +	wi_group->nattrs[nid]->kobj_attr.store = node_store;
>>> +	wi_group->nattrs[nid]->nid = nid;
>>> +
>>> +	ret = sysfs_create_file(&wi_group->wi_kobj,
>>> +				&wi_group->nattrs[nid]->kobj_attr.attr);
>>> +	if (ret) {
>>> +		kfree(wi_group->nattrs[nid]->kobj_attr.attr.name);
>>> +		kfree(wi_group->nattrs[nid]);
>>> +		wi_group->nattrs[nid] = NULL;
>>> +		pr_err("Failed to add attribute to weighted_interleave: %d\n", ret);
>>>    	}
>>> +	mutex_unlock(&wi_group->kobj_lock);
>>>    
>>> -	wi_group->nattrs[nid] = node_attr;
>>> -	return 0;
>>> +	return ret;
>>> +}
>>> +
>>> +static int wi_node_notifier(struct notifier_block *nb,
>>> +			       unsigned long action, void *data)
>>> +{
>>> +	int err;
>>> +	struct memory_notify *arg = data;
>>> +	int nid = arg->status_change_nid;
>>> +
>>> +	if (nid < 0)
>>> +		goto notifier_end;
>>> +
>>> +	switch(action) {
>>> +	case MEM_ONLINE:
>>
>> MEM_ONLINE is too late, we cannot fail hotplug at that point.
>>
>> Would MEM_GOING_ONLINE / MEM_CANCEL_ONLINE be better?
> 
> Hi David,

Hi,

> 
> Thank you for raising these points. I would appreciate your clarification
> on the following:
> 
> Issue1: I want to invoke sysfs_wi_node_add() after a node with memory
> has been fully transitioned to the online state. Does replacing
> MEM_ONLINE with MEM_GOING_ONLINE or MEM_CANCEL_ONLINE still ensure
> that the node is considered online and usable by that point?

After MEM_GOING_ONLINE nothing can go wrong except that some other 
notifier fails MEM_GOING_ONLINE.

That happens rarely -- only if some other allocation, like for kasan, fails.

In MEM_CANCEL_ONLINE you have to undo what you did (remove the node again).

> 
>>
>>
>>> +		err = sysfs_wi_node_add(nid);
>>> +		if (err) {
>>> +			pr_err("failed to add sysfs [node%d]\n", nid);
>>> +			return NOTIFY_BAD;
>>
>> Note that NOTIFY_BAD includes NOTIFY_STOP_MASK. So you wouldn't call
>> other notifiers, but the overall memory onlining would succeed, which is
>> bad.
>>
>> If we don't care about the error (not prevent hotplug) we could only
>> pr_warn() and continue. Maybe this (unlikely) case is not a good reason
>> to stop memory from getting onlined. OTOH, it will barely ever trigger
>> in practice ...
>>
> 
> Issue2: Regarding your note about NOTIFY_BAD ? are you saying that
> if sysfs_wi_node_add() returns NOTIFY_BAD, it will trigger
> NOTIFY_STOP_MASK, preventing other notifiers from running, while
> still allowing the memory hotplug operation to complete?

Yes.

> 
> If so, then I'm thinking of resolving both issues as follows:
> - For Issue1: I keep using MEM_ONLINE, assuming it is safe and
>    sufficient to ensure the node is fully online.
> - For Issue2: I avoid returning NOTIFY_BAD from the notifier.
>    Instead, I log the error using pr_err() and continue the operation.
> 
> This would result in the following code:
> 
> 	if (nid < 0)
> 		return NOTIFY_OK;
> 
> 	switch (action) {
> 	case MEM_ONLINE: // Issue1: keeping this unchanged
> 		err = sysfs_wi_node_add(nid);
> 		if (err) {
> 			pr_err("failed to add sysfs [node%d]\n", nid);
> 			// Issue2: Do not return NOTIFY_BAD
> 		}
> 		break;
> 	case MEM_OFFLINE:
> 		sysfs_wi_node_delete(nid);
> 		break;
> 	}
> 
> 	// Always return NOTIFY_OK
> 	return NOTIFY_OK;
> 
> Please let me know if this approach is acceptable.

That would work. The alternative is failing during MEM_GOING_ONLINE if 
the allocation failed, and deleting the node during MEM_CANCEL_ONLINE.

-- 
Cheers,

David / dhildenb

