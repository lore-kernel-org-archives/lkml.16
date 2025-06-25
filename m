Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798E2066CF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 10:01:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845688; cv=none; b=VmM7wDb0fcxtbJL399loclmLNY3+Hd5cl//MEfBBcSCXAM0U5V8hrJ/rKj5bSqxQVPQ+TCuqNohRR3mxa2C1Z9H0fRVJpnNvy1NYjiwvmNodEmGP221L6eMUtp2TH6srhCbaKWlQ3I5ZYl8q7k5sypxhv/Tu9K5DVj/OhNn7rz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845688; c=relaxed/simple;
	bh=s40SH9bA1OiU5hztfwr9FRfHvhOUqV96CnHrHLwNXdk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/9DMr5cVzXOboWUFkMQCxDBxGjo2Izc93373FzxnypxcJAEXfXwzEwJOM6eUwQu5QuPQpoCmkfNWev7QTUpFjVUkVHmRrnP75zMbtAhIO0ImmKsLGKEJNfEKVUbqF8c7s0U5JPrkfocNbr8sLA67EhIch7AAZcUTapp7KDfWIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hGGuI2cv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hGGuI2cv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750845685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=paASY6fMqsbxlJxIzLxntU9K9UXAAecw8gkfp5f0f5c=;
	b=hGGuI2cv304hO5CE5ba13x1EsrdIMVMFjfANLE2SlutSu0ORknrNIWYuWOtoCMfzA8DBFS
	n3CkZ6W2dfTG5HArw20sUXYMsgitwn0/X8V9hFVYYVAMJFHUq3wjOz/WwLbcHvTzVPz313
	hPbz2C9XyCqqfyTcnFv1J5tn6ohcEa0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-u-uunQu3ML-9-rbd9-LlGQ-1; Wed, 25 Jun 2025 06:01:23 -0400
X-MC-Unique: u-uunQu3ML-9-rbd9-LlGQ-1
X-Mimecast-MFC-AGG-ID: u-uunQu3ML-9-rbd9-LlGQ_1750845682
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-453817323afso4800655e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 03:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845682; x=1751450482;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=paASY6fMqsbxlJxIzLxntU9K9UXAAecw8gkfp5f0f5c=;
        b=hKMjX0wR4F++yKPD/EK1DBmt9g/Hp6+AKRSwC+vBBt4DNniKLbWWWqWSk1jzUFdbh/
         7k3DbBTCxZPFkZFb+uVYGD5Agl4EMibCNfAlLnwBBfRDJmq1a0SC4jveeRtJLYDzL2gf
         U1teQrJvI5wBEndgePcYCz5uSwb83v5eyn3VwZKNYs7AZtTnB+UvTkDk7vw/vdFmfwzH
         2oDIE03RF1kBj5yksJdqP2DD/4PH+TRMeGlyhfIII14kSwxMF2H2wwEcn5BEz1smcHHh
         YENYlSBOwcD057OcgGaakE5ClhmTGWMBjQDnN0gLB3wA8XVuF2hnsVJXBGbbkGNb9wRU
         jRFg==
X-Forwarded-Encrypted: i=1; AJvYcCWlJs2hVxlWF3hk9DMjJ0MbdjbU3q+feFDLoh3YkwC1u6yxLeV2N5/j15YH1bJISz0epUdeGHP8qtokRKU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjZhaa+zLremRJynBKcmgTOrZEjARs781jxc7ES12CS+Znpz6
	yi4p0ybuC9gh1oonEHXV4s61MoizZZyiGzyBiFc25YlW+OicyemfxPV/qyViLCydd/cpham7rMC
	fmcwfcAj95+3/zdLK48W2NfjgheIOY/rAligqFDzepam3TrjR37UlfFaMbaxWH21M5A==
X-Gm-Gg: ASbGncv9A5avyrOapD5Eq+kFKyd66EWbFjcNERtOevDTfZNQ8XGF0EJzamqcGTUB146
	yOU7vrhadK2GZdjRKjVSF0PDmh0Ptn5FaPMcdUjCF6fOsSlwqMrhRnSXMtmI1TpSawT4oN9aK7n
	saOD/G/pFyySz2ObGvueZDMKUadqZYMrK3oiZxfpiNSb5YmxfaHHU02w0RBkq2Z63vIZqzHJu1Y
	Zkwo8MFOl9FUISFOQfvF3A0zdBV2EPE2jdnNtA8tO3tgzvct4Lg0BpxbeD/+Xr/6N1MXskQcMnJ
	VsZ8BTHLhvU/WKna/dSFTJQ1yGnyhnpoEvUOt17lAnmh68fmSq3tO47q5mOQExg6kikEaHL32mF
	FXW5Uf0FXKhE8nxkHHJZZ4pKvl7WN63jHJICT923rPqvT
X-Received: by 2002:a05:600c:8b58:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-45381ac23aemr23940475e9.10.1750845682335;
        Wed, 25 Jun 2025 03:01:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEolcg9V6KONRqCXVztJ5m5w2/C7RDhrxdlCtLFMGk99cpdmCVkLjWlOVLQxCwe6cHDonblnw==
X-Received: by 2002:a05:600c:8b58:b0:440:9b1a:cd78 with SMTP id 5b1f17b1804b1-45381ac23aemr23940035e9.10.1750845681818;
        Wed, 25 Jun 2025 03:01:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e806916esm4168796f8f.43.2025.06.25.03.01.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 03:01:20 -0700 (PDT)
Message-ID: <0cb6053f-d8bb-4b61-b84f-fd727759d4fe@redhat.com>
Date: Wed, 25 Jun 2025 12:01:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add myself as THP co-maintainer
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Nico Pache
 <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250625095231.42874-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 11:52, Lorenzo Stoakes wrote:
> I am doing a great deal of review and getting ever more involved in THP
> with intent to do more so in future also, so add myself as co-maintainer to
> help David with workload.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
>   MAINTAINERS | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4b9a4fa905e1..a8a963e530a4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15945,9 +15945,9 @@ F:	mm/swapfile.c
>   MEMORY MANAGEMENT - THP (TRANSPARENT HUGE PAGE)
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	David Hildenbrand <david@redhat.com>
> +M:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>   R:	Zi Yan <ziy@nvidia.com>
>   R:	Baolin Wang <baolin.wang@linux.alibaba.com>
> -R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>   R:	Liam R. Howlett <Liam.Howlett@oracle.com>
>   R:	Nico Pache <npache@redhat.com>
>   R:	Ryan Roberts <ryan.roberts@arm.com>
> --

Thanks!

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

