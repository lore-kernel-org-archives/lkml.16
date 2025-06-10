Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 638CE21D5B3
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749541981; cv=none; b=KIZ/2NByK5XY9grhIidoWEDp3c4whia5efzQW2cJjaMq9WQynefRR5K9xPvTRdu1R51r4Lsy9steiUOQCCLVYRhHp2QqK5eZjFwUvFTP9BTN7+HLk5eTxu9PXtp8KrELCI2z6ODscbdq1y/V5+M9uCfrolHoJGaOq/xfdhygOlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749541981; c=relaxed/simple;
	bh=TFoYx2MAdgrwPaVuwW8CX3b3HXZuBjK/aMJ9lkQsU04=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Afj31B366hxYYaErDVARUnfc6CEgEfriGifUrt38NXRRbfse8Jmv7RIcGU/SE094duoRK+7txWgT063sDIKfXoo0TkhSkygdfM+t5r6qf4+5yVWitDBC9OrXpYE/7a3BGJZeOhF1wBI+ccbiCCYSj6PkV81RQhpuE/SCn94FsrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Sx5MFdZi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Sx5MFdZi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749541979;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=YfJbmeC1JvTn/HT06kf5YDIhRSglvHJgoP3BNd+fHbU=;
	b=Sx5MFdZijL8Ifw3nXDSN3JSotzVggwzEYvIJWNP2/hMv6PwqhxSbOQS6C0mmtKuvG9gTiW
	4IsgkOZOXFFVW97wim+7ihuyvzxMZ8/9DgkQhWmUc2q9N0gwolV84AGSHD7wEFQ2KCAwjl
	EdV8JrKamQjWC7utsTXRFTSdxEofsPc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-539-1CuMsXiONwGBevsjwKdklA-1; Tue, 10 Jun 2025 03:52:58 -0400
X-MC-Unique: 1CuMsXiONwGBevsjwKdklA-1
X-Mimecast-MFC-AGG-ID: 1CuMsXiONwGBevsjwKdklA_1749541977
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-451deff247cso27966125e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 00:52:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749541977; x=1750146777;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YfJbmeC1JvTn/HT06kf5YDIhRSglvHJgoP3BNd+fHbU=;
        b=pJjyYJ5XmgsZAkqlcQsa0pGuy8KPnbuRD4E/uDis5tfzUztdWzW3tEPgi0vLob46v4
         NoS30Fka/u6y+krKFBQF51NcOTJpURNPZMqvOvsd3L+ug9JWym6gMKZdl9sDEVOoHzCK
         tzRoIwfyh3cXgwinOVocbnY8T1HrDj6w5yUSOTPp23tXCP0uMxal4hEg6j7lkkY6H0HU
         YcvK6t0g98iN4KB76Q7yZFgjfdNJbAVBQ39wDsSg4tjPhxIm2CGcZT4+rdOl1OmbD7aK
         BbXyCXBVUidk4oUfsFJ+hC5reCTAsbv2glF+AFldM1iuIYBKHZS6IvaNAWIYZ/UGDnVz
         PisA==
X-Forwarded-Encrypted: i=1; AJvYcCWyFrE9pIMUeiQsfjR2EoYVk71x1JYTmFRWSX3MZ8RmBmrBlqIK52UI67+oBYcEXFBAMeBV3UwgIcpvSQY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxOmYPkpZ6b1z1FJbwKwDKGHALxWlvcKnxJfjWZ/d7oo6W1GXtG
	aQ9pgI/Njzzl7zzbfARCTBpklccoFjjuN339g4v4MbmtoDbnoAc86OLlt1xpKM4vLEllGIDLEv/
	9dflltFzx3y+mxMXjHE3kgA16V6aJcx0FNyloz8BF3SNliCiSk0Im9g4w38O+peo3Rkf1Scs0DV
	nX
X-Gm-Gg: ASbGncuM0tp3MLU5PhMIPgKgT2WFzkuQrb+KROT6lW29pKRog5cRWtNvQC1Ijocvyhv
	NL/ESaCDYAd42joTF5kf1hF5tvpwqCyWpuIJxMHA2tVe0jhSLrHPiHkN9QAsf4flWNah5K0OnmL
	Ns/kkkB9UGJgDqXo8RdRTP9JAAgGlgEpniNH40pdU/m3lU2zu+fPhn35/ExGmSBviWfPMI0TNew
	ncc8ukOO32K62WbXXc/YtG26JVGJakGvr2eRJNHDazB4aTGsqEuJSOr7xxaiOMOGyDs6JyLKDlh
	a1RuoDBZnvWFPC+2oHIeCc+9twZQZpNoOg6Hj1d/pMaVwmItpt1g2xk=
X-Received: by 2002:a05:600c:18a5:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4531cfbb414mr13498425e9.11.1749541976924;
        Tue, 10 Jun 2025 00:52:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzFRaLVCIgRlkTRJdoiByuut+FDskAUpWsggVxSjtysdF3DOyuc2gjLT/go8pbuyxJA59Pvw==
X-Received: by 2002:a05:600c:18a5:b0:43d:5264:3cf0 with SMTP id 5b1f17b1804b1-4531cfbb414mr13498155e9.11.1749541976529;
        Tue, 10 Jun 2025 00:52:56 -0700 (PDT)
Received: from ?IPV6:2a09:80c0:192:0:5dac:bf3d:c41:c3e7? ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4530f7ed8cfsm60280575e9.11.2025.06.10.00.52.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 00:52:56 -0700 (PDT)
Message-ID: <5d71ad12-3221-40bd-a2d6-b4da5e3cd309@redhat.com>
Date: Tue, 10 Jun 2025 09:52:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 09/10] mm,mempolicy: Use node-notifier instead of
 memory-notifier
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Vlastimil Babka <vbabka@suse.cz>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Harry Yoo <harry.yoo@oracle.com>, Rakie Kim <rakie.kim@sk.com>,
 Hyeonggon Yoo <42.hyeyoo@gmail.com>, Joshua Hahn <joshua.hahnjy@gmail.com>,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org
References: <20250609092149.312114-1-osalvador@suse.de>
 <20250609092149.312114-10-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250609092149.312114-10-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09.06.25 11:21, Oscar Salvador wrote:
> mempolicy is only concerned when a numa node changes its memory state,
> because it needs to take this node into account for the auto-weighted
> memory policy system.
> So stop using the memory notifier and use the new numa node notifer
> instead.
> 
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Harry Yoo <harry.yoo@oracle.com>
> Reviewed-by: Vlastimil Babka <vbabka@suse.cz>
> Reviewed-by: Rakie Kim <rakie.kim@sk.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

