Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 575461494A8
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 03:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744514108; cv=none; b=fUISMNeVPzdh7wDAZjJWYBcs8d1wsx54GniIlGuugU/oU02LLrBSq5Hu68xI8eEddb9nbbHqkQ6o6MS9H3x4aImrB9UU7qmNkF5myn8jXEqDQMFuicCD2U11h/MoR+Ee98+SJ4JUavnxdUmJ1FAh3bgRGCgZBhDDRFSE/hbeg9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744514108; c=relaxed/simple;
	bh=GXoItoIHVQGxDk0GZCjHQsM8qdSgDcBsL2mFmkWaNc8=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=FZBhF5/8IWahVeEIgjIQFTzOZ8JiW2mWUAeGbMoOdwnf2ZV6cdQHqG2QeCcOeXrbArQO7HCTVYtTFgOHwa8ylI78UHfIE6704aVg5ODzGtt/NpFe+yp3VWOV0aNMLLMGEYPiT9Yt7KUXUTHvKlBQXLnsRdzz9RJgrJSio9c9Y4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WMUAkrpw; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WMUAkrpw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744514105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BZ2AIgXN2yGPN7Sxu2wl5jNXWejeTiuda2OwXuQQY0I=;
	b=WMUAkrpwkpKSbdggmy+HjO0VBj17OE1AcLqqaDOTl4l2yQ8cHfhUX3mtI3g2MCS6sWvX6c
	X89j+PrcOOug+6G9i1hfEh/8DXCPFrnWEpSH8/d/PFwFqxiRxnWQv/1gqBC2b03Lq3vmdx
	WwYe1bbz4g5Y2c6qGCXuFWyvT00RfDk=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-135-0344IwXKOT2BRHVd2bJgTg-1; Sat, 12 Apr 2025 23:15:03 -0400
X-MC-Unique: 0344IwXKOT2BRHVd2bJgTg-1
X-Mimecast-MFC-AGG-ID: 0344IwXKOT2BRHVd2bJgTg_1744514103
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c09f73873fso532860485a.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 20:15:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744514103; x=1745118903;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BZ2AIgXN2yGPN7Sxu2wl5jNXWejeTiuda2OwXuQQY0I=;
        b=XFFgY3EWDxaWapJmCCBReElFs8zJUDXNkEUWDkZk44NBCpQL0+NttW0y6gazPC6UB0
         3hGKbWLDe4n+NA3XV2Yw5/0hMJqwi7Cd9IDREfmzUhH4MdrLxMRfw/mvdWiFuJgNJZGa
         kVPuc3WYZo+hZIqG5NLYj10H5RlSa8NskHeRduQvfnq7tRJFfrgoY2qxsfmX3JPTdtL7
         RJwBTghHRoXmnF0nZ8L5RWPKpNCQ/9gj/3yrY355QSqjcja3tmxxUWH+d9r2RC6AwmYD
         EVRIOe9SHfSOxMwi9qcK3lPFCgyq7eZG85VegAaBNrZXqMf4t48sAYC5pin1tVBax65W
         MEEg==
X-Forwarded-Encrypted: i=1; AJvYcCUDnc0olBgU3g9dPja1ymEH85HKmzXZ9XqbIqjdrxdasp35NJlx8OUPTEcX34ZSmjhgfsSwAAk4K2BXEGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK0cqgkAg9ho1kSdxaqG24wtf6sOWZNKPTeJc4N3ZVpp+AMwsK
	fV83jWlE1IaJLJ3lhdScuExVoCU3G8NHJOJ8pO0VtTDO/pX6om80nyx3EPWOte4n6qE2s2s384y
	p6PVm/hu/kpFSSHCPHjpe0CTzmega3ET0eG4eBH27ofT9AQmCo099UCTzdAVBRA==
X-Gm-Gg: ASbGnctNdvsF2YvvR+EmaLU7X+y/i0P9lw1zXIuRO+LjeR3dz8Nlbf5A1jLi2tWfzL4
	gx8+KvI89MJjw/Wk8xtcQ+alPRb3X3b+Y1YjvEmRswVnE82ywkQyC8xUx7BNqfYphZFEpgNdnzI
	294FVM5XTs+8kDAsKbU89Ut5KLAjRjLFQR7YWvCR/F3MInFVr2eBQawk70TjSLtgpO0ho47TdFt
	Pq1FvxKd3+xiztFz374MWG0cG453yXewFId3Y7JGGqwNFqj0FTLJq0iJhY4E5VuAdt2Aju72ElW
	WXovmU1aBGjOONIildkWEWxrgzbpxzG43KQgq3WZWRSbGc3jkwsKWg==
X-Received: by 2002:a05:620a:f0c:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c7af0d4854mr1206658785a.21.1744514103031;
        Sat, 12 Apr 2025 20:15:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHEgZdkNpb8M2sLPV1/LXGt3hDMHfPduIrP6ippNwIGXHw9JexKgaMOOMOlNxn4UhxXHLuaKg==
X-Received: by 2002:a05:620a:f0c:b0:7c5:50ab:de07 with SMTP id af79cd13be357-7c7af0d4854mr1206655885a.21.1744514102577;
        Sat, 12 Apr 2025 20:15:02 -0700 (PDT)
Received: from [172.20.3.175] (syn-108-176-116-062.biz.spectrum.com. [108.176.116.62])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c7a8a0f1fasm495773985a.112.2025.04.12.20.15.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Apr 2025 20:15:01 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <bbc48f40-274c-44ec-9a98-7c18b64628c0@redhat.com>
Date: Sat, 12 Apr 2025 23:15:00 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] selftests: memcg: Increase error tolerance of
 child memory.current check in test_memcg_protection()
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>,
 Andrew Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>,
 =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org,
 cgroups@vger.kernel.org, linux-mm@kvack.org, linux-kselftest@vger.kernel.org
References: <20250406024010.1177927-1-longman@redhat.com>
 <20250406024010.1177927-3-longman@redhat.com> <Z_Wht7kyWyk62IBU@google.com>
Content-Language: en-US
In-Reply-To: <Z_Wht7kyWyk62IBU@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/8/25 6:22 PM, Roman Gushchin wrote:
> On Sat, Apr 05, 2025 at 10:40:10PM -0400, Waiman Long wrote:
>> The test_memcg_protection() function is used for the test_memcg_min and
>> test_memcg_low sub-tests. This function generates a set of parent/child
>> cgroups like:
>>
>>    parent:  memory.min/low = 50M
>>    child 0: memory.min/low = 75M,  memory.current = 50M
>>    child 1: memory.min/low = 25M,  memory.current = 50M
>>    child 2: memory.min/low = 0,    memory.current = 50M
>>
>> After applying memory pressure, the function expects the following
>> actual memory usages.
>>
>>    parent:  memory.current ~= 50M
>>    child 0: memory.current ~= 29M
>>    child 1: memory.current ~= 21M
>>    child 2: memory.current ~= 0
>>
>> In reality, the actual memory usages can differ quite a bit from the
>> expected values. It uses an error tolerance of 10% with the values_close()
>> helper.
>>
>> Both the test_memcg_min and test_memcg_low sub-tests can fail
>> sporadically because the actual memory usage exceeds the 10% error
>> tolerance. Below are a sample of the usage data of the tests runs
>> that fail.
>>
>>    Child   Actual usage    Expected usage    %err
>>    -----   ------------    --------------    ----
>>      1       16990208         22020096      -12.9%
>>      1       17252352         22020096      -12.1%
>>      0       37699584         30408704      +10.7%
>>      1       14368768         22020096      -21.0%
>>      1       16871424         22020096      -13.2%
>>
>> The current 10% error tolerenace might be right at the time
>> test_memcontrol.c was first introduced in v4.18 kernel, but memory
>> reclaim have certainly evolved quite a bit since then which may result
>> in a bit more run-to-run variation than previously expected.
>>
>> Increase the error tolerance to 15% for child 0 and 20% for child 1 to
>> minimize the chance of this type of failure. The tolerance is bigger
>> for child 1 because an upswing in child 0 corresponds to a smaller
>> %err than a similar downswing in child 1 due to the way %err is used
>> in values_close().
>>
>> Before this patch, a 100 test runs of test_memcontrol produced the
>> following results:
>>
>>       17 not ok 1 test_memcg_min
>>       22 not ok 2 test_memcg_low
>>
>> After applying this patch, there were no test failure for test_memcg_min
>> and test_memcg_low in 100 test runs.
> Ideally we want to calculate these values dynamically based on the machine
> size (number of cpus and total memory size).
>
> We can calculate the memcg error margin and scale memcg sizes if necessarily.
> It's the only way to make it pass both on a 2-CPU's vm and 512-CPU's physical
> server.
>
> Not a blocker for this patch, just an idea for the future.

Thanks for the suggestion.

As I said in a previous mail, the way the test works is by waiting until 
the the memory.current of the parent is close to 50M, then it checks the 
memory.current's of its children to see how much usage each of them 
have. I am not sure if nr of CPUs or total memory size is really a 
factor here. We will probably need to run some experiments to find out. 
Anyway, it will be a future patch if they are really a factor here.

Cheers,
Longman

>
> Thanks!
>

