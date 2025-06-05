Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04DD24B26
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 09:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749114425; cv=none; b=L3dR0joQ2f/hVzW339tB2P83pu11kkiLgEu4P3SoQsC6glWE8x+k8eezzhxQYnKKP/Q01xmDfc8XEeDxTyhoo+e6CelBUdcEcOVuUBcuqlTZI9meS+YqEg/uJ/StTM6J35sHRUSpfeCZJMsSL1OyC9wIAEE1xfENK50TqQbfDN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749114425; c=relaxed/simple;
	bh=gTftk7/nkdK9vp6F7FHEsBQZkeiPm4Dw7fvnIHl0Tno=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QlYqqPXwnfjsvED1FDHEnccTrUMSEM2oYrGjNhWyM85GPGUJeWSuDSma5WZhMKvRbbHdsFrohEs3oliLO92alVFbthUOH/21z18VBeprsDS8Wk05FZ9B7VZKNqse5ltT2xPRNdUZ1M4EMQ9WZYH4PQzqbnw3I7HaYe+qjNmh10U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GC+s6pa1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GC+s6pa1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1749114422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LZzG29XfVtAPAG3t2hijtGsa7i91luWBgzXZdJoVOTU=;
	b=GC+s6pa1Ctvs2CPn4aeb/Dg8Igmd+GTc+cxmMEipjR/aUoQxXJv8uMIGwPn3X9WdLttbhW
	jDWDJ/nwZv04ay94VuFwdf7RVwFi9xYXrvftoYl1Ex+Tx8yyYFdRzQfl4abilDVKTw2CL6
	bgZ/WMXslvjqyzL1h5KFTO7FaapLfkg=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-148-atxoQwvBOPWaVsYQ8uUWnw-1; Thu, 05 Jun 2025 05:06:59 -0400
X-MC-Unique: atxoQwvBOPWaVsYQ8uUWnw-1
X-Mimecast-MFC-AGG-ID: atxoQwvBOPWaVsYQ8uUWnw_1749114418
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-450d290d542so4485265e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 02:06:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749114418; x=1749719218;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LZzG29XfVtAPAG3t2hijtGsa7i91luWBgzXZdJoVOTU=;
        b=S4lmVk330KvEYeE47Hx7UTTv7FTnTGPpgww0ymACPOgarxMTDagIk2wlhsYvmLbW0F
         c7a6xGXq2sBDpdgi90bYueCpMfLUhx4VDGddg6OZ0B/YdN2siXDXYo16CPzxMyuT1lwz
         sTV3EL+Qko6Kc7ObmpUmJLrbzeq+ckR25RQL+G5CPd6p4HacTxY5qO6uAS8hlkCR7acq
         eh98oAJqaqy4tVFaIbBEgj4+Z3i2cKE4y4hAvm0bHf7G2JR4Rt3+YvWk5bMg3Wb4pMhv
         274e9HhYyXRHMAIbzmmOQIWjC/Ddp1w15kVj7l28wkxnHVqGLLllXYdR9ZV2XV/3I25r
         NFCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzoCjLxO3994ssm+OW4eL1GJybFhdE0KP45NBqLpERzhw2bM1IiiSikU/XwfWWxhHYE8IzIgr057O4WcY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsvcqQU2mD2NH6TcmjYVAOyKNppb9la45mrEXUzJ0DppHIXZm3
	NKhR8RuUGmSMDRFJm/+oDPsBMeag1g4lZD6HhSTU9tKkiAsL++pn9JbpkssF8e1xyvF20VhbDuD
	zsXwFPQTKh/Yw5GNZ/FVy4okb3/bh1WGPVZE6Tdh0FJqFaY8z8FXYPBTovp6c8GYgZA==
X-Gm-Gg: ASbGncu3nhhfkYa65QeOZ4uMdLUoD5sthE52rQxgAsrBSvB+OQLaynILl37NNXIf1dh
	Lb2qPFzLeWMkNykkXxYyBqWc/btT3g1MRkmfrBwOFt8MrSsZoEEqv1x/2c8lsp1l4eX1vJimNsH
	5FnqKIJAEDPgxdRM4NqFWejPvRibuEvgXrID0RbZYJGqJJoPaMQDldj5+4zI/HedlWHWnOG5ziB
	hGlqGVdhiw5IuMXbkMXl6iHJzb/DDin+GxnNVDZ8XSFwmB22j5urTKyY1Bn1l+8T8QvzLDEWA8v
	ae2i6PUqU4bK7AGTduI=
X-Received: by 2002:a05:600c:8b5c:b0:450:cc80:e594 with SMTP id 5b1f17b1804b1-451f0f9ec8cmr47390985e9.26.1749114417780;
        Thu, 05 Jun 2025 02:06:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGlrfN/L0KGA9nkVyJ1PtjS5kYtl/CnjHZ8ZUdlVpdeHiEfUCdFyXT/5Q9D9x2ORf/SUTY2kg==
X-Received: by 2002:a05:600c:8b5c:b0:450:cc80:e594 with SMTP id 5b1f17b1804b1-451f0f9ec8cmr47390645e9.26.1749114417350;
        Thu, 05 Jun 2025 02:06:57 -0700 (PDT)
Received: from ?IPV6:2a0d:3341:cced:ed10::f39? ([2a0d:3341:cced:ed10::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-451fb208240sm11589085e9.26.2025.06.05.02.06.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 02:06:56 -0700 (PDT)
Message-ID: <ead87a84-5a44-4c21-91bb-9086ba1fbcc3@redhat.com>
Date: Thu, 5 Jun 2025 11:06:55 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v2 5/5] net: dsa: b53: do not touch DLL_IQQD on
 bcm53115
To: Jonas Gorski <jonas.gorski@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?Q?=C3=81lvaro_Fern=C3=A1ndez_Rojas?= <noltari@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250602193953.1010487-1-jonas.gorski@gmail.com>
 <20250602193953.1010487-6-jonas.gorski@gmail.com>
 <c1c3b951-19b8-462a-9dee-a1b893251d6f@broadcom.com>
 <CAOiHx=n6Mc+nM2QOa8okQbFcj9UHgfMbKKcNXG6D-VJjELHrsw@mail.gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <CAOiHx=n6Mc+nM2QOa8okQbFcj9UHgfMbKKcNXG6D-VJjELHrsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/3/25 8:15 AM, Jonas Gorski wrote:
> On Mon, Jun 2, 2025 at 11:40 PM Florian Fainelli
> <florian.fainelli@broadcom.com> wrote:
>> On 6/2/25 12:39, Jonas Gorski wrote:
>>> According to OpenMDK, bit 2 of the RGMII register has a different
>>> meaning for BCM53115 [1]:
>>>
>>> "DLL_IQQD         1: In the IDDQ mode, power is down0: Normal function
>>>                    mode"
>>>
>>> Configuring RGMII delay works without setting this bit, so let's keep it
>>> at the default. For other chips, we always set it, so not clearing it
>>> is not an issue.
>>>
>>> One would assume BCM53118 works the same, but OpenMDK is not quite sure
>>> what this bit actually means [2]:
>>>
>>> "BYPASS_IMP_2NS_DEL #1: In the IDDQ mode, power is down#0: Normal
>>>                      function mode1: Bypass dll65_2ns_del IP0: Use
>>>                      dll65_2ns_del IP"
>>>
>>> So lets keep setting it for now.
>>>
>>> [1] https://github.com/Broadcom-Network-Switching-Software/OpenMDK/blob/master/cdk/PKG/chip/bcm53115/bcm53115_a0_defs.h#L19871
>>> [2] https://github.com/Broadcom-Network-Switching-Software/OpenMDK/blob/master/cdk/PKG/chip/bcm53118/bcm53118_a0_defs.h#L14392
>>>
>>> Fixes: 967dd82ffc52 ("net: dsa: b53: Add support for Broadcom RoboSwitch")
>>> Signed-off-by: Jonas Gorski <jonas.gorski@gmail.com>
>>> ---
>>> v1 -> v2:
>>> * new patch
>>>
>>>   drivers/net/dsa/b53/b53_common.c | 8 +++++---
>>>   1 file changed, 5 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/net/dsa/b53/b53_common.c b/drivers/net/dsa/b53/b53_common.c
>>> index be4493b769f4..862bdccb7439 100644
>>> --- a/drivers/net/dsa/b53/b53_common.c
>>> +++ b/drivers/net/dsa/b53/b53_common.c
>>> @@ -1354,8 +1354,7 @@ static void b53_adjust_531x5_rgmii(struct dsa_switch *ds, int port,
>>>        * tx_clk aligned timing (restoring to reset defaults)
>>>        */
>>>       b53_read8(dev, B53_CTRL_PAGE, off, &rgmii_ctrl);
>>> -     rgmii_ctrl &= ~(RGMII_CTRL_DLL_RXC | RGMII_CTRL_DLL_TXC |
>>> -                     RGMII_CTRL_TIMING_SEL);
>>> +     rgmii_ctrl &= ~(RGMII_CTRL_DLL_RXC | RGMII_CTRL_DLL_TXC);
>>
>> Are not we missing a:
>>
>> if (dev->chip_id != BCM53115_DEVICE_ID)
>>         rgmii_ctrl &= ~RGMII_CTRL_TIMING_SEL;
>>
>> here to be strictly identical before/after?
> 
> We could add it for symmetry, but it would be purely decorational. We
> unconditionally set this bit again later, so clearing it before has no
> actual effect, which is why I didn't add it.

Makes sense, and the code in this patch is IMHO more readable.

/P

