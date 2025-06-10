Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A7521D5B3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541882; cv=none; b=k+B9Y0fHQoZ7Vyv+vDyfwliNfHWFCMdcMqQufmtaTDjR7ciUmSXEC4n7gQaXSzboDHavsT9gS76ilkJ0eiCRPoYnQjL86yMu3oMlLnp/F1/bqguVsVRSs4nNIjzXtO/VKalzhLfqLJIrk9MHNnToPP1rSU+tvivr/5fPB47j1KY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541882; c=relaxed/simple;
	bh=5CcdawXOlRBvtQS59YmgSxz/+3yoWp/zdvR/ZD2vZhg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mDosW2te6p8CLWLaS8kBmMR32B61pGiwU05odsP3vkEVspEGjOgiZ7Z4h1FQMx6+CLDMuA9hwHwFThzL1Xis5LFEgCOJMFscZIwzGruhDOALR2VUrGNYfFXvzoMMyitEDXL3uade+oFZ93MOWMEAags8frwTPrd5IXjsmjQqgqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VueRgO4U; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VueRgO4U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749541879;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=NN+JgXIAzXPWiK3x16h+Q685YJH022Bq5MINAYdp+m4=;
	b=VueRgO4UUSkgzKcnV2GD5fpAHfyIctnKUiTv7au0vM1vOVS2JGd8tK3wIIzgDXAJ6cfuID
	Yc6LgxV7uQ18Wi2sm0I07MmgKiTqUZt2rpOKEDXtk31S/5AMqPB++bDKt0h/rHUTAnche3
	ZRilJvxUJ5kqmCy1Sj0dKIBSe+Xswmw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-49-WCY7Qv6HM6-Km5lOj4GeGg-1; Tue, 10 Jun 2025 03:51:18 -0400
X-MC-Unique: WCY7Qv6HM6-Km5lOj4GeGg-1
X-Mimecast-MFC-AGG-ID: WCY7Qv6HM6-Km5lOj4GeGg_1749541877
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450d244bfabso41189235e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541877; x=1750146677;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NN+JgXIAzXPWiK3x16h+Q685YJH022Bq5MINAYdp+m4=;
        b=ZLdYQrC3ht0qQfMqVR371GKyONrUWGSiAGZNkvLQ8feu7mzKliC1/akCXfmyZ5SfkM
         E8cVWPvFhKY+IDtonHBZUpgoSk0Lr5HnFhEcaM+C0tzB9Zf1d8L0ho2y/bf46qt+CWGd
         eI6we/lVmokyUm3wP8RfbmOd8wZydarjikilN4Sa2Hxj2gPMfP/9fw1EhgLZHngYBUzK
         wLeTa6WqfS5jfG9IiQe3ST3sow+Qdqo28iv1nIkuC0+Hos9QonPXuvK1yI+rD5dr7xxz
         WUN95+Oy2Mg8hDcSITTq32Z/zJSrSvi+OlnN/cPUpJsRy69+DvDiQ+p0RCQfkgrtm9e7
         GX4g==
X-Forwarded-Encrypted: i=1; AJvYcCVhgKYUr4Fz/oKHLjj3wLhOS10pt4bCUhHZD/Ijk9x/EGz9LKajtOzp21g5nG+wFCGEqd06hEqNqbyt2xo=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm9l6OVBVkWmkbJb8nba1SCqHh0Rfc0/IuB55aShPw8cTXqFhG
	z3Jnn2E7dhmPM/kVxgtF43PamvBBgHnrsoK6t9mRN2gNXZGXn8DgRAoZZ5JvixeEWCXVuvSNb6p
	0lXjZmwHnc3+daNbm8PBJaUtKi3sHpahZPygGdxdY618ANLapuJFBs4KhNpqkrI7y2w==
X-Gm-Gg: ASbGncvB+J2EQU61shUyXdWTnto4I8TtJeVVd7DBKjZk67AEwe2ad2vNOgJU64vZGT7
	RSt1K7qWDvSQBhiwPr3uOJU0rwvG2V9r3ObvMY5IGsl456NGinf2VcnjSnsCyGCARJmRiSmrEuV
	ZdsblKWCwBx+daj+sE6z2iY25b1Zq8rJvryIF9PDjYtWGr8VYMC490+5UZkKAKfwjZZKNw165PH
	rqKfC2iO7b+zLA7JNPw4XDepSC/1fBlnsoRuyw2TSGoz0JSXwhZvZHdGWHFClpm3vHqi2sT5y+A
	S2nsy+4aGNvmPQNhpkz8iRanGanaRv/rvSXBbwEyjHWWBupSSZ5igL4=
X-Received: by 2002:a05:6000:40c9:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a531ca76famr12240177f8f.16.1749541877131;
        Tue, 10 Jun 2025 00:51:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFBwBkK/UmcMWYr7OeyYZsFxhWofqTkp6465d9nf0mZI8upF3InT+Yp2N6bmBX5xot36ku/Ow==
X-Received: by 2002:a05:6000:40c9:b0:3a5:21c8:af31 with SMTP id ffacd0b85a97d-3a531ca76famr12240154f8f.16.1749541876734;
        Tue, 10 Jun 2025 00:51:16 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d1686sm128626015e9.36.2025.06.10.00.51.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:51:16 -0700 (PDT)
Message-ID: <3b21411d-ff6a-4657-a1eb-020104c549ea@redhat.com>
Date: Tue, 10 Jun 2025 09:51:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 05/10] mm,memory-tiers: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-6-osalvador@suse.de>
Content-Language: en-US
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-6-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> memory-tier is only concerned when a numa node changes its memory state,
> because it then needs to re-create the demotion list.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

