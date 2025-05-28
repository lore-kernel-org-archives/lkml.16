Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EA628B50C
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 15:45:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748447136; cv=none; b=OwVq2TXp4vxP8X34cko0dotcp9Vbty2MqXoQTW1ufOfJ1/ileJQk78/mFn0n1QQGR46WeUwQ1l6yLxHs2tdDnhByPB3dD9dmqUvz+U2fXg0yB2MESKPGCT1f/PTdEhao7A4GybDiBW66/Ekxm83DjtdEqOm6LeJPuXYtrCh+ewM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748447136; c=relaxed/simple;
	bh=/CbNirfnMFT6iFLSja2Zj2oVfKKWn3klp7446jTgwUs=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:References:
	 In-Reply-To:Content-Type; b=mIP4l22aHH2xgge69X3mk+IioBLj3ZmagxhBxQ0r61//ZhNLvFJWndtFZDRH0cRtJN1n0lcCd8c1JWVvUgi5GbXG3qS3FYowlykh2bYALq+9kZbE/aOWkaQjoJAk6BuyNXhNCysFvQ3lMR4F/3XuiPn25Ktd/ipVOMq/z/SEl/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gIlkdiOn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gIlkdiOn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748447134;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pyLOwGypbK7cil/VDfYgN1Gr/yfNRiyW37n+n15jPLw=;
	b=gIlkdiOnCtea0VdQoZOFxJQVTXWAAe8GTkTAcDCvapEC01qXZ6Uudkpe2KEVTX4LhIxckT
	PpJ9TpCJf8B/XaQAGpnvRGOAzqQS++IVETWNWBSN3sGSw7h+ew788rMed9hiWxfkmUYqSc
	sNi0QKL5CHYpUn8Uec/KWFcDC2fr7G8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-101-rF7MVA4SNf--q4MOFuQWwA-1; Wed, 28 May 2025 11:45:32 -0400
X-MC-Unique: rF7MVA4SNf--q4MOFuQWwA-1
X-Mimecast-MFC-AGG-ID: rF7MVA4SNf--q4MOFuQWwA_1748447132
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5f3b94827so716256185a.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748447132; x=1749051932;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pyLOwGypbK7cil/VDfYgN1Gr/yfNRiyW37n+n15jPLw=;
        b=faX6GQ+x92Zav9bz9T8yjPTkraKePwyAJjSguJImblzieieWHQXyUk0ujHuxK+fU39
         vTwLSFL22042lkGw0Z4VX2gDiiDYGCM/u2wKSQ+OLFUXYbDfhbhyPNdEMwI9joYn19Ku
         YKl1AFK14IF0qsH+8OqpvDH1hFVYz9DKkCS1KgpX1sSA8GcFxINxJF9IMC9eFdy423Bt
         xIHqgkYOc211A1+dxKng1MqTrDsYALDlK80jgiA1fyGMiZuHo3MHorB1Tm3YfkyddRpp
         xxa0CyXo5vtJTdO0zthJRMzYQIexgoZPBBFqySDDwhyTvzdlO+y4wJzxLTkQJ0Jd7dey
         wLYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVdUAfHLdopVhDGEXxN3Y8zXVPLtemICcMP+wpJny+tvRj6nuMCIyCXOk5B6eHzmYR4ChqTKyINMCX3gvI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ENcW18h5DtQ3Pjrsh0rYdHl9Jp0RjWOiwQgT7ZwXyuXj1OFu
	ew1DxbKqb+8E/GsWqE7hR/2wq38+9gSEa9xrdGXMKc5qFVy49qI7P87PIZ6000UEbp2Zy9qjQ64
	xMdxb+s9U1jAq34EA8jvIikR2edXCPem4b/MrYEaT5PgtKbDndUIswnfWBYO9lJnGMQ==
X-Gm-Gg: ASbGncspN+2fux4Saq6VudaxaBrdxNv8m9B9CjxiOyc4LNLEGBSE2wxko7QtqojcvDa
	8k3gFyGmPOxrQA+T77CM+3h4IfyBvCCg8UBF98WH00+V2FGzbY1bKwoMiFAy0PneQITB3MS2UIh
	Qh2Twa6qfizaq8MCyo8VgzpsP8Gi2hqkXbEYTbb7Zl0AtFV3Ex4U5kzhDYPij4OxaX7TYfNiyk6
	lfvnYNXw9YiByDIEHqMJNdwf2a3F6KBqamYA95+SuNC6NChgI3pIXNWbmkOCy8oDR6btfnN8rui
	w0FKYWQ4enko
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr319656185a.22.1748447132200;
        Wed, 28 May 2025 08:45:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUqlAX9B3FIW5eZMrtvbf91YzWhqy3WejI0SBLhs/OnmLka0kFn2dRtq7rU7LdniOGPnZkrQ==
X-Received: by 2002:a05:620a:2952:b0:7ce:e010:88bb with SMTP id af79cd13be357-7cfc5d3bea0mr319652185a.22.1748447131835;
        Wed, 28 May 2025 08:45:31 -0700 (PDT)
Received: from [172.20.4.10] ([50.234.147.137])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cfb82002bdsm84495085a.17.2025.05.28.08.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 08:45:31 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <a9d0e503-ec70-41a7-adb2-989082e4d9f2@redhat.com>
Date: Wed, 28 May 2025 11:45:29 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: cgroup: clarify controller enabling
 semantics
To: Vishal Chourasia <vishalc@linux.ibm.com>, Tejun Heo <tj@kernel.org>,
 Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?=
 <mkoutny@suse.com>, Jonathan Corbet <corbet@lwn.net>,
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250527085335.256045-2-vishalc@linux.ibm.com>
 <99be9c8e-a5c4-4378-b03b-2af01608de9f@redhat.com>
Content-Language: en-US
In-Reply-To: <99be9c8e-a5c4-4378-b03b-2af01608de9f@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 5/28/25 11:23 AM, Waiman Long wrote:
> On 5/27/25 4:53 AM, Vishal Chourasia wrote:
>> The documentation for cgroup controller management has been updated to
>> be more consistent regarding following concepts:
>>
>> What does it mean to have controllers
>> 1) available in a cgroup, vs.
>> 2) enabled in a cgroup
>>
>> Which has been clearly defined below in the documentation.
>>
>> "Enabling a controller in a cgroup indicates that the distribution of
>> the target resource across its immediate children will be controlled.
>> Consider the following sub-hierarchy"
>>
>> As an example, consider
>>
>> /sys/fs/cgroup # cat cgroup.controllers
>> cpuset cpu io memory hugetlb pids misc
>> /sys/fs/cgroup # cat cgroup.subtree_control # No controllers by default
>> /sys/fs/cgroup # echo +cpu +memory > cgroup.subtree_control
>> /sys/fs/cgroup # cat cgroup.subtree_control
>> cpu memory                   # cpu and memory enabled in /sys/fs/cgroup
>> /sys/fs/cgroup # mkdir foo_cgrp
>> /sys/fs/cgroup # cd foo_cgrp/
>> /sys/fs/cgroup/foo_cgrp # cat cgroup.controllers
>> cpu memory                   # cpu and memory available in 'foo_cgrp'
>> /sys/fs/cgroup/foo_cgrp # cat cgroup.subtree_control  # empty by default
>> /sys/fs/cgroup/foo_cgrp # ls
>> cgroup.controllers      cpu.max.burst           memory.numa_stat
>> cgroup.events           cpu.pressure            memory.oom.group
>> cgroup.freeze           cpu.stat                memory.peak
>> cgroup.kill             cpu.stat.local          memory.pressure
>> cgroup.max.depth        cpu.weight              memory.reclaim
>> cgroup.max.descendants  cpu.weight.nice         memory.stat
>> cgroup.pressure         io.pressure memory.swap.current
>> cgroup.procs            memory.current memory.swap.events
>> cgroup.stat             memory.events           memory.swap.high
>> cgroup.subtree_control  memory.events.local     memory.swap.max
>> cgroup.threads          memory.high             memory.swap.peak
>> cgroup.type             memory.low memory.zswap.current
>> cpu.idle                memory.max              memory.zswap.max
>> cpu.max                 memory.min memory.zswap.writeback
>>
>> Once a controller is available in a cgroup it can be used to resource
>> control processes of the cgroup.
>>
>> Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst 
>> b/Documentation/admin-guide/cgroup-v2.rst
>> index 1a16ce68a4d7..0e1686511c45 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -438,8 +438,8 @@ Controlling Controllers
>>   Enabling and Disabling
>>   ~~~~~~~~~~~~~~~~~~~~~
>>   -Each cgroup has a "cgroup.controllers" file which lists all
>> -controllers available for the cgroup to enable::
>> +Each cgroup has a cgroup.controllers file, which lists all the 
>> controllers
>> +available for that cgroup and which can be enabled for its children.
>
> I believe breaking the sentence into two separate components is 
> actually making it less correct. There are implicit controllers that 
> are always enabled and do not show up in cgroup.controllers. Prime 
> examples are perf_event and freezer. IOW, only controllers that are 
> available and need to be explicitly enabled will show up.

A correction: The cgroup.controllers file shows the controllers that are 
available in the current cgroup and which have to be explicitly enabled 
in cgroup.subtree_control to make them available in the child cgroups.

Cheers,
Longman

