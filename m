Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9DD626AAB2
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746525195; cv=none; b=QSVHUbCbkFIpD2vazAwz0967PM7JPuvwu094cOJ//RnIZHxcSTLdGeQeD3XrOoxyIWY0Ebfz2Kk7zMe1ufEQJk+Ytp9K4RnaKtryyykS0nGGjbvFRxHk9pRDKhwESwKGxWNIakwgXa2BHrWABbcTCKFZlRgdOg4RjJT1R9GG+Cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746525195; c=relaxed/simple;
	bh=yHRqxw11DkfIZ1YAQcw+HF7fx4joijTrq2tX7o6YmGM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Zt0Aiv5lzq2G7vGYci/C529lUDiIXChIo/ZdnnDNm1ko2/EJybUm8TpDmBvdjbw36lHdkICaTmp+ILBE7CAQ4hYS5ZEk+S3KRJ4KiYhIvvZ7m2iMC2AZC7SJa4cU5A3i3AAJsyLWb7FaWu4sbzke674AqxqM1fN6OZAcuXaDw7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eCswHKJX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCswHKJX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746525192;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yHRqxw11DkfIZ1YAQcw+HF7fx4joijTrq2tX7o6YmGM=;
	b=eCswHKJXz8ujPl/1shc1kepGbjmjMaaOmzLAm19mEc+Xaio4Od5USAGuyLRKYvlJxWRAYb
	JUNLagooPBefza1tzEsHu/9YOMsayGo/2OeBc/TrwRUKHlDewoz2JQx9e/rAQ0hjfkG14m
	qMI2+ynvxwBQ++h3wewdGEwa+EG+fGQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-YElTz68GPveIUqa7yE8Dew-1; Tue, 06 May 2025 05:53:11 -0400
X-MC-Unique: YElTz68GPveIUqa7yE8Dew-1
X-Mimecast-MFC-AGG-ID: YElTz68GPveIUqa7yE8Dew_1746525190
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf446681cso31643035e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:53:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746525190; x=1747129990;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yHRqxw11DkfIZ1YAQcw+HF7fx4joijTrq2tX7o6YmGM=;
        b=gZgh+YCUu/fJ+bUvdDuwgd1OSua2KBGlCJcMh55m82YCa/PxzI7bkuIrgpINn+rZdZ
         iDdRZtubZYeLi//eLlaHxSyBfRkujqA1t2Zfa76uBUf7whWiAkQJUuNyzBqHpb+wmsjg
         t0H54a4rmwkyltoY7SaNJjr6R7ErBJi6usqd4tv2vcQV9FAnH90TdcSubnKQhQ1fslFa
         pIVJ9io+qrgFSVZ9+8pZLQdpJHmAE+3DIph2bO3CWo8LdwrlFbJFj5hw4Uds+LvGdvmF
         dc9uCqdykjVg+cdJQJcPv0GS6SbmqfKCNHEdW+jlBeEez1++4u0yhahCngwErNGAWaK9
         8qjw==
X-Forwarded-Encrypted: i=1; AJvYcCWqPyu50B4fWNENMlxCMc20b5YqVkUMdPLpcQ1HMA3673bvidclV7wCVnuifmZQHAQC4MOeWXSCbrMe/aA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzIrzG/42eFvHJXWUktrbwC2PnErkosjRRs5K/QcCOtx3W/hzSV
	ApXpBh8svNbsqG2jR2RvIvpMvXMjBdmOgMVvzmu9Q4y10Yrpo2zDN07g5Wd8ZCy2Kx9UFzjHyzf
	PcbaTTkXZi8Hx3gylkoQHFjQLAxkXNjcqEO1RhjbLmImSMu8R48Smhk8080ZCNg==
X-Gm-Gg: ASbGncvCRToB6z9YDYPUYadjEvsmkGDAPoBloVK9Do5lqlU2sER2YMiMCJv37eZ6qeW
	mwGwKG97EeAs2tY/WVoJ1OF48btP73rJRcMaz32Ap70d6kDCV2xK7PPf0BFMkQK4Epx1aYxGDJP
	4OMeoHluWSrckGlaPcc+CEn145l5xSj7ZqGRD8XlTtRUCfuGLyiviaP8f8yucQxhiojVWL2srkj
	EGmF6HdWJSXIuzch46Zj08I32BWbOolJb2O5Ce+cbOxJIaaDxLaIzaCzHX4pxGRxU1eA2oKr44F
	5QlS1b+mbfKTZ+kpWIXJQzYl4zZPQOaEyHY+dUgS/XcCW6tc+njgdWM0Fjc=
X-Received: by 2002:a05:600c:3492:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-441c48dc057mr110529635e9.15.1746525190289;
        Tue, 06 May 2025 02:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBClihtS9IZe3qn1YixeNsDYjWzT9jRKdwymrU9Lptja+rp5uq6be54s18DEHJEmCnLCf55A==
X-Received: by 2002:a05:600c:3492:b0:43d:683:8caa with SMTP id 5b1f17b1804b1-441c48dc057mr110529075e9.15.1746525189959;
        Tue, 06 May 2025 02:53:09 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2706:e010:b099:aac6:4e70:6198? ([2a0d:3344:2706:e010:b099:aac6:4e70:6198])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2ad7ab1sm209878815e9.4.2025.05.06.02.53.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 02:53:09 -0700 (PDT)
Message-ID: <ce36ce0e-ad16-4950-b601-ae1a555f2cfb@redhat.com>
Date: Tue, 6 May 2025 11:53:06 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 04/11] net: ti: prueth: Adds link detection,
 RX and TX support.
To: Parvathi Pudi <parvathi@couthit.com>, danishanwar@ti.com,
 rogerq@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, tony@atomide.com,
 richardcochran@gmail.com, glaroque@baylibre.com, schnelle@linux.ibm.com,
 m-karicheri2@ti.com, s.hauer@pengutronix.de, rdunlap@infradead.org,
 diogo.ivo@siemens.com, basharath@couthit.com, horms@kernel.org,
 jacob.e.keller@intel.com, m-malladi@ti.com, javier.carrasco.cruz@gmail.com,
 afd@ti.com, s-anna@ti.com
Cc: linux-arm-kernel@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, pratheesh@ti.com,
 prajith@ti.com, vigneshr@ti.com, praneeth@ti.com, srk@ti.com, rogerq@ti.com,
 krishna@couthit.com, pmohan@couthit.com, mohan@couthit.com
References: <20250503121107.1973888-1-parvathi@couthit.com>
 <20250503131139.1975016-5-parvathi@couthit.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250503131139.1975016-5-parvathi@couthit.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/3/25 3:11 PM, Parvathi Pudi wrote:
> +/**
> + * icssm_emac_rx_thread - EMAC Rx interrupt thread handler
> + * @irq: interrupt number
> + * @dev_id: pointer to net_device
> + *
> + * EMAC Rx Interrupt thread handler - function to process the rx frames in a
> + * irq thread function. There is only limited buffer at the ingress to
> + * queue the frames. As the frames are to be emptied as quickly as
> + * possible to avoid overflow, irq thread is necessary. Current implementation
> + * based on NAPI poll results in packet loss due to overflow at
> + * the ingress queues. Industrial use case requires loss free packet
> + * processing. Tests shows that with threaded irq based processing,
> + * no overflow happens when receiving at ~92Mbps for MTU sized frames and thus
> + * meet the requirement for industrial use case.

The above statement is highly suspicious. On an non idle system the
threaded irq can be delayed for an unbound amount of time. On an idle
system napi_poll should be invoked with a latency comparable - if not
less - to the threaded irq. Possibly you tripped on some H/W induced
latency to re-program the ISR?

In any case I think we need a better argumented statement to
intentionally avoid NAPI.

Cheers,

Paolo

