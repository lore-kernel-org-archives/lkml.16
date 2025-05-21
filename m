Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3792673AC
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 13:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832648; cv=none; b=oCQyhx3XjzFVx1Nqvnk1rpP0k8DwXKcskFjwCSnxWUR22SRdRqZXflIh2g1hmBQUw/5H9zSIumBzMK5T4+aN1TSZ6c6jJ/yLqzg4gEX77Rgi+6zikJXXGQS4lqfnTDi5FluzyiF98QAz8PIScRzoalDCa9oLi0zaG+uorUpKXhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832648; c=relaxed/simple;
	bh=EHy4orCqsyPn3UCuH76/72oZ1oDLqvJbvYsEW87cubQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kYrhBcOMYWcYM4Q/zGUeney5t07+x+ytGVBmiptiYr+Lm8v6TZAgshxw54juEBLj+HvXje2KDLmKsjpHd3nUn4ERHdbEiyuDswzRasXXl+nTn1FZWC60bk/pap1t0v7bvT5XYMUVMevTPcNYDrW7wIVEFN9y8d0h0063yJZF2kE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZX1sukvc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZX1sukvc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747832645;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=uLYiXvR2upB5dbdO5aK9jQCyJdLoqER+/JieU8fmX5M=;
	b=ZX1sukvcE9fQ4S1SKm1ha3Yjkc7nBLCMV5rN7hhE9T/+bMCtpACVmKZNbTp2FeJxTcZ56F
	+4tny+G1x7yIqIyHb+wh/ThyfFHtIC1k8zcyYEg1IycgwjinpUifkKVenHND7VOUNaA8yo
	a7rysumiCYKBR3m7Kva2KR4eznlYAsE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-151-17srDY2pOEaycdCk-phHXQ-1; Wed, 21 May 2025 09:04:04 -0400
X-MC-Unique: 17srDY2pOEaycdCk-phHXQ-1
X-Mimecast-MFC-AGG-ID: 17srDY2pOEaycdCk-phHXQ_1747832643
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-445135eb689so24689965e9.2
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:04:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832643; x=1748437443;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uLYiXvR2upB5dbdO5aK9jQCyJdLoqER+/JieU8fmX5M=;
        b=qmcu2kCNm1dH2R5H3Oc48FRSjHmr1W9zJFah6KF+UZNfnLq0rWI/zfUm15nElRjjxn
         s3vLMM8KV2vxTIOW/1FTWtLtbdyFXpWengCG+wyP0sEIZEyUhmzXLMorreHhMntxtS6X
         7eQv8oHz4FjlBF96ZE0EfaNZ6ub+hO5jHPbWjWmAp6IPRHtq6srXGroTNgjdWZ0Tj5T8
         PoM/OjWpVz41YtpBXs/jM3WPwYeTva7P958ePs8puAlkf/8+jVYKsXewSuiOq3g8YXJj
         Z7yzqzewQ0WdJ16DK/FH6ex1Wna4oALJnJT/GlkgAw82IGfrjhWOprMWQhEMeLX2MIh1
         dleQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFfnHAngJe4N9jxgWd6svwzFJ4nvqRADNSmcXkBeK/XJjbUJWPFv6WvJk4/DuU3cPUkQr24MPRDQp3TMw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFHpxsJs+m+GgXBu2ps30BCEKUq3AM5Ib5/qoymW5kAypuFnRg
	LYVhtZSYQJzE8rChdzZpyI59zrZFj5a1ouhv5HjnHHSvuav9yBP1/IBLsZUFPFDmD5CnXDF3RPo
	uNNcZTmAo0ingeL9K7vlbllZb1Vb3teU59z78KAP2AI2lO+ikdxmLa4uITKNGsLtTqQ==
X-Gm-Gg: ASbGncuRAfGAWec3ejNlvCFbqrrmbaXarB2AyjdTvhE7E7yYBiQmqL4CJmUsfccZDJ4
	iE61KyRPCO/WCWNxHYHhFnOY8QnvzqQbFaD0wo3A6DmXw0wansPdZZ/+gzcBZr5QX74mU++qGJn
	Ayqmha9fXnAK2qCvsSnFb1rm4dECAdIsYPFjFd0ztfoL2nObCLwc/QH9jWCgoj7lnye02wZhO1X
	c7VQxS7v9PYuS9qfCYfPcWbaDQGxOgEqT6MEDpc110pmJfTkozGIC3uZRAR4j5+/Dd8f/3+ezrm
	uRyB9dwMX7Uop/jYNulxeVk1+3eFsBJcTxibEo0IeNWwi4rZ/nxCsYIqiZezmHc5ZH4AZhvMcPi
	MYCbv9QFXFIdjzk0+vGp2Baf5Xrk1pPx1Xr+8SCY=
X-Received: by 2002:a05:600c:3f06:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-442fd63c7aemr234724315e9.16.1747832642772;
        Wed, 21 May 2025 06:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQq97nuCAPHqp/2ziYJfPmUt4MlXXMuJzYIz7ZGgDP6Pek7ndHBqtTZCxqduzSztL4Q8FrRQ==
X-Received: by 2002:a05:600c:3f06:b0:43b:ca39:6c75 with SMTP id 5b1f17b1804b1-442fd63c7aemr234723475e9.16.1747832642191;
        Wed, 21 May 2025 06:04:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d3d6csm70659835e9.19.2025.05.21.06.04.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:04:01 -0700 (PDT)
Message-ID: <25283dbd-2867-4034-bb16-951e0fb81843@redhat.com>
Date: Wed, 21 May 2025 15:04:00 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9] mm/mempolicy: Weighted Interleave Auto-tuning
To: Joshua Hahn <joshua.hahnjy@gmail.com>, gourry@gourry.net,
 akpm@linux-foundation.org
Cc: harry.yoo@oracle.com, ying.huang@linux.alibaba.com, honggyu.kim@sk.com,
 yunjeong.mun@sk.com, gregkh@linuxfoundation.org, rakie.kim@sk.com,
 rafael@kernel.org, lenb@kernel.org, dan.j.williams@intel.com,
 Jonathan.Cameron@huawei.com, dave.jiang@intel.com, horen.chuang@linux.dev,
 hannes@cmpxchg.org, osalvador@suse.de, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
References: <20250520141236.2987309-1-joshua.hahnjy@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250520141236.2987309-1-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.05.25 16:12, Joshua Hahn wrote:
> On machines with multiple memory nodes, interleaving page allocations
> across nodes allows for better utilization of each node's bandwidth.
> Previous work by Gregory Price [1] introduced weighted interleave, which
> allowed for pages to be allocated across nodes according to user-set ratios.
> 
> Ideally, these weights should be proportional to their bandwidth, so
> that under bandwidth pressure, each node uses its maximal efficient
> bandwidth and prevents latency from increasing exponentially.
> 
> Previously, weighted interleave's default weights were just 1s -- which
> would be equivalent to the (unweighted) interleave mempolicy, which goes
> through the nodes in a round-robin fashion, ignoring bandwidth information.
> 
> This patch has two main goals:
> First, it makes weighted interleave easier to use for users who wish to
> relieve bandwidth pressure when using nodes with varying bandwidth (CXL).
> By providing a set of "real" default weights that just work out of the
> box, users who might not have the capability (or wish to) perform
> experimentation to find the most optimal weights for their system can
> still take advantage of bandwidth-informed weighted interleave.
> 
> Second, it allows for weighted interleave to dynamically adjust to
> hotplugged memory with new bandwidth information. Instead of manually
> updating node weights every time new bandwidth information is reported
> or taken off, weighted interleave adjusts and provides a new set of
> default weights for weighted interleave to use when there is a change
> in bandwidth information.
> 
> To meet these goals, this patch introduces an auto-configuration mode
> for the interleave weights that provides a reasonable set of default
> weights, calculated using bandwidth data reported by the system. In auto
> mode, weights are dynamically adjusted based on whatever the current
> bandwidth information reports (and responds to hotplug events).
> 
> This patch still supports users manually writing weights into the nodeN
> sysfs interface by entering into manual mode. When a user enters manual
> mode, the system stops dynamically updating any of the node weights,
> even during hotplug events that shift the optimal weight distribution.
> 
> A new sysfs interface "auto" is introduced, which allows users to switch
> between the auto (writing 1 or Y) and manual (writing 0 or N) modes. The
> system also automatically enters manual mode when a nodeN interface is
> manually written to.
> 
> There is one functional change that this patch makes to the existing
> weighted_interleave ABI: previously, writing 0 directly to a nodeN
> interface was said to reset the weight to the system default. Before
> this patch, the default for all weights were 1, which meant that writing
> 0 and 1 were functionally equivalent. With this patch, writing 0 is invalid.
> 
> [1] https://lore.kernel.org/linux-mm/20240202170238.90004-1-gregory.price@memverge.com/
> 
> Suggested-by: Yunjeong Mun <yunjeong.mun@sk.com>
> Suggested-by: Oscar Salvador <osalvador@suse.de>
> Suggested-by: Ying Huang <ying.huang@linux.alibaba.com>
> Suggested-by: Harry Yoo <harry.yoo@oracle.com>
> Tested-by: Honggyu Kim <honggyu.kim@sk.com>
> Reviewed-by: Honggyu Kim <honggyu.kim@sk.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Huang Ying <ying.huang@linux.alibaba.com>
> Co-developed-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Gregory Price <gourry@gourry.net>
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> ---


[...]

> -static void iw_table_free(void)
> +static void wi_state_free(void)
>   {
> -	u8 *old;
> +	struct weighted_interleave_state *old_wi_state;
>   
> -	mutex_lock(&iw_table_lock);
> -	old = rcu_dereference_protected(iw_table,
> -					lockdep_is_held(&iw_table_lock));
> -	rcu_assign_pointer(iw_table, NULL);
> -	mutex_unlock(&iw_table_lock);
> +	mutex_lock(&wi_state_lock);
> +
> +	old_wi_state = rcu_dereference_protected(wi_state,
> +			lockdep_is_held(&wi_state_lock));
> +	if (!old_wi_state) {
> +		mutex_unlock(&wi_state_lock);
> +		goto out;
> +	}
>   
> +	rcu_assign_pointer(wi_state, NULL);
> +	mutex_unlock(&wi_state_lock);

Just one nit: if written as:

...
rcu_assign_pointer(wi_state, NULL);
mutex_unlock(&wi_state_lock);

old_wi_state = ...
if (old_wi_state) {
	synchronize_rcu();
	kfree(old_wi_state);
}
kfree(&wi_group->wi_kobj);

You can easily avoid the goto.

>   	synchronize_rcu();
> -	kfree(old);
> +	kfree(old_wi_state);
> +out:
> +	kfree(&wi_group->wi_kobj);
>   }

I'll note that this rather unrelated churn (renaming functions + 
variables) is a bit abd for review as it adds noise. Having that as part 
of a cleanup patch might have been better.

Nothing else jumped at me (did not an in-depth review of the logic)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

