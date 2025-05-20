Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656301A2C11
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 08:58:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747731500; cv=none; b=WMJVsFS/wgl5uwPa0URVxwwjh/AGGRFt+bQEwjYd0q/t8j9r5oZhWR/MSRjNeeYU2W3r3UCLUvLiYztFNMlVLg9meSoCMBcDE14uDmiyKA2oaW7HR1xi97YzMVdhbjXEYYW3xVtdUstX5HQhqufaWc/bxaY+tLlBfXN4Q+ldP8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747731500; c=relaxed/simple;
	bh=KaAgk9Saa0yrszehoWIQDRLi72PafwU3NySi4nEtl2k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fJQ/hdCyNXGrVMfsRxWoqm6YzoICTyji9gRtpxgUjmdfNIJ1OCWa8H3zCaaKTwzAovCBQhoL8fTHUAHc3LAQ1YV3/lwSAnx9GN7qR4GG4jqtn7/eygOyY8wapNSlzm2CQTlXA6WtCuHDtYYVwkmj4I2wJ7Z7N0K93W+AucF2yP4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VALe0FY0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VALe0FY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747731497;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=eKYhE6Npwiny9HMgJrtNPGLEQ95T/lkzR86eVWEnJ5U=;
	b=VALe0FY0sR7vqyfMm7HaaybkgrkyMxnBZ+7D2g+1XII5OIyo2huYaOb6dEe1aVEmEKvn8N
	OM2h6oDaRdVZhpkCW+PiX4tnHBkc3Ag/9QfV6fhry7z9FyBreacEH+ZAEqknqG1XootOWN
	vBpusRVPgFqXyWH8sTW9AffZt3CE1Vk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-628-3yNmSEj3NOygsFtIbktn5A-1; Tue, 20 May 2025 04:58:15 -0400
X-MC-Unique: 3yNmSEj3NOygsFtIbktn5A-1
X-Mimecast-MFC-AGG-ID: 3yNmSEj3NOygsFtIbktn5A_1747731495
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441c96c1977so37093065e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 01:58:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747731494; x=1748336294;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eKYhE6Npwiny9HMgJrtNPGLEQ95T/lkzR86eVWEnJ5U=;
        b=JnrvxTY5XM7SubY1uLDxZy3yn3YItaLxsspi0In8yIAxsRbboA3it2J0Z1aOVYKKGH
         X6PPJLpPez1grysXP9p0m2POQlnwlXBp5jqw0V2puTgnPge8x/YdC2ey0j2L4CIdUC+l
         dY6QSq7s+BYPjz6n6eFJG5BuaJTMfMn40ArF6qjGX4bv4yqARAsgs/QvC3Dilop88Yk+
         k68H6nvUJa8r77OH8bqtRSMJh8Qf1rN1uQM8Yt++d6dlPREP+/cg1B9h+Vl7Sqa0yKoK
         ZSOvVWfvtqKzVlukVVCmx3WgpHebxXuPx4fhcEuhfBiDpXLE2B/n/sYo/SaZDS8M+jY/
         NURA==
X-Forwarded-Encrypted: i=1; AJvYcCWLIg6xANq8TzA39wnZg8cqxGDG/L29F6EPuf6NQJK+KuJz/wpegyTNRorWhBeNLBy0hXv535/vNEzZFSI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrDThmQpGgD2DvOq9ugUJx9NBBnOnk/WrQDTqJjVfVl9iYGwsM
	M0Y/Gne1bfmTTw+sFIbx4U4eanRnIFo3C9YoJC25UA7rvfCyecLsU2hjGS877iOXnnDansdOrs7
	bYiuyCPeAIzVBIWVblMPlqS8hSZEMbHsVga6us2PjdCobG/d6PamMW0jz1P+x89gmsQ==
X-Gm-Gg: ASbGncuAsvRqlfV20UPE9evlNJdPGCbYU1RlCVYIOBR9GGV+K76joe1LkdNZdjEuxr8
	1YOjrCa8X+CKyhmsNDoLTD5MjXGtoNAenlqX4q2sniapeXNmUDFVXMs1Z/V+9KxyU+w8iTdyuhv
	WUkfRBFd9lxc0+McAjvTmytX4cePpvkpLEDRG4SzetK1FEnz/FGT3smLKe4DPb+B45TcRMvMgl4
	h2SJNmJ4+Didg2C6QJcGZL03xJocwB9codLIjiSiErDK7rYbMVFqU1DKGT5E0QJf6rwoYYU81XR
	fgZEYiSGDvsNsNyiVWVBtqh+6hbp3CzCQ0nExpyDyFzwizENIhPNzebp2AaAct7Q+so4ZxmdRZP
	aUOzNBKAZb6SLtmbiP+RzDqPUmrehsLMLwJAJ4ho=
X-Received: by 2002:a05:600c:3d8e:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442ff031845mr127184235e9.21.1747731494674;
        Tue, 20 May 2025 01:58:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0veqUk7lprhfzGLoxgvlVWSHOOeOIZsiiCIGmoqXRxnOz0tOKJXkAThxIWgexniEAgt5mcQ==
X-Received: by 2002:a05:600c:3d8e:b0:43c:f87c:24ce with SMTP id 5b1f17b1804b1-442ff031845mr127184055e9.21.1747731494278;
        Tue, 20 May 2025 01:58:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f16:e400:525a:df91:1f90:a6a8? (p200300d82f16e400525adf911f90a6a8.dip0.t-ipconnect.de. [2003:d8:2f16:e400:525a:df91:1f90:a6a8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f74cce5bsm21632555e9.24.2025.05.20.01.58.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 01:58:13 -0700 (PDT)
Message-ID: <43ab8a08-b577-4e6d-8920-1761ffbc01fc@redhat.com>
Date: Tue, 20 May 2025 10:58:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/4] Make MIGRATE_ISOLATE a standalone bit
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, Oscar Salvador <osalvador@suse.de>,
 Johannes Weiner <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Mel Gorman <mgorman@techsingularity.net>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Brendan Jackman <jackmanb@google.com>, Richard Chang
 <richardycc@google.com>, linux-kernel@vger.kernel.org
References: <20250509200111.3372279-1-ziy@nvidia.com>
 <fed40607-edcd-4338-85ae-7656a374728b@suse.cz>
 <FCED1CCE-B9A9-4B8B-9319-B1002848AC3B@nvidia.com>
 <794d741f-44ac-4cd8-97e8-091f12387f39@redhat.com>
 <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0A1FA061-9E8E-4E86-A479-EFA9FF083D4F@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19.05.25 16:35, Zi Yan wrote:
> On 19 May 2025, at 10:15, David Hildenbrand wrote:
> 
>> On 18.05.25 02:20, Zi Yan wrote:
>>> On 17 May 2025, at 16:26, Vlastimil Babka wrote:
>>>
>>>> On 5/9/25 22:01, Zi Yan wrote:
>>>>> Hi David and Oscar,
>>>>>
>>>>> Can you take a look at Patch 2, which changes how online_pages() set
>>>>> online pageblock migratetypes? It used to first set all pageblocks to
>>>>> MIGRATE_ISOLATE, then let undo_isolate_page_range() move the pageblocks
>>>>> to MIGRATE_MOVABLE. After MIGRATE_ISOLATE becomes a standalone bit, all
>>>>> online pageblocks need to have a migratetype other than MIGRATE_ISOLATE.
>>>>> Let me know if there is any issue with my changes.
>>>>>
>>>>> Hi Johannes,
>>>>>
>>>>> Patch 2 now have set_pageblock_migratetype() not accepting
>>>>> MIGRATE_ISOLATE. I think it makes code better. Thank you for the great
>>>>> feedback.
>>>>>
>>>>> Hi all,
>>>>>
>>>>> This patchset moves MIGRATE_ISOLATE to a standalone bit to avoid
>>>>> being overwritten during pageblock isolation process. Currently,
>>>>> MIGRATE_ISOLATE is part of enum migratetype (in include/linux/mmzone.h),
>>>>> thus, setting a pageblock to MIGRATE_ISOLATE overwrites its original
>>>>> migratetype. This causes pageblock migratetype loss during
>>>>> alloc_contig_range() and memory offline, especially when the process
>>>>> fails due to a failed pageblock isolation and the code tries to undo the
>>>>> finished pageblock isolations.
>>>>
>>>> Seems mostly fine to me, just sent suggestion for 4/4.
>>>
>>> Thanks.
>>>
>>>> I was kinda hoping that MIGRATE_ISOLATE could stop being a migratetype. But
>>>> I also see that it's useful for it to be because then it means it has the
>>>> freelists in the buddy allocator, can work via __move_freepages_block() etc.
>>>
>>> Yeah, I wanted to remove MIGRATE_ISOLATE from migratetype too, but there
>>> is a MIGRATE_ISOLATE freelist and /proc/pagetypeinfo also shows isolated
>>> free pages.
>>
>> The latter, we can likely fake.
>>
>> Is there a reasonable way to remove MIGRATE_ISOLATE completely?
>>
>> Of course, we could simply duplicate the page lists (one set for isolated, one set for !isolated), or keep it as is and simply have a
> 
> That could work. It will change vmcore layout and I wonder if that is a concern
> or not.

Not really. makedumpfile will have to implement support for the new 
layout as it adds support for the new kernel version.

> 
>> separate one that we separate out. So, we could have a migratetype+isolated pair instead.
> 
> What do you mean by a migratetype+isolate pair?

If MIGRATE_ISOLATE no longer exists, relevant code would have to pass 
migratetype+isolated (essentially, what you did in 
init_pageblock_migratetype ).


E.g., we could pass around a "pageblock_info" (or however we call it, 
using a different type than a bare migratetype) from which we can easily 
extract the migratetype and the isolated state.


E.g., init_pageblock_migratetype() could then become

struct pageblock_info pb_info = {
	.migratetype = MIGRATE_MOVABLE,
	.isolated = true,
}
init_pageblock_info(page, pb_info);

So, we'd decouple the migratetype we pass around from the "isolated" 
state. Whoever needs the "isolated" state in addition to the migratetype 
should use get_pageblock_info().

When adding to lists, we can decide what to do based on that information.

> 
>>
>> Just a thought, did not look into all the ugly details.
> 
> Another thought is that maybe caller should keep the isolated free pages instead
> to make it actually isolated.

You mean, not adding them to a list at all in the buddy? I think the 
problem is that if a page gets freed while the pageblock is isolated, it 
cannot get added to the list of an owner easily.

-- 
Cheers,

David / dhildenb

