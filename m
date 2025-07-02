Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E42681E5B6D
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:45:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445924; cv=none; b=niHxGFe7LS2/J600knc3zR7S5fxyBmfarh/f/YITCdINlPzjdWfiF6DgNZnDrmDGyxvizsfmLH46MW+S8LgFtrifUlkVI1ndyH+zv1oO/IQHSzkk6knXI6cfe7+e/qNRWxDtB0VuSAdrqZ0b3nWrbMeNu7vB/H2ikqsnef4oezU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445924; c=relaxed/simple;
	bh=MYPwAhDc2CJ6iAcNRmDnt8SeQsXnCe0CxRLpctYsvRM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pNRPhAXPD/660LAZzuNjUSvaQ2peDn22glvIW9vXxSRk8Jw07AdQtAaz9VUfVZoAvNv1nXUgK6519esQFv+p5z7qgoMP47VpQEWb0jKPbbjlDl71p3Q0gywgYxXW5NZI+3l1Y6QHRGmff3tvm9V6CHzSLtoLWkX/IAPcvATETlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=blv1aHD8; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="blv1aHD8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751445920;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=S7uGF4IaJZBWwC/OpbDcFMKdkzU2sVMEsiTfudQm/MY=;
	b=blv1aHD89jWXViYS5iUwGJo8/f0WEJXZBeGLmE+0XFCq6x8KpzG2ADqff/zSInu+7m1e5h
	/wVq3xzV6g+AMdli+FmaBB//XTJF8sQ0gFsTvAx7izmXrDojPdDUoSmf79roiSzjjy//VU
	lFDUalzuangyNbUp5cqK8GiAqgg6Ly0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-643-2e6j663rM9muAHwGSa31rw-1; Wed, 02 Jul 2025 04:45:19 -0400
X-MC-Unique: 2e6j663rM9muAHwGSa31rw-1
X-Mimecast-MFC-AGG-ID: 2e6j663rM9muAHwGSa31rw_1751445918
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so4284933f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:45:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445918; x=1752050718;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=S7uGF4IaJZBWwC/OpbDcFMKdkzU2sVMEsiTfudQm/MY=;
        b=GjTDVE/5h/e0N1RoZ0PBrp+NyJMDxWibAS1Hy+As0bqEiRbPjEg9uYNhiOEm2TvrrS
         T5zGahT5lSJoGo3NpPydVs8416OXjS2tb0msHk4ld4iNcHjCZWDCrYw6MLEAlrWiLpTt
         vqI1TDccxOMFH5NNMsr5aQoUvC35q/89zLGU5wqhC/kaBRkYFhknAixFLxpM519k5x/C
         eC+4XlNWJ2slhTWLU4f3n3xfuq8wQpVLejfqac3w/b/Lt2uS1BFqVdIlLG284T6M1U1X
         9EodFOjjNwQTv1N/DKtUeetKQFx0Xf26Ptlw+y31hjCF/bdsqk7uuIfPo6CSb3EAcXsT
         DdZg==
X-Forwarded-Encrypted: i=1; AJvYcCV1wwozLinSo4D+OByEcSpk2T8E5r961lK0cKLDm1WWIJiTCNt3N/jDtY2iFbGWvW7/GS5BoP6Oz3nq+n8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+hX0yVIVym74poehyQ4UE+CjnOH2lGx8xbdXDjfR9ysQpi0n5
	Qc5ealMPo7BskyKL5o5LTskV5yLcV8UUawkXa230U8DIczGKMYAdxS1qoXytHu4cx2z/Bh3HBtt
	HC4zQ8kuZPgWMQNQX2nX8gLoFD0QikFo/gpHZ/D3dilfslApqkb4XBtZbZth+eTRQ/Q==
X-Gm-Gg: ASbGnctAErGzyhZiPL4UXjyPpXMhQylIPqGNUsVquwov6kCvfI3lKJoFIVL8kmqJtLH
	F8KUMYpsFnv1MPAOKXGpJXXRHaIep53rYMUyK4eO0icOOYzQ7X2iLEMwCBfQCqHJ4oMhXQtX/d4
	TcnPB+r9D/rrH5rBfP+rN4TCAXmvDITw5Q+ML9P5eEwGPsXkOuZeEQueCZT/zfNi+smZEl0nlVp
	SDAlbVlQbamli6j8qUAYlUfj0X55Uj7NustQBUlY/ZEkzrUWIeYZi2YwzQhBAbEOvbdzkuuBG78
	ghgqr23vMUwQ3v0bnPE/OcS+9J7s5Xlht0+lojgDIblCI0yxtNlhXqM=
X-Received: by 2002:a05:6000:4b14:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3b1fe1e66e8mr1336825f8f.17.1751445918266;
        Wed, 02 Jul 2025 01:45:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVUkJ4eAXd4DepCg8YGMUEHPAvXFYXlSzmmgCbmaMfKy7vW8QoqSVNBMJxW+YaeWy1Q62j2Q==
X-Received: by 2002:a05:6000:4b14:b0:3a4:deb9:8964 with SMTP id ffacd0b85a97d-3b1fe1e66e8mr1336788f8f.17.1751445917794;
        Wed, 02 Jul 2025 01:45:17 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c8013b3sm15463960f8f.39.2025.07.02.01.45.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 01:45:17 -0700 (PDT)
Message-ID: <ec5d4e52-658b-4fdc-b7f9-f844ab29665c@redhat.com>
Date: Wed, 2 Jul 2025 10:45:16 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: support large mapping building for tmpfs
To: Baolin Wang <baolin.wang@linux.alibaba.com>, akpm@linux-foundation.org,
 hughd@google.com
Cc: ziy@nvidia.com, lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com,
 npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com,
 baohua@kernel.org, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <d4cb6e578bca8c430174d5972550cbeb530ec3fe.1751359073.git.baolin.wang@linux.alibaba.com>
 <b8258f91-ad92-419e-a0a1-a8db706c814c@redhat.com>
 <fca114c1-9699-4dd7-9bca-83a5f5ac615d@linux.alibaba.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <fca114c1-9699-4dd7-9bca-83a5f5ac615d@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

>> Hm, are we sure about that?
> 
> IMO, referring to the definition of RSS:
> "resident set size (RSS) is the portion of memory (measured in
> kilobytes) occupied by a process that is held in main memory (RAM). "
> 
> Seems we should report the whole large folio already in file to users.
> Moreover, the tmpfs mount already adds the 'huge=always (or within)'
> option to allocate large folios, so the increase in RSS seems also expected?

Well, traditionally we only account what is actually mapped. If you
MADV_DONTNEED part of the large folio, or only mmap() parts of it,
the RSS would never cover the whole folio -- only what is mapped.

I discuss part of that in:

commit 749492229e3bd6222dda7267b8244135229d1fd8
Author: David Hildenbrand <david@redhat.com>
Date:   Mon Mar 3 17:30:13 2025 +0100

     mm: stop maintaining the per-page mapcount of large folios (CONFIG_NO_PAGE_MAPCOUNT)

And how my changes there affect some system stats (e.g., "AnonPages", "Mapped").
But the RSS stays unchanged and corresponds to what is actually mapped into
the process.
     
Doing something similar for the RSS would be extremely hard (single page mapped into process
-> account whole folio to RSS), because it's per-folio-per-process information, not
per-folio information.


So by mapping more in a single page fault, you end up increasing "RSS". But I wouldn't
call that "expected". I rather suspect that nobody will really care :)


> 
> Also, how does fault_around_bytes interact
>> here?
> 
> The ‘fault_around’ is a bit tricky. Currently, 'fault_around' only
> applies to read faults (via do_read_fault()) and does not control write
> shared faults (via do_shared_fault()). Additionally, in the
> do_shared_fault() function, PMD-sized large folios are also not
> controlled by 'fault_around', so I just follow the handling of PMD-sized
> large folios.
> 
>>> In order to support large mappings for tmpfs, besides checking VMA
>>> limits and
>>> PMD pagetable limits, it is also necessary to check if the linear page
>>> offset
>>> of the VMA is order-aligned within the file.
>>
>> Why?
>>
>> This only applies to PMD mappings. See below.
> 
> I previously had the same question, but I saw the comments for
> ‘thp_vma_suitable_order’ function, so I added the check here. If it's
> not necessary to check non-PMD-sized large folios, should we update the
> comments for 'thp_vma_suitable_order'?

I was not quite clear about PMD vs. !PMD.

The thing is, when you *allocate* a new folio, it must adhere at least to
pagecache alignment (e.g., cannot place an order-2 folio at pgoff 1) -- that is what
thp_vma_suitable_order() checks. Otherwise you cannot add it to the pagecache.

But once you *obtain* a folio from the pagecache and are supposed to map it
into the page tables, that must already hold true.

So you should be able to just blindly map whatever is given to you here
AFAIKS.

If you would get a pagecache folio that violates the linear page offset requirement
at that point, something else would have messed up the pagecache.

Or am I missing something?

-- 
Cheers,

David / dhildenb

