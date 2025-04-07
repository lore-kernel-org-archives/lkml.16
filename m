Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9ED0C1E5218
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 14:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744036577; cv=none; b=M1pGHe2I6IfALQ9s1xbjkiw6RA4iynU5k+Kti5uvEHDv29HlX+Kmzh9Qvuv3B4a/Sc3F+7b1R6z78s2i6BM342eCWEuwXnu1zX/pb2tbJ8YMBVcWg3gCzt0CAYQB4SOiU5n9n3ZjABwObY+ivesoToGfvb28yF3w+AW5JxBNuXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744036577; c=relaxed/simple;
	bh=cGNyz+WOFZZfNQEOkJkIG2uYIRO4WjMsJbUDGsYid5o=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=h6JRsEF7v45RgpXMtp0I/gk6XjldjxJ6kxxHY+tlZa4QPcbGl+1FMfZtsPzfDyue47BJcMgSVUG2PBGa1N4UrWdNcaIPUCWlCO+YtFUZ6bVYL1T/66GpOe6LY/dEMj9kO7+9Pzqw3NDS2v/TjXDJz7PFEP7OLzknXUfrDaT3P+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OqTSVKcX; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OqTSVKcX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744036573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=x5DJg/Yndiod0rCSXdIIJltN9dcYDMLjV18CCekaRB0=;
	b=OqTSVKcXleFv0qk1gQT+K+jUo2BbLv9fEsCwhrF/eUmwjVJ/VVwl0kbkUVRGKWsirlkyFz
	0EJpMAZtuUK3K1UuEJn5l61CJLOChtI1OW6rycJkBz/vsYwrvFxGc2FNraucKmTIzL+NpB
	6TGibCjlCj0bqZ7DlGSN86dmXN/2k9o=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-7LXdxAUhNNiATllpMEYBuA-1; Mon, 07 Apr 2025 10:36:11 -0400
X-MC-Unique: 7LXdxAUhNNiATllpMEYBuA-1
X-Mimecast-MFC-AGG-ID: 7LXdxAUhNNiATllpMEYBuA_1744036571
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8feffbe08so114026326d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 07:36:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744036571; x=1744641371;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x5DJg/Yndiod0rCSXdIIJltN9dcYDMLjV18CCekaRB0=;
        b=emw5Ei8dKiWN/SppI2AvyzcqC94KqXzA2Ms74AGd+hpuBzyntcD0gNe9A8vjDMriM3
         g6rYGZq5QOGnD0k8cFonkNkFXOP1fGUZI4ohXKVuqJT5gg4hfvHf8eSUeQHnSdIvwGNI
         b5geMKLUBK5ixQCg6g2IoZ3oApF6czWyQuBGhocXG37jf6bJBrsxFSWqL/o6hKJwRz9j
         uOfoYg3HOkrkMfRL9fPTNA4Ljoog5dQv+jZVdQaqimYyuIWq43UdKYoYiK+7CLFrIX6Z
         cRtPtjzwwMJBzGlYzDlDCi86WifL3HShB/kwvW3Kzbw0HQf8t4AnP757d1qR5A4Qb6NI
         If2A==
X-Forwarded-Encrypted: i=1; AJvYcCVXOIDplA027MiQMvQX0wteDlEaOkhmxdUn0GI0BxbQXv3RXaTVvhmxH6fd5G8h7FQJ1Mvvu96WU+X3WXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAd/3E/3znFwsW/qp3Vnk+i+d9FIoyhIRB7SIhoL8qeTJTqp0g
	EJS0OdeCsPCR8SXPucJlzXZ2DZPTqYeGGo5mcOMTQqFNYaVZxfPH2mi5TIGIXbB7o1h0YGVNCMq
	NCBzlDzG94vxsIakyyPFKFpdP4RU4yYtuL9fV1cMbvnN5o1sInNkrphNbWk4FkA==
X-Gm-Gg: ASbGncvb7A95jgZLH8GBJpt8vvk3ecLR0kCaKISbIKrUx9PDV5lqqWOsT49IR8GQA4r
	x0Mp4NhwrYG2VS9kbWSQJYPvNL3shxKWgGq9jTVCNtTA4YFh8FBUs0iikSb3d+lGKWCbQgTXWYk
	HlD3THlEFK/xWKBkSRgZBPAIjVKyb9NL3xp1ueYUXNJ5MKRPN9vDbhGH6QVT7f93zWr14AF+xvj
	g12CTB1GHhDjBssOM1yrggXypi/iQtZ8qbI61InKRgt8z1w9T6tUpLt+JaMLOl//AIrk3F++OhR
	CWAsIU9nLRmbxbbhbChqF8IaCXHmIWHYMGHsTcRQe0LdNWkzeo+dm/fbpbWfCw==
X-Received: by 2002:a05:6214:5189:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f012e1adf0mr219540256d6.25.1744036571309;
        Mon, 07 Apr 2025 07:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBjeFW6/Zy3PCGjK+e4ng1QFrOqWTfMoNnO69ymICNu5TBJyk/4flMbpzGbuBr1A3OzyWJBA==
X-Received: by 2002:a05:6214:5189:b0:6e8:fb92:dffa with SMTP id 6a1803df08f44-6f012e1adf0mr219539506d6.25.1744036570672;
        Mon, 07 Apr 2025 07:36:10 -0700 (PDT)
Received: from ?IPV6:2601:188:c100:5710:315f:57b3:b997:5fca? ([2601:188:c100:5710:315f:57b3:b997:5fca])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6ef0f14cf41sm58909196d6.105.2025.04.07.07.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Apr 2025 07:36:10 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <2d50bccb-9cb9-4f28-a8a6-116b2003acd2@redhat.com>
Date: Mon, 7 Apr 2025 10:36:09 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] mm/vmscan: Skip memcg with !usage in
 shrink_node_memcgs()
To: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@kernel.org>,
 Roman Gushchin <roman.gushchin@linux.dev>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20250407014159.1291785-1-longman@redhat.com>
 <20250407014159.1291785-2-longman@redhat.com>
 <20250407142455.GA827@cmpxchg.org>
Content-Language: en-US
In-Reply-To: <20250407142455.GA827@cmpxchg.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/7/25 10:24 AM, Johannes Weiner wrote:
> On Sun, Apr 06, 2025 at 09:41:58PM -0400, Waiman Long wrote:
>> The test_memcontrol selftest consistently fails its test_memcg_low
>> sub-test due to the fact that two of its test child cgroups which
>> have a memmory.low of 0 or an effective memory.low of 0 still have low
>> events generated for them since mem_cgroup_below_low() use the ">="
>> operator when comparing to elow.
>>
>> The two failed use cases are as follows:
>>
>> 1) memory.low is set to 0, but low events can still be triggered and
>>     so the cgroup may have a non-zero low event count. I doubt users are
>>     looking for that as they didn't set memory.low at all.
>>
>> 2) memory.low is set to a non-zero value but the cgroup has no task in
>>     it so that it has an effective low value of 0. Again it may have a
>>     non-zero low event count if memory reclaim happens. This is probably
>>     not a result expected by the users and it is really doubtful that
>>     users will check an empty cgroup with no task in it and expecting
>>     some non-zero event counts.
>>
>> In the first case, even though memory.low isn't set, it may still have
>> some low protection if memory.low is set in the parent. So low event may
>> still be recorded. The test_memcontrol.c test has to be modified to
>> account for that.
>>
>> For the second case, it really doesn't make sense to have non-zero
>> low event if the cgroup has 0 usage. So we need to skip this corner
>> case in shrink_node_memcgs() by skipping the !usage case. The
>> "#ifdef CONFIG_MEMCG" directive is added to avoid problem with the
>> non-CONFIG_MEMCG case.
>>
>> With this patch applied, the test_memcg_low sub-test finishes
>> successfully without failure in most cases. Though both test_memcg_low
>> and test_memcg_min sub-tests may still fail occasionally if the
>> memory.current values fall outside of the expected ranges.
>>
>> Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>   mm/vmscan.c                                      | 10 ++++++++++
>>   tools/testing/selftests/cgroup/test_memcontrol.c |  7 ++++++-
>>   2 files changed, 16 insertions(+), 1 deletion(-)
>>
>> diff --git a/mm/vmscan.c b/mm/vmscan.c
>> index b620d74b0f66..65dee0ad6627 100644
>> --- a/mm/vmscan.c
>> +++ b/mm/vmscan.c
>> @@ -5926,6 +5926,7 @@ static inline bool should_continue_reclaim(struct pglist_data *pgdat,
>>   	return inactive_lru_pages > pages_for_compaction;
>>   }
>>   
>> +#ifdef CONFIG_MEMCG
>>   static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>>   {
>>   	struct mem_cgroup *target_memcg = sc->target_mem_cgroup;
>> @@ -5963,6 +5964,10 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>>   
>>   		mem_cgroup_calculate_protection(target_memcg, memcg);
>>   
>> +		/* Skip memcg with no usage */
>> +		if (!page_counter_read(&memcg->memory))
>> +			continue;
> Please use mem_cgroup_usage() like I had originally suggested.
>
> The !CONFIG_MEMCG case can be done like its root cgroup branch.
Will do that.
>
>>   		if (mem_cgroup_below_min(target_memcg, memcg)) {
>>   			/*
>>   			 * Hard protection.
>> @@ -6004,6 +6009,11 @@ static void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>>   		}
>>   	} while ((memcg = mem_cgroup_iter(target_memcg, memcg, partial)));
>>   }
>> +#else
>> +static inline void shrink_node_memcgs(pg_data_t *pgdat, struct scan_control *sc)
>> +{
>> +}
>> +#endif /* CONFIG_MEMCG */
> You made the entire reclaim path a nop for !CONFIG_MEMCG.

Yes, that is probably not right. Will fix that.

Cheers,
Longman

