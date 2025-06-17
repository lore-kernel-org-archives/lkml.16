Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D37290BC8
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 09:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750152874; cv=none; b=tSue85l01Dmz2JpwwNN5g9i3bbJMw/uSp8CNv8VlKjg7CqXbl6FGfntdmARJdsmIuAWKoo9yUB3YBdDAZ2hQQnkppZP+hYE7iD+qAD0fiMDpmQs5jKPLIfrETZYOIR5kO+rjOdioSse0odR0R8zxXu/Q5Fgv/IW8Q8Dpg/STEZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750152874; c=relaxed/simple;
	bh=/l+blL0P/WvKFXEmP8UAB8+2DcgBYjMRCa/JF+NxGbg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qOwXuAjykiCr3vZo+6aXEQFj8ErnFMiKvYEDsiVpZZ3Y3OAknYX3B3T4s3ppOHGUEvU9sYlW4BESek6GqRUFOedf19vTbSerKlLR3j/M+ISXodRUgFCRtTWansXF3KijVYCbaVSDeoSm0m+O+VbK0FLFmLzd01QSSpRghKgUWU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=H17Ga4VT; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="H17Ga4VT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750152872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
	b=H17Ga4VTXpLcJQtVGtOXTLTdsFRxwKIZHlHmDp2f3q4yHxHlYVq0ynSoYBY/wGSjSEXrdP
	g/u+MBzDyHyrpTb8c4q4v4wOZCmmwb9NRwni4iJ4qkwmUjmxgg/DTemp6jmXWVHFthclTk
	fu1Xru0KpxBxLCTSONuPH5GsGdosqhI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-0U5Ei7I4Mr2BnOHngu1nmA-1; Tue, 17 Jun 2025 05:34:29 -0400
X-MC-Unique: 0U5Ei7I4Mr2BnOHngu1nmA-1
X-Mimecast-MFC-AGG-ID: 0U5Ei7I4Mr2BnOHngu1nmA_1750152868
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a578958000so997808f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 02:34:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750152868; x=1750757668;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=UoO6Im3sdMj9qrKiZw97K0g1BjWI//UD+48kISxcxhU=;
        b=Md2sjsGPa+KYULiU3PWUTXfJVAbVHN/Ck1D01frX1Y1Zp2PhueQe7soqUrUZu7luUy
         gDFrOpe2D+ffy5DsOW1lUNVm447Ixhj0C1wwhi19gNqtol2H+Un6fvVCGS1P+QUp59DR
         y70eiB7al2RCGYFfGkNB0y+hzBCwaaKDLVv1PQx7L+wMPos0Ad12uRjJ2RbMhvrZKmWC
         Nvemmqeo7pJ9wgpyJhO5hZ83CUBamlLbNTxLpuw7/RRsyJ6xqsRsY6ET++rhk3HHfnTq
         hLRDja5VfXw/4odHhvWD6n72V8ZOwJ39228Z/t0MdtkAjXXeaLWL6t9nmJbXJkIZfuQR
         WnUw==
X-Forwarded-Encrypted: i=1; AJvYcCWiqR6damsXJ5SJQlIZ60Wa19DtrK0XUDXzgaFkvjHjeVySiH+uvi35EiQ3un6BMigsQ/98eMXM9BHkiEE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4lgtfWdyt4yJfoG5UOUUFubaMcTcUqGCBfE/DWx/Xevg17pth
	0F/1Yq0jdyFAL/a0HcbZScinjFsd3C9gXgCZubqffLYU7g50unFCMnf8KZKaYY2ZCirCfwVIxKL
	OoT7WeCqmjPMZuotzIg6heJEHj2SMjMt9dWx4ZQuGfnGnejyDPx49WQZW3uluhRIjgA==
X-Gm-Gg: ASbGncuB9YhCYaYxrklH4AX8xLfzYyyMhA82uEJ9p1wABmD4kTkkrdh/CCE6BE8gn3J
	5IGgpseA7gA61OZhklFCMuI6tVUpbS03lIe8aM02ZcHFNHw6eXmMuJL6cXvMQQZkAuJLU/+s5I6
	RTjdwhvGCQiex26jTBKqGnIKcR3OJS4yden4e2qRWSL5G2AIKCEcIcf/z/3kTpg0UVtYxcbSNaZ
	VM/7KlnxzTKjDuEwGkH29kgkLnDsdmt8+QHoxhbAIwp24GhuxseBWAuyG/+uR8gHsDuPc5P3TNW
	SuYlfTrhVt5vStgIXkdKyz7FP8kbFq5D77WwjeW767PxRqM48rX3mrMQFWVFRnP7S+ilcgJUUos
	3aK+ZLmh6jj7NdY3uJj9DGxZV5HfN4Sn7F/troFYdn9I41Ws=
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr9462615f8f.22.1750152867957;
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAmkCmIe8r1op6vQb6TFjyJmDKs7yVrH6V8NRIzvLkSM/8ZQuEH09JTbMfp0YgKwsQ3nxlSg==
X-Received: by 2002:a05:6000:480d:b0:3a4:ed2f:e82d with SMTP id ffacd0b85a97d-3a5723a49e0mr9462594f8f.22.1750152867607;
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f31:700:3851:c66a:b6b9:3490? (p200300d82f3107003851c66ab6b93490.dip0.t-ipconnect.de. [2003:d8:2f31:700:3851:c66a:b6b9:3490])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a7f8f9sm13367621f8f.42.2025.06.17.02.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jun 2025 02:34:27 -0700 (PDT)
Message-ID: <b2640810-d528-4a3f-b69a-87847943dc2b@redhat.com>
Date: Tue, 17 Jun 2025 11:34:25 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/14] mm/memremap: Remove unused devmap_managed_key
To: Alistair Popple <apopple@nvidia.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, gerald.schaefer@linux.ibm.com,
 dan.j.williams@intel.com, jgg@ziepe.ca, willy@infradead.org,
 linux-kernel@vger.kernel.org, nvdimm@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-xfs@vger.kernel.org, jhubbard@nvidia.com, hch@lst.de,
 zhang.lyra@gmail.com, debug@rivosinc.com, bjorn@kernel.org,
 balbirs@nvidia.com, lorenzo.stoakes@oracle.com,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-cxl@vger.kernel.org, dri-devel@lists.freedesktop.org, John@Groves.net,
 m.szyprowski@samsung.com, Jason Gunthorpe <jgg@nvidia.com>
References: <cover.8d04615eb17b9e46fc0ae7402ca54b69e04b1043.1750075065.git-series.apopple@nvidia.com>
 <51ccdbbc3d7b76a7f6e2aefb543eba52d653a230.1750075065.git-series.apopple@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <51ccdbbc3d7b76a7f6e2aefb543eba52d653a230.1750075065.git-series.apopple@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.06.25 13:58, Alistair Popple wrote:
> It's no longer used so remove it.
> 
> Signed-off-by: Alistair Popple <apopple@nvidia.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

