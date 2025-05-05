Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6901F4CBE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 13:02:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450129; cv=none; b=cMoOwv0q9RdhCsMT4dk9dwiWJKFYNsGV5ZxSkWVRlVdXKtdlv7vNirnYlc5Jb3P/dVbauSG0jj55fpAUPOeGrjCK+5c8bjAhnnoYp8sNGGZl/U7+rUvyCJtUrINrK1tvIoIbMXjINCsSbN52r8Lat3qd5hvSncS6OQ58198wRW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450129; c=relaxed/simple;
	bh=YT4wEzE+LaSYPfZ5GG4/9s5KZVr1PgtaGdYtjFs1/vA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XAF7NHOaHc/H2XCcGsQKNTNfld5TESUBrHjJoI8R2Yg4l48z2Eu2voamzBJCOmo7uwrirH5xJmCGfz2NU7DKdnWMpPE6IY0s57ZQPCFros5/9+n2S1BW1f84VEyT2gi5INJwlW+2L2QPJUayLQVIO2C0UEuUE6TRJS47VAYXASA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eHVCP4tF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eHVCP4tF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746450126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=lcq9nBP3ZRCfusgIDw58LKjlT4CGzBWjkt+QgAcwfS8=;
	b=eHVCP4tF6GrFPxMX66wV1im1+RI0IiwjOQ0USgzLv4C19Bor0he/vUMarAYMwvQaAIiXPF
	r6Z60PL2X/XXg8xRJKEFsbP0chvK9TcIsdZAHSerQN7C59DLSLZRgRQg4JqPAnJHSQjghe
	95BW63wi/5JIQeYEWELQ8yOusjUU/nE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-316-hxAVsy_4OS6EcCYkKdE0mQ-1; Mon, 05 May 2025 09:02:05 -0400
X-MC-Unique: hxAVsy_4OS6EcCYkKdE0mQ-1
X-Mimecast-MFC-AGG-ID: hxAVsy_4OS6EcCYkKdE0mQ_1746450124
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-39abdadb0f0so1175990f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 06:02:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746450124; x=1747054924;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lcq9nBP3ZRCfusgIDw58LKjlT4CGzBWjkt+QgAcwfS8=;
        b=Z62OGLC80lpZI4Ot3LxpIoI7P7zuZtH9trcehOJ1u7PkfEzPvMRkjfpQMJK0vwbUbh
         yueShnoDTuxY/3ERWR0qWojCagZ3PPSSv5OSdqc+sWeSOPp53OYQ5BzcsqpclQjNIqE6
         MywWYiytlq7biNprwQb1+Gjb2x0wLP1y2D3aT10ELvx7iFVa+PfZMstgH2XeSLRcKc0x
         ILypbeGCECasAb+bHkgWqGXNOyMjOArYuiOkahYilPIFTHDXBOU4PvFj0AsMeLw0LZNO
         Fy2L2507+zxbYzpZPvBaY1NFVGGkh+2v0XCxN1id4iBR+mgmLaaIlLz50Kf73BLtHbJp
         bPLA==
X-Forwarded-Encrypted: i=1; AJvYcCVMNv0wgZ+ZawVtDLcAOsbV5HuVHVeINHVrP0UJW2tXXAhQ6ybYBUKKD9HvC3lpV+EmrIo7KoA+/RgENbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6iTvuxwqUiuiVh5olZ7ddmLH5dhARW0ovqHfIgFGMjOoCk2An
	LbGNgCmoGBykc9jg/YoYSvv5F7YWsvQ54uLo+ygHTQpX03h/GZADoW3Frq5kItbnZLTXxavzoFv
	JWEATFT7KWMkf1WccItDVVlcf3+sBZFic35mhtlO+oAonoKisolDGYpzL0F14cQ==
X-Gm-Gg: ASbGncu16eBP9hfjRmmFiCBXd0nlHmRmp0L3nqjfDgDAxdIPNo/gqBhQd2D5TvGMpkI
	WzM5bgtg3/4815DPIRPOVZb5ILxmtTrN+ElpwcFkZuvUoWhE1sq2WZXtKZrEgCoCDCoy0y6siBO
	fcICu+zXRfcmVWoNYUvtE0/o6m9qdvVPP5x1xD6oe6+8CjugbVrYe0YfZ6posWXz7XlMBtZnv+n
	K5xHaKZPrw56FdhuV8pt3+ooxDPQ7T+5Hpl9uFmuKXmN6uvhi1UF/1iCWiEUVXJjtte+NHpeggW
	Uyl5Y5I+P333f4fibkv35bTPyStkxbsLVhPBhOs5vnrYaQLBBJzwYyFkbEVt9+AtYH93VXbnGaA
	UxJshbyA+oAbgl9vRIYKup827MortEgylXdgW274=
X-Received: by 2002:adf:cf04:0:b0:3a0:a09d:b2f7 with SMTP id ffacd0b85a97d-3a0a09db5c7mr4342555f8f.57.1746450124420;
        Mon, 05 May 2025 06:02:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdvC1DTXrZIPIxmt4B4oCiYR+taOCdOzskFrRBkszS9uF++wO0dkgaJMa9iabo+Xj8Z6FgYQ==
X-Received: by 2002:adf:cf04:0:b0:3a0:a09d:b2f7 with SMTP id ffacd0b85a97d-3a0a09db5c7mr4342508f8f.57.1746450123831;
        Mon, 05 May 2025 06:02:03 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:2400:3be1:a856:724c:fd29? (p200300cbc73d24003be1a856724cfd29.dip0.t-ipconnect.de. [2003:cb:c73d:2400:3be1:a856:724c:fd29])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae7bbesm10162069f8f.49.2025.05.05.06.02.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 06:02:03 -0700 (PDT)
Message-ID: <a8f66175-dd1b-427c-9980-3a376a3c2fb0@redhat.com>
Date: Mon, 5 May 2025 15:02:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Donet Tom <donettom@linux.ibm.com>, Oscar Salvador <osalvador@suse.de>
Cc: Mike Rapoport <rppt@kernel.org>, Zi Yan <ziy@nvidia.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, Ritesh Harjani <ritesh.list@gmail.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com>
 <aBdK2EIMYYRmmEwA@kernel.org>
 <a1e0cddc-ed38-4f48-b028-f3ab5025c157@linux.ibm.com>
 <188fbfba-afb4-4db7-bbba-7689a96be931@redhat.com>
 <aBhoqpC4Jy-c-74p@localhost.localdomain>
 <74c500dd-8d1c-4177-96c7-ddd51ca77306@redhat.com>
 <aBhva9D6H5BtkSID@localhost.localdomain>
 <0e568e33-34fa-40f6-a20d-ebf653de123d@redhat.com>
 <aBiGquz1Exx8KUqq@localhost.localdomain>
 <da921072-64a8-4ef1-b583-763406e57e8b@redhat.com>
 <b539ce77-e994-422d-92fc-2c9505cc26a1@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b539ce77-e994-422d-92fc-2c9505cc26a1@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 05.05.25 14:51, Donet Tom wrote:
> 
> On 5/5/25 4:06 PM, David Hildenbrand wrote:
>> On 05.05.25 11:36, Oscar Salvador wrote:
>>> On Mon, May 05, 2025 at 10:12:48AM +0200, David Hildenbrand wrote:
>>>> Assume you hotplug the second CPU. The node is already
>>>> registered/online, so
>>>> who does the register_cpu_under_node() call?
>>>>
>>>> It's register_cpu() I guess? But no idea in which order that is
>>>> called with
>>>> node onlining.
>>>>
>>>> The code has to be cleaned up such that onlining a node does not
>>>> traverse
>>>> any cpus / memory.
>>>>
>>>> Whoever adds a CPU / memory *after onlining the node* must register the
>>>> device manually under the *now online* node.
>>>
>>> So, I think this is the sequence of events:
>>>
>>> - hotplug cpu:
>>>     acpi_processor_hotadd_init
>>>      register_cpu
>>>       register_cpu_under_node
>>>
>>>     online_store
>>>      device_online()->dev_bus_online()
>>>       cpu_subsys->online()
>>>        cpu_subsys_online
>>>         cpu_device_up
>>>          cpu_up
>>>           try_online_node  <- brings node online
>>>            ...
>>>            register_one_node <- registers cpu under node
>>>           _cpu_up
>>
>> My thinking was, whether we can simply move the
>> register_cpu_under_node() after the try_online_node(). See below
>> regarding early.
>>
>> And then, remove the !node_online check from register_cpu_under_node().
>>
>> But it's all complicated, because for memory, we link a memory block
>> to the node (+set the node online) when it gets added, not when it
>> gets onlined.
>>
>> For CPUs, we seem to be creating the link + set the node online when
>> the CPU gets onlined.
>>
>>>
>>> The first time we hotplug a cpu to the node, note that
>>> register_cpu()->register_cpu_under_node() will bail out as node is still
>>> offline, so only cpu's sysfs will be created but they will not be linked
>>> to the node.
>>> Later, online_store()->...->cpu_subsys_online()->..->cpu_up() will
>> take> care of 1) onlining the node and 2) register the cpu to the node
>> (so,
>>> link the sysfs).
>>
>>
>> And only if it actually gets onlined I assume.
>>
>>>
>>> The second time we hotplug a cpu,
>>> register_cpu()->register_cpu_under_node() will do its job as the node is
>>> already onlined.
>>> And we will not be calling register_one_node() from __try_online_node()
>>> because of the same reason.
>>>
>>> The thing that bothers me is having register_cpu_under_node() spread
>>> around.
>>
>> Right.
>>
>>> I think that ideally, we should only be calling
>>> register_cpu_under_node()
>>> from register_cpu(), but we have this kinda of (sort of weird?) relation
>>> that even if we hotplug the cpu, but we do not online it, the numa node
>>> will remain online, and so we cannot do the linking part (cpu <-> node),
>>> so we could not really only have register_cpu_under_node() in
>>> register_cpu(), which is the hot-add part, but we also need it in the
>>> cpu_up()->try_online_node() which is the online part.
>>
>> Maybe one could handle CPUs similar to how we handle it with memory:
>> node gets onlined + link created as soon as we add the CPU, not when
>> we online it.
>>
>> But likely there is a reason why we do it like that today ...
>>
>>>
>>> And we cannot also remove the register_cpu_under_node() from
>>> register_cpu() because it is used in other paths (e.g: at boot time ).
>>
>> Ah, so in that case we don't call cpu_up ... hm.
>>
>> Of course, we can always detect the context (early vs. hotplug).
>> Maybe, we should split the early vs. hotplug case up much earlier.
>>
>> register_cpu_early() / register_cpu_hotplug() ... maybe
> 
> Hi David and Oscar,
> 
> I was thinking that __try_online_node(nid, true) being called from
> try_online_node() might cause issues with this patch. From the
> discussion above, what I understand is:
> 
> When try_online_node() is called, there are no memory resources
> available for the node, so register_memory_blocks_under_node()
> has no effect. Therefore, our patch should work in all cases.

Right, it's simply unnecessary to perform the lookup ... and confusing.

> 
> Do you think we need to make any changes to this patch?

Probably not to this patch (if it's all working as expected), but we 
should certainly look into cleaning that all up.

-- 
Cheers,

David / dhildenb

