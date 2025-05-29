Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 018A5212B3D
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 06:43:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748501021; cv=none; b=V42yAO+99WGx4QuatClqSzdaE0hsPu5EueB5Zik3X/+7+aaRRV9xkguQ14+lYfFkdSep5vdoo4kcoLODIToyWy3pIAS7vIKPgmjuqRrj7hbvX4pDVKffqmCNrwLnX8GO/wMIcikXPD7SWVP6QM7oygnVxCvEP3Lj1M2unP+rtBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748501021; c=relaxed/simple;
	bh=/qDdsTJZ93ur50jARzCGJ4oAwrp56J+SNDkDeYmuZqM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EIuUD9E/A8cTjNWZgsqIDK9kgEY3IOTasyebi0y4OmNkS1PeyZCGY0VEvZyyt19L/0oHbPdug84cBH6doZOkKnQezfV0gh+FtLP/vuwZ2Ddp+UG3X6VApE/gxiowCS6fD5JDSMyMJqyUIvXgxBFUUDqAql+2uLH//Y6Gzd27z9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JEO8RFDA; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JEO8RFDA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748501018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=hsRW+9k08y318rmeCuA7ybBmPboKnqZPbQfBzGFx5ls=;
	b=JEO8RFDAwhVrwXnqxvwJBNRJJeRFrVIi1r9r/4tL9oJRGgFf8d+VHJX40ir6ETWdrk+JiN
	pKjuxhddfj7cjS/J6b3i0GtAiIc8LJrkyCwCYi/F+bOMR4U1Qxx3ixjkY7tuUcWoE6BOqd
	VSRQWiLisAVJS+y52PnkQApEvrXJyA4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-528-SAi1U9BWNw2u0DC2MAd43A-1; Thu, 29 May 2025 02:43:37 -0400
X-MC-Unique: SAi1U9BWNw2u0DC2MAd43A-1
X-Mimecast-MFC-AGG-ID: SAi1U9BWNw2u0DC2MAd43A_1748501016
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-442d472cf7fso4571935e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 23:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748501016; x=1749105816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hsRW+9k08y318rmeCuA7ybBmPboKnqZPbQfBzGFx5ls=;
        b=BKzQZu5BqLc/BGlePiA8xQ/OfJ4zisP79ABKVuEqsIsKTaHIpGK4Tp/qyDVw3AIRlz
         MoVEa4uL7iP7G+x9ONror4Aq4hNasZDWXnVsWzI1F3ykTvh3L31zc0JfIqTsCCpeN/1Q
         CID68vrB0UefDX75eVr28bbKq8X/6QJnT1ZGFjtRXhBAy86zKElvC8yBkVibHheCi/bS
         zGrk75uae+yr8zsMUxVz8Yyai7J0XH7u/axJPYWOpdrwuQsS0chAN1D8AsS8PuO/7SJW
         OZRWaUJlwg2GXDHrBK7sGvTOxvKNntBswaOB/7EZ2D9/eXZlvprOsa/zcD35vs+sEMqZ
         xnVw==
X-Forwarded-Encrypted: i=1; AJvYcCVjGawYsj8rIohAbwM1vfDeAGAnoslW00AZ72L03jRoaKAci8/vXEDm2zYPB9r9PcegsKXcYFa7g/NgtVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysW70K3VV4vUN0N6it2WpGy0mqh+dmQzdvKxWjwoiVYszn9zdN
	VKeslv5Keh2kpDBJ0mx48Yrrv8wBu3MskQgnIheiqi+xO+w8uSftTcEk6bN+HkcC7Le+0aQvThe
	nyVgCEILBHHtTPCTUeiLnEK0cdjcr/NDX/tKtggPmguRRjrmo43yeV1z122lDCMSXoA==
X-Gm-Gg: ASbGncvMmZDYDrcydU3DxPjf4sZT//8F51Cjnm3oHT+i4H5NXjWfEb1enaFUzJASRDO
	2vIF2lczyMFa9noOwFkJeqOLAPKyx8lyJVg8Gl983oiUkGP+nBlNPT9rZA20VsO0fAFB59b4uLN
	WJUJAQM9YrUldmxOamTBNwo9seQPusiaGy5TealV8d0uqEU81SpPaygH2mKSp1LrumFGGPP8J2E
	XAu2jONHgk0gV+8oGs+WLQRYaDSFbuVkVdLm88aizIucZ3T+8s/WMt8I7iOIsUoiYHq0F5RhO4d
	tBwewiBne0aR8M8GBd6F2bT5UDwt++wj8oQBOf0Z9XRouF56GhQMzl04KLI=
X-Received: by 2002:a05:600c:5115:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-450d0574c15mr9260525e9.15.1748501015784;
        Wed, 28 May 2025 23:43:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE73xvcN8oNb/rtbonm8JOmCkL4tC4zlAHM2JVqRuYuvY1DOzRbftQC7T7HzD+wsd5Bp60fA==
X-Received: by 2002:a05:600c:5115:b0:44b:eb56:1d45 with SMTP id 5b1f17b1804b1-450d0574c15mr9260305e9.15.1748501015470;
        Wed, 28 May 2025 23:43:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4? ([2a0d:3341:cce5:2e10:5e9b:1ef6:e9f3:6bc4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc2704fsm10882665e9.25.2025.05.28.23.43.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 May 2025 23:43:35 -0700 (PDT)
Message-ID: <d0a7112c-d9a7-4264-b7cf-02d25eae7a13@redhat.com>
Date: Thu, 29 May 2025 08:43:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [net-next] hns3: Demote load and progress messages to
 debug level
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Jian Shen <shenjian15@huawei.com>, Salil Mehta <salil.mehta@huawei.com>,
 Jijie Shao <shaojijie@huawei.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
References: <0df556d6b5208e4e5f0597c66e196775b45dac60.1748357693.git.geert+renesas@glider.be>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0df556d6b5208e4e5f0597c66e196775b45dac60.1748357693.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/27/25 9:30 PM, Geert Uytterhoeven wrote:
> From: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> No driver should spam the kernel log when merely being loaded.
> The message in hclge_init() is clearly a debug message.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

## Form letter - net-next-closed

The merge window for v6.16 has begun and therefore net-next is closed
for new drivers, features, code refactoring and optimizations. We are
currently accepting bug fixes only.

Please repost when net-next reopens after June 8th.

RFC patches sent for review only are obviously welcome at any time.

