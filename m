Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFAAE233701
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 06:36:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747809410; cv=none; b=g4wjOgPVIj6LtE5j7QFiiyVhCA3fbNwuMyJDeii9hHplIHD8XthKyAe4Ddxx1bnI+leq2rVj6UHDXEoio9sgokclvQE4xFg8krV3M0iVNTXubrhscDtfOYdpqTzixrWM8lI6Hd3g/9PYPDhC4mrAnuyJ+wx1F2NjrLkHU2Gq66A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747809410; c=relaxed/simple;
	bh=Kz0jgOrwuFulcWr0P93iPFcHzxvFK9RLVKBOU8rPpyY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LAwXlltN0so5WhUNBiuR4m5JibhzAvSyb9AHIXm9gj91UilO94zDCwu8C+dEAmLyF3+yWwtAP1pBMGuTg/iaecP3Rsyy6IG87VaageQkDG4oRUB+5G/E3FWcCaZSD8neh7hkgrCBPhfdGkQWx3tHKIIrIkziKK6PRLCLtmxoYxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cdqYitFN; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cdqYitFN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747809407;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=xnnddLTK9d+NEX5hWWsGOa8jqB/IXOsu8XDFeUKUERg=;
	b=cdqYitFN439e80BMPck6ZDx7aEgryDyk+E8yAGpP6wvhP+aqkFHyOZgNjBV0MVP0FglgMn
	XHuHNq9WMVkcggSbaTGyBaClsVcxm1kEw2GjVWwp9aCLWCjbBbO6W4VyN+N2DsvPpdBRRG
	JWaY14Xqgdl9/nNsbKqtknRfp3cglEM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-GDMD1JLhOQWb35AHmMGEoA-1; Wed, 21 May 2025 02:36:43 -0400
X-MC-Unique: GDMD1JLhOQWb35AHmMGEoA-1
X-Mimecast-MFC-AGG-ID: GDMD1JLhOQWb35AHmMGEoA_1747809402
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a362939f61so2364842f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 23:36:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747809401; x=1748414201;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=xnnddLTK9d+NEX5hWWsGOa8jqB/IXOsu8XDFeUKUERg=;
        b=gv1Ej/r639gCUEWGdAp5xzqpFaJjBmaigwLis2yd1Vv7oC+JHl+lwhihHHe8Bfn+oo
         dbJlzdoJKVVJqcDB73d4bC1OJCpIVxgKahSRRMTlZcSvfQpWHqivjzjFI54089bY+/5d
         oWU8vvnoK3DEVf1+Mf/kzdZ9Pvb8m7AKF1jSHdCtJkhfUgCC4YDEZQMFc+mE+YD58Rea
         QWzYo/yEA+FKtwGLK+f2Vi8fk/bKT1lO4HGn3xiKaaUlSOJ/leNQvomZbscSGx29UWCM
         fHo1ag6/q8bs9dD3+iJ8RwgJCkmkyCkT89QC2Ub8XTFtXJy+fo0rUvIHsjAHrKQfbivP
         yCTw==
X-Forwarded-Encrypted: i=1; AJvYcCWbf92eiQ7JjbNDQy0idtIPYHRnEyinkOxfbPccgaela+5mOQa/X9Inz5J7UTVUMB4kAfujnlwoDpyatOU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBo/1sgmsTZHgKYp1BLRYfNYHV4+8Id3NdWuDliLbMPRWXE72h
	jX+GqIqId4EGP6fmLz1TpqCZWmcqOhitChey33lHq9I3Q6RdmxKeI++2H61w//b9BLcTG1LkaMs
	Bx1wENW/shW9nvaqpKYw/IxQ6spwnv/9vizcCtb1DYb4V1DTELxvz0/vnstYTHhIfwg==
X-Gm-Gg: ASbGncv1ReFe9gIW//va4kdQj+DsUQ+em63KqSYYMAiyR+voU9hS3xa4B4guvvO1QPf
	iYrysnratxb7qX1uSE82nps/a7kvQmXVl/4YW/TiAPe+QonFZpJ6uhqIKLL8CXl0xtjs+5iYmwO
	as+aV+YgUbFtcq3aACd2YTSj4K5CQeeDENQrgzLwinxQfYbeXnxHknefPZX+7K2xOw9I9CuxpDn
	Wysk9UgxEp0UWKjEE0wp41cCPNhdQwWJTMZBOnnSnP0Pbp7jam5NIVbnFNQpe1XRbz6nePAU2eK
	1+XSRUI+rO/05TxKhtE25vleslXbwYw3E+UhNukHjPoK6V6JcVXjaL6FPDeenaiqN0FB3/abwrT
	qCY0WdHmgFOGvfzvCSzYSg/gRISOkt2RtlP7/5dg=
X-Received: by 2002:a5d:64ee:0:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-3a3601dbd53mr18332568f8f.51.1747809401676;
        Tue, 20 May 2025 23:36:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxWlhxdDm+a+e1Yh0PAVOe6GR0EmnM/ALUPWJGHDoVigRmlf0n867uL6HDqo5jFSxoObpnpA==
X-Received: by 2002:a5d:64ee:0:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-3a3601dbd53mr18332551f8f.51.1747809401323;
        Tue, 20 May 2025 23:36:41 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca4d2ddsm18501895f8f.7.2025.05.20.23.36.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 23:36:40 -0700 (PDT)
Message-ID: <810975b2-7a6f-4c81-a827-40a6765b7d3e@redhat.com>
Date: Wed, 21 May 2025 08:36:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] vfio/type1: optimize vfio_pin_pages_remote() for large
 folios
To: lizhe.67@bytedance.com, alex.williamson@redhat.com
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, muchun.song@linux.dev,
 peterx@redhat.com
References: <20250521042507.77205-1-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250521042507.77205-1-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 21.05.25 06:25, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> When vfio_pin_pages_remote() is called with a range of addresses that
> includes large folios, the function currently performs individual
> statistics counting operations for each page. This can lead to significant
> performance overheads, especially when dealing with large ranges of pages.
> 
> This patch optimize this process by batching the statistics counting
> operations.
> 
> The performance test results for completing the 8G VFIO IOMMU DMA mapping,
> obtained through trace-cmd, are as follows. In this case, the 8G virtual
> address space has been mapped to physical memory using hugetlbfs with
> pagesize=2M.
> 
> Before this patch:
> funcgraph_entry:      # 33813.703 us |  vfio_pin_map_dma();
> 
> After this patch:
> funcgraph_entry:      # 16071.378 us |  vfio_pin_map_dma();
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> Co-developed-by: Alex Williamson <alex.williamson@redhat.com>
> Signed-off-by: Alex Williamson <alex.williamson@redhat.com>
> ---
> Changelogs:
> 
> v3->v4:
> - Use min_t() to obtain the step size, rather than min().
> - Fix some issues in commit message and title.

It's usually a good idea to wait with re submissions until the 
discussions on the previous version have ended.

-- 
Cheers,

David / dhildenb

