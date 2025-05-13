Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 679801D5CD1
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 14:03:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747144995; cv=none; b=NenoM708bkElFeVaozP46ApMfILNRs6gRCEYd0CXgivjw/YRqRDRmwJHzjpSFvUpBL2sLHpxsB2WoODi5s3cPfaXG14Wc8wqt1TxHLW0iaN3nqEPM5q5MfNqxgGNPHrx/9rTZUBbOU+5sQbNFvuogsZQNxjn4aAvSlTX4+KjzZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747144995; c=relaxed/simple;
	bh=KEdSRubqpS8TbP99Zzsm1oW/njWyuN0g9rA8Oc6xKG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RJuivEPrQov7vNwXNOiMQRGskInklhtuAn1y5IHpfYqPkz0fYhzKM0FWlei1yYUNFF+f03leE5nriNCZV+Bj8wTU+EmUTmVeyEOUMjbpox4cGHbMeGlPDNhnWSw3VlED//+fEo9D7721phr3EH6Aq0eh9rB5Ol5b0GUeuwpnbMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XoaiehQV; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XoaiehQV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747144992;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
	b=XoaiehQVjeme8/BcpwgFfFHwjikx4uz5dfadeolOCgJDW/EjKnYmga5B45hM4IezipD7KO
	R2eNo5ckVR4kwZFXgnoez9LcB9WihdmpHkwUI+UAUr0g0My/NQ9IznQFxL0oV4cX3gP+Fx
	sgznKQ913MZ0N3v3oh7RM9i69UQAC8c=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-tKwgFzzuNZGrPNM1qZWayw-1; Tue, 13 May 2025 10:03:11 -0400
X-MC-Unique: tKwgFzzuNZGrPNM1qZWayw-1
X-Mimecast-MFC-AGG-ID: tKwgFzzuNZGrPNM1qZWayw_1747144990
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-440667e7f92so27740035e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:03:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747144990; x=1747749790;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/CZBKCEKg6MIgb42M1L3z+fSuwPIFwgQItnKgPnpedw=;
        b=iDbVddDZhDHgzivulQXoeq75FCeFEeSFIpIqZMeNoAtV08ieY9rfagBNeVxX7FOAsI
         +NhK/lj1CWsYwE36+55MkTpPNoajM3E+qkg77b4cogyjrqWJ2KEzSVB2StMwGRyu0teA
         JFn7vlYlpGsdiRD+/tJcz/DjoVVIQjJFe405N2tONbdAj2IwhDQL5UOMuBETsGaD9Lyh
         LzTAPZ6sfUzuXcb827QBSroTF57gKNYGJGZ/5CFUh8zBTRwY7zBLBh1kU872iho6zgTg
         Q4Ykk75J7O8CsyLet/gzHEouFBnRhbhtJCoIR5jONUzEHL/5s8RMmh2VJL+8PqVDHBu6
         TtPw==
X-Forwarded-Encrypted: i=1; AJvYcCX0b9zgKWko7kDmCjyN3xNYySnjM76KO6UoFkP5emS/8ySTDgrj1sAOzT0wdcfg7v/BoVxujEUzhNBOvL0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yynd3XtsPUFXzA67s2PDceaokUBV7oaA2k+T7HEQihpuudGq+Xk
	CQnLG1LlYb9Iv8NYc11PnAeTpHDCRJbBI2Z5uV9ZYRR06hkkJiw0LyikbBQ9QvD9HJ4/KZpbdxF
	LkxvUtFoXPTqzyoH00SxQbTgOalLLRPjVqx00xLj+8pqsuin3Ri+2AYpktrrqFA==
X-Gm-Gg: ASbGncu56RAuZ+pmyDJZdUlLRxo0dYWsxRnbVKnMUgiMf6QcmDawGfSUvPuyFXp5XEq
	WvVHwFDnj25yNSR5Q+OcN1Txm5k2GR/qgp8Uzh4gmiBCj354aE7+g5yexlFd8SAxuD8T8+EoOsa
	w24t0uoiRN2gfDkCKvF2fJ05eTOsdCMpIkB5NErnDqcyn+pigKKc0pVGw5hZoe+TLtJkYTMUpr1
	cbJisyblpeZ9Wpe0iPW9vGgY0qNDkwuQYpmYZvQPyqA+ZHSJkwducj1D8lnCuwDgIOEk2EJwZH+
	jjfPMG0CzEpVB9c=
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr180192385e9.31.1747144987558;
        Tue, 13 May 2025 07:03:07 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8ZEKfjvThnHZ+qakwjJU5Vxx01h+as7nBLYm3yQHV3qHfmOsUVNBWy0KLHWObtc49rSNQEg==
X-Received: by 2002:a05:600c:3b0e:b0:43c:f6b0:e807 with SMTP id 5b1f17b1804b1-442d6ddea12mr180190615e9.31.1747144986468;
        Tue, 13 May 2025 07:03:06 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.148.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f33b5sm16661205f8f.54.2025.05.13.07.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:03:05 -0700 (PDT)
Date: Tue, 13 May 2025 16:02:49 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Peter Huewe <peterhuewe@gmx.de>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Naveen N Rao <naveen@kernel.org>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, linux-integrity@vger.kernel.org, 
	Michael Ellerman <mpe@ellerman.id.au>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicholas Piggin <npiggin@gmail.com>, Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH v4 1/4] tpm: add buf_size parameter in the .send callback
Message-ID: <vasgjrd5s3km4vdhyimcqq6etf7rvi2r54zrajrwioebrxl7o5@xyi5h2yxk36z>
References: <20250509085713.76851-1-sgarzare@redhat.com>
 <20250509085713.76851-2-sgarzare@redhat.com>
 <aB8D5syofPSqjzns@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aB8D5syofPSqjzns@kernel.org>

On Sat, May 10, 2025 at 10:44:38AM +0300, Jarkko Sakkinen wrote:
>On Fri, May 09, 2025 at 10:57:10AM +0200, Stefano Garzarella wrote:
>> From: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Add a new `buf_size` parameter to the `.send` callback in `tpm_class_ops`.
>> This parameter will allow drivers to differentiate between the actual
>> command length to send and the total buffer size. Currently `buf_now` is
>> not used, but it will be used to implement devices with synchronous send()
>> to send the command and receive the response on the same buffer.
>>
>> Also rename the previous parameter `len` to `cmd_len` in the declaration
>> to make it clear that it contains the length in bytes of the command
>> stored in the buffer. The semantics don't change and it can be used as
>> before by drivers. This is an optimization since the drivers could get it
>> from the header, but let's avoid duplicating code.
>>
>> While we are here, resolve a checkpatch warning:
>>   WARNING: Unnecessary space before function pointer arguments
>>   #66: FILE: include/linux/tpm.h:90:
>>   +	int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>>
>> Suggested-by: Jarkko Sakkinen <jarkko@kernel.org>
>> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
>> ---
>> v4:
>> - rework the commit description [Jarkko]
>> ---
>>  include/linux/tpm.h                  | 3 ++-
>>  drivers/char/tpm/st33zp24/st33zp24.c | 2 +-
>>  drivers/char/tpm/tpm-interface.c     | 2 +-
>>  drivers/char/tpm/tpm_atmel.c         | 3 ++-
>>  drivers/char/tpm/tpm_crb.c           | 2 +-
>>  drivers/char/tpm/tpm_ftpm_tee.c      | 4 +++-
>>  drivers/char/tpm/tpm_i2c_atmel.c     | 3 ++-
>>  drivers/char/tpm/tpm_i2c_infineon.c  | 3 ++-
>>  drivers/char/tpm/tpm_i2c_nuvoton.c   | 3 ++-
>>  drivers/char/tpm/tpm_ibmvtpm.c       | 6 ++++--
>>  drivers/char/tpm/tpm_infineon.c      | 3 ++-
>>  drivers/char/tpm/tpm_nsc.c           | 3 ++-
>>  drivers/char/tpm/tpm_svsm.c          | 3 ++-
>>  drivers/char/tpm/tpm_tis_core.c      | 3 ++-
>>  drivers/char/tpm/tpm_tis_i2c_cr50.c  | 6 ++++--
>>  drivers/char/tpm/tpm_vtpm_proxy.c    | 4 +++-
>>  drivers/char/tpm/xen-tpmfront.c      | 3 ++-
>>  17 files changed, 37 insertions(+), 19 deletions(-)
>>
>> diff --git a/include/linux/tpm.h b/include/linux/tpm.h
>> index 9ac9768cc8f7..7ac390ec89ce 100644
>> --- a/include/linux/tpm.h
>> +++ b/include/linux/tpm.h
>> @@ -87,7 +87,8 @@ struct tpm_class_ops {
>>  	const u8 req_complete_val;
>>  	bool (*req_canceled)(struct tpm_chip *chip, u8 status);
>>  	int (*recv) (struct tpm_chip *chip, u8 *buf, size_t len);
>> -	int (*send) (struct tpm_chip *chip, u8 *buf, size_t len);
>> +	int (*send)(struct tpm_chip *chip, u8 *buf, size_t cmd_len,
>> +		    size_t buf_size);
>
>I'm sorry but now that I look at this, just for the sake of consistency:
>
>	int (*send)(struct tpm_chip *chip, u8 *buf, size_t bufsiz,
>		    size_t cmd_len);
>
>I.e. match the order and parameter names from tpm_try_transmit().

Ah, I see, makes sense, I'll update and send v5.

Thanks,
Stefano

