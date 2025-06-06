Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79CB41A5B8A
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 12:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749212263; cv=none; b=gXHBeVT5hQO4Z9G8Ah6nCbVxwzfyXpsUu3WIh7TIX+IZU0QO+21A6RF7fkVlxXK/YYANApaLDQmuEQs2GlI8jyJeJysIXILO5iZrYpmHlaxpMMw1uZRKC8j5zWyntzV7LvrPDJQ1NbjyhLuGE1VYQsHgQqmMaH26OZyQMg+KIQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749212263; c=relaxed/simple;
	bh=LPN/4/CnX0MWDBxGhsYOpsuyNF5n+35YxZk989C7Bzk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SJGJoQun4FNXsyDReZZGz7tx+cD2ESv7SfaKAA9aJAuIrLvOdLXYk3srtYkIJg0n6+Uu4Sq6nqWex99GxSKkwi9hABZfOmGMjLph9sJfu3koJ8xpThs8xNUhp8rFYlzeYiSB6zbGyfhQ2726/1KV7haup43yrCBsaQyWOPlzmyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=X5uVwdOm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="X5uVwdOm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749212260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=GHRkVyBKhV6pzfdHyJRH0hXQMYCdZ9SOamOgwI+aK4g=;
	b=X5uVwdOmOY4ZM2rcbNhSDhqISdKjrDHnYdIcnJSpq4cGubJenPGBuQ3evK9SG+JajdlS18
	Ig9bNAQIMCv0Ov06njJwoFEhQd5IzlxJbkaGCP9O0Fa/OojyBoLOf2qTWFEB3jVSXHw6PZ
	QaNoLafABoGbXEjtGDq8Z9ssIbgbJ4k=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-522-Kv9pyxnVOyWGnkfOwp3Z7g-1; Fri, 06 Jun 2025 08:17:39 -0400
X-MC-Unique: Kv9pyxnVOyWGnkfOwp3Z7g-1
X-Mimecast-MFC-AGG-ID: Kv9pyxnVOyWGnkfOwp3Z7g_1749212258
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d244bfabso16827195e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 05:17:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749212258; x=1749817058;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GHRkVyBKhV6pzfdHyJRH0hXQMYCdZ9SOamOgwI+aK4g=;
        b=HZsSJBzQtTTIF6HdXZdZpYyVUXouLxU9UlwBic4vymC9msZlgA3GpVQYwxjorvGCy+
         0HLzCaVn8mfUsYtzHHoEaRvFK9+uCixxz7aL9WLHH9f6o01hoCmhv5xu7dJ+g89OKLB7
         QuFvxXfJsjvDOM3qZNtekySVy5admIw28b1oms660ahsHMzkuUFiqIvYoNbKAed95CYF
         qWq5FgMcxH3IsHNKbYgB2Bhbdo40fq5idBerlGFM9kFC6HfkL9pLCc7aKX2PRzkRUovE
         +cU5HlAxddRyBcBAam/qZKwDNw8HIELpuaBGaCwBoMu4R9HOf81Od++05et7Qf13ARz2
         d8ww==
X-Forwarded-Encrypted: i=1; AJvYcCUW8zMipz2tWFlrqFD+hlYKpcwPK93sdldCz7HXCLnejc124JQW7XH/WC9cYp6kcuAMb7fbm0VSSZx53qw=@vger.kernel.org
X-Gm-Message-State: AOJu0YywcIGx/aVMVdYBNM4bLHSRDm1I3yvNfkWZMGrKuI/8w1gzgQ1h
	Rs2Nv/FIIM/ah+WJrJASyWiGN+PhB2zPMsialXf6dQHypsk+bERArcEUFLRrh6Yf/ZkRrsi71iy
	RmnHYjAbHg53ig+BWPRo56dpMOoIUtJiz1ZpjNwGdt0tCB1X/Cq6HdnoliXGgExo+RQ==
X-Gm-Gg: ASbGncvoEplJWTXRNQH/Ct1/Yg9cYXVeIaSz3Gae3poKTEaUxhj0DFJh9YJiAf/zmaA
	VM45S4eqBKAGmwN07hiR+2eJGynlWVeDUEeZ8svkcsd0w4UXezAlhg9g9vdCINIgDX/JEXT9xwL
	ZIfrZ1KzEfTCMkqxKIGmpViGwemU57gyAK0j4ZR0iTFfZNsl9V4rbsxU/s9dhkUfIUcXXnG5ZpW
	hTuj1NRiOhYEtoUoFyxUdroik65FksaeMyhE0YbF9PqewrqxAyF5aLp7a7i27yq+2gpv6I1XhGn
	r8kuooi9t61pRxb9xIBPfPMOtwyInkOfhrcRjcQ+mx/jVRDthj36ysmz6leN5USJbINoyAJsz9y
	zzXYLlBE73oLnzfF3gLuHvOzzGudebr857aF5KuyqnQ==
X-Received: by 2002:a5d:5f4f:0:b0:3a4:f41d:696e with SMTP id ffacd0b85a97d-3a531cb3b6amr3031820f8f.27.1749212258004;
        Fri, 06 Jun 2025 05:17:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSGCve0R6k3nlrbweRE2iTyTWKy8fzm0cAPddauZZvT2/n1HnveCaavlWJtejPnJ6AIZAKWA==
X-Received: by 2002:a5d:5f4f:0:b0:3a4:f41d:696e with SMTP id ffacd0b85a97d-3a531cb3b6amr3031799f8f.27.1749212257617;
        Fri, 06 Jun 2025 05:17:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53229e009sm1789706f8f.16.2025.06.06.05.17.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:17:37 -0700 (PDT)
Message-ID: <bc7886fd-ea97-48d7-b475-0f2985743680@redhat.com>
Date: Fri, 6 Jun 2025 14:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] mm/gup: remove (VM_)BUG_ONs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Michal Hocko <mhocko@suse.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>
References: <20250604140544.688711-1-david@redhat.com>
 <aEFC_12om2UHFGbu@tiehlicka>
 <1a65d0e6-6088-4a15-9c19-537203fe655c@redhat.com>
 <aEKnSxHG8_BGj7zQ@tiehlicka>
 <e680a8f3-7b45-4836-8da7-7e7a0d2fcd56@redhat.com>
 <aEK_R93gihEn-xW6@tiehlicka>
 <50ff9149-2824-4e57-8d74-d8d0c063c87e@lucifer.local>
 <e5fa4a36-2af8-48e9-811e-680881c06b86@redhat.com>
 <1a7513cf-4a0a-4e58-b20d-31c1370b760f@lucifer.local>
 <fe31e754-159d-49fd-aac7-64af5e313884@redhat.com>
 <b00f0914-c06e-4d7c-b856-93a6610b0459@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <b00f0914-c06e-4d7c-b856-93a6610b0459@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 14:12, Lorenzo Stoakes wrote:
> On Fri, Jun 06, 2025 at 01:44:12PM +0200, David Hildenbrand wrote:
> [snip]
>> I assume with "this patch" you mean "a patch that gets rid of VM_BUG_ON
>> completely", because I want this patch here (that started the discussion) to
>> go in first.
> 
> Yes, and sure.
> 
> I can wait until this is merged upstream and take a look afterwards?

Or base it on mm-new for now.

I'm afraid there will be a lot of competing churn moving/reworking (or 
god forbid, adding) VM_BUG*, and not all goes through Andrew's tree

... so maybe doing stuff per subsystem might make it easier, not sure 
what will be best here.

> 
>>
>> Fascinating how you are always looking for work :P
> 
> I mean I have an insane amount of work to do this cycle anyway... but the Call
> of Churnthulu is loud to me ;)

:D

-- 
Cheers,

David / dhildenb

