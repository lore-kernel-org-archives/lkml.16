Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA9FA1F4614
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 14:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744726404; cv=none; b=g8Tm4LzcAhdYuK+5HWLEsh/2ZVgm4pRGFktWK7Hp825k/EXSt+ghmjxQ7qWCRJp1ziskMLLH+syxydsSO5dLFr8+Ea2uTp9XBOp7WkLuBlWsmDyNkpJcfvxk2Owerlt+YxsUX8e6nMHu7k7zUwDPs6fz7z+0eqO46dtYD1uZF8s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744726404; c=relaxed/simple;
	bh=NTDmpts2rM03MF2VDOAIWwBPkBuHpY6hBQUlIZt93ms=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=cYFApOykeE2W2OdCmtmt8/pxIq7xNT/bjbHRV+CM2BumTGZoIxP2HklK0DVmPEoistyEe1XXNZ7laDhZtISpA+CIeUngJ53QTov6U4U2Mw+QIazLWhB3ZehoCLmr16nbMNSsFTqp2KMseJ/hKJAU5LnPxpBzeNflDSHAC2wLx9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=DOmca34k; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="DOmca34k"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39141ffa9fcso7310421f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 07:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744726400; x=1745331200; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=;
        b=DOmca34kC4HYvqjeMsHijaLu+qYPlfZhRsy7C6pDDWJ8b2MddUJYicgWSz4gw5Y2o2
         djxaiI1FYZhtmHExMGbZlZ/BqYHqIezv+FA3oWptL2cmB1LSU8bX1aTMP/NhPx59vJ35
         a41AA5uPJGHRg+qDD02QNjnQPHxbMtPFr0tLRzPipQqctBruBYIAu2PK1qVwG/dkIPFX
         oy75nsqyUilAp4RplBh899FJhKtw/P1QGxv0IM90DfRUIwyEMEhJDg9SfHV1weMBmiix
         iW4fCN8GYYt3IBDuhcdcGLssknM66ZxvB8cDD71vrQQ9pSe1S2Z8m86Q9r3EtsPBCYTY
         PTbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744726400; x=1745331200;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ydYIOEVwNexwRxCoclKyzypW+xMmV8cmkPxa2XgUDQE=;
        b=QEBh8AwTKlyh7ozMu1OQhiOLQJDen2w4UhNoOOyHhldNz6CnvGx7StY/bh5+3XRrST
         RkHZdCb07/BszE4BqWNiTFmvPrktJlR2/4XcaE6diPWEOL5OkYhtWhkRFMBZ+Y5xTBlV
         hpddip4ODhqvhiCpQe44yq4sbpdsZURj8mgAiAPQqrw4iW6bKMCxazf2opuIHzggRNHP
         I2Tcdb5AXeUrijF1BsnTv/HFNiqm641X3EjU0RpUjweuo7G+f2Ru0kr1hG7MO10DOIK0
         PHrSKPlozTFZHjxbQnF6ChCili5Vja+3SVdB3LUxOy/93efb6R8oY4+QOrb9467srDGs
         wvcw==
X-Forwarded-Encrypted: i=1; AJvYcCWTeYSAUU+hHj6QHjsSZijjTl54/uqP31CsHGxG6pQgxwmUKAUnaGFWrHqRXT9Omk1YtjopIoBORyXUAoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWf6IgZmirsF/sAGuGqeaG2dONhfDl2/fTqiNyOBCbriYT/Zhp
	g23bwmuBSknZkL5xKyn5f5XQ4ChG9MGJoRqnmTuyHZkZhGI8yOkVxJni/SPsvrM=
X-Gm-Gg: ASbGnctTMGjRG3YIbuDIbv8hkqnnY07CXmMq8UADK94jpt6WAt3GNh/R2yJtIJ5RNCK
	tcdFzYqp2vvPq5voc0oqABnol8vV6CVm5L1fsSwHzHBYQBUrTAUmfs5Y5cVGZ4VZFZGIKA4MFs/
	L1RIf/JXJ33EUmgle1Fpt90tlm/+duOguwL7PZEgQBeVfEiz5R8aIm+RBk2eyBpzaaYRZ6GU7VS
	QEbqakZUlL1LjBeWfMR+04YQJYJ6lyubqFhsLTR+EXqSHykxV6cFNoMEY77/ZrO8clweQObsB9L
	hDjj/fwbOmOfDn6WuBCGNxuXi3iR6LG2yq4/ftvbEI98UCfA/bfnVGeYKqI22bsq1K8MVFFB
X-Google-Smtp-Source: AGHT+IHJqCY80YdOi+QlRhbGQ2nBFJTmvFU9QJ/edLr9k+dp/3F0x7XFYeygRdayk8s5vjatDuOCHg==
X-Received: by 2002:a05:6000:1aca:b0:39a:ca59:a626 with SMTP id ffacd0b85a97d-39ea5211c2amr13165981f8f.28.1744726399630;
        Tue, 15 Apr 2025 07:13:19 -0700 (PDT)
Received: from [10.1.5.76] (88-127-129-70.subs.proxad.net. [88.127.129.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f23572d43sm205220905e9.31.2025.04.15.07.13.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 07:13:19 -0700 (PDT)
Message-ID: <1ed38e6b-8d43-4cbc-9c27-58ec3c0e4dbc@baylibre.com>
Date: Tue, 15 Apr 2025 16:13:18 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/3] drm/panel: startek-kd070fhfid015: add another init
 step
From: Alexandre Mergnat <amergnat@baylibre.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org
References: <20231023-display-support-v8-0-c2dd7b0fb2bd@baylibre.com>
 <20231023-display-support-v8-2-c2dd7b0fb2bd@baylibre.com>
 <d70b62f8-e24e-4a10-8c6b-18d2e19f1337@collabora.com>
 <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Content-Language: en-US
In-Reply-To: <fb72f1f5-dc94-4e33-a20c-d46a081091bc@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Angelo,

Gentle ping

Let me shortly summarize my problem: I see the panel driver sending commands to the display before 
it is ready. My approach to prevent that is to delay sending commands until bridge enable. Your 
concern was that during the panel's .prepare() the panel driver should already be able to send 
commands through the bridge. Can you please clarify what you think should be the approach to fix that?

Regards,
Alexandre

On 21/03/2025 10:19, Alexandre Mergnat wrote:
> Hi Angelo,
> Thanks for the fast feedback :)
> 
> On 20/03/2025 13:37, AngeloGioacchino Del Regno wrote:
>> Il 20/03/25 09:48, Alexandre Mergnat ha scritto:
>>> Currently, the panel set power, set gpio and enable the display link
>>> in stk_panel_prepare, pointed by drm_panel_funcs.prepare, called by
>>> panel_bridge_atomic_pre_enable, pointed by
>>> drm_bridge_funcs.atomic_pre_enable. According to the drm_bridge.h,
>>> atomic_pre_enable must not enable the display link
>>>
>>> Since the DSI driver is properly inited by the DRM, the panel try to
>>> communicate with the panel before DSI is powered on.
>>>
>>
>> The panel driver shall still be able to send commands in the .prepare() callback
>> and if this is not happening anymore... well, there's a problem!
> 
> Sorry I don't think so, according to that def:
>      /**
>       * @pre_enable:
>       *
>       * This callback should enable the bridge. It is called right before
>       * the preceding element in the display pipe is enabled. If the
>       * preceding element is a bridge this means it's called before that
>       * bridge's @pre_enable function. If the preceding element is a
>       * &drm_encoder it's called right before the encoder's
>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>       * &drm_encoder_helper_funcs.dpms hook.
>       *
>       * The display pipe (i.e. clocks and timing signals) feeding this bridge
>       * will not yet be running when this callback is called. The bridge must
>       * not enable the display link feeding the next bridge in the chain (if
>       * there is one) when this callback is called.
>       *
>       * The @pre_enable callback is optional.
>       *
>       * NOTE:
>       *
>       * This is deprecated, do not use!
>       * New drivers shall use &drm_bridge_funcs.atomic_pre_enable.
>       */
>      void (*pre_enable)(struct drm_bridge *bridge);
> 
>      /**
>       * @enable:
>       *
>       * This callback should enable the bridge. It is called right after
>       * the preceding element in the display pipe is enabled. If the
>       * preceding element is a bridge this means it's called after that
>       * bridge's @enable function. If the preceding element is a
>       * &drm_encoder it's called right after the encoder's
>       * &drm_encoder_helper_funcs.enable, &drm_encoder_helper_funcs.commit or
>       * &drm_encoder_helper_funcs.dpms hook.
>       *
>       * The bridge can assume that the display pipe (i.e. clocks and timing
>       * signals) feeding it is running when this callback is called. This
>       * callback must enable the display link feeding the next bridge in the
>       * chain if there is one.
>       *
>       * The @enable callback is optional.
>       *
>       * NOTE:
>       *
>       * This is deprecated, do not use!
>       * New drivers shall use &drm_bridge_funcs.atomic_enable.
>       */
>      void (*enable)(struct drm_bridge *bridge);
> 
> => "The bridge must not enable the display link feeding the next bridge in the
> => chain (if there is one) when this callback is called."
> 
> Additionally, you ask for something impossible because here is the init order
> fixed by the framework:
> 
> [   10.753139] panel_bridge_atomic_pre_enable
> [   10.963505] mtk_dsi_bridge_atomic_pre_enable
> [   10.963518] mtk_dsi_bridge_atomic_enable
> [   10.963527] panel_bridge_atomic_enable
> [   10.963532] drm_panel_enable
> 
> If panel want to use the DSI link in panel_bridge_atomic_pre_enable, nothing
> will happen and  you will get a timeout.
> 
> So, IMHO, this patch make sense.
> 
>>
>>> To solve that, use stk_panel_enable to enable the display link because
>>> it's called after the mtk_dsi_bridge_atomic_pre_enable which is power
>>> on the DSI.
>>>
>>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>>> ---
>>>   .../gpu/drm/panel/panel-startek-kd070fhfid015.c    | 25 +++++++++++++---------
>>>   1 file changed, 15 insertions(+), 10 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c 
>>> b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> index c0c95355b7435..bc3c4038bf4f5 100644
>>> --- a/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> +++ b/drivers/gpu/drm/panel/panel-startek-kd070fhfid015.c
>>> @@ -135,19 +135,9 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>       gpiod_set_value(stk->enable_gpio, 1);
>>>       mdelay(20);
>>>       gpiod_set_value(stk->reset_gpio, 1);
>>> -    mdelay(10);
>>> -    ret = stk_panel_init(stk);
>>> -    if (ret < 0)
>>> -        goto poweroff;
>>
>> Also, you're moving both init and set_display_on to the enable callback...
>> this is suboptimal.
>>
>> You should do the DrIC setup in .prepare() (can include SLEEP OUT), and then you
>> should have a .enable() callback that calls DISP ON, a .disable() callback that
>> calls DISP OFF, and .unprepare() that turns everything off.
> 
> This is not what I understand from the pre_enable's definition above, and also
> the function call order by the framework. :)
> 
>>
>> Cheers,
>> Angelo
>>
>>> -
>>> -    ret = stk_panel_on(stk);
>>> -    if (ret < 0)
>>> -        goto poweroff;
>>>       return 0;
>>> -poweroff:
>>> -    regulator_disable(stk->supplies[POWER].consumer);
>>>   iovccoff:
>>>       regulator_disable(stk->supplies[IOVCC].consumer);
>>>       gpiod_set_value(stk->reset_gpio, 0);
>>> @@ -156,6 +146,20 @@ static int stk_panel_prepare(struct drm_panel *panel)
>>>       return ret;
>>>   }
>>> +static int stk_panel_enable(struct drm_panel *panel)
>>> +{
>>> +    struct stk_panel *stk = to_stk_panel(panel);
>>> +    int ret;
>>> +
>>> +    ret = stk_panel_init(stk);
>>> +    if (ret < 0)
>>> +        return ret;
>>> +
>>> +    ret = stk_panel_on(stk);
>>> +
>>> +    return ret;
>>> +}
>>> +
>>>   static const struct drm_display_mode default_mode = {
>>>           .clock = 163204,
>>>           .hdisplay = 1200,
>>> @@ -239,6 +243,7 @@ drm_panel_create_dsi_backlight(struct mipi_dsi_device *dsi)
>>>   }
>>>   static const struct drm_panel_funcs stk_panel_funcs = {
>>> +    .enable = stk_panel_enable,
>>>       .unprepare = stk_panel_unprepare,
>>>       .prepare = stk_panel_prepare,
>>>       .get_modes = stk_panel_get_modes,
>>>
>>
>>
>>
> 

