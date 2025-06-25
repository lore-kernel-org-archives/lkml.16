Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 275612820BA
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:56:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750845390; cv=none; b=Y7CF/3HIY60mil/kIq+pugbUnmGXSaMR42fYE1Zl7izWChnPrss6vT/n7nYntrfM/uGHTRhA0CfRZ95cbICiFiIjJayFZSFZdThpkdxgEW9LVvVZ11hyhMPiWlMmea889BhvUWXvP1ng0qILfsp6OMb/dWNCyPlvqbxpOzWwTuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750845390; c=relaxed/simple;
	bh=8FU/7tPeSpa7lK21KpiF9ik38Y+Bs84pnJnck2VkIBU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CWP9NZrVjieBVHj7TtdbopmjxO7b3soX8xajyXb8Mr7cHob+TEffEQ1DpsMPbjo4JMmR0QKoh4VJAwJbQ/lwcjcKaW7hJZdC0KMq22MyW8ussge4/Noi3Ldw1a/mrMh11ASunIWdzqj0m/wqRHPczqIkRZrATHFmXCS0yhtWFrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+OJek/I; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+OJek/I"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so482075f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750845387; x=1751450187; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mnv6+0ikBWTu5GUwzfXL+31J9Qfk+uEDhfcL5PdN9P4=;
        b=W+OJek/IgJud9HkcVZp/KJttq4ju8cJrgxCOjwNTpVvfKC8BeOdzSoMx/kI6kggBJQ
         Tax8Oxqfkt2pB6GKMre4RAf5svXwqLlYj0tmrj03HAAwtELto8D/qzZpeM8sGvpWYeZi
         X/XeJIHfMhy1/tuUndOGHamdHekqojCymHZygxXZErJkXnDYrTYlQ28kWQn5+NssCUan
         LijnHdFBjm9NdiBZkqUdey/ABHX1sSzIXEi72TFNrbeqsKJ2PAs915yBVpaqGds5jj2U
         +8U+/7sfevi1SqngZiLIYTEicsJy7houR3gUBm8gyXNZudxvwl3o+TfGPM0+UZnn0MO2
         uREA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750845387; x=1751450187;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mnv6+0ikBWTu5GUwzfXL+31J9Qfk+uEDhfcL5PdN9P4=;
        b=Ac7uZMXmUD/PHvmPUpdPlmAAwjKGNjZsp7AEITtlU5NWXnIWMP1phOe7djRvxzAyk/
         TuGH3y0EeYvvazb4neP1EWAR2gpVFVWU1+W4HL+bNi3p+OzJjlHoFDyJLCAYD3irnRMK
         Po5pk4NDbgx8nbNs99Tou9vAbp22VLccoXuT8aOR1XPzlYXvD0lu7EPsdoCrt0OAw7gV
         R6uFpju0G5yKBdT23s3EmEieyOhPEiJemYSVXCOFwJVNdvmVATHz5+/+b3u57KqMfXXq
         F/0YMzJRku4J6EavHBquLf4ySZNvN5tAH2xoDnadb9K+rh4EZ2kew0b/NF04sxh2S4Is
         wNAw==
X-Forwarded-Encrypted: i=1; AJvYcCWr0tlBw0xrb8XXMjTlohPQAX/jQ4H8h5ao2HL4u4dZerwU1IqQaKxOGpvshCKclDUc5ccDm9MuO9zHWGY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxN4IEcgvYWnVK5PlG/wIncrOkFNYXnsT4+BBvoRHZjlaF8Rdfb
	6MLYUPHstYHGqKrIZWiVwV1kVV/BgxIFmUjar4YVIqFpHs5ULceN9yqkRku9uqaslxk=
X-Gm-Gg: ASbGncs4KYjy9Y5W2mq1FcVVoJh15eFYwWaII13E+TXX5NvWD9TQf/Pnv+C/M5rdeNh
	NTh2QHWVoIidiJtM/OXI71xrPQsTTezLCBGkpK8PMMdssD1/pfOGqWepijgr/cwyr4vnyb18Eo+
	hCI4ykzH0PIAL8Mdulzh8p9jkrfKb1RcrCfz+PnOXBWKIWgCW8Efj6CR8VJL7QH30F+fPh8SWj4
	PprABlMdhQ+sf82y3ucUfMXcr1YTvYv9t09pdsv5wKELqOqbh4Hs2Ks/6nn5PbPvW9qjz82uvRQ
	//yifnlHUE3dGVmwV327fTXd/nJHD9EJmNGjs9rlJImnMStCvcQIxgBL+CD9HTJSHcs=
X-Google-Smtp-Source: AGHT+IHUT2mOdBDTYilOC0pGw2ewz3RMDzSyuUrAJ3h5EYqrxtwLBoi5uS6ecJ7xvkaUQCE+iExiWw==
X-Received: by 2002:a5d:64e6:0:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3a6e71ff6aamr6132185f8f.15.1750845387416;
        Wed, 25 Jun 2025 02:56:27 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c749sm15055145e9.4.2025.06.25.02.56.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Jun 2025 02:56:26 -0700 (PDT)
Message-ID: <a27378b4-45f7-4f5f-b01f-72eb9b7d2d8f@linaro.org>
Date: Wed, 25 Jun 2025 10:56:25 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] spi: spi-fsl-dspi: Store status directly in
 cur_msg->status
To: Frank Li <Frank.li@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Vladimir Oltean <vladimir.oltean@nxp.com>, Arnd Bergmann <arnd@arndb.de>,
 Larisa Grigore <larisa.grigore@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250624-james-nxp-spi-dma-v3-0-e7d574f5f62c@linaro.org>
 <20250624-james-nxp-spi-dma-v3-2-e7d574f5f62c@linaro.org>
 <aFrP1ZNvjHCPmbWG@lizhi-Precision-Tower-5810>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <aFrP1ZNvjHCPmbWG@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 24/06/2025 5:18 pm, Frank Li wrote:
> On Tue, Jun 24, 2025 at 11:35:32AM +0100, James Clark wrote:
>> This will allow us to return a status from the interrupt handler in a
>> later commit and avoids copying it at the end of
>> dspi_transfer_one_message(). For consistency make polling and DMA modes
>> use the same mechanism.
>>
>> Refactor dspi_rxtx() and dspi_poll() to not return -EINPROGRESS because
>> this isn't actually a status that was ever returned to the core layer
>> but some internal state. Wherever that was used we can look at dspi->len
>> instead.
>>
>> No functional changes intended.
>>
>> Signed-off-by: James Clark <james.clark@linaro.org>
>> ---
>>   drivers/spi/spi-fsl-dspi.c | 68 ++++++++++++++++++++++++----------------------
>>   1 file changed, 35 insertions(+), 33 deletions(-)
>>
>> diff --git a/drivers/spi/spi-fsl-dspi.c b/drivers/spi/spi-fsl-dspi.c
>> index 744dfc561db2..feb29bb92a77 100644
>> --- a/drivers/spi/spi-fsl-dspi.c
>> +++ b/drivers/spi/spi-fsl-dspi.c
>> @@ -591,11 +591,10 @@ static int dspi_next_xfer_dma_submit(struct fsl_dspi *dspi)
>>
>>   static void dspi_setup_accel(struct fsl_dspi *dspi);
>>
>> -static int dspi_dma_xfer(struct fsl_dspi *dspi)
>> +static void dspi_dma_xfer(struct fsl_dspi *dspi)
>>   {
>>   	struct spi_message *message = dspi->cur_msg;
>>   	struct device *dev = &dspi->pdev->dev;
>> -	int ret = 0;
>>
>>   	/*
>>   	 * dspi->len gets decremented by dspi_pop_tx_pushr in
>> @@ -612,14 +611,12 @@ static int dspi_dma_xfer(struct fsl_dspi *dspi)
>>   		message->actual_length += dspi->words_in_flight *
>>   					  dspi->oper_word_size;
>>
>> -		ret = dspi_next_xfer_dma_submit(dspi);
>> -		if (ret) {
>> +		message->status = dspi_next_xfer_dma_submit(dspi);
>> +		if (message->status) {
>>   			dev_err(dev, "DMA transfer failed\n");
>>   			break;
>>   		}
>>   	}
>> -
>> -	return ret;
>>   }
>>
>>   static int dspi_request_dma(struct fsl_dspi *dspi, phys_addr_t phy_addr)
>> @@ -986,36 +983,40 @@ static void dspi_fifo_write(struct fsl_dspi *dspi)
>>   				dspi->progress, !dspi->irq);
>>   }
>>
>> -static int dspi_rxtx(struct fsl_dspi *dspi)
>> +static void dspi_rxtx(struct fsl_dspi *dspi)
>>   {
>>   	dspi_fifo_read(dspi);
>>
>>   	if (!dspi->len)
>>   		/* Success! */
>> -		return 0;
>> +		return;
>>
>>   	dspi_fifo_write(dspi);
>> -
>> -	return -EINPROGRESS;
>>   }
>>
>> -static int dspi_poll(struct fsl_dspi *dspi)
>> +static void dspi_poll(struct fsl_dspi *dspi)
>>   {
>>   	int tries = 1000;
>>   	u32 spi_sr;
>>
>> -	do {
>> -		regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>> -		regmap_write(dspi->regmap, SPI_SR, spi_sr);
>> +	while (dspi->len) {
> 
> Preivous have not checked dspi->len.
> 
> Not sure if it is logical equivalence
> 

It used to be this:

    status = dspi_poll(dspi);
  } while (status == -EINPROGRESS);

Where checking status for -EINPROGRESS is equivalent to checking dspi->len.

>> +		do {
>> +			regmap_read(dspi->regmap, SPI_SR, &spi_sr);
>> +			regmap_write(dspi->regmap, SPI_SR, spi_sr);
>>
>> -		if (spi_sr & SPI_SR_CMDTCF)
>> -			break;
>> -	} while (--tries);
>> +			if (spi_sr & SPI_SR_CMDTCF)
>> +				break;
>> +		} while (--tries);
>>
>> -	if (!tries)
>> -		return -ETIMEDOUT;
>> +		if (!tries) {
>> +			dspi->cur_msg->status = -ETIMEDOUT;
>> +			return;
>> +		}
>>
>> -	return dspi_rxtx(dspi);
>> +		dspi_rxtx(dspi);
>> +	}
>> +
>> +	dspi->cur_msg->status = 0;
>>   }
>>
>>   static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>> @@ -1029,8 +1030,13 @@ static irqreturn_t dspi_interrupt(int irq, void *dev_id)
>>   	if (!(spi_sr & SPI_SR_CMDTCF))
>>   		return IRQ_NONE;
>>
>> -	if (dspi_rxtx(dspi) == 0)
>> +	dspi_rxtx(dspi);
>> +
>> +	if (!dspi->len) {
>> +		if (dspi->cur_msg)
>> +			WRITE_ONCE(dspi->cur_msg->status, 0);
>>   		complete(&dspi->xfer_done);
>> +	}
>>
>>   	return IRQ_HANDLED;
>>   }
>> @@ -1060,7 +1066,6 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   	struct spi_device *spi = message->spi;
>>   	struct spi_transfer *transfer;
>>   	bool cs = false;
>> -	int status = 0;
>>   	u32 val = 0;
>>   	bool cs_change = false;
>>
>> @@ -1120,7 +1125,7 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   				       dspi->progress, !dspi->irq);
>>
>>   		if (dspi->devtype_data->trans_mode == DSPI_DMA_MODE) {
>> -			status = dspi_dma_xfer(dspi);
>> +			dspi_dma_xfer(dspi);
>>   		} else {
>>   			/*
>>   			 * Reset completion counter to clear any extra
>> @@ -1133,15 +1138,12 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>
>>   			dspi_fifo_write(dspi);
>>
>> -			if (dspi->irq) {
>> +			if (dspi->irq)
>>   				wait_for_completion(&dspi->xfer_done);
>> -			} else {
>> -				do {
>> -					status = dspi_poll(dspi);
>> -				} while (status == -EINPROGRESS);
>> -			}
>> +			else
>> +				dspi_poll(dspi);
>>   		}
>> -		if (status)
>> +		if (READ_ONCE(message->status))
> 
> Why need READ_ONCE()? Does any hardware (DMA) set status?
> 
> where update message->status at pio mode.
> 
> Frank

Because message->status is set from dspi_interrupt(), so the compiler 
wouldn't be aware that this variable can be changed from elsewhere. 
Otherwise it could assume that it's never written to in 
dspi_transfer_one_message() and not bother to read it again.

>>   			break;
>>
>>   		spi_transfer_delay_exec(transfer);
>> @@ -1150,7 +1152,8 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   			dspi_deassert_cs(spi, &cs);
>>   	}
>>
>> -	if (status || !cs_change) {
>> +	dspi->cur_msg = NULL;
>> +	if (message->status || !cs_change) {
>>   		/* Put DSPI in stop mode */
>>   		regmap_update_bits(dspi->regmap, SPI_MCR,
>>   				   SPI_MCR_HALT, SPI_MCR_HALT);
>> @@ -1159,10 +1162,9 @@ static int dspi_transfer_one_message(struct spi_controller *ctlr,
>>   			;
>>   	}
>>
>> -	message->status = status;
>>   	spi_finalize_current_message(ctlr);
>>
>> -	return status;
>> +	return message->status;
>>   }
>>
>>   static int dspi_set_mtf(struct fsl_dspi *dspi)
>>
>> --
>> 2.34.1
>>

