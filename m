Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47ABC275842
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 17:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751477973; cv=none; b=lKtZ5KfsJYHFFqVDqQs1uAhnqd2BxwFBBHB7SPZwLKCDq1GbrSJYUra14TEFaeS/xjABopv2FYcw5S7YVMF8p7oWdMMRf4xvE4ZrCRukPq8gQG3ufzBcrKh9kwXi0OODYJW/6zSIasHTN/YBFZi/VAvGZrh4gDMi7oJcTAKHoZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751477973; c=relaxed/simple;
	bh=CZcQ5ZH672Mn5l62KCXieJ80LuZsdHxnYooXJ+VI+zg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tcX0vM4LfjIurOGRRIG0FiGbWpQZaTw8NUm7LPjbyt7s1daxg3h0M11vRdbeOmoclFshreAds6SgGw/g/7si3OOulMEAvnCkdXpn7fTBRCTexs4erAInZPHgQjuaiYIP/TiYeiMSCXXocKB75Sk3DDzm7FtG4dbb5hbRC5Jqry8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aKVuNszJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aKVuNszJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751477971;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gXYdOu9t/2c4Smnfi/pWqiq/G6JiiyTeh/9ILHeGg34=;
	b=aKVuNszJg5zx9eRsbLhqxYSOjAK4503Du7JWDvI6KZLlGjTfZR+KZajT5VL7l7B2xa29D9
	QHn21U4xJ7iGhUACZL/kjvl4Hjjp3GTFMrcmY+cf64ccPeE4/zb5BE3l51xccT9GyJiAq3
	OW3CnnJ156BHBRNEx5TmL51exz2Lcak=
Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com
 [209.85.167.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-494-BxyS6fmIOaGCuUMJZw3KxQ-1; Wed, 02 Jul 2025 13:39:29 -0400
X-MC-Unique: BxyS6fmIOaGCuUMJZw3KxQ-1
X-Mimecast-MFC-AGG-ID: BxyS6fmIOaGCuUMJZw3KxQ_1751477968
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-40b0a248ce8so4189202b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:39:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751477968; x=1752082768;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gXYdOu9t/2c4Smnfi/pWqiq/G6JiiyTeh/9ILHeGg34=;
        b=Sy/LoXy5f/Hd1rZgW/cW/LUMV+BMRVUxmMi1pHdeJkATxC/Cw9Ut0xRPYxoHPh/L16
         nvmw2vKDYfKuAMmlBz8rhQAOoYz/ilXyf5r2AMTwUrXti7MP7h08rM5u50+NCoMhXwfQ
         rb18mj5lak6ORiONx/tuPUvQiTOpRqlEudIhi8tsF+3i0/SiaEASZ3vM83qBF2anSWjw
         hvO4LDwFIIFQVhwEa+z4NRHzWZnloO/KiKLVFurOof4lMEzAeQ1mKQoamAsL7JO+lQAa
         ArrZ/eDiRKv5qJEDbU9pl6ia88bQcqUZJzCXAILGLQxWlq374MFU/IGKAl0pJJqZesmW
         GKdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAXTHuG1Yrj1eF7QAHfmFS6SZsHugGg2o90A9nedyYSDcbTL+720li/gxz1QkDqA5E/fEObThyqCklc0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3N3qqyQ+/gNZ1+fDymb3OZfFyYqKSd2qdSl9SYUunEuereL1j
	lhIfL9wPxqQ51r1NWxp2d6YfcKzjCcDyQVK6VWQFMzL5XOQtEiYIbxhOkAxpYrXu2gfMwF36+Ch
	xk9oMs7QXfy+M5FYVE7g95OoXA4O5Cr1BUwCaCM9CZ7Fl0MB+THcGUAYAdC+Djv9imkuX+zfNLu
	nB
X-Gm-Gg: ASbGncsb038l6cb8NtLPYYb1HIpEB3Zmv50FWny9yKW+qFeMuNQS+NiV5i7Hg+CduAz
	kJlcsqcyLpHKrPE+CfBvCS659UHABW3QzmnEJe4GMXcpFUoj3hqKozikHHujMadXpELZE33Et1p
	ceMQjwkNuNGneiCsqKU9RgrtsH3ma7UPJybz2xOwAkuGBBIf4JjGfvVzPBcVC/qkGhBoL2cGnBF
	091hKNCwG4xmtybntDl2mQlJKTqY13cBuUoacVa9BTV92mY1h3GCqxmlkBu6g0pHzuMVNFkh+er
	x5flPB4WBiuft09ypxnzyXJSsDR5vgQ/fwDk+SzDiZds766kc9DZndKm0pSM7EGf1KXJ4xXtKQb
	ShbLwdcnRucOk
X-Received: by 2002:a05:6808:14c6:b0:406:7a50:947a with SMTP id 5614622812f47-40b88b1d153mr2179755b6e.27.1751477968089;
        Wed, 02 Jul 2025 10:39:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNmpZ24Wax4edQZeFhqzzbQppSgQKKzaYKq698beKC5mr5tLU2YQgVUXsInJveSbcU3aGGdg==
X-Received: by 2002:a05:6808:14c6:b0:406:7a50:947a with SMTP id 5614622812f47-40b88b1d153mr2179744b6e.27.1751477967682;
        Wed, 02 Jul 2025 10:39:27 -0700 (PDT)
Received: from [192.168.2.110] (bras-base-aylmpq0104w-grc-65-69-156-206-24.dsl.bell.ca. [69.156.206.24])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae4e9sm2610613b6e.17.2025.07.02.10.39.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 10:39:27 -0700 (PDT)
Message-ID: <4b56c056-ad98-471f-8b5f-b7080d025b1a@redhat.com>
Date: Wed, 2 Jul 2025 13:39:25 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] mm: introduce snapshot_page()
To: Shivank Garg <shivankg@amd.com>, david@redhat.com, willy@infradead.org
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, lcapitulino@gmail.com
References: <cover.1750961812.git.luizcap@redhat.com>
 <2af92b56-d344-4b22-8eba-872418efbe3b@amd.com>
Content-Language: en-US, en-CA
From: Luiz Capitulino <luizcap@redhat.com>
In-Reply-To: <2af92b56-d344-4b22-8eba-872418efbe3b@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2025-07-02 02:40, Shivank Garg wrote:
> 
> 
> On 6/26/2025 11:46 PM, Luiz Capitulino wrote:
>> Hi,
>>
>> This series introduces snapshot_page(), a helper function that can be used
>> to create a snapshot of a struct page and its associated struct folio.
>>
>> This function is intended to help callers with a consistent view of a
>> a folio while reducing the chance of encountering partially updated or
>> inconsistent state, such as during folio splitting which could lead to
>> crashes and BUG_ON()s being triggered.
> 
> We could consider adding a Reported-by: tag and a link to the syzbot report.
> 
> I believe this is the relevant one:
> https://lore.kernel.org/all/67812fbd.050a0220.d0267.0030.GAE@google.com

I'll add it, thanks for the review.

