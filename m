Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECC21898FB
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 10:03:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744884230; cv=none; b=b/EDDWumG78EWkNFFuXkXxaXSG1j776f/iPXVqSAM8vxwMwqGAjDO7iP7k+pSJprBP8p3kz6GWORilPGQuVdbniT1ldrHUiL+w7lHTd63XYZhnraskVSdMCPK32eMRntOGzG40gN9m5AruNAPflEz1TyMb+32Y28IyDXmY3ss2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744884230; c=relaxed/simple;
	bh=EqCOTsE+QB5UW/VOIVbAS0MuBQ504cjzCxczF0GFvzo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HFuciA3vyiYiAIIO5H5t+SUmh8v6LADXmniH1kYR5vaoKVGDl903Vyi+qHMNTjkyY6AMAfmZ3zgCaudtaIvB9fPuoCyMLlv1S23OeKEUDoGdupFmmNZlH4uLG53uHP+3QZseucJ8lG4YLtrzvAKwukoh6fD+MugRrNQ6su2UsIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HvFhVi72; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HvFhVi72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744884227;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eca6nYlnj6Q/YeQ89T3yXHQz/N/LC2yMQtBQUQX05wA=;
	b=HvFhVi72DLbtRHNT/BGTlac0s0q72vXhOlDTgnqgnG8AJwGX86l53pE3cpRSJyyxRviuYP
	tTFo2R2PWe/3Gj/BcjjVkayDQbFMl5s9FvmJkI5cTc5L0bOe/0eU95Z1RDMXnzfpmy86io
	TwgZAgzjMgvT2OIhMyI0a5DNcPOrLEk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-208-_r0oHuSuOrK4fmilppx4Zw-1; Thu, 17 Apr 2025 06:03:46 -0400
X-MC-Unique: _r0oHuSuOrK4fmilppx4Zw-1
X-Mimecast-MFC-AGG-ID: _r0oHuSuOrK4fmilppx4Zw_1744884226
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39979ad285bso304357f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 03:03:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744884225; x=1745489025;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eca6nYlnj6Q/YeQ89T3yXHQz/N/LC2yMQtBQUQX05wA=;
        b=kl0hyk2y/ZmmXC96VyAxoVml/m+cA3G3djYGVRah8AfrzZbpIkYN1epCXFqpf1ahnk
         C16U8Xs3RF+Jus5DEFS0XCc1+2k+VPtLzDA12rLkP1mYUdQpEKZz73F5DB9b2SDaRDfF
         l+PCbu/UgZlLT7h7rD1jeAfxs9jrxWNXSw0wrabn3MMBEwlOnEzcM1lGIN9TlStL/sFz
         JWYSMXb39u+1LLDZs8LpCHHMkngDyy1xr8GZYuvWvcCIwP2m2wJJFG1y+TMyOpjZ6yDo
         0dVwPweJa/5BvrlNn5T0nQ+I3kuLVr3NzVSza4Z4HUl8o0K0+b8TKllOtZxir0v4GFSv
         14rg==
X-Forwarded-Encrypted: i=1; AJvYcCVxogx/Xp7xI37AOVrRCk8i2MCY1o8ZVK9yokaZVqtRgXNf3Ho5KsPvTmCY/ndlE37ME6HufShQ1ksLVl4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2LXAnVV5IkhmFvWwOCIUnaj7W0873Jm7reTdMGVlL+JecKgvz
	miP5sAOg39Z2s7lE/ulFm5vRLJ27HdRELWWUS7Ui2oImjz2Isfqndx5AguuhC0vGYT9pZHJHG/g
	e9TD6ObyF8X72LRdDiX6WfvgBa0pP4V+AZFwyZlHrYWC72E1IvnFZPNLabtt6Iw==
X-Gm-Gg: ASbGncsn4NPOR3k2bsau6mJDwC/WDiZuR7d4dPgXFlgiyAH3+cpfwBg0I4r6Mf9/f1F
	3n9aMolqZKl5s074xnAPR6lYir734/6yS3ouCiLic65MxlA1cTQnqsnQbccDQAQ2IQ15eTX3NLU
	JnAHZbejJBb8RKyfl8lSLmutEpolx81qDqLs6vKm8hb7G5MGirKXxuVnbQKAjmIX9leiKYGkScv
	p24T6Ko03ty7G4LQmJE/BiO7xMKcZDkK8y67cC3QIXekY1zEMfV21nHprOeGiIp1mOM64lEx8Hz
	ZI3txgTm09stN4RYXzI47HUvb2OSNxuZI4iUS99sMQ==
X-Received: by 2002:a5d:5f54:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39ee5b8b7e1mr4746216f8f.40.1744884225625;
        Thu, 17 Apr 2025 03:03:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWbMd5UZNS52cZp1/RVD9DV2YcByv7qTywhU//hbfm0mgjXhAdZwTqwRIUercg2jPhhkOtQA==
X-Received: by 2002:a5d:5f54:0:b0:391:1218:d5f7 with SMTP id ffacd0b85a97d-39ee5b8b7e1mr4746191f8f.40.1744884225284;
        Thu, 17 Apr 2025 03:03:45 -0700 (PDT)
Received: from [192.168.88.253] (146-241-55-253.dyn.eolo.it. [146.241.55.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eaf43cceesm19733949f8f.73.2025.04.17.03.03.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Apr 2025 03:03:44 -0700 (PDT)
Message-ID: <564ca4ac-661e-4126-a65a-106d3c28a47e@redhat.com>
Date: Thu, 17 Apr 2025 12:03:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v6 1/2] net: ethtool: Introduce per-PHY DUMP
 operations
To: Maxime Chevallier <maxime.chevallier@bootlin.com>, davem@davemloft.net,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 thomas.petazzoni@bootlin.com, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Russell King
 <linux@armlinux.org.uk>, Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 Oleksij Rempel <o.rempel@pengutronix.de>, Simon Horman <horms@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Piergiorgio Beruto <piergiorgio.beruto@gmail.com>
References: <20250415085155.132963-1-maxime.chevallier@bootlin.com>
 <20250415085155.132963-2-maxime.chevallier@bootlin.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250415085155.132963-2-maxime.chevallier@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/15/25 10:51 AM, Maxime Chevallier wrote:
> +static int ethnl_perphy_dump_all_dev(struct sk_buff *skb,
> +				     struct ethnl_perphy_dump_ctx *ctx,
> +				     const struct genl_info *info)
> +{
> +	struct ethnl_dump_ctx *ethnl_ctx = &ctx->ethnl_ctx;
> +	struct net *net = sock_net(skb->sk);
> +	struct net_device *dev;
> +	int ret = 0;
> +
> +	rcu_read_lock();
> +	for_each_netdev_dump(net, dev, ethnl_ctx->pos_ifindex) {
> +		dev_hold(dev);

Minor nit: please use netdev_hold() instead.

Thanks,

Paolo

