Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48CAA283C87
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:19:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748434769; cv=none; b=CpvzeYWw7wCuFEXBW6Vkc9MCk6f4m2j2fzs4GArSxc9R1M2et931hylv9j/HVkquQcFpe5Ptlk8kF/lYNOQ/oWMc4ZMLUZ8UhNEwx0sJo1+2/ycNG9Lrd08LFbGa+5IIHDHro9E2qPF0yDS3xKn9+P06/Bc7npDdRIj5FctFriw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748434769; c=relaxed/simple;
	bh=VGnl6Y+q2kjW350SAMV6KWgkQ0sTgZ/83xluxF/uE1A=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EuB1YbOrlK14csAbsdXlrbott73WOVNoLuvnArezZvt99r/wKJhbHoXNAhXhqsp5RUgsxyLP5it4ijOKKa8gknDaalmJy8ps/kT0oqxXs/PvXKyyrjBwnZcZmkhYVZDVL0FfD1zuq7IzSkzsHwC7OHgTr+I55Bb5UX0Mkz7qG/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=kNdFqCqw; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="kNdFqCqw"
Received: from fllvem-sh03.itg.ti.com ([10.64.41.86])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 54SCJ5Wx2052677;
	Wed, 28 May 2025 07:19:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1748434745;
	bh=l3YN0YjiGyCT1PJmlXnIccHSCajQruxefXMQ1JMSQPE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=kNdFqCqwIXkdgc+N8Lzivt5YP4XEfjRfMYbEa1U6f9OEiyl4WJzQXCScqofA1Nj/f
	 GbkxJcp5Mxj9SdqCATMIinnQq+e6GggR1jliwD6IxwMLHM+yP+dmFv3bNGseS+UrYB
	 VPoHqFXov61GpsAlmpO4rHJhFA8K+aB/wpli6YSg=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllvem-sh03.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 54SCJ4823553852
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Wed, 28 May 2025 07:19:04 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 28
 May 2025 07:19:03 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 28 May 2025 07:19:03 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 54SCIv5e095919;
	Wed, 28 May 2025 07:18:57 -0500
Message-ID: <0936a042-8ebe-42f7-b3eb-a4606120cc47@ti.com>
Date: Wed, 28 May 2025 17:48:56 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Doug Anderson <dianders@chromium.org>,
        Ernest Van Hoecke
	<ernestvanhoecke@gmail.com>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
        <jonas@kwiboo.se>, <jernej.skrabec@gmail.com>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <airlied@gmail.com>, <simona@ffwll.ch>,
        <kieran.bingham+renesas@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
        <devarsht@ti.com>, <dmitry.baryshkov@oss.qualcomm.com>,
        <ernest.vanhoecke@toradex.com>
References: <20250508115433.449102-1-j-choudhary@ti.com>
 <mwh35anw57d6nvre3sguetzq3miu4kd43rokegvul7fk266lys@5h2euthpk7vq>
 <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=U7XJZg4Vh4xMKEiAuaJHNA1H11SiD19KLBazPmMEVduw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Doug, Ernest,

On 27/05/25 21:14, Doug Anderson wrote:
> Hi,
> 
> On Mon, May 26, 2025 at 1:41 AM Ernest Van Hoecke
> <ernestvanhoecke@gmail.com> wrote:
>>
>> Hi Jayesh,
>>
>> First of all, thanks for your patch. I applied it to our 6.6-based
>> downstream kernel supporting a board I have here, and noticed some
>> strange behaviour with eDP now.
>>
>> On Thu, May 08, 2025 at 05:24:33PM +0530, Jayesh Choudhary wrote:
>>> +     if (pdata->bridge.type == DRM_MODE_CONNECTOR_eDP)
>>> +             regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG, HPD_DISABLE,
>>> +                                HPD_DISABLE);
>>>
>>
>> On my setup it seems that `pdata->bridge.type` is not yet set here,
>> because it executes before `ti_sn_bridge_probe`. For the DP use case,
>> this is not a problem because the type field is 0 (i.e., not
>> DRM_MODE_CONNECTOR_eDP) in that case. But for eDP, it means that we are
>> unexpectedly not disabling HDP.
>>
>> With working HDP, everything is fine in the end for both DP and eDP. But
>> when the HDP line is not connected, eDP no longer works. So I wonder if
>> this breaks some functionality for weird eDP panels or board
>> implementations.
>>
>> I could certainly be missing something; from my understanding it looks
>> like without a good HPD signal, the `ti_sn_bridge_probe` and quoted code
>> are stuck in a loop. `ti_sn65dsi86_enable_comms` runs but does not
>> disable HDP, after which the probe runs but fails and does not set the
>> type field, so the next `enable_comms` run fails to disable HDP again,
>> etc.
> 
> This does sound like a real problem.
> 
> I'm not sure I'll have the time to analyze it and come up with a
> proposal myself right now, but Jayesh: you should make sure you
> consider and address this issue before you send your next version.
> 
> Thanks!


I see that i2c_driver probe ti_sn65dsi86_probe() is called first
which calls ti_sn65dsi86_resume() and ti_sn65dsi86_enable_comms()
and after that auxiliary_driver probe ti_sn_bridge_probe() is called
where pdata->bridge.type is set.

As per the bindings, I see that we should have "no-hpd" property in
the device description for platforms with bad HPD or disconnected HPD.

Then we can read it in ti_sn65dsi86_probe() before resume call and use
it as a conditional instead.
Since I do not have any "bad HPD signal" board, I would need some
help validating this on such boards from Ernest.

Also, that would mean adding "no-hpd" to all the platforms using
sn65dsi86 for baseline first, even before the driver changes are in.
Because if driver changes go in first, this would enable HPD for all
the platforms. Whereas, the dts changes alone are harmless.
But still I am doubtful about dts changes getting in before driver
changes.
Considering this, please let me know the order of changes and I will
send out the patches accordingly.

Thanks,
Jayesh
