Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDCA2E1742
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:10:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751537408; cv=none; b=tekilu/bvdcY/ZTPKiBts3xh6nTyXUEjLMdFwqq5fuiV0atjsgSsfTcRSamnQ005t5d7jJpCGTz5PQD4DO87s0O8oDa5uPMVNtUDJwRZMmt8kAKVjBk3VraB0t4Vk/TrDtfKu9z8zw1IbOedj9GReQkznOf73IG0qN4lSlsClPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751537408; c=relaxed/simple;
	bh=2URzPKeWwOWlfZr3VMU/R70qtUMAmLZrCaO6QOVU9A4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Qy5BWxsxRtwAXHbiQPpfJsjadRI73kIsHYUcQzKctYhUS1Y9YX744BakBwSIn+QK91Lao5EZkzUcWKh3gYpsP8W9ht3N9zlp/YKs7PzxgPkGoywKJGtimJWpWlHYUvlSe2TSYV+R892M87tdKH/RcrE7pehagsWP77udK88kPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=cSpZCwJ8; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="cSpZCwJ8"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso4288970f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:10:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1751537405; x=1752142205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4hFA4oh4QUQdOxuaA9SVG8ATJhstNeNbsNX9+qVlE1g=;
        b=cSpZCwJ8EPQEGj92CQZ/ZWw+yF7rLqbrdcjuFEdf4Y652bVBXhqNYK+ICQdPhG6UdM
         owHTylNd4rfnKmPr8lKRATHqlljA2qmGlRlSgDEECbxMa6kyrnvRqyIozmxt1pKOSRXa
         BUvMAmUtUxdYdtsouIjrQfIjlFRccIOT6pRIxr7HZom5sKNWDw+4np1Okbp1Q5YiNAsD
         +w3lZnRhVkKiAHKcwh3CbGAZk1GRfEF0RZjtoIfnWnitXe+FU7FzoV1U9fwQF+zXL2R2
         RsFd/EiMOvIsTgZQP+V/+RVPD5/NEGIzmz47jGh6tMRn+ma9iJOgVukk9b3rV8fopbUb
         Vy0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751537405; x=1752142205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hFA4oh4QUQdOxuaA9SVG8ATJhstNeNbsNX9+qVlE1g=;
        b=Boeril+lFJpNg59u63Fvn52Nk8v9gtG/MvYaC3yS8IAWC4MSUBHmy3lygLIKZFPsa8
         avvGfvfNxa/bmylpJnQRDTIDr//G3rmINZpVWgjDYgBMecpGGz1ABmJYsUgABcfP/WMW
         CTLnlfwQ/T3Ki81m8WuARrmo/gCuHzDgeq0CBuQlZ2NjaJ1ovCdSBo6Adqur8Y8w11Oe
         417t2WAhLg0UOP4OMNz/fKtHkLDOqU6TpiEgLc0q5zHivW8doo85+R4gix/uOhWJTd7B
         +9mhdzMwjQdCVdIymxXIjxJoikg4S0wzkvS9CWCyhJOBK3ERQiRW14dVaFM41cqVP1vG
         CGrw==
X-Forwarded-Encrypted: i=1; AJvYcCVBU5PbEtVCACYtP3/+hMUVuZUuww5+gEJSPFrf0/9ySRZjg+zaDnFx/vl/rdtl1N41SvnbtQjApT7ROvM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1Q+FNwqlvWE9SEzWll3+29fx4EozyLbgdQKNL+7AzdrrvhKsS
	CxKZQ2tqKWzQ+PdLB3RYpjloWu16sfqDjAZ8MGFOphLGJZEf81egjETRV345Obs4vAo=
X-Gm-Gg: ASbGncuXILU6wUOxWfj8tqGkkXpUkDDY+aCTDc5/EIfm8Ajt5jkGWim4tHOfTipEfnH
	WCLSAEW7mwOMbkM/A7rdIcBCkr0l5a5AWo+z8IBGhN+eGjte6XluAAqU4unpAyvWKdqYyqv2fHq
	BYOlp6st4pUnSYeagU5pJKO2Z2RpWRElW54/1M0jIQbmgn6buP4/WXVp4G8V7qRoPPsm6dGieaQ
	yxadDf2FT+/TXFUOiHCFq0pYrRbKjlGNQRDsQZzh3z05IitrDWsdJ1DYWKsM1p+cWBH9H1IZaFi
	Zsownw88e64LJUDclOStDl6XvofnAEvqhHMh1zIs7PeSxE7THnr+o46bEWcyQl/dkcF/Jw==
X-Google-Smtp-Source: AGHT+IHfNjDl88KLIzBBak/j4QsOeoXaT11cx/c0F4gN8GQS6D2qXXuoCo04NSmd3GiJG1PcpnF/0A==
X-Received: by 2002:a05:6000:4011:b0:3b2:e07f:757 with SMTP id ffacd0b85a97d-3b32b145539mr2068694f8f.1.1751537404431;
        Thu, 03 Jul 2025 03:10:04 -0700 (PDT)
Received: from jiri-mlt ([193.47.165.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99878acsm22244925e9.17.2025.07.03.03.09.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:10:04 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:09:53 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Ivan Vecera <ivecera@redhat.com>
Cc: netdev@vger.kernel.org, Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Prathosh Satish <Prathosh.Satish@microchip.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Shannon Nelson <shannon.nelson@amd.com>, Dave Jiang <dave.jiang@intel.com>, 
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Michal Schmidt <mschmidt@redhat.com>, 
	Petr Oros <poros@redhat.com>
Subject: Re: [PATCH net-next v12 07/14] dpll: zl3073x: Add clock_id field
Message-ID: <pfkr62fp4jr2bts3ektfwn4or36lqdsdqfsntryubr5oawx7kv@adqwk2qoflhu>
References: <20250629191049.64398-1-ivecera@redhat.com>
 <20250629191049.64398-8-ivecera@redhat.com>
 <amsh2xeltgadepx22kvcq4cfyhb3psnxafqhr33ra6nznswsaq@hfq6yrb4zvo7>
 <e5e3409e-b6a8-4a63-97ac-33e6b1215979@redhat.com>
 <cpgoccukn5tuespqse5fep4gzzaeggth2dkzqh6l5jjchumfyc@5kjorwx57med>
 <4f2e040b-3761-441c-b8b1-3d6aa90c77fc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4f2e040b-3761-441c-b8b1-3d6aa90c77fc@redhat.com>

Wed, Jul 02, 2025 at 04:51:47PM +0200, ivecera@redhat.com wrote:
>On 02. 07. 25 2:01 odp., Jiri Pirko wrote:
>> Wed, Jul 02, 2025 at 01:43:38PM +0200, ivecera@redhat.com wrote:
>> > 
>> > On 02. 07. 25 12:31 odp., Jiri Pirko wrote:
>> > > Sun, Jun 29, 2025 at 09:10:42PM +0200, ivecera@redhat.com wrote:
>> > > > Add .clock_id to zl3073x_dev structure that will be used by later
>> > > > commits introducing DPLL feature. The clock ID is required for DPLL
>> > > > device registration.
>> > > > 
>> > > > To generate this ID, use chip ID read during device initialization.
>> > > > In case where multiple zl3073x based chips are present, the chip ID
>> > > > is shifted and lower bits are filled by an unique value - using
>> > > > the I2C device address for I2C connections and the chip-select value
>> > > > for SPI connections.
>> > > 
>> > > You say that multiple chips may have the same chip ID? How is that
>> > > possible? Isn't it supposed to be unique?
>> > > I understand clock ID to be invariant regardless where you plug your
>> > > device. When you construct it from i2c address, sounds wrong.
>> > 
>> > The chip id is not like serial number but it is like device id under
>> > PCI. So if you will have multiple chips with this chip id you have to
>> > distinguish somehow between them, this is the reason why I2C address
>> > is added into the final value.
>> > 
>> > Anyway this device does not have any attribute that corresponds to
>> > clock id (as per our previous discussion) and it will be better to NOT
>> > require clock id from DPLL core side.
>> 
>> Yes, better not to require it comparing to having it wrong.
>
>It looks that using clock_id==0 is safe from DPLL API point of view.
>The problem is if you will have multiple zl3073x based chips because
>the driver would call dpll_device_get(0 /* clock_id */, channel, module)
>
>For 1st chip (e.g. 2 channel) the driver will call:
>dpll_device_get(0, 0, module);
>dpll_device_get(0, 1, module);
>
>and for the second the same that is wrong. The clock_id would help to
>distinguish between them.
>
>Wouldn't it be better to use a random number for clock_id from the
>driver?

I take my suggestion to not require it back, does not make sense.

Clock id actually has a reason to exist from UAPI perspective. Checkout
dpll_device_find_from_nlattr(). The user passes CLOCK_ID attr (among
others) to obtain device by DPLL_CMD_DEVICE_ID_GET command. He expects
to get a result back from kernel regardless where the device is plugged
and across the reboots/rebinds.

Clock id should be properly filled with static and device specific
value. If your chip can't be queried for it, I'm sure the embedded world
has a solution for such cases. It's similar to MAC of a NIC device.
