Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A534823AD
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750865694; cv=none; b=ggTAVS5tNuSgvAM4jDKVD2P7iBGNBflcazGZi7z/bueEEdUja7Ol4rksb5M0XVOXPV31FIVzKctesK4X9yuquQ8yiXYWVfqncHfP4jM2DsShl3zcAfoXGK1VnmyWFAmszGXKx+Ru4OdIY02sOMzNw8sKTQcwmK/ZXmyGZwUCOb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750865694; c=relaxed/simple;
	bh=XoabQxPR4e1tSSRhYqRd4kOH9Gzv5ulUOhd93CzsBu8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fptS3s3CBEM4CoUb9kKhtBOEFAoe2xr2tQKdMB5w2oRDHxXS4DefbIpIty6sFwBD27qPTo3D5IdfcmPno6p2zkmuwAvmFX5kqi8OvQekN0STUbVT+J8D/Y4oXGBhv636j7hBDFMikiB/9OZ/xhs/CpVcfd/5TmzIR+HGw0Tm5xM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QplYnOpz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QplYnOpz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750865691;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=L6U7uSZ3zn6lSctvvHLf/6IoHum5TuGxKVo47SoLtfs=;
	b=QplYnOpzrTFuqZ73W2YbiADvbKPw+7Cf0AwQ/bOgBafR8dhFKQ+YinquVwh339bq/pOd2h
	4gdfknzRr4Mjp6ULfpDw9Kjwt3i2xn1SspawJzMg3Tkkn8ATDV7DfXGXR1fbPMrdbJM55e
	XXiX2PH3DYSd2hVENlqU+dlkjc5VY08=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-602-henEyCr2OaGuLePcoh1t9A-1; Wed, 25 Jun 2025 11:34:49 -0400
X-MC-Unique: henEyCr2OaGuLePcoh1t9A-1
X-Mimecast-MFC-AGG-ID: henEyCr2OaGuLePcoh1t9A_1750865688
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so53313375e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 08:34:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750865688; x=1751470488;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=L6U7uSZ3zn6lSctvvHLf/6IoHum5TuGxKVo47SoLtfs=;
        b=PjsBJujFGFv3DBv8+a60S0cvJaAomfImRByU1H9IwlRG0nTc22RIDCOODv1xXjJZET
         CE6hcoBZBxsk3FNNMKsKccYdKhiW9nYEH87oasmTxAejlx25HQwTAleFvdSh1SG30Dvl
         NUUJg27i94D4bCxA9tiT/eo0PiLiP6yUIhkVn0icLASCysKvEwHhzkVLyy9u8YDvcsQK
         q391AOvO3ONtzQbqFScbfP1NuQHoI+3vU4MHvUYARQsrygJ9Z8N2LPgiu/Fvzmdd3Uyq
         PO9Wc6rz0QiX/pXztaskepXljx1Ura/EvNvCafrTsxzYUkkP2H1SnOI4FsfAGvTv0joO
         01PA==
X-Forwarded-Encrypted: i=1; AJvYcCXYf+R+sqhScM1oPczEANm5Cn/5jymmVCOvDN/MTNZSlMYknox+IbnAH9A+wN5FVxDahUxEAH/nI8khwbE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0lSEASMHiqWvV84vn8MN8Bbu04hwfgTctEiho3wiIjc40EuVv
	yCIIb5x0tppomO/lU8hZ5/im3uSFDwGvVYrY1NLPLj5cE6mtCmad9QqICZKaRZmD5Gghqn3QX6M
	C3TVB/8o4Ke6wnvHMrRzBLVbELC0ACatA0YspWA1tYpKC5ecyGqh4C2Sq/ih4KPLlrw==
X-Gm-Gg: ASbGncvAueBxpTHWkvOMP1N0p1PofVyan8dwC9/2/OiDAwz3xhUGxDiRBVLwZanT1zO
	f1Sw4thBwK9zDQttzI++sATl9AFe2EISAup3A6/2XxT5W2PeQAVtdxVcjJjefc3nbvZwnuj/Y3+
	CFVuAxXLZYxw1lE9jgt8RJTIB/IYoQnfd68BHNVEvOE8Yse9iWCv67xmbl5apVqmPLT4+A82bEf
	6BjPyxgWGqwA5daWBBSEvRpFwnbOh6vXfswB/5T0f5Dhse6pmTQkoSpTAlgDTGnWKWkGIwJo4W4
	3jq+HL7qXcOJ0qbonqnYrpNJBvCxhL3uQk842ASchq4AVhIgPAfWwHpkgctRP/Myc5KPmX/y7x2
	DXtMepDxeQwsBEuMeZn0pi1Vq4DDUSWrQAsqJAyC0VvXb
X-Received: by 2002:a05:600c:a302:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-453821b0a2amr28702215e9.31.1750865687752;
        Wed, 25 Jun 2025 08:34:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3G62Xle62kvZpcNmhC/QVpFryCSUhbFB9UamD6FGT8RaMoB3EMzXfizx4te1AkopeO5/XYQ==
X-Received: by 2002:a05:600c:a302:b0:43c:fda5:41e9 with SMTP id 5b1f17b1804b1-453821b0a2amr28701915e9.31.1750865687375;
        Wed, 25 Jun 2025 08:34:47 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f12:1b00:5d6b:db26:e2b7:12? (p200300d82f121b005d6bdb26e2b70012.dip0.t-ipconnect.de. [2003:d8:2f12:1b00:5d6b:db26:e2b7:12])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453823c3a96sm23252415e9.35.2025.06.25.08.34.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 08:34:46 -0700 (PDT)
Message-ID: <477c1b34-6acb-4e49-b9d4-f52d93597c90@redhat.com>
Date: Wed, 25 Jun 2025 17:34:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 next] mm,memory_hotplug: set failure reason in
 offline_pages()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Oscar Salvador <osalvador@suse.de>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Harry Yoo <harry.yoo@oracle.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <be4fd31b-7d09-46b0-8329-6d0464ffa7a5@sabinyo.mountain>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <be4fd31b-7d09-46b0-8329-6d0464ffa7a5@sabinyo.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25.06.25 17:32, Dan Carpenter wrote:
> The "reason" variable is uninitialized on this error path.  It's supposed
> to explain why the function failed.
> 
> Fixes: e4e2806b639c ("mm,memory_hotplug: implement numa node notifier")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
> v2: I misunderstood the reason why the function was failing.  Use the
>      correct reason.
> 
>   mm/memory_hotplug.c | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
> index 4d864b4fb891..e4009a44f883 100644
> --- a/mm/memory_hotplug.c
> +++ b/mm/memory_hotplug.c
> @@ -1977,8 +1977,10 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
>   		node_arg.nid = node;
>   		ret = node_notify(NODE_REMOVING_LAST_MEMORY, &node_arg);
>   		ret = notifier_to_errno(ret);
> -		if (ret)
> +		if (ret) {
> +			reason = "node notifier failure";
>   			goto failed_removal_isolated;
> +		}
>   	}
>   
>   	ret = memory_notify(MEM_GOING_OFFLINE, &mem_arg);

Again, likely to be squashed :)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

