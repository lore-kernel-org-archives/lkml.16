Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1C06F06B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:37:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750772241; cv=none; b=ln4cy9WDkptRug8M5LDZoG9/+WMpG+566MYVmkXmOIcGufGeO7AJt7Xs8YYzK/EITsKbkGNzVXjPB9JO+3X61o8xfStGiOi439Rzy/yK8OYxiOU7Rh7tyFiPcRJJ98DwAubvBE+XYgOuOezGcNwA1VmO3iUdymTZXFS5PZ4yhvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750772241; c=relaxed/simple;
	bh=w/IDMkNJyCUUzyRjdmPql/8lwhxsnPEA40uW7VzKY3k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BbMxRGriI75IZayS8slayQi2SrtDdq2JfANFdDK82OlDtufMCI0CCZoOalo6LtWqh/r7cpRV5KRfriUxo9Ndj9mRqQ2Rcbc+dcMU/2kDzY0XJ+QdlPZ6xAdSfcE++stLZWl8t88PTspHRAGwR2odoHqw/jkvBWDXFjZu8RN7nbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CZwLVjHV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CZwLVjHV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1750772239;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=;
	b=CZwLVjHVxraU7h8CzE7F4dY+qYxZjBlszzfB2qNF8T7B5NH3cDWAwgmtvgng43I4APshJR
	93obTMNXzv64NccZ/+d1OyhW+NrfDcuyrZtTmzUt1DUluG0H0W1Pm+cg6Fby5rv17qZu5m
	6sOhi5UPy+JTI3voewjoeg1gAGclF+Y=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-657-NJvrYqVrM2O3Auax8Wp9ww-1; Tue, 24 Jun 2025 09:37:17 -0400
X-MC-Unique: NJvrYqVrM2O3Auax8Wp9ww-1
X-Mimecast-MFC-AGG-ID: NJvrYqVrM2O3Auax8Wp9ww_1750772236
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45311704d1fso34498205e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 06:37:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772236; x=1751377036;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kdLNi82PU1S92ENBnDfDaMCmZjF6GA2bHRYIMCa5Xtg=;
        b=Oiq24XV6qSDRnKSeb66OOl96culem08Zo16iuz566/0PnuEDcoMK8qdNLYB7BypzaB
         R4PUciMrabrGvguae8Ss485yAJTKdeXGIwcsFn8mju7oOPahjJIKapm16siM9TgNAFwR
         wp7+tfk+kqizpIvRfIOsK53wZekJ/BSgv9VeC9clwMLHTfMDUx0pUUUuCgQM02Lzt2jb
         t0NX9f075owMaw1OqcOpSeiymW0gP7VLENB2ag4hQyx3uZg+53b6gLk4OCT+tCGMKmM8
         h/QMOrkAIXwvIJE9Nb7eqGwvWGr5DQyRmQCDYxjeR0RneZTZoBxeor0/EYx8VJPi6lEe
         m0fw==
X-Forwarded-Encrypted: i=1; AJvYcCX+JRsEfwhvcbxD/5/N6tSJp096QqxzpJE+BYC1wGWsRQsTedisTdcA2Mutbdv6xcv2BKKw9s6Jfuy57fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0A5XdRCn0igIwacY+QK+GonKfND7pL1abxS2TdI9Ho2DQh4dM
	62OwK9EiaR8LqtIrfcZg817+XEGo9iEzk6j3QPHLskDMI9tmWaUuYVvEvLC3w71V6eFyp+d6awF
	KIaqVMeE7gLP0fZIL0AwPjumEvBNUsMgqwskJePDLp2qJdBYUzuZk0L/DVHhe+gmhXQ==
X-Gm-Gg: ASbGncvuNuKhxb8lhcKzCNeOoHourcXAzDiwCrgBAU8aW74tEPc/AvnyysPKHJ5psJp
	54blwU5D51CElNnbEjfjoclXpUTcLOL4+3VVrfwNHGblba1cOfGQixBao2xzhj9TdzuuakhxY5D
	4mTBdQxP7QUyTMkYBtPIweVFuEoC+FSiGEWedL+el84HtscTKRYSP5XMdtGlUjsgxn60C+7Ri9a
	2RsLw5us+HrIC0cWav80NGbzfQ7tWVV348qsjqwpqk3F9op+o6pHKDGD0ffUSMQvmHEuyQKZvyG
	oDnw3zOzJenax/ENPGYnkCvtxrFV9w==
X-Received: by 2002:a05:600c:8b67:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-453659c9b5cmr178056645e9.10.1750772236039;
        Tue, 24 Jun 2025 06:37:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCDctwjBQaSlAXYgDwmWAr33weRLLnC8b8hgrnzKmiQvzZklRmZK8SJHQ3VS2Chx7RMg6ong==
X-Received: by 2002:a05:600c:8b67:b0:453:6ca:16a6 with SMTP id 5b1f17b1804b1-453659c9b5cmr178056295e9.10.1750772235622;
        Tue, 24 Jun 2025 06:37:15 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:2445:d510::f39? ([2a0d:3344:2445:d510::f39])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453646fd589sm142741035e9.26.2025.06.24.06.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 06:37:15 -0700 (PDT)
Message-ID: <17f789c6-cf64-4940-ac7b-0107b7b96031@redhat.com>
Date: Tue, 24 Jun 2025 15:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [net-next v13 04/11] net: mtip: The L2 switch driver for imx287
To: Lukasz Majewski <lukma@denx.de>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Stefan Wahren <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew@lunn.ch>
References: <20250622093756.2895000-1-lukma@denx.de>
 <20250622093756.2895000-5-lukma@denx.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250622093756.2895000-5-lukma@denx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/22/25 11:37 AM, Lukasz Majewski wrote:
> +static void mtip_adjust_link(struct net_device *dev)
> +{
> +	struct mtip_ndev_priv *priv = netdev_priv(dev);
> +	struct switch_enet_private *fep = priv->fep;
> +	struct phy_device *phy_dev;
> +	int status_change = 0, idx;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&fep->hw_lock, flags);

The above kind of lock look incorrect. In later patch you use
spin_lock_bh(), and the context here is never irq.

Should be spin_lock_bh()

/P

