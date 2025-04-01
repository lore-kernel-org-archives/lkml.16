Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A4B2CCDB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 08:14:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743495287; cv=none; b=I/AfnK+maAG6XCosc2Caww8G2TPYqcXtGGdGZ5LsA49ZhFpMlqzTgQ7Wmya3Fey6pSYL/vHkhnkoEU7bIninztW/dgL0N/SvSodOH4rxyEXdJ8C+abWW3Ya9n4uauWgxOMd6eEPbS/2VIRvzIawRVdUvaoWD5DfZ4zPPa/goXqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743495287; c=relaxed/simple;
	bh=4s7vULaN9rSgdO9p50hweE6LF+ECu4rJVDl7iAYGeYk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkmjyWZiZH4poQO0zEpj3M33oyv+0VYyAf7UrZj2qXMbDpXFD2prrP3sbccybKPGA3rExPFbRUdYVudQFhQjFGpuNg28zvS88SxvVX0JHcLeSqn+4Ob4TutfHyl5F0PCaSKphVPcJ7ZIt8X3PD5Vf8iZySHpNNxvHhNlmKW/osg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IFbugVBs; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IFbugVBs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743495283;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=ZMrw/hF4iYRv8xEz3Y+x6UfdccDXIACsT6AaEq2CDuE=;
	b=IFbugVBs8ynOgoCFQlrAveAEvU7ze8SFtWJ1GfPM8PeX8daXiY3evJSIPDhLtio7Gt2hhN
	27NrSZILkXc0ajfJwgOlmkqtLfY8ieEWKdFcbWPVKU9XnA4iNERvp3U6oUbJPmsAv9gs5g
	Wdn96cVU6b4d3R4SsMyKJYuLscqDzxM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-621-G1pg5d2NNxOKSE9wMYONnw-1; Tue, 01 Apr 2025 04:14:42 -0400
X-MC-Unique: G1pg5d2NNxOKSE9wMYONnw-1
X-Mimecast-MFC-AGG-ID: G1pg5d2NNxOKSE9wMYONnw_1743495281
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf5196c25so25255375e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 01:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743495281; x=1744100081;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZMrw/hF4iYRv8xEz3Y+x6UfdccDXIACsT6AaEq2CDuE=;
        b=diRPG0EvcsxLBJ+vzph/mQo2ZrYptxSU7j6KtTRN1PdsDX+zNubNXnHfJdFwM5o6oR
         7W6IePK06KA/b/E6MRSDzRf7ZqnEHAWcqrF03A5rgxwLS8LvIYrdBRzwkci5YGILmILd
         T0zxZASAeVDxDqfOdc1hLDWn8PBCg4pMsTNwfNQu2qJTw6xl6CBygrOqiuUBqmxw5YRh
         8QF94CxtK7WJkZV9FKQq+u66IGuU+kmz+dI9gmHBVbA1P+XKfuoB2pERUTwi/goyy774
         qFNb3YxQx4Dx3wN08mvrZXaPsc59iR69B7Kik9TBAlM+0Xam0ftyXIEd7ckoF2P9AhuD
         AgzA==
X-Forwarded-Encrypted: i=1; AJvYcCUjVyUghLdz2xMQ5nZfVH+MyFDWAPIsR27sZTyahYv9+1MWs5gnPn+v5bzjIiAoidSJAZJ/g8+1tQEc+b0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL/ewU9ktlxk6O8iXvqUQb08T+463TWi3tFrP03sDFhMJsy7hk
	pCNHw3nPZ4sU260GY4lowqN95udq+SAQ+jGvat1L1BQz/Df6jSKMEgK/k2Zo/Oj7OjQdF/Nf+Jl
	/Gl6HTTu7QVlF/zaw8HYqLBdZar7ZxyOv2IqudLDIVuJIkKCJeJ80/sph5m+beQ==
X-Gm-Gg: ASbGncvBO2ujMSPA8c8Squ2taBv15Bdx8CubFnSFra72R+E6gclwDhaN3XEILSN7mm8
	c1uBsCQ4W3YWJCCIvtFJVjvAvOStBvhZoGZLqYo1yVjYDHSUeRqMGv64f8d3Isxzn+ikgD41mqJ
	TZKmu9hwlcqbwiYwt5xjjo+l62kmGCP6FUZH+ZV2jfNF0ddf/fWtUSSJ4Be9CfQ7GZjKke5YRlU
	htDtx7s3RlKlf7OPHDY0bMvIT32DxhmjWk0Ahid8GJPEoxdcD8TuIVjGP7YLxGFnfvoKIIVzuBF
	BOtbwK7gvQhiTVTrlFESgh1fsYYQeE+YPBIatJSMFzvafxXLb8NdfMyluwVUCqROU+1Pd0U4KFn
	qrKnWegel7W/ZybsKd3l36VUwj6vHLPSq6SofDKOQ
X-Received: by 2002:a7b:c85a:0:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-43dfa59cd30mr76161235e9.33.1743495281284;
        Tue, 01 Apr 2025 01:14:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPD6Zz8lOr7UQtRkeT40hSJsdY+e1kLD46TaF45a3fZZvcvdNjyBA+fg2ymnWHHAcglU+MXQ==
X-Received: by 2002:a7b:c85a:0:b0:43d:fa59:cc8f with SMTP id 5b1f17b1804b1-43dfa59cd30mr76161055e9.33.1743495280936;
        Tue, 01 Apr 2025 01:14:40 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:4d00:6ac5:30d:1611:918f? (p200300cbc7074d006ac5030d1611918f.dip0.t-ipconnect.de. [2003:cb:c707:4d00:6ac5:30d:1611:918f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82dede5csm195587865e9.8.2025.04.01.01.14.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 01:14:40 -0700 (PDT)
Message-ID: <6203a9e6-8dc1-4b36-aa2c-41c29487812c@redhat.com>
Date: Tue, 1 Apr 2025 10:14:39 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/7] mm/gup: Fix the outdated code comments above
 get_user_pages_unlocked()
To: Baoquan He <bhe@redhat.com>, akpm@linux-foundation.org
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, yanjun.zhu@linux.dev
References: <20250331081327.256412-1-bhe@redhat.com>
 <20250331081327.256412-4-bhe@redhat.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250331081327.256412-4-bhe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 31.03.25 10:13, Baoquan He wrote:
> Since commit f0818f472d8d ("mm: gup: add get_user_pages_locked
> and get_user_pages_unlocked"), get_user_pages() doesn't need to have
> mmap_lock held anymore. It calls __get_user_pages_locked() which
> can acquire and drop the mmap_lock internaly.

s/internaly/internally/

But your statement is wrong. get_user_pages() must be called with the 
mmap_lock held, because it sets "int locked = 1;" when calling 
__get_user_pages_locked().

-- 
Cheers,

David / dhildenb

