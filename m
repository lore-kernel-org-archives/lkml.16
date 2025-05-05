Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906431F4C9F
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 10:36:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746441391; cv=none; b=FBZc0N41CmtIv9vivF+dy4VWO8jL7two9SNxsNg1Mwm3DCWAKyYToCGuosj+s5OWtrD1GP/iiM30QHgs2tAoI1gyBmck/NO86ExuqpRlqEDQfpHoTYYgC/of47MiKfks6hAT5XYG0CffVh+/wW7AVuJflLyClm8uaTiDKMHWS+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746441391; c=relaxed/simple;
	bh=CQNutlK9UNHnt76nsXRFwd4NkrFpv9FmzqKKfg4guJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LY/qQllVxd4Y8j9NIgUlTf5M1d/0i0kENxhRe5tc/8dI87HlfkG9ZTRAkn9QRaAdyAbY7bOCt9gnX0bTn/V4Q6gttAMNzbQpFAoKmH3BrNXPkBXV5cINPFs9/fZO+Wv/GSgGvj6vdTtxeQ5xE/uprkFLKmPCeZA4vt4/dPLNyVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YaAQe/7e; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YaAQe/7e"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746441388;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pGnqQ4hI3UGZO/gU81qxfEVgtSawijtxkO7IB2//gMA=;
	b=YaAQe/7esuUKreHqScrHrJs1lfMMQRTJXF2sV1wVWioO+Ppk4duPFEaoU6RIfx1FWT7nQB
	J7EnKCyWtukV7wf7ypCxhqnbRtTVWfJRvW9CW9kFfp+zlKo3dYYrmu/8gVvYzJ7u/vcOfh
	+fuvIykDADWXRtyKkclrtEsAXikHLms=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-64-aX3Mk_1SO1yIEMdkDhQeBg-1; Mon, 05 May 2025 06:36:26 -0400
X-MC-Unique: aX3Mk_1SO1yIEMdkDhQeBg-1
X-Mimecast-MFC-AGG-ID: aX3Mk_1SO1yIEMdkDhQeBg_1746441384
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-44059976a1fso18215245e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 03:36:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746441384; x=1747046184;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pGnqQ4hI3UGZO/gU81qxfEVgtSawijtxkO7IB2//gMA=;
        b=jIfH6TNl3N73/nN4VnWM1XQKkFLSHcAHqGKyawuKGzS74b4c5zXInzLNFc59Lsnp+q
         XSjXw3ZYi1SZRBCvTGsD0ZdnLubGfokRU5F1MWQ8iXTGVvSrtZSbKfLypaPDT2AuBFXu
         HT3PdtkKvO0pTnTAWharGVpo3JlDWFMlwQBxB1rfzQF5DIn+k8PiQn0ixDm+yY80QmKI
         qQ1lNOMANAxvShrn9TMGgK2RFPsL1g8XmkHndRFPT55+csOFSNRqZTnv+FM3NwVZh/DS
         RM3sgvI1lYSgPdFb3zMWgb64UK5nNnbhutiH/I38PvC3deUYDYly6oZsJWVix4iPsi+l
         EmFw==
X-Forwarded-Encrypted: i=1; AJvYcCWZ6JSvRzwZ2W18YaGjW4SCeA/Lg8JBNwgaMiTGIDg5oNZy2ksKpzZhdpOT7iqQU1ScBHTkT0hTdoVMzIs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5YgxmtDNqYOe7RVnOz8BWaN2s/Dx+8ZvH/+yJdys9GoRtgI1a
	P2gcSbNOyOyq/na5EugqgRqbsPbKdTl3LltFw3QMoUL8GaxzK3SASZikEC5SJULOWNgtz2AnyuA
	FIFgdusXXPvneCYw6qNJWEMlQCCzV8aEYiiVDP6H16xXLGSc3I5wAA1iLFUkQQQ==
X-Gm-Gg: ASbGncvOc6OKLm1bCffd0w4PyoefSlq22L2wWbEXqb6nOW48ygvegxQyIowDnoMJDUf
	JbhaLBW85Yi3FP83CtJU+XUYRx1zUR/f/1BHYaSS01M0HqNPWVsPy5go8itCM7bqNJAiJ5uPc4f
	QTxsAg9hke6IBlDP6l9kZ2SJrDV2PDinbovBrQs2ET+TQLhIn8fhKQma3O0CJL1FFsTYnqF/9uw
	eldiHOqnAb/WvEmzpbrH41aUH2akNJGnR2N58E6oua4PlCBf67S+A/qvTXfpeV6UMwMGEztaA3I
	13UioKdTCoO6hKWdAEgH/qztcPULWohi8dFWVo2pggal7fhyjk24EZg60QYBRTyoBn7Dr6x5SNs
	GLSjyHg7ad76B1I4uiWxG7534v1SZtyqonseI06c=
X-Received: by 2002:a05:600c:b94:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-441bbf3ba6bmr86298495e9.28.1746441383744;
        Mon, 05 May 2025 03:36:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEl+iWDiBII6+s+OPTR03GF/RjZ/2onikP82sIYnWs4Lp1bZXGJlxpTQByVNX25Hu+SVhow/Q==
X-Received: by 2002:a05:600c:b94:b0:43c:fbba:41ba with SMTP id 5b1f17b1804b1-441bbf3ba6bmr86298245e9.28.1746441383330;
        Mon, 05 May 2025 03:36:23 -0700 (PDT)
Received: from ?IPV6:2003:cb:c73d:2400:3be1:a856:724c:fd29? (p200300cbc73d24003be1a856724cfd29.dip0.t-ipconnect.de. [2003:cb:c73d:2400:3be1:a856:724c:fd29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a288f0sm128698705e9.27.2025.05.05.03.36.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 03:36:22 -0700 (PDT)
Message-ID: <da921072-64a8-4ef1-b583-763406e57e8b@redhat.com>
Date: Mon, 5 May 2025 12:36:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] driver/base: Optimize memory block registration to
 reduce boot time
To: Oscar Salvador <osalvador@suse.de>
Cc: Donet Tom <donettom@linux.ibm.com>, Mike Rapoport <rppt@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aBiGquz1Exx8KUqq@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.05.25 11:36, Oscar Salvador wrote:
> On Mon, May 05, 2025 at 10:12:48AM +0200, David Hildenbrand wrote:
>> Assume you hotplug the second CPU. The node is already registered/online, so
>> who does the register_cpu_under_node() call?
>>
>> It's register_cpu() I guess? But no idea in which order that is called with
>> node onlining.
>>
>> The code has to be cleaned up such that onlining a node does not traverse
>> any cpus / memory.
>>
>> Whoever adds a CPU / memory *after onlining the node* must register the
>> device manually under the *now online* node.
> 
> So, I think this is the sequence of events:
> 
> - hotplug cpu:
>    acpi_processor_hotadd_init
>     register_cpu
>      register_cpu_under_node
> 
>    online_store
>     device_online()->dev_bus_online()
>      cpu_subsys->online()
>       cpu_subsys_online
>        cpu_device_up
>         cpu_up
>          try_online_node  <- brings node online
>           ...
>           register_one_node <- registers cpu under node
>          _cpu_up

My thinking was, whether we can simply move the 
register_cpu_under_node() after the try_online_node(). See below 
regarding early.

And then, remove the !node_online check from register_cpu_under_node().

But it's all complicated, because for memory, we link a memory block to 
the node (+set the node online) when it gets added, not when it gets 
onlined.

For CPUs, we seem to be creating the link + set the node online when the 
CPU gets onlined.

> 
> The first time we hotplug a cpu to the node, note that
> register_cpu()->register_cpu_under_node() will bail out as node is still
> offline, so only cpu's sysfs will be created but they will not be linked
> to the node.
 > Later, online_store()->...->cpu_subsys_online()->..->cpu_up() will 
take> care of 1) onlining the node and 2) register the cpu to the node (so,
> link the sysfs).


And only if it actually gets onlined I assume.

> 
> The second time we hotplug a cpu,
> register_cpu()->register_cpu_under_node() will do its job as the node is
> already onlined.
> And we will not be calling register_one_node() from __try_online_node()
> because of the same reason.
> 
> The thing that bothers me is having register_cpu_under_node() spread
> around.

Right.

> I think that ideally, we should only be calling register_cpu_under_node()
> from register_cpu(), but we have this kinda of (sort of weird?) relation
> that even if we hotplug the cpu, but we do not online it, the numa node
> will remain online, and so we cannot do the linking part (cpu <-> node),
> so we could not really only have register_cpu_under_node() in
> register_cpu(), which is the hot-add part, but we also need it in the
> cpu_up()->try_online_node() which is the online part.

Maybe one could handle CPUs similar to how we handle it with memory: 
node gets onlined + link created as soon as we add the CPU, not when we 
online it.

But likely there is a reason why we do it like that today ...

> 
> And we cannot also remove the register_cpu_under_node() from
> register_cpu() because it is used in other paths (e.g: at boot time ).

Ah, so in that case we don't call cpu_up ... hm.

Of course, we can always detect the context (early vs. hotplug). Maybe, 
we should split the early vs. hotplug case up much earlier.

register_cpu_early() / register_cpu_hotplug() ... maybe

-- 
Cheers,

David / dhildenb

