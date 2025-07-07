Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5AEA28D859;
	Mon,  7 Jul 2025 09:23:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751880181; cv=none; b=is81kffGWXUwPMG2Sicd0FjxQ4I18LEkI0zf/LRXjvzekG4C15s8xKFJuDdGvleL/7406qOyvMFRWz+ntR4a7O4U/mnBY6GUHT1eCOKaQRQTUe1xgrbgme0tqiOmw2C/G7o/KhHPgKAGjCydQumkMA8F5AlJ1pMrcGISVWFcQ9U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751880181; c=relaxed/simple;
	bh=sns9z6OCwkZpcpSCNwsDZdvlILaetOPPPX1p1HzOqt0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RDAFb2/zL24cMklzF4ZUhxfTOrjOeWOoSBWMRmztfQg6VWkLpxMwwJq/wL3l8nskS4zQjgbKX1VlNI+jRnyTaQT//A54ACURGU8lU1czM3aPzFJASoyUaXaauzxoByQY0wNdag2duX+JK0E0EHd7DFn5V5xiRfznLEQHk8wN228=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qua2lj5z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qua2lj5z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39979C4CEE3;
	Mon,  7 Jul 2025 09:22:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751880180;
	bh=sns9z6OCwkZpcpSCNwsDZdvlILaetOPPPX1p1HzOqt0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Qua2lj5zCCNINLg5Cj9DVcEYbvQ2buT2f6+jsRKi2p77BxJFmFO+hg3y8eYTh3niv
	 2mDWYID+wtUbQtNo7rhUrxicex93QJ37+ZdWA9EDP0uHTUB+jaaMf8lnOyU4J34sG/
	 cJrDpKa6bHXqK521a8abNmAO93e9bFyr5wUKAlKRpefWGehkLjx5GhGpKF3PlpZ3sg
	 N4T6Vtx4/sD9usli5N+4O+0Yxiz3PPC121i8TvCh2zQeT7beQO1qYayvexvJxoCXZk
	 LG8z+XIU8Ny/W+Wu4nx7xA04ZmY0oTvRyNs7Fwp9tfbqNYi2GxZmRHAPgD4ATNa2M8
	 saMqo9gjvmO5Q==
Message-ID: <ab1b00a0-3449-499c-ab6f-2f0f98895eee@kernel.org>
Date: Mon, 7 Jul 2025 11:22:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: lenovo-hotkey: Handle missing hardware
 featuresgracefully
To: Jackie Dong <xy-jackie@139.com>, Mark Pearson
 <mpearson-lenovo@squebb.ca>, Armin Wolf <W_Armin@gmx.de>,
 Kurt Borja <kuurtb@gmail.com>, alireza.bestboyy@gmail.com, atescula@gmail.com
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250627195436.3877-1-W_Armin@gmx.de>
 <DAXLSMRH9E6Y.3Q8Z59YG2B50C@gmail.com>
 <fb08672d-881b-458c-b8ed-1a27ca93fe7d@gmx.de>
 <DAXMVOI4AXHY.18HUV9THTG0DJ@gmail.com>
 <50361e3c-c947-4df8-97fd-4963d18ee4f2@gmx.de>
 <7f2496e7-7092-46a2-885f-8e8f44fc0af1@app.fastmail.com>
 <92feb1cf-798c-4026-9084-cf90988e1604@139.com>
Content-Language: en-US, nl
From: Hans de Goede <hansg@kernel.org>
In-Reply-To: <92feb1cf-798c-4026-9084-cf90988e1604@139.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Jackie,

On 7-Jul-25 05:03, Jackie Dong wrote:
> On 6/30/25 04:36, Mark Pearson wrote:
>> Hi Armin & Kurt,
>>
>> On Sat, Jun 28, 2025, at 8:01 AM, Armin Wolf wrote:
>>> Am 27.06.25 um 23:29 schrieb Kurt Borja:
>>>
>>>> On Fri Jun 27, 2025 at 6:17 PM -03, Armin Wolf wrote:
>>>>> Am 27.06.25 um 22:38 schrieb Kurt Borja:
>>>>>
>>>>>> Hi Armin,
>>>>>>
>>>>>> On Fri Jun 27, 2025 at 4:54 PM -03, Armin Wolf wrote:
>>>>>>> Not all devices support audio mute and microphone mute LEDs, so the
>>>>>>> explicitly checks for hardware support while probing. However missing
>>>>>>> hardware features are treated as errors, causing the driver so fail
>>>>>>> probing on devices that do not support both LEDs.
>>>>>>>
>>>>>>> Fix this by simply ignoring hardware features that are not present.
>>>>>>> This way the driver will properly load on devices not supporting both
>>>>>>> LEDs and will stop throwing error messages on devices with no LEDS
>>>>>>> at all.
>>>>>> This patch makes me wonder what is the policy around issues like this.
>>>>>> In fact I've submitted and changes that do the exact opposite :p
>>>>>> Like commit: 4630b99d2e93 ("platform/x86: dell-pc: Propagate errors when
>>>>>> detecting feature support")
>>>>>>
>>>>>> IMO missing features should be treated as errors. i.e. The probe should
>>>>>> fail.
>>>>> IMHO the probe should only fail if some features are deemed essential, like
>>>>> required ACPI methods. Optional features like in this case LEDs should be
>>>>> handled by the driver in a graceful manner if possible.
>>>>>
>>>>>> Quoting documentation [1]:
>>>>>>
>>>>>>     If a match is found, the device’s driver field is set to the
>>>>>>     driver and the driver’s probe callback is called. This gives the
>>>>>>     driver a chance to verify that it really does support the
>>>>>>     hardware, and that it’s in a working state.
>>>>>>
>>>>>> And again [2]:
>>>>>>
>>>>>>     This callback holds the driver-specific logic to bind the driver
>>>>>>     to a given device. That includes verifying that the device is
>>>>>>     present, that it’s a version the driver can handle, that driver
>>>>>>     data structures can be allocated and initialized, and that any
>>>>>>     hardware can be initialized.
>>>>>>
>>>>>> Both of these makes me wonder if such a "fail" or error message should
>>>>>> be fixed in the first place. In this case the probe correctly checks for
>>>>>> device support and fails if it's not found, which is suggested to be the
>>>>>> correct behavior.
>>>>> The driver should only fail probing if it cannot handle some missing features.
>>>>> In this case however both features (audio mute LED and mic mute LED) are completely
>>>>> optional and the driver should not fail to load just because one of them is absent.
>>>> I agree, both are individually optional, but at least one should be
>>>> required.
>>>>
>>>>> Just think about machines supporting only a single LED (audio or mic mute). Currently
>>>>> the driver would fail to load on such devices leaving the users with nothing.
>>>> That's very true.
>>>>
>>>> But I do still think if both fail the probe should still fail. Maybe
>>>> there is a way to accomplish this?
>>>>
>>>> I'm thinking of something like
>>>>
>>>> if (lenovo_super_hotkey_wmi_led_init(MIC_MUTE, dev) ||
>>>>       lenovo_super_hotkey_wmi_led_init(AUDIO_MUTE, dev))
>>>>       return -ENODEV;
>>>>
>>>> What do you think?
>>>
>>> Normally i would agree to such a thing, but in this case the underlying
>>> WMI device
>>> supports many more functions that are currently not supported by this
>>> driver. Additionally
>>> the driver cannot control when the WMI device is registered, so it has
>>> to be prepared to
>>> encounter a device without the features it supports.
>>>
>>> Also keep in mind that a failing probe attempt produces a irritating
>>> error message.
>>>
>>>>>> BTW this also leaks `wpriv`, which would remain allocated for no reason.
>>>>> wpriv will be freed using devres, so no memory leak here. However i admit that there is
>>>>> some room for optimizations, however i leave this to the maintainer of the driver in
>>>>> question.
>>>> Leak was a bit of an overstatement :) But if both features are missing
>>>> it would be kinda leaked, in practice.
>>>
>>> I see, however i would leave this to the maintainer of the driver
>>> because i have no hardware
>>> to test the resulting patches :/.
>>>
>>
>> As a note, I'm on vacation for three weeks and avoiding accessing work emails, so won't be able to discuss this with Jackie properly until I'm back.
>>
>> For history/context - this particular driver was a bit of a oddity as the Ideapads aren't in the Lenovo Linux program (hope they will be one day). We had a Thinkbook that is using the same LUDS interface, that we were Linux certifying, and LED support is a requirement to work.
>>
>> I do think this needs revisiting a bit. I am leaning to agreeing that it shouldn't error out - but we were also being careful to not have this cause problems on HW we ourselves don't have access to. It would be nice if it could be extended to more platforms though.
>>
>> I don't have the specs handy right now (would need to go on the Lenovo VPN for that). Is it OK if we re-visit this when I'm back at home and working?
>> Jackie - please do have a look and think about this in the meantime.
>>
>> Mark
>>
>>
> Hi Kurt, Armin, Mark,
>    I have reviewed the Lenovo Keyboard WMI Specification and find GetIfSupportOrVersion method has defined that Output parameters define: 0 is not support, Non-zero is support.
>    As you have noted in previous mail, not all of Lenovo ideapad brand laptop support both mic mute LED(on F4) and audio mute LED(on F1). Some of them only support one mute LED, some of them don't have any mute LED. So, I think that the below codes should be work to handle it. I have verified the below codes on Lenovo Yoga Pro7 14APH8(MachineType 82Y8) which is only support mic mute LED. In fact, I have gotten user mail which describe the same issue on Lenovo Yoga Pro7 14APH8 with https://bugzilla.kernel.org/show_bug.cgi?id=220271 which reported this issue on MachineType: 81Y3.
>    If you have any comment, let me know, I'll update the below patch and submit it later.
> 
> diff --git a/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> b/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> index 89153afd7015..47f5ee34ea71 100644
> --- a/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> +++ b/drivers/platform/x86/lenovo-wmi-hotkey-utilities.c
> @@ -122,8 +122,13 @@ static int lenovo_super_hotkey_wmi_led_init(enum
> mute_led_type led_type, struct
>           return -EIO;
> 
>       union acpi_object *obj __free(kfree) = output.pointer;
> -    if (obj && obj->type == ACPI_TYPE_INTEGER)
> +    if (obj && obj->type == ACPI_TYPE_INTEGER) {
>           led_version = obj->integer.value;
> +
> +        /*Output parameters define: 0 is not support, Non-zero is support*/
> +        if (led_version == 0 )
> +            return 0;
> +    }
>       else
>           return -EIO;
> 

Thank you that seems like a good change / fix.

We should probably also change this:

        case MIC_MUTE:
                if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER)
                        return -EIO;

into logging a warning and then returning 0 and the same here:

        case AUDIO_MUTE:
                if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER)
                        return -EIO;

Regards,

Hans


