Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA98427FB27
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845148; cv=none; b=i5uTSNt6F9AtXu239WpxlF1PzpFG96ricRJ9OgvO/zq2/NsVfl8qpOw59f7zTZxU05lWYEn55467Kr6GR8QzufAxCWciS+5MiTGktrJxQKUTLkTR824RiIzrlwR04WPHnoB899b6E2ct+8wEn0FxdKgIb3yuYxmdQjgkvgl0k/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845148; c=relaxed/simple;
	bh=MrRga72y9s3IG9s+3PWdhvyFhlYCAnz1dBzKqnRtsvw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UtATED/xLbbDDLaAp5IwJVPKUiCT5aaUmPEc3Igy3Cp5hSNAPHL5HyrQ2PKSb4aSnEXCm3iZzLPUBAKGFcEReMwCeJrMO7zVSLCF8FOdvT8bXQspSpwCthFqIuXPDNlJevOYGgLKnImubwreWQHYcBVpp5Bu8Fwhm8OSHTDMOz8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+N3SKJF; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+N3SKJF"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4537fdec33bso9052085e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845145; x=1751449945; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gvynr5GPXAD7xF14LG7ABlRKJ5SF08nktafK/D9Sp4o=;
        b=Z+N3SKJFuiPHaejrVN9ql6f/eYo9opFv/34l4t2kNyVuZJoBMnnz2r80ZfEdoA7aGF
         DIptkYPQkY6kZN0bdSZ7qmNxmL39a/iO4moJUt+f+vTQYU74Au060W+0sd3pYH12oA7L
         WqbiDn2SACu1YYwbIkJ/tvlju7kWkm/bqnXrTfhXD3HoRUD23mW/PXhZREFK5dSg1yxp
         10oajCPwXJBUR45kT2ut/FjQYbCCrx68A4utXijV2vWube1lMdXXwCxknADrZiYoQZMh
         LVBjhtH0FMZsY1nDewk2b0yoV+jpgSM5C/Meek/+ZTe52ohRptW+qk0xEAg+cZpzVFra
         lt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845145; x=1751449945;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gvynr5GPXAD7xF14LG7ABlRKJ5SF08nktafK/D9Sp4o=;
        b=PyoUVyvz9TgHgTJM8XYtHa9rHbnk7Lz6tVxh4scPuaI/bbtCuSIUu/RP0Qqus+kYMQ
         4fk0U0gTicacQFhEq9myyWlY4W9KeRgqvQPd0WEDvY5d1c9yypjHBs6Qnr1+Nv/zAx2n
         frRMC4b8nlz6a/4lIDZLUjecUW8NQfewtFnn35+xqwddsvp11M8BYCzALaJuDnt0MGUQ
         cExprEvQX6fPvWZz31gUebofra4fWRFjeAwek3W6Zx8fyEM4RxTSUFwPjXHaN47gEBO3
         dKGv5afb7qVVxdOpuOsYvfndJ6b/VKhw545Pz2eXEgoIgJGwVutWdUWD2jBxMK3o1TM0
         1YmA==
X-Forwarded-Encrypted: i=1; AJvYcCVV43X/qAxVq695XFmRJk6X/nxxMzEosT3/9934NRTcnUmNFNeHXbvnXUYq2Bf6nDTpn1kQe2nVN/bFIW8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzUoL3Yt2sHUGeekonkslP49N1IzjJHHX9LTZ29RwdRGdYD9AiJ
	SsXnZB8/vqqb5oKfV85ToV32N63mFywSEmUzehI11W7399/b76g8/GOx3zcyKTmLFOY=
X-Gm-Gg: ASbGncuBFh56Z1bhtmBktv4iXtiLsLR7cEUANw50J/UlCnO1NsLDMSsyucnkDeZIMhU
	tMcaaaGs7g5AQqyxxav33H8qczUJaw+N0wRuztGT9Rl79Y6+BpxWsMA1Wnf9PMwLnMghXVmPfuN
	8JCl3DGcpHFBwo8dgmECqF+bIsFqEb1/6ztYlCFR2qNiKELrYoyu1lKTTAwDmPvOYot4yLmOoAF
	vPCMQk232+pam2XxBcihV+9I/WM7MB5LTIlP78U6Lijpvefti/ylP0UOl4JikME4RhlW5CPuKQG
	Apz7/tcVm2aSecxhezse9Pu6J3oqPd1/mn6rx74FhQkQLGWtu2f8mAEiVJjJ8TKQNBQ=
X-Google-Smtp-Source: AGHT+IGWhnH2ozWlkqt9r0oHgwgVkhzmM8aFffesqO/fLKJ2oKRNU+kDEm/CqDK4ln1Y/aAeqeYL2g==
X-Received: by 2002:a05:600c:8b70:b0:442:cab1:e092 with SMTP id 5b1f17b1804b1-45381ab1724mr20000025e9.11.1750845144979;
        Wed, 25 Jun 2025 02:52:24 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453822c3084sm15607705e9.0.2025.06.25.02.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:52:24 -0700 (PDT)
Message-ID: <3eddec49-f41a-4b59-972f-92693677bb7c@linaro.org>
Date: Wed, 25 Jun 2025 10:52:23 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/6] spi: spi-fsl-dspi: Clear completion counter before
 initiating transfer
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-1-e7d574f5f62c@linaro.org>
 <aFrLMCq6hRJj5FjI@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFrLMCq6hRJj5FjI@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 4:58 pm, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:35:31AM +0100, James Clark wrote:
>> In target mode, extra interrupts can be received between the end of a
>> transfer and halting the module if the host continues sending more data.
>> If the interrupt from this occurs after the reinit_completion() then the
>> completion counter is left at a non-zero value. The next unrelated
>> transfer initiated by userspace will then complete immediately without
>> waiting for the interrupt or writing to the RX buffer.
>>
>> Fix it by resetting the counter before the transfer so that lingering
>> values are cleared. This is done after clearing the FIFOs and the
>> status register but before the transfer is initiated, so no interrupts
>> should be received at this point resulting in other race conditions.
>>
>> Fixes: 4f5ee75ea171 ("spi: spi-fsl-dspi: Replace interruptible wait queue with a simple completion")
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 10 +++++++++-
>>   1 file changed, 9 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index 04c88d090c4d..744dfc561db2 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -1122,11 +1122,19 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
>>   			status = dspi_dma_xfer(dspi);
>>   		} else {
>> +			/*
>> +			 * Reset completion counter to clear any extra
>> +			 * complete()s from spurious interrupts that may have
>> +			 * happened after the last message's completion but
>> +			 * before the module was fully in stop mode.
>> +			 */
> 
> I think you change is correct. reinit_completion() should be called before
> dspi_fifo_write().
> 
> comments is quite confused. how about below comments?
> 
> /*
>   * Reinitialize the completion before transferring data to avoid the case where
>   * it might remain in the done state due to a spurious interrupt from a previous
>   * transfer. This could falsely signal that the current transfer has completed.
>   */
> 
> Frank

Will do

>> +			if (dspi->irq)
>> +				reinit_completion(&dspi->xfer_done);
>> +
>>   			dspi_fifo_write(dspi);
>>
>>   			if (dspi->irq) {
>>   				wait_for_completion(&dspi->xfer_done);
>> -				reinit_completion(&dspi->xfer_done);
>>   			} else {
>>   				do {
>>   					status = dspi_poll(dspi);
>>
>> --
>> 2.34.1
>>

