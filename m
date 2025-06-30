Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BE4C24167B
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 08:59:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273981; cv=none; b=jFNxnzEs4339VAvItzcOaXOCsqyyJDI9c1mouT5tggesYvgklZqG1XYmK1OSyThl+G6QcEIHc1BETES0AjFU9Q99KI0zcZTifd8Rm+Yzn/FUr2Pe3q6OX9bq9jwMpCRF54vJa0fid+7WE8Y7sQIxJGjEIgFLZlPzxXXZQr3Wm3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273981; c=relaxed/simple;
	bh=0d4NWuuezUBZlI0MbfJ8R55nhZk0xBUsGlRY5Ft/aiM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o8K7TzlQ0iObviBclwrToUqWM3IQfChAGDmA9JGakwiESgQC8BGXfKTR6maqUxmQuUQpILZPqDU9M12O5vjn5OFU8YCWAGbjEBj+oMi9AW3ji/l58LoPlX5Jwtpuyq07o5TzDCwnQ5mJh1gXClyLdvPnfph0xTZlejUfq3rJ6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Lce+Q07R; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Lce+Q07R"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4e742dc97so3249626f8f.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 01:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751273978; x=1751878778; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VFQu7mhixaS1abvpxxXFoPLoeKYeIfJ3hDE1BdxuAGs=;
        b=Lce+Q07RgiYIETwaM6uVTxLETadO+z4jvSbqbq07UJK1hCzpwtv/JYr8dJD8LOveIc
         sqJN68+WYDBUnggbnKfZ6+uP1F78W15Yx6GGjZjar7uZvV4jqQfI+3dUnW1WGTX9ic6y
         oT2a3hZ+oAxhM/cPsAVxF2CSgEJQbD2+Ao5clNj/2t3yOL5XwRUlcjQHyMLQU1vOKmXZ
         CWZQtCzuZ+Z/90CskKhVPuxipdV7zCNrY1nsyl3hRNWObgL2hwcy8LZeQ8fSnSMDbov7
         OWpfV5Ht/gWOZYyJPD82h1qO30B0R1240IknxY3UzY+hAIK64Z42MmH+tjJ34B/oN1NF
         kblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273978; x=1751878778;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VFQu7mhixaS1abvpxxXFoPLoeKYeIfJ3hDE1BdxuAGs=;
        b=sIHAChqpfbjjBlQ8FSF/elVIAHIdPiU/P1ZU0+7R8yd5rQ3wh6KFJcQn3h/K/FqxrM
         KY2/zO76QTXEZVlIGH6J5dJgdW5IKDrvHh0AvqCNBtEZ6KWova+s9K3fHLy1slr168kd
         nY7O8jNHayw2hOwE/B38adyrp6/0kX0yGVnpkGGXVUIG+6c/9bBRxUXLsj5Se0AZpKor
         nhGWrRZ6vsxP7a3ZmTPsUq2Yvmsy3cfNIVNth+q1xtB1mubeT2lolgu4c3s3De2Y5RtQ
         E6AfoMZalYlROpU1WwQIxbAQYggeusPb+6CZtLvsdmdygYhLSXvsAyVeIEceDNw89cJA
         yH8Q==
X-Forwarded-Encrypted: i=1; AJvYcCX372vt7j3BKXbeTgOSrnidan/PdERAibC5kSdW3GtbpZLEEN8NeQq12oDZoCDfs6IaY4BHTGKnodHvK7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPjzHO5LMEYFsk2ODXYaCzYf24Wz5yrywYuE87oJX2FdrbDslJ
	d69fj+Tu2t/qRXKDXjUhRxlmiKzZ27Qc+rSIhcxjhi1D0HE4FIZpcLolyDxbmdfY1VU=
X-Gm-Gg: ASbGncvsCVk8K8E0gWRoOM77p5mo7Pg9nbOzpf36uIhKyvxFvJhvq6SxpLSZTRRGIWp
	u4eIEQKxwpqHE4agT/MPJrRPMfdbZ6Pn0iwn0kGsidI0xWISIKuHX676kaKPPL73Z+3QmoysdDZ
	qB5YtsSksaxmQoOv++igvrUAdgrQzL/jGjeD2WAl/P9agjDU1su/1O5jt/9L4+MaZF/cAR3mnQi
	0VOPMrLKucOGPG3QtYDKGF1XG7XMPkZnpDAWMEo9ft0qFG4dYYfxHNJToqHe5GwM7BtcVRse9j4
	My/VBToNbmDkGo2AsXMW8t9q3ie7NEBCOtc85E6HjyDlXrtgVUKfYe5Xno+POQma6bQ=
X-Google-Smtp-Source: AGHT+IG5ktpnxyBI4y1IzWi1qogVxb1CyTNnkfSh78AccIm7IuhUZAbeEi1X7pwMTpV3iZq17jhRIQ==
X-Received: by 2002:a05:6000:3103:b0:3a5:5136:bd25 with SMTP id ffacd0b85a97d-3a6f30fc160mr14023708f8f.1.1751273977592;
        Mon, 30 Jun 2025 01:59:37 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7fada5sm9958423f8f.32.2025.06.30.01.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 01:59:37 -0700 (PDT)
Message-ID: <65622175-1c5a-4228-831b-6e2f8c05a9f0@linaro.org>
Date: Mon, 30 Jun 2025 09:59:36 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] spi: spi-fsl-dspi: Increase DMA buffer size
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-5-178dba20c120@linaro.org>
 <aF70skVHeSRU3BTu@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aF70skVHeSRU3BTu@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 27/06/2025 8:44 pm, Frank Li wrote:
> On Fri, Jun 27, 2025 at 11:21:41AM +0100, James Clark wrote:
>> From: Larisa Grigore <larisa.grigore@nxp.com>
>>
>> When the device is configured as a target, the host won't stop sending
>> data while we're draining the buffer which leads to FIFO underflows
>> and corruption.
>>
>> Increase the DMA buffer size to the maximum words that edma can
>> transfer once to reduce the chance of this happening.
>>
>> While we're here, also change the buffer size for host mode back to a
>> page as it was before commit a957499bd437 ("spi: spi-fsl-dspi: Fix
>> bits-per-word acceleration in DMA mode"). dma_alloc_noncoherent()
>> allocations are backed by a full page anyway, so we might as well use it
>> all.
>>
>> Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 42 ++++++++++++++++++++++++++++++++++++++----
>>   1 file changed, 38 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index e7856f9c9440..46d3cae9efed 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -493,6 +493,39 @@ static u32 dspi_pop_tx_pushr(struct fsl_dspi *dspi)
>>   	return cmd << 16 | data;
>>   }
>>
>> +static int dspi_dma_bufsize(struct fsl_dspi *dspi)
>> +{
>> +	if (spi_controller_is_target(dspi->ctlr)) {
>> +		/*
>> +		 * In target mode we have to be ready to receive the maximum
>> +		 * that can possibly be transferred at once by EDMA without any
>> +		 * FIFO underflows. This is CITER * SSIZE, where SSIZE is a max
>> +		 * of 4 when transferring to a peripheral.
>> +		 */
>> +		return GENMASK(14, 0) * DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +	}
>> +
>> +	return PAGE_SIZE;
>> +}
>> +
>> +static int dspi_dma_max_datawords(struct fsl_dspi *dspi)
>> +{
>> +	/*
>> +	 * Transfers look like this so we always use a full DMA word regardless
>> +	 * of SPI word size:
>> +	 *
>> +	 * 31              16 15                   0
>> +	 * -----------------------------------------
>> +	 * |   CONTROL WORD  |     16-bit DATA     |
>> +	 * -----------------------------------------
>> +	 * or
>> +	 * -----------------------------------------
>> +	 * |   CONTROL WORD  | UNUSED | 8-bit DATA |
>> +	 * -----------------------------------------
>> +	 */
>> +	return dspi_dma_bufsize(dspi) / DMA_SLAVE_BUSWIDTH_4_BYTES;
>> +}
>> +
>>   static int dspi_dma_transfer_size(struct fsl_dspi *dspi)
>>   {
>>   	return dspi->words_in_flight * DMA_SLAVE_BUSWIDTH_4_BYTES;
>> @@ -608,6 +641,7 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>   static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>   {
>>   	struct spi_message *message = dspi->cur_msg;
>> +	int max_words = dspi_dma_max_datawords(dspi);
>>   	struct device *dev = &dspi->pdev->dev;
>>
>>   	/*
>> @@ -619,8 +653,8 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>   		dspi_setup_accel(dspi);
>>
>>   		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
>> -		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
>> -			dspi->words_in_flight = dspi->devtype_data->fifo_size;
>> +		if (dspi->words_in_flight > max_words)
>> +			dspi->words_in_flight = max_words;
> 
> you touch this line
> 
> 		dspi->words_in_flight = min(dspi->words_in_flight, max_words);
> 
> Frank

Ack

>>
>>   		message->actual_length += dspi->words_in_flight *
>>   					  dspi->oper_word_size;
>> @@ -635,7 +669,7 @@ static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>
>>   static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>>   {
>> -	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
>> +	int dma_bufsize = dspi_dma_bufsize(dspi);
>>   	struct device *dev = &dspi->pdev->dev;
>>   	struct dma_slave_config cfg;
>>   	struct fsl_dspi_dma *dma;
>> @@ -719,7 +753,7 @@ static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>>
>>   static void dspi_release_dma(struct fsl_dspi *dspi)
>>   {
>> -	int dma_bufsize = dspi->devtype_data->fifo_size * 2;
>> +	int dma_bufsize = dspi_dma_bufsize(dspi);
>>   	struct fsl_dspi_dma *dma = dspi->dma;
>>
>>   	if (!dma)
>>
>> --
>> 2.34.1
>>

