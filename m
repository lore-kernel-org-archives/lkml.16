Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78D522DFAA
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 09:36:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746178576; cv=none; b=juFc3xt9QfjSEioY4m8DGrL0n0+cGQXlTHZBJUkVvKp8WUpktKgpKEAyte8HhbFWcw+mJSB11DPygPKFU3/eKdUNNJepVpXFdWYmNs+1VgkGSf93EgwszL0rY+x4B07Rpb16DKmyy+YwwxBWfh15lxV9g2u/WHl5QEKsD4kCYEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746178576; c=relaxed/simple;
	bh=vFsVQUTj2yb44ntEUE8JcLzx/cpijuHnNuRryKG5cBg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=S0HjZxdM2hZH7Q/Zjs8N9Q8IbY4BIKCAmjyWCSx9b/Ymr0qj/U7eNNpMFvPXnSSGUKENno3qpz0Rzo2TfLIHYQAoKK83+VWZYKYCWh82GVYj1ff+U5qChpjUdgVUSibjJoaga8hbO7j9j5u0HsKkEbYoJtSed0qxpdl3D2g+jto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=c92u7su+; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="c92u7su+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746178573;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=WWTw7pNXRDks/MuZkLKqjdXze6dSrLx8y9jmBqbj14s=;
	b=c92u7su+P2ujMo5leG+wBGj23A0thNH9YrEGs6c52k3l6Q2PaAQmxOmfLR35ctVo/w298C
	QbErjxIATAt0Fxfjnby+R8061hu6wpoXtUd/LFmbXIJJg909VSjsiyJaViIHpHKIYpww6u
	abdh0bsYx6wBsITv4hLdsiK3KerRQFQ=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-Ngt3jDlAMgO_KKwtihimzg-1; Fri, 02 May 2025 05:36:12 -0400
X-MC-Unique: Ngt3jDlAMgO_KKwtihimzg-1
X-Mimecast-MFC-AGG-ID: Ngt3jDlAMgO_KKwtihimzg_1746178571
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-39d917b105bso858807f8f.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 02:36:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746178571; x=1746783371;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WWTw7pNXRDks/MuZkLKqjdXze6dSrLx8y9jmBqbj14s=;
        b=I6lbzjFRZwm23UBnTMN1bGr0sQzup/9sV4bEF1jyA8kisUpFKi/io71+2mLn+XIlgJ
         PWaCkn6TCGsPLk+5I/y8HQX+y34zlmN5/QZ79Z1llHmZLuLKpJei2UwJSwF/IPOf1kQ1
         nncO0+hMKNAwdodkyqpkfcks9+sJs0nG/SRkmeQ27GK++gmHtVB0AhTxiZOreplJ5BVI
         Z0NnoM8xZJo3pUlCtUapSJqHsIHuo5t9eL+NwACEgBr51JLvWUyk60wBakyNEJd/VA1G
         ltCnJWVt+2tETgbvrb1IrxHTmTBTQv+5VedMPytVQ269zMShwEJ9AzfhE9zgRT62ibiP
         pUyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWISQA4GTp9tXAEOeLwITa+5RqxJmbulsSaMerUH3VQFz4qBhQdK5vzQ5Y3/V+HIlSv6tUzVYZY64np/VQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOW1DLcepIB1L4I2OIZ9xaLZrqDq9lye50jkp2N6CKORNsUh1L
	Fqm0QKgqDbZWk+jl0CM7jdCK4ADtzl4AK82uYOU90sQe3MCAHBuDCVWdUf5eVmjKehNBJKAkReH
	tX362j1+hjkQoXHDlxV1Rs4DNyC+uEnNN4HTzaJ+n20Z31ZKmKJsw12jTitLXIg==
X-Gm-Gg: ASbGncveC9zr59P7qavHI970Kd2gVY6A0ZrOVJ6ddjFuQUNO6oQf4i5v5pNj5jBPOV3
	aFDhieVTuBbbxSRMeMiB6kChWRor6Kd7+9dAP8H8Pdk/hU8iHoObVcFFilW2i0ZYoGHaZfmmfkV
	WmiN3yVcmf1Bz/N4HcpK4Kzs9287OeJQr3ahP58tuYJVuDwWV/Gs8XNhBRZ20p1xbqPjeGP3aqG
	e8Js70/GssUfup+g+qKrjTgo1YZ8srSxFF1NxywBUhjXrcd2N64dQSdqofdhYT8BwVZfbLqQEWF
	YUVOqLIVMBaN5kWd6m4=
X-Received: by 2002:a05:6000:1886:b0:391:255a:748b with SMTP id ffacd0b85a97d-3a099aea72cmr1586966f8f.39.1746178571196;
        Fri, 02 May 2025 02:36:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCIdXWEiXucO9+sBZc5/SHhLuuo4WE9rBFdn7HDSu2GwCU4mTDBGR2NTUvJ2POGImX3CwJLA==
X-Received: by 2002:a05:6000:1886:b0:391:255a:748b with SMTP id ffacd0b85a97d-3a099aea72cmr1586949f8f.39.1746178570821;
        Fri, 02 May 2025 02:36:10 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:246d:aa10::f39? ([2a0d:3344:246d:aa10::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae3528sm1656952f8f.30.2025.05.02.02.36.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 02:36:10 -0700 (PDT)
Message-ID: <5c42675c-5143-43dc-94cd-701711ff5fa6@redhat.com>
Date: Fri, 2 May 2025 11:36:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7 08/12] net: usb: lan78xx: Convert to PHYLINK
 for improved PHY and MAC management
To: Oleksij Rempel <o.rempel@pengutronix.de>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Woojung Huh <woojung.huh@microchip.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Thangaraj Samynathan <Thangaraj.S@microchip.com>,
 Rengarajan Sundararajan <Rengarajan.S@microchip.com>
Cc: kernel@pengutronix.de, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, UNGLinuxDriver@microchip.com,
 Phil Elwell <phil@raspberrypi.org>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Simon Horman <horms@kernel.org>
References: <20250428130542.3879769-1-o.rempel@pengutronix.de>
 <20250428130542.3879769-9-o.rempel@pengutronix.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250428130542.3879769-9-o.rempel@pengutronix.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/28/25 3:05 PM, Oleksij Rempel wrote:
[...]
> @@ -2619,28 +2530,100 @@ static int lan78xx_configure_flowcontrol(struct lan78xx_net *dev,
>  	return lan78xx_write_reg(dev, FLOW, flow);
>  }
>  
> +static void lan78xx_mac_link_up(struct phylink_config *config,
> +				struct phy_device *phy,
> +				unsigned int mode, phy_interface_t interface,
> +				int speed, int duplex,
> +				bool tx_pause, bool rx_pause)
> +{
> +	struct net_device *net = to_net_dev(config->dev);
> +	struct lan78xx_net *dev = netdev_priv(net);
> +	u32 mac_cr = 0;
> +	int ret;
> +
> +	switch (speed) {
> +	case SPEED_1000:
> +		mac_cr |= MAC_CR_SPEED_1000_;
> +		break;
> +	case SPEED_100:
> +		mac_cr |= MAC_CR_SPEED_100_;
> +		break;
> +	case SPEED_10:
> +		mac_cr |= MAC_CR_SPEED_10_;
> +		break;
> +	default:
> +		netdev_err(dev->net, "Unsupported speed %d\n", speed);
> +		return;
> +	}
> +
> +	if (duplex == DUPLEX_FULL)
> +		mac_cr |= MAC_CR_FULL_DUPLEX_;
> +
> +	/* make sure TXEN and RXEN are disabled before reconfiguring MAC */
> +	ret = lan78xx_update_reg(dev, MAC_CR, MAC_CR_SPEED_MASK_ |
> +				 MAC_CR_FULL_DUPLEX_ | MAC_CR_EEE_EN_, mac_cr);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	ret = lan78xx_configure_flowcontrol(dev, tx_pause, rx_pause);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	ret = lan78xx_configure_usb(dev, speed);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	lan78xx_rx_urb_submit_all(dev);
> +
> +	ret = lan78xx_flush_rx_fifo(dev);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	ret = lan78xx_flush_tx_fifo(dev);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	ret = lan78xx_start_tx_path(dev);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	ret = lan78xx_start_rx_path(dev);
> +	if (ret < 0)
> +		goto link_up_fail;
> +
> +	return;

Minor nit: a blank line here would make IMHO the code more readable.

> +link_up_fail:
> +	netdev_err(dev->net, "Failed to set MAC up with error %pe\n",
> +		   ERR_PTR(ret));
> +}

[...]
>  static int lan78xx_phy_init(struct lan78xx_net *dev)
>  {
> -	__ETHTOOL_DECLARE_LINK_MODE_MASK(fc) = { 0, };
> -	int ret;
> -	u32 mii_adv;
>  	struct phy_device *phydev;
> +	int ret;
>  
>  	phydev = lan78xx_get_phy(dev);
> +	/* phydev can be NULL if no PHY is found and the chip is LAN7801,
> +	 * which will use a fixed link later.
> +	 * If an  error occurs, return the error code immediately.
> +	 */
>  	if (IS_ERR(phydev))
>  		return PTR_ERR(phydev);
>  
> +	ret = lan78xx_phylink_setup(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	/* If no PHY is found, set up a fixed link. It is very specific to
> +	 * the LAN7801 and is used in special cases like EVB-KSZ9897-1 where
> +	 * LAN7801 acts as a USB-to-Ethernet interface to a switch without
> +	 * a visible PHY.
> +	 */
> +	if (!phydev) {
> +		ret = lan78xx_set_fixed_link(dev);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	ret = lan78xx_mac_prepare_for_phy(dev);
>  	if (ret < 0)
> -		goto free_phy;
> +		return ret;

lan78xx_phy_init() now does not perform any cleanup on error forcing the
caller to do the phy cleanup when lan78xx_phy_init() fails, which is
imho cunter-intuitive.

> @@ -3449,31 +3435,9 @@ static int lan78xx_open(struct net_device *net)
>  		}
>  	}
>  
> -	ret = lan78xx_flush_rx_fifo(dev);
> -	if (ret < 0)
> -		goto done;
> -	ret = lan78xx_flush_tx_fifo(dev);
> -	if (ret < 0)
> -		goto done;
> -
> -	ret = lan78xx_start_tx_path(dev);
> -	if (ret < 0)
> -		goto done;
> -	ret = lan78xx_start_rx_path(dev);
> -	if (ret < 0)
> -		goto done;
> -
> -	lan78xx_init_stats(dev);
> -
> -	set_bit(EVENT_DEV_OPEN, &dev->flags);
> +	phylink_start(dev->phylink);
>  
>  	netif_start_queue(net);

I guess this should be called after lan78xx_start_tx_path(), which is
not guarateed anymore after this patch

/P

