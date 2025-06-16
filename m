Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 522E41FFC6D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 08:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750063172; cv=none; b=Rzwu+Q0cvmn+1HgJDnffG59BgB1MgK61uUMFF/Xdx1lzJWNXgdVqNQyL4GrBjlcIe0zK5XHv+tFwCQGKoy9c+sYaUIy44M3Wt2Uj/MSpniFQ0jrm4S2kCAzV4jEoi4esx0S9eTheSPc9aqC9szJK1nmZQL+fp0NBYCmKAsy9Jfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750063172; c=relaxed/simple;
	bh=JhLSxV8gyJETeRAkniLfN4QilxzJCpNvwbE1bb9LJWs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IQCjDLz3Xvh8Kw8Zg9gSLQqAulKLgSZxnK7jJfpry3t2U/fi1JIjPriFp1u2AQKlwn8VpNoz8LZXp7KVK2ubqGIu8S62oQeYHCqcxik4x2zaKM8wVglLQQQVgNK5ZnTU/+bj1aB7bd/qKJPhLRoi1XtMhQUJmHAlujLD8SPU/6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IjS8FInV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IjS8FInV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750063169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gQ+A+OQpFPTCtvh0UZh0aRK7+3Mdmy6njblfz5sLedQ=;
	b=IjS8FInVRz9g41hu3aGyjU2XC1x5TPQx6KzB1lgJ2PjFb6CcLl5rT7DIXBuTu4HiVaRSpL
	nGpzjJELrHQ+0lYQ7yBmsb2fSyivLHsK0G+DoRdYEE+xVxaJBRC9ihipt2ZVxcteTWI7Tq
	9ZStXqe7v8mF1E1mHbLbbQNKTLbeILA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-645-B5ngEvhmNwacf3aTqQEAIw-1; Mon, 16 Jun 2025 04:39:27 -0400
X-MC-Unique: B5ngEvhmNwacf3aTqQEAIw-1
X-Mimecast-MFC-AGG-ID: B5ngEvhmNwacf3aTqQEAIw_1750063167
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450de98b28eso26503155e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:39:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750063167; x=1750667967;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gQ+A+OQpFPTCtvh0UZh0aRK7+3Mdmy6njblfz5sLedQ=;
        b=FPqs3dnReGiJ0hHuNBSDff295zjHPxki17FNgu3y5ZyGLMq+WPdMQ6aI1NVLEoNo8Z
         znpRWA/IKrP1Khf2r+rNKwnD0DYaQaz/B5BAfDw4WWcLgbHcOvgwJc7lz8QrrY6K45lt
         SQqmA+o4+ne+YHuEFEJjCnlI46qDzgLph3CuXG3vP5W6oY5CiDCjXnxC0H5QH6WW54CP
         hAnT0Tb2behSW2aKiJlTyprQC+HtDpiuvqvyo2RNDVq52jxP3PZD86Q8nYxDTUGbpFwD
         yolKuxBHaGXV5ZbExV7whvR/TSoSZ9InTFntzYH+LMGB3G+My0H1Qxdbrz+Dg5MnqUTs
         FYJg==
X-Forwarded-Encrypted: i=1; AJvYcCUJ+Iu/XJVnpKz/5b9yyT6ClZWgpcKfMrDPHpPjVY9O+mFwq/d6Rf5Jti35WAih8837tLxtAVIZIKMiSu0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGe+oc8vnsarQ4ZYMKyZLXOBTumkPhiw65vtydGanUZViS0M/J
	HQ67q73oM+Jd8IrZPWiitk69z2oPvzKN/1lkbQdsM6lB+D+JNycbW8SDAvlrVFXWCSwRMTmAG+W
	UU1QuZHZHZNLDzOe0YmtjEhvH/c5OmDVG7mwuXAj1OFX5Kv+SEaatDNbosdNTzLw2Tw==
X-Gm-Gg: ASbGncuKAdfeyI/gKuQCvWT3YgFXJAmyzpluAPZ49ZV1W14vFKsbwyNNDPttCYiOxgB
	+7fQYSyOgRcGzMhxbb6EME0LfOXXz6Ys23vRwMrDYZxbs5MzUzOGentPptFwxtxTrXUjCAi8hWR
	EoThufcTUVUYnZyH5sAuF0JYqolxjXj3Zlab5x7amXZ4GCpMJa0YHD47QcwzTb6ISB5DWjnsQOU
	RxPp2nL+A0Q9TdiDx+4CMqhDRVwBv8Jbj5rbe9DoqmaMzFwg7zm7czZocHHIbWeXROuN8FJQDWP
	gVwiZMUDOkwppnUITX5v6CM1TG7LvMkJrhKOhxlUQyiNirfnWgsXidE0DUWopdnHbj4mi6E8k3p
	0yAdNl/JUa6ikJEXNHeW/u18HXS8HFVqwOUFcoHpoJCFmBzw=
X-Received: by 2002:a05:600c:5304:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4533b24b813mr89732225e9.7.1750063166711;
        Mon, 16 Jun 2025 01:39:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+LZsfT9emeGTtuYfgK5NZrvF8elFbL/tjrMWX+w37OHvAQ4QnQ0IzYTQpGMke358CgR1mrg==
X-Received: by 2002:a05:600c:5304:b0:440:69f5:f179 with SMTP id 5b1f17b1804b1-4533b24b813mr89731885e9.7.1750063166246;
        Mon, 16 Jun 2025 01:39:26 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:bd00:949:b5a9:e02a:f265? (p200300d82f25bd000949b5a9e02af265.dip0.t-ipconnect.de. [2003:d8:2f25:bd00:949:b5a9:e02a:f265])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e24155bsm135891305e9.17.2025.06.16.01.39.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Jun 2025 01:39:25 -0700 (PDT)
Message-ID: <10c87a0e-c9fe-48fe-9bbd-16afd244b4ec@redhat.com>
Date: Mon, 16 Jun 2025 10:39:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/10] mm,memory_hotplug: Implement numa node notifier
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-4-osalvador@suse.de>
 <2bec8b53-f788-493e-a76e-1f804ed3aa0c@redhat.com>
 <aE_WG6bnjtLBzCp8@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aE_WG6bnjtLBzCp8@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 10:30, Oscar Salvador wrote:
> On Tue, Jun 10, 2025 at 10:10:21AM +0200, David Hildenbrand wrote:
>> On 09.06.25 11:21, Oscar Salvador wrote:
>>> +The first argument of the callback function (self) is a pointer to the block
>>> +of the notifier chain that points to the callback function itself.
>>> +The second argument (action) is one of the event types described above.
>>> +The third argument (arg) passes a pointer of struct node_notify::
>>> +
>>> +        struct node_notify {
>>> +                int nid;
>>> +        }
>>> +
>>> +- nid is the node we are adding or removing memory to.
>>> +
>>> +  If nid >= 0, callback should create/discard structures for the
>>> +  node if necessary.
>>
>> Likely that should be removed?
> 
> Yes, indeed.
> 
>>
>> It' probably worth mentioning that one might get notified about
>> NODE_CANCEL_ADDING_FIRST_MEMORY even though never notified for
>> NODE_ADDING_FIRST_MEMORY. (same for removing)
>>
>> I recall this can happen if one of the NODE_ADDING_FIRST_MEMORY notifiers
>> fails.
>>
>> (same applies to MEM_CANCEL_*)
>>
>> Consequently, we might simplify the cancel_mem_notifier_on_err etc stuff,
>> simply unconditionally calling the cancel counterparts.
> 
> So, I managed to do another respin with all feedback included, but I
> left this one for the end, and here I'm.
> 
> It's true, currently users can get notified about e.g: MEM_CANCE_ONLINE without
> going through MEM_GOING_ONLINE if another user fails for the latter, but I'm
> trying to workaround the fact why that's not a problem.
> 
> Because assume you have a user of MEM_CANCEL_ONLINE, who thinks it got called
> for MEM_GOING_ONLINE, while in fact it didn't because some other user fail on
> it, and it tries to free some memory it thinks it initialized during MEM_GOING_ONLINE.
> 
> Isn't this a bit shaky?

It's suboptimal yes, But to get it right, you'd have to remmeber for 
exactly which notofiers you performed the calls ...

> I mean, yes, I guess we can put the burden on the users of
> the notifiers to not assume anything, but then yes, I think we should document this
> as it can lead to potential misbeliefs.

The burden is already on the users I think.

E.g., virio-mem maintains a "hotplug_active" variable, to detect whether 
MEM_ONLINE was actually called.

-- 
Cheers,

David / dhildenb

