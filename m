Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862191F419B
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 10:46:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751626020; cv=none; b=aBN99fRTry64BkMfG9gxf0kRQmAYzdYtRK8mBRipWYoQCrLeqtSMjzKdzBP5W6Vpowsj+3VbLmhUF8bPOqNb1GGvDKfEOqbrbnSbCGFp+p0kYjhes10p50yvz3BZy5QEstwn6vdbSlN1ZeFZCabajCo+cEsrX7IpVilNHWjKKps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751626020; c=relaxed/simple;
	bh=LwpbUOOi9a1Tkf/5E5Irs0Pf5SHfW34gxxArrqXeHjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gKRzDP311VXeDXiObd5FvC+7skd2QqGbHB3umLWXCjN4Us8iumjWcRhE9Ss0j/8psr8xUsY8mNdhZtir17LTHO9TlctxXY1aXEI+3QYf5aq19GnyS0IoEF88gkaeZEAqCTu/OD2N5q9wQmagCqqSHgcYF3y+/R0vAtc9qSsisoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R4IWo9ZW; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R4IWo9ZW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751626017;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=aM0lOK2EdqhK/MwINbgFdS/3GfdbpkWlUgF2GD5LjP4=;
	b=R4IWo9ZWK/AOA6RNefWZntu7JA7TSmz+GoAphGC2IrwV2DTTnWkncNA+sBSrcpCacvrKxU
	AlYWCJ++eesR+4IqO1Js0xAZk3b2/7djDCPT9OjF9MCFEYS4R/BVlB0JZ4sGT0QP7AC1NY
	Tp83Rv+o3noyryWQGuRk+iGwpKXL5uA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-212-3zbUnvGlO9WxscnMM2MmBg-1; Fri, 04 Jul 2025 06:46:54 -0400
X-MC-Unique: 3zbUnvGlO9WxscnMM2MmBg-1
X-Mimecast-MFC-AGG-ID: 3zbUnvGlO9WxscnMM2MmBg_1751626013
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-450df53d461so6369215e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 03:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751626013; x=1752230813;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aM0lOK2EdqhK/MwINbgFdS/3GfdbpkWlUgF2GD5LjP4=;
        b=c7LH56p44W/33FI2hwJZyi1MyVE0JW+mRnGn2sLsLvN+ny2IJqNYR6vM7R43i+YAxV
         NQankMHv6p2Uvko5ap8KTCK01CNR7CaWZJJiMIcJjEdwmVCZnhtLmSxdGTh6tL3BOorg
         7LHflADeaCwdeWW0JB5ZH/Rp/cCkLNjzYIqPlLa9f8FRJ4orsAf665JJcrtu8Y7hq6/8
         X6wtA9wi8BlngdFb2541JkRmviu02bx+sbujcJQ5CEVFKNLcjzY1trcaTwvefF+EX3GX
         3aHpTXswc1C0TxkIKA2sQ2HUUE+bmMZNJ2WJkFjwdJMKrW7QSwv8g3HJ9f6tRwbbD358
         Q3ww==
X-Forwarded-Encrypted: i=1; AJvYcCVycU7jZ6DI20jfdkWaXyi27fiVUPr+4zLzlzXjg5ePjk81u6odV8nC+VjLkiWBe+tn3ODzArTsCvlHmPE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDVnVq1/IYOnsahE8chIzQiF2aaHYEYbeNvRCGOQSdMzAJoHmC
	WisKg0k8OIl+p/L6rEOZ2Nu5sLPt2l92AulmURkrNOeusZauSJgfBQOWauVWxx+fFcGp1Hl17fj
	aS2gfw39oTMOQQt1aSpl/DRs64q53u0Sz20aDj/AMDg3Ktj+PrtAyxQacNfwMcwlmhA==
X-Gm-Gg: ASbGncvq5nl1929IXQ4mi0EYvK4aCmcPq8D/q4vcK1jTiPVfJRsDsonCxiDFCtYGntt
	qUfVhN7NdjXSWURf+ZPwxONZljTkixK2NDJMtBjzFCu0n3LiDaZy9v6xxevKNQ9cEtsQSlRoe7N
	dIN2FJGOe4eEF44Rr5lsn7HBZHxJkm1hfKYM6hBwk7nAr1IfmtjLexQDMeqRzNjJ2he5ZElHXgv
	qJD8Qrc+Svr0k9WMDiBnwooomVNdH989GYRn7xIp3TKieEBzYvlygBVOnlxSdfUYoAyGHIPam2/
	MV9bTGSmtP+jlzTPJcoWerbP3lG603Bez+OYKZztDORS728xj21tKB69hJUa4kjYrwVtKl0DiPP
	pLxZ7TQgR26md3YmF3xxEzwkDhSjAzgOoIfEDVJZncZEHzMQ=
X-Received: by 2002:a05:600c:35c3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-454b306a18dmr21949935e9.4.1751626012944;
        Fri, 04 Jul 2025 03:46:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzuCo5KQpgtydk+2PCg7wstPFqQNO9VlInp//VgtVlQ4u16Sq+FiyJKm2KQhZjVVnU9NJz/Q==
X-Received: by 2002:a05:600c:35c3:b0:43d:45a:8fc1 with SMTP id 5b1f17b1804b1-454b306a18dmr21949595e9.4.1751626012525;
        Fri, 04 Jul 2025 03:46:52 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b188d8e6sm22746705e9.36.2025.07.04.03.46.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 03:46:52 -0700 (PDT)
Message-ID: <3184cd54-416b-4456-aeff-0d8165beffac@redhat.com>
Date: Fri, 4 Jul 2025 12:46:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] mm,hugetlb: rename anon_rmap to new_anon_folio and
 make it boolean
To: Oscar Salvador <osalvador@suse.de>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Muchun Song <muchun.song@linux.dev>, Peter Xu <peterx@redhat.com>,
 Gavin Guo <gavinguo@igalia.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <20250630144212.156938-1-osalvador@suse.de>
 <20250630144212.156938-4-osalvador@suse.de>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250630144212.156938-4-osalvador@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.06.25 16:42, Oscar Salvador wrote:
> anon_rmap is used to determine whether the new allocated folio is
> anonymous.  Rename it to something more meaningul like new_anon_folio and
> make it boolean, as we use it like that.
> 
> While we are at it, drop 'new_pagecache_folio' as 'new_anon_folio' is
> enough to check whether we need to restore the consumed reservation.
> 
> Link: https://lkml.kernel.org/r/20250627102904.107202-4-osalvador@suse.de
> Signed-off-by: Oscar Salvador <osalvador@suse.de>
> Cc: David Hildenbrand <david@redhat.com>
> Cc: Gavin Guo <gavinguo@igalia.com>
> Cc: Muchun Song <muchun.song@linux.dev>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

BTW, these SOB are wrong :)

> ---

Nothing jumped at me, but it's all very complicated stuff

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb

