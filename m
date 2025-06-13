Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F0222E11DA
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 14:20:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749824423; cv=none; b=pxDjo+Ra91AStXYDAayq1J+FAP2Qs+FR0cBSdOqPk/xBDG+/IBZca6up+p4NUPucu7yyT/6BkeaddIei46Z1wy6cF2+ilTRi7/b75DKJB5tAitKoqKbUIs2TjyZr90EvlE18RnPYmDCHopZRb64qshW93KwT/W6TLsIztPxy7H8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749824423; c=relaxed/simple;
	bh=2uFIeI8r05kfQpJw2EctCJW9fBZRFPD2SvqXy7M+oXI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sN3Bh69gSuE3/Mfr4zh/Kpj4s8MIOoQtAgDRG2dF4U9mmNnUuUY8vxfELpEWdZseLEojzCqE6nXLEJEXdtbxRZhKwtCoXFka9SJrmBeONVbMxhukAo5dAbNdUIL2tqiMwJatH7pEbQPk9IyHX1EJ6s2nqAI3z+tx2oKJ5lgVVV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=dq460isC; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="dq460isC"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-40905ae04e4so652290b6e.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 07:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749824419; x=1750429219; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kDMCRDo0cthC7kWsPEVosDcgak2W50xC/1nlZdkqQZo=;
        b=dq460isCA9pcd/W6ZqryGaVpT2neAaxbRwU+FzBvHEkiuTC9Bo5GvoOTVQZiwnAqlF
         /ad5H0JKdiGip3w9q/4/eHXHsLlcJhlFQ7Q0k7y7snpCGKLzp5iD7yFtnpMIPs6YCant
         g41HKW38kDs5ixRJKS1yxbB7VwTjssDaMqEwX1zTDTV/ANlFuy48DYh9eB+T9cg2K3Wy
         aXL2rp3huMcv1qtJ5qLHIw/KMud+Bi4Dqz4LbUILa2Unsu+553po5xomidKN4vJsU8Vo
         Trv46lhRe26nzuAIRpR4Vt/m3OGb0/7xNbFNyu4urmuSufeYdCOhgkyu+N3E5053u2we
         tgCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749824419; x=1750429219;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kDMCRDo0cthC7kWsPEVosDcgak2W50xC/1nlZdkqQZo=;
        b=ZS+qgZWUt0uxtAQQOpbpVujQb9DWRXj7d+tk2w1+NnrWZLY2A1obQ1ifYZpZsiL+5M
         o3GRORAStAPECPfXFzbsKiIowl44Q9bnX7DD1tsEEsWBrcKDPwQ3tW3EMf6QH2gDTnjO
         s+g+OxIyPpumPMYsMMWy5OcN+I0RLq9NzvxE6lzZ5z7H4ZnNwC32OF/vPXTEvMkFW5rX
         XWlRCvpet5SJwEC5NX9O8qAQA/fWK9OSAV3TYAAFidyjHJs6IwNRrBFA4NcJH2wT759l
         0Zmas+2p3hZidLBSJJl+l1RdP0ypH9tDgPOXIH//hwS5GJjyTnwUKukMYns3GldfJc5c
         WMgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVxULCoJ9uDMvQZVnij/O8B1cVviKfDw1WhnqGgQlz0mNjLPPlc8m/fDcCYoBcachcYUnqsFIY/D98/Zkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+e1EG0I8CJH9iLxq3nAV9owz/GNhFsJMTmH9HdNjUVlWAM8Nl
	B0klMPMZiXHr1ABb8tcvC08yfnxmn1nTsZMBgJ+6/IL/mJSdMfVG76JLlxBNT3q4LlA=
X-Gm-Gg: ASbGncvDHVgy8XPl5+eCz26izIHEipya73xPCf2j++kQUgFGofLIS1t4B+q12dpvpzP
	DBqdpgIiFA+Hw/JVn4ncMjSUcmBW0zRL+31WK+xoqG8X70eh1kT0gsJfpWHsd0SQ1WVRheZ9tCf
	n0QRADzwc78+G0SSI46Z06Z40cQdYYKYAbEF8w/Mgtf6JzZYiKV6p9EQbLpfGWgUKn3NVZQJzmY
	0OYxAI3fWJ+1f1eBcjSLQNp3h2wKqGNtMGWTWswrFjbNTKp8U/leWZtIR6ITaWUJcUomcbhQme5
	9Xp5r2W4Xwjs4pypOZU/KwDBtcI+uERRxiZAP/AL8V+QkTfPjnwKaATNXrF1eQ6FCC5HYZn2wp+
	wDjRoA1rNk5x+DIOdW6Q3EAScLehrXdkdWEuE
X-Google-Smtp-Source: AGHT+IFl7ASvsW2CdtBJYRdyTIxxAl3o0mUNGo3YJ7/40+1WMA2qlDXnf0YcleUYlBiHZ4WCMkw10w==
X-Received: by 2002:a05:6808:11c4:b0:403:3660:4130 with SMTP id 5614622812f47-40a723a0f4dmr2119575b6e.27.1749824419481;
        Fri, 13 Jun 2025 07:20:19 -0700 (PDT)
Received: from ?IPV6:2600:8803:e7e4:1d00:4647:c57:a73c:39d8? ([2600:8803:e7e4:1d00:4647:c57:a73c:39d8])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73a28401fffsm219284a34.15.2025.06.13.07.20.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 07:20:19 -0700 (PDT)
Message-ID: <4923f49f-273f-4166-94bc-afe39618672c@baylibre.com>
Date: Fri, 13 Jun 2025 09:20:18 -0500
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: spi: zynqmp-qspi: Split the bus
To: Sean Anderson <sean.anderson@linux.dev>, Mark Brown <broonie@kernel.org>,
 Michal Simek <michal.simek@amd.com>, linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
 linux-arm-kernel@lists.infradead.org,
 Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
 linux-kernel@vger.kernel.org, Miquel Raynal <miquel.raynal@bootlin.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 devicetree@vger.kernel.org,
 "linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>,
 Jonathan Cameron <jic23@kernel.org>, =?UTF-8?Q?Nuno_S=C3=A1?=
 <nuno.sa@analog.com>
References: <20250116232118.2694169-1-sean.anderson@linux.dev>
 <20250116232118.2694169-2-sean.anderson@linux.dev>
 <9f40295b-484a-48e8-b053-ff8550e589d7@baylibre.com>
 <46a7eba6-a705-4543-b967-e83ccc89e7d4@linux.dev>
 <6afc379a-2f9f-4462-ae30-ef6945a83236@baylibre.com>
 <dbe26b36-a10c-4afb-88ad-a6f7f9bff440@linux.dev>
Content-Language: en-US
From: David Lechner <dlechner@baylibre.com>
In-Reply-To: <dbe26b36-a10c-4afb-88ad-a6f7f9bff440@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 6:44 PM, Sean Anderson wrote:
> Hi David,
> 
> I am (finally!) getting around to doing v2 of this series, and I ran
> into a small problem with your proposed solution.
> 
> On 1/23/25 16:59, David Lechner wrote:
>> ---
>> From: David Lechner <dlechner@baylibre.com>
>> Date: Thu, 23 Jan 2025 15:35:19 -0600
>> Subject: [PATCH 2/2] spi: add support for multi-bus controllers
>>
>> Add support for SPI controllers with multiple physical SPI buses.
>>
>> This is common in the type of controller that can be used with parallel
>> flash memories, but can be used for general purpose SPI as well.
>>
>> To indicate support, a controller just needs to set ctlr->num_buses to
>> something greater than 1. Peripherals indicate which bus they are
>> connected to via device tree (ACPI support can be added if needed).
>>
>> In the future, this can be extended to support peripherals that also
>> have multiple SPI buses to use those buses at the same time by adding
>> a similar bus flags field to struct spi_transfer.
>>
>> Signed-off-by: David Lechner <dlechner@baylibre.com>
>> ---
>>  drivers/spi/spi.c       | 26 +++++++++++++++++++++++++-
>>  include/linux/spi/spi.h | 13 +++++++++++++
>>  2 files changed, 38 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
>> index 10c365e9100a..f7722e5e906d 100644
>> --- a/drivers/spi/spi.c
>> +++ b/drivers/spi/spi.c
>> @@ -2364,7 +2364,7 @@ static void of_spi_parse_dt_cs_delay(struct device_node *nc,
>>  static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>  			   struct device_node *nc)
>>  {
>> -	u32 value, cs[SPI_CS_CNT_MAX];
>> +	u32 value, buses[8], cs[SPI_CS_CNT_MAX];
>>  	int rc, idx;
>>  
>>  	/* Mode (clock phase/polarity/etc.) */
>> @@ -2379,6 +2379,29 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
>>  	if (of_property_read_bool(nc, "spi-cs-high"))
>>  		spi->mode |= SPI_CS_HIGH;
>>  
>> +	rc = of_property_read_variable_u32_array(nc, "spi-buses", buses, 1,
>> +						 ARRAY_SIZE(buses));
>> +	if (rc < 0 && rc != -EINVAL) {
>> +		dev_err(&ctlr->dev, "%pOF has invalid 'spi-buses' property (%d)\n",
>> +			nc, rc);
>> +		return rc;
>> +	}
>> +
>> +	if (rc == -EINVAL) {
>> +		/* Default when property is omitted. */
>> +		spi->buses = BIT(0);
> 
> For backwards compatibility, the default bus for CS 1 on gqspi must be 1
> and not 0. Ideally there would be some hook for the master to fix things
> up when the slaves are probed, but that doesn't seem to exist. I was
> thinking about doing this with OF changesets. Do you have any better
> ideas?
> 

Does this work? 

		spi->buses = BIT(cs[0]);

(would have to move all the new code after cs[0] is assigned of course)
