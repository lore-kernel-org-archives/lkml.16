Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 716781C861F
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 13:08:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743685708; cv=none; b=d8j1pldIelvlRmdNXpZCVjEWTdsBGSwa2Jnn3w0LtHxQ1n3Gz60rWP+q+Y4MFUKkKfvnk+iByifx1SHpI8cIZIszRkBj6TyTqXhPby62lVO2Hh31pCyLysJ+Qx6G0YnzQbbbZPfyzHTOZVKKaI7MSCe2uH41KAwPArw74wVP3es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743685708; c=relaxed/simple;
	bh=W3GcRlKCPnEQ6YJD5yX318+PFCd50RT7pE/DgkOFhkE=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=SFjShYNvN+GfHrng4ckrKyC/jINKZ2Vl55TVqmh+ltBPFmf3e5+MHHvJBwLvNDgkMTs9dGXHxLeuKGhfSAIdk17Oe2AmmXwrroyAwZ8ipTiix9rhqqQGLtFmR00YexWBHL9f25qcgD8KwQ8sgn3gJERiDxS42mBWy9sc9j/a3Y4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K5WamhON; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K5WamhON"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743685705;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UG0JXGQ92TX1JQprqBBj5ySDoKcd5Kcj8ZtJqWU49eY=;
	b=K5WamhON1RssWu9I9J+WRSGrHLSmUlzIB6e0k/IbrlQ3OKMRPIcLFe54fgZayhmFofcFef
	RIJwDNK2xisHtvvs4QHwMD3V4bieL+QJ7EZhzdC6vh0dw7Xg5OdSB300vZS84aCOinW/+B
	+R+kskbt1nENxUx4LxWvXbUlTvgQIIs=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-531-grIDYjhNPjmMK_pKeUNZLg-1; Thu, 03 Apr 2025 09:08:22 -0400
X-MC-Unique: grIDYjhNPjmMK_pKeUNZLg-1
X-Mimecast-MFC-AGG-ID: grIDYjhNPjmMK_pKeUNZLg_1743685701
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d733063cdso7179825e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 06:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743685701; x=1744290501;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:from:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UG0JXGQ92TX1JQprqBBj5ySDoKcd5Kcj8ZtJqWU49eY=;
        b=cPOFcowWso7wcfRowLu7W10IcEFg82IwKvrXJLuKL71Ml1uG8O2v8pTmFtF19USUzl
         miYcfz9ptuRIWUkj2ADsLQET1SFeN0+2IWuXotM2lNpR7O4oAJTOkxF9p9QPXUaDPkz4
         LJIgFsipAS3MNGtq6Q0wbC5TgEq+VD+ed/2JEe6F7Bp3ExWJe6rZzz9LKGqZv+EYY90H
         U5qA1nuZcRvnNMRHtsjSVCsSmjNiHhUVWTsyKBgSA7To8UVV1Zuo6DB3AwHKh+xvNRdr
         +hoAnF5/u10J4K++ZiJR/POo6dFhVeLinzW2bDegEzFBIPb1Z+KkfWQyzRgCz8RQvP4b
         ahrw==
X-Forwarded-Encrypted: i=1; AJvYcCXmSz2+/9cvZCPNVW2jvllj4L/gCkhh++5E2cq2s6PddWfxQ4I2XWdb7mRLVVacLJXGqoHz7J3XXIfAkgY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+asSqwmbW3FZDpczZOQh3OKn28eQpfJwO+yESVU7O/pX6m4du
	D8/ERGKoR5wl0ceYPod1ju53bS9PBGnCSbEKXdxBabeOh5WXghaJI9TSH9bj7jUGnjRQr1QsuIY
	KKevqiih4ned+GyBkg0R7LQAJfh63hMn5JrMUxIt6rMupCg5gxaw/RslngP4uVlrf5sKBWTBF
X-Gm-Gg: ASbGncvtwbIco71L2RLnU/5zOHcfUz8waECs9Pwewk3tLR7tq8URCA4c13NhaotXimt
	UVe04G9wRsxcQy6NwegSphMI+3rIKG6yg6gU+SS1F40fVQO/UCkC4qxDKb6OaWhE8tRe0USNJZT
	QGDWFKBLRyD2Zc480Hhfm4lRXdQdpcb/gtJn0kFq6/ObwnjbGmDl1GktC7yFXNDtUeNVDzgflXi
	erh80vFOGJU12S74hdbtGe+aHat/i1AeDCQSMO/l0k7E9sZYO6HeThlAUq1Ny1Pj81pk/XQaDQb
	9HFVjyqr9I/8NxKXoxAqqHd8iVPAdIcdqFN4po9xk90AU37xpRZwKCYtOgnxYdw15JDF8W0pkEm
	indVLgjg5iOiWY8NLaf8vGllnCiGRFdu3W/EWwdET0Sg=
X-Received: by 2002:a05:600c:1e1b:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43eb5c9588cmr63696565e9.22.1743685700996;
        Thu, 03 Apr 2025 06:08:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFmcyS+7VTW4hwaesOURF5FanebnuaYSox+R/Kxs8MWcv7LhisUBrutJ3czo6sDaeQ9Algdbw==
X-Received: by 2002:a05:600c:1e1b:b0:43d:49eb:9675 with SMTP id 5b1f17b1804b1-43eb5c9588cmr63696215e9.22.1743685700602;
        Thu, 03 Apr 2025 06:08:20 -0700 (PDT)
Received: from ?IPV6:2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4? (p200300cbc70a7b0054a7eb9663bcccf4.dip0.t-ipconnect.de. [2003:cb:c70a:7b00:54a7:eb96:63bc:ccf4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794e94sm21726085e9.31.2025.04.03.06.08.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Apr 2025 06:08:19 -0700 (PDT)
Message-ID: <b9d5a23c-f97c-4d11-b468-5a83ee2e25e2@redhat.com>
Date: Thu, 3 Apr 2025 15:08:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Implement numa node notifier
From: David Hildenbrand <david@redhat.com>
To: Oscar Salvador <osalvador@suse.de>, Vlastimil Babka <vbabka@suse.cz>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Hyeonggon Yoo <42.hyeyoo@gmail.com>,
 mkoutny@suse.com, Dan Williams <dan.j.williams@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>
References: <20250401092716.537512-1-osalvador@suse.de>
 <78c976ba-1eaf-47b7-a310-b8a99a3882e2@suse.cz>
 <Z-1tzl2NqqRUYyU-@localhost.localdomain>
 <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e1ebfafa-f063-4340-b577-d1b6b2fb5d11@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 03.04.25 15:02, David Hildenbrand wrote:
> On 02.04.25 19:03, Oscar Salvador wrote:
>> On Wed, Apr 02, 2025 at 06:06:51PM +0200, Vlastimil Babka wrote:
>>> What if we had two chains:
>>>
>>> register_node_notifier()
>>> register_node_normal_notifier()
>>>
>>> I think they could have shared the state #defines and struct node_notify
>>> would have just one nid and be always >= 0.
>>>
>>> Or would it add too much extra boilerplate and only slab cares?
>>
>> We could indeed go on that direction to try to decouple
>> status_change_nid from status_change_nid_normal.
>>
>> Although as you said, slub is the only user of status_change_nid_normal
>> for the time beign, so I am not sure of adding a second chain for only
>> one user.
>>
>> Might look cleaner though, and the advantatge is that slub would not get
>> notified for nodes adquiring only ZONE_MOVABLE.
>>
>> Let us see what David thinks about it.
> 
> I'd hope we'd be able to get rid of the _normal stuff completely, it's seems
> way to specialized.
> 
> We added that in
> 
> commit b9d5ab2562eceeada5e4837a621b6260574dd11d
> Author: Lai Jiangshan <laijs@cn.fujitsu.com>
> Date:   Tue Dec 11 16:01:05 2012 -0800
> 
>       slub, hotplug: ignore unrelated node's hot-adding and hot-removing
>       
>       SLUB only focuses on the nodes which have normal memory and it ignores the
>       other node's hot-adding and hot-removing.
>       
>       Aka: if some memory of a node which has no onlined memory is online, but
>       this new memory onlined is not normal memory (for example, highmem), we
>       should not allocate kmem_cache_node for SLUB.
>       
>       And if the last normal memory is offlined, but the node still has memory,
>       we should remove kmem_cache_node for that node.  (The current code delays
>       it when all of the memory is offlined)
>       
>       So we only do something when marg->status_change_nid_normal > 0.
>       marg->status_change_nid is not suitable here.
>       
>       The same problem doesn't exist in SLAB, because SLAB allocates kmem_list3
>       for every node even the node don't have normal memory, SLAB tolerates
>       kmem_list3 on alien nodes.  SLUB only focuses on the nodes which have
>       normal memory, it don't tolerate alien kmem_cache_node.  The patch makes
>       SLUB become self-compatible and avoids WARNs and BUGs in rare conditions.
> 
> 
> How "bad" would it be if we do the slab_mem_going_online_callback() etc even
> for completely-movable nodes? I assume one kmem_cache_alloc() per slab_caches.
> 
> slab_mem_going_offline_callback() only does shrinking, #dontcare
> 
> Looking at slab_mem_offline_callback(), we never even free the caches either
> way when offlining. So the implication would be that we would have movable-only nodes
> set in slab_nodes.
> 
> 
> We don't expect many such nodes, so ... do we care?

BTW, isn't description of slab_nodes wrong?

"Tracks for which NUMA nodes we have kmem_cache_nodes allocated." -- but 
as there is no freeing done in slab_mem_offline_callback(), isn't it 
always kept allocated?

(probably I am missing something)

-- 
Cheers,

David / dhildenb

