Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21B1C38FA3
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 13:06:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748264808; cv=none; b=MGwz9rrNuTRqEelLCyZyGOJdixQo+I63vGldeVv5Mm6D1xk+kBW6qJfPX0RVJIhsE1WYMN5bJgHNAMnlCbyF3HttR03EZ2yKYGfunvUuPBi/SkMNFbrd6Ehxf18v+iTRm+RUItT9BrhpZcn9dOVBNETuDyAE3oJxtKe9kErfN5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748264808; c=relaxed/simple;
	bh=fl/3HSxOloVDnMDXiMAWDKJOIF/LRNklzwl1WS7cmqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mADOz044vm10OZfTUsdGWJfpdq2JnsTZXbij7pFi1w5TifUWcL/Nc4LPALEPm0x+Fd4yXRQr2V3y2KRYElvBdhP2M7o/lt1gl5h9DNgwz+3xeZy14ul/HO5O2gzyKQMB+jm3XY8FcMU+F5ntIGmxoll17czGJZGc5ASBib6Kewc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RUE+2T0z; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RUE+2T0z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748264805;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gEoAcTzfoYtTGdUalDuOOM38+Vl63Gv24cVZvypCrUM=;
	b=RUE+2T0zY3e0q9oHN2DvPZYkodtr5ySBMJ03+394KsoCKwPfevdQi2aKexsO+8TDEn9JAo
	wUmJ7N2KiVEqd5bEAGTamrsWtISViPi+MMyrompM/mruqPkQDvDc0BC1D6mcmBtSCmoNkH
	Vm81h3EPQXwPIlU+73/BT8tfaLadZfI=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-653-8LG46Gm4NkKEZQ-6ZzDiKA-1; Mon, 26 May 2025 09:06:44 -0400
X-MC-Unique: 8LG46Gm4NkKEZQ-6ZzDiKA-1
X-Mimecast-MFC-AGG-ID: 8LG46Gm4NkKEZQ-6ZzDiKA_1748264803
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf44b66f7so13120655e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 06:06:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748264803; x=1748869603;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gEoAcTzfoYtTGdUalDuOOM38+Vl63Gv24cVZvypCrUM=;
        b=lX5JDqtNa2rWDFGXK27y8hArOcuPJYDPuMSdXVlIBqDJuSdb7v+MDrC7A7zHE/b+Zw
         NyvKWVbBtpUMVONlst/KedPkvdI2OaoHMCXR+dP+xEuG/GYzj4D3bsVFssZjU0UkcCvN
         rYliLUUEJWwj2Gt/R85vwe8ugOtzjUpq/aES7JIZUV21TGf07+6ASbbxVzsbOo5FjPKn
         X9S2pQKBO2kbIgyilGtLVQLADkv1zDfiKYlTUwwzTkurZz4N6hJiBH0+J6ve8ogn7TjK
         nhzoLiAKnf+RyoY4yedRq67Nd3+ax5njN1XKzgciGtZaY6AYf+fnZTKAn6dsDLLimzVt
         /Fdg==
X-Forwarded-Encrypted: i=1; AJvYcCWpaGkFQ1ebO9lnjH+2cXWKS2IR5JQYdk5HctlZIJ36e3Q+8o68xcmqUiQCV0TwugMrD0Ode8MoqOU35QQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGXZc4nyqMvfeXBAzORtgTQs2aSW4i59qMy9SvegN/khMYzBwr
	lJzT3ZtKYpdwYnO9s/RBQohcxYd4bHLUXMsVKe70ARUoZibqq1pwxOP5gsJKvTE994ot9uwm6Rf
	mr3XkqUk+18csiHWjfSGPGy2f/vb4SuGmxHxoVRxfLOEaTeffTbfJdnQN5K8SMAsP7Q==
X-Gm-Gg: ASbGnctdYF1ZHyGNBcZnHWpaOI9pMiAQ6GQNkTR6K07AcScRhD7SXCmSSjTSyXXmfT3
	PgEfseH+36SLTi0kDgc+LnT1rA776ZyQGATElxGZY45+FkbZ8BT49TpfehmMpMRgBmW42j88paR
	MJ2CCUR7Fx6gcV97OCI5vpcXkhkC4E4CqU01VVUXmanJXFhxIb+osoGzdYlDtLmE9Ytv7V+Oot5
	4X/WHuaWbuqXBQRiWu3/xjDRw2bBHzdltgj7/7oLryq7nmw5virTtY4vwxBC9WiILmwd9loePNV
	FrhGpZPLq4U/lO3uKcvmXVV2gjHsu7sbTmP81pEDNfsOlPAzKiBITegKb2RWomb8OE/cHSb1Fiu
	v/Tc98ktO0hm44HfZMkoARtn5Rfq6vbq4vicoymM=
X-Received: by 2002:a5d:4391:0:b0:3a4:cefe:4198 with SMTP id ffacd0b85a97d-3a4cefe4de6mr4885722f8f.16.1748264803429;
        Mon, 26 May 2025 06:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG1X5dnjb11t6oQQLt1Ba2R0h9ivKQISJvAdEdq9pE/ndxAMcPkJ9waPMNtHXgfQ2TCJCdmqw==
X-Received: by 2002:a5d:4391:0:b0:3a4:cefe:4198 with SMTP id ffacd0b85a97d-3a4cefe4de6mr4885688f8f.16.1748264802992;
        Mon, 26 May 2025 06:06:42 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f19:6500:e1c1:8216:4c25:efe4? (p200300d82f196500e1c182164c25efe4.dip0.t-ipconnect.de. [2003:d8:2f19:6500:e1c1:8216:4c25:efe4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888fcsm36610916f8f.78.2025.05.26.06.06.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 06:06:42 -0700 (PDT)
Message-ID: <d5d19df8-c774-4c78-82ca-e0839ed0e539@redhat.com>
Date: Mon, 26 May 2025 15:06:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: remove redundant folio_test_hugetlb
To: Oscar Salvador <osalvador@suse.de>
Cc: yangge1116@126.com, akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, 21cnbao@gmail.com,
 baolin.wang@linux.alibaba.com, muchun.song@linux.dev, liuzixing@hygon.cn
References: <1747987559-23082-1-git-send-email-yangge1116@126.com>
 <427043ca-ae91-4386-8ffd-aaf164773226@redhat.com>
 <347b3035-26fe-43af-8df4-b1610d305908@redhat.com>
 <aDRnE8B27VgCoJ3N@localhost.localdomain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <aDRnE8B27VgCoJ3N@localhost.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.05.25 15:05, Oscar Salvador wrote:
> On Mon, May 26, 2025 at 02:23:58PM +0200, David Hildenbrand wrote:
>> Already in 6.15, gah.
>>
>> Please convert that code to never ever take any hugeglb locks unless we are
>> clearly dealing with a hugetlb folios.
> 
> I guess we could just do?

Yes, anything that involves hugetlb only id there is an indication of 
... hugetlb :)

-- 
Cheers,

David / dhildenb

