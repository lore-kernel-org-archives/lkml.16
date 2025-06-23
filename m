Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B927F15B971
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688004; cv=none; b=GwOcscQM/mekDlaS72Wrq8K3n6IDqAEAnKTP7v5NmARI2u5z4OXobScv9cJf8p/WB8dk0gUmGRYkVXTbdXPBOaHrBQz4MPXNP5lLSUZPEjZ++KwFPOthS7yY+xU7ETQ/h4ZH8mhm/Jm3Xoutb3WYRfWRLb2u3rKLIooS1pWEf1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688004; c=relaxed/simple;
	bh=0dWBiAm762LaCAj5UXUKGY/j7zgApYAIMKFx3CH0OoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CjNRCdQ+0BLfAbzDFWfn6sjSQNePT+eCR3HHFSQaRg0zw1+DW5mmypg1TkMIBRPmin8eHWOKWGA1h6v0Y+H08LVUofjWuUF5q5+/eueRob7VNx8KtZ7N7IE2lypKsGh2mNHSy1daeOFjXz4ec+pawHco5Dgbu7iixo9iobGIE+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LNwtsv/a; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LNwtsv/a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750688001;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Dcmfif/cyuIAAd71gi3Imj5PORuy7iF/abJiROicq34=;
	b=LNwtsv/af75PT8VpB6I+bDwLOlE02WorLL0ycljVMFyuEaJ59ImU3PV4/TGqRJNpXmdqbX
	aCbHIz9CAheHcHslX07Nhix1r6dLfuF6g0mtzmZ6eKVvyiRyCTOH51ZbQwPVTwYpTiNZ1d
	6x1uuQg65hPwim+PKu8+xRjPc6bIHw8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-103-u5RHBU9uNd2NHSnuy-OYXA-1; Mon, 23 Jun 2025 10:13:20 -0400
X-MC-Unique: u5RHBU9uNd2NHSnuy-OYXA-1
X-Mimecast-MFC-AGG-ID: u5RHBU9uNd2NHSnuy-OYXA_1750687999
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a54a8a0122so2174398f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:13:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750687999; x=1751292799;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Dcmfif/cyuIAAd71gi3Imj5PORuy7iF/abJiROicq34=;
        b=i1zg3+7Tl73YiDdRVrDUc7AT54REYkrUN7qv8usq94xw9r3QsolEjlXchClMyjvfny
         b4lvNDu0OaDP2tiMp4k13fYCJEEYsXbaQIZ9IkJlkxP5U/NVEXLXncTu3utY1qFzFTwY
         ziXULVxsea5y/42z5h5gjEwHdvgO9oteEyhrLr8LxgG4a+48CIcyruKOkHPcKUpdhY9k
         fd8wYbzM0wseJfB5WmUZpE4BJ+BG23UH0LbF7gvfAMsPi+iY+vMOPbbdLX8HFMGCJpcz
         3TnM3FSJPia4ztUKJ8w4tfpQKQxj4Q3tL8kq0N8mge/eKxaLgQEPIpIsJK5623x1fBe/
         SPkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM03YueFlnL4X/wb9E5cp35rtI0vfVi7Wcao70Cik+RQhMqXZ7yEgE+H09L8jLuF3Mj1BF0t7qPXNDyGc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkEWLhCV6BRPRLgdupk4BuPPsrAhZBUqDZZt6k4/ZoQYdJF/X6
	wapN0cyL3OVEQ2gqibzxP8KfhNRdlaZrcw0/b7si9OSppieAgUTYvkHds/HQNZMP6HWujcSnXWK
	aX5y2B8/nZVaTNRBv0jptI6zZYhYLtfgphwaAUwrvuSd89d3xZGu0ga4KrKpE0RY5Eg==
X-Gm-Gg: ASbGncssO4nxaho51kIv8EomWJwvKFnu0uQHdRc9NOtXCrSZglD6LGUxtYPHCWTOgZ/
	ixjBg/251H/Tb21V1jgJMLpbLQrv9w2PD2L/b0VVKahJlyrOd22nPbetaKUtQQEX6fn1hmj9fwv
	3btlCm6zSpupnCBgtkBXlYUsJThzSzVTYyoiPKkx6EAYnucGK1UUOMBIpQk91UKXhh1b2AfFy02
	rkgIZhOsKZ+NJ51tlI3qL16xDI8eBqfPswOqOy2EPcsGWZUbQYdEqZwVaXXptqTmFmZuYCF7ggt
	B/vppTAEyK8tghWz0gX3a5/eoKBIlnZRFcxXbPB4/nCZtqZ28yRaZFliYxb/11KXVvJJ2buAsvw
	FXo0WQZ1Dm+1vn0FPYtrDLmK7CymjwqntTN9XQ9rIlTunoROOXg==
X-Received: by 2002:a5d:64cd:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a6d12d7abdmr9907633f8f.31.1750687998915;
        Mon, 23 Jun 2025 07:13:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDUxnL3nJvmH4q+Xsnf1SS41C8BCtvEsE0B/HMLIC6UVS0ZbdeBSca4irkSqkOWPXMG44KTg==
X-Received: by 2002:a5d:64cd:0:b0:3a4:f90c:31e3 with SMTP id ffacd0b85a97d-3a6d12d7abdmr9907613f8f.31.1750687998529;
        Mon, 23 Jun 2025 07:13:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159? (p200300d82f4efd008e13e3b590c81159.dip0.t-ipconnect.de. [2003:d8:2f4e:fd00:8e13:e3b5:90c8:1159])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f18152sm9367133f8f.27.2025.06.23.07.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Jun 2025 07:13:18 -0700 (PDT)
Message-ID: <7f8ac35d-89f0-41e7-acfb-bcf54991612e@redhat.com>
Date: Mon, 23 Jun 2025 16:13:17 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/5] mm,hugetlb: Rename anon_rmap to new_anon_folio and
 make it boolean
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250620123014.29748-1-osalvador@suse.de>
 <20250620123014.29748-4-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250620123014.29748-4-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 20.06.25 14:30, Oscar Salvador wrote:
> anon_rmap is used to determine whether the new allocated folio is anonymous.
> Rename it to something more meaningul like new_anon_folio and make it boolean,
> as we use it like that.
> While we are at it, drop 'new_pagecache_folio' as 'new_anon_folio' is enough to
> check whether we need to restore the consumed reservation.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> ---


}
> @@ -6640,7 +6638,8 @@ static vm_fault_t hugetlb_no_page(struct address_space *mapping,
>   backout:
>   	spin_unlock(vmf->ptl);
>   backout_unlocked:
> -	if (new_folio && !new_pagecache_folio)
> +	/* We only need to restore reservations for private mappings */
> +	if (new_folio && new_anon_folio)

Could this be simplified to

if (new_anon_folio) {

...

-- 
Cheers,

David / dhildenb

