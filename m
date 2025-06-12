Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C483324A079
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749738914; cv=none; b=IZBfvug2DpSJm5/HxgNa8TrDr872pTIV67YJbBHlMV2nMrZnrnV/22QphW7rt38hd5fp3sYOKM1hGSv/A6nGCMM2dTturwMIVYv7HbqdEgJQjiTfuc6gvsusb9/doVBxwP0zCj+AWYer1HZZA2IxcjmBTeRjJ8sHgg1FDxQxkMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749738914; c=relaxed/simple;
	bh=jNAynF8yzo2MaHHQ97XS4c/zX3UfIyeqvS8JmkGhBDI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DgW1CBHDuWmsAs0HwDLIPFauHOm9EAFmNiX4VMWxCFfXKBCsK1ngp1apkiKGjc3HDaM+VX1n5sksaCHmQlzXawyvdlxLpCibhD5DjtfnV3TVeh8+glhCNu0qTig4gQ/dYHj1eeX8rPeV17CoOVffDNYNDa+solMKRvSDKK+XOtY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=sEZu2LeR; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="sEZu2LeR"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so9365615e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749738911; x=1750343711; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Islg/EqCEkW8m6OOg2kXY87sZ2v1kaNiGQHTKgHcYDM=;
        b=sEZu2LeRk/3OF2LKi+x8o0dk2L2Aw0LlAHF8YhXt7qPgv/0lF7NM1uVmA8SIcvPXhB
         vyAr2F2U6FbzXU9fTDp8mYyALml6GSKko8yck1k18PrEzCgFZp36Fl7+C2skyAxb/Kvg
         IRco6d3ZT1uOjTeCvL6MYeoOFGZ/CwIPBAG+cYec8mx8TDXsc01ai9NrVgwJNxna4inF
         PWvIkm9NnhUaqYyOjoPs2oaLfXdn1FvxP7jB+bin7i5eI/gSfOaT2p9N/WDfEtwmDwQx
         0ZvGZry4jxNXxiZ1r0WByqFdGxXEkM1tR/71H2kRNMLIQa3mam9ZnSNPNrHGUctSwNNy
         3PYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749738911; x=1750343711;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Islg/EqCEkW8m6OOg2kXY87sZ2v1kaNiGQHTKgHcYDM=;
        b=XMb6xkdz/F4xVwvfb+RiVSOE0d3hIVcYT+F316TpfMMnCq4rULWSfzqcLW97xqv3hZ
         JTUv/GYa7WlBIhxirxoHDIfbQR1s5Wd6t3oy87+i4yif8u+GRGnbnNCo06AId4dfz/FW
         Hjv7ytmnF6SeXrNXICbgtV+G2nd3X6Fr1/6yPI4+A0QQaBMFQplUCIS/R3yRqT3m3sGH
         85WXIQqjeffes5KFZ6xSrla3Ye7SL3LogkTs5hB8SfLH/9FwkVPcFI2OTKaT64VjQp9l
         AUufeyZvp1n1wuPuRRhHYqmBg8D7iyEPoNrEFDikTTnDYV/c448Rou3S7y7Tm86MJTgK
         eXxw==
X-Forwarded-Encrypted: i=1; AJvYcCX0GMK+JUdyT2fw3gzblvUGU+NOCYEYm7cZAhRgxZQv2yW2lZfiWMbz0y/uObnlvYBf2PVc9IfZKqNa50c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwG6cJ/hxXX4lzfyLcPgbkCk7fqzBXJakIYywpK0P2ILUz5QQXz
	dRX2vJDbdC6QZNwlGZthpGyS3SOekb6Wc1zzDiiBkvFhpvpUnQNP4aY90CjVzXw6g0yDrwkSIbB
	071cR
X-Gm-Gg: ASbGnctfyZltep81TRvVcntu36vCxQMi0h+5SeYtkzfNyqzfovNxHwXwGRuR8R023TD
	aOKFCPFueQNFiodfLXFvNPgTbZ7/EB1QGTxMDb1P3hfIM+IBX0X3PBGCWHWBA9o9POJ1itNN1hS
	KGu1Fj9mX2nxKSzHaJDR49u+BKyP6Vm7j1VQ2OrQSlzTR1C11Ueq0gxNtFpklIsqOlI8tJ9gbaO
	G7+VDX+XqLyZcYxD0Z7U7cuNdR602cZ0CbfFJzwO5zloZDi+qgDtFbU4ZNNrQHdfhgbw5aB1aAp
	fob/4G/YcRUpKwUVnfke9ccixV/9t63vXQPGXSUvKW8Ny5wpudAir6UgyPB+N/S9prI=
X-Google-Smtp-Source: AGHT+IHGD+FKI853WgGp5aiNF/V4TxjRvLR3P42qPzeJbmR1YHKdgcN+H9zGrdpu4QQZKKNMIaFVqg==
X-Received: by 2002:a05:6000:4313:b0:3a5:1471:d885 with SMTP id ffacd0b85a97d-3a567a2b4camr116503f8f.56.1749738911096;
        Thu, 12 Jun 2025 07:35:11 -0700 (PDT)
Received: from [192.168.1.3] ([37.18.136.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a561a3ce55sm2162802f8f.65.2025.06.12.07.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 07:35:10 -0700 (PDT)
Message-ID: <31a16580-e3ce-4cc8-8310-04a0dd292df5@linaro.org>
Date: Thu, 12 Jun 2025 15:35:09 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] spi: spi-fsl-dspi: Use non-coherent memory for DMA
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Frank Li <Frank.li@nxp.com>,
 Vladimir Oltean <olteanv@gmail.com>, Mark Brown <broonie@kernel.org>,
 linux-spi@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250609-james-nxp-spi-dma-v1-2-2b831e714be2@linaro.org>
 <aEhMBsqlx9I4XqJS@lizhi-Precision-Tower-5810>
 <de7142ac-f1a3-412f-9f00-502222b20165@app.fastmail.com>
 <aEhVsrEk0qv+38r3@lizhi-Precision-Tower-5810>
 <20250611090107.t35zatn47vetnvse@skbuf>
 <c65c752a-5b60-4f30-8d51-9a903ddd55a6@linaro.org>
 <20250612111514.rfb3gpmlilznrfxs@skbuf>
 <ad7e9aa7-74a3-449d-8ed9-cb270fd5c718@linaro.org>
 <20250612142306.3c3dl46z326xvcud@skbuf>
 <5b21c4c9-0ef7-41e5-a3bb-5a48a0c73644@linaro.org>
 <20250612143157.bu4vayvhieohdtbu@skbuf>
Content-Language: en-US
From: James Clark <james.clark@linaro.org>
In-Reply-To: <20250612143157.bu4vayvhieohdtbu@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 12/06/2025 3:31 pm, Vladimir Oltean wrote:
> On Thu, Jun 12, 2025 at 03:28:37PM +0100, James Clark wrote:
>>
>>
>> On 12/06/2025 3:23 pm, Vladimir Oltean wrote:
>>> On Thu, Jun 12, 2025 at 03:14:32PM +0100, James Clark wrote:
>>>>> That's why I don't like the DMA mode in DSPI, it's still CPU-bound,
>>>>> because the DMA buffers are very small (you can only provide one TX FIFO
>>>>> worth of data per DMA transfer, rather than the whole buffer).
>>>>
>>>> Is that right? The FIFO size isn't used in any of the DMA codepaths, it
>>>> looks like the whole DMA buffer is filled before initiating the transfer.
>>>> And we increase the buffer to 4k in this patchset to fully use the existing
>>>> allocation.
>>>
>>> Uhm, yeah, no?
>>>
>>> dspi_dma_xfer():
>>>
>>> 	while (dspi->len) {
>>> 		dspi->words_in_flight = dspi->len / dspi->oper_word_size;
>>> 		if (dspi->words_in_flight > dspi->devtype_data->fifo_size)
>>> 			dspi->words_in_flight = dspi->devtype_data->fifo_size;
>>> 		dspi_next_xfer_dma_submit();
>>> 	}
>>
>> Right but that's before the change in this patchset to use the whole page
>> that was allocated, hence the next bit:
>>
>>> And we increase the buffer to 4k in this patchset to fully use the
>>    existing allocation.
>>
>> We were allocating for the size of the FIFO (multiplied by two to hold the
>> control words), but dma_alloc_coherent() will be backed by a whole page
>> anyway, even if you only ask for a few bytes.
>>
>> After changing that to make use of the full allocation the FIFO length is no
>> longer involved.
> 
> Ok, I haven't walked through patch 3 yet, I didn't realize it would be
> changing that. I will want to test it on LS1028A.

Yeah testing it somewhere else would be good. Maybe there is some 
limitation there about the max size of the DMA transfer, but I didn't 
see it.

I realise the tense in my original message may have been a bit 
confusing. I was mixing up the existing code and proposed changes...

