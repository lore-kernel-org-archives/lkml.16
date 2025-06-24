Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF9D2586EF
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 08:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750754379; cv=none; b=K1EDILH+neuY0fZIKo2dT3LEuI9hfpkR5uQBKooEbGG1bi8E26LTxUppPMUaVTW2+BKhozUA0nvzhArBoe98wjgTwWZnab3xKLv6aPMzGySZpaeLfZEP7dOAHHmXjrXaygMdH2wIQi+3zv6yB7wowgR8wtzvvz760WaUtxZHoMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750754379; c=relaxed/simple;
	bh=DVsCUdKVYcsFTKatDm5synRnxfD9Fb+XLA6NRENVAIQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HZcq4EWHGcyIfzPhhvAam/GfnxD671HlhcRzHtunPWSE0MArFN9NUAM/E42uN7X+MwoE6Fx5XHHcJ54Rhq4OxoskXgBHXxv41+SZyPT56v8oUN5tWWDOAGMCeKpAml2a0RNsktgtV6mga81RaeQ9zAq7+NiDXjgIPcS6EPoGNpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=BHIP9S+J; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BHIP9S+J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750754377;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=onzA+wcTvsJpzeYf5prB/BcDYizuukYIYq67f2ch1FM=;
	b=BHIP9S+JvdivmgyIaXgqn92vEbSGkKATtTHTTwtFXI4TI/3OVj5MwWE9fHAzLJe7dIXkz6
	jWY8jdQh3nZajZOFJt0GYVw4vedOgRtDfzZLg1CSZGs+U1cbQ44QpVzbyNtlwJXImSxyn+
	yL7r+8jzx8MkmyoifrLb3A1L4JOQOqM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-445-F1pYn6MQMua8HEtr_2IMtw-1; Tue, 24 Jun 2025 04:39:35 -0400
X-MC-Unique: F1pYn6MQMua8HEtr_2IMtw-1
X-Mimecast-MFC-AGG-ID: F1pYn6MQMua8HEtr_2IMtw_1750754374
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a523ce0bb2so2843542f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 01:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750754374; x=1751359174;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=onzA+wcTvsJpzeYf5prB/BcDYizuukYIYq67f2ch1FM=;
        b=WN+SlD71tRNwO52+FPL4eYBLv0dRl3eBLRawh3vny3Vyp8QVsvasdyVZe/ZOVDgTMe
         ceBgR3bUY35mtNQk7SsprBLRODW09W1BLVC1gP036JTvWIA7vJPrK6EHY7mTzl0qW1a7
         Co/ePtfSgtBwKGvINda7O3+G9Rcb4ZPM1H41gHRddo58XY57T0SK/7XWjDtiftIoQsSM
         EIjv6ET1nFZfz/iNxnPXMCVvwwtFM346838qwkMvsIDVFGiIhJ+PrKVyOKOtA3G7CnXi
         GyG2M72Skm76iMkBqYyu/wvx2h2lTNOJOAoY0jvXKUQNnodWAxVGWewUkDyRtNtmBTIC
         MUYQ==
X-Forwarded-Encrypted: i=1; AJvYcCW50gRPU1MRu4UVG54tdAZq4+a9bfm/67WbZHEUMQfQv+6qyFLfp9JWmQgkVGXN2EHH1R5XLohJMWGV/74=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9Mx9vpaKT6D+TmDolD+yZR0OOOeNOR6nc8cXnoR1Lwxq0uiT5
	0l9bKOrcMIe0OuzewCM0EkyPQsFwbwSATIz8YoOm7Xswa9i2EdO8TcBizovVkwV+ELLA+y/Flrs
	zI3fV2uyojkC1aqqvQsJxN/YMLIeZ/kjGvJtgLAvrZHLVCWZaH9YO54TrV8xJJKCbFQ==
X-Gm-Gg: ASbGncsHoTWosErC2DfKuXEfvrdE4bBW3wsgLjx3Vfw/CN5gZHIDVnrJTdGentK0+GZ
	4Alq1Ct+JofQsoF9PcclJCEukT3+ES0yta05Ab6bJVhpFMf7sDB/Jn0z1rfJMyyLR404o5uqemJ
	S8Bsht5opGGCA0pbz4jY/jpqfAs4Ffl+hOwz6Rw4LcOMXReG/KB+vv/89y2wNRZN+ySfvyxKh9P
	DtKSphLvfSPgCow3ixVFCUCUVdAqpZDPIkwEz3s9HF0BRBVXPZ1sc7xAeghAbeEkjBtD15Ongt9
	TSZ598MQPFsiB/omfoyjHaVaAi6grA==
X-Received: by 2002:a05:6000:220e:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3a6d128a495mr12354810f8f.1.1750754373870;
        Tue, 24 Jun 2025 01:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXACAuieXnf1ff0n3aChzXI+RXODXJppEWVes06kAMCgYriTZilclAie3vgKCk9utLq6WSPw==
X-Received: by 2002:a05:6000:220e:b0:3a4:fb7e:5fa6 with SMTP id ffacd0b85a97d-3a6d128a495mr12354781f8f.1.1750754373434;
        Tue, 24 Jun 2025 01:39:33 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e810977esm1319156f8f.83.2025.06.24.01.39.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 01:39:33 -0700 (PDT)
Message-ID: <8d5c6585-bc49-498d-9bb9-91d02e8e793f@redhat.com>
Date: Tue, 24 Jun 2025 10:39:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 1/1] phy: micrel: add Signal Quality Indicator
 (SQI) support for KSZ9477 switch PHYs
To: Oleksij Rempel <o.rempel@pengutronix.de>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>, netdev@vger.kernel.org
References: <20250619133437.1373087-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250619133437.1373087-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 6/19/25 3:34 PM, Oleksij Rempel wrote:
> The KSZ9477 family of switch chips integrates PHYs that support a
> Signal Quality Indicator (SQI) feature. This feature provides a
> relative measure of receive signal quality, which approximates the
> signal-to-noise ratio and can help detect degraded cabling or
> noisy environments.
> 
> This commit implements the .get_sqi callback for these embedded PHYs
> in the Micrel PHY driver. It uses the MMD PMA/PMD device registers
> (0x01, 0xAC–0xAF) to read raw SQI values from each channel.
> 
> According to the KSZ9477S datasheet (DS00002392C), section 4.1.11:
>   - SQI registers update every 2 µs.
>   - Readings can vary significantly even in stable conditions.
>   - Averaging 30–50 samples is recommended for reliable results.
> 
> The implementation:
>   - Averages 40 samples per channel, with 3 µs delay between reads.
>   - Polls only channel A for 100BASE-TX links.
>   - Polls all four channels (A–D) for 1000BASE-T links.
>   - Returns the *worst* quality (highest raw SQI), inverted to match
>     the Linux convention where higher SQI indicates better signal quality.
> 
> Since there is no direct MDIO access to the PHYs, communication occurs
> via SPI, I2C, or MDIO interfaces with the switch core, which then provides
> an emulated MDIO bus to the integrated PHYs. Due to this level of
> indirection, and the number of reads required for stable SQI sampling,
> read latency becomes noticeable.
> 
> For example, on an i.MX8MP platform with a KSZ9893R switch connected
> via SPI, invoking `ethtool` to read the link status takes approximately
> 200 ms when SQI support is enabled.
> 
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> ---
> 
> This commit currently focuses on single-channel SQI support due to
> budget constraints that prevent immediate extension of the SQI API for
> full multichannel functionality. Despite this limitation, the feature
> still significantly improves diagnostic capabilities for users, and I
> intend to upstream it in its current form.

AFAICS the commit message reflects the 'wannabe'/future implementation
and not the actual one included into this patch.

I think you should reword the commit message, describing the current
implementation.

Also it looks like the SQI value is not inverted, I'm unsure if you
should update the commit message accordingly or actually do the invert
in the code.

Thanks,

Paolo

