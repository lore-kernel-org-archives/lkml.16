Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F33021E0DCB
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743418157; cv=none; b=JzfGI4EDrIVK7ajEVpKEbiVFDbqLP1mLbbgqkZcIGPk4jSQp4OC5SyKeIY53DdRcLXZa6ycRzY+fw2zlK/+58sTFwg2e5KMLfFmx8SBNrfWXov9GBTIUC5gEhmljjaslcmLkk9hCTsCU+kKhbhFTMUaH+TYz5/dN2FoPiz6386s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743418157; c=relaxed/simple;
	bh=OFoAFh3Rfm0ne0UDVjjyzJHRLGMGFFgCRUQhoRUSePU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mk8Or0ZL3Syk3FtQimFFMuXwHZwswuM2RmynWNaAkXRs0tGK1mTnZb2YCMIUxye/QrxCItwsgIszhvAvujs1wIFR4RwLBZHwTLDQOConnWpbhGxmorYVRvPbMrAcA2aT4vzvKl6wjSr3MFEfT1lqvmSuVapbDON/1mzkEQqPxZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=k6y7LAuh; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="k6y7LAuh"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5eb92df4fcbso7832218a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 03:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743418153; x=1744022953; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c0QEkigxnrAsvdwQl3dGicqkYGDNN3IH7OubpsJnt9k=;
        b=k6y7LAuh0ykcRdHcsOao+Q4uVDR7A6V9x/iiy9ilC8HiiPOY+KM1VuxwHMB/r5QFd4
         JS8YZjehMMc+5k4u8s8tXdelkS79ciU1xeDIm9ocAZL1qS6QwZh57l83VD7/Jbmdxrny
         LW03K3f4fC2O/gydW0UmMsz7R0AI/HDuBaXFBkoBT+5Ga1cpG1juxGQ5ZawJDLjwvycd
         Mo/ceDB0eHvUNwy0jhVBNWJsxrVbF11xa/dGMJ4aWxlWhsrYhUN3xSErMNBxhJ+j7dAa
         ge1eUfKOI0Aasa0J7KtybFuoHMNrBy0ZsSjwnT+XW8/YbxSVyJ4vHWJ1Mny1kDrHclPQ
         PZvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743418153; x=1744022953;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=c0QEkigxnrAsvdwQl3dGicqkYGDNN3IH7OubpsJnt9k=;
        b=fZd5KLsRydVaQMJwqHVQROLtTvuAZakWMCHWfQbEEMJrujV456NsqhsFaD7LpH3JBr
         zrFa9sf3nRVHrazaJQwS9kdAVhT3Y8S6xzGlG1QilTyDzV/ybOMuREx/MRZX2LKpMfkS
         IRPYzJjxuc3g+Ua4EgykFraVxuf9DFdLtZqOIzXU/U+wYrxzhltGKV0nF29ZaU5S4JBu
         Xd/C72j8b+ppB7ZAj3Q589sa/ohUPktgqxLcKKkojL29gPI7oYJqCW4GIe34XbpZ+j+A
         pcgI8EXC46gUfUq19AKqQ1y7vXjk2RW4iQOet3P3cLMydMmHXoL/+8MZLikL229/VVui
         jOuA==
X-Forwarded-Encrypted: i=1; AJvYcCVNuZWCWg+PPdgQciO8d+GQbaGWvxeB/b9KxylZltEJBkvy4lVHo+BKFc+e6wcriHc5OIJEmtEszyV88pk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyalMwh8QJLfbxTdQQAIh/N+CUbt+FizhuQvZTYXngLjSlDWgyK
	IOEX+42Z8L9AziijBIZ+a0VnHl/BbdJ+AcYedAiwteb2l9X+oIiZ
X-Gm-Gg: ASbGncvHIavd3AZ9JT27yquDROcq5wOefwor7YkM38HWTxW8kQaF9nrUpIIcbF4VAz/
	BN9chgrBBfrwQG+oNpILPGedsbDzHQgNU/1JcUG3dTA/IxD326/4yboVs417KxyC6VbXXpKx8lk
	DWkdF4dkUDvfuqS2XXqLQHkiz/iTyO3SRcLWYYylsrwwQ0FqP1VTN6ppDEqWrySZLdzpqH+WAeX
	J7QApByCxHLRZk6bCt2Mix0YOBXywXizNYN4AUxBdZk0dJeXSULGj0QB1dGQnemAjhCWqOFtEEb
	p4rkgsjhxshmu6jzbfS0AjCmt81MgtTdpA4fodXbHtmTLP6YRN2FU932RYeZTEtdGMKPOSXMBzF
	kaJ1s8e552QX/uav69teLIQ==
X-Google-Smtp-Source: AGHT+IExNc31c41BbISsW9XpDeKOepiJ5uHzTczSJT3omja3K34U2u+1pGMGZbNe8NadyH+bzVIGmA==
X-Received: by 2002:a05:6402:27d0:b0:5e0:4276:c39e with SMTP id 4fb4d7f45d1cf-5edfdbff01emr7562443a12.30.1743418152945;
        Mon, 31 Mar 2025 03:49:12 -0700 (PDT)
Received: from [192.168.1.18] (146.10-240-81.adsl-dyn.isp.belgacom.be. [81.240.10.146])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5edc17e0042sm5472225a12.80.2025.03.31.03.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 03:49:12 -0700 (PDT)
Message-ID: <edf101e3-c638-45fa-8f5d-48247b9e0c9d@gmail.com>
Date: Mon, 31 Mar 2025 12:49:11 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/panfrost: Add PM runtime flags
To: Steven Price <steven.price@arm.com>,
 Andre Przywara <andre.przywara@arm.com>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Philipp Zabel <p.zabel@pengutronix.de>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev,
 =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
References: <20250312232319.25712-1-simons.philippe@gmail.com>
 <20250312232319.25712-2-simons.philippe@gmail.com>
 <20250327123628.3d33c68e@donnerap.manchester.arm.com>
 <d102aa1b-61cf-4dcc-851e-fc56adf9fab8@arm.com>
Content-Language: en-US
From: Philippe Simons <simons.philippe@gmail.com>
In-Reply-To: <d102aa1b-61cf-4dcc-851e-fc56adf9fab8@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit


On 3/31/25 12:32, Steven Price wrote:
> On 27/03/2025 12:36, Andre Przywara wrote:
>> On Thu, 13 Mar 2025 00:23:18 +0100
>> Philippe Simons <simons.philippe@gmail.com> wrote:
>>
>> Hi Rob, Boris, Steven,
>>
>>> When the GPU is the only device attached to a single power domain,
>>> core genpd disable and enable it when gpu enter and leave runtime suspend.
>>>
>>> Some power-domain requires a sequence before disabled,
>>> and the reverse when enabled.
>>>
>>> Add PM flags for CLK and RST, and implement in
>>> panfrost_device_runtime_suspend/resume.
>> So some Mali configuration and integration manual I am looking at says
>> that this sequence should be always observed, as the powerdown sequence
>> would include disabling the clocks first, then asserting the reset, then
>> turning the power switches off (and the inverse sequence on powerup).
>>
>> So should we make this unconditional, not depending on implementation
>> specific flags?
> I think you're right, this probably should be unconditional. My only
> reservation is that "it works" currently and we'd need to test this
> doesn't cause regressions on existing platforms. So unless someone with
> a reasonable board farm is able to do that testing I think this solution
> is reasonable. So:

Should I merge both flags together then ? something like GPU_PM_RT ?

>
> Reviewed-by: Steven Price <steven.price@arm.com>
>
>> And also I am wondering if panfrost_device_init() gets this wrong as well?
>> As I see it enabling clock first, then reset, then pm_domain, where it
>> should be exactly the opposite?
> I agree, that looks very wrong - the power needs to be enabled before
> reset is deasserted. I'm somewhat surprised we've got away with that.
> Fancy writing a patch? ;)
>
> Steve
>
>> Cheers,
>> Andre
>>
>>> Signed-off-by: Philippe Simons <simons.philippe@gmail.com>
>>> ---
>>>   drivers/gpu/drm/panfrost/panfrost_device.c | 37 ++++++++++++++++++++++
>>>   drivers/gpu/drm/panfrost/panfrost_device.h |  4 +++
>>>   2 files changed, 41 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.c b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> index a45e4addcc19..189ad2ad2b32 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.c
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.c
>>> @@ -406,11 +406,38 @@ void panfrost_device_reset(struct panfrost_device *pfdev)
>>>   static int panfrost_device_runtime_resume(struct device *dev)
>>>   {
>>>   	struct panfrost_device *pfdev = dev_get_drvdata(dev);
>>> +	int ret;
>>> +
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT)) {
>>> +		ret = reset_control_deassert(pfdev->rstc);
>>> +		if (ret)
>>> +			return ret;
>>> +	}
>>> +
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
>>> +		ret = clk_enable(pfdev->clock);
>>> +		if (ret)
>>> +			goto err_clk;
>>> +
>>> +		if (pfdev->bus_clock) {
>>> +			ret = clk_enable(pfdev->bus_clock);
>>> +			if (ret)
>>> +				goto err_bus_clk;
>>> +		}
>>> +	}
>>>   
>>>   	panfrost_device_reset(pfdev);
>>>   	panfrost_devfreq_resume(pfdev);
>>>   
>>>   	return 0;
>>> +
>>> +err_bus_clk:
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS))
>>> +		clk_disable(pfdev->clock);
>>> +err_clk:
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
>>> +		reset_control_assert(pfdev->rstc);
>>> +	return ret;
>>>   }
>>>   
>>>   static int panfrost_device_runtime_suspend(struct device *dev)
>>> @@ -426,6 +453,16 @@ static int panfrost_device_runtime_suspend(struct device *dev)
>>>   	panfrost_gpu_suspend_irq(pfdev);
>>>   	panfrost_gpu_power_off(pfdev);
>>>   
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_CLK_DIS)) {
>>> +		if (pfdev->bus_clock)
>>> +			clk_disable(pfdev->bus_clock);
>>> +
>>> +		clk_disable(pfdev->clock);
>>> +	}
>>> +
>>> +	if (pfdev->comp->pm_features & BIT(GPU_PM_RT_RST_ASRT))
>>> +		reset_control_assert(pfdev->rstc);
>>> +
>>>   	return 0;
>>>   }
>>>   
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_device.h b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> index cffcb0ac7c11..f372d4819262 100644
>>> --- a/drivers/gpu/drm/panfrost/panfrost_device.h
>>> +++ b/drivers/gpu/drm/panfrost/panfrost_device.h
>>> @@ -36,10 +36,14 @@ enum panfrost_drv_comp_bits {
>>>    * enum panfrost_gpu_pm - Supported kernel power management features
>>>    * @GPU_PM_CLK_DIS:  Allow disabling clocks during system suspend
>>>    * @GPU_PM_VREG_OFF: Allow turning off regulators during system suspend
>>> + * @GPU_PM_RT_CLK_DIS: Allow disabling clocks during system runtime suspend
>>> + * @GPU_PM_RST_ASRT: Allow asserting the reset control during runtime suspend
>>>    */
>>>   enum panfrost_gpu_pm {
>>>   	GPU_PM_CLK_DIS,
>>>   	GPU_PM_VREG_OFF,
>>> +	GPU_PM_RT_CLK_DIS,
>>> +	GPU_PM_RT_RST_ASRT
>>>   };
>>>   
>>>   struct panfrost_features {
