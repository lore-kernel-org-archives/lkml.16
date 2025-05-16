Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA260218ADE
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 09:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747387143; cv=none; b=oEktaSdSo1lz6wCxfULnrwnrXZsLJ2AyHCj3vT2syDPGuCowVyN/uZhLztOVuJMC9Khs0PUaXpBuQYAf53hegWZH4xQk68dM9/SUIVJ/clh7LqmWk4Fv0F2MrVPDie2EFsOntVZ821NDEq8u9q38n/ReF+BrShZfOitpORnDKP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747387143; c=relaxed/simple;
	bh=GkVWeGkx69YhNRPyZYnFt5gBdg4GMFnc89KN8GnPwgM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OgBwJCZJmXuoOoM3PY0wNj6GnZLxEflAXYviWuoCpLTS/EG+6XhpqLBx+hd1i4i6L/d1XiM0Lw64P0j8mgJqdHCO0hJa+xbpDMMjdrsr7RIMBKKhoFCwRuUI5x/aaW11ytGHoV92vY+q6RIO0VBFqX9r00D17QNEEXyy75sZcmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Vmjj4754; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Vmjj4754"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747387140;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+jM7R5cB1X/Hhu5ZTbBeg1lPKvgel12L6JDjfnk5wA0=;
	b=Vmjj4754FtYXYIey3Zx94kpGJfriVot/oCn9kFcLZTiMHXspruZhV61YtF8r90CX7nMENl
	cZt04asq24Y2T7+oA31kNbfdNLLBBmgEYNN4+g3XYA+rBTFxVGd4wW0pik+dNCO/LG5qMe
	z57fqi/f7NQizcUmmM1Af/0PsL+j7WI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-652-u89Okz9aOOq3Txy8igJ_XQ-1; Fri, 16 May 2025 05:18:59 -0400
X-MC-Unique: u89Okz9aOOq3Txy8igJ_XQ-1
X-Mimecast-MFC-AGG-ID: u89Okz9aOOq3Txy8igJ_XQ_1747387138
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43cec217977so11004415e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 02:18:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747387138; x=1747991938;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+jM7R5cB1X/Hhu5ZTbBeg1lPKvgel12L6JDjfnk5wA0=;
        b=uxhy/zvemvItsKZW20FxkhiVQllKhxSSBLqJta9nBxagxYbBwxS0emGVSIHjp18jVa
         lAgOBm7jmhs4HvoTW1JLDchYldqHc/BOIoU6mONlrNKAG2bmEDVYxLCZtPzGeNgdaXvA
         kxn20U/Hq7Vr4lnWuskYBy5J03+VmfgUXqi5lbUklUFafh1K1rPVFflX+hVyRX14+pO3
         y26+tJEzM2+OnnuPSKcEcQ8GKFVU6gtISDDKEldH78d3Wvi+7Y1klwo5rpZdS5VPht4L
         8toa9+7P3PcL27i8+jeqUkn1udv+qyaSnQGbgLyffu/luDIadFmbA2MQdt01/ikTPdSg
         R8Dw==
X-Forwarded-Encrypted: i=1; AJvYcCUmx051kM40P1XvYYamBnzpXRstNkYVautdteD+1MXO1F/0MhwM3vj7vsk/iRl+LFeV/TvLYtOkaBTAaF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHLx5xNb0p0IkTOLTQZZKesiWu+12o87QD8B3U36q3ggHx22U8
	iOmgmGB81U3tL7SyTZd5vKHYrApL9N7cLFjzUvCntSaqcv0VZK2LiWaH4JmNcd7EXWDO5EpDKjt
	ywQHM2PZgESXfh8avwDhhheLjvS3lS6YYxz9Dbt2YNBcfGigxTKnLtoOy3lDK2s1WSQ==
X-Gm-Gg: ASbGnctWKamEaDZWbSHTevLlKa1aCMyULWjS7PRDZIg+5k57u39d2euvNxS89X/oms9
	Mbwaq8m+GOYlN5JLlGN/d2HWmtvCN8QCM3vX7wOiIc+GOGFwPbUqoKD4pI+wwiMYffel4w/rNCF
	PDEYt9X6Tfh3+2xtovxrLndhighJ+faIlyMAVBDvPWf8Ebdqq8L/8jQ8qwi5cX6g7YTQ8WYFW37
	hWe+WMQ9CGwasxYHOaxiblt19Ja8nA+yZ8NSYofmmGHzL+1w04Gbd8H6NMoRD9nAHlFWRl1zDez
	tChhFC+YBHqBI6VQj+c0xcqRJzfUFLQcsJuUuqd4TSPOM6q5grmXeDcIjH2xBhCgtXREjWf2EKW
	iLbe/YIuzIMC9fVJsFqZzUOwp4lYTIBcVblQrXmw=
X-Received: by 2002:a05:600c:1e1c:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-442fef3e822mr20179715e9.0.1747387137972;
        Fri, 16 May 2025 02:18:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGu41PMhn40bMFMs9KUgi+ojtEQmcb0pQkVNj1wAqaOxQi8O7rZ0vMMF9SBmpohZ5LZ82I02A==
X-Received: by 2002:a05:600c:1e1c:b0:43d:9d5:474d with SMTP id 5b1f17b1804b1-442fef3e822mr20179345e9.0.1747387137555;
        Fri, 16 May 2025 02:18:57 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f47:4700:e6f9:f453:9ece:7602? (p200300d82f474700e6f9f4539ece7602.dip0.t-ipconnect.de. [2003:d8:2f47:4700:e6f9:f453:9ece:7602])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ebdc362fsm89885065e9.1.2025.05.16.02.18.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 May 2025 02:18:57 -0700 (PDT)
Message-ID: <2e81ac64-5459-4157-832b-ddd5ed451f4d@redhat.com>
Date: Fri, 16 May 2025 11:18:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 4/4] drivers/base : Rename
 register_memory_blocks_under_node() and remove context argument
To: Donet Tom <donettom@linux.ibm.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, rafael@kernel.org,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Yury Norov <yury.norov@gmail.com>, Dave Jiang <dave.jiang@intel.com>
References: <f94685be9cdc931a026999d236d7e92de29725c7.1747376551.git.donettom@linux.ibm.com>
 <bb7bbc113a2f6d3b700f7e73eafd911f77748bbb.1747376551.git.donettom@linux.ibm.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <bb7bbc113a2f6d3b700f7e73eafd911f77748bbb.1747376551.git.donettom@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 16.05.25 10:19, Donet Tom wrote:
> The function register_memory_blocks_under_node() is now only called from
> the memory hotplug path, as register_memory_blocks_under_node_early()
> handles registration during early boot. Therefore, the context argument
> used to differentiate between early boot and hotplug is no longer needed
> and was removed.
> 
> Since the function is only called from the hotplug path, we renamed
> register_memory_blocks_under_node() to
> register_memory_blocks_under_node_hotplug()
> 
> Acked-by: Zi Yan <ziy@nvidia.com>
> Signed-off-by: Donet Tom <donettom@linux.ibm.com>
> 
> ---
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

