Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1EB1DF982
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 08:15:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749111349; cv=none; b=EianJ+FdvJH2fEGPMsDWOr4QsaND502JFn/z1wcnT1LXO4lG7HT2WD/PZa5oRRzGFxV/ZPowTK5zuB1oFH5VuKfbQMRMiaAdVMoCtC3L32wwwJu5WmGwTCyRNYQNGv5rz9LvUqNMERuIt8AaYiFB6+mlKfqJpqVR3l6Sb1x8anY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749111349; c=relaxed/simple;
	bh=UgD4vIjpiBFh2jjmMRastoGsKWWIC3UKf7XWKPo40lg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sM6LWQhN4ykrhssmG05FzaJSX7tu5CgAsk0NjYtbBp0kWYn1Ljdy+a3uwS47OGigileXjEpVTEpPfakchRJ4F8ncC9EiAxDS6iYDJU/gyVI5CKcdfwEVeA4arHOtzedSFDVNwZ3ir+fssaJu8iq/b8BHw7GmcIEyvF48bIL8u20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bdPh4mLG; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bdPh4mLG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749111346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=TWFAHyI2oWBZIYDgyjO/aLqdP+qyYXsDarr/6F4sU78=;
	b=bdPh4mLGZY2sPsw89vdZoGgZHMKohaQG8Xnboc2RUUH1BHL+p4nAr5QBXMTHewd7v9j3ju
	VTkYJPcDHpTw4BDuUMI1JJrsPMXOidSN1bZJKOWjl/XcZo2jw10myKp2x0RpFlhhCeqnW8
	+vVAnmgv93P9eIzoIqHvYrhum04+Beo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-jKfiVHU1N-Oz70mm-UTEWQ-1; Thu, 05 Jun 2025 04:15:45 -0400
X-MC-Unique: jKfiVHU1N-Oz70mm-UTEWQ-1
X-Mimecast-MFC-AGG-ID: jKfiVHU1N-Oz70mm-UTEWQ_1749111344
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4e6d426b1so902368f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 01:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749111344; x=1749716144;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TWFAHyI2oWBZIYDgyjO/aLqdP+qyYXsDarr/6F4sU78=;
        b=h521e6yzHr86owIZ6/OnDA8zxabwR3ACRYlzrfB2wjoJNyqgO9xnHCBdH9FIUciiI1
         HWY/SVEJ0pByG/pcfnQApR8s6toRPte6l+HoqEdt8oAT2WacPDd9h6cwOWyCz7/6BTBt
         JwOV0tY9ZPWSVEc2B6SkqWHArtjQz+N9OpYVt16V3W3VYa59L3VV/4UcwxtQFL2gKUia
         WusqZueIHNyDNxbKszRK0YwWEGSoZ65fAKtKtSIz9aDCcCZD6TXyBqj9QGcbba8bzdTD
         Ig9vAKVXvamsBkPxuDENjb0cte6VSl8SLna57fKt76p9vLnzT3ZALAFC4HjGb0rUvZyj
         vBAA==
X-Forwarded-Encrypted: i=1; AJvYcCUe6TiyWuAt1vJC+tHyDGgu54VIqlCFeA5MYZrP7w9eJ3ywLZWyQxeUCHMgl3rsIi8YW1Z7MnJOT8Qagss=@vger.kernel.org
X-Gm-Message-State: AOJu0YyAf1jNX7dAX+svUFCoflL9rangD5ReGrkwz9zZhKPD8Bp1DcDX
	XvUnpwKqMDIjwgwTRfMYXQiycJowmQUrmV1WT0tCpr0loIJ2RtO03tLsRotUGHTH5k8RnVr7KeM
	SfrTksIxiW3EB6d5oU/7PjQFntcaPOEgL4G6SWuyhY/OxYr35/KV/uOALtiLX3FNWAA==
X-Gm-Gg: ASbGncuwlSfFzSTgDICzLr7RN4ehPx5rAq0YcxFq2rrVih4Cli7tT/7u5bnh5kJo0f4
	MsMsMJIy8Sg09GQ40ePFa6RWunwxcotgg8hMJolQFroU24RD/BDy+vROiMitbs3hYVrec99tIKy
	TunlNjZn5yBLGxu8r2KheESvYz9UIMbOJ0d0wqsjFZ2AMg2lTfiBe/rmF2rK5HyTKj7EJOsMRiX
	evVJLlByokCGVJ6s5BVBpRe3WZcHUEYc1qafiKUuBK+6Qxcq5S7JBXMI58AUfDr3w2Ft3l0QwJi
	ib7OYwc9kkSzemA4fFE77gcMq0u6OlGk0u941ZeQxdIZEAX41jxMbFlqdkLkIUMYgmI3M+jhBk1
	fxpaUxECrhmMo7IlJCEGIkrJK7hqXre4Mrc1V
X-Received: by 2002:a5d:5887:0:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a526df4e74mr1861412f8f.16.1749111343866;
        Thu, 05 Jun 2025 01:15:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFw1voWF+d/eUMVg6y9seEwaoPlJCwiUiJqOTXVX/JiytzpP07QXaXPke/xd8dIDszc1oBy6A==
X-Received: by 2002:a5d:5887:0:b0:3a4:dfbe:2b14 with SMTP id ffacd0b85a97d-3a526df4e74mr1861375f8f.16.1749111343389;
        Thu, 05 Jun 2025 01:15:43 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2? (p200300d82f27ec004f4d0d38ba979aa2.dip0.t-ipconnect.de. [2003:d8:2f27:ec00:4f4d:d38:ba97:9aa2])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4efe7414fsm24272686f8f.55.2025.06.05.01.15.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 01:15:42 -0700 (PDT)
Message-ID: <ef56d023-6ee3-41e1-bdcd-6d7cd30e9f91@redhat.com>
Date: Thu, 5 Jun 2025 10:15:41 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm/cma: pairing the trace_cma_alloc_start/finish
To: Richard Chang <richardycc@google.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Martin Liu <liumartin@google.com>, Minchan Kim <minchan@kernel.org>,
 Kalesh Singh <kaleshsingh@google.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250605072532.972081-1-richardycc@google.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250605072532.972081-1-richardycc@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 05.06.25 09:25, Richard Chang wrote:
> In the bad input validation cases, there is no
> trace_cma_alloc_finish to match the trace_cma_alloc_start.
> Move the trace_cma_alloc_start event after the validations.
> 
> Signed-off-by: Richard Chang <richardycc@google.com>
> ---
>   mm/cma.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/cma.c b/mm/cma.c
> index 397567883a10..bd3772773736 100644
> --- a/mm/cma.c
> +++ b/mm/cma.c
> @@ -854,8 +854,6 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
>   	unsigned long i;
>   	const char *name = cma ? cma->name : NULL;
>   
> -	trace_cma_alloc_start(name, count, align);
> -
>   	if (!cma || !cma->count)
>   		return page;
>   
> @@ -865,6 +863,8 @@ static struct page *__cma_alloc(struct cma *cma, unsigned long count,
>   	if (!count)
>   		return page;
>   
> +	trace_cma_alloc_start(name, count, align);
> +
>   	for (r = 0; r < cma->nranges; r++) {
>   		page = NULL;
>   

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

