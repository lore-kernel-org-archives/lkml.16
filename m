Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D9E2F547E
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751619474; cv=none; b=msw53SnyA0dlWTJMaVMQUdU+t0LPJDF/rqoG1xAfi7UeuXycWSoR13ZLdYMSyz6TtlUdCDnJdAaUx8K4gaN6ft9P5aGgekIa628G61otf95oltVDWQbtYXMSDOhV0bKWhNXViwIPHoETOh5ep8R3prIlkKMFwjdII/OhP18CPlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751619474; c=relaxed/simple;
	bh=ggInmIOr7WKEN0+YNThAR8U4Q5TJCasopXzArJGvOFE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LgHGpJc8mZ4zSNtVVqoEz9iFGIttpXynS8KXsJsFGztwaLxhiG3AYER/E7Biv0jTFGejOFGh592UqCTM9bqAXgnDtZakdH7//iUK3TNRVYytvbCKQjRML67HLFmXEQNyg448o2/oPOHrfADm0wM00Z1ryUq+8fSZC3Gul2hIfcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hju2KAR0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hju2KAR0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751619471;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=mVyrAhiOnPT8DybQln1iSMYW0QSR+P4ZCW/jBPEH7PI=;
	b=Hju2KAR0+Qc8G3DJ7u/r1hoXB0HeXp7s0ynFjMqvgTdjVC5CLhXpG3LA7qP2pXPR5r1p1n
	mIqzxKJxKnetdLUBLsyKsFHc77pvQ0dvZyZPpYPhnLshw141YomwQgmL0br+7sTuNNj7tZ
	4m+bxkSWJLNX0Z95frF/7R83VBtLBYk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-aSX2EkydP-afl9fzIg6Pqw-1; Fri, 04 Jul 2025 04:46:21 -0400
X-MC-Unique: aSX2EkydP-afl9fzIg6Pqw-1
X-Mimecast-MFC-AGG-ID: aSX2EkydP-afl9fzIg6Pqw_1751618781
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-453817323afso3704015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:46:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618780; x=1752223580;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mVyrAhiOnPT8DybQln1iSMYW0QSR+P4ZCW/jBPEH7PI=;
        b=tNCi3UdQxYyTj1A2gH78Cn8g/WUxnjAVVKxTeqKO7+2dhKZbvyZGAnlFFj52i8sMa4
         unkFwu/W8GvjqHQ/6RBi8znCS2i7imP1H5Sbra+17aQQejdd6msp+mirgJrtdE/8ac+U
         xTLL1RwzeeCec0e/X91IgACeUozpUksonORiInu+F6cTei1fy0N18Sa+5jyH3SWDN1eu
         EFCzqHu25u/huV+X8D8Wq3qIcd5zw0UaK+F24mLpOLFWYpqkrR4qfs+gpBBpsZMdeENl
         PhEMNm9lgYvXnFXd+zkGCghneMO5E/QtAVGsf1vudRC4aA20u9sB80tWjN7i8A96Wat7
         qt/A==
X-Forwarded-Encrypted: i=1; AJvYcCVXqXcz0lM5nKPOHVZsbRp2osBmXhG4gTM/+VD5K0dpvzaCe34+ZEWPFl595bhXqp6/CRs5cnn7OaEhOlc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVUbKqu9b5Fy4e6mgCWCzJaoyDkFcGxYrNGYDKH9zax1ZJ86uZ
	dvJaaOjqGaucBDm+CLr4TXjIpbMeuE2TZQMHB4g48mcPl2IKJ5PHpeTusLAxcNOCh7I+E4UpIg+
	3fGLXd7hcqqFLQOg2667598pzzoj/c0/xRxlfwzX71eIK7L/Jy/lKXKX/OF6RlLWezA==
X-Gm-Gg: ASbGncsdqLBQDAXcUfeaEV0hGHTpAT2cWTBZHcDT6mO8GzpoWEd+EUsPxJO8bGYQfNY
	DLXmmvUoH5iOAut80/9D6rDsd3tXY6P7ke/hspqZkf7mi1c75cYT/2jM4qmtsNp05RVrr6dtBWj
	8brO4atn8nY8hIUbNGEz+yXxT7yuxyeOE1XKa8Qyy4cX+DPO6M/RBayTnoQoyy5FdoIKo5t+hHm
	zRXdETWvtWkezWpn3U6MmBnGqsdTBH/tl+Alxj05dsLHcugPOQgR/90T3Llns4oRUxf8sF1eKJ6
	8YWGfPvUDWK/aAimuMT0gfiHiGAkVtqFIpeD5ma3C3gpu33Ac3KCzuPQ7J1Z9TSvFon/Eo4VFGh
	BnwksjBMeJ6wL+BSLM5vPP3KdGzSiFb80M6W0g1cHwOpMs7c=
X-Received: by 2002:a05:600c:4711:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-454b3108982mr14259425e9.1.1751618780378;
        Fri, 04 Jul 2025 01:46:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHaUV8FC+Py3RIAFTeLzepgFWje3L0XmJO5Yhj+dy4UyFtkI7upnmtWvFcBPMBDMfvgNn2l6w==
X-Received: by 2002:a05:600c:4711:b0:450:cfcb:5c9b with SMTP id 5b1f17b1804b1-454b3108982mr14259055e9.1.1751618779935;
        Fri, 04 Jul 2025 01:46:19 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b471b97353sm1929683f8f.51.2025.07.04.01.46.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:46:19 -0700 (PDT)
Message-ID: <10a7ced9-33f2-47a0-b368-a6fecad6a842@redhat.com>
Date: Fri, 4 Jul 2025 10:46:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] vfio/type1: introduce a new member has_rsvd for
 struct vfio_dma
To: lizhe.67@bytedance.com, alex.williamson@redhat.com,
 akpm@linux-foundation.org, peterx@redhat.com, jgg@ziepe.ca
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
References: <20250704062602.33500-1-lizhe.67@bytedance.com>
 <20250704062602.33500-5-lizhe.67@bytedance.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250704062602.33500-5-lizhe.67@bytedance.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.07.25 08:26, lizhe.67@bytedance.com wrote:
> From: Li Zhe <lizhe.67@bytedance.com>
> 
> Introduce a new member has_rsvd for struct vfio_dma. This member is
> used to indicate whether there are any reserved or invalid pfns in
> the region represented by this vfio_dma. If it is true, it indicates
> that there is at least one pfn in this region that is either reserved
> or invalid.
> 
> Signed-off-by: Li Zhe <lizhe.67@bytedance.com>
> ---
>   drivers/vfio/vfio_iommu_type1.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/vfio/vfio_iommu_type1.c b/drivers/vfio/vfio_iommu_type1.c
> index b770eb1c4e07..13c5667d431c 100644
> --- a/drivers/vfio/vfio_iommu_type1.c
> +++ b/drivers/vfio/vfio_iommu_type1.c
> @@ -92,6 +92,7 @@ struct vfio_dma {
>   	bool			iommu_mapped;
>   	bool			lock_cap;	/* capable(CAP_IPC_LOCK) */
>   	bool			vaddr_invalid;
> +	bool			has_rsvd;	/* has 1 or more rsvd pfns */
>   	struct task_struct	*task;
>   	struct rb_root		pfn_list;	/* Ex-user pinned pfn list */
>   	unsigned long		*bitmap;
> @@ -774,6 +775,7 @@ static long vfio_pin_pages_remote(struct vfio_dma *dma, unsigned long vaddr,
>   	}
>   
>   out:
> +	dma->has_rsvd |= rsvd;
>   	ret = vfio_lock_acct(dma, lock_acct, false);
>   
>   unpin_out:

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

