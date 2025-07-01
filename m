Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72E6E27B4EB
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 15:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385531; cv=none; b=fj/a+B+dLlBlup/j6CVjBmvjn3HWCQjhYzq/sMaa58x1klhBzHi8GamL5RGhThKGIVMD4pTJ55pZz3MAVp73aAlB2nI9p+2xhWMHoUUPIXJSS0mczpkx9EFOKdGfqjPXjnQzTbEFDwguwiOL2YGpEzOZrp8y3CNdn6t3eaeEk/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385531; c=relaxed/simple;
	bh=QSAY2cavr+hAtXa06F5WuFx/c09q1MQ9F8YFB1GGlxA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IiUQMDMOLhUCDg/yb2zUNGwBV3MLvHVJjSRH6YAjv+ZlSGlyyZLccLWrWZG1WXlS7/wF20uB5NXUA5kSiw05yq7bM5BLkwMgcO0spHhl6c6rldEO9PRCpMNz9aj7OEBvK/eOeuy4FcBKevB656l8imFOnzy+RpcIjfRrD8XGAbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=NyELBZvB; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="NyELBZvB"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4eed70f24so789661f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 08:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751385527; x=1751990327; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YhrekkuV81u85I0nCYoyFYWO/iQISbDoWTniOveqI+w=;
        b=NyELBZvBrHycyMWM1vTcTDddjbbJVdm+b9HYHFBktbGVHdgTePCtzZDjdWdV0Ah/vP
         Q8fesE9oqpdkA7Ji74z/t90QaVhzuWwBGuSIlckEazZAcDawlnZ8nC0LZh/g9PClw9tp
         RwQzM4D0qJc4X9jXzBDRTPdqjhcG/2u6YqrIDJjDTLqoUWRT3uyIMHZaVw+D1ZCdH698
         loQPti7htEhOEY+VlDX23yS0LPjzApS110pi5jw/PYUkCcYoQLF4NDwaX8BI3jFQg0uq
         u4n4rQ5XyXSJb+foXeXFBZEUNVQcIC6yLUlitTaQExoahg2msvRohSdiUkxrT59GeSMt
         iMwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385527; x=1751990327;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YhrekkuV81u85I0nCYoyFYWO/iQISbDoWTniOveqI+w=;
        b=abR2v2BZIy92M76f9AfQ+YTrIkYrXmfOJWUaFV0cMCcHtDw1GTaGdoW+E/8sbqkO37
         OxKcnnJ0HerzvdINXgmVdndEJ3uZTeLbGziDr1EaqjXeD0Ln8ZgPHSZfwHFzHJZpMj7f
         /3vDoz021BkMCvhfFrWFcvpprjA+cvXVVuFhvF8CAiT2A9qAxsS3a0wNDwynsB1KPU42
         3IVUTa9YZ3hAFOy20EDplOMKDbmAqpXqdKp6ADQKSs0JG8jewFA/PX+ugANqcYNXVPKX
         zeXEUy5qXNMZZgyQJdZl8fK/K1zJ064uzxF3/DwzhGtXh/oCswXQo5nukUAgcybpP9BC
         XEUA==
X-Forwarded-Encrypted: i=1; AJvYcCVZaHLMEVDXX2U5qtFmoBXgwTzWoE14cpVg2WAZMvN8leOoFXhDfx7H3FXzkgFrXOdTKEL3J+MlInmvwZE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywru2oahDP3RVGpAwmFH5L8Vi5kWtX0eypbBzoy19Tbe/dUNZwK
	bAgUUIHBjjbA0ByNTm7HNF+AfhRrxGVKL7/mpM/hP082Fdt/5bK5jtbMLBWxXuSUDNc=
X-Gm-Gg: ASbGncsWGwhMTlQhxptzh7bNstq1RGjDiazw/wUHgv8jCWuFkZ0QiI/GKBmDt5ROARM
	qP26fvYj47qCGmbTCZfZ9Q4fVh1B+JQ86xH3pIUPAPeEjKWCEuf+RIGlBaojvz4z7q4g7+b81Mw
	P2MYGmIwfQZGmH5bDaDp+fvfuckeBDfmkpttKQza6fG1tUb7SH9+MAM+esa2UcVDbN5pWVXe3Fn
	IpczOCb1qQIG3Fp1ADnEIo2QCXS7D6rDMCV/m4XhAh0RE/bXkoChl0urK4orkHqOemTgo/nDA5K
	vZS/zOk3fbJb4314LL8advYFp/ZIplV6qRQf1fa9jq4C1wOA3dvu89aZPjkMCYpMDnaBSJFyXrg
	58Ng2QQmVRKz8Ei4IknpKpU4C7m/sD9HUK+OH
X-Google-Smtp-Source: AGHT+IEgqW2tesitKhmnUcBygNXVUscrvykBlr5WbS8x1oTHDseSXjU/Z8mwQaDABjFVm8GOa4CGSA==
X-Received: by 2002:a05:6000:18a9:b0:3a4:f912:86af with SMTP id ffacd0b85a97d-3af23ad08d1mr1306061f8f.2.1751385526598;
        Tue, 01 Jul 2025 08:58:46 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:3c4c:7e68:5ff:ce49? ([2a01:e0a:b41:c160:3c4c:7e68:5ff:ce49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538233c523sm198939125e9.6.2025.07.01.08.58.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Jul 2025 08:58:45 -0700 (PDT)
Message-ID: <40dffba2-6dbd-442d-ba02-3803f305acb3@6wind.com>
Date: Tue, 1 Jul 2025 17:58:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH v2] ipv6: add `force_forwarding` sysctl to enable
 per-interface forwarding
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250701140423.487411-1-g.goller@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250701140423.487411-1-g.goller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 01/07/2025 à 16:04, Gabriel Goller a écrit :
> It is currently impossible to enable ipv6 forwarding on a per-interface
> basis like in ipv4. To enable forwarding on an ipv6 interface we need to
> enable it on all interfaces and disable it on the other interfaces using
> a netfilter rule. This is especially cumbersome if you have lots of
> interface and only want to enable forwarding on a few. According to the
> sysctl docs [0] the `net.ipv6.conf.all.forwarding` enables forwarding
> for all interfaces, while the interface-specific
> `net.ipv6.conf.<interface>.forwarding` configures the interface
> Host/Router configuration.
> 
> Introduce a new sysctl flag `force_forwarding`, which can be set on every
> interface. The ip6_forwarding function will then check if the global
> forwarding flag OR the force_forwarding flag is active and forward the
> packet.
> 
> To preserver backwards-compatibility reset the flag (global and on all
> interfaces) to 0 if the net.ipv6.conf.all.forwarding flag is set to 0.
> 
> [0]: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> ---

[snip]

> @@ -896,6 +907,16 @@ static int addrconf_fixup_forwarding(const struct ctl_table *table, int *p, int
>  						     NETCONFA_IFINDEX_DEFAULT,
>  						     net->ipv6.devconf_dflt);
>  
> +		/*
> +		 * With the introduction of force_forwarding, we need to be backwards
> +		 * compatible, so that means we need to set the force_forwarding global
> +		 * flag to 0 if the global forwarding flag is set to 0. Below in
> +		 * addrconf_forward_change(), we also set the force_forwarding flag on every
> +		 * interface to 0 if the global forwarding flag is set to 0.
> +		 */
> +		if (newf == 0)
> +			WRITE_ONCE(net->ipv6.devconf_all->force_forwarding, newf);
Hmm, is this true? Configuring the default value only impacts new interfaces.
And before your patch, only the 'all' entry is took into account. In other
words, configuring the default entry today doesn't change the current behavior,
so I don't see the backward compat point.

> +
>  		addrconf_forward_change(net, newf);
>  		if ((!newf) ^ (!old))
>  			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,

[snip]

> +static int addrconf_sysctl_force_forwarding(const struct ctl_table *ctl, int write,
> +					    void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	int *valp = ctl->data;
> +	int ret;
> +	int old, new;
> +
> +	old = *valp;
> +	ret = proc_douintvec(ctl, write, buffer, lenp, ppos);
> +	new = *valp;
Maybe you can limit values to 0 and 1, like it was done in the v1.


Regards,
Nicolas
