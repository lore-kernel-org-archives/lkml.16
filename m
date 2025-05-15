Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE277260C
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 14:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747320267; cv=none; b=C+lnux8sqxUuKRsHm8Dszv1cVrW71la/m8lcKSQqefxENNMrDiYK3BUM+9+ztmEb/oWvy9G6lJSG5f4s1H0hk/zOf4dv8ZdrNHmKcPu1mCHGKISetR0mdV9SlVF9aFQpmpu73bPP4gznaqNndTdMv7gpaboP/dhSEqxQQO5Sn+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747320267; c=relaxed/simple;
	bh=XndAmvLs7Md5yryWyE+MeSTW5FZfARCB3RiOx+fAink=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwpa+3i0zUUbOunPId0mjGH/ENecWrmk9k48ehdMNHBSe6E5USwP0zYoXapu93MYqX+DzVHpGtytKeifrr4e+AZFSMEE8hd69eCiT2mU4LLLGxNGSVc+GNVQJGNmI/Zpo/9i//8fiS3W5n668lNHLPSUAe5jagoVX90RTxImrhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=FFD5h6vm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="FFD5h6vm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747320265;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=47Ethhwe7Yg/SKmcZDpNHtA7JEF6nzuW/BbtcFNl248=;
	b=FFD5h6vmGK9xUsAkcP68Lw++yL5n+p7DyZ/w7Ya+JXk7t7KWRdUQALbIjBnidN4V+xLWH9
	5iNtMiCDgqdL+R+a3KcNwwNIIGqM9akpgiVE+kvkGD8rmkg0zQg8xKH6a17llfjLi+t5G0
	NEjmRWuFoltEb6ZuD7Sfk4a6f6SQ81k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-388-plKw1kD0PBGog4pQID_vxQ-1; Thu, 15 May 2025 10:44:23 -0400
X-MC-Unique: plKw1kD0PBGog4pQID_vxQ-1
X-Mimecast-MFC-AGG-ID: plKw1kD0PBGog4pQID_vxQ_1747320262
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a0bcaf5f45so499288f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 07:44:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747320262; x=1747925062;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47Ethhwe7Yg/SKmcZDpNHtA7JEF6nzuW/BbtcFNl248=;
        b=PZMXa+HQwU7t++5/vHL5bN2MDZjyIj/4Yh/RS0Q2fcXc67FvcbcuRP2xMwB3ffsPBL
         57z6Cgy0vsVeI+BCV2GAsJBUB5sZgX7BJ/UBcxIwewAbdSOsX6gz28LC0Bor9zeyKQ6U
         GERD3z4K1+mstGRCft9a5Yv37bdcbLjFg5Ea+mCdUEtz0+M+y6tcrOgF2olHb6yIbKVE
         zG7WE0pv0WWW0AuBqaMVHeaey+oHJMsZSyRuDKhfKP7OSchMe9fHoqmQVuqIUHrsM6Te
         ibLRyg7gWSPYJsq9pFsQT6AtOXW9Hd4Jp/19Yeeo0SFxLhmIpTrYKnTg6TrIp5KtHFPD
         aUFA==
X-Forwarded-Encrypted: i=1; AJvYcCX0tljoWsbbapnL15CvKnibImsW8kKDv499/QvBj8wKiW3+KAnxcNJANmsO4MrQj9poLdwoC1/JepoPJNs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwjSfag3s3jXePjUgT95vHok8TW8XJkJ1r7yVuZ5KhWt+6IBh
	Ugbnyt3c2cf3V9jPmKIFcDFQBSOIDsiIC1OXOsrZFnaSHo5VJd6SOVx1TQThKTmEgPes+V2zJBJ
	qjpCkaBHjgee7T8sOBdOrY+Eb/OoMz94jllbWB2FwzqQvj5rmwa20zJnodNOI5w==
X-Gm-Gg: ASbGncsTKpezMWOoRjUXI6F4QM2uVPd7aSZPh7Is5hJKtMLFiRZWVYd7UbdSx9Y5kED
	Vn54FSgVcq6RePxf84wOcDj/jHzVoDQIqHuknJbJo8AtCMh6G0mQxkdhGAFHPLy2NpHktfaIuci
	RoR0MyzMnpTc9Dlo91KEguhdAFBc8kB5pgKVR0/nWah3FJNvKZ+QE43Bt203ZjmAopvoUa8KM14
	fI8PgdDrmF2XL2Z+BZ635Dv7yE538VBAzHpd/EGEkMbTGiRUwgK1HPTagZl+JHCr19GkSK1MR6O
	ig0qBr8nm/cHoIFt0k4+5e9W3ZnKQZiZwBHiT1HMpNgrNNrKNp91eyyh9vPHy0GiTGIk4elzVlU
	J2Du4SfmABXz0gohfKB+AYGzoIAvIbJcqDAFvFaE=
X-Received: by 2002:a05:6000:2901:b0:3a0:b63f:c88c with SMTP id ffacd0b85a97d-3a3537b38b6mr2368815f8f.58.1747320262373;
        Thu, 15 May 2025 07:44:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEuxvTGjfAdX96n/mYK/XcpYvR/ekuTFKJTKHVuS8gleJbPDTcRR9TMwoJSfVwt5tLYfHzIyQ==
X-Received: by 2002:a05:6000:2901:b0:3a0:b63f:c88c with SMTP id ffacd0b85a97d-3a3537b38b6mr2368790f8f.58.1747320261984;
        Thu, 15 May 2025 07:44:21 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f4a:8900:884a:b3af:e3c9:ec88? (p200300d82f4a8900884ab3afe3c9ec88.dip0.t-ipconnect.de. [2003:d8:2f4a:8900:884a:b3af:e3c9:ec88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57ddfd6sm22497356f8f.4.2025.05.15.07.44.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 07:44:21 -0700 (PDT)
Message-ID: <2d30bcce-6f80-468f-945d-b63eff726db5@redhat.com>
Date: Thu, 15 May 2025 16:44:20 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] prctl: introduce PR_THP_POLICY_DEFAULT_HUGE for the
 process
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 hannes@cmpxchg.org, shakeel.butt@linux.dev, riel@surriel.com,
 ziy@nvidia.com, laoar.shao@gmail.com, baolin.wang@linux.alibaba.com,
 Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, kernel-team@meta.com
References: <20250515133519.2779639-1-usamaarif642@gmail.com>
 <20250515133519.2779639-2-usamaarif642@gmail.com>
 <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
From: David Hildenbrand <david@redhat.com>
Content-Language: en-US
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <c0af0eb2-d10f-4ee3-87dd-c23cca6cfd1a@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 15.05.25 16:40, Lorenzo Stoakes wrote:
> Overall I feel this series should _DEFINITELY_ be an RFC. This is pretty
> outlandish stuff and needs discussion.
> 
> You're basically making it so /sys/kernel/mm/transparent_hugepage/enabled =
> never is completely ignored and overridden.

I thought I made it very clear during earlier discussions that never 
means never.

-- 
Cheers,

David / dhildenb

