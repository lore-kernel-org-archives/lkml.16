Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48A3726ACB
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.246
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750740804; cv=none; b=nWw5utr60xThU1JsB2AFYRJWEcHnDDnUrUxekNNHGlP26gj1XZYS9y9HC3AQEbs4SI+K/kQBpEHo+9mFFpDkMj/0zGBFLL7WCSL1IboO3qfgVdedqMUmi3FFVPizYXb9Gff1Z8vtMLhsstQ/nraLLJvSBFcd/MI+cTIK/WDrEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750740804; c=relaxed/simple;
	bh=Aj+S0rJZha0e5HakzdRelbWfgUuo+0BrTI1wMbjkTCM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Y2GM6qNpUC8dxDOewhX963Tz8y8i9OEpiBZXw1bdcNMXC36vRWmiA8uvD8/I2DHwilb5JIIvaYFJGJXmuho1JS0JbK1bUu3EG1bmKTiV9gdiHsocCnTQmZUXCYNATEEaCJOqySm7DpCX0XX2KwyjOH/h4+ltoP1b+vMY6yxfcbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=ZHyUmZ03; arc=none smtp.client-ip=198.47.19.246
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="ZHyUmZ03"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55O4r1p41758084;
	Mon, 23 Jun 2025 23:53:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1750740781;
	bh=TmcUunDbJTKoNg9eOqTWGxYIouQv1t0S4n/SFCibWxA=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=ZHyUmZ03K7BZvRX6CEb0rvx+ZK1s0eOGY8bJMTH/tuYd785qL4PqWgXb06fXioxMk
	 G/rqXjEVGGOXNl9YBkIavIDMOgLtg9XKy4d68RjAnwPO9cZ2F0r3osW4nL2MORFAba
	 CTJmUFGXFxAYs5RiZ5pvlOht68s4lO9B0FLk/SEE=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55O4r0KH4141641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Mon, 23 Jun 2025 23:53:00 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Mon, 23
 Jun 2025 23:52:59 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Mon, 23 Jun 2025 23:52:59 -0500
Received: from [172.24.227.214] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.214])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55O4qqGP892097;
	Mon, 23 Jun 2025 23:52:53 -0500
Message-ID: <bc66e52a-7ab8-47db-b534-cc2fbef60ef4@ti.com>
Date: Tue, 24 Jun 2025 10:22:52 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
 connector type
To: Doug Anderson <dianders@chromium.org>
CC: <andrzej.hajda@intel.com>, <neil.armstrong@linaro.org>, <rfoss@kernel.org>,
        <Laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <max.krummenacher@toradex.com>,
        <ernestvanhoecke@gmail.com>, <jonas@kwiboo.se>,
        <jernej.skrabec@gmail.com>, <maarten.lankhorst@linux.intel.com>,
        <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
        <simona@ffwll.ch>, <kieran.bingham+renesas@ideasonboard.com>,
        <linux-kernel@vger.kernel.org>, <max.oss.09@gmail.com>,
        <devarsht@ti.com>, <geert@linux-m68k.org>
References: <20250616093240.499094-1-j-choudhary@ti.com>
 <CAD=FV=Wb=bWXDfCyF8XhJ93dBRU2rUKM+B0X5uYh39FHRgT1Ww@mail.gmail.com>
 <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=V0BL0Mi2i2JR=bNVyBVQ8QA9+j+n6is0NTp8GF=X2yCA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Doug,

On 23/06/25 21:00, Doug Anderson wrote:
> Hi,
> 
> On Mon, Jun 16, 2025 at 9:24 AM Doug Anderson <dianders@chromium.org> wrote:
>>
>> Hi,
>>
>> On Mon, Jun 16, 2025 at 2:32 AM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>>
>>> @@ -1220,6 +1231,27 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
>>>          debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>>>   }
>>>
>>> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
>>> +{
>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>> +
>>> +       /*
>>> +        * Device needs to be powered on before reading the HPD state
>>> +        * for reliable hpd detection in ti_sn_bridge_detect() due to
>>> +        * the high debounce time.
>>> +        */
>>> +
>>> +       pm_runtime_get_sync(pdata->dev);
>>> +}
>>> +
>>> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
>>> +{
>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>> +
>>> +       pm_runtime_mark_last_busy(pdata->dev);
>>> +       pm_runtime_put_autosuspend(pdata->dev);
>>
>> nit: you don't need the pm_runtime_mark_last_busy() here, do you? Just
>> call pm_runtime_put_autosuspend().
>>
>> Aside from the nit, this looks reasonable to me now.
>>
>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> What's the plan here? I can just remove the
> `pm_runtime_mark_last_busy()` and land it if people are on board with
> that (and if it works fine for Jayesh). If Jayesh wants to post a v6
> to make it more legit, I can land that. I probably won't land anything
> myself past Wednesday (California time) since I'm about to go offline
> for 2 weeks and wouldn't want to land and bolt.
> 

Posted v6 with this dropped and the tags picked up:
https://lore.kernel.org/all/20250624044835.165708-1-j-choudhary@ti.com/

Thanks and Warm Regards,
Jayesh


> -Doug
