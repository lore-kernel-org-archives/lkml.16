Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7027C1F09B4
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 18:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745520301; cv=none; b=P7B0UbCu7/Ak2jrprFldNmhd62nGCfzYxhONgr3unXo/UMp1xuHmXejYFcaIwaqGdvGQEbDQSaKPOyM7+EZ9q54u872b92V/VTIG+kJyN9Nko/XOLd/ozkOAHeKKEoyFjZOZRPrJvzQSWol5nUWk1zSSrxq3IIe8bpzEy+LYESk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745520301; c=relaxed/simple;
	bh=CqvbVpvCYn2Lp2iEMGKZgG+6sUWki0clWjgAoslBnPk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UF17HAe5ah4xnPGI9YQVBJhy0rsVwG7z85QOXSAXTq9z3Ke81OZyd/a43PqY2xhwSuRnVZEh0OD8fC5cH5/Gp2q+EDpsWpB9sgpPywgVYLTYDVKIMYc3cmjfXvkzskroLKg3VdeCKCQ0orX+0BHqkZXJMip/Oe+3oXshZm28EOI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jFL5U9+Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jFL5U9+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745520298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=4Wgp7mJTIaWr4iSqP087qB/jzFoWHBMGQ7zhcWzTy3E=;
	b=jFL5U9+QtgTtlSOlAl7Q/CKhq1aYKIPXCZFHDP6XqPfvA8c5KymhfL17M8hCYuhoWg6KgQ
	9HDXW2VLbi524FkUXXD7jzF2eUhBkr6CZvuUf3ykXxWR3L4JVEhmjBFyklQXOOYnRXefCm
	z6UNIAvpo81o4mqAfk6j0IkS24gc7F0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-169-Y_ZrEeOWM5azziNgSEZTLw-1; Thu, 24 Apr 2025 14:44:56 -0400
X-MC-Unique: Y_ZrEeOWM5azziNgSEZTLw-1
X-Mimecast-MFC-AGG-ID: Y_ZrEeOWM5azziNgSEZTLw_1745520296
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39131851046so480734f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 11:44:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745520295; x=1746125095;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4Wgp7mJTIaWr4iSqP087qB/jzFoWHBMGQ7zhcWzTy3E=;
        b=Bi6WODwFgQQHKi1PCE2WP1X33z0lD5HBVjo7xp+6oT3YepEjMdfENXeGk+IHd/cmzr
         CSx6uNk6vo4TJvTKpzA67N1E8XgMaZOZ0ImQmaLXxdfKrXUxuDO4BqQvBGIticAYQmCV
         uPO3QoBB+3I6miPT/D6eORog1PEM2t48IUHelCFjtBvLGUE91Znf/MXBYuLk5ZCfez6b
         pMKlUD5OkcuEz6Ocergn2/2J1ZXz3xEqdH1zzZNZGxbwykI2rmYeBkQQZYbewcjEgUOW
         ec4IROJfaZcQnAlHKLVF4OUypQ5X2AExVoRcXF9x76yVeNwBwaa8r18qA9aw8pEuZz17
         bolg==
X-Forwarded-Encrypted: i=1; AJvYcCVIikxWqAbvd9GP89Ab5MnXuEUXIHH5BGPzODjfGaEoVPW424sW2UCwcBjJPodxDBNBrczTUqai+Fdcsxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzoLMJOqRcKt6+g5JGhxxoe/ExC4IY5ECgrSyrcI/Yb2nE6jEBq
	m6b8Hln5Unte/1AKNyIxl2oc8cMtxYPcKm9jCQGPgJDOMo678i6TyWmF8uKvzEeEX9OadfcAH+U
	0Oc5ehmiz1PYnrnpt9OHBxnoLZp8Ofaow4pFg8r14RXF86zLlRe2H/Jt9ho6vCw==
X-Gm-Gg: ASbGncsuBS30l0y+shKuNWYAPE+2L3jOQmKQ+jyWT+FSa3lCYQSgTtxt9WhfCw8gEnQ
	WPxtgZXoT/bb5SoRKdzW8bANaQQ1K+455Pp6sgf5OlOz1oMbC0WkZ8+ynirsylD5zAgoSMcMg4A
	0sqhw6k1Sy47i5lI4aj+yZLFxTkepavNWD2pJgF7I3C2vpw4+aKgX8jTkPurbfwFR46bwTeZWBs
	/kdEWx9sfCqcufbjB2ERTWq/XuT8MXx/NLEn6z4W9tbKkYDKCU+DoI/VB/Wv6R1a1WRjlIHRxjf
	NHBOIFhP3UtY1Ci5jBJyvHoTSWeYQU/L/L015zPU
X-Received: by 2002:a05:6000:1845:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-3a072bec7bamr352119f8f.56.1745520295618;
        Thu, 24 Apr 2025 11:44:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVrk0FlqgHVF3dFVdVkNQORTSoJDd7kHK+rTY2xooC8UvM8KNQSh1LVG3nMO2+UDuefg0LEg==
X-Received: by 2002:a05:6000:1845:b0:39c:1257:dba8 with SMTP id ffacd0b85a97d-3a072bec7bamr352098f8f.56.1745520295142;
        Thu, 24 Apr 2025 11:44:55 -0700 (PDT)
Received: from [192.168.3.141] (p4ff23144.dip0.t-ipconnect.de. [79.242.49.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073e5d479sm47286f8f.92.2025.04.24.11.44.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Apr 2025 11:44:54 -0700 (PDT)
Message-ID: <bc0b7131-ae02-4675-9a21-23d432c20f19@redhat.com>
Date: Thu, 24 Apr 2025 20:44:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm THP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, Zi Yan <ziy@nvidia.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250424111632.103637-1-lorenzo.stoakes@oracle.com>
 <aAp7ggknCytUyAXd@casper.infradead.org>
 <40e69993-e83b-4019-943f-ab90a43eb0de@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <40e69993-e83b-4019-943f-ab90a43eb0de@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24.04.25 20:11, Lorenzo Stoakes wrote:
> On Thu, Apr 24, 2025 at 06:57:22PM +0100, Matthew Wilcox wrote:
>> On Thu, Apr 24, 2025 at 12:16:32PM +0100, Lorenzo Stoakes wrote:
>>> As part of the ongoing efforts to sub-divide memory management
>>> maintainership and reviewership, establish a section for Transparent Huge
>>> Page support and add appropriate maintainers and reviewers.
>>
>> I'm quite queasy about this.  I'm doing my best to make "THP" disappear
>> as a concept.  How would you define what THP is?  Originally, it was
>> PMD-sized-and-aligned allocations, and some of the way we expose it to
>> userspace, that's still the interpretation.  But we also have folios which
>> are of some hardware-defined magic sizes, as well as (for filesystems,
>> at least) random other non-zero orders.
>>
>> Memory is just managed in variously sized quantities.  There should be
>> nothing magic about "THP", and I'm still annoyed at the anon-mem people
>> for baking various magic sizes into user-visible APIs.
> 
> Right, but as it stands, we already separate out handling for a whole host
> of different THP things by file, which get_maintainers.pl knows nothing
> about.
> 
> For:
> 
> 	include/linux/huge_mm.h
> 	include/linux/khugepaged.h
> 	include/trace/events/huge_memory.h
> 	mm/huge_memory.c
> 	mm/khugepaged.c
> 	tools/testing/selftests/mm/khugepaged.c
> 	tools/testing/selftests/mm/split_huge_page_test.c
> 	tools/testing/selftests/mm/transhuge-stress.c
> 
> This is not a philosophical position as to where we _might go_ in future,
> or how we might decide to treat varying folio sizes going forward, but
> rather a purely practical step so these files get seen by people and the
> de-facto maintainer is ack'ed as such.
> 
> When we get to the point where we can simply treat all as the same, we can
> reflect as much in MAINTAINERS too, this is not set in stone.

Yeah, I think we all share the same long-term goal of not even having 
huge_memory.c anymore; it's simply not going to be special anymore.

My hope is that with the planned "auto" mode for anon (m)THP we'd be 
able to switch in the future as default to a "let MM manage all that, 
it's now smart enough", to slowly phase manual control it out. We still 
have to deal with the legacy Huge/PMD-mapped stats that keep annoying me.

Personally, I wouldn't mind moving it under MM core already, but for now 
this might be better to find the right reviewers. As you say, we can 
always adjust -- especially once huge_memory.c goes away because it will 
simply be memory.c, or whatever that file will be called then.

-- 
Cheers,

David / dhildenb

