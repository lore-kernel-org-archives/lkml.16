Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88DC054652
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745282355; cv=none; b=gdwJQehs+qGIcoW4IeI0THXD4vvh+WA/6sdx5x7XJ59EFTjWkJSDzXNcufZ5vjVMt/C0HZwieiSLlQ5uWOmfJf5QbAHVO/NlSfJhZMN1ekVGKFd4bvasQqYXQmOgU+9gdCsrES7qppjunrkERg53lIIyQ1cjs3DsAI/12mFAwIY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745282355; c=relaxed/simple;
	bh=9nCMMQLJpK6c0lV3dqhWlu/qEajMZFeZe5Za394C9fQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=GU4gchY/NR6d2IoWWSwP6YPHoTr3tNbFYRFTQptdqJzeImgd58JubbrMAB2MUquS0V+6M4jWc5Y6sVG+4btr1gKutOneB6jv99OzaDp4jObdNF4iN6SCsxADoCPceRnd/x1M+ZdFnoJCxEiykbRgoEKvXvQBMWFozieMNESu00I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=e0ek+l7v; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="e0ek+l7v"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745282352;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TarlKnUcZO8PV4fqN8FxnGE8oYyXnSPQXk43IPmYj64=;
	b=e0ek+l7v15ckovXBc9RKbF0G/xky1uX0sHkRe6TEToAt1/6yk6/o8q3YV4Tv7eQ/8Bt/Q4
	rRNczrwhqo4Bvb+m9qQhNH1c1hYbPAHDGLSfsgtOjYB98xmDwrPfWVY65zk7tPs4g5IBy+
	VypGHC+Hhp2Y26V7GgHZLHsTkWc7oi4=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-a0CRC5R4OJSUlvbhpgc1Ag-1; Mon, 21 Apr 2025 20:39:07 -0400
X-MC-Unique: a0CRC5R4OJSUlvbhpgc1Ag-1
X-Mimecast-MFC-AGG-ID: a0CRC5R4OJSUlvbhpgc1Ag_1745282346
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5c9abdbd3so405192685a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:39:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745282346; x=1745887146;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TarlKnUcZO8PV4fqN8FxnGE8oYyXnSPQXk43IPmYj64=;
        b=acW5MOfIp3Z8npWX5LJ2z273WOUk8z+XmUdOv73/NV876HnrGGJvsOKmDw67l983C0
         kxVYvPvfW4WB0P7l/LCNyvwI0BWt4am5bmgGPaGe/vUKLvtliUYaqdD50Ap/38LB3kgw
         P5vnEFSQDv2pDDijMLoUIb2GxnY4tNXYy1UPmS5v9SLBkKexLz3XD6Vk//rxD6Myv4ij
         uCpJPOdnk9T9uNRKLbHlVhmjqorBjnvDyzUFbvmoOvlaVeuysjry9u/47yRfueC1T5WB
         yayoNd8fWIfSRCxlM1RPfRGno6qortylCUK4JGjCKzs76F8jN1xlkAXj4XHY5/0lVAIB
         FaQQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6UxnM88BSQ69+ko2mTRzab5YxrEleb+2a+OZ9YjYkDFcDxEkvabQjh5t57WCQ1vBn4S9GvtDBVQpI2j0=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYapHGVRDaMagBGnCKeIH3ceknrjE7R5EWyYgAeNCVxHurgXbK
	CdvrbC97MN+ki4ycYsQolQfgBELaiD6cub2j6OsqzbEqsdnA6/JSAHPzZX1uLWmtsmMHwuSY0Pl
	bsokDIXah9MNuJLcYAUIiW4/MKtBUAbS+j/vvqVKwvAFghFNqEPj5t7AmzUPiFQ==
X-Gm-Gg: ASbGnctJY8YiCHBB5BuRHxwKT9zBJPOw2QJxU/MieF6bZ6UByBsL2t7IujozlaINZ8c
	u8zSenRVf3Jq536FGedyPLxirrPGXDFlcq43MeFO8oe+1ByWKUBbUKujXIMmyei9l/cDMhsC7fU
	m75lO1dIScV32oy8b0O7bCxML99OFHqu9D4m/zqjcAqCuAcpgw0Ucn7mgvGkSUJghgFpMlqTc04
	kXd3jAAVO+ILycfaqml4fpvcbYDwqYpoDFczzdKPpycElsIXUTLpWSa27gACC0xIW+UE/o89vCm
	EOSVpUczf5A/Or54XZuDGkEm0Bxm1idGyjRg02LInay3J/0jlzNN0nk47w==
X-Received: by 2002:a05:620a:a013:b0:7c9:29c1:44c6 with SMTP id af79cd13be357-7c929c14528mr1727597385a.13.1745282346450;
        Mon, 21 Apr 2025 17:39:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1QQkazOT+mrLpvzDdJwI97feDpglYNAei5MDp+NQ9Ze0fmHlyU20BawmqIh9ayhjTiFe6EA==
X-Received: by 2002:a05:620a:a013:b0:7c9:29c1:44c6 with SMTP id af79cd13be357-7c929c14528mr1727594485a.13.1745282346049;
        Mon, 21 Apr 2025 17:39:06 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-47ae9ce292esm48515801cf.63.2025.04.21.17.39.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:39:05 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <48a24cb3-16dd-4fb9-9e52-ed82a68041e8@redhat.com>
Date: Mon, 21 Apr 2025 20:39:04 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] vmscan,cgroup: apply mems_effective to reclaim
To: Shakeel Butt <shakeel.butt@linux.dev>, Gregory Price <gourry@gourry.net>
Cc: Waiman Long <llong@redhat.com>, linux-mm@kvack.org,
 cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com,
 hannes@cmpxchg.org, mhocko@kernel.org, roman.gushchin@linux.dev,
 muchun.song@linux.dev, tj@kernel.org, mkoutny@suse.com,
 akpm@linux-foundation.org
References: <20250419053824.1601470-1-gourry@gourry.net>
 <20250419053824.1601470-3-gourry@gourry.net>
 <ro3uqeyri65voutamqttzipfk7yiya4zv5kdiudcmhacrm6tej@br7ebk2kanf4>
 <babdca88-1461-4d47-989a-c7a011ddc2bd@redhat.com>
 <7dtp6v5evpz5sdevwrexhwcdtl5enczssvuepkib2oiaexk3oo@ranij7pskrhe>
 <aAbNyJoi_H5koD-O@gourry-fedora-PF4VCD3F>
 <ekug3nktxwyppavk6tfrp6uxfk3djhqb36xfkb5cltjriqpq5l@qtuszfrnfvu6>
 <aAbbtNhnuleBZdPK@gourry-fedora-PF4VCD3F>
 <i42lfs6xwncozzn7ruhpx7kuplqkpbnvniib7s6t52yytfhpaj@fc3a7mgkeilj>
Content-Language: en-US
In-Reply-To: <i42lfs6xwncozzn7ruhpx7kuplqkpbnvniib7s6t52yytfhpaj@fc3a7mgkeilj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/21/25 8:10 PM, Shakeel Butt wrote:
> On Mon, Apr 21, 2025 at 07:58:44PM -0400, Gregory Price wrote:
>> On Mon, Apr 21, 2025 at 04:15:49PM -0700, Shakeel Butt wrote:
>>> On Mon, Apr 21, 2025 at 06:59:20PM -0400, Gregory Price wrote:
>>>> On Mon, Apr 21, 2025 at 10:39:58AM -0700, Shakeel Butt wrote:
>>>>> On Sat, Apr 19, 2025 at 08:14:29PM -0400, Waiman Long wrote:
>>>>>> On 4/19/25 2:48 PM, Shakeel Butt wrote:
>>>>>>> On Sat, Apr 19, 2025 at 01:38:24AM -0400, Gregory Price wrote:
>>>>>>>> +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
>>>>>>>> +{
>>>>>>>> +	struct cgroup_subsys_state *css;
>>>>>>>> +	unsigned long flags;
>>>>>>>> +	struct cpuset *cs;
>>>>>>>> +	bool allowed;
>>>>>>>> +
>>>>>>>> +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
>>>>>>>> +	if (!css)
>>>>>>>> +		return true;
>>>>>>>> +
>>>>>>>> +	cs = container_of(css, struct cpuset, css);
>>>>>>>> +	spin_lock_irqsave(&callback_lock, flags);
>>>>>>> Do we really need callback_lock here? We are not modifying and I am
>>>>>>> wondering if simple rcu read lock is enough here (similar to
>>>>>>> update_nodemasks_hier() where parent's effective_mems is accessed within
>>>>>>> rcu read lock).
>>>>>> The callback_lock is required to ensure the stability of the effective_mems
>>>>>> which may be in the process of being changed if not taken.
>>>>> Stability in what sense? effective_mems will not get freed under us
>>>>> here or is there a chance for corrupted read here? node_isset() and
>>>>> nodes_empty() seems atomic. What's the worst that can happen without
>>>>> callback_lock?
>>>> Fairly sure nodes_empty is not atomic, it's a bitmap search.
>>> For bitmaps smaller than 64 bits, it seems atomic and MAX_NUMNODES seems
>>> smaller than 64 in all the archs.
>> Unfortunately, it's config-defined on (NODES_SHIFT) and the max is 1024.
>>
>> Is there an argument here for ignoring v1 and just doing the bit-check
>> without the lock?  Is there an easy ifdef way for us to just return true
>> if it's v1?
>>
> It is !(cgroup_subsys_on_dfl(cpuset_cgrp_subsys)) and I see cpuset_v2()
> and is_in_v2_mode() in kernel/cgroup/cpuset.c.

The is_in_v2_mode() function covers cpuset2 and cpuset1 with 
cpuset_v2_mode mount option, while the cpuset_v2() will only be true for 
cpuset2 and allowing compiling code out in case CPUSETS_V1 isn't set.

Cheers,
Longman

>

