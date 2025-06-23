Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5482581
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750686553; cv=none; b=bNm2SvBJ5hNLDf/FYYvY6Z9ugS3qxsvieZUdHCTXquI6SKHHgznSvHZO2wvZYVidozjnfTznCF96vyUsJdUzX5ZsVXO6Y7y2YqI2BPCRCzUWlLDaR/An44edF4OmlvaUF+Xv50nK2qUXi4zSIv/l3LkovtGg9pxg2mszMZPvU4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750686553; c=relaxed/simple;
	bh=f7aOklejQbZ7G0VrNNG8wxBtdwtA0mLdvOXgTTgiXNQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AjPjlgCpnAu++iKdG7x2pBjWy1kLFOew6n4oc6ragiCpEZTY8Ts4mhNmwNe2Hdw/S/zyORNHjG76g4WxN8IN4BRdYeSt3vfaDKBVtoxEXL6VIF8NLEhFeVNS+t7AA1rdozJ7NrDDUrniTKumZkQEmSP6oHgKCasaZYUje9EaLdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MS+2CCAA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MS+2CCAA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750686550;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jsKHRipSf0W3kGdVFY9Q0sc/VyJxrNO7AzDAt8FfuEs=;
	b=MS+2CCAApaWOLkSSrLG6493/zDNUQYZh+W45RVRZTdLwRS/1fIjHSKDnHt9lVEdZAOdfup
	YQnPOWkU7CgKYPcGxpiV3hsP8HGv57geH8qaoD+f6kW6q6KWl50YkA4FOHXafpRKm8YQ0X
	vhKEJ7e+0mbhJvcLHdRBeWNd7cmei4M=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-651-zdXElxDYNNat5iBNhuWudA-1; Mon, 23 Jun 2025 09:49:08 -0400
X-MC-Unique: zdXElxDYNNat5iBNhuWudA-1
X-Mimecast-MFC-AGG-ID: zdXElxDYNNat5iBNhuWudA_1750686548
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453018b4ddeso26916405e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 06:49:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750686547; x=1751291347;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jsKHRipSf0W3kGdVFY9Q0sc/VyJxrNO7AzDAt8FfuEs=;
        b=fMh0XWeOI3F1vhl8kulBxU8ndBjjWVCTLjPQEWNCMtmQNBjy21V+29G1ZCd8JDKEeg
         co92rZfACIHWRsNgp534jdp5UbWxZZsgDcGN7q6TQ67zxZdhcI8c++H1HvwmtL0f/fQ6
         LUNvFNUDSq4U8NFOvLX9ibakwuNzA1MZpQyENQknQHJ0zIlDK60V/bkxaepWjB6o1E+4
         wWTSnWIVNIbdR4G4CTnWsuI07jQTtqeoHkhlaXek5qOwXsMj5uasawI3btijeAPWLC/J
         cCHh2mDBjov6FI94QNgVzKWcB+WyClbUWM31hTgZHPfObgGJnusnYOq+msf5IpwB1Rgj
         n0rw==
X-Forwarded-Encrypted: i=1; AJvYcCUs5UQ3ca+4Q71PIEzESekNZvIZjpRf/ulJlxwLxuSThsbMsnA+5RuFc6cJJqTODPAUkLZmeyEqN3NPF3I=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpKjrWKJWVPXLeBX/wSgD326CbfG8poSZAKrgnGI86HWuvAjL0
	1iLxEfXnGrEGzpJA6bnC7Nv2jD8NiG9kFMDQqka2ElMs4z64F8DToNsobnpkYsrCzyT+XpuPC6C
	LIJRo0w/r1eIEWwgu8m/TRnmh4XM0kTO3bMnuR3jV7JS3hygSiUrPPbq39FeAk/6JPw==
X-Gm-Gg: ASbGncutmoCjrFSzgVDMF/9NGt7/2DvfLDT7SspH6PeN4TomAWcuxtixL/6pue3/xAf
	JJ3avMYL7xC/JN3WvpyD6akx2wrrESeBtF3vQ+aj+ckg+OIgrIhG/QZuQmXR+2QNK8z5XDragLr
	mTTlAhq1+zWkiBVVVjbI/5skF69No/lfu/SpIAFpK/KP91A5uVVdWkWv/NLTBOG71U1itLf/qOW
	hYwT9oskpv0euNyxUTWbeGh6nXMERJVQWZUf38YRiifTff9GB1VJdXFmoeINtkv0YznEruuU4Fk
	ukmMpV5olp1RS8TTUFTtsCo5uHgFBsH6eclLpyY214JySbhqIWU5Zfe1i6kuUUeBWkNK9u5craL
	OJlRdY0FLNHyE3Z9ZSIn1jHzk7anafIpT9I2d8Wj4PbKXjfxG2A==
X-Received: by 2002:a05:600c:1910:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453654c931amr124139635e9.18.1750686547516;
        Mon, 23 Jun 2025 06:49:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG03KKPfAZFSoUe/FDMvp2k1XbIBgN8Sc2WFAhxNfiQpaPmKu3c2IwVA1FchvOgoQIZkih1FA==
X-Received: by 2002:a05:600c:1910:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-453654c931amr124139425e9.18.1750686547124;
        Mon, 23 Jun 2025 06:49:07 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1189977sm9378431f8f.82.2025.06.23.06.49.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 06:49:06 -0700 (PDT)
Message-ID: <e80fa23e-f659-4eef-89ba-8c9f5578b78e@redhat.com>
Date: Mon, 23 Jun 2025 15:49:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/mm: add test for (BATCH_PROCESS)MADV_DONTNEED
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 wang lian <lianux.mm@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org,
 SeongJae Park <sj@kernel.org>, zijing.zhang@proton.me, ryncsn@gmail.com,
 p1ucky0923@gmail.com, gkwang@linx-info.com,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka
 <vbabka@suse.cz>, Jann Horn <jannh@google.com>
References: <20250621133003.4733-1-lianux.mm@gmail.com>
 <8fb737cc-ba83-4949-b4fb-2a2e1af0967a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <8fb737cc-ba83-4949-b4fb-2a2e1af0967a@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 23.06.25 14:35, Lorenzo Stoakes wrote:
> +cc Liam, David, Vlastimil, Jann
> 
> (it might not be obvious from get_maintainers.pl but please cc
> maintainers/reviewers of the thing you are adding a test for, thanks!)
> 
> Overall I'm not in favour of us taking this patch.
> 
> There are a number of issues with it (explained inline below), but those aside,
> it seems to be:
> 
> - Checking whether a simple anon buffer of arbitrary size is zapped by
>    MADV_DONTNEED.
> 
> - Printing out a dubious microbenchmark that seems to be mostly asserting that
>    fewer sycalls are faster when using process_madvise() locally.
> 
> And I'm struggling to see the value of that.

We have other tests that should already severely break if MADV_DONTNEED 
doesn't work ... but sure, we could think about more elaborate 
functional tests when they provide a clear benefit. (zapping all kinds 
of memory types, anon/ksm/huge zeropage/pagecache/hugetlb/ ... and using 
/proc/self/pagemap to see if the page table mappings are already gone)

I don't think we have a lot of process_madvise selftests, right?

hugtlb handling that was added recently is already tested to some degree 
in hugetlb-madvise.c.

In general, I'm not a fan of selftests that measure syscall performance ...


-- 
Cheers,

David / dhildenb

