Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4864918DB14
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 13:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746712177; cv=none; b=lOk/uoVD+2+PwbAO+xET+52l7JUmdBaePhb6wqG7kEow3uw7fLwTxAEPRcYTM9uetXqmJXwAR/+z/rLDupGEHOgG8sLIiNPfTXoIL7qwyoxV3JQ5qVZqxVkiGiluXs6QdeIifxCVrnI1JVxdeU1Dd2eqNCzXJ36mKoGjdc7ikzQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746712177; c=relaxed/simple;
	bh=OD8GxFlJxZjRjI0IBByxRgE9JRBwwfxhYepxx0fCF40=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SyX4PuOveAPbxghIEprKOy69A3xZOlTkSqU/1KdsKxauldTpMeNew+egxSYmyvImPxTe51+CP44d3H4gEfm/anp6ELhBSsahNJXpIZRqJSdg8i5fmOMyw4Fzdg4osUeztGU044NKORHuE0rkxWCUvm383tidEO4R2Jjn+NIIhYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eUrhAVc5; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eUrhAVc5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746712173;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CywF47gXjpgY/l1leg6XrAUlD5bu0hAVfhP0zMhN6lE=;
	b=eUrhAVc5e9IHiT1mMYkaXvP4qGgPKsMj/TncqMuMbuwoBnFUihvpst+6d4L5XHB623qWov
	ViWem5elQGqYAKdNAOg0UrdDGbtNFS5iUMVF79iNZtdUg1TVn/+A+IMMKAutyFfPv/NrWs
	FiHwuCeT1vQils7tW8m/MsLrkW2qn4w=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-zNn4hbmhMZqE_10C4g6JXQ-1; Thu, 08 May 2025 09:49:31 -0400
X-MC-Unique: zNn4hbmhMZqE_10C4g6JXQ-1
X-Mimecast-MFC-AGG-ID: zNn4hbmhMZqE_10C4g6JXQ_1746712170
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-39d917b1455so370024f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 06:49:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746712170; x=1747316970;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CywF47gXjpgY/l1leg6XrAUlD5bu0hAVfhP0zMhN6lE=;
        b=M8KGTDxWkn0lo+HadfOr36qzexzeGK2SNdbOx2GTh8KSm+Gy8UbnECuuoATv8C3x8x
         7F3sxXBqTVq4XdMdj5+ago42qA4lSlBMU3Vf52TZ6HWnnyWPtimdyJnSovubJbfM/o/G
         3bBJVDhUsjGk8TlZr2DL7GeLbE+t0U7OCa87e5hqAbR94UlFi1T/6vNiYOCnhnKvj/ki
         S6NGJpEquCC29JnuB3TOROfQP0dKW03fnl95Lb2VyV1ZIEO4fWXuDVNzmuuXL9PN/hS7
         oTQjIsswz9mglbToyYm9HsWzmdUV3S06oxXzie3DdUUuQbeih4HRIZmX+2EHv3KLytpv
         qw8A==
X-Forwarded-Encrypted: i=1; AJvYcCWaz9bSZCROFIH5vJxGIsvnr5mPlCn0CzQhGcOTQWkxJSSlnYAgNAGDmTYpw9ocp7HOG8uGLp+g2elOUkg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUqU8A3jt7QQV8ah9klRodSwNbrn9YBMxN3PAFGR7cl0r7qo5
	UcleGHGmTZ8Y3qsxSVKJzpxAuoFdToOy4YHi3lVHODbhX3UYHEfhaw7NtTG1ITllFrr93/kuCSI
	E7ySR6ULy91HKK08gVoxRKYbDPyRA1Ovz1BpqJWolxDgMEvPC0ZjyOpJ0mXFJug==
X-Gm-Gg: ASbGncsET0t7Qy05Udm8Cr3YfXTYAtNvmA4aE9rPpcgBUL4no+7GATc55GEdKw5oaAR
	26idCZrzOq71WvdswFl+384KsNUWPt8IunYgmR1xJ8Q7i48sTZqh2OlqJA+PdkwqTqiBMCneRos
	jZ2FiBJoEvYz75cZcNq4MKNsunGQ4t39tkqh7DufqT2RHv7pD6IVJsVNfZpgWlHTZ05vD5pEzy7
	obiXw/cO50AiyABr7zzqrnCc/L9yiI+0QykXhuP0TQWwuW2CNc/sHASJJoHM33IaXxfUHuXBCm2
	qgn4r1xXE2w9nW51
X-Received: by 2002:a05:6000:290c:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-3a0b4a68652mr6692126f8f.51.1746712170401;
        Thu, 08 May 2025 06:49:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IECjAERYWa6S2sVnLY/p8FyXyHfUJVuA1XUuJN5svWBMIQPW9IiG9y/gkXhSokA6jatooc4QA==
X-Received: by 2002:a05:6000:290c:b0:391:43cb:43fa with SMTP id ffacd0b85a97d-3a0b4a68652mr6692103f8f.51.1746712170075;
        Thu, 08 May 2025 06:49:30 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244b:910::f39? ([2a0d:3344:244b:910::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f57de0b2sm42895f8f.19.2025.05.08.06.49.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 06:49:29 -0700 (PDT)
Message-ID: <23278f6d-f111-46f7-a844-2cd7fbf8b623@redhat.com>
Date: Thu, 8 May 2025 15:49:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2 7/9] net: ethernet: ti: cpsw_ale: add policer
 save restore for PM sleep
To: Roger Quadros <rogerq@kernel.org>,
 Siddharth Vadapalli <s-vadapalli@ti.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Russell King <linux@armlinux.org.uk>, danishanwar@ti.com
Cc: srk@ti.com, linux-omap@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250505-am65-cpsw-rx-class-v2-0-5359ea025144@kernel.org>
 <20250505-am65-cpsw-rx-class-v2-7-5359ea025144@kernel.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250505-am65-cpsw-rx-class-v2-7-5359ea025144@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/5/25 6:26 PM, Roger Quadros wrote:
> diff --git a/drivers/net/ethernet/ti/cpsw_ale.c b/drivers/net/ethernet/ti/cpsw_ale.c
> index ce216606d915..4e29702b86ea 100644
> --- a/drivers/net/ethernet/ti/cpsw_ale.c
> +++ b/drivers/net/ethernet/ti/cpsw_ale.c
> @@ -1823,3 +1823,45 @@ int cpsw_ale_policer_set_entry(struct cpsw_ale *ale, u32 policer_idx,
>  
>  	return 0;
>  }
> +
> +void cpsw_ale_policer_save(struct cpsw_ale *ale, u32 *data)
> +{
> +	int i, idx;
> +
> +	for (idx = 0; idx < ale->params.num_policers; idx++) {
> +		cpsw_ale_policer_read_idx(ale, idx);
> +
> +		for (i = 0; i < CPSW_ALE_POLICER_ENTRY_WORDS; i++)
> +			data[i] = readl_relaxed(ale->params.ale_regs +
> +						ALE_POLICER_PORT_OUI + 4 * i);
> +
> +		regmap_field_write(ale->fields[ALE_THREAD_CLASS_INDEX], idx);
> +		data[i++] = readl_relaxed(ale->params.ale_regs +
> +					ALE_THREAD_VAL);
> +		data += i * 4;

I'm confused by the '* 4' part. I think that you just need:
		data += i

to move to the next policer context. I *think* the current code causes
OoB?!?

/P

