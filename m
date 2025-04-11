Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD461DDC04
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 08:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744358655; cv=none; b=Gq4jtTvsl54Qc/4hXYHkU12rqIFmzpnJ7CJnvBjNPoImq38DHkmRRfXxqcPwXnDLKpD8POSYcc+LPePy1TrDWK0wGiWPGRgJgZWfDwSl9xy9CxVNsCaMbS8yOJg/wowHOssShdt+Gd+Oa6Y9O7l8TodnvmPx9DGhpzXlo3WAOVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744358655; c=relaxed/simple;
	bh=l2VcdA3YeulrePkCB9vvQsx8l22MvCKUb0C19JBaY5U=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OszY3+JRItSRisPuo0AWCTtNVFvMlzXm2fQCO5UnK5jXg8akw3+F9RRPWvKk/9dDU2p9/sV3vY9C9fozBR3S60oe4vIm+CEXrv68ZGC7vKSs+oYY22sg5UNLCk8uaoGIM14Pj4cSUe/5TLkdXtdve0Gj8TLLVxK2VqlEpaVDRHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net; spf=pass smtp.mailfrom=openvpn.com; dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b=QGebh9SC; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=openvpn.net header.i=@openvpn.net header.b="QGebh9SC"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso1962971f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 01:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1744358652; x=1744963452; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=fRXgc2yeSotpusr+TwNESYUQv74jCMGOVv7hGlcYd3k=;
        b=QGebh9SC2JWyJKZJskrHI8qas/GJHNUQpdJYCtn0IIShZf+w0AtB0FKUzMVck6cD4n
         DrUZL5vehUkSCrT9F6/+iS2Es8tlKk1fW/iK9MCvuQ5gm0SA9w/aUh8yFqGqXmAt4YJ7
         MJnH3fJQIQknZ2wHNL9HWfrWy2gSk/JYkifnN9PyepkLgUo4ThnldEcw00nVMLksAYXx
         morczaQZ4YM28BAS06NJD9YXpkE8iJgYXIVvyQ/iyE4BFRuES9I/I2gAru7BW7S1sT9H
         Lw8rY2V2q9WWnOqXItxZaWe1eVc7YAvN4XVYjsUN05lsyXA7vz+FMzzQvDK2iGNSsFeO
         rF1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744358652; x=1744963452;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fRXgc2yeSotpusr+TwNESYUQv74jCMGOVv7hGlcYd3k=;
        b=mVQLCatjiwJ28HpdJZpzFMJxiXMwT6+2W9lUmQ6OKAjZfa9YTSAvIuBDsgrRizY4zZ
         I33QM44epzd/a7k+2sHtJOeBebYdhAXZwKJbcJtsNmghhcfWOW3LbBFYMSPzWIf2VW+W
         a6Pu8KpFCK1bchQf1s8iyWgmb+Zkcy5/OioSM82Y4yvPjGxJI2eBEQ+DRih69XPlJlfn
         S8G8YGsIrXTBzULOA7vHzIJjG5xLD8eKNnq0q6qkC/WKbIR/+SNoxMurZn/tfBonYggr
         xoEnQmcSOcfMgv0l4fHtEgmT2uvP7bg1Ie0l7aRkZtGS5CegAfU2ovPgRM1XVEhR7LgS
         VnBw==
X-Forwarded-Encrypted: i=1; AJvYcCXOZNmfRVMwUY6n847bCTHaxGA1rxvX3jY4k5Lk+Migt5FnEU4/ih1yHCelm03CgqOcVPCNnRGbnSdBYt8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz2vL0bU08aPMT/Tgul8on73i6suwvDnObyc+lbxkBDGC/hRO2N
	1lPugqflqyBn0NoFIlGc6Om1r77IViaV++hwIrGMvwVpn8vYSB3dUCMGnOeeR4r4PgOWItvRtJ+
	1Ug7LMhiNABTBuwhNAKHvtrm0Mv9BoPtplv2LnlLrV5FaGuzL944gJFQ=
X-Gm-Gg: ASbGnctCgOKfMbuSgO5b/fh2kCnctIMzvpNN0vugdKFdkt5NReWO+w07QASeFju5Wcf
	O43vjGL1GRAVWE1XHDdkUt2aO99sbQj0YCQEFw3BjJfHtQg0M6A9e5XFmqtdzsef06hAh4n43G6
	CfIygaLYhwlWffN7J8902XV4Me1YkVEJ/UjxOVq9umSzR/eXfS4GP3o91J/U2lRHwbWruClSrvc
	KuHBLoPAL+pmh5lsJKxrHCKKq4/9oMMiF9CMmxfTS5YgYyw4fxuj30XVgoDi6us4oFoYwJxgKdh
	sATdVcC95UadWba6ARst4K/xI3BVJ0B2zzXmwbXSvynbhPptxzFFJYfPB6zwAy7BNmELJwFX0zg
	g/Kc=
X-Google-Smtp-Source: AGHT+IENyVLM5p/12g1chaFoiAzlC11eK8uC+Ot8/0ux7IvOoPgK3CJzBt98Vrnsaq3XDTmh9tIEpQ==
X-Received: by 2002:a05:6000:250a:b0:391:39bd:a381 with SMTP id ffacd0b85a97d-39ea521193amr1291092f8f.30.1744358652166;
        Fri, 11 Apr 2025 01:04:12 -0700 (PDT)
Received: from ?IPV6:2001:67c:2fbc:1:e8be:40be:972d:7ee4? ([2001:67c:2fbc:1:e8be:40be:972d:7ee4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae96400dsm1286529f8f.11.2025.04.11.01.04.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Apr 2025 01:04:11 -0700 (PDT)
Message-ID: <f11e8a14-deb0-456f-bb4a-b5e4e16a79d7@openvpn.net>
Date: Fri, 11 Apr 2025 10:04:10 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v25 01/23] net: introduce OpenVPN Data Channel
 Offload (ovpn)
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Donald Hunter <donald.hunter@gmail.com>,
 Shuah Khan <shuah@kernel.org>, sd@queasysnail.net, ryazanov.s.a@gmail.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, Simon Horman <horms@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Xiao Liang <shaw.leon@gmail.com>, steffen.klassert@secunet.com,
 antony.antony@secunet.com
References: <20250407-b4-ovpn-v25-0-a04eae86e016@openvpn.net>
 <20250407-b4-ovpn-v25-1-a04eae86e016@openvpn.net>
 <20250410195440.3ba7ba0f@kernel.org>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
Organization: OpenVPN Inc.
In-Reply-To: <20250410195440.3ba7ba0f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Jakub,

thanks for taking the time to go through my patchset :)

On 11/04/2025 04:54, Jakub Kicinski wrote:
> On Mon, 07 Apr 2025 21:46:09 +0200 Antonio Quartulli wrote:
>> +static int ovpn_netdev_notifier_call(struct notifier_block *nb,
>> +				     unsigned long state, void *ptr)
>> +{
>> +	struct net_device *dev = netdev_notifier_info_to_dev(ptr);
>> +
>> +	if (!ovpn_dev_is_valid(dev))
>> +		return NOTIFY_DONE;
>> +
>> +	switch (state) {
>> +	case NETDEV_REGISTER:
>> +		/* add device to internal list for later destruction upon
>> +		 * unregistration
>> +		 */
>> +		break;
>> +	case NETDEV_UNREGISTER:
>> +		/* can be delivered multiple times, so check registered flag,
>> +		 * then destroy the interface
>> +		 */
>> +		break;
>> +	case NETDEV_POST_INIT:
>> +	case NETDEV_GOING_DOWN:
>> +	case NETDEV_DOWN:
>> +	case NETDEV_UP:
>> +	case NETDEV_PRE_UP:
>> +	default:
>> +		return NOTIFY_DONE;
>> +	}
> 
> Why are you using a notifier to get events for your own device?

My understanding is that this is the standard approach to:
1) hook in the middle of registration/deregistration;
2) handle events generated by other components/routines.

I see in /drivers/net/ almost every driver registers a notifier for 
their own device.

Isn't this expected?

> 
>> +	return NOTIFY_OK;
>> +}
> 
>> +MODULE_DESCRIPTION("OpenVPN data channel offload (ovpn)");
>> +MODULE_AUTHOR("(C) 2020-2025 OpenVPN, Inc.");
> 
> Companies can't author code, only people. Note that MODULE_AUTHOR()
> is optional.

Ouch, thanks. Will get this addressed.

Regards,

-- 
Antonio Quartulli
OpenVPN Inc.

