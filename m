Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E339A16D9C2
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:14:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186081; cv=none; b=JO0XOAGgAorZvJZYArQb7jTYe33unlasmGqbMk3Kg+Jg7mP/o+vNPmbeAvMXQ44aYkcKKYCejIthaClva/rhjt1GrRPjp6Lga2XdBe4TR3VLU1EXaMh5XNEwM0Zn5KqwLP1TIVHBzeTPAh9ujQbVsFjxACQrkBVVPGJSOeFW4K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186081; c=relaxed/simple;
	bh=etnoAPtfodu3j6OnVm6MbzL6CeTvVzZhtPqNGUr80Rc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r96r5tV8Zfjpyvy5KTMa5tsZmrcWC7Zg3ciaAGQ2MzeoLu2DY9209XSEnfN5DGIGx06IpzZk7aSuiIBLLKm7tSceWpasoI596QoSFjup4J6xSJXCy3tiRWe6UQ3Mf/2XYE+j1bzKLMIQVWoWqDi0NoCeyCDOBsw/uFj84Qm2Wvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=U+fF5Mrc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="U+fF5Mrc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739186078;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G/KMdZICnl582Io+/HgvG4CL9bgg3ycPLDrs0NWni5g=;
	b=U+fF5MrcD9/057KOFhdSRTZnIGHDSIY0VWTXMLYgKAruD4qnU2GBJMpAGVK8qm62GKA6IK
	pYIKoj4FuiPV76CyOB7LO3n+b1mHuWvF/qoElWRPjSXkH18TTKS1mS/QSTVZ7ZxrLTK3TW
	Pvp0JaoMSYQkictpT8j1oLoXKNfq6/w=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-bXaqxOftMMKH0XZ4g0Lt-w-1; Mon, 10 Feb 2025 06:14:37 -0500
X-MC-Unique: bXaqxOftMMKH0XZ4g0Lt-w-1
X-Mimecast-MFC-AGG-ID: bXaqxOftMMKH0XZ4g0Lt-w
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-38dcd8ddc5eso1839239f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186076; x=1739790876;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=G/KMdZICnl582Io+/HgvG4CL9bgg3ycPLDrs0NWni5g=;
        b=Jk37m2ox5wANHrCKUPrKR+UYkPZDeNlB47rl9hG2plBwsTyToXiYirwO6KJaZYPRiN
         Z2BxEH3Pw/dt178BctB5VVbaTbbYYSKT1Gkx9chHpxKO3/f3b5Ye/oz59lk7rxIq8pfs
         bmhQ0dk+DaMuc6m2cZoBeA1jK6OVuUhUZbGcd39zJ/kfQiEjy5SAQC83zyB9DLqNtE9B
         TRtX6jOkoEwvCXpRE8uS8fEibg1WdeicxLzsInn8x2eFr5j503qsxKkYzlJfDojCe1Oa
         5EiaodereB9z5at+EQJJtEG4bAVMfieTsrsXZTHc4l4jOlkA7VdjDuxmb1waeDhpXJEU
         /ejw==
X-Forwarded-Encrypted: i=1; AJvYcCXIuvcriLQGa0YNL8WmgR3TbX46/eX9bRZuYiaKfIaG7gVfx+lB6jfxnuKOfzqZ0/S31D5brmwIxfy1/E4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk96HN9522H+OTfkF3wDAj4xnSj+2FLlgFhrgkqoSXVJrzIcUq
	ZUJJuuolQ+W6nhzCqA6n6Vn1rTFDJadi941xHracsDPVJ/hT+3t1BMcZXORY7zh/ZjlUl5Sy6oh
	LKg27IaltGQ5LmawbhpA/VMYk02ECK48wXuzzBAk8McEmv3ZT2C4cRiw2WlI7OQ==
X-Gm-Gg: ASbGncvc2JXF7YGAG0yfbYsaO8L04cy20jueflP5qFP+wX/8Gn6pifeMts8tH/6f8qT
	bvAyXIpQK+Sa0WVok+Vo3clh5NsB+ERgrC2ng3YaPLHJBZFcdZGeceMkTgPWGMYt+LcWib+j2Mb
	JDfdqAmfr+sqBjwUdNv0QPykYSD1GI0lv/xA4aj9K0knKRGI175YMNuuSbQ2lId2IKqrn4vRBdk
	Hl0sh6rY5CO6QcA43IqGgb5awIuVa4igEk2XnnL7AN2iPgIQZ9ZqN6Bx/rzr7cLo8WxZc3DzEaV
	zR6l5MEzi3QJB8AXHmxUABtxYyY2qYGxcE/uGUNnPLwc
X-Received: by 2002:a05:6000:1448:b0:38d:af2e:d5c3 with SMTP id ffacd0b85a97d-38dc8dd1864mr9217935f8f.17.1739186076214;
        Mon, 10 Feb 2025 03:14:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGo6CfURy22Wovwne0UJ4k3nKGVnkr/wgeTUUI2em35sZPS2GM9P0+LoW8IoS7CA0xajZHCog==
X-Received: by 2002:a05:6000:1448:b0:38d:af2e:d5c3 with SMTP id ffacd0b85a97d-38dc8dd1864mr9217915f8f.17.1739186075845;
        Mon, 10 Feb 2025 03:14:35 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722? ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43935c4f4aasm70175115e9.22.2025.02.10.03.14.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 03:14:35 -0800 (PST)
Message-ID: <3c0e06d4-b5b7-45cf-bc42-8f12b293b7da@redhat.com>
Date: Mon, 10 Feb 2025 12:14:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7] drm/virtio: Add drm_panic support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 daniel@ffwll.ch
Cc: virtualization@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250206104300.416014-1-ryasuoka@redhat.com>
 <d8a453e9-c8ce-4a7d-8fb9-08a13c44d7f3@collabora.com>
Content-Language: en-US, fr
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <d8a453e9-c8ce-4a7d-8fb9-08a13c44d7f3@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2025 18:45, Dmitry Osipenko wrote:
> On 2/6/25 13:42, Ryosuke Yasuoka wrote:
>> Virtio gpu supports the drm_panic module, which displays a message to
>> the screen when a kernel panic occurs. It is supported where it has
>> vmapped shmem BO.
>>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>> ---
> 
> Applied to misc-next, thanks!
> 
> I've tested v7 with a different capsets, works well. For a non-VT FB the
> vmap indeed will be needed. Looking forward to the atomic vmap support.
> The rough idea of the atomic vmap helper is to make vmap code paths fail
> whenever hitting path that needs to sleep. Likely will be easy to implement.
> 

Thanks for your support.

I will see if we can do something for atomic vmap support for shmem.

Best regards,

-- 

Jocelyn

