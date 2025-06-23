Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3012F24
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 17:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750699521; cv=none; b=lHkNHSgs4s2AFMNzbSWUPw4LbISLmipNqxlWLmrL8FYBmyIUL6Cjd8k2LfWmPAUfmGcFzuNy9ogDEH2EXqEmrUk+Xjkw79KaNroqVqJQXSEAhI2BV8b/GKxh+d9tujPcYQsQrRnJrFLhwxCoC0N/3XNLoROaXE3CpmevSZoFTSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750699521; c=relaxed/simple;
	bh=87tlBlz7JfISe5KEFOpUV9kPHwz0ulur4UwY/ylHXTk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mx12eks3cuaPvAnHnYLPkSkOw4QBb30fi8Xvxzvjvf6O9MiozRMCVsrCa1Kq8cyc6RKQfIibyOv/TQ6bX0/ZI/ySCihdanpmeKpgfmTTE16BU0x6jggcCg2oy8LhxBucvjrjmqe3dJzEANchBTf2mP1rfA8If4dlirBTLMqm8hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gP+iXF32; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gP+iXF32"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750699517;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=zHRxuQHQxPmBWSJjNfvadVQiBbqMbIsluVpdxFMJMlY=;
	b=gP+iXF328aFARbfAdRzh3JDSZ+kYFZF0OX+iPnsicRfTjQdglcZky686tmLouHjNd5SpGQ
	wlq9HY+9ogsXJbe8E/81Ms2nLQ7f9F4fy+a8AOVtCdnKNjuFncOliWFwYBxQxhNKBToHx6
	o4R1DXjHAFciK1ANxuWi6+dukc8Wkx0=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-310-ibQWNirwPF-uK9GhkpOACQ-1; Mon, 23 Jun 2025 13:25:15 -0400
X-MC-Unique: ibQWNirwPF-uK9GhkpOACQ-1
X-Mimecast-MFC-AGG-ID: ibQWNirwPF-uK9GhkpOACQ_1750699514
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a58939191eso1847990f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 10:25:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750699514; x=1751304314;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=zHRxuQHQxPmBWSJjNfvadVQiBbqMbIsluVpdxFMJMlY=;
        b=E0W8I2mUExFfEOKypDe9g3aqRe8W1wy9M7QHXwMqTDvhr9VpbJ0HlYJT9i2f6b3F4O
         MUHHCoZelUiT65p4Nkkk/eOHqdtKxfOEtvy5qZ5Fk4CNg/210z+P0XEx7HNousWV7YEZ
         jCaHH3bOFL0t7LTEMaqebLn7ps144dNPytU1dN6ZC39n4p0ezeZxv0rxzUfVhj13NE4v
         Gk8HvbPd4xjwcaDufPUhp/DlVwbJfSvMVox9ERX2P4AhoUP7yUlfik4y+z+kh+9/EwZL
         L5nZoarqe1aZLCqFVfl7D0SLuObUKaNGdKnQt2QgLH1IVUFjHNCHVS5LhctPFaOtRB6E
         uMCw==
X-Forwarded-Encrypted: i=1; AJvYcCX9/FoAr3wjd03UQCjRCgkth7kt2sqRnMU39d77BkVIoZlvWDUCUgfpYmrJoV0eLFeR7n6hrvEnqec+T4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdzIRQ0J2jNvZNrFHN1i+r4rOyhLSNbIzqpnCN75iR8nfU0Stc
	GV1J6b8+42NxCtVd9voRwtdg54iWvJUowgYb4PQ/sjeOuRRZaSKre0D+JkSFVHlT+3CXolpwLOm
	OFrAJzbKmchEUhtLi1hy0aM1Hqgvfj46xjXTfXs9G+pnMjn95eHyq5V9WMTLBta+Vww==
X-Gm-Gg: ASbGncsOHbZ0OHqRzdCSlgMPnlDKvPQ2cTidSZTZWkj7uPHtr9R7JlByohf0xHJug1D
	Pw7eiN/Am4bx4kYb+a+BfalzKO3E2fKe1t+zbV97u+O2gv+hLSkFfi1HfsA/AeCwBAeQRjSgHtB
	u0KPsIC2bpi3dsBHUhp8xD7biuR2FPxAaYxShohOlN8KUgh1/RowZ3+NtCT4QyFGGiG5YvTJBQ+
	+AON5vnHlcOe6ZbYX5yd0ugoDIu2OGoOcq55+GpXKz4NIykhZpc6vC8hespi0grOYgE4jddyv82
	EvyMtbYlYe02BC03efudzdN15PbnppCEraZF7k/PHiTRVBH/ORoKB8iB5jG6f/QZFXmNMk/dzHM
	BseGbuG0WG68p1KjWXI+T2oZXO8ki+h3Ylg5tSVJdcwJcuN1n3Q==
X-Received: by 2002:a05:6000:4284:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3a6d12dee20mr10919210f8f.39.1750699514036;
        Mon, 23 Jun 2025 10:25:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGBQT31W6WeCQ3ap/6NtYgNOotR1dmGghybdow3I9GEJWH8KXV5J1/ML3jxIAZwzMasxrez1w==
X-Received: by 2002:a05:6000:4284:b0:3a4:ee3f:8e1e with SMTP id ffacd0b85a97d-3a6d12dee20mr10919190f8f.39.1750699513663;
        Mon, 23 Jun 2025 10:25:13 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d1190d13sm10000660f8f.90.2025.06.23.10.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 10:25:13 -0700 (PDT)
Message-ID: <471e95bc-ea2d-4c37-aad6-0062b4457054@redhat.com>
Date: Mon, 23 Jun 2025 19:25:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] mm: Introduce vm_uffd_ops API
To: Peter Xu <peterx@redhat.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Nikita Kalyazin <kalyazin@amazon.com>, Hugh Dickins <hughd@google.com>,
 Oscar Salvador <osalvador@suse.de>, Michal Hocko <mhocko@suse.com>,
 Muchun Song <muchun.song@linux.dev>, Andrea Arcangeli <aarcange@redhat.com>,
 Ujwal Kundur <ujwal.kundur@gmail.com>, Suren Baghdasaryan
 <surenb@google.com>, Andrew Morton <akpm@linux-foundation.org>,
 Vlastimil Babka <vbabka@suse.cz>, "Liam R . Howlett"
 <Liam.Howlett@oracle.com>, James Houghton <jthoughton@google.com>,
 Mike Rapoport <rppt@kernel.org>, Lorenzo Stoakes
 <lorenzo.stoakes@oracle.com>, Axel Rasmussen <axelrasmussen@google.com>
References: <20250620190342.1780170-1-peterx@redhat.com>
 <20250620190342.1780170-2-peterx@redhat.com>
 <1e6fcebf-f74e-46ad-912b-d7df13527aea@redhat.com> <aFld0LpB429q9oCT@x1.local>
 <0126fa5f-b5aa-4a17-80d6-d428105e45c7@redhat.com> <aFmM4XXTC6gEmdR-@x1.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aFmM4XXTC6gEmdR-@x1.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

>>>
>>> How about an updated commit like this?
>>>
>>>     Currently, most of the userfaultfd features are implemented directly in the
>>>     core mm.  It will invoke VMA specific functions whenever necessary.  So far
>>>     it is fine because it almost only interacts with shmem and hugetlbfs.
>>>
>>>     This patch introduces a generic userfaultfd API for vm_operations_struct,
>>>     so that any type of file (including kernel modules that can be compiled
>>>     separately from the kernel core) can support userfaults without modifying
>>>     the core files.
>>
>> .... is it really "any file" ? I doubt it, but you likely have a better idea
>> on how it all could just work with "any file".
>>
>>>
>>>     After this API applied, if a module wants to support userfaultfd, the
>>>     module should only need to touch its own file and properly define
>>>     vm_uffd_ops, instead of changing anything in core mm.
>>>
>>>     ...
>>
>> Talking about files and modules is still confusing I'm afraid. It's really a
>> special-purpose file (really, not any ordinary files on ordinary
>> filesystems), no?
> 
> One major reason I wanted to avoid the term "in-memory" is that we already
> support most of the files on WP_ASYNC, so emphasizing on in-memory might be
> misleading, even though WP_ASYNC isn't much taken into the picture of the
> vm_uffd_ops being proposed.

Oh, yes, agreed on WP_ASYNC. But they would not be using the vma_ops 
thingy, right?

-- 
Cheers,

David / dhildenb

