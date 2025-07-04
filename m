Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C500302CB9
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751616450; cv=none; b=B1E90PNkba30V7AVqdOKz1WJSjhKDtMoo3uyp7MpUPnEk+JoZCLtYjKmdTryrkoIA2jIz7gtvzf+Fx9IdX8cU9PYyywTS4gr9c1X16LMw1oz68dnKoU9JPvRhS+BcsfV7FA15/QWLiwh6WUsuOnu7W2jT0cligyYbazX3juUWMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751616450; c=relaxed/simple;
	bh=1eBuMV7zUvgYp+Jj+PhCixLDDt2JcUjDRStB4ZXGl+I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CGSRoBz09V1AyNgPZS4gswmNmXZjESvVLBbfCjKXUSs+PaBr6SwXGle1vRgrLgSCwvR2MtbZKWswHDbGOR02A7+4CSPfdEQWOuVbPWCTqe2B+qPqF3rwAm0cYGBc4nL0J2sUBBHS4C2IfrBBtP9hldx49i7g88HPBIPAi9AkdH8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=AlPchl/o; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="AlPchl/o"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a4e62619afso98481f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1751616445; x=1752221245; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YahY59i4thK0MbaLm0aeNNACEbj0hyyZrO3XNw7pxsg=;
        b=AlPchl/oF0LsBV1CCvgRwVSXrS3+NtZyAfVaDuVj2pGChw+gSIrJnLecNZ0aoYsE3D
         h9ExPuAWMco9k+Aoma0Wv7hzfgJwz1gVUrgKd3+SqB/yHaknWBEvHq3DnR2a+lDkic7s
         dC7WctkdldbEp5GQiKL9FXZ3zwC+JyIdK/4LMDKR/Ff+r3K4uuhumzuRELVDtqUkIL7H
         1vQmUPuybk+WfwwsjFVGNFCU4MEQQbxsrePIJnYvvaqPR+480soQK2jEzl9G0cLkIAAE
         XsXWDyxIVs9S67oyYgeg2hjZ0B+D7eSVgAlzqUaguIrCI2wL7EIbAtNmdUjHyYm1vEHP
         7ByQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751616445; x=1752221245;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YahY59i4thK0MbaLm0aeNNACEbj0hyyZrO3XNw7pxsg=;
        b=asGtRLEzSBq4bUWChWJ83GUkl8jKI2mFMGT1+VVs4m+CabUzq7NgO7bB0aOCDsIfdw
         P04Tvxkrt8HjXBrwMiMm0/2YsYZSEkLF/N50Qhrj1DGrWlgPB7IfalV75jLF1PQ0rW89
         eUJLo4Qwzm9Io+MyP/dDzAhvFHrq59IoyluP2ERwZk6v+la294z63h4ihJAgDfoUmj5p
         bBgfgQw/9XctU/gNjtl9Mik3pZjSB9klndQ9jMiITtVp6+j38m/4/2jCcutvb7caGx/Z
         6pA1I2oTcRiGpzVqkgPRM0xk8etwkDJM3Yc9wl4mkz/Whth6pmrbj4GmvaupJ3QKvP+P
         QgbQ==
X-Forwarded-Encrypted: i=1; AJvYcCWRUGjOAXDNdm9LDxk6m5daBZH5q43prxNpbd9kKeG991Up2y7RNf2HULuilKuc4lIIhcmF0RsNdKHSA1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYaEkFQ03h0Wlyc2ck3Vbby0kk+MMtyXsbKsUbpylq0IENlxPv
	HmDawQoYFhRshRLt/rdaLbv8NIZ/oNllU8sApnQUzfjLXxp4VbjYs9KPZ8S3r1TlgIY=
X-Gm-Gg: ASbGncsJtquCp8IvB/C9XpHre7ovVX9M67y8ivYoNMQSzsHUdLHERMQ5iBV7YeUjU3V
	HK+opicul9fi3X7zTpXZ4R8y0DEzQZfZJHJu7Bd/ctSiHXpLURCGBT8t6Nv892YULAmYySYUk9O
	1e9JJiqh/4FaFoJ3LFN9nWwV0wN1RVIe88cn2sg0EChcWGsOpi07J9dQB250BFWGcpC1bVkCkIo
	hHUvjcJctbo0raHWqvoEB55iE0Qor0k2upZC13GD+1e9bEbFcs23rIiqTTJehxk3ElcIK+dCrrL
	O030klVl729XF3XTCTblV+E6skhid5Y8e8FULbC5TRL4IuCs/SbaRHZhmN3fQyDLpc3rftnia9O
	GigXWbLj6v/Er4QTpgsOKgxM4pwjfxzIOcHVl/+5tj/wgXl3tBw==
X-Google-Smtp-Source: AGHT+IGvUqPJX2/oHRKeJh/R8BYxlgLvHF4L6wym82Yd1DLkPZ1EOKWB3QM//ysJ2Jz9iHdPHU3s2w==
X-Received: by 2002:a05:6000:2d07:b0:3a5:8b43:2c19 with SMTP id ffacd0b85a97d-3b4964fdc81mr281711f8f.4.1751616445437;
        Fri, 04 Jul 2025 01:07:25 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:b41:c160:33aa:1948:72fc:be83? ([2a01:e0a:b41:c160:33aa:1948:72fc:be83])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9be5bbfsm47515335e9.34.2025.07.04.01.07.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 01:07:24 -0700 (PDT)
Message-ID: <d90c29af-d614-43ea-8bcd-f2c8ced779df@6wind.com>
Date: Fri, 4 Jul 2025 10:07:24 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net-next v4] ipv6: add `force_forwarding` sysctl to enable
 per-interface forwarding
To: Gabriel Goller <g.goller@proxmox.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 David Ahern <dsahern@kernel.org>, Shuah Khan <shuah@kernel.org>
Cc: netdev@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20250703160154.560239-1-g.goller@proxmox.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20250703160154.560239-1-g.goller@proxmox.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 03/07/2025 à 18:01, Gabriel Goller a écrit :
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
> To preserver backwards-compatibility reset the flag (on all interfaces)
> to 0 if the net.ipv6.conf.all.forwarding flag is set to 0.
> 
> Add a short selftest that checks if a packet gets forwarded with and
> without `force_forwarding`.
> 
> [0]: https://www.kernel.org/doc/Documentation/networking/ip-sysctl.txt
> 
> Signed-off-by: Gabriel Goller <g.goller@proxmox.com>
> ---
> 

[snip]

> @@ -6747,6 +6759,78 @@ static int addrconf_sysctl_disable_policy(const struct ctl_table *ctl, int write
>  	return ret;
>  }
>  
> +static void addrconf_force_forward_change(struct net *net, __s32 newf)
> +{
> +	ASSERT_RTNL();
> +	struct net_device *dev;
> +	struct inet6_dev *idev;
> +

ASSERT_RTNL() is always put after variables declaration.


> +	for_each_netdev(net, dev) {
> +		idev = __in6_dev_get_rtnl_net(dev);
> +		if (idev) {
> +			int changed = (!idev->cnf.force_forwarding) ^ (!newf);
> +
> +			WRITE_ONCE(idev->cnf.force_forwarding, newf);
> +			if (changed) {
> +				inet6_netconf_notify_devconf(dev_net(dev), RTM_NEWNETCONF,
> +							     NETCONFA_FORCE_FORWARDING,
> +							     dev->ifindex, &idev->cnf);
> +			}
> +		}
> +	}
> +}
> +
> +static int addrconf_sysctl_force_forwarding(const struct ctl_table *ctl, int write,
> +					    void *buffer, size_t *lenp, loff_t *ppos)
> +{
> +	struct inet6_dev *idev = ctl->extra1;
> +	struct net *net = ctl->extra2;
> +	int *valp = ctl->data;
> +	loff_t pos = *ppos;
> +	int new_val = *valp;
> +	int old_val = *valp;
> +	int ret;
> +
> +	struct ctl_table tmp_ctl = *ctl;
This declaration should be put with other declarations.

> +
> +	tmp_ctl.extra1 = SYSCTL_ZERO;
> +	tmp_ctl.extra2 = SYSCTL_ONE;
> +	tmp_ctl.data = &new_val;
> +
> +	ret = proc_douintvec_minmax(&tmp_ctl, write, buffer, lenp, ppos);
> +
> +	if (write && old_val != new_val) {
> +		if (!rtnl_net_trylock(net))
> +			return restart_syscall();
> +
> +		if (valp == &net->ipv6.devconf_dflt->force_forwarding) {
> +			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
> +						     NETCONFA_FORCE_FORWARDING,
> +						     NETCONFA_IFINDEX_DEFAULT,
> +						     net->ipv6.devconf_dflt);
> +		} else if (valp == &net->ipv6.devconf_all->force_forwarding) {
> +			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
> +						     NETCONFA_FORCE_FORWARDING,
> +						     NETCONFA_IFINDEX_ALL,
> +						     net->ipv6.devconf_all);
> +
> +			addrconf_force_forward_change(net, new_val);
> +		} else {
> +			inet6_netconf_notify_devconf(net, RTM_NEWNETCONF,
> +						     NETCONFA_FORCE_FORWARDING,
> +						     idev->dev->ifindex,
> +						     &idev->cnf);
> +		}
> +		rtnl_net_unlock(net);
> +	}
> +
> +	if (write)
> +		WRITE_ONCE(*valp, new_val);
Why not putting this in the above block?
And maybe under the rtnl_lock to avoid race if two users change the value at the
same time.

Nicolas
