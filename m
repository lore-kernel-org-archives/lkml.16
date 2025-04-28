Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC821E766F
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:51:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745873522; cv=none; b=S7ZqJttByQ70ao6Ip2zkoc8hjfmzwXhqb8tc7DhAbHxrtTcwfiOq78DmXqAouFZqlRhKZsv0C0gFwypnUpAvAjd3Y7d/hYaWHcbdBMO58AchA2DPAbJsDTen+RGhxxjhD2KucQ8gvtXz1mEICc5Ywti/zsI8lnQ+YYUchEwwric=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745873522; c=relaxed/simple;
	bh=ixwehTVloGmiznSYdDso7usHvoH3uUehr+1KrijfpHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KKp6s17t82Wki4FOr98Ur4M7uvKtlZAo9hC1o+CinTgm7PF5w5djIXL/mroyeRpXNfl7y9xtMxe9R3F+mrDImGp3LdZw96VmTcZlcxUUEg6PISxYdz5k6Cc8hEysr8fm5WOq4JiS3zlMCdBUrSBKvGPwzcnl5uyRvKNs3X7NBE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QzLzYUrF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QzLzYUrF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745873518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=j2bUXPd239Gbe+nQ3lTe/eSsnuhadeHIHUfplu2vSg4=;
	b=QzLzYUrFyZpCoiG+88xf9rC2bhEnAHl+v9Jxke/mKbxIjSmb673sVJktvM8GcZmC/3xxt/
	dSoqZZQ2d3MmlX42o/lMvh4MZdAdyDOoMKDQhuJhSElWIWWjW+LBH69YBULNLJk1SsvwHQ
	jBh8ypOJ26F/ZQFh6zpop3fs0VidI4A=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-638--pJHDk2QMUaC70lip3bYhA-1; Mon, 28 Apr 2025 16:51:56 -0400
X-MC-Unique: -pJHDk2QMUaC70lip3bYhA-1
X-Mimecast-MFC-AGG-ID: -pJHDk2QMUaC70lip3bYhA_1745873516
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-3978ef9a284so1632937f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745873515; x=1746478315;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=j2bUXPd239Gbe+nQ3lTe/eSsnuhadeHIHUfplu2vSg4=;
        b=vkYXQm3hBbYfC8BPiInr10dQQkMPSJUZ4Bz4mDB6AwkdsjedccM0H3vCfFdaZ9yJbk
         kmo+xuPn7Vu8GTXTKdx7tHdxKBWrHk4fPr0cC2HQepuRtT4JBHyY+F6djxeEXNohnXh0
         43iUV54+rgNobKKpaW3M3babPtFjC1voqnFXvFYuvn4RnKqakaAX6OgF8Jf9q02BOp/4
         cOiAVYM2ehObF4FXAS1lPJkwJkokZJqi6c6S3K0watZi2F7RdYA1ULUfhC2V8m8UKF31
         7JKeiTMKL6t3o3qvLqdxDrx350YuyBMy70Deb8k0UeivsJaB//wKbSsQP/gxHqVMsy2b
         224A==
X-Forwarded-Encrypted: i=1; AJvYcCUcWTbacKKjISZWd0PsLh9NjSnt5n/AN80kF4CLLvm+2oUhSocTeVZKfRW10ZWPUhSUfbbzfGEdq66DEZA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7CZ00UaoVAoQmo3M5OX4PqQQnOhAcJQ64++L+8zd7MH8067rx
	R8PMVpVYCUZccnQDuccgRkFVlyq4xbv9UUIBjRtGJh11d4mXhNCzUX5U5BGif2M3mEpKO4qbd27
	//F7koF+6GOJF6d02Q7JbNB2nlwGmhFhYHpWZMZKZg3biy+ZfML/lev/JmRARWg==
X-Gm-Gg: ASbGncuKL9DjnB5ESNBAXDTM2VN3u0IIrH7JxFPFB2KzHDeGQ3XTSO7hgvAJF1dGuzY
	2Exu99N47GXo5NTeRMHkY4m/E7tsrPhfIn9FllsZU8Zq3xJ2pE55/pJcgIDweYMYMywr7DRoZuD
	AQOVDVL95d91NN/arZrHbDWivStf9rq2mBaKGoRUp77rHGqciGdiHIfenk+yyQJDGa79y9NABgi
	lM4j2/EVf6EyQhElMaWHi2jA+JKw1ujYTz4Gh6z8L81MIY8QfI3gT4g3yLjpfQmcdlrEwWPq/qm
	aAVgXFbJZ5yp6eJQPJ340S05pLK4RvLgvrGkUHn4+sDyAOLCEPjjVxGx58T9rVg0b2cngh8v5Vx
	6tTIUDc2tArsWcglph71QasuZZCIQ/MwqSL/VU/0=
X-Received: by 2002:adf:ec87:0:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a07adb1766mr5885054f8f.59.1745873515620;
        Mon, 28 Apr 2025 13:51:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg/ZdNPM76QotVNqWHb1vX5+E7w/bMZCMD5F0ePmlXfZOfXKaNazuQwa6Th8wuWGKYYPw0XA==
X-Received: by 2002:adf:ec87:0:b0:39c:1257:c96f with SMTP id ffacd0b85a97d-3a07adb1766mr5885041f8f.59.1745873515309;
        Mon, 28 Apr 2025 13:51:55 -0700 (PDT)
Received: from ?IPV6:2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea? (p200300cbc72fea002f00e7e58875a0ea.dip0.t-ipconnect.de. [2003:cb:c72f:ea00:2f00:e7e5:8875:a0ea])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a07dbd6ea1sm8050593f8f.7.2025.04.28.13.51.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 13:51:54 -0700 (PDT)
Message-ID: <ced78ba0-8ba0-44e3-bbc7-e2ba82894639@redhat.com>
Date: Mon, 28 Apr 2025 22:51:53 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] mm/hugetlb: Refactor __unmap_hugepage_range() to
 take folio instead of page
To: nifan.cxl@gmail.com, muchun.song@linux.dev, willy@infradead.org
Cc: mcgrof@kernel.org, a.manzanares@samsung.com, dave@stgolabs.net,
 akpm@linux-foundation.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 Fan Ni <fan.ni@samsung.com>
References: <20250428171608.21111-3-nifan.cxl@gmail.com>
 <20250428171608.21111-6-nifan.cxl@gmail.com>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250428171608.21111-6-nifan.cxl@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 28.04.25 19:11, nifan.cxl@gmail.com wrote:
> From: Fan Ni <fan.ni@samsung.com>
> 
> The function __unmap_hugepage_range() has two kinds of users:
> 1) unmap_hugepage_range(), which passes in the head page of a folio.
>     Since unmap_hugepage_range() already takes folio and there are no other
>     uses of the folio struct in the function, it is natural for
>     __unmap_hugepage_range() to take folio also.
> 2) All other uses, which pass in NULL pointer.
> 
> In both cases, we can pass in folio. Refactor __unmap_hugepage_range() to
> take folio.
> 
> Signed-off-by: Fan Ni <fan.ni@samsung.com>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

