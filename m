Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 776B61DAC92
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 18:17:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751393841; cv=none; b=POHxtLWopD04WsQHyFrYQswCbfiWNedaY0DiysU/ZxuJmBmXI9rZoJFzZCZCGtrDIxHOUOy3V6JhSIGgUSe6mZzULC0eWh/K8u/kJPmImIRa4a86oh1NhL3khrjqQrnJMjmmbWHYFpOscZbwMX4F+gYCv46ar9TXthh6VAg3pbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751393841; c=relaxed/simple;
	bh=sh2nnS8J7jW9ATIDayegN4qPYBGPibbjtu3/yV3L60M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QIxhLV35gYpWPaz70HZvN9oy7w3bsQapx2rE2doP/N9bFHoLAZsKprSFP3Ym3QdmXvraFiPSmLUCqfAbWjaUY4Avzy2greFXFFlS/86rM5VQO7JjPrBxL2h6/3z8SRCgNjKnyk64JK6lV1r+R4JQtnVV8VUMYJUwnsVpLAkaTyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=INPY3h+Q; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="INPY3h+Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751393837;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VGEs+zZbCJDxVs2cLi57c4jWLWtlXM7XcJOrJnn4lN0=;
	b=INPY3h+QMTNDaAdtwm2NizZeZVXSNT/qwmDorCIOw0YtPBX0VDWAvHEMpdaQBo4z2lQoJP
	L0iHKle5QayLPInHST4XOaSrtVL+a4ii/Jf0eQGXOKkoSWemAJZLvWb94LUQXBSpQOGBaF
	AGtaWQ+YicZokw3s6QJN6vNwYfqPvAI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-477-ni2jzNk8PIqTajSUVNHiaw-1; Tue, 01 Jul 2025 14:17:16 -0400
X-MC-Unique: ni2jzNk8PIqTajSUVNHiaw-1
X-Mimecast-MFC-AGG-ID: ni2jzNk8PIqTajSUVNHiaw_1751393835
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45359bfe631so28539575e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 11:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751393835; x=1751998635;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VGEs+zZbCJDxVs2cLi57c4jWLWtlXM7XcJOrJnn4lN0=;
        b=ewAnGqZAKry7SlcFDZ0xFlzyMgzZpwKy9gWIE7YJTQjifwgTHq6+YNg4j393Ky1zdc
         tmfuIM6saPhwA4shDPlIzZwGvPTBc0W5s/INMtOemSQNviduE/BBk0TSRegOEp1pXoo7
         N49pVcXnKxtjWTdSyXL2DmiNNkzh582LUa7rfH+qdgUPjqY3qQaB3wukRsFEogqvjim3
         RRfpXaTEzXdQBR8biIAWogp3fx8Ech1nJheD85dv8LykbIkQ2pKh3MKs1bzKxIP6Vkw7
         txgjyDsvWLORYvJOyyVugZaYBqvhjlphjFk2FskzUt9lTrm6Fgq6RgQhK8iFMxg7qA5h
         DMjA==
X-Forwarded-Encrypted: i=1; AJvYcCW16+QdLDeJIWFbgRBmSJk41mErVuhK9FaFHk1VdBQq4xzfjPvQa84zeKVBbJH4oHLsmvfghvIZgryxbIo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBBTcINzdu1G8FaW63PxnYb5+6ANJ4JU7pIb1B2/6F0Cbcwm3y
	I/J6t95KlOtHw95K2VxEkuDOR56oSSx0wVVHU9utvn/DVmPtppvZAvVZ2VA1z90lf27QFTb5S5a
	zdx4m0QBeCEavrsc5slZPxC+Je/Uz2tnsAJL28SNu47fMtjjc/veV7nUdUFpbGSFZrQ==
X-Gm-Gg: ASbGncsGE4pV2Dvg1RdAbsI6Dbp6nKWp5ce008nc6fCqA5Oo1GWPPrOygIrsdkKY/MT
	dt5ADd01+ec92kMpCCMbu5djrLW6tTVDvLwVWt3/eH9ZM95UumHvFc+TXZdYMTAlVWh9B53U7Kq
	P5NS8QBf1YZGd0nkH0UKgi0lV/+aRZvXV7wqX8MLk9VvPB1+iCSKUJGI64ktUFdoJ08VTWbTQVM
	HHQZRAWDlT8BIHgcD0ObevKk8D+VR+//ZUZjEp9QfN7FO0cz/ZQaBXHUGdzwB3nTGsRy88mWCy8
	NcOqIw5HQS1ujhWV1bI/d/NXNdaeU1ih1+P3/r7wJ2cSggDSCMaBGEkO95Vmqix/bDjZzwLfP9q
	qid314WFv5ty2R+v4AolscIQ1AddX3gXPLXci9iAyZO0o2QEuwA==
X-Received: by 2002:a05:600c:638e:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-454a36db257mr1826425e9.5.1751393834843;
        Tue, 01 Jul 2025 11:17:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFOjijwKPczqWMfdeVKPSvKVFWEPvZAE35lAAMnXLl8MyrFYUOMUzxtudMr6z6AJZXhbp6xg==
X-Received: by 2002:a05:600c:638e:b0:442:dc75:5625 with SMTP id 5b1f17b1804b1-454a36db257mr1826105e9.5.1751393834381;
        Tue, 01 Jul 2025 11:17:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c463asm202736225e9.39.2025.07.01.11.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 11:17:13 -0700 (PDT)
Message-ID: <069a44c4-754e-41b7-9a42-7c2b77afdd37@redhat.com>
Date: Tue, 1 Jul 2025 20:17:12 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] mm/migrate: Fix do_pages_stat in 32-bit mode
To: Christoph Berg <myon@debian.org>, Zi Yan <ziy@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Matthew Brost <matthew.brost@intel.com>,
 Joshua Hahn <joshua.hahnjy@gmail.com>, Rakie Kim <rakie.kim@sk.com>,
 Byungchul Park <byungchul@sk.com>, Gregory Price <gourry@gourry.net>,
 Ying Huang <ying.huang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>,
 "open list:MEMORY MANAGEMENT - MEMORY POLICY AND MIGRATION"
 <linux-mm@kvack.org>, open list <linux-kernel@vger.kernel.org>
References: <aGQTtCkgH4kQTNlp@msg.df7cb.de>
 <25EB3C6C-4D6D-4946-BF0B-9B322E7DC16D@nvidia.com>
 <aGQhBRM9DtTZ22Z_@msg.df7cb.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aGQhBRM9DtTZ22Z_@msg.df7cb.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 01.07.25 19:55, Christoph Berg wrote:
> Re: Zi Yan
>> Fixes should be:
>>
>> Fixes: 5b1b561ba73c ("mm: simplify compat_sys_move_pages")
>>
>> Closes could be a link to the bug report.
> 
> Updated, thanks.
> 
>>> This seems to work, but honestly I am wondering, if copy_from_user
>>> needs a special 32-bit case, doesn't copy_to_user need special casing
>>> as well?
> 
> Scratch that, it works because an int[] is copied back, and that's
> always the same size.
> 
> So I think the patch is good to go.
> 
> Christoph
> 
> 

If you have to resend, next time resend the full patch separately, not 
as reply to the previous version.

>  From 426c93d558572248273cf386ca784626ae431413 Mon Sep 17 00:00:00 2001
> From: Christoph Berg <myon@debian.org>
> Date: Tue, 24 Jun 2025 16:44:27 +0200
> Subject: [PATCH v3] mm/migrate: Fix do_pages_stat in 32-bit mode

s/32-bit mode/compat mode/ ?

Because on native 32bit it should be working fine.

> 
> For arrays with more than 16 entries, the old code would incorrectly
> advance the pages pointer by 16 words instead of 16 compat_uptr_t.
> Fix by doing the pointer arithmetic inside get_compat_pages_array where
> pages32 is already a correctly-typed pointer.
> 
> Discovered while working on PostgreSQL 18's new NUMA introspection code.
> 
> Signed-off-by: Christoph Berg <myon@debian.org>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Fixes: 5b1b561ba73c ("mm: simplify compat_sys_move_pages")

Hmm, still not sure if 5b1b561ba73c really introduced the issue. I think 
it only messed with the "pages" pointer, not with the "status" pointer?

Hmmmm


I assume we want to Cc stable. @Andrew can do that.

> Reported-by: Bertrand Drouvot <bertranddrouvot.pg@gmail.com>
> Reported-by: Tomas Vondra <tomas@vondra.me>
> Closes: https://www.postgresql.org/message-id/flat/6342f601-77de-4ee0-8c2a-3deb50ceac5b%40vondra.me#86402e3d80c031788f5f55b42c459471
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

