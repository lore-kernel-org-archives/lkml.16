Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 487D121A434
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331734; cv=none; b=hlqegi3UR8uCD3TsxjXCr+Wo/P83BYgYazG4m/cJ/JSINxiL4sSiobOVMxk8qaFMBiCxuL/6K7UmeK1hRobyVBKBcD7vfkC+kzYEqERZa2dzD0aoXE+E/ErV1q6Zi6st0PJfOoDo/3yp06K2FfUrygTKoJpZ0TUJCHF1ANGuYlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331734; c=relaxed/simple;
	bh=LUeQAjtBZos6OdUZbbQVfexhZynCiSgqlsEwbuBatHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HgukLh1n2GtDbq6U9NGwj2Oq4eLLnQ5u3phfX+K8AXJtn16BbfP6Mn85MLeF+wbhWhccwcTHVWx8Wk70PDV0iRtGvlq/jqxznEeZAdUuAnT3Arf4H2aCk/Zs74krlhqatekN1S3gXxEymdpjocVKKSUlBfGDqfb4nlcfMWWhABQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ATMXdKMW; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ATMXdKMW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750331732;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3xZv/IaN3pVBxm6Ay/mMD7muLAWVYifKr0RAn2IkTKE=;
	b=ATMXdKMWUA2SlTMrIPWIUwD3yoOJfx3uuiHEVbAs/FGBXbkVHMxXa1MgCnVS6xcVlHaFuH
	tKfK8G4abNcKaazp0RDTMykuh0QlRG8NuBeRfQi5dKKWIwwwVaqxyEJdFCCxQBeg6M51MQ
	UAJqLq54mlQNkmw7Hpxg1+TtY5B4bZ8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-38L163ZvO5K7g9_304nceg-1; Thu, 19 Jun 2025 07:15:29 -0400
X-MC-Unique: 38L163ZvO5K7g9_304nceg-1
X-Mimecast-MFC-AGG-ID: 38L163ZvO5K7g9_304nceg_1750331728
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-450787c8626so5540105e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:15:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331728; x=1750936528;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xZv/IaN3pVBxm6Ay/mMD7muLAWVYifKr0RAn2IkTKE=;
        b=EmCUH/GbN384oJzEiV54BNw/sIn7yGtX7XudUDp9T97Ea03uNmUwYCFICb4zAtlqhb
         8AA96hiejkjlOn6GJ+qeIxjGoK8mwaA1xVRaWOjPxiM/pLD/czZ2i89k0HhYR2Y8gF/M
         7/amjeSkepomlITi9OJMaYTUj7vSeGG4WhuJZeTyernnbSlRgskcGAfEtO5mre34lBCq
         kj3mMdXMhNxATJeaTWCpp75+DKI2LuL8znQ7K49keA2lu6zhHFEcc/9iTDp8YdwXtyjL
         u8ITSpfoY2hDUiRTEuvS9cg8NJ3Jh0+sWdNrWNghn3NS6ox9Nwd0jCZvFXvcTQzwjOks
         ylfg==
X-Forwarded-Encrypted: i=1; AJvYcCUwL9mi2rRPGtlS7rynQXTX7Ta1UxuvoObTJOm2rE6Fe3ZO/IXsx2AWHfPmx8bt969p7TRXlTQCrnP5vHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQyMsOQgT3xSDen9YjrRSxUl1V+ZaDYNIonV0e2JDp/bxddHeN
	r9pSzSlUJKvfqSlpcuKoeS08huB0gd0UHo+b6qs8mD2YLMlgwbDnNoxjM2OBwd8IZNK3Rp7lHKo
	2io73QpjILBjeF5zHTQYQ2VSS2g/apwPFXvWI+N+ee/Mi0qdcHF/GElob8Cb7aqsioA==
X-Gm-Gg: ASbGnctfsqcXsnXWar/7NAzQnaOikUTgm17NlTOJuTU/W5CD95Fkqqa4DivHXRlbVvS
	fol4JERfdLrdf87HRyrhTrcI9sWl+qtJSU0lX7Z7/2NbGwhz8EhBbg/e5BBFALZ4+BNqGx7bXZh
	Us3PKQvxFIjRMjtGibTsNPQsUjigc9TYwslsH18pXApqOPUGF3JeIew46f/R6xCIVFZHU39atn4
	QSlJix2pzGlABcJTfJpiuYdN7HWBtjAd3dJ9fItA8gTndIQVRHr14l66R6snINAMA3fsDezWBX7
	ErGeK8DdFg15ACg64zLfqd9Y3Sd4QDW0J5hZrFt+l8czfCtxvhaqm66GK+ADp6rQrcHmfQ==
X-Received: by 2002:a05:600c:190b:b0:445:1984:247d with SMTP id 5b1f17b1804b1-4533cadefe8mr187697305e9.7.1750331728256;
        Thu, 19 Jun 2025 04:15:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG43dOM5T7qmoDFSYxKLqTuwEzuqqfaVGRVW809R5AKI8GEve+HAJw7T1QeY9uWvmBGJ78U+g==
X-Received: by 2002:a05:600c:190b:b0:445:1984:247d with SMTP id 5b1f17b1804b1-4533cadefe8mr187696945e9.7.1750331727767;
        Thu, 19 Jun 2025 04:15:27 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4535e99503asm25371355e9.29.2025.06.19.04.15.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:15:25 -0700 (PDT)
Message-ID: <72bab3b2-bdd6-43f6-9243-55009f9c1071@redhat.com>
Date: Thu, 19 Jun 2025 13:15:23 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 13/14] dpll: zl3073x: Add support to get/set
 frequency on input pins
To: Ivan Vecera <ivecera@redhat.com>, netdev@vger.kernel.org
Cc: Prathosh Satish <Prathosh.Satish@microchip.com>,
 Vadim Fedorenko <vadim.fedorenko@linux.dev>,
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
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250616201404.1412341-14-ivecera@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/16/25 10:14 PM, Ivan Vecera wrote:
> +/**
> + * zl3073x_dpll_input_ref_frequency_get - get input reference frequency
> + * @zldpll: pointer to zl3073x_dpll
> + * @ref_id: reference id
> + * @frequency: pointer to variable to store frequency
> + *
> + * Reads frequency of given input reference.
> + *
> + * Return: 0 on success, <0 on error
> + */
> +static int
> +zl3073x_dpll_input_ref_frequency_get(struct zl3073x_dpll *zldpll, u8 ref_id,
> +				     u32 *frequency)
> +{
> +	struct zl3073x_dev *zldev = zldpll->dev;
> +	u16 base, mult, num, denom;
> +	int rc;
> +
> +	guard(mutex)(&zldev->multiop_lock);
> +
> +	/* Read reference configuration */
> +	rc = zl3073x_mb_op(zldev, ZL_REG_REF_MB_SEM, ZL_REF_MB_SEM_RD,
> +			   ZL_REG_REF_MB_MASK, BIT(ref_id));
> +	if (rc)
> +		return rc;
> +
> +	/* Read registers to compute resulting frequency */
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_FREQ_BASE, &base);
> +	if (rc)
> +		return rc;
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_FREQ_MULT, &mult);
> +	if (rc)
> +		return rc;
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_RATIO_M, &num);
> +	if (rc)
> +		return rc;
> +	rc = zl3073x_read_u16(zldev, ZL_REG_REF_RATIO_N, &denom);
> +	if (rc)
> +		return rc;
> +
> +	/* Sanity check that HW has not returned zero denominator */
> +	if (!denom) {
> +		dev_err(zldev->dev,
> +			"Zero divisor for ref %u frequency got from device\n",
> +			ref_id);
> +		return -EINVAL;
> +	}
> +
> +	/* Compute the frequency */
> +	*frequency = base * mult * num / denom;

As base, mult, num and denom are u16, the above looks like integer
overflow prone.

I think you should explicitly cast to u64, and possibly use a u64 frequency.

/P

