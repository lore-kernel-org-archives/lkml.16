Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 179301EF395
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 13:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749043123; cv=none; b=A0Yejhp7V09bNohgnNN1dZdn81WmfmJKtQ0ypy+5431lADE5Xs2/rnJ+LCd2K7mdfzS1nc2fiNIuzLdLEwV5+shD9kZ/wkK8c3m8Pf2g0hIp0qw6kHdk/omJzpo8EYUspLH9MdC1skfkHQALq0BBwj0cm/kh2dk1r3kkmNwAUN8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749043123; c=relaxed/simple;
	bh=/3x7uwZdl/fTKAxZ0w677n7UvUl4il0SIM7VH2HgL6w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=igCHtnLMpEGU84EaEAEQI2wiJUTnu3Sl9UOSMBbONYjAFEQi2Zr4cC/OU+aWuIAZqnfFX3PMTmsWP34oKR8ravBnmlTb66sl8hJrWD9nJqO5HKyyiZyeSXIGiAfn8ThBShZbhTv4n27/4Mo8ICL9sOsVvwWttYumNh4bfKwX+hE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IMCSsdQ/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IMCSsdQ/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749043121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=SZa9ayxPX+A9sGdRoYwE0fohcr1S4qdvcRO7qpq+ggo=;
	b=IMCSsdQ/QH3SCwsnb98gsglhu+p56RaE5X2Kv9SqGjduKWJfQ64irA8xo4W6CW/f5kV6tL
	S9E1ANCnI1Nq7l4vvxr491KV5wpDXvGCKKOWsMmv7Bey+dFCXAF8MTZx7wHtnqBuN8dgOt
	G7pTrOCm5owIqdl9tCi3UEV3ixxM2II=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-538-Hawffx8vMamX0aI5RLndig-1; Wed, 04 Jun 2025 09:18:39 -0400
X-MC-Unique: Hawffx8vMamX0aI5RLndig-1
X-Mimecast-MFC-AGG-ID: Hawffx8vMamX0aI5RLndig_1749043119
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450d64026baso30204485e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 06:18:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749043118; x=1749647918;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SZa9ayxPX+A9sGdRoYwE0fohcr1S4qdvcRO7qpq+ggo=;
        b=ptDhXOYSpCIGwtHl1Q2VZj3HhfVXvi8H41Q16a7z7kbsihOXn0zTj9JyR+7VhcE19e
         LO5IfDbK254OH+NbteWM0dr5X6noT64ksehIj8Iw3QUL0oGjxdYnNl+VmGK3Rt4mfWQc
         fYkB2w0KxNAnwRIOE/fqfeiWcHah4tgPdOnLDFeYY7VrMWqItzVaRLH17LlZ+EUN1Wtp
         Bl0c3WWF/UoUWDuqh19i1xSbwgMlKCjafeb2NNIUfIc0GXnTQqsUNmu1+p3TZn/Bp5Eu
         eBVlxpbVNRsAva14YAZp/BckjV1a9ZxGKOMVXvHFml80ncFeriWzk1eX0sd1mdZTqRHq
         +VPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSROAjc3Fk3zj022CKSb+vaZx25o+4ze3o8P/a+lJQVnVX6truUiUKL1H2BeD5WhsRRmpHaIJ0qvPRg9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJMzCV9OxjrU3XqB4JF2Hcrx5RqLq6tpqx+8OspRBc15fAxa3M
	v7HkIlL7vBdQA1bfZIPZZeQbtfKFo3vzQZEZdQeRdG+imKKTGPs8Tud+yiMSBqv/SXGCN036ypr
	L2O2SIwQjPMJKSbH/+MQ5T6ddNuME9KoS7lAnjM2GE+UggdOrXLR0yo4SOrvVIvPr1Q==
X-Gm-Gg: ASbGncunhht4uTmJIpKfZ0aSR4Nq9TLbo+hujlKrQP8kJBOKiTy+27gjOm93rFvLTSE
	fTqdNasktDd9FznyBJjDUbkjSIbLz/KLpOjryeyL4IBfmbIEyC71T+aUlckSdwjuaZ7DaHhHvkg
	KCfqGfrkae+VNIsaC5laIMub9pH6/rOMWiI6t/Tv33FeL+hjuoTsKQ2Nao21N6FXzKElu/dEa4K
	NaFpEo/MknT4Dp8X6RcFvJUV/tlB/npGwDYneUrcVO9K09BeYWHWfz8sX1D/EvRmLW9eWG5V9tV
	s0TZjmhjMiaZk/i1QE6eEGRY2cQizPWEvdULm0OXS7bDTRzxkGzEAD9FUc/omfbr/yblmhlICZN
	MNdFX3NX5lGaKxRcMMjqmMwXZ4bEcuyZMkGxVCbE=
X-Received: by 2002:a05:600c:1e06:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-451f0b11269mr24201185e9.18.1749043118640;
        Wed, 04 Jun 2025 06:18:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEORIs0iZRIpHmf5ltHJn9vctaCccXZH8KNjN4ts0ZEu00VRw+ucT7Sszbs3AFBzCsYhZd15A==
X-Received: by 2002:a05:600c:1e06:b0:442:f956:53f9 with SMTP id 5b1f17b1804b1-451f0b11269mr24200915e9.18.1749043118264;
        Wed, 04 Jun 2025 06:18:38 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf? (p200300d82f1bb8006fdb1af24fbd1fdf.dip0.t-ipconnect.de. [2003:d8:2f1b:b800:6fdb:1af2:4fbd:1fdf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a5233b0723sm1074178f8f.86.2025.06.04.06.18.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Jun 2025 06:18:37 -0700 (PDT)
Message-ID: <830b10df-f697-409d-9ec4-37bc0196cec7@redhat.com>
Date: Wed, 4 Jun 2025 15:18:36 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: gup: fail migration when no migratable page to
 prevent CMA pinning
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Hyesoo Yu <hyesoo.yu@samsung.com>, janghyuck.kim@samsung.com,
 zhaoyang.huang@unisoc.com, jaewon31.kim@gmail.com,
 Andrew Morton <akpm@linux-foundation.org>, John Hubbard
 <jhubbard@nvidia.com>, Peter Xu <peterx@redhat.com>, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org
References: <CGME20250604095242epcas2p17032a1133b03be2d24c8ebcff94d1d55@epcas2p1.samsung.com>
 <20250604095049.4052078-1-hyesoo.yu@samsung.com>
 <fa9d72ac-1b46-4a09-8f29-af97f2ca6e2e@redhat.com>
 <20250604131158.GA17991@ziepe.ca>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250604131158.GA17991@ziepe.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04.06.25 15:11, Jason Gunthorpe wrote:
> On Wed, Jun 04, 2025 at 12:07:21PM +0200, David Hildenbrand wrote:
> 
>>> Instead of retrying, this patch explicitly fails the migration attempt
>>> (-EBUSY) if no movable pages are found and unpinnable pages remain.
>>> This avoids infinite loops and gives user a clear signal to retry,
>>> rather then spinning inside kernel.
>>
>> Hmmm, that means we will return EBUSY to the caller. Are all users actually
>> prepared to deal with that?
> 
> I don't think anyone is really prepared to deal with GUP temporarily
> failing..
> 
> Kernel is expected to sort it out. We tolerated the existing temporary
> failure due to its rarity and lack of a solution only.
> 
> Either it can be gup'd or not. There should be no retry.

Right, so -EAGAIN should be used for now such that GUP itself will retry 
and can be canceled on signal if required.

-- 
Cheers,

David / dhildenb

