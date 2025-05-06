Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3382798FE
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:06:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536819; cv=none; b=Uuk/54HXiVW6jaP6z8qY9DNnLqXSJHZhPbRAHffd3AZ3Ytol1oS3vMdaPF0ZZgsaDkmn47D+qgfk/BO880imt0YRoZRJ3s4YViPF5pB3EFLZFLWyN7jueHs9PDGq2C/TSczEvpeHwjAxMHQjRtugMnyB4Uk2pIQIksJyAI1KQfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536819; c=relaxed/simple;
	bh=qSelRs1fagJ/RsJmCZ4KbDzbcT/dlzDg34lSjalVGCA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q+A1Es9yi+qt6pH2MFI7LoEksaSPjBC+gjnkfgatwKf8V1eLt2jnHC/Ri7FZmndNswlifVYwkZlMsrbcjexwbwao+DU3pNnMclTkRXfgzIHgLay28OqrqIfnlUr85feeph6dlcgUrNe6mE1xT/Kogepio8/hUY5G16A4Es6wSjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hsdILvSC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hsdILvSC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
	b=hsdILvSCUsXWhU1lUrPphphLElHVCxB4FxeBayvB3g8vPROAWkElB1Xs4S1RIvldGz5WBi
	js+kasuKEqhV63UwtEDtCb+Gs2U43aXGbFY/3nVp6YdPoM9+clRgskEioVxJt5evn+/ufR
	AiOss0e4F72/xQ2NrhYuhZT9xmus4Ls=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-CsVVV3_rOnmigjjHpCWsAw-1; Tue, 06 May 2025 09:06:55 -0400
X-MC-Unique: CsVVV3_rOnmigjjHpCWsAw-1
X-Mimecast-MFC-AGG-ID: CsVVV3_rOnmigjjHpCWsAw_1746536814
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-440667e7f92so33647135e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:06:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536813; x=1747141613;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uO86tWyczy+PSJFwu9JeGgAOBATj+coLncLYSH0L/gw=;
        b=bb0r4hbM4qB4HQt8BrXclz3h4c+g5rydCYv7JwNIopVh5SkknU7tGqQ0jetseOzNuo
         hZB7m45hcY9ZdsLu8U/KPZsv2FNbO4D5+DxJyHsm7PApqCTxNSVuBZVcMPXsL6nNiDyk
         1MGFR/1Wuti09sRcqLHEPDu8NhMBU1bAn2YGnVtsz5+LGXXqiQzzokqI9QTPqtU07sj8
         w8wVueeU3jAz5e8yCvEEUo6zEtOmvIisK2JTs8MUT48Me4cjGljcFM0/b3T1aZCPr4jn
         SdidlwtzqSPH3jkj+rQSrtrVnADqHvO1ePhlK2l6y1LPRca7NHqHKOONsJdzpTePIo4l
         YAig==
X-Forwarded-Encrypted: i=1; AJvYcCXPHQPVYqR8CtsZT1PTfiwFIxTMrrml2sC8KY9DZzDajgxZjcf0TKPtdPFHeV7YxGhP+IY3J0+mCozPyaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoDfXfp7vqdrOwJeRDm9NRp9/UH3n7G1HUCvCspX3QpdPuQE+m
	cSe6eoQRyceGRH8d9ot3BByw0egs5K13tSFUNB3SeUwpRuAdEnfEuvE+FufpUw8V44c5MXFaPqW
	3EbaQzLcbJXcepEWvZ1G4LSgWBXAdTYs5wgxikctpA0SAe4jybolo21oV+i7BIw==
X-Gm-Gg: ASbGncvuBZsmkBd48XwnCO4vUOxvCkRpmzdELwywkD1IrjiyIeMT7VOVzyL4BqXnt6m
	tTmq0qj+3vGQ26NjrWxLphOmMt4Lpbpg4IpR0EFHZ8FFe4AkcEFd1UDCFFgRktxdycsOAGxh3VL
	zdb6+7yNZ4afmuP//NTfYyXSzT2Xd+6+UujkihzSEPIuOb6iFBd1tQomx9N7hdL7vz4pyyDhZzE
	XczFJaDdqlCnA4AiRrHLpV/alQM3M/X2ZkDkdBpGAAMhxIbWOMf8Tt2UqX7c+BM6x4JWsG0CTBe
	mBvr9DCHxmvGIOJS
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr95876675e9.27.1746536813589;
        Tue, 06 May 2025 06:06:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKiHs9FSOU2le8jbaL7mKTZ2hCbrm+SIQCEe6ODre4sZLo6XvFEwTUhXm7CFs6cxte9EBTOA==
X-Received: by 2002:a05:600c:870b:b0:43d:738:4a9 with SMTP id 5b1f17b1804b1-441c494849emr95873295e9.27.1746536810872;
        Tue, 06 May 2025 06:06:50 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2aecc89sm213870385e9.9.2025.05.06.06.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:06:50 -0700 (PDT)
Date: Tue, 6 May 2025 15:06:22 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 4/4] tpm/tpm_svsm: support TPM_CHIP_FLAG_SYNC
Message-ID: <pxtojuqebtk7pa5vjbhmiulydmgyutsbgxg2j5b6ziyxzqls35@qmmmcn4uwzie>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-5-sgarzare@redhat.com>
 <aBJGkSil1YAzSXsg@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aBJGkSil1YAzSXsg@kernel.org>

On Wed, Apr 30, 2025 at 06:49:37PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 14, 2025 at 04:56:53PM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> This driver does not support interrupts, and receiving the response is
>> synchronous with sending the command.
>>
>> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
>> return responses in the same buffer used for commands. This way we
>> don't need to implement recv() op.
>>
>> Keep using the same pre-allocated buffer to avoid having to allocate
>> it for each command. We need the buffer to have the header required by
>> the SVSM protocol and the command contiguous in memory.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>
>Similar comments, and a bit redundancy does not matter i.e., they can
>have pretty much the same explanation.

I see, I'll replace the "So we can set..." paragraph with your 
suggestion on the previous patch.

Thanks,
Stefano

>
>> ---
>>  drivers/char/tpm/tpm_svsm.c | 27 +++++++++++----------------
>>  1 file changed, 11 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/char/tpm/tpm_svsm.c b/drivers/char/tpm/tpm_svsm.c
>> index d3ca5615b6f7..db1983072345 100644
>> --- a/drivers/char/tpm/tpm_svsm.c
>> +++ b/drivers/char/tpm/tpm_svsm.c
>> @@ -25,38 +25,32 @@ struct tpm_svsm_priv {
>>  	void *buffer;
>>  };
>>
>> -static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +static int tpm_svsm_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>  			 size_t buf_size)
>>  {
>>  	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>>  	int ret;
>>
>> -	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, len);
>> +	ret = svsm_vtpm_cmd_request_fill(priv->buffer, 0, buf, cmd_len);
>>  	if (ret)
>>  		return ret;
>>
>>  	/*
>>  	 * The SVSM call uses the same buffer for the command and for the
>> -	 * response, so after this call, the buffer will contain the response
>> -	 * that can be used by .recv() op.
>> +	 * response, so after this call, the buffer will contain the response.
>> +	 *
>> +	 * Note: we have to use an internal buffer because the device in SVSM
>> +	 * expects the svsm_vtpm header + data to be physically contiguous.
>>  	 */
>> -	return snp_svsm_vtpm_send_command(priv->buffer);
>> -}
>> -
>> -static int tpm_svsm_recv(struct tpm_chip *chip, u8 *buf, size_t len)
>> -{
>> -	struct tpm_svsm_priv *priv = dev_get_drvdata(&chip->dev);
>> +	ret = snp_svsm_vtpm_send_command(priv->buffer);
>> +	if (ret)
>> +		return ret;
>>
>> -	/*
>> -	 * The internal buffer contains the response after we send the command
>> -	 * to SVSM.
>> -	 */
>> -	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, len);
>> +	return svsm_vtpm_cmd_response_parse(priv->buffer, buf, buf_size);
>>  }
>>
>>  static struct tpm_class_ops tpm_chip_ops = {
>>  	.flags = TPM_OPS_AUTO_STARTUP,
>> -	.recv = tpm_svsm_recv,
>>  	.send = tpm_svsm_send,
>>  };
>>
>> @@ -85,6 +79,7 @@ static int __init tpm_svsm_probe(struct platform_device *pdev)
>>
>>  	dev_set_drvdata(&chip->dev, priv);
>>
>> +	chip->flags |= TPM_CHIP_FLAG_SYNC;
>>  	err = tpm2_probe(chip);
>>  	if (err)
>>  		return err;
>> --
>> 2.49.0
>>
>
>BR, Jarkko
>

