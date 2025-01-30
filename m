Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FE781BD9CE
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:50:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738234221; cv=none; b=WgRildfuu6TTVPGzX3rwc47lBoveFYM/tsuIdG3YTZr0ugzQlDvtW9RZ7Bjc+pqujv7EfTkmDO4/vVuuhOXtydM58bENwp+QGeE2Yep0fRbHqbIcpFXGIKfiwFhzO45Mp9NHJCXO+YmKhiVzfSy+FLxvB9q71XrwniTNb67GVi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738234221; c=relaxed/simple;
	bh=b/mMBfe5yGAaGHpFmunxqm2ro+eOBQzP6/VLUP04LdU=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=Y6YA5JnVek5uFw/6wXcbzUbVSaLmUN2Tnx/NGv3z4o7JXcf7NTxns0GdBtETkUZUC2Vb7WVvjDJAEqCTQ5ePVwB9g/kAME1Kc5wUI0hmwf6mR01fOtIKq+j9lmkW4BAlFBrvZaKWFuGivUwqopQ38ydk6jPqUnld92Fcry8G0bQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=okVltQAz; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="okVltQAz"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5d3e6f6cf69so1079229a12.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 02:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1738234217; x=1738839017; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e62YlGUXIAw8wozyK1kiiHHdUZMhPFXjOjYgl63mVoA=;
        b=okVltQAzwV1sHpvHR/UTSdG/nwUVINwH1R2vQDO9b88F7y+SiVPslB1SrpcjcuJwZw
         fj4JSTNtu1iEOLv32q/CSldJcMDjpYlacdIdpGMtrWdnbhF+vfxnyMZIp9CfTM5k1gX9
         qRSvaURQ7+Rbf6fzgMVNHUTCVLn7ejUucJnYXVxqCAxabyMEhOuQdSDUmHKIpuScpJZR
         gM4q/WMqIYTRTkwTzbjcLk/mVXIQid9kQOiEzDtPZPnlgdVDJhPTllqQTLEGaIEYtqco
         ZNjrKDJEitCsSXUCWbTYYdpOMmDJXAifKgH7xq3Kgk5DkXbvddmbf1noVdWXqIbe9/L4
         f+hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738234217; x=1738839017;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e62YlGUXIAw8wozyK1kiiHHdUZMhPFXjOjYgl63mVoA=;
        b=HNd50uYwM0/G5bieU9ZA6mKNf+UMNEwBVZ6uDBvJ6E/yQ2UvqNjQmmt+yb6EuW3pjP
         EyavFEQ1GflBJSL1+HPFYDn1CbYKYkPsTrqwV5tRLoTi3Lf9r9hihNYW2lWnj32Gj+X9
         s3hn2yC1jyrN4jdAQfefXkhKJ0qvEfXo7SRRXVNJs0lvYLZS34GsJKhpPQ12AcTU0AEO
         4JBvL7BnlQ0vK5UPR0WJux27pDpe2RMHMLxYJoCyKxSsRYwqtX6vPt7jsQAf4F4mcon5
         YDb/JBe4bmq862rwQQzUDa+qddFgCCXQ1N4g+JfbOVWClfBNaigxzxDJvRopyoc4zk/W
         4vew==
X-Forwarded-Encrypted: i=1; AJvYcCUR/mkvmcF+IwqmNUQ2PFGJpU2qew/miTUWMJjnnVCetpjWZ1kuuSV+aNgzvylAaf5YhBT2NHiVf2izN80=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5UrYdsOCYV61HSDyclkzKOEDYaFhPDF+/BhYfB3nYEve/jnOl
	kGpPEAZ5GyhWwprMG3OyKfB9HMFq/0Yoc4oiSlDCRJdMU3wyXdvFgxtKFzgmLYM=
X-Gm-Gg: ASbGncucW99hm0sca21qUEMhiYhgQcBYS+uhCeYZC9PJ0fGeTcnn0fAR5zleSg8aM2j
	wMRuAizKZwicXRGDbV38NKOrICK3dpnazWTOaTxDFKTu7/khyGHYKBqf9rwltdDXpBxNs1S1pJ2
	i6ygr0Dlpbsv9NN3HxH2kDpGoxvAe5nTpSf8FwY9vhCMcVlYoBDsQnd5NyN0pgb8xjRDs2cPu1H
	04YyLEC98LWjCMtFk8P23m3YsxrvpeVKYpV98V93zZjQ1NM7aScIN+H8nyPZshfqhH4Esjfhzbo
	HKwpgGHQKQNa33ZXqUtGk41z
X-Google-Smtp-Source: AGHT+IHWoNagdbyI+0VCJRCuNUgGA7SE/I4LH2LJrOHgZ3deawOyjrGsdrBIZ5qzd2KNDtUu3ZBA4Q==
X-Received: by 2002:a17:906:178a:b0:ab6:d467:811b with SMTP id a640c23a62f3a-ab6d467849emr482692566b.32.1738234216026;
        Thu, 30 Jan 2025 02:50:16 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a7df0sm100215566b.2.2025.01.30.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 02:50:15 -0800 (PST)
Message-ID: <3d1abbd5-8ca6-4cd3-9800-e9aeda398e86@tuxon.dev>
Date: Thu, 30 Jan 2025 12:50:13 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/6] thermal: of: Export non-devres helper to
 register/unregister thermal zone
From: Claudiu Beznea <claudiu.beznea@tuxon.dev>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: rafael@kernel.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 geert+renesas@glider.be, magnus.damm@gmail.com, mturquette@baylibre.com,
 sboyd@kernel.org, p.zabel@pengutronix.de, ulf.hansson@linaro.org,
 linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20250103163805.1775705-1-claudiu.beznea.uj@bp.renesas.com>
 <20250103163805.1775705-3-claudiu.beznea.uj@bp.renesas.com>
 <Z5pkUNNvsWPjRQvy@mai.linaro.org>
 <65a16c3f-456e-40ec-91b0-afb57269ed46@tuxon.dev>
 <Z5tPR_tv7vWDkUI7@mai.linaro.org>
 <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Language: en-US
In-Reply-To: <6ed7d545-82d7-4bca-95ec-95447586bb58@tuxon.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 30.01.2025 12:30, Claudiu Beznea wrote:
> 
> 
> On 30.01.2025 12:07, Daniel Lezcano wrote:
>> On Thu, Jan 30, 2025 at 11:08:03AM +0200, Claudiu Beznea wrote:
>>> Hi, Daniel,
>>>
>>> On 29.01.2025 19:24, Daniel Lezcano wrote:
>>>> Hi Claudiu,
>>>>
>>>> On Fri, Jan 03, 2025 at 06:38:01PM +0200, Claudiu wrote:
>>>>> From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>>>
>>>>> On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
>>>>> clocks are managed through PM domains. These PM domains, registered on
>>>>> behalf of the clock controller driver, are configured with
>>>>> GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
>>>>> clocks are enabled/disabled using runtime PM APIs.
>>>>>
>>>>> During probe, devices are attached to the PM domain controlling their
>>>>> clocks. Similarly, during removal, devices are detached from the PM domain.
>>>>>
>>>>> The detachment call stack is as follows:
>>>>>
>>>>> device_driver_detach() ->
>>>>>   device_release_driver_internal() ->
>>>>>     __device_release_driver() ->
>>>>>       device_remove() ->
>>>>>         platform_remove() ->
>>>>> 	  dev_pm_domain_detach()
>>>>>
>>>>> In the upcoming Renesas RZ/G3S thermal driver, the
>>>>> struct thermal_zone_device_ops::change_mode API is implemented to
>>>>> start/stop the thermal sensor unit. Register settings are updated within
>>>>> the change_mode API.
>>>>>
>>>>> In case devres helpers are used for thermal zone register/unregister the
>>>>> struct thermal_zone_device_ops::change_mode API is invoked when the
>>>>> driver is unbound. The identified call stack is as follows:
>>>>>
>>>>> device_driver_detach() ->
>>>>>   device_release_driver_internal() ->
>>>>>     device_unbind_cleanup() ->
>>>>>       devres_release_all() ->
>>>>>         devm_thermal_of_zone_release() ->
>>>>> 	  thermal_zone_device_disable() ->
>>>>> 	    thermal_zone_device_set_mode() ->
>>>>> 	      rzg3s_thermal_change_mode()
>>>>>
>>>>> The device_unbind_cleanup() function is called after the thermal device is
>>>>> detached from the PM domain (via dev_pm_domain_detach()).
>>>>>
>>>>> The rzg3s_thermal_change_mode() implementation calls
>>>>> pm_runtime_resume_and_get()/pm_runtime_put_autosuspend() before/after
>>>>> accessing the registers. However, during the unbind scenario, the
>>>>> devm_thermal_of_zone_release() is invoked after dev_pm_domain_detach().
>>>>> Consequently, the clocks are not enabled, as the device is removed from
>>>>> the PM domain at this time, leading to an Asynchronous SError Interrupt.
>>>>> The system cannot be used after this.
>>>>
>>>> I've been through the driver before responding to this change. What is the
>>>> benefit of powering down / up (or clock off / on) the thermal sensor when
>>>> reading the temperature ?
>>>>
>>>> I can understand for disable / enable but I don't get for the classic usage
>>>> where a governor will be reading the temperature regularly.
>>>
>>> I tried to be as power saving as possible both at runtime and after the IP
>>> is not used anymore as the HW manual doesn't mentioned anything about
>>> accuracy or implications of disabling the IP clock at runtime. We use
>>> similar approach (of disabling clocks at runtime) for other IPs in the
>>> RZ/G3S SoC as well.
>>>
>>>>
>>>> Would the IP need some cycles to capture the temperature accurately after the
>>>> clock is enabled ?
>>>
>>> There is nothing about this mentioned about this in the HW manual of the
>>> RZ/G3S SoC. The only points mentioned are as described in the driver code:
>>> - wait at least 3us after each IIO channel read
>>> - wait at least 30us after enabling the sensor
>>> - wait at least 50us after setting OE bit in TSU_SM
>>>
>>> For this I chose to have it implemented as proposed.
>>
>> IMO, disabling/enabling the clock between two reads through the pm runtime may
>> not be a good thing, especially if the system enters a thermal situation where
>> it has to mitigate.

If it's not 100% safe I can drop the runtime PM support.

>>
>> Without any testing capturing the temperatures and compare between the always-on
>> and on/off, it is hard to say if it is true or not. Up to you to test that or
>> not. If you think it is fine, then let's go with it.
> 
> I tested it with and w/o the runtime PM and on/off support (so, everything
> ON from the probe) and the reported temperature values were similar.
> 
> Thank you,
> Claudiu
> 
>>  
>>> If any, the HW manual is available here
>>> https://www.renesas.com/en/document/mah/rzg3s-group-users-manual-hardware?r=25458591
>>> (an archive is here; the manual is in Deliverables/r01uh1014ej0110-rzg3s.pdf)
>>>
>>> Thank you for your review,
>>> Claudiu
>>>
>>>>
>>>>> Add thermal_of_zone_register()/thermal_of_zone_unregister(). These will
>>>>> be used in the upcomming RZ/G3S thermal driver.
>>>>>
>>>>> Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
>>>
>>
> 

