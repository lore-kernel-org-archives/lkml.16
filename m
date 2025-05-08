Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D957235280
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:43:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726231; cv=none; b=dcIzQm6XlCQ0c0sb8Dfs6+1gANtVDl43fTG74reTZNw5tYGStOvnA5s6gs7TPJadOFu5t1fyQbmApHYoE1VUkacfmQ03HWQXbo2O9tgTBZFP9kP+8kCdWDcwR4xCLfwGmtvi56aeDavP/eVe2M70vBh+W4DuNExCUUEwFXUli78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726231; c=relaxed/simple;
	bh=gkjSloVfY9HeulMP88DtH0bm82k74GTtJn3uQzdYKf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BfpEGAYIfktAp8RK8LLrPqOF5Q5fB7b1X2WtRSv6p2MxrbJsERCHdEHJQ1BkFGqWxThe8S5RtHREXJIBI/UubI4lUA+pIdClHyNR+8W+E1ayoLGLm9YjZpZsmWCwTcNZUsxoorIHfIrvpGX5KNORkHN323QsvfIPUjlM5A3lqM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BdeFdGmF; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BdeFdGmF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746726228;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BNCge5EwA1ATUO1cxrILyZxUoFm5yzyzMqWXHVwUmW8=;
	b=BdeFdGmFt4bnhnQGHnWyN+JzoQhOIqi/pvcBC69eV7IsADycE5oE/Vk9Sk9V2v0MeTiayN
	bOnfHzOo5Zgr0lGKrMC/3eLfqnmZ5FW9FNOjZ2/XHiw6cHDxKRKFjkuJLQG3haVDjXgl0X
	WGxpcLrhvasUbCLVwqE4BV6dcFIft2g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-Hz9p-jErPPuah_oT4jcCzw-1; Thu, 08 May 2025 13:43:47 -0400
X-MC-Unique: Hz9p-jErPPuah_oT4jcCzw-1
X-Mimecast-MFC-AGG-ID: Hz9p-jErPPuah_oT4jcCzw_1746726226
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so7339395e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726226; x=1747331026;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BNCge5EwA1ATUO1cxrILyZxUoFm5yzyzMqWXHVwUmW8=;
        b=cmiJk9B8+PEgZOr+Rw6DQd1SsTP0UmjuLjsvmR8dHYvMqBhKdWKZ8iCRMvERJ6feee
         YciiGirQu5K67DmOiRbB76E1xbUYHsDFYdW1weVdN8+WjYjNbJyhWiNNH1irSTlAHdlL
         yhLOQ/bR/ZF6LNuQcrX5b/tTVbTN5qTFS1CH5lkzjNERrkBVqeuOUmKXc7pDUX02XV9B
         WRhrfK5aj07QXhydcFifFK2h6/iPnFxyb4Umm73GFHT4X9vW8wnYfQj5GToXSb15Ibpu
         or7RdlwCrHezN1RlknmqZFBLAZg6O7k17qyoxqAZtMkYqqZ3mJ63k67vi6Hz3k1XCmZe
         vKOw==
X-Forwarded-Encrypted: i=1; AJvYcCWia/Sj3+Q0y8+RePKdf7pF4mguQCT5ImxtGhdEEAihormLuwnhhORSpDuQr3yvDPAwI5lmF2FC9DuJYzs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBQIAng8UpLH7tfWL0eRtlkx2JofMBYnRk0M+5EftykJeMIT4J
	xLZ/GXan0n3rif2wPtimONXG1eunNrVKkA7q5fKXmxRhpkLJih//hNV53cos2cQ12xByTQByVi2
	+bns0jPbXYpu6hc2JJXryEdFmMOrFe89zE0+d4eIiwNexxNiCZiitss65S5vuyA==
X-Gm-Gg: ASbGncvnDU+FsD9FJPgmbrMbE1CeM72BgBza9limyx5dWm3RUnGwexDRh0iJKHVpOe6
	yjgqJ+eP+osnlFkV6YC+sVatw3FeMwtqn1KNpFeZ/hWqlqLqtZTzX25Ouonnsmn2kODIwn2soKI
	14En4PVL9ZEEoA6Xu/K/7BgBBFu6RZvcmzr2FdgomQY4RhfbePQZdU/+gB/o/9YJp5lVuPD99zN
	Rp1qUnICgcSMyb3J1uSL/vJEn8kikBAgQj0xMQ3bwXLoht9TN3guKhBmUzmQ3h4RkLniySBh4I2
	m6kI+AJUKcCvtXZdP3dhqq9k99LuSGT3tQTSy+fNBxtY28Ll23Zsb6tteXXZ6kytjN0k+PvRLb9
	CRetx2ke1iCkHP58yV9PqQOeF7NicYTSLvi14IKY=
X-Received: by 2002:a05:600c:528b:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-442d6dd1e0emr1231865e9.20.1746726226310;
        Thu, 08 May 2025 10:43:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGX61wjABh/8cN12YmRXIy/mOtEXtto0lI+pQxnrz5Ac6iZYPrMmVvKoGbkMLaX0Jj+mK5lYw==
X-Received: by 2002:a05:600c:528b:b0:43d:2230:303b with SMTP id 5b1f17b1804b1-442d6dd1e0emr1231645e9.20.1746726225939;
        Thu, 08 May 2025 10:43:45 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d687bdcbsm2015825e9.40.2025.05.08.10.43.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:43:45 -0700 (PDT)
Message-ID: <0faa6c1f-26a5-4d96-8bd7-bfd344a80ff8@redhat.com>
Date: Thu, 8 May 2025 19:43:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add mm GUP section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 Andrew Morton <akpm@linux-foundation.org>, Jason Gunthorpe <jgg@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Vlastimil Babka <vbabka@suse.cz>
References: <20250506173601.97562-1-lorenzo.stoakes@oracle.com>
 <20250506162113.f8fa0c00e76722a1789ec56a@linux-foundation.org>
 <c4258dfd-14ee-411a-9fa7-c4a1fa4fad1c@redhat.com> <aBshiBX_N6hhExmS@pc636>
 <13a32f52-dc5c-45ef-b45a-585586868509@lucifer.local>
 <e3e2663b-2749-44c7-8452-ffcbf2167572@redhat.com>
 <28428030-1178-469a-a4ab-f1e7179d9106@lucifer.local>
 <6050270f-1556-4df3-beab-63e907b28d82@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <6050270f-1556-4df3-beab-63e907b28d82@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 18:03, Lorenzo Stoakes wrote:
> I feel we should probably add mm/oom_kill.c, include/linux/mman.h,
> mm/internal.h to mm core as a few more key files. What do you think?

The latte two likely yes.

Hmm, one could argue that oom_kill might be memory reclaim related.

Fortunately, that code is not too complicated ...

> 
> We're probably going to be working through a bunch of stragglers for some
> time I feel :)

Yeah, there are many files ...

-- 
Cheers,

David / dhildenb

