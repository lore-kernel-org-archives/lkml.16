Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD5CC2571DC
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 08:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745311742; cv=none; b=iUac4tIth7zb9/iVdbgguVCgUbRyGpyc3KlpP/jnKCIEhNxK4RUvXje3K1KqpIr2Wvd6MuOX+izt/RAufIP0B7q1VGAyXFeJ+h0zHZQK96IEBeC34PabPz6luWtnW8gr5DyUZxzhM8u3zC+3+50xY5+BpYOntn6/CUoqLdoH+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745311742; c=relaxed/simple;
	bh=WoPgBKtAFOU1d0fo8w6Xw61AaQs57lj8/ebxa9R5Uu0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X0UK1b9STnngBxiU52scBvXfOHJMiqiOHAp3+JGnPdExakWJu0yN27vMhhI/3+AHp92bMrhzeiWRRv3sZRbBUFWKh+nf1Vs9E6IqL7Wie3W6IjxcVx7Nv7/nzJeqFQrPn+8i0S3C+mBaktF6mDCZnLApNxeroD+7P6KiFh9SNxQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aMeEdFdj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aMeEdFdj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745311738;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=2hQmx2tjREbFqjppMAUgEyDX3dK5Udtyjz5xYSNhM3c=;
	b=aMeEdFdjJ5+22cah4jmEFjl9BK+xMQVkTvjBAVefP1KeS2w17AzHpv38ECyX5P6CUrYiql
	EFgZW0FIRLQCeFmswwIAn0d2ip3Ly018oz/3QgOmv+ozyPJTW41Ju2nR6MA4AUykLCsJs4
	Z9T1hWKce90+76cbVmgIktF4vWr3j4I=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-481-vJrYJRnmNgqlHHZ9wlssDA-1; Tue, 22 Apr 2025 04:48:56 -0400
X-MC-Unique: vJrYJRnmNgqlHHZ9wlssDA-1
X-Mimecast-MFC-AGG-ID: vJrYJRnmNgqlHHZ9wlssDA_1745311735
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceeaf1524so21019045e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 01:48:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745311735; x=1745916535;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=2hQmx2tjREbFqjppMAUgEyDX3dK5Udtyjz5xYSNhM3c=;
        b=ptzxSXxxgQgG7j2g8nXqSHfClxUhXA31ZynuNaUQKmbL8R7nnh1DnJzS4KtFvnB9Fz
         xplJ/dfrIpRBA2mdi4NLAaePMWaboHXSTzYM3xugvgkvLbLZni0xNwJybpPYjlJtOK3V
         NxZyXNfdnqTmWfVQ4YZba8LgkVsv1EcdOgLqlTuARsl8dk5QntaIJN2V/B1UXtqDrhVq
         BplQr5RzKxPh5TxUSLBlOquxsaI7bjD92e29HrRLKZiOdGFu3XAxaGMwBOfC4U7E8AN8
         47eWNgYtCM0B2hBJpFhdGyFcV4PeX2JhyUQJBUdvktW25RtGzT9+veJrXCrZI3ye5ZTr
         yGfA==
X-Forwarded-Encrypted: i=1; AJvYcCU+dYCcPuEayxzEavRfoXpXLA9zjxovcwr1m2xDvoLaJ+2lBIulBXy8DvOMjOeUAhLwcw3gvAeHc8Fl1Jo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yya/906d0N2YT+vzECOfgez9m459e1Ag5z1KHrx8nGThdU+Go+i
	Dn196UDAv7gLR5GfgRsJyPbAmKtCxfIyAr9DvCsu+8WqjX+HfeQrAqy2RCI5TNLgHIqGT4wOmKR
	0AtstzDi1o4sFmxRszOaot9Vniuf+8+2kT+KUqrXxr9z0iburN1EyDT28HJc+bg==
X-Gm-Gg: ASbGncvSa1EjtmC5b2LafvS7Zw/RSaZo9K3Uz/0UmUqUlZoTRqUKy9dIFb8Kdol0UZU
	OzW1wCZAkYeJ3QjLyIwupVctrZ7/E0kV7Pf30zfLAoylH76DLbjaDwAQQGisGQgPPf/uLd7uGu6
	C/g3QTTyzFaM8vXshDBu1W/6VquXDqjn8G0RYfCnzKJpwLVdYfXOJST14S7eI96k1cG1D99KgGV
	v+6oZdin8YyAvXJne2YdY7xjrPd1FzyhdUQ9vcyuQ60afq5tIDtK2StJ1N8Cdxf2Mi3J7uJD/IX
	zIJXmMygO7YU3jelyBDrEgDNGlHNvl5lY1XMYo9agBsCioFG5mf74QLY5vMX/WJoHTMBwocpnDo
	8AHNQYgjzwHHtw1wPN220QzOoFYKtpMAlBkl3
X-Received: by 2002:a7b:ca4d:0:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-440696f77a1mr131000935e9.3.1745311735147;
        Tue, 22 Apr 2025 01:48:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGKsSKA9Em3JZWKAbH2ydj7LyeGTaEIB2jbmFq1GS+78Pdzj5tZJEcH7x+cEtto/QVHIlfhQ==
X-Received: by 2002:a7b:ca4d:0:b0:43b:c592:7e16 with SMTP id 5b1f17b1804b1-440696f77a1mr131000585e9.3.1745311734757;
        Tue, 22 Apr 2025 01:48:54 -0700 (PDT)
Received: from ?IPV6:2003:cb:c731:8700:3969:7786:322:9641? (p200300cbc73187003969778603229641.dip0.t-ipconnect.de. [2003:cb:c731:8700:3969:7786:322:9641])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6db230sm166556655e9.31.2025.04.22.01.48.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 01:48:54 -0700 (PDT)
Message-ID: <ad54fcd5-e893-40d0-bb92-5b6305db5e73@redhat.com>
Date: Tue, 22 Apr 2025 10:48:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] khugepaged: Refactor
 trace_mm_collapse_huge_page_isolate() to take folio instead of page
To: nifan.cxl@gmail.com, rostedt@goodmis.org, mhiramat@kernel.org,
 willy@infradead.org
Cc: akpm@linux-foundation.org, fan.ni@samsung.com,
 yang@os.amperecomputing.com, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-mm@kvack.org, npache@redhat.com,
 mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 Baolin Wang <baolin.wang@linux.alibaba.com>
References: <20250418183920.273154-1-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250418183920.273154-1-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 18.04.25 20:34, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> trace_mm_collapse_huge_page_isolate() is only used in
> __collapse_huge_page_isolate(), which passes in the head page of a
> folio, so refactor it to take folio directly.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> Reviewed-by: Nico Pache <npache@redhat.com>
> Reviewed-by: Davidlohr Bueso <dave@stgolabs.net>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> ---
> v2:
> Picked up Reviewed-by tags;
> v1:
> https://lore.kernel.org/linux-mm/CAA1CXcB06JD9Fp4c7GGU3NHEm4W-aV7TS7JW7eWxshJEM4t2_w@mail.gmail.com/T/
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

