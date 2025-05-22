Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9802297B82
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747930282; cv=none; b=nuTLeyHsjvBdECR/JL1cXFQLclDbu8nlXtiBwFvU6VMZ+Fx0UBXRT7tzFTZHe+N3b0OjiYn/qXyoImoMH7xl5W8NePK+Mn1LQR6v6zoh4XuqpyZy7CqcfEV0zvutIfubISxOws9sSrfEWGQzKq/Xy8za4eeZkFmcuhDN0ASBfhc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747930282; c=relaxed/simple;
	bh=MKgVZdyLGokpkkG1ydCwWHnt012ciql95ci0qiWd3c4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s/mf7n69rmjzntAUSRZEcEP9xUNAp31X9GhJoBlwYc2cOra6aw5zmsKLZ+rLfWwfwMMqpxdZCO8R5CrZ1PdNLx+rkhCc8UF5b6hWOEZC8xHnrfnxTZLY8yQTkFiwWYKbJQlMasATANDqZGOSvTSaVT72eatgOE4DIJ2mbKlqyj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eh0li8Lx; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eh0li8Lx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747930278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ruMSbphODiUTIUCdYWfDPtWa3T5Qyw5OAz9yR2iJdyM=;
	b=eh0li8LxyC6e3fXblkL9g91VH7ReBDgW6dP9h4JrDplimFCpRP9EtYvCRK7rU0NmzeWJ6y
	wqZRfEzVcDAFzuky/AYtM0xa5t9hn7UzbCpGKo9zJjaNtzmUvuf4C5R5SSgNJppEoo3pIN
	D+OGfh+p7kpKuDspjQxMAY904weCV4s=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-595-Yh_BOXFuPmC_NyvPT4MzSA-1; Thu, 22 May 2025 12:11:17 -0400
X-MC-Unique: Yh_BOXFuPmC_NyvPT4MzSA-1
X-Mimecast-MFC-AGG-ID: Yh_BOXFuPmC_NyvPT4MzSA_1747930276
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-442dc6f0138so45226425e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 09:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747930276; x=1748535076;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ruMSbphODiUTIUCdYWfDPtWa3T5Qyw5OAz9yR2iJdyM=;
        b=MYaoi0gW1lMo46ZxfZTCMOTI7NnP1xHURbxl/3hoPr5UU7k08VAN54Azc2a837dcAz
         EXkEk0v+phxcmLu/ytX82mqIh6e2XUxR4WZ2XjI6dfKL/MGYtWtE3OK6HAfU81Nu5qQA
         LRjVrfPk1HFm9UvMBo7NsGKRS62NspaSOZ0zd+KsMrX+Exfe1CRgGzD3h5R3d7BLJEng
         wV56FFec+O3CQvg6IxpFQ7tO2btzltSxh+tsNBDvKrS8f7UEBd1KzVliFseKS+Gq7naE
         QFAEE8kAfERYJgNdhVSqfaZMWOAJhNgzynIXqnupf0LtBAOlfBHxajMq4d5oDtO1en5G
         IYVg==
X-Forwarded-Encrypted: i=1; AJvYcCXtkwMaHVdzpctucmNw0QIMqDq7NgaJ8IYJatMHl7CVohmHrFPAdG5ajpKao8lIT72aSdCvwWpaQuew7Xo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwfNk3VegxaalXFYQBOljpAa8DxrGpdH2theLnSmBtJ5948VciX
	oFli4fHnBQOa17UgX2gwUIHK6Ce7tEas7w2tW4fHXTF7CdGLlWplkfnWFBtXMGCb0suTM6aMFdd
	iixtABYsT5ZnNmYEX6yBAzl0jdg8ecnd54AQMa3vJXf6Uczv66Wl4R7e3vwAjH/odrw==
X-Gm-Gg: ASbGncvYrJxkN8Pqx7uuiOJzwjHLtgHmQwxaAPuCY15TNIE3RU7ZWHltaf6A331Eef7
	eO5Ahl5kwYxf9Dnh2bQ347+LRN9YlVATunnzJHESuqM1kvbcvR0wlrPv/g9WEwsXqLNHVAT6of8
	9tJhmA6mVLSqnL/LBtoD7Cfcx+wdnlvYWKEg9lAQ8V2nTZzb6rdcbKYytZjBg1xl4uCxQGiBUkW
	jT7HUsCiovL2KdHTp5X3qLNV4gMq8g/sWW9HdhzoIClOBvX67aqpl//8QX0BhZ4W6q42/6TPNvH
	9tC1ubhuo2SeQsGQXHeGos8AAn3JzPyY5P9Y9ULkuXnUuo+ZIHBR+kpWV4xhDbZfZW9p49+ppKe
	F7oDK0ueACazpRozSxo9B3NoI5iXq92DZDUG82Ng=
X-Received: by 2002:a05:600c:1553:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-442fd66f30cmr209026425e9.20.1747930276253;
        Thu, 22 May 2025 09:11:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG9iUfjBgp0eW9mzV5RF+xCTLWQ+5hnwFtjtIM5dPJ9Hv7++VZNbP1NbRhPjMDBucgzLzuuQw==
X-Received: by 2002:a05:600c:1553:b0:43d:cc9:b09d with SMTP id 5b1f17b1804b1-442fd66f30cmr209025875e9.20.1747930275816;
        Thu, 22 May 2025 09:11:15 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f22:2e00:6e71:238a:de9f:e396? (p200300d82f222e006e71238ade9fe396.dip0.t-ipconnect.de. [2003:d8:2f22:2e00:6e71:238a:de9f:e396])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f23c080asm114866175e9.22.2025.05.22.09.11.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 09:11:15 -0700 (PDT)
Message-ID: <62cef618-123c-4ffa-b45a-c38b65d2a5a3@redhat.com>
Date: Thu, 22 May 2025 18:11:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v0 2/2] mm: sched: Batch-migrate misplaced pages
To: Bharata B Rao <bharata@amd.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
Cc: Jonathan.Cameron@huawei.com, dave.hansen@intel.com, gourry@gourry.net,
 hannes@cmpxchg.org, mgorman@techsingularity.net, mingo@redhat.com,
 peterz@infradead.org, raghavendra.kt@amd.com, riel@surriel.com,
 rientjes@google.com, sj@kernel.org, weixugc@google.com, willy@infradead.org,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, dave@stgolabs.net,
 nifan.cxl@gmail.com, joshua.hahnjy@gmail.com, xuezhengchu@huawei.com,
 yiannis@zptcorp.com, akpm@linux-foundation.org
References: <20250521080238.209678-1-bharata@amd.com>
 <20250521080238.209678-3-bharata@amd.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250521080238.209678-3-bharata@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 10:02, Bharata B Rao wrote:
> Currently the folios identified as misplaced by the NUMA
> balancing sub-system are migrated one by one from the NUMA
> hint fault handler as and when they are identified as
> misplaced.
> 
> Instead of such singe folio migrations, batch them and
> migrate them at once.
> 
> Identified misplaced folios are isolated and stored in
> a per-task list. A new task_work is queued from task tick
> handler to migrate them in batches. Migration is done
> periodically or if pending number of isolated foios exceeds
> a threshold.

That means that these pages are effectively unmovable for other purposes 
(CMA, compaction, long-term pinning, whatever) until that list was drained.

Bad.

-- 
Cheers,

David / dhildenb

