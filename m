Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E46224AEB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387115; cv=none; b=EjwbL/b+nTRGqwHZg7RripyrUbn6IBLZ7VpVGU5DUWdEqWjxg8YzIc6qbK+8zQPZ3+FpMCqAo+qkLPmDBfCcPsz2eRaB8DUc+8c0Z2cfrelUq5L/d0eMpaeB7+jC6HAGFiualkKcEbCCSYSZacPHZHEQG5TkM0Czp3GJCWBklYk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387115; c=relaxed/simple;
	bh=Hj7gtvvI+cFuSNKb/xgFIhAwZ9vdyxvWov2g1MS7JQA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GGLiuQaBrCzSqv9zUqxmzcv3rp0OByRcaJXPpV5vEK5UYf6L5ifrWtGpjY414QSbYqEZs4LnP7qgbNjQaygK5euluU2KToUVKYbzDrZspg81dtXVnyUQunJcuaXAXbzpnGgZ80vApaxpvG1whTqZFgcGs+EcDdVJgs2SaEXgRXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TjpcEnh2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TjpcEnh2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747387112;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BnyL+8xhsHOx/hwMbuje6f9Jmtf+N+7ay81zs9ZK45E=;
	b=TjpcEnh2MX69AMkuaVuufzD1xxn+JTQL3ECjXTedu+Bc+55OxuN0XmcHUQCYioFlxIaR5r
	zen1rNEbJcwdCK5hTB+GnSSqQEeYmYgco/4rv3+yh/CHIOKWpgwE18BQNMEdSraVm+SzuH
	6uTZ8bhhBFXLUw1fYOi7LTvFye8BC7Q=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-144-Gk8Xr-19N3mt8urGzIIYSA-1; Fri, 16 May 2025 05:18:31 -0400
X-MC-Unique: Gk8Xr-19N3mt8urGzIIYSA-1
X-Mimecast-MFC-AGG-ID: Gk8Xr-19N3mt8urGzIIYSA_1747387110
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3a34f19c977so915806f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747387110; x=1747991910;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BnyL+8xhsHOx/hwMbuje6f9Jmtf+N+7ay81zs9ZK45E=;
        b=D06VF/cHkRg/t48xyMok7Ss4s+5cxd0JoxGqSzpjXam1ShcESL6i9Vish/KDFaQgtG
         k1epBDXIxOMd1wIQeG9W5gPyndMWwHjRAQUxOX5uUEBq8eLkEguyJCyjAlyTR62rG+VF
         ilf0Jr4SDav6P2ZYmoesUOoReUy78BtkmO/qn2SZj0dOqwJvXtTthW6avgRBDraL7SIu
         B7ganSAfYUvHE9v78yidm2GyW/lTliyB1kUrB9s7q2qzEj6BpTgjcgKcQ4vUB/57AZCH
         yKxmQSodjzQNO+h+R7zt2fHcBENZnWbe4r+mu3PeIYpGI64Ac6dhQNV0Wu6tYJQIupfN
         Te/w==
X-Forwarded-Encrypted: i=1; AJvYcCUxqPGCFFEMX3skXYMk6KH4SUDL825HJNkxbhKfsfAx9+iylQBiEzk6oIGLh77IF19ugrenfCMiXzJOXuw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyspEeJQil7fXOyplsnXzrayoIfPTdXeNKn+VBqcFzi8CZ1DwRj
	hVXz405Uo0TnIukgK4o2wGEpQg2cWA1CjNgpN4fmslkb9uLiZUnqjJ7WrCN4uR4skzES6gX5xip
	YAmRw7C2jVyw2WUE+rK5QCE0X6iasi2cnh85tAhNGD54e9bKCOs4VBhPOdFkLfdqH2A==
X-Gm-Gg: ASbGnctboGuFLDotUr6805VWYzeBcvmqqoTz9Tfo7uhUJ/3dip73KSIK6Yp/gX2eGsI
	BzbWuRHEKERobZKyBJDB2zoblFxEzrmjyjvV9KLVRkKryqX/wwVou5lI1AV6sinvk7qp8n/uoVA
	pG4E4ypvfI6y8rEGJOgw3JZoOBabR3zfZvzItUs2IOxYeF0ZKLXXO0dvRb/eKRApfOKSJhueL6E
	UquAqCYSt6iG/VhzcMqKAADXvrYL3e8b3xxOaSR1tC0kIUOwwJkuHBRj7NKU2ZSEkH/7iHYL8IC
	NCveEdxXzvD3aJGxEh0EaRmL0g9pF/tLwc9lcMEMrgIuIxq/vscwtCenr9vpRYVgRn+blhskyaI
	Gy6v9q19JKyXW9W8zbTFDcLbizm/KeNZLl0k87g4=
X-Received: by 2002:a05:6000:22c5:b0:3a3:42cd:3701 with SMTP id ffacd0b85a97d-3a35121006dmr6177666f8f.23.1747387109441;
        Fri, 16 May 2025 02:18:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEKgMzwSlMBVhcC/FPwYFo4rG2hT+TNdLoFs9mvpWOK1Lt/3LuMG8CN5jCXDf6HMpWA8XXtvA==
X-Received: by 2002:a05:6000:22c5:b0:3a3:42cd:3701 with SMTP id ffacd0b85a97d-3a35121006dmr6177579f8f.23.1747387108032;
        Fri, 16 May 2025 02:18:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442fd4fdbfcsm26451055e9.3.2025.05.16.02.18.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:18:27 -0700 (PDT)
Message-ID: <f23e8df8-5836-4ffb-83ef-d19c7c04947f@redhat.com>
Date: Fri, 16 May 2025 11:18:26 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] Remove register_memory_blocks_under_node()
 function call from register_one_node
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <e0ef6ae9348f46bcc135f0e6cb7663d763e40b72.1747376551.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 16.05.25 10:19, Donet Tom wrote:
> register_one_node() is now only called via cpu_up() → __try_online_node()
> during CPU hotplug operations to online a node. At this stage, the node has
> not yet had any memory added. As a result, there are no memory blocks to
> walk or register, so calling register_memory_blocks_under_node() is
> unnecessary. Therefore, the call to register_memory_blocks_under_node()
> has been removed from register_one_node().

It might help to throw in some empty lines to make this easier to read.

Patch subject should start with something like

"node:" or "mm:"

> 
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---
> v3->v4
> 
> Addressed Mike's comment by dropping the call to
> register_memory_blocks_under_node() from register_one_node()
> 
> v3 - https://lore.kernel.org/all/b49ed289096643ff5b5fbedcf1d1c1be42845a74.1746250339.git.donettom@linux.ibm.com/
> v2 - https://lore.kernel.org/all/fbe1e0c7d91bf3fa9a64ff5d84b53ded1d0d5ac7.1745852397.git.donettom@linux.ibm.com/
> v1 - https://lore.kernel.org/all/50142a29010463f436dc5c4feb540e5de3bb09df.1744175097.git.donettom@linux.ibm.com/
> ---
>   include/linux/node.h | 6 ------
>   1 file changed, 6 deletions(-)
> 
> diff --git a/include/linux/node.h b/include/linux/node.h
> index 806e62638cbe..8b8f96ca5b06 100644
> --- a/include/linux/node.h
> +++ b/include/linux/node.h
> @@ -137,15 +137,9 @@ static inline int register_one_node(int nid)
>   	int error = 0;
>   
>   	if (node_online(nid)) {
> -		struct pglist_data *pgdat = NODE_DATA(nid);
> -		unsigned long start_pfn = pgdat->node_start_pfn;
> -		unsigned long end_pfn = start_pfn + pgdat->node_spanned_pages;
> -
>   		error = __register_one_node(nid);
>   		if (error)
>   			return error;
> -		register_memory_blocks_under_node(nid, start_pfn, end_pfn,
> -						  MEMINIT_EARLY);
>   	}

Can be further simplified

if (node_online(nid))
	error = __register_one_node(nid);
return error;

>   
>   	return error;


-- 
Cheers,

David / dhildenb

