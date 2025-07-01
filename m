Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E757220F36
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 09:15:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751361338; cv=none; b=CvRfShyFl7RqOIfDPFSvvvE13O062lpt53ePXuGafGf3RFksrKtnYMZyMBjHbiuDmZNGtVPS4OSV46yN+b1a92uTZJL/b+Xq5L2YFGjW1x88zbD7+5kdR05/0/RXkUQDtbnJTkYtr0pVdiTKwrWJWa8uyUIr3uVo3K70+hVtNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751361338; c=relaxed/simple;
	bh=ezfXSHuhu9Sfb5a0gaNDiCPb89N/ZDg7kI93quY/1HU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SK8mZFa97OCtO2OokWxzg588TVeIm8DSvhCqaHzO9Ln49X/9H9y6+Mfzi9blFioUHyn+CcT4WGBnKJf5bbXou2y1vfGC2dnax6/LVRX/ZU+Ox3YyEd6hqPNrLyhG84G7OTWNQx1KkyUvPJCZd5evmUasZ4wFhotw+Dfu1HgnkOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hWTO77/S; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hWTO77/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751361335;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jan/Z3DTLxwVO5Mfsu41/us04DIzAuMZQLApYN5eBrM=;
	b=hWTO77/STWuHlQbIyH8t9aKI9RKHNYvZP4XdCC85Q7oYGGFm4K/xUm9llzkGyJbA8urGAx
	2qHwmgALiee8dqR3rjDcDujMvlvRjnx2gAzKGonP2ZqebrJq8wnLsHe1PcTdtgNWokRl7n
	niIQmGWHavI0XP6PwiN8Z+/oD1o/XvM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120-GCIiYlkeNLq7GcD8GtVNFw-1; Tue, 01 Jul 2025 05:15:34 -0400
X-MC-Unique: GCIiYlkeNLq7GcD8GtVNFw-1
X-Mimecast-MFC-AGG-ID: GCIiYlkeNLq7GcD8GtVNFw_1751361333
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-451d7de4ae3so26049655e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 02:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751361332; x=1751966132;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jan/Z3DTLxwVO5Mfsu41/us04DIzAuMZQLApYN5eBrM=;
        b=iPbpyVqGLWLokFsxzPPdzDXcIN4JiIYJcVOV2jf01ZFUVW8sSlc212XXUnz8tHofmH
         h8aySpzsi1ABrcj23GLR8kSXCoGM4uJ73VfVXa+qolClSymvLXJvgL1x2lafsM7xl7LN
         yH4jHQW8BBpLFavNN6/fODQN2zURM2+8HYjJHny796Ycw+O2lLPlIdwNdywzxSjbZ7Y/
         tdci356Ms2SgGE/saJQJG67phVVtYLjx699kmy6bxpLRgDqLTy5AYIdlbH99mMuhHD4n
         XPQCd7cEog1V2DRQ3YEVOoEYLFQlHpUfQW752QZaCcPGTsL2xighqKD23mXzsKTk12Gb
         R7Cw==
X-Forwarded-Encrypted: i=1; AJvYcCXeKKiFGTQNfu08J7jZKeVeCvu1fSKIaHdk69N3RS3WGfRYDtmdswr/yXoKLSZ5NKFP2C9aYO0oXGzg2TU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE2ja9rALondUHZg3kvNAZfoegG5OJZ1BcsbCJ+ecrTVJal7IS
	h2Y4QZHFSwUGT9nhHs50x+YVzrfeQQVaFwqxlGgRkGrW5pbhMjD+cUss4IteMgnTdd81gTruWyp
	8GA6CbX4js1SYg2qr2O7OTb9+bLrZSEqChKvyGviju3HjaY8rYkrnVOgDzdRFNeHGcQ==
X-Gm-Gg: ASbGncv9Z44xboekr5xCvkPHtWvOa5QsoMmOEL4OSUSpKMri6Jyy8LN7oDyYn2lS0OD
	wRx1TCGd6rTco8LKasSKLdrWg4hfi+b3nfSUljepcaGKthXi3igXGabdHJfezqaJnb4N9G20z89
	ebIyF+mHONR/BHOX92Cq3lP72S2A6w46DVfPD9gunAYvCcYZbZ3ObJlrVgy/yGPMi3u1EHi+FVV
	Z4ZQnIyn0wqFvHePiF6SK52+CuLkdDpLcyS4O3I/AVSjjrKQl8Nny6tw1uY/eBfgL3jf8XlLGKi
	DkCae7j2tgcCOhB3Ijtm8pN2YFFnvXhDtvcG8d1D1Yzc8jbQForYDiAbCw7y5BQlhkCQvQ==
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr143524945e9.6.1751361332474;
        Tue, 01 Jul 2025 02:15:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH1+hhiGD2TdhbjM5rCKiCBttXAuLX4uPrW3umLUj3ZjRQ1AlwZwCo9b7DK/NCeCb3VsFrpgQ==
X-Received: by 2002:a05:600c:8b6f:b0:43c:fe15:41dd with SMTP id 5b1f17b1804b1-4538f9b3107mr143524595e9.6.1751361332010;
        Tue, 01 Jul 2025 02:15:32 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:247b:5810:4909:7796:7ec9:5af2? ([2a0d:3344:247b:5810:4909:7796:7ec9:5af2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453a85b3d44sm11486255e9.0.2025.07.01.02.15.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 02:15:31 -0700 (PDT)
Message-ID: <7c9c7be7-af3c-4f40-80b4-5b420ebbfca3@redhat.com>
Date: Tue, 1 Jul 2025 11:15:29 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v1 1/1] net: usb: lan78xx: fix possible NULL
 pointer dereference in lan78xx_phy_init()
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 UNGLinuxDriver@microchip.com, Phil Elwell <phil@raspberrypi.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Simon Horman <horms@kernel.org>
References: <20250626103731.3986545-1-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250626103731.3986545-1-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/26/25 12:37 PM, Oleksij Rempel wrote:
> If no PHY device is found (e.g., for LAN7801 in fixed-link mode),
> lan78xx_phy_init() may proceed to dereference a NULL phydev pointer,
> leading to a crash.
> 
> Update the logic to perform MAC configuration first, then check for the presence
> of a PHY. For the fixed-link case, set up the fixed link and return early,
> bypassing any code that assumes a valid phydev pointer.
> 
> It is safe to move lan78xx_mac_prepare_for_phy() earlier because this function
> only uses information from dev->interface, which is configured by
> lan78xx_get_phy() beforehand. The function does not access phydev or any data
> set up by later steps.
> 
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>

Looks good, but this IMHO deserves a Fixes tag - yep, even for net-next!

Could you please share it?

Thanks,

Paolo

