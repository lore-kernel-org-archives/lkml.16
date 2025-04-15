Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D963229A3EB
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:25:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744723517; cv=none; b=iPzpflVaoKoFiVLcj6V4/jIMcfnGlftoHazE9E25PCuXLZBRa/ENouGzS30hbRe9Nqa4QjFgVmfplanSnypWA1oeNRNqh9bH3BpkprHJP7rRUYbNRRf0tH9jr+iSJHIyOj+uWyj/fsDo/Jv85MLX9cz/AMBTRn42oF/q3THKquo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744723517; c=relaxed/simple;
	bh=1kmTDzwbqUw5597FGsnJ6fdTSaVCZOVOB7jQmWTPMmE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qBGpsEf32S5uf6M8L7dSVEwxMiMpWigNz3Fm5ibyIhO1xETZ0gRPWCSHn3zE5G53RCZVTwHXF4S78sWt0Ni0RgMM70+smA0myYA5+ehTGFf7IeurnpC1wdgtYwMbuWGX9HO+7jVlD3+RaO4c7q7RGBV2Lf6wmk7IsjQIvYBjp4s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=iqiWckYc; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="iqiWckYc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744723514;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=sOhMlnbJzkvDRZ2bjE3671qzIn51BJQOdWOKjKpl3eg=;
	b=iqiWckYcUDGHBpUZr1RZ2Q5wq7kd9i/CndlCclhYAew6bLBghg176U5iKnej3SQW49j8h8
	hjxJ+a7Xh/f+Pr9KF9zjm5jmW0IKxeEtKJzQIV3BvvvHpq/iv6N3D3O+k0y9OvXnAA9VPE
	1nn6/mBlMaCucQSR3Ynv9cYR2Y18IkU=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-sg14uOX_NW6OG9KhV7_HkQ-1; Tue, 15 Apr 2025 09:25:13 -0400
X-MC-Unique: sg14uOX_NW6OG9KhV7_HkQ-1
X-Mimecast-MFC-AGG-ID: sg14uOX_NW6OG9KhV7_HkQ_1744723512
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so31254525e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 06:25:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744723512; x=1745328312;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sOhMlnbJzkvDRZ2bjE3671qzIn51BJQOdWOKjKpl3eg=;
        b=O+wVGwSE8XyYHDEO03rkIOkhBygWg5M3HHjw25iCPGl/B0czaRygCCYveRzRI+BlMW
         A0W/U974cmEzy7+Sgt0BUuwBGEQnjBzFtc/iIGv3q/GjnJ7P2NTwdEmlxme+TWBEYA/d
         UWj2kNsi1FKzSFVRNCjq0ubIQ6lmrJzd4h9UN54AMpFtHK+oD1CKOEfH/yIadMJp71BY
         v9V0dZ43k379pSlhipp3lpcvEMbPT3i7BGPdg+bM0Yquv4nqewJHf0w40PNlL/TXYuUA
         obhDYl0cMDv4i54lsK84Cw2ZTDtjZIvcBEz8P5YmgrQ2OaLH6t3uPSB8ih+siQj9iaDb
         Imdg==
X-Forwarded-Encrypted: i=1; AJvYcCWR7Qmyab+0weR7P8r3pdoXgJn8TpzW1MEQUGVQim1RI5eylI8bP9cdRTf0EZ5eBxx8PogEqtUNBvZrzqM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzn6krfsWDFr6RY+hkaxJS5awDGZ5/5lEjeaqbQm2fqKUQMWebU
	L7Lg7565+bLyQHKxfHD56+baKSr3ZAXtrKFuvkbU/7QqQvtqEe5d9t+Y0A29q54CJhqTDtcnpwj
	Zmy2r8nn5Nms+BXULucKJnHnuT97SYOYLWRMwrprMibTLMC91JLrd9CoMsmFLzNchPAOCCsg0iD
	4=
X-Gm-Gg: ASbGncvPs9LKQKAurwf9zyh0jryviRcCpNVXGTux9+vI0JSjvl90IVIuBPEjlStwNSO
	IzBmyvXWp7XWZqQQ54ToRrYLMdpvSHtpB7oKOUBc06KLDKdL4NXwMl0xbOXdPxg1yZOPYBL6F+d
	TMBG9vzdbk0cwvE6L3vJhpx8FHWx92Siay19q+kxW/zZ7O0JyHuiuMxuSQEVi4JZ0GoBQtmcWFe
	uHoxTR1bDX5k3tiGnFgLfr4Gr6TCAM15IbwH+xMloe7krP5xSKzDQDJOqKFJMfgKeBbWSN+t4er
	xu42wpshe+fRIGlqc0yvDG4Bn4EbMy9YchLSymcQqgkTRNDnG+4is9nWWn4AZUJnKF9CEdLHpF4
	76mmGJAnb3aGL0XsOSgeYygx8WHMdjh358MIjZw==
X-Received: by 2002:a05:600c:4f43:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43f3a95be28mr141045505e9.18.1744723511783;
        Tue, 15 Apr 2025 06:25:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGwgtMwFDX2jNzoNoFjdQfSHsN3KkiDqOIOxoziA1dD4AAyvKxzLwwttWIqEAu5Dyy8emY7mg==
X-Received: by 2002:a05:600c:4f43:b0:43c:fe15:41d4 with SMTP id 5b1f17b1804b1-43f3a95be28mr141045265e9.18.1744723511421;
        Tue, 15 Apr 2025 06:25:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9777absm14061485f8f.46.2025.04.15.06.25.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 06:25:10 -0700 (PDT)
Message-ID: <00ab4959-4fc3-4e2a-90aa-25a009b8fea8@redhat.com>
Date: Tue, 15 Apr 2025 15:25:09 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] MAINTAINERS: add section for locking of mm's and VMAs
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Suren Baghdasaryan <surenb@google.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>,
 Vlastimil Babka <vbabka@suse.cz>, Matthew Wilcox <willy@infradead.org>,
 "Paul E . McKenney" <paulmck@kernel.org>, SeongJae Park <sj@kernel.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <cover.1744720574.git.lorenzo.stoakes@oracle.com>
 <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <0722c3fe0cb4c1e54ce01c7689ce4615ecc87e16.1744720574.git.lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.04.25 15:10, Lorenzo Stoakes wrote:
> We place this under memory mapping as related to memory mapping
> abstractions in the form of mm_struct and vm_area_struct (VMA). Now we have
> separated out mmap/vma locking logic into the mmap_lock.c and mmap_lock.h
> files, so this should encapsulate the majority of the mm locking logic in
> the kernel.
> 
> Suren is best placed to maintain this logic as the core architect of VMA
> locking as a whole.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8d834514a047..ce55676a16a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15595,6 +15595,21 @@ F:	mm/vma_internal.h
>   F:	tools/testing/selftests/mm/merge.c
>   F:	tools/testing/vma/
>   
> +MEMORY MAPPING - LOCKING
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	Suren Baghdasaryan <surenb@google.com>
> +R:	Liam R. Howlett <Liam.Howlett@oracle.com>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +R:	Vlastimil Babka <vbabka@suse.cz>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +W:	http://www.linux-mm.org
> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
> +F:	Documentation/mm/process_addrs.rst
> +F:	include/linux/mmap_lock.h
> +F:	include/trace/events/mmap_lock.h
> +F:	mm/mmap_lock.c
> +
>   MEMORY MAPPING - MADVISE (MEMORY ADVICE)
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	Liam R. Howlett <Liam.Howlett@oracle.com>

Sounds like a good idea to me

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

