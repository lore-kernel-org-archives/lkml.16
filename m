Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7772798E5
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 08:36:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744706170; cv=none; b=K6fN5AaVj/Tw3Vej5Zhp1SIxRdknTcVL77UAfvBhfYuE1lqCVQvxsVwnLtk9sLN6PwCo3O/vP4EtmoCApriEziB+14Me7KvUq11QNSV5v8TG2yY0y4zScETj5OFbNMBFCB6/HqLtlt8eSHNRjo3XJIYsPpMLa1DVLQvqaa+cOZg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744706170; c=relaxed/simple;
	bh=lCHpWAnxKtXIBz/2755dphecx21GCLhmq6t0B2kdkD0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i8VGo4V3peLFQOfublvGjEYVBHRYTpYoXMXt1az9KBwAdhaiA4oaAa+6MaLiWg6KT0IPWBiC+m15OmgsgkU5UQVAuabmn+7XaKFkJRSo95kVMfnrDvBwCvKV760/gugYizBj4u44QXuWAFLJdBi240GKUZqCfTZlqoUYjojRJzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IJXghA/V; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IJXghA/V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744706166;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=G9dB8pTwEivhQW8c5j4EOMa+HIcg/Xo3XWn6oOdfgfs=;
	b=IJXghA/VvGTc9jegSofZo45ANaTJ/N0Y2oEGPwhAZLzKtBhYLWd2pTtvoU6Nia2KAlUtO8
	CNwchqY9px6qmxnL1ICZubtVvq9Gj4/l8JvZvsStQ4xMAoRqytIZWnpG/oIbfBhR2ujB9L
	UYw84IwZ4ZeFmvpB7hBPEd3F99rYW4M=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-SxwxC4NaNd6WhxcyzNCLrw-1; Tue, 15 Apr 2025 04:36:04 -0400
X-MC-Unique: SxwxC4NaNd6WhxcyzNCLrw-1
X-Mimecast-MFC-AGG-ID: SxwxC4NaNd6WhxcyzNCLrw_1744706163
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43d51bd9b45so31628285e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 01:36:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744706163; x=1745310963;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G9dB8pTwEivhQW8c5j4EOMa+HIcg/Xo3XWn6oOdfgfs=;
        b=IeFeuWwTogwWwRKHsBieSQvBg9nQzPYmqgnOH/eCFKGoHJTMT33fwx6PcEabyu7//O
         PyKQCidplO1LaXQiDo3Ka6iZ9UMqkubcSXWEJZdWwIbTCRnSa5CU9Ez84wCzEKQBfQ3W
         34dEbXki3ju4yrAYjCtiNeGgUdH2jBXJvRyFU9J+UthRhJud+Vm4HiBf4bAz5+JMgnjy
         ep0fWTBu1wWBKzVOIq0DLuxbT9URv/xMNRB3/MKP9DX0ABNv9KN9V75rNL/SIhaCbPP1
         1ix7uoXshNpMMPnn7zqGQ2bDBYuKLHtv5jlP8z2a26+SMrIjo/akmgdAwkiqGLVOocrM
         ZMpQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOqfrPSBVzCoYfWkMkq2xkC8ooP3JldUD65JY3puesBCRSG+/OIG4Mt3d8qN5aAwE91AgJINxeUFaXnzE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlLvUyNb9HokXJJjtNa209V4nBdXfwGqxjmFX4g5vA3bWWM72
	GYctLxjhQuMo2RGkO1359ZlPlur7284ZIAOrYqYZ+KvJkLRdLx5HXsTuMzY2MNuLiVs8YJEm/Qo
	ncjeOvPm6toNrxmAm3lLZDvFU1vzpbJBNCWIqnevaRms/K6GRq6ekU5rKBzt9cg==
X-Gm-Gg: ASbGncv6lwpdqEPgPtlkOw0yuM1xssd7Y+A/icalFRcTXqj+hIIA8czF3z1MTZc28Fc
	tyOuCXlM/Gq9lGgx0WH205ETMaJRiVzwPIi6L+HrWlI4R49WiO1Abg5ALP0pUbElypMk/aXHQTx
	0w6oSi09TGuRhKca4theN7lXMrYbYFGjxat0Vx6PISGyhR5EIuDjOAvhbB8SQKcI0ZX2BRxjIZO
	KfywNo2SMoH5qzJJQrdM1TBqcVFtd9mv9J+kD7apcbR9IqDNhvVUuXD52pROFNiWDy1bSZaCX7I
	VlFZZ7k5fqkhLFMUGJNkX7gqIdArA418c8G7OkRPJNRP/3kbO9r5554G+i1UCdcWcLNw+Tuny+p
	NL7B8f1XXQXX8xox3Lim96xAZ2WV3zGPAsnR5BA==
X-Received: by 2002:a05:600c:b8d:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43f4aac8753mr94287405e9.17.1744706163050;
        Tue, 15 Apr 2025 01:36:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGx2Eb9JFz0nuBLba/QoJTDZJW/Oxy4aoy7okBxHQc9c05AJPtdEHxHSfjTFHghhKoRf+rtZg==
X-Received: by 2002:a05:600c:b8d:b0:43c:fa24:8721 with SMTP id 5b1f17b1804b1-43f4aac8753mr94287185e9.17.1744706162752;
        Tue, 15 Apr 2025 01:36:02 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2f64sm199971675e9.16.2025.04.15.01.36.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 01:36:02 -0700 (PDT)
Message-ID: <a23e7579-a88f-4e7a-b294-574c5e4c95a5@redhat.com>
Date: Tue, 15 Apr 2025 10:36:01 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm, hugetlb: Reset mapping to TAIL_MAPPING before
 restoring vmemmap
To: Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, Vlastimil Babka <vbabka@suse.cz>,
 Matthew Wilcox <willy@infradead.org>
References: <20250415054705.370412-1-osalvador@suse.de>
 <ab6d9bc7-4e6a-4604-9dca-44b13ce409b6@redhat.com>
 <a2447027-bc5f-461e-8fd8-93704dd543e4@redhat.com>
 <Z_4SeTicO-QuaGvc@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <Z_4SeTicO-QuaGvc@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.04.25 10:02, Oscar Salvador wrote:
> On Tue, Apr 15, 2025 at 09:32:40AM +0200, David Hildenbrand wrote:
>> Ah, reading about the HVO hackery in the comment above NR_RESET_STRUCT_PAGE, might the following fix it?
> 
> Yap, I was experimenting in parallel with that after sending the patch
> and it also fixes the issue, and I think is nicer indeed.
> 
> I do not want to step on someone else's fet, so do you want me to send
> the patch or will you?

Yes, please send it out.

-- 
Cheers,

David / dhildenb

