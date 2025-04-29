Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6F229DB99
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745917229; cv=none; b=QoIGghZQxb6HatuLw8mokp5T0Qr9SROABlnWa5BkFc7ByZeALaI7lk/Fb3aSqobtXm+daNyz8zVGI+nWRAv8qjbCW9uYMKRPK5CkNwLbb74uHeYXaK7MIJNpnTnueIKTG8EhBmjG1d7JYqGl3HPvL2VY/AW4yz93xivQ3qwPlKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745917229; c=relaxed/simple;
	bh=2KIKuRu81xZaF2280xYX/+R5+wlu8WDBf1ye5GbVH/Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HLV5A5dI/X94qp1YGTxlolTgwGTUzvd+xqYgofXu+5DRz/0pQ5G55X+irg6viKRDiwxlh89ztE2yfCvAp6/V8rTueCvDriExkOCi/IX3RuxKL9oPoqp8U6f7+XZzC5Ou2KuyPzKOZ0+Or64O4gXqLcO58GQ0/VSOoxJk0VYQT14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Pezbsw1B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Pezbsw1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745917226;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PCHHHLvZcH3BVlqKXz9f7p7K33kY7dzdDWtjNHcUjrA=;
	b=Pezbsw1B9qB1GEwXC4pH5VjS4qkEho7iMsqieDAPwO98WSpzbdxIDud0JAcazRtcN5qju8
	eFffV324TG6xy1yX26DCZSTzTVXSUBedBf+0PVxGW7nCj7rFq7xACb0h6qs7a6sG+VHMTX
	abSwvrN9oTCFfpX7ux2nVAX/vglm2xQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-187-svF3wDM_PiG1aCsMSlodKw-1; Tue, 29 Apr 2025 05:00:24 -0400
X-MC-Unique: svF3wDM_PiG1aCsMSlodKw-1
X-Mimecast-MFC-AGG-ID: svF3wDM_PiG1aCsMSlodKw_1745917224
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acb23361d73so125595566b.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745917223; x=1746522023;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PCHHHLvZcH3BVlqKXz9f7p7K33kY7dzdDWtjNHcUjrA=;
        b=CQPFwcE4zTErjsqPAAWsU2Pa/re3cC9E79rpAS4QT2av3DVkkAvqZle/eELdXUPaNW
         UnSZv0INDFvFnR7V1QzetnU1gzyog+oHUdB+TjHpxNzT2cE/35+dWqPU1EuT37BWTGf8
         PSanM27p+YiPdbBAp4I7LjrEkf8uT9U4P38tOIVfXDT1P7o4aD2WD1IUBa74FNhdZZVk
         /lsH2DjLTwVQBr9LsSAZG6l+lRW29vhYOgFU2ccqM+LQuLtkO8CXGbYl+pZSfUB5yprW
         h+pgaaZ9d4nuLaM+FKMgXxYYdCufY6dQldb7YwISIgUT2dSVn+xsW/8a2w8wkO9LZ09d
         H1sQ==
X-Forwarded-Encrypted: i=1; AJvYcCVyJHkYXzTV0KecnyMDXm7VhTyHEwA1G0/Lt6z7UxshH/iWZMuuwQu13WBZQfD6s+PGWDw8gEdDgsuDTkY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1FZU5I885jnQIQnU7et8bzuUXtvRS2+zWWE9OxhXykcy1RBnE
	y4h3gGw4zvI+f2bUJPE7yJTsZu/2zkN6KOSQE/6DZQ+WxvjwHrnEkospUzHY4Aj2P3e2iy+XU+O
	V3Jkn3kAR1T4peA51hJ+Llkc4pMiwGmFzDBVsVXjSBhl2TNHRpYB3U+C9r9aMJw==
X-Gm-Gg: ASbGncvB0TYpgtfBRDAcaPVouxHupdostfTy25I9FQfp559xoyk6aCU2dK8dk7QAX/0
	nUwFh/pspEPzUN+l8s6b4CDhDRAW5rGXRJfLGG2Y1voerLWBdo20V8XCd6Xj0p2uiq0PPqsnXiC
	jGduoZXTM88JzAzzyXDPNECVr+N6UJ6vIF1vlruAK9NAU2yN+sOcw19+/zpRzcg+19TSCqWpRYU
	TM8+bBpJJSOLTOJTyOt+YXaJZxqCjQc4FcQmz6j3GTMmfRmpUnrp1SdiCt0YX96SkK+Hid1k05Z
	BiUSDYvabAYzJjZayjLj2P5op2hE2ISXFmKFKUIgiSqtZU2iDmT8aDc1f7U=
X-Received: by 2002:a17:907:1ca4:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-acec6a4958dmr218813966b.17.1745917223563;
        Tue, 29 Apr 2025 02:00:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkmrc9oaifrsbfBdKoTCsdQffffsFtg2dW8YPIfDy01PUM4CZM4fNcXpfPUjcXmTBPdpHaIA==
X-Received: by 2002:a17:907:1ca4:b0:ac7:b1eb:8283 with SMTP id a640c23a62f3a-acec6a4958dmr218810366b.17.1745917223187;
        Tue, 29 Apr 2025 02:00:23 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897? ([2a0d:3344:2726:1910:4ca0:1e29:d7a3:b897])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6edb1cbfsm741676566b.181.2025.04.29.02.00.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 02:00:22 -0700 (PDT)
Message-ID: <be2ae666-a891-4dee-8791-3773331ce7d7@redhat.com>
Date: Tue, 29 Apr 2025 11:00:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v9 02/13] net: pse-pd: Add support for reporting
 events
To: Kory Maincent <kory.maincent@bootlin.com>, Andrew Lunn <andrew@lunn.ch>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Donald Hunter <donald.hunter@gmail.com>, Rob Herring <robh@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org, Kyle Swenson <kyle.swenson@est.tech>,
 Dent Project <dentproject@linuxfoundation.org>, kernel@pengutronix.de,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250422-feature_poe_port_prio-v9-0-417fc007572d@bootlin.com>
 <20250422-feature_poe_port_prio-v9-2-417fc007572d@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250422-feature_poe_port_prio-v9-2-417fc007572d@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/22/25 4:56 PM, Kory Maincent wrote:
> +/**
> + * pse_control_find_phy_by_id - Find PHY attached to the pse control id
> + * @pcdev: a pointer to the PSE
> + * @id: index of the PSE control
> + *
> + * Return: PHY device pointer or NULL
> + */
> +static struct phy_device *
> +pse_control_find_phy_by_id(struct pse_controller_dev *pcdev, int id)
> +{
> +	struct pse_control *psec;
> +
> +	mutex_lock(&pse_list_mutex);
> +	list_for_each_entry(psec, &pcdev->pse_control_head, list) {
> +		if (psec->id == id) {
> +			mutex_unlock(&pse_list_mutex);

AFAICS at this point 'psec' could be freed and the next statement could
cause UaF.

It looks like you should acquire a reference to the pse control?

/P

