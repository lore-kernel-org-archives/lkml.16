Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A795B17F7
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:31:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007090; cv=none; b=XUUNiSBb5hOQ4pqWNRgneJ8VWhKaZ//Eq3jY4pI+UCfa23A8amGDgACAzKDpxs9xXylI5K11gyJ8pCfAqf0xgWGhe6eR4U9oIcGeWnz6MWxbAA/CoulB9+6fYGlVJ+fqGMIVHm4pSPE5kWVkymAIK1wD9ncv8Vw1XwH7afJUktk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007090; c=relaxed/simple;
	bh=U9D1pby8xK+C6gOYWJJ4wogm9CeACMWsTXzSqquT3uE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWo9F2Y9VHTO0i2ic3nxETnX8ZoOxceBokuf8J35NrMUVKztFS/jezmMWUSOf2SqC7ZkWOI0LGGviPQ9oQVEq0WY0ky+fS8fmY4MJEHP3VfN/fScmTiO3pk6UMF4j0uydznFQHrz3gfZWaVjQ6fO2unlHj1vJ5sb4ERS1dgUZ9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=AXWwc1Or; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="AXWwc1Or"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748007087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p7IQJzIY0RbKcl762mcRQGpgwa1SyI4pkk5Ubsv8VBM=;
	b=AXWwc1OrI0E/ZxTzKpEKPwP2HyNUcQgw3vN0wxOx+TyNbGV1+E5KJpGONFDhCfu24mwQFu
	pLjm5nvSkTWb6QhrBS84DJr6XJ5mwvQOz3IlZBpmICd7W4DtRTBquStvv3rybfM0X5IlC5
	iTSmHiOcrskPcqoUGER4NuZSCd96of4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-294-qBJ_0vgIM46cxlfkdC1kHw-1; Fri, 23 May 2025 09:31:26 -0400
X-MC-Unique: qBJ_0vgIM46cxlfkdC1kHw-1
X-Mimecast-MFC-AGG-ID: qBJ_0vgIM46cxlfkdC1kHw_1748007085
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a4c8c60c5eso39057f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007085; x=1748611885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p7IQJzIY0RbKcl762mcRQGpgwa1SyI4pkk5Ubsv8VBM=;
        b=QQf8iiWgdbAYUsABPoaZKBko8sIaU9bBsYrnJpsEXEbeK+iZEbYF/qzDvgQYAHmqgN
         s7TFjrrDuaw2X+7mzaMb3vRvbT9wLQ66E3tk6TTjmMIM8kJtmmZMKW4rEGgnP6J0mDsE
         9sFCDitKiYjcZVVoyrT/73wikrryxXWxJ722I2L6vA7Yr056bPOgPMwKegAgoZ89511t
         LxAxVS3A/OxZcMzc5kArLgVoYVdfGG0dZqRBjKVrHRWcsuxEwix30SS50alQHssjfZVE
         x+dkt39zLWYkRYnkmWTvLH7Md8wnMe9NQ4P0XE7DhOVClOdiWdrzk3QvAJ3N9rJeNdSA
         VD+g==
X-Forwarded-Encrypted: i=1; AJvYcCW54gpUSbiuX9CRa8I34YDMN79fzF4Aub6vs0H/k+LR+HZMvsZz2mN/3kf0hVGSGAkjmvTIGswO40SoRc4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2ETJIVMEqYjdiWJyxZkPlS1pIZnJTtny2Pv0/O5TIOsuNueh
	rz+Le6zwTamMCD7dBAV3a3fkX4pQmMN6DWCou5imx/ZTyEjrl1qAt3X8/5JQ7Igu9iMJLBfCjmW
	ALX6+0pS7oSqJZ2t2vxFMuahxLaNzqPtcsd2fa70M991A1eC2P5Qi4iKajLhe5x27rA==
X-Gm-Gg: ASbGncu2zVC6okP6+ogb81mnZgYxq92N9xWNmmdZbcmrAqU79tlwC+fhnlFTRWpZfP2
	brIvLO8ihcrL2jHeqCznOTze1FtzzkwdAWng/5HCkgc68AdzjENZg3KvXu1k3Q1QM2qvdb2xiSU
	aeEqq6g7QxRhAJu4jPTBl1bW5+e1aFeU9zNgPVgosxwX1WX6QxKtHY7RktnmojKHtODCv7TInUl
	1gblRMUOpz2gATHPnU5MjM0+KxMTCyiJrt0b6547gltbLU2vqzIm5i0EPxI8eMPfts3YnnGNYhY
	PfMhW4s4Sn3Dp4WwMmI=
X-Received: by 2002:a05:6000:178c:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a35fe5c5c4mr24055834f8f.8.1748007084926;
        Fri, 23 May 2025 06:31:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGhrdMB+LiVIpu3Aj+Mc9yuQMuVgyy9qtyFckGeXteyhBS+WYAjEdff975Ix8KdVMFe7BPmTw==
X-Received: by 2002:a05:6000:178c:b0:39c:30cd:352c with SMTP id ffacd0b85a97d-3a35fe5c5c4mr24055780f8f.8.1748007084275;
        Fri, 23 May 2025 06:31:24 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247a:1010::f39? ([2a0d:3344:247a:1010::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f3dd99edsm139493015e9.36.2025.05.23.06.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 May 2025 06:31:23 -0700 (PDT)
Message-ID: <af41c789-9e0d-4310-ae28-055beef73f10@redhat.com>
Date: Fri, 23 May 2025 15:31:22 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] page_pool: Fix use-after-free in
 page_pool_recycle_in_ring
To: Dong Chenchen <dongchenchen2@huawei.com>, hawk@kernel.org,
 ilias.apalodimas@linaro.org, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, horms@kernel.org, almasrymina@google.com
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 zhangchangzhong@huawei.com,
 syzbot+204a4382fcb3311f3858@syzkaller.appspotmail.com
References: <20250523064524.3035067-1-dongchenchen2@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250523064524.3035067-1-dongchenchen2@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/23/25 8:45 AM, Dong Chenchen wrote:
> diff --git a/net/core/page_pool.c b/net/core/page_pool.c
> index 7745ad924ae2..08f1b000ebc1 100644
> --- a/net/core/page_pool.c
> +++ b/net/core/page_pool.c
> @@ -707,19 +707,16 @@ void page_pool_return_page(struct page_pool *pool, netmem_ref netmem)
>  
>  static bool page_pool_recycle_in_ring(struct page_pool *pool, netmem_ref netmem)
>  {
> +	bool in_softirq;
>  	int ret;
>  	/* BH protection not needed if current is softirq */
> -	if (in_softirq())
> -		ret = ptr_ring_produce(&pool->ring, (__force void *)netmem);
> -	else
> -		ret = ptr_ring_produce_bh(&pool->ring, (__force void *)netmem);
> -
> -	if (!ret) {
> +	in_softirq = page_pool_producer_lock(pool);
> +	ret = !__ptr_ring_produce(&pool->ring, (__force void *)netmem);
> +	if (ret)
>  		recycle_stat_inc(pool, ring);
> -		return true;
> -	}

Does not build in our CI:

net/core/page_pool.c: In function ‘page_pool_recycle_in_ring’:
net/core/page_pool.c:750:45: error: suggest braces around empty body in
an ‘if’ statement [-Werror=empty-body]
  750 |                 recycle_stat_inc(pool, ring);
      |                                             ^

/P

