Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE0023D288
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751447127; cv=none; b=XYf9bT0UaSZp/GOmnkxO5pQrW2UNxpmkXZbF5cs9bfMJPgfqwAcg1MuopDk72ks6jUBydD4XNqXrzCvXtN399e+VCZFcDQe5wKh7WDEedNPROAcmTd+gER2TNBqPa+05PVOzgh0+RnR5UqkptBjW4a4OkaI1pL535kuTTpJ2bJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751447127; c=relaxed/simple;
	bh=VTBaTEcI4lhRcySH97R3pBy2ZsLNntde7xPoOi2MSDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QcabpVNkJHk/SNfmizVewxW852+Y0p96pIXPAN7uy0m/pQ9KjRP5ckgn7BecyZwfaCNZ4WVJSIVhnD3pwyhynYrtv72//4aULFYv6+nGiHevED5dUcDbIjNty5V8/orNXw1/Vj52Qg5JHlfe60DMnvhl5BL5iF+QXNFy33uJZU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=esNouFNn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="esNouFNn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751447122;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UrTPZM52qS9q9n/aNzUQYR15Up7gBd3SfXHwk5IXyck=;
	b=esNouFNnIk90ROlMBMuO2d4eItXQe9PI60WLhbK9bTBjppoTCF2PHR7VUY5ndJ97Wl0NYo
	MCEvLWkwWbBIFeWHKXoSe+w0QZ5YGeoZ/b0MKMM9Dv8r2DKaOU6NTo+Sxweg3K+x1aVPCN
	giO4PVJEkQsv7j3SzawDvA4BAcs8NfQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-397-zpgwpgTxPsq9bYz0Qc4U0w-1; Wed, 02 Jul 2025 05:05:21 -0400
X-MC-Unique: zpgwpgTxPsq9bYz0Qc4U0w-1
X-Mimecast-MFC-AGG-ID: zpgwpgTxPsq9bYz0Qc4U0w_1751447120
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so3082034f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:05:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447120; x=1752051920;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UrTPZM52qS9q9n/aNzUQYR15Up7gBd3SfXHwk5IXyck=;
        b=GIP4xP0c80LkWj7z/ezLYlceq6O568jWQId/HAN9573CF2ulJznEG3BPhtBh2VS4tp
         FW7EEXgH57LjYOIGC6iOleUeUy42vtYPVSgzcZ8CIfM4XsH4k0HJ6MXG4qrvtjpP5GEC
         heKTPsHKQFyRB0cFI8LYom6U85YpYylfEtD4gD7PhUhW77DkDn5szVBmhnrdX/g3TbX6
         B7PiQ0DcV5LDBBMwCb805yvQ1U+2Y2kJlhkUFDnq3+G92w8vhE3MC1ceNiaZoypV1Twa
         GzSc0lVruMRz6DFNIyy9KazJZKR4TZlfC5gH/Gel9bPD8tUgnG0gvtNlXwAPzIo6Q0ym
         tSrQ==
X-Gm-Message-State: AOJu0Yy586lHfbBk+KUBO6sluiYaTI55cEkGY7STNKyvcAXEtQSoK05O
	EVBA5rouMaxkWIpkcoRgD65D3Uo3ZJdYsr8ePcM3bBPF2bFeL8NqoI8kBdHYseu/B/CzwrYduwv
	eyvhqQ/Y2BnHWpsNVBe2l4b7gY6xIww9Tutlj0ZJkGLqi3+aZu3JvSPOwQ02jryOp0WYx7lxt9l
	Ds
X-Gm-Gg: ASbGncvVhLTzfDrwEAdFFxWSqAD5ojqbuy6L+mKZ3IbXPyqsmftyG4wiRUdCD1Lv1dV
	rlHGH8ggyPoX25GbSblwd+TcWTSnYZsKjPP0lIrggyuEmUMib8AHG7DRr+vnscOWrrFEhhDqvGe
	zH/zBKaMmDg5pSJ1UDB9greCFDFWxgtdvKahUxDKpFWpi3eSZKsVK/yZuB8oWDgbNbQjxQdeoXm
	LNIft0I2yAK4O82MRLRcK8u/bU7nqx9W1H16U3secqoB5Tfiwqq00AGTTGhLR/J33n0J62UPmeJ
	9rZFekL53yRoQYof8uIrFZK36wa/H3MadmYczkBeREPQ+DK+JscCIm8=
X-Received: by 2002:a05:6000:490d:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3b200e2a077mr1469913f8f.54.1751447119886;
        Wed, 02 Jul 2025 02:05:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzCdEgUymscyusw/8NK48d6wkfe1lKLwo8hfN7RsLT+sS2rYBbIp2VSowfg5jJF5eFRrZb9w==
X-Received: by 2002:a05:6000:490d:b0:3a4:dbdf:7154 with SMTP id ffacd0b85a97d-3b200e2a077mr1469867f8f.54.1751447119443;
        Wed, 02 Jul 2025 02:05:19 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233bd14sm225463345e9.2.2025.07.02.02.05.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 02:05:18 -0700 (PDT)
Message-ID: <17777b93-41f0-4943-963f-0330489b01bc@redhat.com>
Date: Wed, 2 Jul 2025 11:05:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/4] mm: split folio_pte_batch() into folio_pte_batch()
 and folio_pte_batch_ext()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Jann Horn <jannh@google.com>,
 Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>,
 Michal Hocko <mhocko@suse.com>, Zi Yan <ziy@nvidia.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Pedro Falcato <pfalcato@suse.de>,
 Rik van Riel <riel@surriel.com>, Harry Yoo <harry.yoo@oracle.com>
References: <20250627115510.3273675-1-david@redhat.com>
 <20250627115510.3273675-4-david@redhat.com>
 <aGT1s-32GpVfVZNU@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGT1s-32GpVfVZNU@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 02.07.25 11:02, Oscar Salvador wrote:
> On Fri, Jun 27, 2025 at 01:55:09PM +0200, David Hildenbrand wrote:
>> Many users (including upcoming ones) don't really need the flags etc,
>> and can live with a function call.
>>
>> So let's provide a basic, non-inlined folio_pte_batch().
>>
>> In zap_present_ptes(), where we care about performance, the compiler
>> already seem to generate a call to a common inlined folio_pte_batch()
>> variant, shared with fork() code. So calling the new non-inlined variant
>> should not make a difference.
>>
>> While at it, drop the "addr" parameter that is unused.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> So, let me see if I get this.
> 
> Before this, every other user that doesn't use the extra flags (dirty,
> etc...) will end up with the code, optimized out, inlined within its body?

Not necessarily inlined into the body (there might still be a function 
call, depending on what the compiler decides), but inlined into the 
object file and optimized by propagating constants.

> 
> With this change, a single function, folio_pte_batch(), identical to folio_pte_batch_ext
> but without the runtime checks for those arguments will be created (folio_pte_batch()),
> and so the users of it won't have it inlined in their body ?

Right. We have a single folio_pte_batch() that is optimized by 
propagating all constants. Instead of having one per object file, we 
have a single shared one.

-- 
Cheers,

David / dhildenb

