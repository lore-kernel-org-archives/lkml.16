Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926EC4C85
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745034814; cv=none; b=tQNN+W4er/PD8ZD8b081WhGn5gYULpWgP03L22oK5kq7kBPenonETaAASHoRL5PTq6Nl8YEKwx5DkMjnHcF4W1e9JgAVQFezFirvqJw9i6Mr2xNLb0uw2hMK3TXo5+cI81ufGTLy4PqLNSXFvTg87GnpN/o+YuZLvovUdUX9yug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745034814; c=relaxed/simple;
	bh=m8/Y+RAsAwHCoUFV/ZSWZGe/vaNjtvZvo9KlkoCyLkc=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=OLNi/71OQWhBwjrY1OeFZ7zZkupV/lZzdpvXhMZEpFw+d96mnB6bGm+cPzjSBWPiyVh8hGNHGFGskkexlUt/8XpObA/RaVLZdKAds8qKUHfgWnLfO1abke1tPD/xR4S8rnI5R0XnYj1LUfPitXqM9Cmkt1CVJFDO13qmb2L5ggs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=a+8RvHYB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="a+8RvHYB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745034811;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LKj6D7ydUvkkkHiFxc83MdzWfmUREj8+ls6NLjJlCpY=;
	b=a+8RvHYBwIIwcGKqtVCSAM5s7mVYgcneYfgq95hh/CDet/BEJTWEQxDwA+Fur319YqRqSV
	zXZ7R9cknA3p406iQg/L9sAmk1sDax2LDBd7wEHVeKZkweAVA3P/HF0KKomDu+J+h9l5qb
	leicxcqkykoAqiqEo+WsR/Q23a0Gd6A=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-58-fr9oHE5QN4uJJpZe_MVyqQ-1; Fri, 18 Apr 2025 23:53:29 -0400
X-MC-Unique: fr9oHE5QN4uJJpZe_MVyqQ-1
X-Mimecast-MFC-AGG-ID: fr9oHE5QN4uJJpZe_MVyqQ_1745034809
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5f3b8b1a1so316322385a.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:53:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745034809; x=1745639609;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LKj6D7ydUvkkkHiFxc83MdzWfmUREj8+ls6NLjJlCpY=;
        b=xFFID7Lbt5vCYcKf/+f/HmedBDwY+FDAM3bS4FKQ/RUKDrm1ZZY6AuweaLDnMheYRc
         P6rVikvXj/8bRV9m1YXrhkiU4ZT+eO2E6XepXWB6KbrQUSX3AG12z2UvamqO2ikaDXjN
         AA8vsCmKH75t5NUhlgusFd3PjsR7df84Ie4r3you4NZKpS19u58LU10pf37BWI8J9PPL
         bGXZlubW8rGvjt4vEjpG6BhJm/XjUxYjEDFgPRNdXAEaLtVmVAsjyD/MxU25b6sPanGH
         OA8sw+IQJ5iL2ZH+jA83X0apsjBLjq0cW1m+B5AKDhSZRNWm46eXOONaw68UkveutLmJ
         ZrCA==
X-Forwarded-Encrypted: i=1; AJvYcCWhChqW4hb2uSccO3MW5XaQiSjcAr5c9vN/bgSj9j3TY03853T4kNN0XqShmL7GDJmGCuzaiGG7XtW6rtA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yweqql8uS3E+SifhqZt5RbZdj92axC8CwCO11U3U4pkKOA2dT0F
	KEI7CV4Krg7mko9kF5fPre6ocR7Ys8fc2FB5OIjjlVOUBHNNPp3hPauhhFipegWIwecxtIprHWw
	Lzl5qx7AjJwJspbMLquBtMuqYy35AvFaWGdDhBohtOOsnnA+h+hC/uHJK+O6qVA==
X-Gm-Gg: ASbGncuVNW2G776BDrvLalKM613CBZL9JpFmFXGEiiZMYTb/ouayiY54ZBLnPbWbV6h
	qDFx5Kw7zD4b3qFKC7LWUm36iUx35ymjRpV0cu73E9Yl7GxXz3UddO07QhLYoOpzblT3r4XInIx
	/qGuPtcC3r9AVGRj7s4YMpe0jAfHKf8F8Jtnr7Rb7Tl0ddBpFzdo+asO1+825Qv+dEggBnQbiO6
	lVZwuTASLoeRHKAEIlVwHmyhtfEi4QqDdSXjQLE9mihOaHyRtOCcwC4rJMCpFxV3WhptGYHMiaZ
	BIdqNAFXY8Iog3PBGXN8lzo34yUu3V/+TNBnUyUMPBrZ0nM11g==
X-Received: by 2002:a05:620a:288b:b0:7c7:5b32:1af9 with SMTP id af79cd13be357-7c927fa1549mr783892785a.25.1745034809118;
        Fri, 18 Apr 2025 20:53:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHbCaMtgw22RLcM0DduEGN4e9PzjuMCuEVDKnXDXyih6j+UdLAwqczdezz9lgVSPMVUBfIGg==
X-Received: by 2002:a05:620a:288b:b0:7c7:5b32:1af9 with SMTP id af79cd13be357-7c927fa1549mr783891085a.25.1745034808813;
        Fri, 18 Apr 2025 20:53:28 -0700 (PDT)
Received: from [192.168.130.170] (67-212-218-66.static.pfnllc.net. [67.212.218.66])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c925b778c0sm176223185a.112.2025.04.18.20.53.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 20:53:28 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <19e268b0-b6d5-4aab-a4d0-cd1102027f3d@redhat.com>
Date: Fri, 18 Apr 2025 23:53:26 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] vmscan,cgroup: apply mems_effective to reclaim
To: Gregory Price <gourry@gourry.net>, Waiman Long <llong@redhat.com>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, tj@kernel.org,
 hannes@cmpxchg.org, mkoutny@suse.com, mhocko@kernel.org,
 roman.gushchin@linux.dev, shakeel.butt@linux.dev, muchun.song@linux.dev,
 akpm@linux-foundation.org
References: <20250418031352.1277966-1-gourry@gourry.net>
 <20250418031352.1277966-2-gourry@gourry.net>
 <162f1ae4-2adf-4133-8de4-20f240e5469e@redhat.com>
 <aAMc0ux6_jEhEskd@gourry-fedora-PF4VCD3F>
Content-Language: en-US
In-Reply-To: <aAMc0ux6_jEhEskd@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 4/18/25 11:47 PM, Gregory Price wrote:
> On Fri, Apr 18, 2025 at 10:06:40PM -0400, Waiman Long wrote:
>>> +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
>>> +{
>>> +	struct cgroup_subsys_state *css;
>>> +	unsigned long flags;
>>> +	struct cpuset *cs;
>>> +	bool allowed;
>>> +
>>> +	css = cgroup_get_e_css(cgroup, &cpuset_cgrp_subsys);
>>> +	if (!css)
>>> +		return true;
>>> +
>>> +	cs = container_of(css, struct cpuset, css);
>>> +	spin_lock_irqsave(&callback_lock, flags);
>>> +	/* At least one parent must have a valid node list */
>>> +	while (nodes_empty(cs->effective_mems))
>>> +		cs = parent_cs(cs);
>> For cgroup v2, effective_mems should always be set and walking up the tree
>> isn't necessary. For v1, it can be empty, but memory cgroup and cpuset are
>> unlikely in the same hierarchy.
>>
> Hm, do i need different paths here for v1 vs v2 then?  Or is it
> sufficient to simply return true if effective_mems is empty (which
> implies v1)?

Yes, you can return true if it happens to be empty, but it is 
"unlikely". In v1,cpuset and memory cgroup are in separate hierarchies 
AFAIU. So the cgroup you pass into cpuset_node_allowed() won't have a 
matching cpuset.

Cheers,
Longman

> Thanks,
> ~Gregory
>

