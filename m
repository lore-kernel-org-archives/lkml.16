Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A0C417F4F6
	for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 20:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744577263; cv=none; b=sr3Od/xFDpZpNVWMs/kJamuAfuCyvgxrGMVyqu3TMU6iK1c/IpAbLuXeOJB4gxXQtWdUvm40Q+dpdkTUfVhW40Ofuwj84uae89lbGgIuG+Lu0tqp/kXtxjflPL0T6J9Eq2LldkXQYm14C/aQiXLgAzRIbAk9RnRSQ0BJPmzuBQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744577263; c=relaxed/simple;
	bh=ZxV6Pi+8PX4pByzAeUnAfXWcsp2CrPxMI9Dv0pPw+H0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CmqjUHMuyk3TEXFQ75Gkhd2dTV+vjg687jskG1VYDIXYAnR6GdMkRhRmFWs7uhSF0ZWfvrCZVvhry8ThHk2+zpWP/us6VSfviRujRQbmSAY5FtWbbnHBntjQ7pLY1gGr5K8irwBQCSymV39ytc696mlt9y4cN92GU4rqsmDkfYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I+xFroax; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I+xFroax"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744577260;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=VOfRuIaDPcToTYPIFD6cRpVgwBt7bf1MLvia3F0MIks=;
	b=I+xFroaxl0BW8Dcu6F0QQIDz+6XA9HXWZf4eTwELAaV3nf16L9jayLF1YSU9UJOD6djp04
	Ad/7tL4DhLrVrI/aB0GwfVaLF2Q5seeUUqXJuI7lZUrKcplzGdeGiyNLXJQkRKaKxL8qHe
	I76u+/SPhvGQAoWNQlKSBkMg4NzVWos=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-fdsufVInPLiYEeYwFZxBQg-1; Sun, 13 Apr 2025 16:47:39 -0400
X-MC-Unique: fdsufVInPLiYEeYwFZxBQg-1
X-Mimecast-MFC-AGG-ID: fdsufVInPLiYEeYwFZxBQg_1744577258
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43cf446681cso23842795e9.1
        for <linux-kernel@vger.kernel.org>; Sun, 13 Apr 2025 13:47:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744577258; x=1745182058;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=VOfRuIaDPcToTYPIFD6cRpVgwBt7bf1MLvia3F0MIks=;
        b=FAZrWc4XukPdguK6vpEkNxn1aN/t4tZoZ7gjEoomOkq1x3h8ZctIVO9th3DPDILXy5
         dyTNoh1awGQMcL4iFsWE3ts3TErFXtR1uBh6NcXnb2tK0VzdBd+uum9y22fASA3JTD89
         NktpEIc1sbKYK+n06n19+CVQnHa3AhntW55Ed/pWa9eVjTCDwNgGYZ0dMCWSJ7m03nT6
         qvMB+5tVo7LukTaebnxeEfcVqETNzBhbsPNSCTFE8gw6VddPMzPqrIj5tApSn/iIVxIo
         2IYkrrbxgRLlZO1Nhb/D9otQy2/kcmygN+DRyTZTb5OC5ZPB7PiDxmWuzbFwE8Vcr2LP
         2o2g==
X-Forwarded-Encrypted: i=1; AJvYcCVmeYyc2Z7R62PtIB04CouWbjTYbf4zwXRzInWB80XyFnpNkEti4R9xt9xVasi+VrWfw1fmRAaf0iabIAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiNQYK3Wi1JPSPYxdIeUIZgn7h8M/q+bY7E2X0xd7+JEjWjF3v
	tEwSF4gBD8uLntsfmusHZxeuQUB/ULDJhnHdGDgWB245UE/QcyBYnASIhcrCM8Ulo2r2rEmi5tK
	8wL0Mxno5qGpJTCi3tH79iWAVGtiIW3oBTYADj3Z/mL2LoeN3RL3mVmjtAUQFOw==
X-Gm-Gg: ASbGnctgXeqwA5y4LhpNMDC5qcYneMauaPSaA+Q0aSZktsCwG/4Q5SlLkjit7qFXfci
	JnWs/LNc+AG8vDhyrOoo6SUdQJNXNNcCfmtqIuy22uuWEkXaMjw8IOCkUP8+rLaoXtSHTxKm6vW
	wbTY5NxEjlPntsnoYCJbZGYbBG1cY/nDNp8h3B3YN8Tkmij73TIU52CXVmsjEtiqx4swZLqFamA
	XNhFf+ZKiP7OUm4HTjjvFDdydiU2cipWqQPDQIB4S3gnvsCzXSCTgGPDzknMT3HMgbcgT9FAiL0
	7pJnmJoCIcVawF05v6nhQOrUzSzBZrnlotHZl63QwOLo7BnhW7xPpMt8tZiQLH661hO2yRX/7bM
	VuI8xZsqxrozyu7oEyle1wy+vuSx2jjVLZW6UVz4=
X-Received: by 2002:a05:600c:8705:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-43f3a93d9e7mr93090445e9.12.1744577258226;
        Sun, 13 Apr 2025 13:47:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUB9HuoNa5GmFmM0l6VovzSE10DUf4UeGf5tL5bDm4iJzT24xJhxauX7inDKIy1x+D7R1BVQ==
X-Received: by 2002:a05:600c:8705:b0:43d:97ea:2f4 with SMTP id 5b1f17b1804b1-43f3a93d9e7mr93090345e9.12.1744577257865;
        Sun, 13 Apr 2025 13:47:37 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f02:2900:f54f:bad7:c5f4:9404? (p200300d82f022900f54fbad7c5f49404.dip0.t-ipconnect.de. [2003:d8:2f02:2900:f54f:bad7:c5f4:9404])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae964002sm8764656f8f.8.2025.04.13.13.47.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 13:47:36 -0700 (PDT)
Message-ID: <8a270b04-5ad6-41dc-9d97-b228a3f50a60@redhat.com>
Date: Sun, 13 Apr 2025 22:47:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: add nr_free_highatomic in show_free_areas
To: gaoxu <gaoxu2@honor.com>, Andrew Morton <akpm@linux-foundation.org>
Cc: Mike Rapoport <rppt@kernel.org>, "surenb@google.com" <surenb@google.com>,
 Yu Zhao <yuzhao@google.com>, Barry Song <21cnbao@gmail.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 yipengxiang <yipengxiang@honor.com>
References: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <d92eeff74f7a4578a14ac777cfe3603a@honor.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12.04.25 11:27, gaoxu wrote:
> The commit c928807f6f6b6("mm/page_alloc: keep track of free highatomic")
> adds a new variable nr_free_highatomic, which is useful for analyzing low
> mem issues. add nr_free_highatomic in show_free_areas.
> 

Sounds helpful

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

