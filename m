Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E13D82288F9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744790877; cv=none; b=M0atoF3+e0cYpsn8+HonnrXOV6TNnGbgy80hIlzP6DVw3uIvoxH1ACBbHqUpMrYWUj8/NRPdDZsqVbpc7Aq2ktKPD5+XZfLZgl5A/1uNaSWz5w0M2Kel7lx3xQNHNLzqIs4TXuBZx9a3UVfQ6vqN2QDXCTQWdmO7Wn1COgrviJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744790877; c=relaxed/simple;
	bh=oqG1OBx7R2eR0ik+wIIHV1bNUkCAQWSDq57lXla6thA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gg5Oq2oe4VtaDJGEARAWdd4rx7VkDLXd4lQYrAV86IgJy6wtq11l6xl/K5KdFmURpEIBOTgFVeZe4IUlFZTik0uOY3R3whzc8NCesfW8nCz2Bmrzl8yVdG5fVk7TX1BpRG2jTgfeO+0dvk6rKs1TAFosMzDoFLhiQ+jSv95P9MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HNeI6zEu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HNeI6zEu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744790874;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=iDiq0tCxf63picufNGSAyY+6bJszwIsDCdO7QNVWqZ4=;
	b=HNeI6zEuT3q4W2ttOKMEVS3w7vsaiscpsynrT91sq7lHjC1Qev6sy8pJZA+B5DK0MH+Tl6
	3o2M1l3wQE/e+wbGFnLLNaGo4e7BY0HL4H7Xdj4DgviArr6cPcFLSCTIQxq03BX+WFmSWI
	QPZtsPSWoXTRXBy33ygUgoMTG0iK3po=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-4xC1liAZMLOoZZGtJnSGIw-1; Wed, 16 Apr 2025 04:07:53 -0400
X-MC-Unique: 4xC1liAZMLOoZZGtJnSGIw-1
X-Mimecast-MFC-AGG-ID: 4xC1liAZMLOoZZGtJnSGIw_1744790872
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so39435905e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:07:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744790872; x=1745395672;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=iDiq0tCxf63picufNGSAyY+6bJszwIsDCdO7QNVWqZ4=;
        b=pkNvbcATw8eeB33ui41E2nRcI8rhnO/dn1AM+jeSfRCbmT/iPhwChrEWpYGVU1bBI+
         FA1KVDZcnCwWHtqOUFbu/Za7x5HqduhPMszaxpoAaJ79fuBd3PYFPcq9QL8JqLO1Py6M
         vKSGwgVn9VtlP2EfSy9khVvq353CZp6lV/OQxxJaeR8A+xfiF5Umor3/LShpm0r1LQmg
         xlQAucLwm9tni5K7QU7YPxHIh370JDfJP2B07gKjOtWqMpIM7t878We9c1av45mV1QqT
         7vJpZzsmAh/0d0j14A4jMh8JpZqFQed4FIwrmVMG+gjDMC4vhpYipcinNpn0BrwU7tnS
         EMqA==
X-Forwarded-Encrypted: i=1; AJvYcCWFhO/TMuLzfqx0cLQQ/A6G2y11sXZYKIigJnoH4JXclxfS3sQEmHorcDDW9TQJc6vx6QBVa4He7yVrR8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeeANI5xWTF3Q0d24fVeUA1sYpzqU6g9A2LhOUe0eC0Cytjlxi
	X8ogUxA1aFnNY7M1LiTf4ZX+5VYcz7hYe45X+JCTXESJ/ODmBsCrfB2JZS7+TyPuFx/wPrGfQYX
	UIGeTfR+fOS+zd57rimFpwJ2k6gGpY5dOCmjmWlxPPq7/BRuARBWbL3HxziowuA==
X-Gm-Gg: ASbGncvaMgWEC2A9JrYiMVBPiyarlpvtQ9aVyNKFz+exNVxXTmKsKldITDY7+j2By6H
	2WjrdXC3X/wZ1u9WbZbZhsGcqiKaadCsfkFMgNv/oZsqb16tFmbW42uWPssqlqstQWt+H2Mwb53
	oHt4YtLyUf5NN2n8MUJD7tfjaq72Xaf9DWKhGD44xMPtHyWICCvFjhXixaUnx5ZoCeBP3Jq8p7T
	qoMgnwYlIJZdaUmlwesZArQBq/uM4QAoPvQKp26qsNC2CrmqUW3dnzIswcB4FkXrkl4VJqNqHP0
	ja9g0qYGkOrRC3X+48zHvhGoh946sUtS48rwUKRuuLxOpgeDRI8+uSowdoJ0DFue9TtSAqFpUnl
	tXldcNf+a4/nDraz3EMNo0Su483mOn3Oi0cmNqA==
X-Received: by 2002:a5d:584e:0:b0:39c:1404:42df with SMTP id ffacd0b85a97d-39ee5b37bccmr722726f8f.30.1744790871996;
        Wed, 16 Apr 2025 01:07:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6SSIcWUPUyYq1ETvCpPx7FtqGMfIa7gsBrBikiNRMWNHqW0RwqB/lUntVhSdFGNoVRcW5nQ==
X-Received: by 2002:a5d:584e:0:b0:39c:1404:42df with SMTP id ffacd0b85a97d-39ee5b37bccmr722705f8f.30.1744790871608;
        Wed, 16 Apr 2025 01:07:51 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf445713sm16159632f8f.85.2025.04.16.01.07.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Apr 2025 01:07:51 -0700 (PDT)
Message-ID: <a58050f9-726e-48e8-88ca-8d0d96bafb61@redhat.com>
Date: Wed, 16 Apr 2025 10:07:50 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, SeongJae Park <sj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
 <00ab4959-4fc3-4e2a-90aa-25a009b8fea8@redhat.com>
 <039f7b19-259d-44f0-a96e-618240317f73@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <039f7b19-259d-44f0-a96e-618240317f73@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.04.25 09:33, Lorenzo Stoakes wrote:
> On Tue, Apr 15, 2025 at 03:25:09PM +0200, David Hildenbrand wrote:
>> On 15.04.25 15:10, Lorenzo Stoakes wrote:
>>> We place this under memory mapping as related to memory mapping
>>> abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
>>> separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
>>> files, so this should encapsulate the majority of the mm locking logic in
>>> the kernel.
>>>
>>> Suren is best placed to maintain this logic as the core architect of VMA
>>> locking as a whole.
>>>
>>> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> ---
>>>    MAINTAINERS | 15 +++++++++++++++
>>>    1 file changed, 15 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index 8d834514a047..ce55676a16a4 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
>>>    F:	tools/testing/selftests/mm/merge.c
>>>    F:	tools/testing/vma/
>>> +MEMORY MAPPING - LOCKING
>>> +M:	Andrew Morton <akpm@linux-foundation.org>
>>> +M:	Suren Baghdasaryan <surenb@google.com>
>>> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>>> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>>> +R:	Vlastimil Babka <vbabka@suse.cz>
>>> +L:	linux-mm@kvack.org
>>> +S:	Maintained
>>> +W:	http://www.linux-mm.org
>>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>>> +F:	Documentation/mm/process_addrs.rst
>>> +F:	include/linux/mmap_lock.h
>>> +F:	include/trace/events/mmap_lock.h
>>> +F:	mm/mmap_lock.c
>>> +
>>>    MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>>>    M:	Andrew Morton <akpm@linux-foundation.org>
>>>    M:	Liam R. Howlett <Liam.Howlett@oracle.com>
>>
>> Sounds like a good idea to me
>>
>> Acked-by: David Hildenbrand <david@redhat.com>
> 
> Thanks! Am going to change this to make me and Liam M's so we can provide
> back up to Suren when he's on leave, are you fine with propagating this tag
> to this also?

Yes! Thanks

-- 
Cheers,

David / dhildenb

