Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAEC21A725A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 07:40:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748245214; cv=none; b=L9E2Kv9PX7unY6LxfFdbsK4IYogMZLW7If22IdYr55N3E71t8Vcp6SX2osAtY1WLz0aZyLbk9BfQy9d1Lb592AP2mC9pBzcdent2dMWm5zNCxxuL6oAnCNSXYTLGeb5zf5/rUbgcvdWdFTAfJ5nZo4gVBOsjpPnEcVg+VBAjKVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748245214; c=relaxed/simple;
	bh=TdmyJ6vC6GRN5vIJSVTte+bSyRoC6d4bnYwr+fN5GlU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WxOj4fj6cVlH4LuCFyPQrsNSVc0UXEbKZj7VXpFRyyjN5ro71BOMOS1aF2xyvA+4RpZylCmk9Po3HSgmByixQNe0BRjpwSBER5bgCQyJHMVldgxtSx0zuraYfQG7X0zXXOlfOW80+yktdqqYXwrhBY7DNDS8ymaX2AnQQ1yRYyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EpHOAlBf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EpHOAlBf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748245211;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=tgfPyghdNKeNstPw0hlFT74xvMeUiDTtqqo5DgSnAPo=;
	b=EpHOAlBfzRjQZGYrQ7iA4r6AqMh4IHm06ykfzLwnvwwM0Qvb9faKmhFTqV3RP3TV4aFuMo
	FJO32GqWR3wfpGw0K0tNFDptcK5cG6RSndJzUqXT9ydnznIjXyElL5luCtCsespLSti5bi
	G7qkT1IvRCCxiKS29G7RVKUhRK1azts=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-53-67h7PtgBOeixlwYXkUB5Sg-1; Mon, 26 May 2025 03:40:09 -0400
X-MC-Unique: 67h7PtgBOeixlwYXkUB5Sg-1
X-Mimecast-MFC-AGG-ID: 67h7PtgBOeixlwYXkUB5Sg_1748245209
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4d95375c6so222778f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:40:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748245209; x=1748850009;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=tgfPyghdNKeNstPw0hlFT74xvMeUiDTtqqo5DgSnAPo=;
        b=FqPgm7NvXprMsxKNJ619pXBNyi760WCt2S/20IUdUlg05OUzEluMx2fGfo6Tpoocil
         VmuBqyVRgSQbIIUycPCZaxcug02nlgKFn4X5XvVy2XKCrFbhhrSNW/4GkbQWALrzgBP+
         mAJNoZccezaozNKKlKFN4pzFCFy1xTzOWOOsxCYwO8jJVteISvkeDshFMnDig3a0pJk3
         iPyB4P1VuvaQ0iLQqZWevLB59WghCpkVsf9NXY8Xtx7RURheGrkzkgUQYH+NEtv7Hwmq
         LqN91x7BjobE1yZNp1O+nClEeOzFK2NH406VEV+ZiVPyTaKV617pcpsKIYfF969bZJO9
         U6CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXn3/bQhduwpmtlszbBs1o/LHwrHXrIHyBDjkEOsbWOznGEOjHah9JLDhlqQziW4v0mbSNawQuxfKjiGec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyawnHIwdCiIdfzgcESK0ERgyLs049LlM5MP3ulWGpgYBn33f6p
	79TiIM+gDkux+ARhkI61Dj5PJzOBVQeLIpWZq1JRChqAhtg1M8mUKgxah5Z0+AZFrOlBLDmzP5B
	thxb5RBYhY/3PD3NGvz7bXiXqr5Yjs86nTVPB1bVIzaOGWOA/Saa09WkIvYEpqQl1aA==
X-Gm-Gg: ASbGncv41Sr55yxEh5pfq+tQBGMHaGa9Kw/fkd+Ocy9Huo/DQVQ2Dp6CKvcFui6HVjY
	hTruR6YJcP5TyQ2SsxRS6TtwM2YasXbd8V3J6PzPa03v3JKO3Nql0XNUsT+JdYzz8tDob5Bahjz
	JKvlLyHp5eadFWFT3myPzH7gDIR46yaDzkb+kkKL4IbQT8eq7mu02zwXwHJqF0SXDfAfne6qofj
	eAsdc/iBcxkt1dBDe/mUkkCw5NK1gz2QNDljNP/2k2SGvKVccbcbZauBZkfSa0IAZnbfhjiyseR
	m3ODiiWci1vtY2eUq2vJDu7kjyKhDGWc0ia47y3G0Wfass0DXMH80nEXd+ay1XOB+rhNbMHQF/v
	83Nt648eYVd1Hk9yit6Pl6TSah8FIMmC83w2+tnY=
X-Received: by 2002:adf:e381:0:b0:3a4:cbbd:6345 with SMTP id ffacd0b85a97d-3a4cbbd64bcmr4362169f8f.13.1748245208629;
        Mon, 26 May 2025 00:40:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdSQcxG+7GRa/3fimPQAcX44Cqrbym2zy6oRVwNrciRP1tWml6Iz+Ki3+n+w3eQZrvNLH9CQ==
X-Received: by 2002:adf:e381:0:b0:3a4:cbbd:6345 with SMTP id ffacd0b85a97d-3a4cbbd64bcmr4362143f8f.13.1748245208272;
        Mon, 26 May 2025 00:40:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d6ae802esm3162648f8f.71.2025.05.26.00.40.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 00:40:07 -0700 (PDT)
Message-ID: <8da60934-0670-4f8a-8bde-fa4de320cdbb@redhat.com>
Date: Mon, 26 May 2025 09:40:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [QUESTION] xas_reload() in iter_xarray_populate_pages()
To: Dev Jain <dev.jain@arm.com>, ziy@nvidia.com, willy@infradead.org,
 dhowells@redhat.com, hughd@google.com
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, ryan.roberts@arm.com,
 aneesh.kumar@kernel.org
References: <20250526063524.22597-1-dev.jain@arm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250526063524.22597-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.25 08:35, Dev Jain wrote:
> Hello all,
> 
> After doing an xas_load() and xas_retry(), we take neither a reference nor a lock
> on the folio, and we do an xas_reload(). Is this just to reduce the time window
> for a race?
> 
> If the above is true, then, there is a negligible window between xas_load() and
> xas_reload(), because only xas_retry() exists between them, so why to even reload()?

The usual sequence for the pagecache is (see filemap_get_entry())

1) xas_load(): Load the entry

2) xas_retry(): Test if we have to retry immediately

3) folio || xa_is_value(folio): check if the entry stores a folio

4) folio_try_get(): try getting a folio reference, might get freed
    concurrently, so a folio_get() is not safe

5) folio != xas_reload(&xas): recheck whether the entry was changed
    concurrently

iter_xarray_get_pages()->iter_xarray_populate_pages() works on whatever 
xarray was provided to iov_iter_xarray().

erofs/netfs/orangefs seem to pass the pagecache ... so I would also 
assume that we have to use the same sequence as above.

Willy and me had a look ad that code in b57f4f4f186d ("iov_iter: convert 
iter_xarray_populate_pages() to use folios").

But looking at it now, I think that code is incorrect. At least the 
folio_get() and reload-before-folio-get is weird.

-- 
Cheers,

David / dhildenb

