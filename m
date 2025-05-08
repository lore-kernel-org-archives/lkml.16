Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E47DA9C
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746700264; cv=none; b=MMnfkI+s255KJX8Y+apakeV17/0fn33718vS5OhDjU655k+y9DWWcUGChr0fKm9OKq6LaSEaihtrC3EXfcDFdMR/UkYT7e2KKCzU2+RXcGZPPnn0OdpzMyvb4w5cvylilVXxmSX96moiJCLI37o+l6b/bkUxM2pZJrWp0KM7aQE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746700264; c=relaxed/simple;
	bh=A8YkZE941Qo2bcb2V5y4qh1al/nROQMu27FsUkwRXXE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ide0llomKvZw9EEup+xegxgfJ5TRnDnRwAD2JBs8nvMp5HHgwIcrbkADNVUJ+4RjVSArygq9j8yyvGjywzcV60dXWiCXjMhIbWCjds4QoDNrLeUgVjIcI02PaNNXtxcbyZRlwAVQU7YZjx6jZL1AOb2rKnIDOxKR/ra7OudlGzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fqADccl+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fqADccl+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746700261;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KppfSxPYDF6f+QjVb7FQQnMkQOL1arXunk8/zYRcSfE=;
	b=fqADccl+9yKL/l4/lBr3UbYb9zkjHzVXjQ3U5Sk0A0C0SYIdZCGNWTyPLaOA2WtxgdEHAj
	mW5nT+chITkLe6/w9NOS9TLO7l6vqOCw9p9wtfZihRZnXtgI8xtjn/0YGTbVakXJ1L0met
	vcq4GJhpBCPle9mJrkfkODwoZ3q+yy4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-131-vc9aUmoAPtqM9rFgduVVFA-1; Thu, 08 May 2025 06:31:00 -0400
X-MC-Unique: vc9aUmoAPtqM9rFgduVVFA-1
X-Mimecast-MFC-AGG-ID: vc9aUmoAPtqM9rFgduVVFA_1746700259
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-441c96c1977so5648115e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:31:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746700259; x=1747305059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KppfSxPYDF6f+QjVb7FQQnMkQOL1arXunk8/zYRcSfE=;
        b=Id288pXLr3Ek6elJo0nE5Ye8d1vr4O288aX3KFk6e3B6Wx550g6DmYoc3WWo8ftsrI
         d+jJtJLbLLyjgpToTNMnwbS1uU5l1bmrisSLtAuxWeKA/HMqaiQsRQS78dP97fmxqisd
         9wWZUs0jC6+3PZqZFa53InK3U5770JN3BBHLDyn0Lt7lDlI2NLs0NhIT6mTSG2xe01JY
         +XRzA+3TJzKrrzC8BLRDz9pN3IufWMOQ8uD/IimUDZ+ztRoiGiQX3om3IOiFZEn2oHYq
         EtAclpBNWeEuD44ct9/wNNpNlRZXfe4k6j617N9dciJ8Ghg20ciLn/jhxdK9ORqWDIDG
         eKVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXd2bz9WUCFVNY10J2O5uFUQOPK18RMFkuza9qgFTypQj1gQhWT+OU85m7NpqjwSYHNqJ5Ffs31Zu2XE0M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+QftS2lFr4G+EBGjZ8gwQOgqMR1x4JcXNv9/MHnpEVuJekAEO
	FfS0j8VYsSNMefh1gjNWUdE7dRbHF9ZqSAZU/PQqQCOH48ogjDxOq62dIv/0hFH10e3VNto8n81
	Yej7a//Z3NyoO6iSLxWNlUO4GPs+8dhMlCLUtzUIWIRcJzZMTXTbNLmmg6xBh3Q==
X-Gm-Gg: ASbGncvUqBeus5wHaysKlbjwJvcutHqaBmW3FBBhfyM/a0AArXWvG8TgiBOtXa5c6nt
	Qw7ulibrn2EbRNtDCpYW+aW0LQ9+nTkK+evwAYG8aC/6hdvvi5u7M+0CEUv1MVTV143E6CtCasH
	NV0ajKbi+wFrQ6cYzJG/H4ySkKFVkI+MComlj7//h3LE/n8Sn9SgoKNPl060vDdBTG7lviU6Yej
	DgqXeyKqzMEXaHRFGvi1K48YD6Y1ZTGAAc0K+kzDz16pnVUzGSknpAc9Zyaj7lBKlYsOzuX+OEi
	HxGxHJ8YNy2BJL+M
X-Received: by 2002:a05:600c:c1d7:20b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-441d455c28emr31167075e9.11.1746700259167;
        Thu, 08 May 2025 03:30:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdfcxunDocP0pDjfnkPBi4M69qa1avvBAI2s5ulgVlUCPUhVgsQbaizTm4UBvb6rLfNgp1Ww==
X-Received: by 2002:a05:600c:c1d7:20b0:43c:fd72:f039 with SMTP id 5b1f17b1804b1-441d455c28emr31166825e9.11.1746700258778;
        Thu, 08 May 2025 03:30:58 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244b:910::f39? ([2a0d:3344:244b:910::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ba657db7sm2068319f8f.51.2025.05.08.03.30.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 08 May 2025 03:30:58 -0700 (PDT)
Message-ID: <c993748c-18ba-4dad-9130-01ac35322491@redhat.com>
Date: Thu, 8 May 2025 12:30:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 1/2] net: dsa: microchip: let phylink manage PHY
 EEE configuration on KSZ switches
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Florian Fainelli <f.fainelli@gmail.com>,
 Jakub Kicinski <kuba@kernel.org>, Vladimir Oltean <olteanv@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>,
 "Russell King (Oracle)" <linux@armlinux.org.uk>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: stable@vger.kernel.org, kernel@pengutronix.de,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 UNGLinuxDriver@microchip.com
References: <20250504081434.424489-1-o.rempel@pengutronix.de>
 <20250504081434.424489-2-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250504081434.424489-2-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/4/25 10:14 AM, Oleksij Rempel wrote:
> Phylink expects MAC drivers to provide LPI callbacks to properly manage
> Energy Efficient Ethernet (EEE) configuration. On KSZ switches with
> integrated PHYs, LPI is internally handled by hardware, while ports
> without integrated PHYs have no documented MAC-level LPI support.
> 
> Provide dummy mac_disable_tx_lpi() and mac_enable_tx_lpi() callbacks to
> satisfy phylink requirements. Also, set default EEE capabilities during
> phylink initialization where applicable.
> 
> Since phylink can now gracefully handle optional EEE configuration,
> remove the need for the MICREL_NO_EEE PHY flag.
> 
> This change addresses issues caused by incomplete EEE refactoring
> introduced in commit fe0d4fd9285e ("net: phy: Keep track of EEE
> configuration"). It is not easily possible to fix all older kernels, but
> this patch ensures proper behavior on latest kernels and can be
> considered for backporting to stable kernels starting from v6.14.
> 
> Fixes: fe0d4fd9285e ("net: phy: Keep track of EEE configuration")
> Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
> Cc: stable@vger.kernel.org # v6.14+

It would be great if either a phy maintainer could have a look here.

Thanks,

Paolo

