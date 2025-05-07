Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9D7221D80
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 08:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746605169; cv=none; b=U8j6aIJSLGxzFKf2mhfVj7XLFUFpf4ZXhmD4MwjPjpbRU6WNIr5HJQjRGUDKu1qDdO0m3t9qDxMz6LsAIJJ9dqBysV3WYCB8Tw7+JdVm5h3n654OXbvaxv4/jOlXSpYxHoEiwmXuFg/aUN72+H41AoxMLEU+3KgQvrYkU68uMPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746605169; c=relaxed/simple;
	bh=pVVmxStWXyDPDKtnFQ8DouR5DtLirHLuDc79ZqzPN4s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EfW/V8ZuV/aUcd7nOriZcDxuxyIisNn08T7TE4hWuCyKYpJxOdXK+TguwsSzCj4NamqMfPPPlmOLG/BF8ww3xgsHZZQDLwt3wPqCsgIBUTws6yC3J3tMBMjXNhyQ7A0FXLF0aMvGN7SgOlQgaJ0b2mRpa0dTSeSmazsBUcmE5Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ivAdLjoE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ivAdLjoE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746605167;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=3QaB/Lo8VWJqzUjgYmq8xGE3ypZ0LFcP4kCT1w7s3Ps=;
	b=ivAdLjoEO9iRzxMpRgmrvOcJBkyRBXdtAcweBnXkvWJXSUyd8hIzawlAuY2jaUHZPgOjLk
	0KqOsUHycxSzeVtLO3OV3EjjMPHVRsF2XM486Nw2HuR9uJLilL4vFZhH2b9GDv5AxLFRnq
	ZlAMiy3P5fFPf6y3Sw8FdDZepjLtGfI=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-55-8EXQOLnUNW-UxRtYjs3LZQ-1; Wed, 07 May 2025 04:06:05 -0400
X-MC-Unique: 8EXQOLnUNW-UxRtYjs3LZQ-1
X-Mimecast-MFC-AGG-ID: 8EXQOLnUNW-UxRtYjs3LZQ_1746605164
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3082946f829so9324007a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 01:06:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746605164; x=1747209964;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3QaB/Lo8VWJqzUjgYmq8xGE3ypZ0LFcP4kCT1w7s3Ps=;
        b=asL4ejhxKtGxGbyXHIJepL6PXnn3Fri6dv2Ds+AWlJmbuIzGCNKZGvynOz1xmLGOHo
         mnFtieB7zv/BCSsMyBET6FWOylRno7oqH/rew971uDHYTnGzV/rIsap/GuWr9W5efr9r
         RXe3gRHE2ei+YlF4DgYeNF/2xP6d5iYG24/mes7aQrX8qpmrZBP0cCNaNJWdmIZQk8P8
         FV/XxphgetyNwYtilxoIV6MUJfAWpyiRyqYxZMYsEIp285V4NbcLhdJKE7MTq+p78TFM
         OIkBEJtN4yheh4S3cXKgbrpwglwB2YrnyBUSaHiAwRnvvYF2lAee4OB+13Xv/EHRV4uN
         6q6A==
X-Forwarded-Encrypted: i=1; AJvYcCW7/sTmGfZG27Yp7RYyW064ae7Aztk0xVf9thJO5Bs7QwUORjgIJfkk7wn1g3GUL6o8Vc1zl24tBPgIwQw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyE+vij2BFOj7IpQ7545+d4EbuwwkeFm/4OIiqRljMQza/64uoF
	JlY/+sAWuWk6jQ6yxZxQcDlhj2p1dL/tfM2j7MownByIVWuTTB8+15I+dEYpna85EjMUd3+AvFw
	1vmfKQrX/mREV5+/mP+Y7M3m4Qns/3CHemKquBAO15DJyuDVKHR5+Ro1boMXOrA==
X-Gm-Gg: ASbGncvQNRiWlg3YFX1/olK6rsj3YF7BXGNRHLdXbqZnUDOaK68yueLIOsGfO6miGUG
	7zyAJ+jQjt4cdi0OO0VwhFFguX2bbXNREA9rfYJQ2lONvSEXrVBbCbGA2WevY3xWDRBqAjrrWFE
	qEPtRi38jVrmXVOV5GZ8/gfcW+5zZCyUfUdIZPZMlh6GLetbiafj9Njb3oxoZGzeSXUHxM8O8et
	/AKM1ALKhgsnYeQjJ6gcLJsNGPkTMi1xLaO6/P54m6giFesishMBq1CN0lT9Lk9F8OGSf/ZvsGA
	qgvmQtWouDkst2aLtknNDfvaqbrfpKdKMb/HnP9aB9W9pmJGyZOlsBXuDOOckt4tCqHWkQhKpAy
	PGm5lB+k9GOGeOwpDsYDSRVcwR1iH4mTuT7XHsiU=
X-Received: by 2002:a17:90b:4fc5:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-30aac19dcd0mr4786878a91.14.1746605164203;
        Wed, 07 May 2025 01:06:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuw91f2uKVrjLJgeby+4DgNmGVW3n7D2NiBBdG5TcCaJWDIguuZpCpgatt6/CwA5jN/rdYqg==
X-Received: by 2002:a17:90b:4fc5:b0:2fe:b907:562f with SMTP id 98e67ed59e1d1-30aac19dcd0mr4786828a91.14.1746605163844;
        Wed, 07 May 2025 01:06:03 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628? (p200300d82f12d400ed3cfb0c1ec0c628.dip0.t-ipconnect.de. [2003:d8:2f12:d400:ed3c:fb0c:1ec0:c628])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e421a7dafsm27253065ad.69.2025.05.07.01.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 May 2025 01:06:03 -0700 (PDT)
Message-ID: <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com>
Date: Wed, 7 May 2025 10:05:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
To: Andrew Morton <akpm@linux-foundation.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 07.05.25 01:21, Andrew Morton wrote:
> On Tue,  6 May 2025 18:36:01 +0100 Lorenzo Stoakes <lorenzo.stoakes@oracle.com> wrote:
> 
>> As part of the ongoing efforts to sub-divide memory management
>> maintainership and reviewership, establish a section for GUP (Get User
>> Pages) support and add appropriate maintainers and reviewers.
>>
> 
> Thanks, I was wondering about that.

Thanks Lorenzo for driving this!

Acked-by: David Hildenbrand <david@redhat.com>

> 
> (looks at vmscan.c)

Current maintainers (mm/unstable) on 20 biggest files in mm, Andrew is 
implicit:

  $ find mm -name "*.c" -type f | xargs wc -l | sort -n -r | head -20
  198195 total
    7937 mm/hugetlb.c		# Muchun
    7881 mm/slub.c		# Christoph/David/Vlastimil
    7745 mm/vmscan.c		#
    7424 mm/page_alloc.c		#
    7166 mm/memory.c		# David
    5962 mm/shmem.c		# Hugh
    5553 mm/memcontrol.c		# Johannes/Roman/Shakeel
    5245 mm/vmalloc.c		#
    4703 mm/huge_memory.c	# David
    4538 mm/filemap.c		# Willy
    3964 mm/swapfile.c		#
    3871 mm/ksm.c		#
    3720 mm/gup.c		# David
    3675 mm/mempolicy.c		#
    3371 mm/percpu.c		# Dennis/Tejun/Christoph
    3370 mm/compaction.c		#
    3197 mm/page-writeback.c	# Willy
    3097 mm/vma.c		# Liam/Lorenzo
    2988 mm/rmap.c		# David/Lorenzo

I've been messing with KSM for a long time, so I could easily jump in as 
maintainer for that. Probably we want page migration (incl. mempolicy?) 
as a separate entry. I've been messing with that as well (and will be 
messing more), so I could jump in for that as well.

For page allocator stuff (incl. compaction) we at least have plenty of 
reviewers now. For vmalloc we at least have Uladzislau as single reviewer.

vmscan.c and vmalloc.c really need some love.

-- 
Cheers,

David / dhildenb

