Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B758BFF
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 12:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747052089; cv=none; b=hG4WahgwIi15snAavYuV1xP7THvSTTgv9PJDkAink708QyhBo2vreFEgjskKC9N7+1G3omO2RQyw3pOykchXGkJXvkzgLKoFXn89Ecfrq5ChVn3FeDGqaFX+ReQJEiH5vWwYEpqfV7NbdRwgJWT0mGju/lKFQeMP7OcvYEWkTeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747052089; c=relaxed/simple;
	bh=9SGZxg3iu/1rk/YCA0UjZ+r4MNpQ2iWRRmUuKQDbPWM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iZvQD72dgk6SPyP+Aq3wuSjA5+nEsAj5LV9LXZRsUXpTrpf9hL5lATzj98JDO6VRl750EMuIa+W4w73oWpocaqG1iicFPM9tIsuhyc2feAoIQ7BsjShJ/juVeFZqrirNc15Gnm+aqrNa2wR7E6OW40K0NwGEGLLK0py+P1aCH1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wkwgEuwd; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wkwgEuwd"
Message-ID: <5b9d9a5c-b647-4d56-ac04-d1c04a97bc30@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747052075;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YIXcUY/fSCMcDvHSWI4IRhB/8040uy1a8GFVe9KfPlY=;
	b=wkwgEuwdgorTynaAGELwho4Dfk7DDSRlySUulcM0tru1JWDeHzdZsavuVSvUxhdFBpKb1p
	DuzHYHBPzx/9dz5LFKO0irWoBnjbjquskxzpTp6m+duI1eVbWWFkwDU0GTDOoDRiVO+ncd
	dnIvwibYdNaa6FidajdK11ZA1i6jrZo=
Date: Mon, 12 May 2025 13:14:32 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH net-next] net: ixp4xx_eth: convert to ndo_hwtstamp_get()
 and ndo_hwtstamp_set()
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: netdev@vger.kernel.org, =?UTF-8?Q?K=C3=83=C2=B6ry_Maincent?=
 <kory.maincent@bootlin.com>, Linus Walleij <linusw@kernel.org>,
 Imre Kaloz <kaloz@openwrt.org>, linux-arm-kernel@lists.infradead.org,
 Andrew Lunn <andrew@lunn.ch>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Richard Cochran <richardcochran@gmail.com>, linux-kernel@vger.kernel.org
References: <20250508211043.3388702-1-vladimir.oltean@nxp.com>
 <dfb57a6c-8db7-4ab5-9d51-eec40cf8662e@linux.dev>
 <20250512120659.r7dmrugocat7ou3t@skbuf>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250512120659.r7dmrugocat7ou3t@skbuf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 12/05/2025 13:06, Vladimir Oltean wrote:
> On Thu, May 08, 2025 at 11:45:48PM +0100, Vadim Fedorenko wrote:
>>> The remainder of eth_ioctl() is exactly equivalent to
>>> phy_do_ioctl_running(), so use that.
>>
>> One interesting fact is that phy_do_ioctl_running() will return -ENODEV
>> in case of !netif_running(netdev) while previous code would return
>> -EINVAL. Probably it's ok, but may be it's better to have consistent
>> error path for both options.
>>
>> Otherwise LGTM,
>> Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
> 
> Thanks for the review. Indeed, I hadn't noticed the -EINVAL vs -ENODEV
> difference.
> 
> Are you suggesting that I first create a patch which replaces -EINVAL
> with -ENODEV in eth_ioctl(), so that ixp4xx_hwtstamp_get/set() is
> consistent with phy_do_ioctl_running() in returning -ENODEV?

The patch to net to make things consistent would be great, but no strong
opinion as there were no complains I believe.
