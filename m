Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF6CD21D5BC
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751374555; cv=none; b=bzZR7XzMiEdPeAfqcUWHL1ytZ28xJSd9EooDNiSsL+97fwPr/ZhouoAN7miI87pIbSUXw+DYFQai5cmSPE4IsRTM8Wvj6y23tLz1PSktiPlHVm/68107Dg3sIeHvJeT3MvRwMxna6ES2NaqQXX0oOQuCYiM0MJZWxbMZG8v8bd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751374555; c=relaxed/simple;
	bh=sHS9MBxXhSjtQP3YCYQvE5WOQhueivRjaySe1XeeqxQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OayXEmUpSkmIwVxGIAnxNVuGG4NckvUC+9pzMBZovzZ97ZCrxA99/xG8Dja68vtFn4N0+LKmtnq5ABxDoZheqEWVbtyVS4PIvHAcORKiQZPa40oRj0xL8v2A3eew2cYEz/1HMaSRCQa2Ey/yviV1rOorE8qT0Y3XR772rNadDZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=b3Wz2YK/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="b3Wz2YK/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751374552;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=fnB33XQoGQDBHvWZjbh/j4QK8wEM7ZCiM3Xa5XDZLWE=;
	b=b3Wz2YK/g//a2x1oGYZPSOZGVR9M00xJL5d3snW05Lp/bJTibN5PrOq3tpxmq7WsGSGpuu
	rhxv/uIdBN+VNj+If0MoAsFz+tlhAnpF7WKrs6JtVy305eWM8Wnvo0YTeT13FctcYmiLKz
	ZSQsjdJ9iwyCc9rc1yM3tcrXjXRKxkM=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-421-lLrvcdCMOJOunjVTEfp8_Q-1; Tue, 01 Jul 2025 08:55:51 -0400
X-MC-Unique: lLrvcdCMOJOunjVTEfp8_Q-1
X-Mimecast-MFC-AGG-ID: lLrvcdCMOJOunjVTEfp8_Q_1751374550
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a6d1394b07so3608287f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 05:55:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751374550; x=1751979350;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=fnB33XQoGQDBHvWZjbh/j4QK8wEM7ZCiM3Xa5XDZLWE=;
        b=mNGtxGZqKRiWAYNyg3XiCgNt2gr8b5qjP6jY6DrPTjAAjrBY7Rw+mLJrZEHEnRJqOo
         R0wbwdY0N+LxKcITCHJGw5Ovt+N8450IBwqbyxN+Hqzr+ZWLNGestKqCyF81izoCKJCK
         DKMXcBjgWdzvFe8cdrah/DhEn/6g2klSKhRxDkNAIAUW6CmMtLVUdPlqd7XJmSBjQTAz
         COtQu9HDhOkMEgxKLKt07vaRXzWQm0inw8O38xTs3HxBLORC8N++fEaEwjGT3N+HmZoQ
         29QcQXqYlzGOlKr9vMNZcLnjpLqeXosdQg/PY/EMuXaot2moaFQoZzGoW7X4hplngaO+
         VRvg==
X-Forwarded-Encrypted: i=1; AJvYcCUc3kr97WTLVw56sTmg+DUiH6UGIXLhAV7pXWC7Sw2BPLQ46XFDbKrZeBY1qgx92xZW8vZIKvDVbGH+wFA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYY371lGjr1b5dyNMVbknmFlx4ylWmtvkc9HN5AFRKOYNazw68
	f12+mjWDMlyp0eCV4Kj82dNgQ2XQVVSseY7+hUPYCvdjDoYDa6ORvpVM2tzxAZEQs8gsdzlXavx
	ZadRCoDtPZY8QvNdCf+ml2lGWi4nmQrtLKO57Hv5WSTr8ZGlxeGH+iVRtG1Yje59ZIVgk9vRN1t
	f1
X-Gm-Gg: ASbGncuN8P7iBEDXGjDEEaHhI+fS/qsAJpfkq2HbLn0WKyrBR15/o+tIDH4AfRAje6k
	BLBLVO50I4V3RP0xRfM5P4vQQRm18jLg//2D7UYw3WGsYMclMCz9tsJ/cIg6NYsHVXrm5mzUJ4V
	dtJkXFyj7yuXOhq67d5xetkg2VtgRIFWQOHXgf9A3110xv2YamVHwJ8695MaWm2JGnlcCjpG6R/
	SiRz77RHoVwh5jGYncQ66J1gDAyKT+k35vJNHC00MzthxivTqCXp4YH4SL6ug416CJkwzxfElXu
	aXEjk1575cwICeXfvaeB5ZhZ+37HU6C0D7GNFZwmWVrFKW+DS3A4a47/zWK41plww7INTxsgiuA
	hKwy4JgYwX60BXNIAPViokYFss5imoApYbIOVroqr3UEvn5xH3A==
X-Received: by 2002:adf:e981:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a90d0d6e02mr13646460f8f.2.1751374550027;
        Tue, 01 Jul 2025 05:55:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPtFa0jHrm/VwBn2EFiFfCmF+UQrcUJ7KtnwtFkjtKof7fiR73gTPqt4rSIH3zxChk5ou/ow==
X-Received: by 2002:adf:e981:0:b0:3a5:243c:6042 with SMTP id ffacd0b85a97d-3a90d0d6e02mr13646440f8f.2.1751374549611;
        Tue, 01 Jul 2025 05:55:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f18:7500:202e:b0f1:76d6:f9af? (p200300d82f187500202eb0f176d6f9af.dip0.t-ipconnect.de. [2003:d8:2f18:7500:202e:b0f1:76d6:f9af])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52ca4sm13292732f8f.58.2025.07.01.05.55.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 05:55:49 -0700 (PDT)
Message-ID: <378617e0-f325-4d46-a97f-d98e1a657500@redhat.com>
Date: Tue, 1 Jul 2025 14:55:48 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/hugetlb: Use str_plural() in report_hugepages()
To: Thorsten Blum <thorsten.blum@linux.dev>,
 Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250630171826.114008-2-thorsten.blum@linux.dev>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630171826.114008-2-thorsten.blum@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 19:18, Thorsten Blum wrote:
> Use the string choice helper function str_plural() to simplify the code
> and to fix the following Coccinelle/coccicheck warning reported by
> string_choices.cocci:
> 
>    opportunity for str_plural(nrinvalid)
> 
> Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

