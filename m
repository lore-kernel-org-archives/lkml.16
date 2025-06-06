Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2E861E9B3F
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 18:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749235282; cv=none; b=USg0kL6gjH9uEjvseOebq8/2LLkrz0kh0pAUwIJspEwLVIh9sbVESjhLklQDwL5I7+fTTzModiGq+6PuDdWvt4hPsC7Sp0pMBE6D8ZVuaLVEs6+hP1g7rqZ1gEbPdjNsiPl/vHIQ23yMzwTbPXPSWIR5jnxzhu3epLWxHfOTknw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749235282; c=relaxed/simple;
	bh=VwcS2Z8io2o0cY3xmV6ZCIZl/itPdgGtnMt2d7h2C7I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E8lbjDYyoXL7fuNz5jFi+yRJxT3ep5PbwKE1O32CVojtuqmksHF8Ot50h5PbUU+8n8JfcX9bpvNDc6JMhVn6NyAaguwIGgT1v6YetI4UTvHlE4s4BcOamqU5IeSQYw2wv6ewDizrx3oggHsQG8qMZ5OcCYMI2dlm7g2FdXXCOQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DsT6zKeS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DsT6zKeS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749235279;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tkX4uYhgyu0xrtO7ADEiny3gzIp95LCIRO3lMgtzOQs=;
	b=DsT6zKeS+TkedhyEazvA1tAkrdxrw8A2Lggyc6JYPfXJlfLm/9Ptfl3gjLoAVqY6rhzdHl
	BSQqaNbBWCVU8dwnlH23BadDZyaDp7YtiyelrgROUd0ZZMOLU9B1m8sEm5XUX20mQrUTO1
	3lfGIsq1ULYvNHGsSO6oifRrR5Pe9mM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-awWZw8LtMRaZt_VExoV7ng-1; Fri, 06 Jun 2025 14:41:18 -0400
X-MC-Unique: awWZw8LtMRaZt_VExoV7ng-1
X-Mimecast-MFC-AGG-ID: awWZw8LtMRaZt_VExoV7ng_1749235278
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a50816ccc6so1640976f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 11:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749235278; x=1749840078;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tkX4uYhgyu0xrtO7ADEiny3gzIp95LCIRO3lMgtzOQs=;
        b=rdzQpdcDoIFSGPLqSRzFhvUPA/eQ5OKeHOMyv1die/SsDvVhWf1tlYcRwHnAo5YOYK
         uxZ6mvkfI79rSAv9RxWGEpVnX2bPd0yT19dIWIUL3qCEuCV/X70xsMqrDuhBCVeSBRYx
         a1MWzjqr1Q2q11JKf1mK4VTcJwKNgGb01ZT1rGqyHTXqDIpPCE/CKZonExmcUjaeWrhk
         1Kr4k9l2/PfXXw8vzruYj3Z6Dv5n6X0Rr3KwF8Sk9GQxvAGbFUq8qE0xIKsOazoU+nxV
         OG5rWuY3ibZdZLw5ASJsnyEsG5rf+61CTtHfMQcbz4gAEOLGk/QqPNLjIb5dQWUtyVuG
         zknQ==
X-Gm-Message-State: AOJu0YwbzQr1Lan9raqaTJgB0SFioUx8HOaqhoSlaiawInbS0PJ985bP
	uwqTPA93b5tPXhc5iVtkQNZmm08QGHEBy0R6cB11hLGcIs4opV+OM7bMtRI2fIW9jQSSJ7Pl3bn
	8vs9tjN0Sm7p20wYmqVYz/1cep0xVhVg7053RF/kcXHVfrE5zfeasXblV2FcvhXLpMQ==
X-Gm-Gg: ASbGnctIS+4Tf9kIg8E7L5oCfUMBFczlPukuj5MuzwmLmT8M54Y0R3ucbJQcg6THZd+
	IbBhSniwLrGCSWLmW1LcJHMiSCsvXrzfzc2Yo0xUA2mgkJlr5Zx+kn1JR0xQmF3yBW4js04hX3W
	WzCbRjyCRurhy+AzCIAKvm/fGBrZ+dCKBdGEFZnChho4pO4kYdMkChBFkzPGpqs9i+cY1bpWGih
	rIIK+U8K78iTQb3V5RDRry8S6Sta/qC+zy0zgAV+JTWadifNTc53ryAYPjJIEpHUWZfmJLM5ccc
	fhGWheYceJhxhaYSZg/eYfXlgJSgi7iets4cQ++HU0RuOotrRY7CwIeFm3DpVeWrVBwGDI6GsQI
	8TWDfkMNqY6Yv99Ur6RpqglU4w2GzTA0=
X-Received: by 2002:a05:6000:2382:b0:3a5:300d:ead0 with SMTP id ffacd0b85a97d-3a531cdd5a0mr3790793f8f.43.1749235277488;
        Fri, 06 Jun 2025 11:41:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECTH6YhYvW6ZH1CMtqGX1UnVUl20ogDcBS5RnIYh0ZPNAA1XAMq5p/2Szxsq9CZSwnHVZ/TQ==
X-Received: by 2002:a05:6000:2382:b0:3a5:300d:ead0 with SMTP id ffacd0b85a97d-3a531cdd5a0mr3790768f8f.43.1749235277116;
        Fri, 06 Jun 2025 11:41:17 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:9c00:568:7df7:e1:293d? (p200300d82f199c0005687df700e1293d.dip0.t-ipconnect.de. [2003:d8:2f19:9c00:568:7df7:e1:293d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532468360sm2571480f8f.100.2025.06.06.11.41.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 11:41:16 -0700 (PDT)
Message-ID: <965a6d13-e97b-450f-9d4c-d53cf08f9315@redhat.com>
Date: Fri, 6 Jun 2025 20:41:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] mm/huge_memory: don't mark refcounted pages
 special in vmf_insert_folio_pmd()
To: Oscar Salvador <osalvador@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-mm@kvack.org, nvdimm@lists.linux.dev,
 linux-cxl@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Dan Williams <dan.j.williams@intel.com>
References: <20250603211634.2925015-1-david@redhat.com>
 <20250603211634.2925015-2-david@redhat.com>
 <aEKkvdSAplmukcXz@localhost.localdomain>
 <b6a1b97b-39d9-4c9e-ba95-190684fc4074@redhat.com>
 <aEKmOfWDIy14Ub6n@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aEKmOfWDIy14Ub6n@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 06.06.25 10:26, Oscar Salvador wrote:
> On Fri, Jun 06, 2025 at 10:23:11AM +0200, David Hildenbrand wrote:
>> See my reply to Dan.
>>
>> Yet another boolean, yuck. Passing the folio and the pfn, yuck.
>>
>> (I have a strong opinion here ;) )
> 
> ok, I see it was already considered. No more questions then ;-)

Okay, change of plans, let me try to unify both functions in a clean way :)

I'll only have to find a clean way to make the other stuff I have 
planned with these functions work ...

-- 
Cheers,

David / dhildenb

