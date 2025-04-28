Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DFE101C8
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:50:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873444; cv=none; b=RNN7KSlth0oNOVXYPkMxyGV/4oity01jfox9bGgvWACf9Dp9Zno4M2zqxHju3BBJYM8k2PMX/qjtcgh3x7327IBtVYQiDTHqbnn0BTjgWPun6wyDxyeUAuhlUyDETNJUYFxLiAdvaYCptt0gYXmZSB9yGHNcRGsOn8ZMuKsln+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873444; c=relaxed/simple;
	bh=XvDRCjIet0skhQzNyZnjjZ2vab8Xlhb/Qx5v6vBIbaA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DAsw/ruvYDMxMjLZMKDwhMERo/VtwhUwIBRBsWEGETsymCRx8hJt2zi4XFxZywu14gBwm2JJGhtcCppkKRKP2FUj9pohQetWIYO/O7Y4dMsTzUG0r++RpiTYoJMjDeInEsaRdFHZeUE/ZJYBgydcISM1QQlRjFnVBodmtFzN0tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HHyQD1D5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HHyQD1D5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745873440;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XbMvGOhD9vaJiD0OBv6udKVu/Ls/zjaBXiw2McAVVes=;
	b=HHyQD1D5YcjkLUV0sqtXv4RbqIjFi39EmCuCnxW12VIRzXm1iXzSorWtCBQv/crdX7WRqL
	LOGC+NIV32pf4jV3+LxTJLI44x8tFkSgaYToNgcAypeam9mFmaZ2x9982DLVvrG7pa0bn/
	xO8VvS1dJ/YC7ghwyCscK/E7w83lEdw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-Hw1ltlykN2OgBn7zPpF5vA-1; Mon, 28 Apr 2025 16:50:38 -0400
X-MC-Unique: Hw1ltlykN2OgBn7zPpF5vA-1
X-Mimecast-MFC-AGG-ID: Hw1ltlykN2OgBn7zPpF5vA_1745873438
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cf446681cso30129415e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:50:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873437; x=1746478237;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=XbMvGOhD9vaJiD0OBv6udKVu/Ls/zjaBXiw2McAVVes=;
        b=MZk0DbDnlCZ8AxJdSsVk1D+snP05+/JxY0jHaHF/tXslCaPMEzm8rs6DMEsYb4SarT
         jy/nfyNo/gYQO6pxn8q38uE4tLzZrpl4v21lMrTdw2CGxt4SXHA7Wz/LDQnVroNb6wy6
         j9roDczHIB85gyaocG6Y3riLifZRXiKDhd/tLL2YshvrQbzdAxVs0KrWUhk/tACCAsGZ
         pjJ7DS1b5j8G1KfMfhYRAI6iOAWvFhI8nG3jhZ7AdEgN8phQR0vluJF5mNdn0vccHEsI
         MStAhacRcmRZzlNUROiyOjL+deXGzvfbehyFpGBvmW1e2wz78d13RlVZxOi1Ea/kBVF6
         4EKg==
X-Forwarded-Encrypted: i=1; AJvYcCXeTbBxnp/8yYmLY2r4o92q73L6Gd5NGt7bvVSzL/F4fue8qnsbxbvXxd2hOjEsBsu2TEJJHBYzS/B/gqc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCUWVUFYQohw1jJTjQQIWjVhS/9HwNoHSobGfLc/J0Y+tCBjU8
	3fIclWtM3/DNN/Oq3d4+OLhgR5GlL8mh9EzYwdM4jHCPfL6DKUkRJ3HrdkHGliJcGdsp3U6gaZs
	RAYiSoh1E+qi+1sHxIC4GqE0Pxkrdcq2LQftX5IvxqxVEn5IHV2lfY7ktliqFww==
X-Gm-Gg: ASbGnctZ4dW3vvfWL7QWxCA/ybpHKfyrzbOk2Hfw2iWKu7t+izP5Y04hvV9b/NwqR9c
	SXgrDxfNN1XeLvmxCP6wd4lTEsO/N+QYrJXzYsF6AV6EFedO6ejm4qN2YGMqS2pUtJTffh0rCHY
	0q4c9UNf7pJDMSpuhZtY22yFbR92tDtTNAKXKu3F2/6Zpj119DPTWgsKftAeqJ57ksuq0vVe1E9
	IAdAOucpwj0FOmSAtUJkgntXaomNsOdhCV7SYwjxApPh0rYSEKBRWnHbIrgWJKLFQidzSvyYPCe
	5Xws+cLoVRdmilIBJOWs8KmHD1nmPkNFg9kcQNK9itQwb6ay3GO+IPhoLEr/2521F+bxKdV+84v
	Y2SnFuVNmjSJPE5v2RHXdpkR/sFVDe2g4SIew5wY=
X-Received: by 2002:a05:600c:548d:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-441ac85dea6mr8003895e9.16.1745873437650;
        Mon, 28 Apr 2025 13:50:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZZSA4A2JK3uwnlhYhPt9NEmaCHGim2OUmzKTYO87MCB0WmeSSjAAxfFgoiLVeJaZPK6LCwg==
X-Received: by 2002:a05:600c:548d:b0:43c:f70a:2af0 with SMTP id 5b1f17b1804b1-441ac85dea6mr8003715e9.16.1745873437361;
        Mon, 28 Apr 2025 13:50:37 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8cd7fsm12083934f8f.1.2025.04.28.13.50.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:50:36 -0700 (PDT)
Message-ID: <542cf4a3-b1f3-4ca1-82b4-56514f9b86ca@redhat.com>
Date: Mon, 28 Apr 2025 22:50:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] mm/hugetlb: Refactor unmap_hugepage_range() to
 take folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>, Sidhartha Kumar <sidhartha.kumar@oracle.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-5-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250428171608.21111-5-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 19:11, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function unmap_hugepage_range() has two kinds of users:
> 1) unmap_ref_private(), which passes in the head page of a folio.  Since
>     unmap_ref_private() already takes folio and there are no other uses
>     of the folio struct in the function, it is natural for
>     unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Sidhartha Kumar <sidhartha.kumar@oracle.com>
> ---


Acked-by: David Hildenbrand <david@redhat.com>


-- 
Cheers,

David / dhildenb

