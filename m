Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9640529290A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 15:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747926914; cv=none; b=tBBkjNcF53qNE+0V5CmSCPatSyfQZUP1fR2k1MjZG8Fx8LNTiV0qnM7E99GpvcIs4IsvQ6bNv430Q2ovZ4GBnAk9l5IilUPvH676QGjdAheWFOZeuC8XOScJf/9drfxKFijxxpRzuV2X3x5mwuka5xTyuVGYuvz1HR5g+I+N+10=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747926914; c=relaxed/simple;
	bh=khJ1ubnsgvo0EosL9A0wrR2WR+Qc+Yx33YoDRTYZ1JU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nCwz5N9rSuAdi59XUWIblVrvl6aVruiX7sJWrfSjhJUtYwF2AZGmu3KUmQ8baeMqM0GIt9xOgoZwvJtjJaU/UZXoWK/BNL6mZqDgyjlJPrKSSBUCQfkB+FvqYi+ifaTLTYbN6emeeBVICNo+jJnoaEE73TzAwihSfojNqlq89+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=S8unWojt; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="S8unWojt"
Message-ID: <6d9955ea-29c2-4df1-9618-b10e9185230b@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1747926900;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gfohxjPLWw+GeQ2Ofcf4RstTAbZNyvuhU8/jKxg1jEM=;
	b=S8unWojtKLgbJlR84BmKzFDvYTvvVe5pRqzPppRCgHJqXBtSaM1iQskTqv+bay9zU8M9T+
	1YR2eNOht6A6eNbQWY3IM7a3hq5absbugNXPuRGC2Gf1Z3oePO16jYQ8xrGay+hr5zh+pW
	YctQH0QY6jy5iRfq/i+KWtNgEalC/8Q=
Date: Thu, 22 May 2025 11:14:53 -0400
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [net-next PATCH v4 03/11] net: pcs: Add subsystem
To: Lei Wei <quic_leiwei@quicinc.com>, netdev@vger.kernel.org,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>
Cc: upstream@airoha.com, Kory Maincent <kory.maincent@bootlin.com>,
 Simon Horman <horms@kernel.org>, Christian Marangi <ansuelsmth@gmail.com>,
 linux-kernel@vger.kernel.org, Heiner Kallweit <hkallweit1@gmail.com>,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <20250512161013.731955-1-sean.anderson@linux.dev>
 <20250512161013.731955-4-sean.anderson@linux.dev>
 <e92c87cf-2645-493c-b9d3-ce92249116d1@quicinc.com>
 <4556e55b-2360-4780-a282-b2f04f5cc994@linux.dev>
 <a7edb7e8-37ac-45ae-b5c7-2c9034dce4d7@quicinc.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <a7edb7e8-37ac-45ae-b5c7-2c9034dce4d7@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 5/21/25 08:50, Lei Wei wrote:
> 
> 
> On 5/20/2025 1:43 AM, Sean Anderson wrote:
>> On 5/14/25 12:22, Lei Wei wrote:
>>>
>>>
>>> On 5/13/2025 12:10 AM, Sean Anderson wrote:
>>>> +/**
>>>> + * pcs_register_full() - register a new PCS
>>>> + * @dev: The device requesting the PCS
>>>> + * @fwnode: The PCS's firmware node; typically @dev.fwnode
>>>> + * @pcs: The PCS to register
>>>> + *
>>>> + * Registers a new PCS which can be attached to a phylink.
>>>> + *
>>>> + * Return: 0 on success, or -errno on error
>>>> + */
>>>> +int pcs_register_full(struct device *dev, struct fwnode_handle *fwnode,
>>>> +              struct phylink_pcs *pcs)
>>>> +{
>>>> +    struct pcs_wrapper *wrapper;
>>>> +
>>>> +    if (!dev || !pcs->ops)
>>>> +        return -EINVAL;
>>>> +
>>>> +    if (!pcs->ops->pcs_an_restart || !pcs->ops->pcs_config ||
>>>> +        !pcs->ops->pcs_get_state)
>>>> +        return -EINVAL;
>>>> +
>>>> +    wrapper = kzalloc(sizeof(*wrapper), GFP_KERNEL);
>>>> +    if (!wrapper)
>>>> +        return -ENOMEM;
>>>
>>> How about the case where pcs is removed and then comes back again? Should we find the original wrapper and attach it to pcs again instead of creating a new wrapper?
>>
>> When the PCS is removed the old wrapper is removed from pcs_wrappers, so
>> it can no longer be looked up any more. I think trying to save/restore
>> the wrapper would be much more trouble than it's worth.
>>
> 
> In the case where Ethernet is not removed but PCS is removed and then
> comes back (when the sysfs unbind followed by bind method is used),
> it will not work because the Ethernet probe will not be initiated again, to call "pcs_get" again to obtain the new wrapper, it would still hold the old wrapper.

Correct. You must then unbind/bind the MAC.

--Sean

