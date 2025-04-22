Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4277BEBE
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 00:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745280651; cv=none; b=ZdzAPg8AwTBVdWGyYitC9ziVzd/htsLunxyWSlBkv7pORQn384kdN+GTRCLH6gaH9HNOFJz6kIdZ1sje/30rThZPRZX/DaQ7l32OLcmWidO3p/Ec+sC4LarkcCVOSyIlBU0f6oXU09e/R8BBp/ySzvVdbyhjJz9Ksa6qnxed6j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745280651; c=relaxed/simple;
	bh=FvoSljFN8/r2VwCMywICDkZSUYEM4G4HDnz9q8/nbqQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OVUzSumajDdj5xbKgNwliQbXsb0D0ROK9/UJi10Nsrl2cRW/md+6gOR+0xrrpBr9mqC5zcabnbrpnzHa+AJctCChL0tIowij8KblSaH92NyP2g3klLO8LmdDAVyp0ziYPf4K/AGpOGaIs88StkRWROcMtMM4BOrioMEJ8a4cUJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ktqy0BvR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ktqy0BvR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745280646;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UDtoLS1gBPoKuxtRvVU2gx7fBBeeu41JuptA9opePq4=;
	b=Ktqy0BvRCrdEYAqat71lmG/QDukNxDk3EVUN4pSkCOC4qL/IRioGcMWxT+D15NlnjaiZNK
	bA/3PSNlNR0/rV5jj9b3EzXlCYDYoPgqpDJiKj3tvq3TRd996Nwi0hWEpAnPU2A5UDoviN
	40RJ5kiljIf+CxYgmJt+dR9pnA8Ptns=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-232-xJs2pQIjM5G2ljV7YTSHtQ-1; Mon, 21 Apr 2025 20:10:44 -0400
X-MC-Unique: xJs2pQIjM5G2ljV7YTSHtQ-1
X-Mimecast-MFC-AGG-ID: xJs2pQIjM5G2ljV7YTSHtQ_1745280644
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5e28d0cc0so759919085a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 17:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745280644; x=1745885444;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UDtoLS1gBPoKuxtRvVU2gx7fBBeeu41JuptA9opePq4=;
        b=FOioPkQ1xtiZ6aN6tsD6UC+NuR7e2yYXthHrokxyfjUqqu/ie3sHHLkNIoDjl/+OeK
         OHzk0KyFgIYauIqyLZ53w/FsyBNImxarF0U7I9wBJyD84Z/Z0ivqsVqZV7h2o/3KyGrk
         csqOZpo/ztQyGVJW0vxAnVJ2Cuq+h9IYvWvgFwAuA6+oI9qreWXRFwySq234tSJNCTAG
         iyjvpV7SnA8u+51gOuSS/IO59GWTFl49jfebZFFv5ACpwFMeCVhfqARfslLv8Vyz9t7o
         Xre4ktvMm1QqqvIqJ/nvlf+fvJGNqbOEAj8M+0R3J/ACjwTDAxrJHQdHhgDhGQ2PRH5g
         wg4w==
X-Forwarded-Encrypted: i=1; AJvYcCWLZPlEzLFof9I/Cm3zlIy3PEqzjHXftZAsuRVDyFnoSwq93OJU1GNOTnPfvG0wjRJ/IYHeee5TENYChLU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSr8OUZNBS9WNFJSGaA9XN5C+p60m0A7F6aVNtIeaEiSVpm/5C
	frgdJv0HxyKaqC4/vLxMm1nlTyVrf6cVc0Pm6QLAIcCUpg/8dXQ+z0nPf6vggjs7uvMOwi2UkQ8
	46KgSEl2i72qG5VD3oyAC1YZyEO83DZ1uwdxN9DJZ4CEwNuAnqVMN35JA1R5FQA==
X-Gm-Gg: ASbGncv5DN/u1P2XI2tGq6xLhHQQUzrMNIEZv44BNFA+e77GvVVLoA1CrDgD3WWejUo
	4gyh8BqNWzoQ3pzcbuI63A8o3JAzKLFF3gnGMdxy2AXYJtakpJkx7GvuW3HylV+fwyx8OckAAag
	cdYWC+A9NljyaaMpHpjlUbOMMMWTKD7Dc4/GOzaEIEVUVaIG1wHkcT864QMGcXRmKogDcU1iTRd
	cNOBAnCwu4Xn+QTxIAoCI6vjPrGT32BAANhhFzwWASritGt7e81BbP16mSCiuTy7kJo67F5cNAG
	dtNBMzOOx8SOvo4A5rnc/8mZGNls5hm+283uUdJsbMPCKLqqvrCKUWQClg==
X-Received: by 2002:a05:620a:3902:b0:7c8:c97:627f with SMTP id af79cd13be357-7c92803946cmr2242838985a.46.1745280644267;
        Mon, 21 Apr 2025 17:10:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE6cQMQH+I86QARuGvdAqE6cTglxCEoXqyfkreYE8mt033hhYtUssBCdHGEdhmRbI12nDLDRA==
X-Received: by 2002:a05:620a:3902:b0:7c8:c97:627f with SMTP id af79cd13be357-7c92803946cmr2242836185a.46.1745280643960;
        Mon, 21 Apr 2025 17:10:43 -0700 (PDT)
Received: from ?IPV6:2601:408:c101:1d00:6621:a07c:fed4:cbba? ([2601:408:c101:1d00:6621:a07c:fed4:cbba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925a8f8c5sm480770885a.44.2025.04.21.17.10.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Apr 2025 17:10:43 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <3478a69d-b4e9-4561-a09a-d64397ced130@redhat.com>
Date: Mon, 21 Apr 2025 20:10:41 -0400
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
Content-Language: en-US
In-Reply-To: <ekug3nktxwyppavk6tfrp6uxfk3djhqb36xfkb5cltjriqpq5l@qtuszfrnfvu6>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/21/25 7:15 PM, Shakeel Butt wrote:
> On Mon, Apr 21, 2025 at 06:59:20PM -0400, Gregory Price wrote:
>> On Mon, Apr 21, 2025 at 10:39:58AM -0700, Shakeel Butt wrote:
>>> On Sat, Apr 19, 2025 at 08:14:29PM -0400, Waiman Long wrote:
>>>> On 4/19/25 2:48 PM, Shakeel Butt wrote:
>>>>> On Sat, Apr 19, 2025 at 01:38:24AM -0400, Gregory Price wrote:
>>>>>> +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
>>>>>> +{
>>>>>> +	struct cgroup_subsys_state *css;
>>>>>> +	unsigned long flags;
>>>>>> +	struct cpuset *cs;
>>>>>> +	bool allowed;
>>>>>> +
>>>>>> +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
>>>>>> +	if (!css)
>>>>>> +		return true;
>>>>>> +
>>>>>> +	cs = container_of(css, struct cpuset, css);
>>>>>> +	spin_lock_irqsave(&callback_lock, flags);
>>>>> Do we really need callback_lock here? We are not modifying and I am
>>>>> wondering if simple rcu read lock is enough here (similar to
>>>>> update_nodemasks_hier() where parent's effective_mems is accessed within
>>>>> rcu read lock).
>>>> The callback_lock is required to ensure the stability of the effective_mems
>>>> which may be in the process of being changed if not taken.
>>> Stability in what sense? effective_mems will not get freed under us
>>> here or is there a chance for corrupted read here? node_isset() and
>>> nodes_empty() seems atomic. What's the worst that can happen without
>>> callback_lock?
>> Fairly sure nodes_empty is not atomic, it's a bitmap search.
> For bitmaps smaller than 64 bits, it seems atomic and MAX_NUMNODES seems
> smaller than 64 in all the archs.

RHEL sets MAX_NUMNODES to 1024 for x86_64. So it is not really atomic 
for some distros. In reality, it is rare to have a system with more than 
64 nodes (nr_node_ids <= 64). So it can be considered atomic in most cases.


>
> Anyways I am hoping that we can avoid taking a global lock in reclaim
> path which will become a source of contention for memory pressure
> situations.

It is a valid conern. I will not oppose to checking effective_mems 
without taking the callback_lock, but we will have to take rcu_read_lock 
to make sure that the cpuset structure won't go away and clearly 
document that this is an exceptional case as it is against our usual 
rule and the check may be incorrect in some rare cases.

Cheers,
Longman

