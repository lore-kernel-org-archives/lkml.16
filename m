Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A694B25A627
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 07:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744185578; cv=none; b=VSXt62PXwnMdgnOY4R/RXFdclJvV6RdZrUoPSHDTJhSTs9T3L705Tb0v+/+zzeIYxJPTt/Z2pNlnBz3OSIbfIXj7uL+XEf68/w0b8p+Ru4Ix1FWp1mpZYKspX65uhm60B9ifNbD3HZGCoYCdW5RzgqUOp92npyXerdmsorcdOA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744185578; c=relaxed/simple;
	bh=O4/0h2fD+v/2WoxppgtWGiHs4q3dWjGQQNeMm8b4TDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ph/ndO+zcIX0Q6twXJtOlF2cxKVKFBIVV+tohSWbP55LkGuR1qEAz93HQJaQJQOKC+nk6gL7xhU9KIq6Tf96I83yx8UMiOSCMQTcFDjspTOeg/cLNeFsStnmUGfOMfso9gygy0+cayhECSkLupCrRVYWAtMZaUiYOrrPAtzdq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O++mKewz; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O++mKewz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744185575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
	b=O++mKewzRp4OfcVuA6/hoouzBp1YlRoVKpYaEQhBu55tuD8y2QvlNo4eovafs/LU4WGZtk
	8deg0ldsD2kaqs59jpeyfLQIwBhM9MK2Z+KyPq/1lmX1MJkYVUtnBBIjiw/KpGtF41oT1K
	ePgpXCrd69I2oUMh7Sq4t6PMrCAA5wg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-552-8_WVXnsxP7240gUHBV18rw-1; Wed, 09 Apr 2025 03:59:34 -0400
X-MC-Unique: 8_WVXnsxP7240gUHBV18rw-1
X-Mimecast-MFC-AGG-ID: 8_WVXnsxP7240gUHBV18rw_1744185573
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-abb9b2831b7so47194066b.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 00:59:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744185573; x=1744790373;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dT/1hWKYGtk5tJHR2fAw0xNnMbEghxXKOJUzMLmSe3U=;
        b=mjLTx6DcShdP+fkdnwX9tCaXMYmPMO68+OWAsYk3s4v2ozQ6S4JhzJK1n4KnaG2Hm8
         5MEV8gbQZ3AldHu7sORLDpU7hdbtU1D7JTrQ8azWR4ddEUePIr7in00BiWr1nuZ7ejja
         RfA1bWA77noaWuDXVJ+GiJ96fVJpW6NwJFz0QhYM9wIzKFAT5d7gGS8MUWFazpaqBrMt
         VXlpGIU8DdxzohbjnlFfVuQpQpE1iRGNxLuTnfcvLi2aKMYPaIou/cAVvBc13/lGEzjM
         UFlqItZ7rqrnB6HfzfyyWpduGzBznMkjE10r60yEITCFvvO/IPIatD58QyA0+yrs/o64
         mgcA==
X-Forwarded-Encrypted: i=1; AJvYcCWX8LNWqywksaW1SlL1mHQykSmqNjUMTRiS+M07q8VaJyGQ5RWSKGOQBmCqIoM1dYtAON88HTK35oGUKcI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxg+cgGXKy5LQlqR58D5IaAxdurhY4RRL/DsROOoWWqV1j15Vjw
	6Inph2LzIQbDOAHqrOcJpGf1/CYv+avEsjKpY07AuNYG4IWrU2bsIXyduTDC+C7HoojpQ7BIbOW
	qP/ehv3ClFVnngLhuh/gRyugZn4xLwCQiWfU4tJnxvsFxtJohRuJ/vBLgDPwmsw==
X-Gm-Gg: ASbGncvJZFwjoJM9vnEuDoOZTdsPZYnJAS6G+CM8PAmmom53fPQJek9ONilyLXZzFdW
	UDQi+i6mO3ycabmwTBeB+8OISN8JWe3aAbqJuoxd/R2nkU8jw21aWXLoMghluq7E/l3H5faGwO9
	56RBFaL+9Z9bKEbEG+3MUD3fRPHTFlqHi++u7kx1Bb99T11XzQKywIJ8xZ8eeWmyVhAMdljx7QU
	WAR7DXd5x8jma+K0YIYD86XXzPIxv/GdDls3Y4BVOvqYkpPE0QFYmLE+Z1P+vXoYVi7GpemwzTm
	BoM7R4mAk4eyzHGGqdpHuLEkeX6TQf47xPcTwOcrGKNe/PJVBw+qfHx80WA2
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id a640c23a62f3a-aca95edc220mr253162766b.21.1744185572795;
        Wed, 09 Apr 2025 00:59:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFDGZE5I848zF3RheNhsp0sylIGxiaPLv5p9KJ9kMUR0mVwOrwhhqxo8Y8n3wVy8ROJPh9oSw==
X-Received: by 2002:a17:907:2d89:b0:aca:95ed:b9d1 with SMTP id a640c23a62f3a-aca95edc220mr253159466b.21.1744185572086;
        Wed, 09 Apr 2025 00:59:32 -0700 (PDT)
Received: from sgarzare-redhat (host-79-53-30-213.retail.telecomitalia.it. [79.53.30.213])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1ce7322sm50505266b.164.2025.04.09.00.59.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 00:59:31 -0700 (PDT)
Date: Wed, 9 Apr 2025 09:59:26 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-kernel@vger.kernel.org, 
	Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-arm-kernel@lists.infradead.org, 
	Jens Wiklander <jens.wiklander@linaro.org>, linuxppc-dev@lists.ozlabs.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Sumit Garg <sumit.garg@kernel.org>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-integrity@vger.kernel.org, Jason Gunthorpe <jgg@ziepe.ca>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Naveen N Rao <naveen@kernel.org>, 
	Nicholas Piggin <npiggin@gmail.com>, Peter Huewe <peterhuewe@gmx.de>, 
	James Bottomley <James.Bottomley@hansenpartnership.com>
Subject: Re: [PATCH v2 2/4] tpm: support devices with synchronous send()
Message-ID: <uhqvn5w5ziuzvp3u72kztkfbtkrb2g6ieejup4e2ufun4ywtko@4hcytxdrfues>
References: <20250408083208.43512-1-sgarzare@redhat.com>
 <20250408083208.43512-3-sgarzare@redhat.com>
 <Z_VBUozuHvbxdyB3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z_VBUozuHvbxdyB3@kernel.org>

On Tue, Apr 08, 2025 at 06:31:30PM +0300, Jarkko Sakkinen wrote:
>On Tue, Apr 08, 2025 at 10:32:06AM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Some devices do not support interrupts and provide a single synchronous
>> operation to send the command and receive the response on the same buffer.
>>
>> Currently, these types of drivers must use an internal buffer where they
>> temporarily store the response between .send() and recv() calls.
>>
>> Introduce a new flag (TPM_CHIP_FLAG_SYNC) to support synchronous send().
>> If that flag is set by the driver, tpm_try_transmit() will use the send()
>> callback to send the command and receive the response on the same buffer
>> synchronously. In that case send() return the number of bytes of the
>> response on success, or -errno on failure.
>>
>> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>>  include/linux/tpm.h              |  1 +
>>  drivers/char/tpm/tpm-interface.c | 18 +++++++++++++++---
>>  2 files changed, 16 insertions(+), 3 deletions(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 2e38edd5838c..0e9746dc9d30 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -350,6 +350,7 @@ enum tpm_chip_flags {
>>  	TPM_CHIP_FLAG_SUSPENDED			= BIT(8),
>>  	TPM_CHIP_FLAG_HWRNG_DISABLED		= BIT(9),
>>  	TPM_CHIP_FLAG_DISABLE			= BIT(10),
>> +	TPM_CHIP_FLAG_SYNC			= BIT(11),
>>  };
>>
>>  #define to_tpm_chip(d) container_of(d, struct tpm_chip, dev)
>> diff --git a/drivers/char/tpm/tpm-interface.c b/drivers/char/tpm/tpm-interface.c
>> index 3b6ddcdb4051..9fbe84b5a131 100644
>> --- a/drivers/char/tpm/tpm-interface.c
>> +++ b/drivers/char/tpm/tpm-interface.c
>> @@ -114,8 +114,17 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  		return rc;
>>  	}
>>
>> -	/* A sanity check. send() should just return zero on success e.g.
>> -	 * not the command length.
>> +	/* Synchronous devices return the response directly during the send()
>> +	 * call in the same buffer.
>> +	 */
>
>Nit:
>
>/*
> * ...
>
>It's wrong in the existing comment.

Yep, I'll fix.

>
>> +	if (chip->flags & TPM_CHIP_FLAG_SYNC) {
>> +		len = rc;
>> +		rc = 0;
>> +		goto out_send_sync;
>> +	}
>> +
>> +	/* A sanity check. send() of asynchronous devices should just return

And I'll fix also this of course.

>> +	 * zero on success e.g. not the command length.
>>  	 */
>>  	if (rc > 0) {
>>  		dev_warn(&chip->dev,
>> @@ -151,7 +160,10 @@ static ssize_t tpm_try_transmit(struct tpm_chip *chip, void *buf, size_t bufsiz)
>>  	if (len < 0) {
>>  		rc = len;
>>  		dev_err(&chip->dev, "tpm_transmit: tpm_recv: error %d\n", rc);
>> -	} else if (len < TPM_HEADER_SIZE || len != be32_to_cpu(header->length))
>> +		return rc;
>> +	}
>> +out_send_sync:
>
>out_sync would be sufficient

sure, I'll fix in v3.

Thanks,
Stefano

