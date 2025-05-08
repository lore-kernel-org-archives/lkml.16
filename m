Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F5AF35280
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 17:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746726047; cv=none; b=Dgw9cwnnKN/3Xwgatq0OibMvfOH9Ry9OsGaVdM3WxBHopReMxT8ezy5kpgfykJ8R9m2AtmCWu28yleh8symF/NqOZjgkurpL1sZ0jWzWSle2/sHpzT3u8cLqPiwu+woB0DVFkOyjnHx0iWKWBFjmMWpxGvXxV2RyysIVS+y73Vg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746726047; c=relaxed/simple;
	bh=6SO2Ucunv3AMXaA+4Gf3reB29b5G7m5DWOAExWBUBn8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HWCt+Sl+t8M8kXhBPni3l3Om6tOd2SaMKSODX94ZfiBYfB81B6VkwXwaDsnDZ2AaS83uVPbw3JgZGpGNCFIgXleHR4W4iQgE0mtKsRGTETYpJVKxaCIto7sTSFfIpc9csc1ENZ3MtWAjYzgAo2D+nmyc/YYoO4n/yWD15Qu7vKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hvvpZFAf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hvvpZFAf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746726042;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=HcSbLcgVpaxHaPbHaZldx7w+O7eSxnUnn9Img1z6bAg=;
	b=hvvpZFAfxFDs/drOUhrssT0J4GGryEs2RcMhNgfWIiR6iIPhzQF6R6HjE1zcThMY6veW2/
	kJP8CkYWd2YUSv/jk/v0+qzxcz8VT4jtHBCQP7TXb6JybF2cK7dAP/oAINzequEIOyTx1f
	wC7GX5zKit4i3pdNHlsw7YlJcIGq/50=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-247-WLLXf8cHOEC_nCusToBqIQ-1; Thu, 08 May 2025 13:40:39 -0400
X-MC-Unique: WLLXf8cHOEC_nCusToBqIQ-1
X-Mimecast-MFC-AGG-ID: WLLXf8cHOEC_nCusToBqIQ_1746726039
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a1c86b62a8so268124f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:40:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746726039; x=1747330839;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HcSbLcgVpaxHaPbHaZldx7w+O7eSxnUnn9Img1z6bAg=;
        b=rpMKU9YkwqPizXdJv4ti0KAM3hCNDsX2wp629Dd+9UHyOG2fvLH45KF5zS1rLnas5R
         +oMzc2ZM709Sj2vc2O+ipMovbSYrINSUwaDkM8/JXu7bWQaluXEhe7RNsQyBQLggANGf
         /AFt31g6PUEtA91Xy5mtERbUzFmb5IZ5GQzyksN5tQQU8f5GqQde6en5K3ddqOQfnQmV
         HImKq2OIJY7pFWXHBbewFjwAsKZu6QOvHSN+fcRJZoODX7WfVt51CCogTOkSsnighENi
         ahlK8A78nRauqeFdNvMeO2CAenuZx5vClzbgM1StG2ZRNTyjFe+P38UdPNxrmxGGrjoG
         4LWQ==
X-Forwarded-Encrypted: i=1; AJvYcCW0a2RwvWaZlgATNg4J3OMcdRw20yD9F08gzAeye2IRIDHKRSz2/F4Nz4tYr/PIG4LnTJUgXu51hEKzPKI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXFJrWEu3aEmzxblNm7OWbEwMKsIvqG03svOYq3S6LvjdPxIqO
	PKbQjuwpDy8G/GrRLQcvRtg/OPiSWE598r9H7YjJbDtjB5HAyqDYifZgmxhUXCo6a/QxT8NPq/c
	f59L7rOWtiZyUzQ3gKiXc2+UjnT64yxwtSCOXMq7jnx0FukevixMAg9lH0rbKnw==
X-Gm-Gg: ASbGncuGQNq38KQ815kgMJ/UjmrTTnJ2Pp7p67k6kfoUgtHu35hZLnJ9oZx1L7jjtpc
	DRLU77zX6qyWg0Qvp2dImIYrRNOwdbnrlPnYAc6QDPNW0m9v2a+VogceDOEJ6nSuMwGrHhA7R/X
	PHEqDiDzStSGdTwHV48m4CG0n3nBa8ANgcRc3XORPZIvJfY9wfyLCW6uKQKZmQbquu3UFvur+vC
	3kGXbOqWfUabRchG8+HMTeyNFxSlvik9z8MyqXre8I9Ej10kTpSbXeWWY660XjuhTfHxyuKNZeJ
	JdpnFVw7t9M2d8sxJJ6HKvYl+G2cB1uk0HGcR+HpBL1ZSFs/15TQfEHtEc46mFeNPb00clJA8Ek
	fYBbEjfAwC+s/kXmNRuFthtqzOppCdgb9I3gJB1I=
X-Received: by 2002:a05:6000:4287:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a1f6457726mr405689f8f.20.1746726038769;
        Thu, 08 May 2025 10:40:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3MlhWoJNnW7n6Yc3pr+3ztyYhJqiCb/L+WG3xcKTXxpDszEoQtGZc/iFCDfLMAXuHYsuKrw==
X-Received: by 2002:a05:6000:4287:b0:3a0:8c45:d41b with SMTP id ffacd0b85a97d-3a1f6457726mr405671f8f.20.1746726038418;
        Thu, 08 May 2025 10:40:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c? (p200300d82f3e590027aa5f4ab65c3d3c.dip0.t-ipconnect.de. [2003:d8:2f3e:5900:27aa:5f4a:b65c:3d3c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de087sm611186f8f.16.2025.05.08.10.40.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 10:40:38 -0700 (PDT)
Message-ID: <c476a80f-9fd9-43e3-991f-aa3b4277fb44@redhat.com>
Date: Thu, 8 May 2025 19:40:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm reclaim section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>, Michal Hocko <mhocko@kernel.org>,
 Yu Zhao <yuzhao@google.com>, Qi Zheng <zhengqi.arch@bytedance.com>,
 Shakeel Butt <shakeel.butt@linux.dev>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250508173735.173502-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 08.05.25 19:37, Lorenzo Stoakes wrote:
> In furtherance of ongoing efforts to ensure people are aware of who
> de-facto maintains/has an interest in specific parts of mm, as well trying
> to avoid get_maintainers.pl listing only Andrew and the mailing list for mm
> files - establish a reclaim memory management section and add relevant
> maintainers/reviewers.
> 
> This is a key part of memory management so sensibly deserves its own
> section.
> 
> This encompasses both 'classical' reclaim and MGLRU and thus reflects this
> in the reviewers from both, as well as those who have contributed
> specifically on the memcg side of things.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> REVIEWERS NOTE: If anybody feels they ought not to be here, or if I missed
> anyone, let me know!
> 
>   MAINTAINERS | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index ccc45b0ba843..a755b9dbf6cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15577,6 +15577,20 @@ F:	mm/page_alloc.c
>   F:	include/linux/gfp.h
>   F:	include/linux/compaction.h
> 
> +MEMORY MANAGEMENT - RECLAIM
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +R:	Johannes Weiner <hannes@cmpxchg.org>
> +R:	David Hildenbrand <david@redhat.com>
> +R:	Michal Hocko <mhocko@kernel.org>
> +R:	Yu Zhao <yuzhao@google.com>
> +R:	Qi Zheng <zhengqi.arch@bytedance.com>
> +R:	Shakeel Butt <shakeel.butt@linux.dev>
> +R:	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> +L:	linux-mm@kvack.org
> +S:	Maintained
> +F:	mm/pt_reclaim.c
> +F:	mm/vmscan.c
> +
>   MEMORY MANAGEMENT - RMAP (REVERSE MAPPING)
>   M:	Andrew Morton <akpm@linux-foundation.org>
>   M:	David Hildenbrand <david@redhat.com>
> --
> 2.49.0
> 

Acked-by: David Hildenbrand <david@redhat.com>

Thanks!

-- 
Cheers,

David / dhildenb

