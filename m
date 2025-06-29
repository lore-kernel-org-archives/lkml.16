Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7307235046
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751223701; cv=none; b=H2klkDADi7tqJ90XDhi2ZXwsx81R1jkQswi5tiWAg5H2D5kvYKWERm4a0J8Ki/Fucn1QNdjIM6A9iXwkxQyW7k7cUnhPfQASKHgJXaC1Gvy1hf7lMktsL1XS18uRNJRZO6QqUCTwMch+UJLEgmJPUcUCqGVNDEyxzLNFhdOa2OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751223701; c=relaxed/simple;
	bh=EFmQyAzbvTywXpktHkX/YDh7Ewrta6YRiwIu8/ulzq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u0LRfzUbyAW4PyjDdn/kcztx3AzKOKK0MZjpCYv7VUJQp2+O9+Vdx4iDv8oSKQPr92knexVgGLB6KEuMO2d7B59y1Xk1V25NjxR6NgRYG8U0uoDnEDTcFl+6RMwvJw3+TM3lBrykhb2Y2UTsg4Ap+W0UPf3EJq4uYM/KdeE0WlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OJ0eoOuq; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OJ0eoOuq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751223698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sOZTk1W2BDyM6yj6NOHlOxoB6b1iPi73iwPCfqjIHAk=;
	b=OJ0eoOuqZqlA5Uk+e3EYScIIAJn1fvjROts9Gil26RZEtvS6+qw8zkH6Wi8O+XW3Iis1gB
	4SSYmyoq/FH4GkFFjFUMhKnZd06HnfU+u68LTaqBPLo6U2mMcu2KRsVv27DFRnusS9CQhz
	QTkezcpCYzpH2ySi31RvcpiSEHB4ymc=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-314-R2afe6VrNlOqAvE_C3S_iw-1; Sun,
 29 Jun 2025 15:01:35 -0400
X-MC-Unique: R2afe6VrNlOqAvE_C3S_iw-1
X-Mimecast-MFC-AGG-ID: R2afe6VrNlOqAvE_C3S_iw_1751223690
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 54A611800368;
	Sun, 29 Jun 2025 19:01:29 +0000 (UTC)
Received: from [10.45.224.33] (unknown [10.45.224.33])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id D828E19560A7;
	Sun, 29 Jun 2025 19:01:22 +0000 (UTC)
Message-ID: <dc3292a8-8f89-496c-8454-148af818da6f@redhat.com>
Date: Sun, 29 Jun 2025 21:01:21 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 13/14] dpll: zl3073x: Add support to get/set
 frequency on input pins
To: Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org
Cc: Prathosh Satish <Prathosh.Satish@microchip.com>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Jason Gunthorpe <jgg@ziepe.ca>, Shannon Nelson <shannon.nelson@amd.com>,
 Dave Jiang <dave.jiang@intel.com>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Michal Schmidt <mschmidt@redhat.com>, Petr Oros <poros@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com>
 <20250616201404.1412341-14-ivecera@redhat.com>
 <72bab3b2-bdd6-43f6-9243-55009f9c1071@redhat.com>
 <ba027737-39df-4541-8fea-1c4cf489b43b@linux.dev>
Content-Language: en-US
From: Ivan Vecera <ivecera@redhat.com>
In-Reply-To: <ba027737-39df-4541-8fea-1c4cf489b43b@linux.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12



On 19. 06. 25 2:15 odp., Vadim Fedorenko wrote:
> On 19/06/2025 12:15, Paolo Abeni wrote:
>> On 6/16/25 10:14 PM, Ivan Vecera wrote:
>>> +/**
>>> + * zl3073x_dpll_input_ref_frequency_get - get input reference frequency
>>> + * @zldpll: pointer to zl3073x_dpll
>>> + * @ref_id: reference id
>>> + * @frequency: pointer to variable to store frequency
>>> + *
>>> + * Reads frequency of given input reference.
>>> + *
>>> + * Return: 0 on success, <0 on error
>>> + */
>>> +static int
>>> +zl3073x_dpll_input_ref_frequency_get(struct zl3073x_dpll *zldpll, u8 
>>> ref_id,
>>> +                     u32 *frequency)
>>> +{
>>> +    struct zl3073x_dev *zldev = zldpll->dev;
>>> +    u16 base, mult, num, denom;
>>> +    int rc;
>>> +
>>> +    guard(mutex)(&zldev->multiop_lock);
>>> +
>>> +    /* Read reference configuration */
>>> +    rc = zl3073x_mb_op(zldev, ZL_REG_REF_MB_SEM, ZL_REF_MB_SEM_RD,
>>> +               ZL_REG_REF_MB_MASK, BIT(ref_id));
>>> +    if (rc)
>>> +        return rc;
>>> +
>>> +    /* Read registers to compute resulting frequency */
>>> +    rc = zl3073x_read_u16(zldev, ZL_REG_REF_FREQ_BASE, &base);
>>> +    if (rc)
>>> +        return rc;
>>> +    rc = zl3073x_read_u16(zldev, ZL_REG_REF_FREQ_MULT, &mult);
>>> +    if (rc)
>>> +        return rc;
>>> +    rc = zl3073x_read_u16(zldev, ZL_REG_REF_RATIO_M, &num);
>>> +    if (rc)
>>> +        return rc;
>>> +    rc = zl3073x_read_u16(zldev, ZL_REG_REF_RATIO_N, &denom);
>>> +    if (rc)
>>> +        return rc;
>>> +
>>> +    /* Sanity check that HW has not returned zero denominator */
>>> +    if (!denom) {
>>> +        dev_err(zldev->dev,
>>> +            "Zero divisor for ref %u frequency got from device\n",
>>> +            ref_id);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    /* Compute the frequency */
>>> +    *frequency = base * mult * num / denom;
>>
>> As base, mult, num and denom are u16, the above looks like integer
>> overflow prone.
>>
>> I think you should explicitly cast to u64, and possibly use a u64 
>> frequency.
> 
> I might be a good idea to use mul_u64_u32_div together with mul_u32_u32?
> These macroses will take care of overflow on 32bit platforms as well.

Will fix

Thanks for tip.

Ivan

> 
>>
>> /P
>>
> 

