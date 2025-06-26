Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA6825CC57
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 21:51:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750974701; cv=none; b=ZRwpJdq/JrDm9FlNf/7iHOEpZVQu2GMfkGqGdz9VDuBb8ZGp+QxF0TCxTFz5kMrm61GRHYD656TePrQa7H5+B1i11khJdl9VC27zw5wbaFNhOG1GjLuqhtf2sgX91GQ6Emim5MHZW8IHjiSp8JonUc/Yt+huToseo598RRjHkoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750974701; c=relaxed/simple;
	bh=VrJuH7nRNT4dug5+LFTl0VCcMUn6jnig9oTw+q1HSlY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=rfMO018EcAvWhTity+PdgupknF3c0pvkYOjuc/7jsSNQs0swicJg6oIYoejx6JiZYrc8dqH4I0Ko40DaRDTULocbeDQjp1gyQYrTfR8bBtOTjebbFWu4a8rIM31+VljFADpJx6u6RZnaInMx8zIN5SQj7ZmO5Twix7XGIRqKGpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bFewnwgs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bFewnwgs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750974697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=p70ORTbIO96gLr7OmgqzsoMMs3lt0rYniV0JvcEEfvc=;
	b=bFewnwgswob8rRAigfjyqb3NhoOSM2oaS3ceoGb+kAlnKVFi/R7XKwP2jhhXaiA8gJcdh2
	meiJpasuGV9oYUW+EDIDFRabDUNyzGS3BfPMWFjem/zkVxotV2Y7I1NbeAaNxxgYMKsJEE
	Ti+dgY75wtDeYhmYNetKPgynD18s7zg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-Oci_GYEVPX60Ddvd6SDMNQ-1; Thu, 26 Jun 2025 17:51:35 -0400
X-MC-Unique: Oci_GYEVPX60Ddvd6SDMNQ-1
X-Mimecast-MFC-AGG-ID: Oci_GYEVPX60Ddvd6SDMNQ_1750974694
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4535d300d2dso11684675e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:51:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750974694; x=1751579494;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=p70ORTbIO96gLr7OmgqzsoMMs3lt0rYniV0JvcEEfvc=;
        b=jV226npzZjSjoAGADhSUasYcJCRjNhBtu4H4gTExjS7tWp+XQkz0FVr7OwUn67i/ul
         E6+n2r9XjR+VUn8Bjs3w8II7mGTL5K7whRkdFjNWJSDNuzxRML4NKiE0GCS72KjapubO
         uILFUCxCN4OpoiZwk6D/8T/Z68PGk1c94IIit+FF99xDkFtRRFiJU2lo4MYVgY466fCX
         /jYyjV9f7zyu1pzNcFmCzM8IrvMvyeD2R6aRDcMlOx5x06W/p89OZCFhh+eTtceSJqQH
         hdjWf94GKI+x/+1kybj1RXquqVftWBEVygS/PT0mU9UV9fYFkK/ySgiStGLjPBK6cAt0
         f8xg==
X-Forwarded-Encrypted: i=1; AJvYcCU1pygGvevkxH5fMNzvNeJKTigLmh6UtswB0i8ldAPy7+nT4Xmf0y3x6m1yv8lLJzE/F1p0PmozK63G6AU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy49LGWKcO1kzizlfoKw6M4/5R6V0CohViBNszN7mlz/075EMaP
	OABQqusPsEL6LDVPYd2SAYS/dWsl2YsVpzBG3EHEXhPRTNKAIFNXSLjsvAyG9if0e6BMZTF3XOa
	XkwfqfwOhXhFf4WuuHf7wz4vAXE1wBFh0Gkhd6Weu2YI42s45SRUPak18U6v9TNwDFQ==
X-Gm-Gg: ASbGncvCMw5un0qFNq9zuFtTgFJ4UH5miFbELW2RHtJv5DWfsdz/Yow/8QUOKZZ7RHs
	8LfFLK+w9L1lKxb/y1FE6o5C+i82kjLCQGR3Ci1dMVpoHNsFRTCGeWVabX3FfSmN+SGYH52k6mu
	l9glqHE4wOg6JXB5XgJ3fT7dY3exj9hFf7B5snJ0dNh0dwL8ckaRE8/JGLSpFPNDWVOjgtANNws
	lTlF5uK11EeeOeLM9zftUxPpM8IL/qxJEGmyClTX28/4LmSUox8wudn34EcyEUOEWBgITtUHgNr
	LR2NIoSu7FZlviV9HbM1gsapv9wrFDNe6LL8MBM4q2OYI6cC6N3MigFLU9fxrtT+Po3/7Jy+L/U
	5R4nSGo1qXeCnbNdMJjUiJ0kOpJRtrNeWIHHDzPDbnpcvfDAeEA==
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4538ee55a30mr8073075e9.16.1750974694021;
        Thu, 26 Jun 2025 14:51:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGGThS/hKhvVwJ1z8eBZFnCLtGBjla1a26fmp6IijmJ6I8BcuS05x9CB1U22lzA0DGl/D7jYw==
X-Received: by 2002:a05:600c:c11b:b0:450:cfa7:5ea1 with SMTP id 5b1f17b1804b1-4538ee55a30mr8072985e9.16.1750974693610;
        Thu, 26 Jun 2025 14:51:33 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3c:2f00:8afc:23fe:3813:776c? (p200300d82f3c2f008afc23fe3813776c.dip0.t-ipconnect.de. [2003:d8:2f3c:2f00:8afc:23fe:3813:776c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e5f92esm928649f8f.90.2025.06.26.14.51.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 14:51:33 -0700 (PDT)
Message-ID: <86cd01ca-2be8-4e20-83fb-1f9321da6349@redhat.com>
Date: Thu, 26 Jun 2025 23:51:32 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm/mempolicy: Simplify weighted interleave bulk alloc
 calculations
To: Joshua Hahn <joshua.hahnjy@gmail.com>, Gregory Price <gourry@gourry.net>
Cc: Andrew Morton <akpm@linux-foundation.org>,
 Alistair Popple <apopple@nvidia.com>, Byungchul Park <byungchul@sk.com>,
 Matthew Brost <matthew.brost@intel.com>, Rakie Kim <rakie.kim@sk.com>,
 Ying Huang <ying.huang@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, kernel-team@meta.com
References: <20250626200936.3974420-1-joshua.hahnjy@gmail.com>
 <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250626200936.3974420-2-joshua.hahnjy@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.06.25 22:09, Joshua Hahn wrote:
> Simplify the math used to figure out how many pages should be allocated
> per node. Instead of making conditional additions and deletions, we can just
> make them unconditional by using min(). No functional changes intended.
> 
> Signed-off-by: Joshua Hahn <joshua.hahnjy@gmail.com>
> 
> ---
>   mm/mempolicy.c | 15 ++++++---------
>   1 file changed, 6 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/mempolicy.c b/mm/mempolicy.c
> index 3b1dfd08338b..78ad74a0e249 100644
> --- a/mm/mempolicy.c
> +++ b/mm/mempolicy.c
> @@ -2645,18 +2645,15 @@ static unsigned long alloc_pages_bulk_weighted_interleave(gfp_t gfp,
>   	for (i = 0; i < nnodes; i++) {
>   		node = next_node_in(prev_node, nodes);
>   		weight = weights[node];
> -		node_pages = weight * rounds;
> -		/* If a delta exists, add this node's portion of the delta */
> -		if (delta > weight) {
> -			node_pages += weight;
> -			delta -= weight;
> -		} else if (delta) {
> -			/* when delta is depleted, resume from that node */
> -			node_pages += delta;
> +		/* when delta is depleted, resume from that node */
> +		if (delta && delta < weight) {
>   			resume_node = node;
>   			resume_weight = weight - delta;
> -			delta = 0;
>   		}
> +		/* Add the node's portion of the delta, if there is one */
> +		node_pages = weight * rounds + min(delta, weight);
> +		delta -= min(delta, weight);
> +

LGTM, but took me a second (and it's a bit late ...)

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

