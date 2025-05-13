Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B05371F12F4
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:52:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747155154; cv=none; b=ObnzU4aG7g0Z4b2vn5tFpHy3S4VIdRMq4fuy3kFWkAuHRoqOeN0Q1JVPbXjs811Cvbv2UrulEPKAnrdSwBA5OT9SS/H7jvaThrCICNVgFYMT5yNkCvUS9e5WYaDuyCwiQfNwRaeC0w007ABfPXrw2ER8lDgXM3+Riqz29Gl3LQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747155154; c=relaxed/simple;
	bh=WH/I0e21ZjxkxS6m2qV3G7LXXmVezJxr6bnLiBbaIM4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YgKhZ4jHcXhvvXLSqcZ0gS4gF3m3244M5jNwOi9YWmd7y6a7LWrZaXJZpo6T37D29YLY6wznI/mHPuRddp6Md7uYObYi4YOY0iil8OD29lLcov5sXQBCGncWJlBYai/uwy9wJ+CvoKZayWbf90GZG4PI764OnlojFq8RoQScXKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Tf0GfZeW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Tf0GfZeW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747155151;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=IPWZjFrzu5o7+oFohnj5YeXvO5PjKbexQbKx5XyXmJY=;
	b=Tf0GfZeWT0CbrPgCuOIx3CtknaWLcad1IksU8kAEk4GxEYCg8nEwCyJx9+Mijt4XbVclqM
	88dwsrG/jy5Y1E9A3rb3o3vI9or/FvPkFFziWGJeYx5EMteLxwI5o7AfAAPV6FXLl9OwXM
	dBePGSqnmk0epCAQLnZhMqpK5pan9K4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-8YgVeBf_NXeT3ThYx_dMTA-1; Tue, 13 May 2025 12:52:30 -0400
X-MC-Unique: 8YgVeBf_NXeT3ThYx_dMTA-1
X-Mimecast-MFC-AGG-ID: 8YgVeBf_NXeT3ThYx_dMTA_1747155149
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43cf172ff63so26916785e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:52:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747155149; x=1747759949;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IPWZjFrzu5o7+oFohnj5YeXvO5PjKbexQbKx5XyXmJY=;
        b=VPRYMUD04rDCDWTfEGsWECorw28EI5OZ4YH12oABZGiOqABVIlIezSizQWsLciiVp2
         bFhgCctJICbUvgkvSeKhqjNtxxSvoEQs9EzY3qyaAYFZv/W42GOO+ZKjNGefevQi8T8N
         nYKzcGALY+oCsOBSARbZ41Xa6VTfpwvs4XlePpz+wZl8++OuYWpoYuqPoPio10TzezPm
         wmUCS65Sga66j4XgfK/do1IdKxJFCwkPOj8+BNA6HDeealP0sQfiPB69+26Nb5Oqt2JL
         IfleSXfgQm60ouGNELsvnn9WaPumW6k5/i9WQAdASy9y/U8jHAjVmz0EJbOSxRZ5glX2
         ZCmw==
X-Forwarded-Encrypted: i=1; AJvYcCV9l143G+ihUC7I4aIJ4JArN4K7rloLGAnT8u1tZBBmfRfYrCpZ71dC3LmGy5R/xmSGzBO60gmkShqQVLs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdcGG0H+JFE5LBjSBEUpOE1x9HCm73sM9ECPQYmI1tN0ZBK8GY
	Db+Gvf9UxAA5YIgjQFC/oAbzUNUkwtSSt/OrsjWhzPXkNZbvqfOmmYyuB+o5AzVDkCjIDG3Ag8+
	moXWkIqaql6qLd0f5vT0Y0G9Ql9XX30q4OBmu6zDSzLi+Jrxij3JuwT+S3qU6/g==
X-Gm-Gg: ASbGncvTKm0VLeFPWiOU7TsFcJonQBTbXPhX3KFq6wV38VHJ0tCjEDewRNniSmZB1TY
	Uf190yz9tOL1mIuIMDlTaCD+XZkP4GJAZmiNm87ViAOTVBJBFMxdfAY+fmou0o2i7iT3X+0By8A
	sfvE1QHluH82e3s16OswP2fj8XsnQivdq7RiYpDZhav83FgQuq1StCP6EOyY6OtVmRKdtTBhQMQ
	yUqudd7mcGqPfk6kKVUyUJseLGMCPhOD1yfj8fvlWdhFxV4FgIgpow4O4onBnase9NW/bZr0HSe
	Ep3bA0FNRMDalDnXN+FmdDxAGjWZJK3QdJByUb7IPg==
X-Received: by 2002:a05:600c:5128:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-442f2169185mr406715e9.23.1747155148944;
        Tue, 13 May 2025 09:52:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGv9d5vlqPUTa6v97s8RjomWNwGK+sSSqbJCaRLjMYULxglzQySZ7Lo8UwqrBTBe2Zbv43zfw==
X-Received: by 2002:a05:600c:5128:b0:43c:fe5e:f040 with SMTP id 5b1f17b1804b1-442f2169185mr406465e9.23.1747155148548;
        Tue, 13 May 2025 09:52:28 -0700 (PDT)
Received: from [192.168.3.141] (p57a1af41.dip0.t-ipconnect.de. [87.161.175.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd32f3c2sm217298225e9.15.2025.05.13.09.52.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 May 2025 09:52:28 -0700 (PDT)
Message-ID: <dd10e199-e5de-4c4c-a524-68091973de7d@redhat.com>
Date: Tue, 13 May 2025 18:52:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] MAINTAINERS: add mm ksm section
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: xu xin <xu.xin16@zte.com.cn>, Chengming Zhou <chengming.zhou@linux.dev>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250513161758.136402-1-lorenzo.stoakes@oracle.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 13.05.25 18:17, Lorenzo Stoakes wrote:
> As part of the ongoing efforts to sub-divide memory management
> maintainership and reviewership, establish a section for Kernel Samepage
> Merging (KSM) and add appropriate maintainers and reviewers.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> ---
> 
> REVIEWERS NOTES:
> 
> I took a look through git blame, past commits, etc. and came up with what
> seems to be a reasonable list of people here, if you don't feel you ought
> to be here, or if you feel anybody is missing (including yourself!) let me
> know :)
> 
> David has kindly already agreed to be co-maintainer for this section.
> 
>   MAINTAINERS | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 80aa09f2e735..5ea2020acf84 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -15567,6 +15567,21 @@ W:	http://www.linux-mm.org
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm
>   F:	mm/gup.c
> 
> +MEMORY MANAGEMENT - KSM (Kernel Samepage Merging)
> +M:	Andrew Morton <akpm@linux-foundation.org>
> +M:	David Hildenbrand <david@redhat.com>
> +R:	xu xin <xu.xin16@zte.com.cn>
> +R:	Chengming Zhou <chengming.zhou@linux.dev>

I don't see a single RB from Chengming Zhou, and a single one from xu 
xin ... :)

In any case, for my M :

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

