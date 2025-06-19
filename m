Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8450227E82
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750333426; cv=none; b=Je/1p//90PgzS0aK3ZJ+08AUTVw6KwrUKFmGAd/nk5PpT9d5U8UY71Xminq63DPhiXzLA0uz08snoC6YnhueCOks9T2YXgBfpwTP6X/xA2Ohmv6zhZHiX5DlUwbpb1CuO0R7h1Tp8IJGl9H69xO3fEmUuP3ai1r6X51as+rXt8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750333426; c=relaxed/simple;
	bh=ka2YSkd/50tKtAy/Sw1F5sNt6obV6O6uUBbncHAvZq4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QDLSsTWItQf0wRMATXxUN79fcBdiUnf00/3EuiXYHtmesqlT6EsWYnV+a33yCqsCFglS/dHf8PnqptTuSodJ5JHI0pmOSoZ6V9gAYDdryeXUiM3HOZWVK963BJ/DqNPYHG9qWXssVX8iG9mrLxPMZOuHY/hz8NyvfZBUIujfnW4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CkqPDTsX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CkqPDTsX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750333423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ir5AYNLTrc0GzMJeSFP3PI0RqKk+EXKa8y1NWCrMv88=;
	b=CkqPDTsXxTiU7c9SLf1QmaZfa4IK/XgsJ18iG9RyqHGwWpea/P0/7T52XGuMnjRMlmDe1n
	mpRi+ky6fTLLHPvbo6Osrn+LXmys7/arwnrgnGNe+1lOOQo4UXsuXJ1SzNC57iTz9KgTFp
	PkfNUYFUx7xpt/DqQdh1y3VRXPJRZ2A=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-qWsmqLK6OSegU8Ew98HEBA-1; Thu, 19 Jun 2025 07:43:42 -0400
X-MC-Unique: qWsmqLK6OSegU8Ew98HEBA-1
X-Mimecast-MFC-AGG-ID: qWsmqLK6OSegU8Ew98HEBA_1750333421
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-3a4eec544c6so365620f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:43:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750333421; x=1750938221;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ir5AYNLTrc0GzMJeSFP3PI0RqKk+EXKa8y1NWCrMv88=;
        b=BFd3XYPIfF/DnenvK9T5xHGhUCeHXLQ+8zLbScv4BU1d9d5NNk5W+K15fF5ACMzvo8
         6Oa5ZHbpWUlH6Mx1SncGT4ka/lnlqXAsnlKy3MibPl1rvquv5ws6EFCBg4B3ymmfV2Qx
         Jo5OQ28uNfJPyDSjPo6qlq91xflKrDnCBCLKed8r6PbmBxGhx/8Mu3do859r6msnqfuo
         /8fJV9xyg/N/fnW1jZyUgePquEMwPtmzzDww0jerJrT12DhlIAR/4PSEQV+hLBFM0WEO
         fJeCkiHZrWmCFaxS4LU/HruhfgcKTjndiGcc3je86naAkbPdmy+bpHa+xV1E/ChEhnP5
         UyxA==
X-Forwarded-Encrypted: i=1; AJvYcCWqb0PYANgqAQsLjdmd1OzuLbVM3UtXnZzOQA4keRiT1BF5QKI2Q7fk100cSCeTvLHe7GY6mTHKYTpDl60=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw19talXT04UL9vUaeS274R6TQGbqpEMNafPK98KrK+BOjRgXoa
	KBwxtv0yV5uEr9HrRjXBsbkqxSj9jVRqmP+unIxR/BQmA2brIpr0VFqBECgZgJYrPtenPK/NNRJ
	uTJT+ecv2fzOlSYsT1fiQEZR4hlGVVahWyi9aZaaOYdoDFT5oMk0NTo80PHq2/j2N/A==
X-Gm-Gg: ASbGncuLIANDjHLBZ/vEOnJEPcGPq8LgO8yMsdIeIjGMqQw5ZfGiO0AsEu3zVU2Yhjr
	0CkP/NUFLFb6rErF67D6v4JudNVCKRaSeoItNZImbz4sfjaqEX0mT+COGAa6M1Yh2JZy/mnaOiV
	tESAd9UbTNTibwPJMCwYVCtFFBv8oZPirvUf92x1GzukZS7Ll1gqz4lJhO81Uip/uMzkVcvOrls
	LnyxhydCfE8lmc4jcj1Ml+T7BUMZX/roRxJtjl78rVWae8wosvI2Kp02FgQgrmT+dbuYtLn4iGh
	7EbsJIfy+/4M/6GxkInJFLUiThL80mPie0WzCzUPwyBkt5XErwk/7SGWrGzAWOsqV3U99w==
X-Received: by 2002:a05:6000:310e:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a572370c21mr17233774f8f.13.1750333421183;
        Thu, 19 Jun 2025 04:43:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0K+Q0JwDwTLL6eL8TmMJg3/Y1q/iQX/C0mLF/RXcygjsYcsKNMqXFMDf/NmEIVFEjZ5Prcg==
X-Received: by 2002:a05:6000:310e:b0:3a5:58a5:6a83 with SMTP id ffacd0b85a97d-3a572370c21mr17233741f8f.13.1750333420729;
        Thu, 19 Jun 2025 04:43:40 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:271a:7310:d5d8:c311:8743:3e10? ([2a0d:3344:271a:7310:d5d8:c311:8743:3e10])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a5405asm19680062f8f.13.2025.06.19.04.43.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 04:43:40 -0700 (PDT)
Message-ID: <15618298-4598-472e-9441-8b1116a34de2@redhat.com>
Date: Thu, 19 Jun 2025 13:43:38 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v11 03/14] dpll: Add basic Microchip ZL3073x
 support
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>,
 Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
 Jiri Pirko <jiri@resnulli.us>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Prathosh Satish <Prathosh.Satish@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
 Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>,
 Petr Oros <poros@redhat.com>
References: <20250616201404.1412341-1-ivecera@redhat.com>
 <20250616201404.1412341-4-ivecera@redhat.com>
 <20250618095646.00004595@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250618095646.00004595@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/18/25 10:56 AM, Jonathan Cameron wrote:
> On Mon, 16 Jun 2025 22:13:53 +0200
>> +static int zl3073x_spi_probe(struct spi_device *spi)
>> +{
>> +	struct device *dev = &spi->dev;
>> +	struct zl3073x_dev *zldev;
>> +
>> +	zldev = zl3073x_devm_alloc(dev);
>> +	if (IS_ERR(zldev))
>> +		return PTR_ERR(zldev);
>> +
>> +	zldev->regmap = devm_regmap_init_spi(spi, &zl3073x_regmap_config);
>> +	if (IS_ERR(zldev->regmap)) {
>> +		dev_err_probe(dev, PTR_ERR(zldev->regmap),
>> +			      "Failed to initialize regmap\n");
>> +		return PTR_ERR(zldev->regmap);
> 
> return dev_err_probe();
> One of it's biggest advantages is that dev_err_probe() returns the
> ret value passed in avoiding duplication like this and saving
> a few lines of code each time.

@Ivan: since patch 13 requires IMHO a fix, please also take care of the
above in the next revision, thanks!

Paolo

