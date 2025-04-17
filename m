Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 294A135979
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 12:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744894583; cv=none; b=cq6KHIiuaDWJuVBwKxGjy/ZAhaLsdeDjQGjLpSwwNCyhl74+wRwfWqsumUJkkLEjxyQivM3dbNykik/fB/WhG04ZRNCFufXrx24/7OO0H5tPI+dMMwQzRr49QomQNkv2Z7yW+JEAUziCfFVXrebVWDyfL4QWIHz9sXockKWWrMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744894583; c=relaxed/simple;
	bh=g+daQNX4dTaJc60JSp8lrCqBN98a2sXsIUmhEpU1d/c=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=St852ckjHz9Jk2srakTUIe33AXgoo1c/IhvRZpH14/a19uQ0eIn9xVqoxQrC7imQ6ULCbOHeP3cGB2s1h4PsHMtQumQjiQ3QrUm3VG8w8KC7ZB771wr+c1gLA8MI9d1eyzLc+g8O1zOZ7tk8lUe3fnLMpFWsi59M7ZAJRufRn/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ronb4LvM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ronb4LvM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744894580;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=PP6r3Tc0odzOLdnN1Mh6zo2XTeq4+ZCWbhdNqWqpYfQ=;
	b=Ronb4LvMk81ikeW+CIg7+9jrxyPucAzyc5EBxkObGgRD6TdmVImB1jD3cS950U1RJzOe+Q
	ejywBgGRX0s0DSrhxr5+m/h5Ftx5/qMaqRO3nu8QhjDKuwPsFwctpJD+kXvFO21KKJyY/s
	5x44qtgKBSU0rRwi01nGbde9oDskaZc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-256-cQ2lCdl4OPm96BBdn0QkvA-1; Thu, 17 Apr 2025 08:56:18 -0400
X-MC-Unique: cQ2lCdl4OPm96BBdn0QkvA-1
X-Mimecast-MFC-AGG-ID: cQ2lCdl4OPm96BBdn0QkvA_1744894577
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3912fc9861cso242312f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 05:56:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744894577; x=1745499377;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PP6r3Tc0odzOLdnN1Mh6zo2XTeq4+ZCWbhdNqWqpYfQ=;
        b=t+KMjNrX9xctXZE66brXQV4nHcbXRLPYiWtI0Ff0u23vVYyt4X6S83kPaTAZxr552r
         uW3VRS/QYeRIwxtpOcJqapMCPdAyOy6FAvdYFdgHqXx4viEIN224VDbf+0CXPjUylIkl
         k0TB+B5PqFFdUd/2ErnoS9aXCK1k1Sb/71S7m52PA1i58IiUf61XVK584h+76aEHpRHO
         iJwuSrrt2o6TnpqsOioUWphxSXHEo1GXRL+C2py9+8nL3cvRWRkWD9cYQBjMYTBN9oiH
         ax6Je4kcopUfwLCJ3c1o0K3SmEE45ryRDMiJ42yRQsg4bDasQztJHwvVn3KMaqU3z89a
         OiTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUT99E/RNGvpG0dmlTdjwbUYZEkk9WXmZygqKQYSpKNAynMHt2KLslkOcMTGFJUcE7di55IWDY8x650Tx4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbI+CiDGoakm9f8Adl3oM0CxCOnJsNkE1v0soYvXKMfeF5Faaq
	KCegSfOCwAQadmkXZn3CWbjVilf0pEK9bWBGTpnzek20WaKoV7C6f/tOJevt8aZcWQab2M0q51e
	YDd+PN/Xglql4dyVDYPGFXYW8nRC27dfXRkqUali+GNfD1rb/8K791vFnlHdAvQ==
X-Gm-Gg: ASbGnctctd4hTKWCa/ve8L0HGLq5zM08vR2kr6wDidDTFu86XfTX60LUiDVv8eGbKpy
	vi168/JD96A3FSyQ/R86upVSC24ev2EI1np2euY3yQbSozh+D+3r1B59hTIaLvZ7vpE6u9b3dab
	Xz1tPBB98FjFgQ8eyFBpWQ0yqFxeSZJuTNlpIzu5wchgo3wG+pPocQHfi7W18XPJsved1PTVrZE
	VnpmufAerg49fEOtZScCI0xVFpH+oaCP7J+o7f+2azS24GfqRAQ3t+Z2KF50QLxKF6+Sd2zTqL/
	wQc1dGVFHJSh9/OGg8EKqszBe3LnLxYDMvzDaiWJiyYU+TZ0VPR4J4Nig/m4sVc4XOFIvOQqsZb
	1CCCTRnShQflBjSoaoHa+RfNWkpI3UpCjJGwdjeM=
X-Received: by 2002:a05:6000:22ca:b0:391:4999:778b with SMTP id ffacd0b85a97d-39ee5b37b2dmr5018839f8f.28.1744894577323;
        Thu, 17 Apr 2025 05:56:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFhcDh+lOBj95mWyR4xq7n9fZ9ItU2YUKtea/qun2d7Jab+8iRIylTGcc/lV2a/wDdAT6UsCA==
X-Received: by 2002:a05:6000:22ca:b0:391:4999:778b with SMTP id ffacd0b85a97d-39ee5b37b2dmr5018824f8f.28.1744894577007;
        Thu, 17 Apr 2025 05:56:17 -0700 (PDT)
Received: from ?IPV6:2003:cb:c706:2700:abf9:4eac:588c:adab? (p200300cbc7062700abf94eac588cadab.dip0.t-ipconnect.de. [2003:cb:c706:2700:abf9:4eac:588c:adab])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43ce30sm20586336f8f.62.2025.04.17.05.56.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 05:56:16 -0700 (PDT)
Message-ID: <a825b3c3-55f7-4d90-a318-e20acf55e0cd@redhat.com>
Date: Thu, 17 Apr 2025 14:56:15 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] mm/rmap: add CONFIG_MM_ID guard for
 folio_test_large_maybe_mapped_shared()
To: Lance Yang <ioworker0@gmail.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Mingzhe Yang <mingzhe.yang@ly.com>
References: <20250417124908.58543-1-ioworker0@gmail.com>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250417124908.58543-1-ioworker0@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 17.04.25 14:49, Lance Yang wrote:
> Add a compile-time check to make sure folio_test_large_maybe_mapped_shared()
> is only used with CONFIG_MM_ID enabled, as it directly accesses the _mm_ids
> field that only works under CONFIG_MM_ID.
> 
> Suggested-by: David Hildenbrand <david@redhat.com>
> Signed-off-by: Mingzhe Yang <mingzhe.yang@ly.com>

^ should that be here?

> Signed-off-by: Lance Yang <ioworker0@gmail.com>
> ---
>   include/linux/page-flags.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index d3909cb1e576..6bd9b9043976 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -1232,6 +1232,8 @@ static inline int folio_has_private(const struct folio *folio)
>   
>   static inline bool folio_test_large_maybe_mapped_shared(const struct folio *folio)
>   {
> +	/* This function should never be called without CONFIG_MM_ID enabled. */
> +	BUILD_BUG_ON(!IS_ENABLED(CONFIG_MM_ID));
>   	return test_bit(FOLIO_MM_IDS_SHARED_BITNUM, &folio->_mm_ids);
>   }
>   #undef PF_ANY

That should work. I can throw this into a cross-compile setup later if I 
get to it.

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

