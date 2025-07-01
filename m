Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09B2B140E34
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751382540; cv=none; b=FaVAfyHg/d2eEgx/tkR4YBG9f+kMY/t8Wa5ZT9V+REOyday819P5b6nnvLVS93CSmPh1zRo/n5+yKYGwQEwiwjHTev7jD35AEPLXtekyFaphFcqVB1CwA47/3PtK6JTeZDhmRd6fGHACcRJw4TO75rrVK6sBs4Zplo+qzgLn5cU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751382540; c=relaxed/simple;
	bh=LygfmcVRSaPOsa8+C2yvEY4RHbClFgk/DP5RCPz6doI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GZqYG/zcTXiXFCS2Q41webWxnSzlEoOxkc38LhLNkMU89WolbLd3vdJB60JvCpi4d6T0mfwy+V84PaWbE2iZuI7ckQfV3DoJ6QP6m0EFbp4ICphELaHUhDAjMisPfS9aLostmwS7EeJQSIsqxjalv0MF1Wg5qNUV2RWxt3Iwnxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W+vYhc5o; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W+vYhc5o"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a4ef2c2ef3so2995897f8f.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:08:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751382537; x=1751987337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=H4YWJf36Jd5Za5bEQzBkDardDPxHz8Phk46tA5vnrP8=;
        b=W+vYhc5osgB1C+JsA78GrYBitNA6wsPzWZ1MhQdFSbxx3qWlE4+Uz++VRGa3YZUV2E
         pbKB1Col7IkY8/DxlpSBihFe18/Fz9p+tk5B+x3eOzR1m1jkCMtPkopCaIAoMbOdcl2H
         uq6HcJ9VyjwhB9mv4zOObYXvEEj1PLcPUHCAqn2KWgE5LqtX1SLVBUa2w3FpOkHOIpBt
         YBLBNaVUUd50rw2KR8QujGlE2ngY9ZP9yY07ALPdZa5pErakq2S3FVGa86eZgma571U0
         MqlVIt8oDiDDVGzb9xEBJ2tp+cRSy5hTQ3jpZrZ6wu+UEhRClRW2YKqr7xWj7VZe0GG6
         aSoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751382537; x=1751987337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H4YWJf36Jd5Za5bEQzBkDardDPxHz8Phk46tA5vnrP8=;
        b=t+NuIDw8OYA8D36XvTpTxq8Kv7fwMWrr2RivvNCFRjRw/y0Cjc/TVjtFRlb5rdMiVk
         rGuqfRz8pcETbHbvkkWdd4CXtZLtJvI66VaFBhTUmMskUjRMyoTHb2CVLcBe8UrHZO3U
         2+/UtUDcVfrYHfRC+OFmi4EgYhRAs7wCi7Upt2zT70P19QtoMx1woBIH2hrVCOex3zEk
         J3EwfAxddfirhFRIKe7PAa8FvU53Jf4P9brS32/PXrRqkN7ifGkIuU3MwIHeAWLFtzHW
         Szz8JM0/k6fmM/0J0d7NUUifM/B2n0D41e9lAw9ppmF4CfX2gYde8IDoVVJpNUwWQ9ao
         OOSw==
X-Forwarded-Encrypted: i=1; AJvYcCVFv7DrTeM8dVCs18Ada2BuWxFKmkZiPeq6/wq8FfosFc9TwTCbr1bGkRC3iafxG+3ewHjQs0DxtkoTXBc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/2F9QmmUSJycix9Noor070LeYzOwI1FVc0/ACyYlJgq4e/HQH
	8/qR1MLX3iNNaD47z0p4UKzsWml7fxMKnGKpiNrnEyYP+w5OWQm2OCFSgrwE4k0p2MeVvylZIF7
	ikQxLzeA=
X-Gm-Gg: ASbGncsuEwXhEfGlENCAPbof7JCiDt5HbhK2fv7WjNr4OQ9Ix9VDxQydxSCXezUGwgx
	Dz7gA9QnNM7ds/pjMr2nIQsg8kifrtnRquAyjNQBG50IY0xZYoz39hBl14bJcSKYSq1St4dBHeJ
	ao2PipWeqcRyoADzIPDBh45hvt6cSoHT5P5IEeMb88/YFBoFSrdGK1h+p+5RV4qd295LbHFVHTj
	mVWxN8c64pP2EGVV7nZRRNvbz8K4qB4MD+a0liXM/ZdjVlVlSVbXkyiZb2fT0dqwSx01oaAuuza
	Wu1S45ktmL75osSF/hIRSJ+xOvDtCV7RC2/rmO94523jXB3JgDQ6gxCu4lg9/z4d4G8=
X-Google-Smtp-Source: AGHT+IEbIjn4wdPBC/r5LoH/ZIV7Nx4cdgbX0q9FVgHuQEdOsmJoG9kbU5u7jAyd+uqc2CbplXsd9Q==
X-Received: by 2002:a05:6000:440f:b0:3a3:6595:9209 with SMTP id ffacd0b85a97d-3a8fdeffb3emr9901767f8f.36.1751382536969;
        Tue, 01 Jul 2025 08:08:56 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a87e947431sm13537193f8f.0.2025.07.01.08.08.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:08:56 -0700 (PDT)
Message-ID: <019e182b-2830-4325-8c85-19041afd40f4@linaro.org>
Date: Tue, 1 Jul 2025 16:08:55 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/6] spi: spi-fsl-dspi: Increase DMA buffer size
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, Larisa Grigore <larisa.grigore@nxp.com>,
 Frank Li <Frank.li@nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250627-james-nxp-spi-dma-v4-0-178dba20c120@linaro.org>
 <20250627-james-nxp-spi-dma-v4-5-178dba20c120@linaro.org>
 <20250701144711.hfcgk7hhk5w4jmvf@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250701144711.hfcgk7hhk5w4jmvf@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 01/07/2025 3:47 pm, Vladimir Oltean wrote:
> On Fri, Jun 27, 2025 at 11:21:41AM +0100, James Clark wrote:
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
> 
> Is this really a constant that can be hardcoded? Should this be queried
> from the EDMA driver somehow?
> 
> I'm not well versed in the dmaengine/dma-mapping API at all, but I see
> fsl_edma_probe() makes a call to dma_set_max_seg_size(), which consumer
> drivers such as DSPI can query using dma_get_max_seg_size(). To the
> untrained eye, and from a great distance, it looks like the value you're
> interested in. Apologies if that isn't the case.
> 

You're probably right, and there's no particular reason to hard code it 
if it can be queried. I'll have a look at this.

>> +	}
>> +
>> +	return PAGE_SIZE;
>> +}
> 
> The other question is: what's fundamentally different between the host
> and target operating modes, such that we return different values? Why
> not the same?

This is missing from the commit message, but the reason is because it's 
a large allocation (256K with both tx and rx buffers) that should be 
avoided unless absolutely necessary so we wanted to limit it to only 
target devices.

The other reason to not allocate it dynamically based on the size of the 
message is because we assumed that it was better to do large contiguous 
allocations at boot time. If it's delayed until the device is used then 
the allocation might fail due to memory fragmentation.

