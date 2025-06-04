Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F0022B8AA
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 09:45:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749030309; cv=none; b=c/IsCPX3lZ9RgZ0TeylqGkjoyVNFYEkg5XuORIYElsC0hNmDBLJib4g+eWtUNa/wV/5jElH6t0cf6j96HtwGjnZqPQfTnzfikTpE5Vg1vqNaEeqQmAeVdlQ5/LLrPYdalehC4VMx6VLVj/ncqGwSHgWPiZ/dHC0mYDWH+cnAnC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749030309; c=relaxed/simple;
	bh=qKpd+twJEAnFCYfAsR60IRx00l3a2mD4F9MLSfJzel4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pFkv8y8L27uhfA/ok1dOH1txXxZ2HT4sTwDmO+7xjm/vQRUu5/0ENahXmEdmVARgqL1fZ17FTI1pHfiXNz7cSu61w4F6n/zqlXriA+U2H1SCZNCx+CmwgGg8qrQ5nR6K8TNqFTxMSXSF8mfQ95gR0K7kH5lGiOoQd2nsg3fUAA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AC30mw8+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AC30mw8+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749030306;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=N25tBxOpW4+CmaozSXoxCREQxpCpS3nehI/HEnEd2/c=;
	b=AC30mw8+bc2m/4zS5Bd27mbcZHLxOP9BF1sfoZCgp5oMdRTods1sw6cbpbcDNflCWqZ3SL
	J54I4U8AkmuvA45X1FYSEMasMUei7rFy028KOtq0k7z55ccKjeoNWhCgEJfQrzDm6iJWGM
	u0Ov813qVP2NeU3l9NJ0S/VnXtUrE3Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-266-C0X4f9cVPeKaVMXp0WdrGA-1; Wed, 04 Jun 2025 05:45:05 -0400
X-MC-Unique: C0X4f9cVPeKaVMXp0WdrGA-1
X-Mimecast-MFC-AGG-ID: C0X4f9cVPeKaVMXp0WdrGA_1749030304
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450cb902173so3744155e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 02:45:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749030304; x=1749635104;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=N25tBxOpW4+CmaozSXoxCREQxpCpS3nehI/HEnEd2/c=;
        b=OeUMm0TmddBt2mfqYRBcoN4upoahCo+pHDgNmatY3wh+9hhLVUiTm1pfEJBFzwk1Pl
         Xa6IBbwS5/1IdLd6iA3fnV0BuACEBcq7ohQGJUGH0BOB6x7FxJ7kkSoswjfsTA/NjpUe
         G4e0FGW7kZm0Ajkl31iz+bUBTzPYLkZXWcS5ZOhnqN0L4+FC08cn7UsvnF3KbNg+yuq2
         GrmO6zQ4rf9ghNE8FS4NML6Z5XX3gjk90oCWKIiWwxzz+U7t6XezFchJx2hzIq4//W/S
         j4K2TQ/AjmRkeR+RvFux9dUx2ffJwnFT/v1UrcHm2PECf7M5E1NyM3fn5qmg+AjtNSWh
         qj2A==
X-Forwarded-Encrypted: i=1; AJvYcCWlxazHGXj6zX3CFNcOse+NkBTH+vDjUI5MKiFldFvjUrIxggXbLocLNUmWEgWdXZXndxcYLKa2AnemfoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfCaz03QUV/aOwcIYZYyBggAb/yi9d0KYudPRgC0E8Oh48yrmp
	/+ucglOp5KfT5M4StpSaaWW32LwA2O/4O/p8gAHs0gYlfpW/ienBxEJ0+sNfkumcH4Lt1FWbU6f
	gF2COHOIG0kitSZKCWMaGGuLd417qHEBC8FqDTb3F/v4ctsI52NGoCz2gkJuYvjZfQQ==
X-Gm-Gg: ASbGncuYeqbaX+HKlPcPXMDc/xLlVq98uzc52NOh5LEVMGrxzyD2PI+eZML4R7/oimS
	K2MEyEam/7D8u+XILeypKEO7ktySjSMP2ujLSr72ezjz3REHPgfPkSZWUVWmRx8KNAhjlfN6bSu
	aF7F/PIrfg28J9owA4xYIFyifcp1q8y7KeFE0LSPUjLS2Dw9zzeYhOjlGVA6Zdudm8n7qZeywMp
	tRENx7tJZnw9MzCzAxQxHQR4OZ+025XbBedx7y4Zfew/Sl4JPAX6NFwQaM4BTd1NEBwcUFlHAaa
	Lh2rvV79ZxyDZDc8GUu4hHDa9k7DYfF/trSD7SYEg7BbHsb/tK1AATG09sgBFdJTJ1OVWyJC70h
	3j/PjuTsU6hkmVVcqExE3n/Ec7uS5mRmW04/19DA=
X-Received: by 2002:a05:600c:a197:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-451e61221d7mr46452695e9.14.1749030304322;
        Wed, 04 Jun 2025 02:45:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8k9sHoubF3xa4TwhFMghUcSSm4V4hCJo5i/46wpXB1vGZJemDM4SbI1oLdasTdXNoJZZ2jw==
X-Received: by 2002:a05:600c:a197:b0:43c:ec72:3daf with SMTP id 5b1f17b1804b1-451e61221d7mr46452445e9.14.1749030303869;
        Wed, 04 Jun 2025 02:45:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe6c79dsm20728119f8f.25.2025.06.04.02.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 02:45:03 -0700 (PDT)
Message-ID: <b355e72d-0284-4a31-84e3-ae4a79ad922f@redhat.com>
Date: Wed, 4 Jun 2025 11:45:02 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/5] drivers/base/node: Optimize memory block
 registration to reduce boot time
To: Andrew Morton <akpm@linux-foundation.org>,
 Donet Tom <donettom@linux.ibm.com>
Cc: Mike Rapoport <rppt@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Zi Yan <ziy@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Ritesh Harjani <ritesh.list@gmail.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Nilay Shroff
 <nilay@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
References: <2a0a05c2dffc62a742bf1dd030098be4ce99be28.1748452241.git.donettom@linux.ibm.com>
 <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250603200729.b7581e017e4ca63f502c795e@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 04.06.25 05:07, Andrew Morton wrote:
> On Wed, 28 May 2025 12:18:00 -0500 Donet Tom <donettom@linux.ibm.com> wrote:
> 
>> During node device initialization, `memory blocks` are registered under
>> each NUMA node. The `memory blocks` to be registered are identified using
>> the node’s start and end PFNs, which are obtained from the node's pg_data
> 
> It's quite unconventional to omit the [0/N] changelog.  This omission
> somewhat messed up my processes so I added a one-liner to this.
> 

Yeah, I was assuming that I simply did not get cc'ed on the cover 
letter, but there is actually none.

Donet please add that in the future. git can do this using --cover-letter.

>>
>> ...
>>
>> Test Results on My system with 32TB RAM
>> =======================================
>> 1. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT enabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 1min 16.528s (kernel)
>>
>> With this patch
>> ---------------
>> Startup finished in 17.236s (kernel) - 78% Improvement
> 
> Well someone is in for a nice surprise.
> 
>> 2. Boot time with CONFIG_DEFERRED_STRUCT_PAGE_INIT disabled.
>>
>> Without this patch
>> ------------------
>> Startup finished in 28.320s (kernel)
> 
> what.  CONFIG_DEFERRED_STRUCT_PAGE_INIT is supposed to make bootup
> faster.

Right, that's weird. Especially that it is still slower after these changes.

CONFIG_DEFERRED_STRUCT_PAGE_INIT should be initializing in parallel 
which ... should be faster.

@Donet, how many CPUs and nodes does your system have? Can you identify 
what is taking longer than without CONFIG_DEFERRED_STRUCT_PAGE_INIT?

-- 
Cheers,

David / dhildenb

