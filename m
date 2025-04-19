Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90EA75D477
	for <linux-kernel@vger.kernel.org>; Sat, 19 Apr 2025 03:48:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745034484; cv=none; b=hybTtGaw58CprtSZI5GCYBUyv5MXborpA33isTjHj9oTXKIlXtOTt3yh2EmzZkmyWkV+ndYxKBXTxtceagY0vq1eoYlIgX+Ki79kLfM8GSmAiJG7mAmQK1R31z4CHIwkA8+pqhpe3qNIB1x68n7+jFAtWN/fbz2iO8fSOk1qf8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745034484; c=relaxed/simple;
	bh=aW+J9nwCbuGtf9DSQt/O9uZhkn0wSA1UgTiwYLdmLcg=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=gkXmH0b9L6qls4SDFFFKYB4SVQaIuy4mMbzflCt9bwDorYjKDjiOPt7GCHHOOU1VoUwlZA7iwoLYbza99Bwqcr/BBRukKcQoP8ouUV6rhJfN8h+4GozDstxzW9Ort+SdARTfAmQ3ZRzJIv4H5f9Ea8UvHTEmElxdv7z93fU9Pz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHOg8rJ4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHOg8rJ4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745034479;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=euRBpjQMecmcoooO18bxyQ49tEv+DDvKLc7+lXs5X2Q=;
	b=BHOg8rJ4LGGj+7obVHi1tfMEgQR26uqp9J5K9T1SStPSxvErXCzfD+vi/t9clVTFvQPP9E
	w9UpqkmOIgkFJLvBTNP3i/lqdDU2wB2j0euW8C8CmdJFKnquYMYPXOWzMOOTwPGMl+/EMJ
	HHPFPXZXO6Jeh0QFSAfMV7IuDuNkB8M=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-206-ZVBcRf53P02vumEMSDAr7A-1; Fri, 18 Apr 2025 23:47:57 -0400
X-MC-Unique: ZVBcRf53P02vumEMSDAr7A-1
X-Mimecast-MFC-AGG-ID: ZVBcRf53P02vumEMSDAr7A_1745034477
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e8f4367446so27795866d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:47:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745034477; x=1745639277;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=euRBpjQMecmcoooO18bxyQ49tEv+DDvKLc7+lXs5X2Q=;
        b=iqFmCDdyNTgvBUcHpKRcrJUgC1Cwbo+pT0KORv84kc3eH0NVIw1PQJNbnhXdEe2xr+
         +eBd+xNxV7Mz+PlU1LD3lmV6BVTMwM2rdNVON+i2Mg7oR2t/ASRYoMjg+yVa12qblAQg
         nLNfQGUmDY0O6j34jEXMkIidWdIZWsTsTE5e9No5pJy2O6UZjKVc/cW7ZddbhDqjB3pZ
         wociQR+jRCJl0yZU0OUE6jwmzv802lZVUyJwhK9ZjzFGfBNQWf2DHusSIBv9KavMOn3z
         EpJ+Xn+YdZ2aXNzIAajAXkO4oWnZUC8CTJmKDiSMqdlzCntRIdJyaGpAfgVxGYtDSw9U
         MLhQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaNxOYOyLBPmS9r85bGkc4x9ilcGFw0PnnMiMjjrLeQvCAJh/cJB2Im8dl25tdgu8tyYkZ6N3qOVhCHDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN6Ct6ZWl+qRc1HW0iPZnIMOadotTevq/tH78aH6vRHhTHrXte
	wdMAJ3EW1rdHOpMA2dKW75qX0w2wJJZ+jvic0k5oYzkYthVv6XrU0f/w3/Y6d5WFHwqXi2PSjwj
	lU2JcKlPpZwH8cQP9DCKQyVj3XWyfC5bGBlIAtp8U5aSSyVabAqMehdw0h9cCuw==
X-Gm-Gg: ASbGncvaKtFrxgwQcgabmIUzIqoUr1ArLdHRVlziFXvk1UAOzm6B3wizbtjRm3x7hr2
	TzBs+D6Uy+z91v1H5dlLIzgZwInMeXuyzb+0/D0abYjjfetoWCnY4KdT/yQvfEaUewNrdhHQthE
	2p9Pmmap1jHvpnmgoXMiIwL+rK4NyJG30/FgfzahR1XYCJ4bwYbnx6ED/xqBdB5miX38CpuOCKy
	m3RuM4QJRC2+FcKsYDcC6j9iNR5mISot2PfMzawhs4lVzW54ygjdo7/9AjoMbNkgAb3lpfSBbbI
	yFGyIV/A7of2Ei2sGtaiyIbHixtzGeJhYaXnT/HNwJvEQRTC9g==
X-Received: by 2002:a05:6214:21ee:b0:6e8:f9e6:c4e2 with SMTP id 6a1803df08f44-6f2c46458c0mr97829456d6.32.1745034477063;
        Fri, 18 Apr 2025 20:47:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGkLsrK0DDA6WUJeYeccHnK40MNGALJUBAhTBwVewhL/xZHtjUTmB0r5Q5IR+oPqEiugxed9g==
X-Received: by 2002:a05:6214:21ee:b0:6e8:f9e6:c4e2 with SMTP id 6a1803df08f44-6f2c46458c0mr97829276d6.32.1745034476762;
        Fri, 18 Apr 2025 20:47:56 -0700 (PDT)
Received: from [192.168.130.170] (67-212-218-66.static.pfnllc.net. [67.212.218.66])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2af13f9sm17594616d6.14.2025.04.18.20.47.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 20:47:56 -0700 (PDT)
From: Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Message-ID: <fd97e9cc-50d7-4d99-a856-3151891eb397@redhat.com>
Date: Fri, 18 Apr 2025 23:47:54 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] vmscan,cgroup: apply mems_effective to reclaim
To: Gregory Price <gourry@gourry.net>, Tejun Heo <tj@kernel.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-team@meta.com, hannes@cmpxchg.org,
 mkoutny@suse.com, mhocko@kernel.org, roman.gushchin@linux.dev,
 shakeel.butt@linux.dev, muchun.song@linux.dev, akpm@linux-foundation.org
References: <20250418031352.1277966-1-gourry@gourry.net>
 <20250418031352.1277966-2-gourry@gourry.net>
 <aAMTLKolO0GWCoMN@slm.duckdns.org> <aAMYOxSOrVpjhtzT@gourry-fedora-PF4VCD3F>
Content-Language: en-US
In-Reply-To: <aAMYOxSOrVpjhtzT@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/18/25 11:27 PM, Gregory Price wrote:
> On Fri, Apr 18, 2025 at 05:06:20PM -1000, Tejun Heo wrote:
>> Hello,
>>
>> On Thu, Apr 17, 2025 at 11:13:52PM -0400, Gregory Price wrote:
>> ...
>>> +static inline bool mem_cgroup_node_allowed(struct mem_cgroup *memcg, int nid)
>>> +{
>>> +	return memcg ? cgroup_node_allowed(memcg->css.cgroup, nid) : true;
>>> +}
>>> +
>> ...
>>> +bool cgroup_node_allowed(struct cgroup *cgroup, int nid)
>>> +{
>>> +	return cpuset_node_allowed(cgroup, nid);
>>> +}
>> ...
>>> +bool cpuset_node_allowed(struct cgroup *cgroup, int nid)
>>> +{
>> What does the indirection through cgroup_node_allowed() add? Why not just
>> call cpuset directly?
>>
> This is an artifact of me trying to figure out how to get this to build
> with allconfig (matrix of CPUSET and MEM_CGROUP).
>
> I think you're right, I can probably drop it.  I was trying to write :
>
> bool cpuset_node_allowed(struct cpuset *cs, int nid);

The cpuset structure isn't exposed externally. So you can't use cpuset 
from outside cpuset.c. Passing the cgroup structure is the right approach.

Cheers,
Longman

>
> and just couldn't do it, so eventually landed on passing the cgroup into
> the cpuset function, which means I think I can drop the indirection now.
>
> Will push it and see if allconfig builds.
>
> Thanks
>
> ~Gregory
>

