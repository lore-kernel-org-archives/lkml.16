Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9BA1D86DC
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:25:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750667143; cv=none; b=Qx90S0Be87RkKjcMe2dsy5rWP6vYVsPdMNZkPgFFJfV13u3qfJ5NkwnP3xb00tyBPY83PrGAFy8b1jGxy43MWwbex44luaetHgDOmwpi4s9blHFPlruxrdCijMsfC38XpzvXq9HStBkOTA7HHClTq/t5iXnN4w7oIqNyOxI38UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750667143; c=relaxed/simple;
	bh=O+aRJGtohvWUZw+X7mf1TGvaSV6oARZI12hiHg0BkQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kFHhAjPqAqETKdjWBTNU1SBwR6zjfxuwjochWBfbGe0VogWWD6k93Ak7KXclyQsbrHdro8RRqjHd6PxjKTNGxWtRuEmfF5CY6+tS8gw1vgy2qjvoSIw4oDljOas+G4ZClubxdtgz8Tni7fVjzT43v87qBpPeZ2ap3+/JWtmCHqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRKh1DMy; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRKh1DMy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750667140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0m5iTAUoq6r3d1l7K1S3SLPYa3UlqwKGq4edaxVTHMM=;
	b=SRKh1DMyzRl/ze/t1jh2soZYaeTUWj4kdO0YYx6PEwxVdzHw4A7N78whP7qhQcRx0TyLr3
	dkBtFZlI6k64JfuTYjePAAhPTPLOKTNYkmEXT8WpQfsIaJDcM/J1l9ylqY8seKcHR0ym8g
	Uy5xhXpRgQAKfzHz7kChW7GYLtw/A1A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-wl_MR8kGNHmpa0HjKjiBvA-1; Mon, 23 Jun 2025 04:25:38 -0400
X-MC-Unique: wl_MR8kGNHmpa0HjKjiBvA-1
X-Mimecast-MFC-AGG-ID: wl_MR8kGNHmpa0HjKjiBvA_1750667137
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a579058758so1617430f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 01:25:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750667137; x=1751271937;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=0m5iTAUoq6r3d1l7K1S3SLPYa3UlqwKGq4edaxVTHMM=;
        b=FqZf5nsk8o3L7rJBFDS+pUkHkiGjARZxGAT7XDck2mPn7eZ/D1AyetqkQ8hxPoRfAU
         kSeX9NcNBguzKMopM5Kxh8jBJfdD4u1IAesM0UCfD2TlJNIXmXwe9Yt5HBdWHbzRww2u
         hZ9CeWoQaUtJsIiBfWOjawzzw8BqWT7OFyG/osymjvELtbhQSGoorELlxAr73m3kLkta
         ZY3XYwQr7y/K4Xwv+/PVP/hIp3z/t1MSnfymcy+1Ev0dzwJuAF3QykOZm/YtgGV4rYXe
         RxywnDQ0uI57hEYyOuNHIzORuG15cH6DHFWq2BrChx1w3Psqjb3Th+xTMncNyez3hJfT
         IXFQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEFl1cv7RNqGRtKy1BWdinUEXDdkxN1SDR6Z5Wyae+BRi0wUUPWRrJ/ANwIeN6NN3VyKNE0uyiOjyvBbk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiaQqZ2L/JiQEDfLsWlgchS78Napjso9THJb33DrcnuMCOetmf
	P9XgZ+k0q1UypH+6S/MQVddBDtacuz+P+x8IBmLvvK1tXf3qB3ixV1DqLK4H0Sh5XX5x4ElEc3M
	/kC1FjqcDv+In68A8MFp03gOQIsk6vLW+eOFONpSQlF8gJMw4eqx/q804iEKZ8jZnig==
X-Gm-Gg: ASbGnctwKd9Q3e+3onV7lOaZG8gcBEfxDSGW6f8OzPbir+zqvaiUIha/osC812LljZj
	XpIuFmSfUpzhNDhMBr6llRiRrUsFrSF2rCH64TYAObwNHTSlr0jVDCXyHtvO4wVq7Gf++p34miy
	gjZcvjSV/ueFg8JjkA37mx0h6zanIYHZATw3SfNwCjJbwS/y6P0gEYeiC2HI5ukzPaTAzvNk7w/
	27Ch+dW4m4pdbh/wUjgdgpzAQEBjSkYnCRPnNrvlNXCan6MiBR8Vg5ULcNSSzNrComjgVEbo3MD
	E4lClaKN6KCvLYbcNyD1Xl9kf5Ua1zYqAIWNTxAV3KoPM3Z+Wj64ueJuEIsCw6E899AJ3242GQ9
	2Tqmdo5Cst4cBZ7RkpOBBswGxa5b3m7SzAuxFRMNv3pCdk8cFyg==
X-Received: by 2002:a05:6000:22c6:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3a6d1191e51mr8960674f8f.2.1750667136857;
        Mon, 23 Jun 2025 01:25:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+o5ang83piNSzY65lPCG57PcesJq40iemXN0uJVNRa9V0Dyn1b0YHD4yx6fv+rr7fueyv5w==
X-Received: by 2002:a05:6000:22c6:b0:3a0:b84d:60cc with SMTP id ffacd0b85a97d-3a6d1191e51mr8960642f8f.2.1750667136431;
        Mon, 23 Jun 2025 01:25:36 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d117c71esm8886086f8f.61.2025.06.23.01.25.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 01:25:35 -0700 (PDT)
Message-ID: <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com>
Date: Mon, 23 Jun 2025 10:25:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
To: Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
Cc: Nikita Kalyazin <kalyazin@amazon.com>, Hugh Dickins <hughd@google.com>,
 Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Andrea Arcangeli <aarcange@redhat.com>,
 Ujwal Kundur <ujwal.kundur@gmail.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, James Houghton <jthoughton@google.com>,
 Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Axel Rasmussen <axelrasmussen@google.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250620190342.1780170-2-peterx@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 21:03, Peter Xu wrote:

Hi Peter,

> Introduce a generic userfaultfd API for vm_operations_struct, so that one
> vma, especially when as a module, can support userfaults without modifying

The sentence is confusing ("vma ... as a module").

Did you mean something like ".. so that a vma that is backed by a 
special-purpose in-memory filesystem like shmem or hugetlb can support 
userfaultfd without modifying the uffd core; this is required when the 
in-memory filesystem is built as a module."

> the core files.  More importantly, when the module can be compiled out of
> the kernel.
> 
> So, instead of having core mm referencing modules that may not ever exist,
> we need to have modules opt-in on core mm hooks instead.
> 
> After this API applied, if a module wants to support userfaultfd, the
> module should only need to touch its own file and properly define
> vm_uffd_ops, instead of changing anything in core mm.

Talking about modules that much is a bit confusing. I think this is more 
about cleanly supporting in-memory filesystems, without the need to 
special-case each and every one of them; can be viewed a cleanup 
independent of the module requirement from guest_memfd.

> 
> Note that such API will not work for anonymous. Core mm will process
> anonymous memory separately for userfault operations like before.
> 
> This patch only introduces the API alone so that we can start to move
> existing users over but without breaking them.
> 
> Currently the uffd_copy() API is almost designed to be the simplistic with
> minimum mm changes to move over to the API.
> 

Is there a way to move part of the actual implementation (how this is 
all wired up) from patch #4 into this patch, to then only remove the old 
shmem/hugetlb hooks (that are effectively unused) in patch #4?

-- 
Cheers,

David / dhildenb

