Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3584E1E1041
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 11:02:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418961; cv=none; b=nkhdnooi2lo4R+Izc0HX59We1MvI0EoaUYabdd97sc5C88u5l27qfYz2ErZhcPzNPkMX8h7zmqqb3hgUOpzczQy17iwjqZAwqe+dn8RbjmS833eaEgUdR4tdo0SC/4psGbkARFGGnVTs6qUSS0V0mDrlTcb3muhiyymET7QAVfE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418961; c=relaxed/simple;
	bh=YA+2uyuVBMy/hV2ZmpgjAYrqgK+n49xYKelnmgqIzyE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZnFjeQJe67LE/zrXHbotHJ0FW6o/s9qM9wpE+KRn7wnph7Nvd8bMidvRCchDNS4TpZrockE5lKGkaFSCV8C8JzqzA1pjdmWtStX+ORviUgmDfHLU6Vk4SailWbBpNCwCT54mtKF/eepvSaWror9lvQ32au0RnRGIHVz3l/1R3kY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5FE411F37;
	Mon, 31 Mar 2025 04:02:43 -0700 (PDT)
Received: from [10.57.15.213] (unknown [10.57.15.213])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974583F694;
	Mon, 31 Mar 2025 04:02:37 -0700 (PDT)
Message-ID: <db129e7b-896a-4f0d-8c69-d20b58c370cc@arm.com>
Date: Mon, 31 Mar 2025 12:02:33 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/panfrost: add h616 compatible string
To: Andre Przywara <andre.przywara@arm.com>
Cc: Philippe Simons <simons.philippe@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
 <20250312232319.25712-3-simons.philippe@gmail.com>
 <9ad57d16-5977-4542-8598-d23d41227e7a@arm.com>
 <20250331115729.33e54615@donnerap.manchester.arm.com>
Content-Language: en-GB
From: Steven Price <steven.price@arm.com>
In-Reply-To: <20250331115729.33e54615@donnerap.manchester.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 31/03/2025 11:57, Andre Przywara wrote:
> On Mon, 31 Mar 2025 11:32:58 +0100
> Steven Price <steven.price@arm.com> wrote:
> 
> Hi Steven,
> 
> thanks for having a look!
> 
>> On 12/03/2025 23:23, Philippe Simons wrote:
>>> Tie the Allwinner compatible string to the two features bits that will
>>> toggle the clocks and the reset line whenever the power domain is changing
>>> state.  
>>
>> This looks fine, but we need the new compatible string to be documented
>> in the bindings:
>>
>> Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
>>
>> I'm not sure what the situation is for the device tree for this
>> platform, but it would be good to get that all sorted before we merge
>> the compatible into panfrost.
> 
> The binding addition was sent earlier, as part of my power-domain driver
> series:
> https://lore.kernel.org/linux-sunxi/20250221005802.11001-1-andre.przywara@arm.com/T/#m083df99cf34ddfd06a6a4b8fbb49636a51b05112
> 
> Rob took that one already, and it landed in Linus' tree last week, so
> that would be covered.

Ah, cool. I realised now I was looking in drm-misc-next not linux-next
(too many Linux checkouts!) which is why I didn't find it.

Thanks,
Steve

> Cheers,
> Andre
> 
>>
>> Thanks,
>> Steve
>>
>>> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_drv.c | 8 ++++++++
>>>  1 file changed, 8 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> index 0f3935556ac7..f13743fe6bad 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
>>> @@ -776,6 +776,13 @@ static const struct panfrost_compatible default_data = {
>>>  	.pm_domain_names = NULL,
>>>  };
>>>  
>>> +static const struct panfrost_compatible allwinner_h616_data = {
>>> +	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>>> +	.supply_names = default_supplies,
>>> +	.num_pm_domains = 1,
>>> +	.pm_features = BIT(GPU_PM_RT_CLK_DIS) | BIT(GPU_PM_RT_RST_ASRT),
>>> +};
>>> +
>>>  static const struct panfrost_compatible amlogic_data = {
>>>  	.num_supplies = ARRAY_SIZE(default_supplies) - 1,
>>>  	.supply_names = default_supplies,
>>> @@ -859,6 +866,7 @@ static const struct of_device_id dt_match[] = {
>>>  	{ .compatible = "mediatek,mt8186-mali", .data = &mediatek_mt8186_data },
>>>  	{ .compatible = "mediatek,mt8188-mali", .data = &mediatek_mt8188_data },
>>>  	{ .compatible = "mediatek,mt8192-mali", .data = &mediatek_mt8192_data },
>>> +	{ .compatible = "allwinner,sun50i-h616-mali", .data = &allwinner_h616_data },
>>>  	{}
>>>  };
>>>  MODULE_DEVICE_TABLE(of, dt_match);  
>>
> 

