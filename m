Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382551B95B
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537861; cv=none; b=kmMDABjMV24wOk375y94I67bs4ix/bSe3xN8wgzHdu/087OsYTJ2vfUfMUbR5QMVyOBcYVp3ODndWOB2r5ELRGUxyzhRMNDJ73RR/Tdadd4EEJwOUoYayshs+gyskSi+elHurY+ejVP+b7Mn5BNNBkmTRZpTSmVPDfdERsJvT9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537861; c=relaxed/simple;
	bh=7FiUXG03y5bMSiB9VO4YZAgtye/Y2LylQnBEoNChdBA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=VGoRJGuyK2P1f9QFMviTrbgkAMoFP59lMOIFHPLengq4LD4lMSmlIDIKMeqN3xyBZIALM+zQzLcC91oVO1wvvAFvQMNxU1LibAgsK13Ca2yTDXLxH0GrVoMstk7IhjDiw4FoRFqXr6wp9kK+KvtjUGVX7f2KZ2XP1iWmU0t+p/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LeIjA+5J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LeIjA+5J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751537858;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfQsXeetvvPPzsJ3/8ZSvfFMQdwAGhV0ruew1VUXFPQ=;
	b=LeIjA+5JP/HPAsjP1xKQLE9rD3aJDh2K3qh/2QaY+rQ+teomhnJnvfBOuejAmCu2B6BxPF
	pvdp3buuU5K9JO7OSK5NH49MV0BLKKLlQX8uPLz4K/yzs0l7rKq8NNRY+n66p6u83qE6+B
	mCv7I3SYWnC7xw6X+DpRepwstukK4vw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-319-VcPE-MhXO5W9gyupsgmyjQ-1; Thu, 03 Jul 2025 06:17:37 -0400
X-MC-Unique: VcPE-MhXO5W9gyupsgmyjQ-1
X-Mimecast-MFC-AGG-ID: VcPE-MhXO5W9gyupsgmyjQ_1751537856
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-45320bfc18dso4214025e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537856; x=1752142656;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jfQsXeetvvPPzsJ3/8ZSvfFMQdwAGhV0ruew1VUXFPQ=;
        b=amy/y5DmqsAv75/cUZrcLTM1UVrR7eIryB6Drlb3p8vQ2IgENd4w9kR4XL56hV0SoX
         leFtK7TdtfO7awqnpEY8MVk73xj0uxoiTgqo6P3AbEjBG4G35wROuUnB7pG4LG1dvlZY
         1dTWopyuKSRqUhqdR5mCh60P9GiumJSJJzkHBMs8obi45cqpEqCYfgHJfgi4/dXTzCJK
         N8CjuBzfrQm6x0fUWgR41Wpb38NYMxadxTYc5KOHuAFW1BKRp9ljLcYuqqOP1ws4BVDf
         Zxjm74df4Jrl/VUgQ4/VmGQztSGUdbJFSv3BGv5l7iOWnvJdZQ7OU7zXv4nx2YrZvgAC
         VHFA==
X-Forwarded-Encrypted: i=1; AJvYcCWXir++ylFWA/DODxYzDD3Nat6F4HIhAXTwV1bRTvOHPgHNzeXgYvl8y89A5Pw4rtWPWQhsIAOD6DDTL2s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxfr1qbyluGwId39cz7DEcJI+5wwDzvvomrXc453r/tdn3M+Bi2
	UB+nE4bZ+bjofPThO+31h7A7lbGf3mkQy52BV0AONq3PofKxwdmTYaMzmxk2NpQK0BYm8tYvKi+
	QjyNAPHQQMWfYDAGlJ1bfVXl4vwWeWtJ26wjygc3UpGn4ifAyPphXvupgt4YRVEgsvg==
X-Gm-Gg: ASbGncuxeWQGwmDu1ukhZeRP4MEKFUf8zFJFT4oK4G8avHcrE8rwcGsTyDrgmUFm+S6
	7AYP8Pun4zYzomxjGtk0eOvboGj46DTJYTGfw2FGQn+IGfqbZBkeTh69ZhoMSUnWbC7j8Qpp2RF
	y4EejJtaaX4e1uUF64s7MbL0RF3x87FXCLj52hRZSRi3Ub6NLvg5Fk84QyWOO+crywhHj+2HKRy
	lfDPcJgVate0s+8//QC6ynyDvN6VYsOeqQ8DaGzbux500DqeMbSwgvmcQw0hmeHdgqpyNDrgJSk
	v71+25x+At1MLguHrsairoQ+rz53o8aujuXE0z2imXuQ66/1S+NH67iTgYXc0+ESUq0=
X-Received: by 2002:a05:600c:a104:b0:453:5c7e:a806 with SMTP id 5b1f17b1804b1-454ab31f49cmr17484765e9.8.1751537855719;
        Thu, 03 Jul 2025 03:17:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHzsDilheHoSsZdDQok8pr2Px2x0eKxdKvVnOdfVvAvRP1Jm7fZHNWlhFagRLLbenLbksn8tA==
X-Received: by 2002:a05:600c:a104:b0:453:5c7e:a806 with SMTP id 5b1f17b1804b1-454ab31f49cmr17484295e9.8.1751537855244;
        Thu, 03 Jul 2025 03:17:35 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314? ([2a0d:3344:270a:b10:5fbf:faa5:ef2b:6314])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e597a8sm18185205f8f.70.2025.07.03.03.17.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Jul 2025 03:17:34 -0700 (PDT)
Message-ID: <1982e894-b61f-48c9-90a0-00e0236aa6be@redhat.com>
Date: Thu, 3 Jul 2025 12:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v1 4/4] net: phy: smsc: Disable IRQ support to prevent
 link state corruption
To: Lukas Wunner <lukas@wunner.de>, Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
 netdev@vger.kernel.org, Andre Edich <andre.edich@microchip.com>
References: <20250701122146.35579-1-o.rempel@pengutronix.de>
 <20250701122146.35579-5-o.rempel@pengutronix.de> <aGPba6fX1bqgVfYC@wunner.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <aGPba6fX1bqgVfYC@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 7/1/25 2:58 PM, Lukas Wunner wrote:
> On Tue, Jul 01, 2025 at 02:21:46PM +0200, Oleksij Rempel wrote:
>> Disable interrupt handling for the LAN87xx PHY to prevent the network
>> interface from entering a corrupted state after rapid configuration
>> changes.
>>
>> When the link configuration is changed quickly, the PHY can get stuck in
>> a non-functional state. In this state, 'ethtool' reports that a link is
>> present, but 'ip link' shows NO-CARRIER, and the interface is unable to
>> transfer data.
> [...]
>> --- a/drivers/net/phy/smsc.c
>> +++ b/drivers/net/phy/smsc.c
>> @@ -746,10 +746,6 @@ static struct phy_driver smsc_phy_driver[] = {
>>  	.soft_reset	= smsc_phy_reset,
>>  	.config_aneg	= lan87xx_config_aneg,
>>  
>> -	/* IRQ related */
>> -	.config_intr	= smsc_phy_config_intr,
>> -	.handle_interrupt = smsc_phy_handle_interrupt,
>> -
> 
> Well, that's not good.  I guess this means that the interrupt is
> polled again, so we basically go back to the suboptimal behavior
> prior to 1ce8b37241ed?
> 
> Without support for interrupt handling, we can't take advantage
> of the GPIOs on the chip for interrupt generation.  Nor can we
> properly support runtime PM if no cable is attached.
> 
> What's the actual root cause?  Is it the issue described in this
> paragraph of 1ce8b37241ed's commit message?
> 
>     Normally the PHY interrupt should be masked until the PHY driver has
>     cleared it.  However masking requires a (sleeping) USB transaction and
>     interrupts are received in (non-sleepable) softirq context.  I decided
>     not to mask the interrupt at all (by using the dummy_irq_chip's noop
>     ->irq_mask() callback):  The USB interrupt endpoint is polled in 1 msec
>     intervals and normally that's sufficient to wake the PHY driver's IRQ
>     thread and have it clear the interrupt.  If it does take longer, worst
>     thing that can happen is the IRQ thread is woken again.  No big deal.
> 
> There must be better options than going back to polling.
> E.g. inserting delays to avoid the PHY getting wedged.

I agree the solution proposed by this patch looks too rough. I think
more effort should be invested to at least understand why the phy got stuck.

@Oleksij: possibly you could re-submit patch 1-3 only while you keep
investigating the issue addressed here.

/P

