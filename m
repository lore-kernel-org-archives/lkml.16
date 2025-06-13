Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F82F189BB0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 10:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.19.245
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749809492; cv=none; b=JzB/VlCp94cWIKWMtShJPDCtd7euiDw8yJRQdx/FQzyeHGOMvwi4mqteyeYC72zzg+z1ZilamT7F94pyVKeBftbTOKb1aOc/5FBGWiDY6JNaYTyU97x5BuS9ApfFudM5b0syV2FYWvhcYXffyWl98+hL9XtsHlhEPFFPBMvCUuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749809492; c=relaxed/simple;
	bh=eV5dij/xVVdWZ7Ruoum/ACUvzuYrQNJXgVUzOKX2hxY=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=T7wJBJgb4pzVlt58R/HhjejtpWQv/ZRdZ5DZJMrFriH8X5X6P99RH9ly/LSexq+TlmmKDQoQ23pXMS4qy/knrGC77e+/m2/acIgVGTFwA5nc6ryfT2aI8MXPyJDfbeO0KSxxU0GoA149qgbi/77r3iTq7dkQsWAZaHvlpSE03t8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=VTa7IOok; arc=none smtp.client-ip=198.47.19.245
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="VTa7IOok"
Received: from fllvem-sh04.itg.ti.com ([10.64.41.54])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTP id 55DAB84i3108518;
	Fri, 13 Jun 2025 05:11:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1749809468;
	bh=SDjWXiFIEzg7oivIUxsy2HUytMCGwhuL+H4VQFFHmys=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=VTa7IOokqFanonCYWLicGA+agbKakJW3I7dPMnbu9yIBpEy3CBzjcNRkdieWuVm0C
	 tM6ITG0/skf+U/W+xt5O3moAy5JHuNn9nOEieaSzYleh2af99/tEmScGiOwkC2I6b+
	 UshpJoRqve2eM+dgNEPep8Ua2St3FpBy01GrEeIg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllvem-sh04.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 55DAB8bO2659538
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Fri, 13 Jun 2025 05:11:08 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Fri, 13
 Jun 2025 05:11:07 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Fri, 13 Jun 2025 05:11:07 -0500
Received: from [172.24.227.14] (jayesh-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.14])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 55DAB1Cw3591830;
	Fri, 13 Jun 2025 05:11:02 -0500
Message-ID: <ae5f6910-7793-4a0b-a7fe-12cd5c87d42d@ti.com>
Date: Fri, 13 Jun 2025 15:41:01 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/bridge: ti-sn65dsi86: Add HPD for DisplayPort
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
References: <20250611052947.5776-1-j-choudhary@ti.com>
 <CAD=FV=WvH73d78De3PrbiG7b6OaS_BysGtxQ=mJTj4z-h0LYWA@mail.gmail.com>
 <547a35f4-abc0-4808-9994-ccc70eb3c201@ti.com>
 <CAD=FV=XzSOqnLQCjDiJX7wrGH0UGq839a84v3QT9cj3eK+AeRA@mail.gmail.com>
Content-Language: en-US
From: Jayesh Choudhary <j-choudhary@ti.com>
In-Reply-To: <CAD=FV=XzSOqnLQCjDiJX7wrGH0UGq839a84v3QT9cj3eK+AeRA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea

Hello Doug,

On 12/06/25 20:21, Doug Anderson wrote:
> Hi,
> 
> On Wed, Jun 11, 2025 at 9:39 PM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>
>> Hello Doug,
>>
>> On 12/06/25 03:08, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Tue, Jun 10, 2025 at 10:29 PM Jayesh Choudhary <j-choudhary@ti.com> wrote:
>>>>
>>>> @@ -1195,9 +1203,17 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
>>>>           struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>>           int val = 0;
>>>>
>>>> -       pm_runtime_get_sync(pdata->dev);
>>>> +       /*
>>>> +        * The chip won't report HPD right after being powered on as
>>>> +        * HPD_DEBOUNCED_STATE reflects correct state only after the
>>>> +        * debounce time (~100-400 ms).
>>>> +        * So having pm_runtime_get_sync() and immediately reading
>>>> +        * the register in detect() won't work, and adding delay()
>>>> +        * in detect will have performace impact in display.
>>>> +        * So remove runtime calls here.
>>>
>>> That last sentence makes sense in a commit message, but not long term.
>>> Someone reading the code later won't understand what "remove" means.
>>> If you change "remove" to "omit" then it all makes sense, though. You
>>> could also say that a pm_runtime reference will be grabbed by
>>> ti_sn_bridge_hpd_enable().
>>
>> Okay. Will edit this.
>>
>>>
>>>
>>>> +        */
>>>> +
>>>>           regmap_read(pdata->regmap, SN_HPD_DISABLE_REG, &val);
>>>> -       pm_runtime_put_autosuspend(pdata->dev);
>>>>
>>>>           return val & HPD_DEBOUNCED_STATE ? connector_status_connected
>>>>                                            : connector_status_disconnected;
>>>> @@ -1220,6 +1236,20 @@ static void ti_sn65dsi86_debugfs_init(struct drm_bridge *bridge, struct dentry *
>>>>           debugfs_create_file("status", 0600, debugfs, pdata, &status_fops);
>>>>    }
>>>>
>>>> +static void ti_sn_bridge_hpd_enable(struct drm_bridge *bridge)
>>>> +{
>>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>> +
>>>> +       pm_runtime_get_sync(pdata->dev);
>>>> +}
>>>> +
>>>> +static void ti_sn_bridge_hpd_disable(struct drm_bridge *bridge)
>>>> +{
>>>> +       struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
>>>> +
>>>> +       pm_runtime_put_sync(pdata->dev);
>>>> +}
>>>> +
>>>>    static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>>>>           .attach = ti_sn_bridge_attach,
>>>>           .detach = ti_sn_bridge_detach,
>>>> @@ -1234,6 +1264,8 @@ static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
>>>>           .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
>>>>           .atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
>>>>           .debugfs_init = ti_sn65dsi86_debugfs_init,
>>>> +       .hpd_enable = ti_sn_bridge_hpd_enable,
>>>> +       .hpd_disable = ti_sn_bridge_hpd_disable,
>>>>    };
>>>>
>>>>    static void ti_sn_bridge_parse_lanes(struct ti_sn65dsi86 *pdata,
>>>> @@ -1322,7 +1354,8 @@ static int ti_sn_bridge_probe(struct auxiliary_device *adev,
>>>>                              ? DRM_MODE_CONNECTOR_DisplayPort : DRM_MODE_CONNECTOR_eDP;
>>>>
>>>>           if (pdata->bridge.type == DRM_MODE_CONNECTOR_DisplayPort)
>>>> -               pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT;
>>>> +               pdata->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_DETECT |
>>>> +                                   DRM_BRIDGE_OP_HPD;
>>>
>>> I think you also need this in the "DRM_MODE_CONNECTOR_DisplayPort" if test:
>>>
>>> /*
>>>    * If comms were already enabled they would have been enabled
>>>    * with the wrong value of HPD_DISABLE. Update it now. Comms
>>>    * could be enabled if anyone is holding a pm_runtime reference
>>>    * (like if a GPIO is in use). Note that in most cases nobody
>>>    * is doing AUX channel xfers before the bridge is added so
>>>    * HPD doesn't _really_ matter then. The only exception is in
>>>    * the eDP case where the panel wants to read the EDID before
>>>    * the bridge is added. We always consistently have HPD disabled
>>>    * for eDP.
>>>    */
>>> mutex_lock(&pdata->comms_mutex);
>>> if (pdata->comms_enabled)
>>>     regmap_update_bits(pdata->regmap, SN_HPD_DISABLE_REG,
>>>       HPD_DISABLE, 0);
>>> mutex_unlock(&pdata->comms_mutex);
>>>
>>> Does that sound right?
>>
>>
>> Here I don't think it is necessary to add this because enable_comms
>> will be called again after probe either in hpd_enable() (in case
>> refclk exist) or pre_enable() (in case it doesn't) with correct value.
> 
> I don't think that's necessarily true, is it? From my memory, this happens:
> 
> 1. Main driver probe and we create the sub-devices, like the GPIO,
> backlight, and AUX.
> 
> 2. As soon as the GPIO probe happens, someone could conceivably claim
> one of the GPIOs and set it as an output, which would cause a
> "pm_runtime" reference to be held indefinitely.

I did not consider this.

> 
> 3. After AUX probes, we create the bridge sub-device.
> 
> 4. When the bridge probe runs, comms will still be enabled because the
> "pm_runtime" reference keeps them on.
> 
> ...there's also the issue that we use "autosuspend" and thus comms can
> still be left on for a chunk of time even after there are no
> "pm_runtime" references left.


It makes sense.

I will add this change, edit a couple of comments mentioned and make
suspend asynchronous as suggested by Tomi (mark_last_bit and
put_autosuspend) in next revision.

Thanks,
Jayesh


> 
> -Doug
