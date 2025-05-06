Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC72E8C1F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 13:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746536663; cv=none; b=Tgv2dCkAi4plUUWL1vRNPE19PKPt9XF36ngiTfz2Dt3hqTk2riPsWupVIowJb8VzbmxCudSiE6PrJWkYupPB/XpB1CyEfvA2uVwimfme5kaouPiIU2MzncdJCUUH6+/O5Qtffm0ymao+g4puzexfXSDo3YOypqdXKBmUj1Bq3e0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746536663; c=relaxed/simple;
	bh=OznerGOBgiSQ7jvQbMV2e6HGr3tyIGIVKjWTKkJOCyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mFsYMgqxgI5RNRBDXLvBkPShJqaXCuWhlaI5hWd5T/U/rOL4oNgr6FDmd/axnkRdAQf6Tq7zc/H37ByzLCFvtmwqSb4UxjtT/v+JMONnzIoi0/wt4oD9PAoHZ/em0cA0jQKDpQFxfWzk8CsVvZNiO3TR46r7TFMzVCJSFjljoyU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GTyFE2Zu; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GTyFE2Zu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746536659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lKbAvF7va5UdESVOfamVcDXW2ol3BOhQMwi8AC9a1lU=;
	b=GTyFE2ZueSAOtiL9SIMZK67W1dLCq3DigRd971VAVAGFHOLPpJzJUbjlzgO9Wt4hMSTDVq
	Eq5ExKrEqHDqgXyYpiPnNW2+U+yQhrRWzoY/WLI8wNxhmy0K8jklYMqog0hg1vfWuVQhux
	sk65U1ar/udJPD1pbOpKWD7DScGu+F0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-5ZYmkrTTPxSE_psJTxabyA-1; Tue, 06 May 2025 09:04:17 -0400
X-MC-Unique: 5ZYmkrTTPxSE_psJTxabyA-1
X-Mimecast-MFC-AGG-ID: 5ZYmkrTTPxSE_psJTxabyA_1746536656
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-441c122fa56so12310395e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 06:04:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746536656; x=1747141456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lKbAvF7va5UdESVOfamVcDXW2ol3BOhQMwi8AC9a1lU=;
        b=XtAOwr1nMMHjE+Kzdm68DwlfBD+OPAzVMKSvm/stDBQhHSUJgeVP2K9dO3WgJRKQNY
         mfQdot71gy/r8WOuNOhE0vBaFitexfFr5Xyfu7L6NlAMZHbTM7Dl9qamSBhEupHFLyTJ
         8P5oyyQwtXPI7MRHWBQO+8/VTnp1JCKHTs19S4otDMcK3WNi4+OelLefImptDQyMEDKd
         YO3GEy+l5OMGfncfw2NouXLRp0olBUO442f8Vquk6UTTKLImyFBXZSpTG0+4fzdIAJtb
         krQveRxkJqo6Aa3+nIqhsu3hf/wZODqRdlKuW4e4vcPCciaAshLtVVJliKB5i8Vbe3b2
         OL+A==
X-Forwarded-Encrypted: i=1; AJvYcCWFD/nY5O8dslflafcspwOXCxwoKCOBHlf4+4KO32vOVkMsDUMPhmQFkDempR8jc+9NNjvrt29qUW1DcFU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRdtXAEznT9m2weh8PobDadwkIQXQ/8Fm3B2ZJ1LthRgIlLhTo
	0Jk4XcBKMzOfqKUHwGK+lsDG8PEXuhYt2BHiVnq2NO+dOWLLjZtAVMZ+DPupBhnsUCEMoQ5hAGV
	RyOG2hUUwziOKFAgIwCYhE0ZT2iGFWly9q7v2pLomGeeqsrzUGmnlS67aiP7vxA==
X-Gm-Gg: ASbGncuvjD1IXU9PeDKsn8AA8Q29/BSOI7mK+2kW6O46PakrxV0P31wLlWBKy6gCjre
	YcI4DXxaLAw9qenO3AVXAUE8Gqkf7pJjX5HlLyWHZXThOejH58zEVhTR9gZ6U5y8h+NAgDNFbFG
	KK8KBZ14+t2Lu2Rwazk4jT5fktneobYURTruvRcDOGREc9lJH3gDshFcVus4elpRe2edei/+HUC
	I0NQ2GClpKs+G54wP46Bc4DdaNEjtFuy2brwWpkg8iYZMe8ITPdwpaS2/PzmYfRjoQLOxrIfFqi
	SJFgrvjAdNSc4xVX
X-Received: by 2002:a05:6000:1449:b0:3a0:b334:6a9f with SMTP id ffacd0b85a97d-3a0b3346db1mr336484f8f.58.1746536656197;
        Tue, 06 May 2025 06:04:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE370Uz9IXnYFrfg17BGYXqNHxKng1dMfBfML6vrtdO2n/0WVte8MSeTEzuWOfdUnMD7wyr2w==
X-Received: by 2002:a05:6000:1449:b0:3a0:b334:6a9f with SMTP id ffacd0b85a97d-3a0b3346db1mr336409f8f.58.1746536655578;
        Tue, 06 May 2025 06:04:15 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.145.28])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3c1fsm13748091f8f.37.2025.05.06.06.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 06:04:14 -0700 (PDT)
Date: Tue, 6 May 2025 15:03:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>, g@sgarzare-redhat
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Peter Huewe <peterhuewe@gmx.de>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Jens Wiklander <jens.wiklander@linaro.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Naveen N Rao <naveen@kernel.org>, Nicholas Piggin <npiggin@gmail.com>, 
	linuxppc-dev@lists.ozlabs.org, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, linux-integrity@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@kernel.org>, linux-kernel@vger.kernel.org, 
	Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v3 3/4] tpm/tpm_ftpm_tee: support TPM_CHIP_FLAG_SYNC
Message-ID: <gnbagkqjrfvqqhfpl2yt6xougl3wws4h4actl6scotv4xbrqde@czy5dz4l25ui>
References: <20250414145653.239081-1-sgarzare@redhat.com>
 <20250414145653.239081-4-sgarzare@redhat.com>
 <aBJGJwVyp3pvRlqE@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aBJGJwVyp3pvRlqE@kernel.org>

On Wed, Apr 30, 2025 at 06:47:51PM +0300, Jarkko Sakkinen wrote:
>On Mon, Apr 14, 2025 at 04:56:52PM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> This driver does not support interrupts, and receiving the response is
>> synchronous with sending the command.
>>
>> So we can set TPM_CHIP_FLAG_SYNC to support synchronous send() and
>
>"Enable synchronous send() with TPM_CHIP_FLAG_SYNC, which implies that
>->send() already fills the provided buffer with a reponse, and ->recv()
>is not implemented."
>
>So, instead of jargon it is better to explicitly state what the heck
>is going on.

Ack, I'll replace with your suggestion.

Thanks,
Stefano

>
>> return responses in the same buffer used for commands. This way we
>> don't need the 4KB internal buffer used to cache the response before
>> .send() and .recv(). Also we don't need to implement recv() op.
>>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v2:
>> - set TPM_CHIP_FLAG_SYNC and support it in the new send()
>> - removed Jens' T-b
>> v1:
>> - added Jens' T-b
>> ---
>>  drivers/char/tpm/tpm_ftpm_tee.h |  4 ---
>>  drivers/char/tpm/tpm_ftpm_tee.c | 64 ++++++++++-----------------------
>>  2 files changed, 19 insertions(+), 49 deletions(-)
>>
>> diff --git a/drivers/char/tpm/tpm_ftpm_tee.h b/drivers/char/tpm/tpm_ftpm_tee.h
>> index e39903b7ea07..8d5c3f0d2879 100644
>> --- a/drivers/char/tpm/tpm_ftpm_tee.h
>> +++ b/drivers/char/tpm/tpm_ftpm_tee.h
>> @@ -22,16 +22,12 @@
>>   * struct ftpm_tee_private - fTPM's private data
>>   * @chip:     struct tpm_chip instance registered with tpm framework.
>>   * @session:  fTPM TA session identifier.
>> - * @resp_len: cached response buffer length.
>> - * @resp_buf: cached response buffer.
>>   * @ctx:      TEE context handler.
>>   * @shm:      Memory pool shared with fTPM TA in TEE.
>>   */
>>  struct ftpm_tee_private {
>>  	struct tpm_chip *chip;
>>  	u32 session;
>> -	size_t resp_len;
>> -	u8 resp_buf[MAX_RESPONSE_SIZE];
>>  	struct tee_context *ctx;
>>  	struct tee_shm *shm;
>>  };
>> diff --git a/drivers/char/tpm/tpm_ftpm_tee.c b/drivers/char/tpm/tpm_ftpm_tee.c
>> index 637cc8b6599e..b9adc040ca6d 100644
>> --- a/drivers/char/tpm/tpm_ftpm_tee.c
>> +++ b/drivers/char/tpm/tpm_ftpm_tee.c
>> @@ -31,46 +31,18 @@ static const uuid_t ftpm_ta_uuid =
>>  		  0x82, 0xCB, 0x34, 0x3F, 0xB7, 0xF3, 0x78, 0x96);
>>
>>  /**
>> - * ftpm_tee_tpm_op_recv() - retrieve fTPM response.
>> - * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h.
>> - * @buf:	the buffer to store data.
>> - * @count:	the number of bytes to read.
>> - *
>> - * Return:
>> - *	In case of success the number of bytes received.
>> - *	On failure, -errno.
>> - */
>> -static int ftpm_tee_tpm_op_recv(struct tpm_chip *chip, u8 *buf, size_t count)
>> -{
>> -	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>> -	size_t len;
>> -
>> -	len = pvt_data->resp_len;
>> -	if (count < len) {
>> -		dev_err(&chip->dev,
>> -			"%s: Invalid size in recv: count=%zd, resp_len=%zd\n",
>> -			__func__, count, len);
>> -		return -EIO;
>> -	}
>> -
>> -	memcpy(buf, pvt_data->resp_buf, len);
>> -	pvt_data->resp_len = 0;
>> -
>> -	return len;
>> -}
>> -
>> -/**
>> - * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory.
>> + * ftpm_tee_tpm_op_send() - send TPM commands through the TEE shared memory
>> + * and retrieve the response.
>>   * @chip:	the tpm_chip description as specified in driver/char/tpm/tpm.h
>> - * @buf:	the buffer to send.
>> - * @len:	the number of bytes to send.
>> + * @buf:	the buffer to send and to store the response.
>> + * @cmd_len:	the number of bytes to send.
>>   * @buf_size:	the size of the buffer.
>>   *
>>   * Return:
>> - *	In case of success, returns 0.
>> + *	In case of success, returns the number of bytes received.
>>   *	On failure, -errno
>>   */
>> -static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>> +static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>  				size_t buf_size)
>>  {
>>  	struct ftpm_tee_private *pvt_data = dev_get_drvdata(chip->dev.parent);
>> @@ -82,16 +54,15 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  	struct tee_param command_params[4];
>>  	struct tee_shm *shm = pvt_data->shm;
>>
>> -	if (len > MAX_COMMAND_SIZE) {
>> +	if (cmd_len > MAX_COMMAND_SIZE) {
>>  		dev_err(&chip->dev,
>>  			"%s: len=%zd exceeds MAX_COMMAND_SIZE supported by fTPM TA\n",
>> -			__func__, len);
>> +			__func__, cmd_len);
>>  		return -EIO;
>>  	}
>>
>>  	memset(&transceive_args, 0, sizeof(transceive_args));
>>  	memset(command_params, 0, sizeof(command_params));
>> -	pvt_data->resp_len = 0;
>>
>>  	/* Invoke FTPM_OPTEE_TA_SUBMIT_COMMAND function of fTPM TA */
>>  	transceive_args = (struct tee_ioctl_invoke_arg) {
>> @@ -105,7 +76,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INPUT,
>>  		.u.memref = {
>>  			.shm = shm,
>> -			.size = len,
>> +			.size = cmd_len,
>>  			.shm_offs = 0,
>>  		},
>>  	};
>> @@ -117,7 +88,7 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  		return PTR_ERR(temp_buf);
>>  	}
>>  	memset(temp_buf, 0, (MAX_COMMAND_SIZE + MAX_RESPONSE_SIZE));
>> -	memcpy(temp_buf, buf, len);
>> +	memcpy(temp_buf, buf, cmd_len);
>>
>>  	command_params[1] = (struct tee_param) {
>>  		.attr = TEE_IOCTL_PARAM_ATTR_TYPE_MEMREF_INOUT,
>> @@ -158,17 +129,20 @@ static int ftpm_tee_tpm_op_send(struct tpm_chip *chip, u8 *buf, size_t len,
>>  			__func__, resp_len);
>>  		return -EIO;
>>  	}
>> +	if (resp_len > buf_size) {
>> +		dev_err(&chip->dev,
>> +			"%s: resp_len=%zd exceeds buf_size=%zd\n",
>> +			__func__, resp_len, buf_size);
>> +		return -EIO;
>> +	}
>>
>> -	/* sanity checks look good, cache the response */
>> -	memcpy(pvt_data->resp_buf, temp_buf, resp_len);
>> -	pvt_data->resp_len = resp_len;
>> +	memcpy(buf, temp_buf, resp_len);
>>
>> -	return 0;
>> +	return resp_len;
>>  }
>>
>>  static const struct tpm_class_ops ftpm_tee_tpm_ops = {
>>  	.flags = TPM_OPS_AUTO_STARTUP,
>> -	.recv = ftpm_tee_tpm_op_recv,
>>  	.send = ftpm_tee_tpm_op_send,
>>  };
>>
>> @@ -253,7 +227,7 @@ static int ftpm_tee_probe(struct device *dev)
>>  	}
>>
>>  	pvt_data->chip = chip;
>> -	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2;
>> +	pvt_data->chip->flags |= TPM_CHIP_FLAG_TPM2 | TPM_CHIP_FLAG_SYNC;
>>
>>  	/* Create a character device for the fTPM */
>>  	rc = tpm_chip_register(pvt_data->chip);
>> --
>> 2.49.0
>>
>
>BR, Jarkko
>

