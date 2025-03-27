Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7517121859A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 14:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743086660; cv=none; b=i7iDGs62sXcuCoFSAgfARQQnMj1C8k3f3n9Ln7fUOwKVw0cYbVOgBaCErZHzqmeKtmTtfH44JLQYY4RphgUS+qlubZVkPX83NR73Wzx2cPwaijDaKIRYt/E8devcvq08B3nbc/OWgJlXryP1WUWPNSvY8vIS0Vi+YtYv7F48C2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743086660; c=relaxed/simple;
	bh=d6Xu/BFgeGgDcdBzwEk9PB3O7pJ7ObaENjEtuHbA6+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OWcdrYV5mSDMn5cnaG/QF/sSJnBbVet8mjCkZ7bWRnNC5Iyfkakxh/qyDX0TMXhUMgVJKef51IryWnWuAnMyfgYbotSPZMjAcqcXH6n/Re18Xlwbk2Sqd3TXH1tFpLUL8wKfrfdMwrygIzW4JQU3nsIK9//vi9EeC48HVv1KKmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NaYAsbEG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NaYAsbEG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743086656;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=SBTG0JGuxf9FkDoZXb2Ow+D+IbpvxoiKR3EeWRclaFo=;
	b=NaYAsbEGw5uhrc4AhCt/9PsV1+tMM6jeLIU3c4Gy1ckeXOM+3Gna2jqGu9tKZ8xR5vrhkX
	nwOVA9wPWqo0gU5TPjmeBxK+WsZx15Fj57JREMcPFaXEYoNfgA8rxV6CJ32Vlvmbf2mBbw
	HN5xjIi8MtIkOgVwhxfdi69V4vpcQv8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-9xvRi57eNbqBidw6_v8xZA-1; Thu, 27 Mar 2025 10:44:09 -0400
X-MC-Unique: 9xvRi57eNbqBidw6_v8xZA-1
X-Mimecast-MFC-AGG-ID: 9xvRi57eNbqBidw6_v8xZA_1743086648
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43ce8f82e66so6913755e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 07:44:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743086648; x=1743691448;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBTG0JGuxf9FkDoZXb2Ow+D+IbpvxoiKR3EeWRclaFo=;
        b=B78X5fEA2pS60QocpU3wX79ZMxVXmESTtmtf94wMUQuMeXOnexjxDWHvjU+YkagrBT
         czODwnD5IdmpbDWi2YnAC0A1X+/gGe+/Jdf8O/R4uj22q6H66hSsP75HSvAT04JFmBhe
         VQVlD7A9h9BMwBpPeMoGaeE2OjSUmesdGJ9yzzGM5FclL5NmT0iniRSnTnk1sgjMljnL
         9rgoEjAv3pqc7mIaDC0LaK/ikzGpbE9+TIGWkPDTtpK9AP9C5lDfX239hyU8VjhE6qFF
         2Jtx569EoW7+J67ibPY0RMHprF+9xXKTjAyRTdr7qI6jv7puAL3P/REt16gkK5rpwe48
         tHkg==
X-Forwarded-Encrypted: i=1; AJvYcCUfhff2XQoU/hnGNw0r0VJhvuY8lqviiobs8sB1LtUcUjL5gQBCVXUQTlJ+vZjlq3FHJfdN9RdP7ihJr3U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhXKFoM4ndi+nXP5j6AdW0//72/1doUC4gw0295Z1jL0gCH8MY
	f/CpY+IzgH3eGMCDMzWUatI4ukmNI5AIlyUEk4Acu21iGgjOZ++XcrJS+Sa7xb/k825Hek0e8Mz
	5u0DpOtiYruoa4nJKQmxpKUOhCknnW8EbQ4hcfVbv6psq0fGRbmW1WEv7lICMeQ==
X-Gm-Gg: ASbGncuI8j9gwcKu0/yV/FvoMnbxMZQ2dNbDmZP6fPwKyVf249JSCPss+ByXE3uZWZQ
	VeLwV6d8Kstqm43OETr+OR29B9mpJ75A5UXjdMIIcweVdnNAPsadcaDrpnRUBWzqnUbEIkbiOtO
	FH6Zwu7IKMBB4rQ7Q4Tbu+kPlLG+i4o6SF4qbFomCud2OKStUsnOF8kCQFEeyMi3y2bOx0U7tsm
	e8d3+5gbjTaOonhg9dUVW6XFm4rwyOi994Tjhi30jIjjhisDonbnwCYXW8+9WgsPUmgpWEMRynH
	fCdwTwEhWH2grGg65h7InFr9zkmQoCELTdBjQyCdI0Bdt3Vgob2wxb7nCy7ctnix
X-Received: by 2002:a05:600c:138a:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-43d84f60ce1mr42280485e9.5.1743086648296;
        Thu, 27 Mar 2025 07:44:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGfDYAxxsKTCw2DsFd7FNQsrLddXHo43pipbWePZvF/j/lq0gWQWkRDJ6Cjwx/DH6qCARj+Ug==
X-Received: by 2002:a05:600c:138a:b0:43d:300f:fa3d with SMTP id 5b1f17b1804b1-43d84f60ce1mr42280195e9.5.1743086647808;
        Thu, 27 Mar 2025 07:44:07 -0700 (PDT)
Received: from sgarzare-redhat (host-87-12-25-55.business.telecomitalia.it. [87.12.25.55])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d82f7b9f4sm41179575e9.34.2025.03.27.07.44.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 07:44:07 -0700 (PDT)
Date: Thu, 27 Mar 2025 15:44:00 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-kernel@vger.kernel.org, 
	Peter Huewe <peterhuewe@gmx.de>, linux-integrity@vger.kernel.org, 
	James Bottomley <James.Bottomley@hansenpartnership.com>, Jens Wiklander <jens.wiklander@linaro.org>, 
	Sumit Garg <sumit.garg@kernel.org>
Subject: Re: [PATCH 1/2] tpm: add send_recv() op in tpm_class_ops
Message-ID: <wwf3brf4rtdh7ciejgbjesy32ywqxw5vrpuznyee2yp4arrtmw@gspriiauxvgt>
References: <20250320152433.144083-1-sgarzare@redhat.com>
 <20250320152433.144083-2-sgarzare@redhat.com>
 <Z-QxH7aDjlixl2gp@kernel.org>
 <eidmcwgppc4uobyupns4hzqz562wguapiocpyyqq67j5h26qbl@muhbnfxzqvqt>
 <Z-VMWl9UDx5ZY1qK@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <Z-VMWl9UDx5ZY1qK@kernel.org>

On Thu, Mar 27, 2025 at 03:02:32PM +0200, Jarkko Sakkinen wrote:
>On Thu, Mar 27, 2025 at 10:48:17AM +0100, Stefano Garzarella wrote:
>> On Wed, Mar 26, 2025 at 06:53:51PM +0200, Jarkko Sakkinen wrote:
>> > On Thu, Mar 20, 2025 at 04:24:32PM +0100, Stefano Garzarella wrote:
>> > > From: Stefano Garzarella <sgarzare@redhat.com>
>> > >
>> > > Some devices do not support interrupts and provide a single operation
>> > > to send the command and receive the response on the same buffer.
>> > >
>> > > To support this scenario, a driver could set TPM_CHIP_FLAG_IRQ in the
>> > > chip's flags to get recv() to be called immediately after send() in
>> > > tpm_try_transmit(), or it needs to implement .status() to return 0,
>> > > and set both .req_complete_mask and .req_complete_val to 0.
>> > >
>> > > In order to simplify these drivers and avoid temporary buffers to be
>> >
>> > Simplification can be addressed with no callback changes:
>> >
>> > https://lore.kernel.org/linux-integrity/20250326161838.123606-1-jarkko@kernel.org/T/#u
>> >
>> > I also noticed that tpm_ftpm_tee initalized req_complete_mask and
>> > req_complete_val explictly while they would be already implicitly
>> > zero.
>> >
>> > So it reduces this just a matter of getting rid off the extra
>> > buffer.
>>
>> Yep, as mentioned I think your patch should go either way. So here I can
>> rephrase and put the emphasis on the temporary buffer and the driver
>> simplification.
>
>Yes. Removing extra copy is a goal that can only make sense!
>
>>
>> >
>> > > used between the .send() and .recv() callbacks, introduce a new callback
>> > > send_recv(). If that callback is defined, it is called in
>> > > tpm_try_transmit() to send the command and receive the response on
>> > > the same buffer in a single call.
>> >
>> > I don't find anything in the commit message addressing buf_len an
>> > cmd_len (vs "just len"). Why two lengths are required?
>> >
>> > Not completely rejecting but this explanation is incomplete.
>>
>> Right.
>>
>> The same buffer is used as input and output.
>> For input, the buffer contains the command (cmd_len) but the driver can use
>> the entire buffer for output (buf_len).
>> It's basically the same as in tpm_try_transmit(), but we avoid having to
>> parse the header in each driver since we already do that in
>> tpm_try_transmit().
>>
>> In summary cmd_len = count = be32_to_cpu(header->length).
>>
>> I admit I'm not good with names, would you prefer a different name or is it
>> okay to explain it better in the commit?
>>
>> My idea is to add this:
>>
>>     `buf` is used as input and output. It contains the command
>>     (`cmd_len` bytes) as input. The driver will be able to use the
>>     entire buffer (`buf_len` bytes) for the response as output.
>>     Passing `cmd_len` is an optimization to avoid having to access the
>>     command header again in each driver and check it.
>
>This makes more sense. Maybe we could name them as buf_size and
>cmd_len to further make dead obvious the use and purpose.

Yeah, I see. I'll do!

>
>>
>> WDYT?
>
>I just want to get this done right if it is done at all, so here's
>one more suggestion:
>
>1. Add TPM_CHIP_FLAG_SYNC
>2. Update send() parameters.

So, IIUC something like this:

     int (*send) (struct tpm_chip *chip, u8 *buf, size_t cmd_len, size_t buf_size);

Where `buf_size` is ignored if the driver doesn't set TPM_CHIP_FLAG_SYNC.

Right?

>
>You don't have to do anything smart with the new parameter other than
>add it to leaf drivers.

Okay, this should answer my question :-) (I leave it just to be sure).

>It makes the first patch bit more involved but
>this way we end up keeping the callback interface as simple as it was.

Yep, I see.
And maybe I need to change something in tpm_try_transmit() because now
send() returns 0 in case of success, but after the change it might
return > 0 in case TPM_CHIP_FLAG_SYNC is set. But I will see how to
handle this.

>
>I'm also thinking that for async case do we actually need all those
>complicated masks etc. or could we simplify that side but it is
>definitely out-of-scope for this patch set (no need to worry about
>this).

I see, I can take a look later in another series.

Thanks,
Stefano

