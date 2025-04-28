Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658D526E14D
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 14:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745849256; cv=none; b=lU/456zBcO8mfTnFKVEi7ZIXFJBU3uqxQM0psKuUIYn8zET1FyKhCtCXcMIhD7ggXGdttAfn09J9mcCdlmjRaKzHb9aGwCMG8aBBLirQbajJfReG15XpyNbxozLlkHbbeSZhtscV0GRiuyk7aZ8nBK2W85/sTIAkNsiX8A73tqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745849256; c=relaxed/simple;
	bh=ojxf9iTaZAthNq24qolF8mlOzjhqJe77AON67mvXHxU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mBXidyA8f/iOKrRtkdz45CJyM5ykGO6d4JCkHGoWbPwc3IMug4aKmdPuzB1YJ2ACg4tCi1vAeXGyVtcU4Mx70/IPFtGQAZU1OsZLCxIXO4PdDObt337wHUz6GoONeHgvlJynxt5uubeVoM4N1A3EcET2bT4DcO9CnP5Dxw7F5CU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=MgUWU4ZN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="MgUWU4ZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1745849253;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bA0v3eYdEpmTWRY88nR9nOZHpVJtR7HN8yGjEKFpGuY=;
	b=MgUWU4ZN/uWPKOQIF57sjtQw5kGSIfVNDhmWEyf3c0AYLP2hK7URJcAZ4UIq8UIyZwoqm4
	cjFbqxFqegGbIwhfmVDtOyJ1dFXn24QlgxTbSksoYdldPYyui5QavoiyLD7TmM5vBfntIS
	wbODFkCHa5mtP8xITNHJpI/PAKnmgjU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-571-e1Q6_bUeOt2c5MPs50WXLw-1; Mon, 28 Apr 2025 10:07:31 -0400
X-MC-Unique: e1Q6_bUeOt2c5MPs50WXLw-1
X-Mimecast-MFC-AGG-ID: e1Q6_bUeOt2c5MPs50WXLw_1745849251
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-acbbb00099eso449703966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 07:07:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745849250; x=1746454050;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bA0v3eYdEpmTWRY88nR9nOZHpVJtR7HN8yGjEKFpGuY=;
        b=unWMXPctLo2kEh2Mpxh8e69t+mugS7oQbIwWB3glnAofeQiN/O+98/Mkp5csR+vEus
         1SKkDmglJ5hSSDfpnQgfyljaW13itbNPgadFt1EL19jPOX5lNZEMh1F7ibeRh2HyZv6M
         7Eo9FvR4bkNqR3QMbsXZFWs/0enNZdzyeVU/n/NhC+12Bc1FZr//ol9LI3JRrATdiPMj
         3SZpK/zBmFwmB95f7DnjjW9SKeqsHoZBYGWrB+4ZR4/di7zIsvpWve1rWyXbAnuw+UZU
         YhwePS6Ks0woSWCANUL3H4Z9RgHNFmTyqr2EM/0R+VGklP2qS90k+ypaIW5s4rs6q5ud
         2Dbg==
X-Forwarded-Encrypted: i=1; AJvYcCUNrN6Q9gsJQJN7QEUmGuvKY/tms8BIloS9C3YLICj18i5zY+GJ9xnjy0s7+8h9CxqaLY0ehf/xaDFrMSE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCIbb5Bg65lgzXFSoIKlalVE67+VI32B1Fbb8zIYxr8v1yfno9
	IZ20hLVhSUZ0R7L4eYmMUW5CwjdrZKYNqcSop1QsJZ7aoELw3EHEj65A2dE3FthWSJRvvibExmn
	mn+adLZrQdmvnpipUfzLtkHHjlvWiiXtDanInKWu7tP1SxoN+HerATI7ypLXY1g==
X-Gm-Gg: ASbGncva2AxNRcIZD9OT4NpfMTnclzWXQAZXYn7w1aE/DzD62zrDvKNGI9H0Cmk5SV2
	xZtOxQHmUBTTc5cfxAE01ACvlftcDNrhne0YYdW1NjczX1EYGwp3Ui407Zx2L0MbJHQwzpbEB50
	UIsIN/MDd76Wd1f4x/7xWnOhkFf/5wypHN3nv382UHz/MHl1vM69uwktpROfHwwwCNs9AhLaADo
	FQOSwsMe4q+0ZMp+DheBF5s7di+uhBTvdAOr+0mYcOasCPpiEtOfc4dBdZJtC0+RFvQypUGQ/oR
	LfR046/x0G4bBFU=
X-Received: by 2002:a17:907:1c16:b0:ac7:16f2:e8e5 with SMTP id a640c23a62f3a-ace84b49077mr850052566b.50.1745849250461;
        Mon, 28 Apr 2025 07:07:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH63zIJpYhqZHrbUJxPaTTtNPqybkh/fr8lsxfdZtdXSVTWPFN5zpqGgzNYmrY8Q3Chqqqbcw==
X-Received: by 2002:a17:907:1c16:b0:ac7:16f2:e8e5 with SMTP id a640c23a62f3a-ace84b49077mr850047066b.50.1745849249955;
        Mon, 28 Apr 2025 07:07:29 -0700 (PDT)
Received: from [10.40.98.122] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed705e5sm633202266b.145.2025.04.28.07.07.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Apr 2025 07:07:29 -0700 (PDT)
Message-ID: <f2b15a53-c4a6-4434-9e7b-b231b4054fba@redhat.com>
Date: Mon, 28 Apr 2025 16:07:27 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/8] media: uvcvideo: Factor out gpio functions to its own
 file
To: Ricardo Ribalda <ribalda@chromium.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>,
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-gpio@vger.kernel.org
References: <20250403-uvc-orientation-v1-0-1a0cc595a62d@chromium.org>
 <20250403-uvc-orientation-v1-6-1a0cc595a62d@chromium.org>
 <20250422212824.GQ17813@pendragon.ideasonboard.com>
 <CANiDSCuOaZ9bnd20tGLWzOA7cGA2q+oKdGktvouT-8+cUkHF1w@mail.gmail.com>
 <20250422222517.GU17813@pendragon.ideasonboard.com>
 <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCv3om=6puzMVC0OYAqsKGdH+JJQ-unmizhRmYLyTfKxkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 23-Apr-25 00:35, Ricardo Ribalda wrote:
> On Wed, 23 Apr 2025 at 06:25, Laurent Pinchart
> <laurent.pinchart@ideasonboard.com> wrote:
>>
>> On Wed, Apr 23, 2025 at 06:20:09AM +0800, Ricardo Ribalda wrote:
>>> Hi Laurent
>>>
>>> On Wed, 23 Apr 2025 at 05:28, Laurent Pinchart
>>> <laurent.pinchart@ideasonboard.com> wrote:
>>>>
>>>> Hi Ricardo,
>>>>
>>>> Thank you for the patch.
>>>>
>>>> Hans raised an issue on "[PATCH v3 2/8] media: uvcvideo: Factor out gpio
>>>> functions to its own file" (part of "[PATCH v3 0/8] media: uvcvideo:
>>>> Implement the Privacy GPIO as a evdev"), asking if GPIO handling should
>>>> still use a uvc_entity if it moves to a evdev. There are implications on
>>>> this series too. Unless I'm mistaken, I haven't seen a reply from you to
>>>> my last e-mail. Can we please first finish that discussion ?
>>>
>>> Are you referring to:
>>> https://lore.kernel.org/all/0dfb780b-f2dc-43ed-a67d-afd5f50bb88f@redhat.com/
>>> ?
>>
>> I was referring to https://lore.kernel.org/all/20241125214523.GW19381@pendragon.ideasonboard.com/
> 
> I believe the three of us agreed to remove the entity. Am I missing something?

That is what I remember too.

2 other remarks:

1. About this patch, what is this patch doing in *this* series, outside of exporting
uvc_alloc_entity(), I don't think we need this here. So for v2 I would prefer to
have this replaced with a patch just making uvc_alloc_entity() non static.

That avoids unnecessary dependencies between this series and the GPIO privacy control
use evdev series. Any conflicts from exporting uvc_alloc_entity() in this series should
be trivial to fix.

2. About the series making the GPIO privacy control use evdev, if I've understood
things correctly the main motivation for that was power-consumption reasons and with
the granular power management series sitting in uvc/next those reasons are gone ?

It would still be good to move to evdev to unify the userspace API with various
x86 laptop EC/ACPI drivers, but AFAIK this is a somewhat lower priority series to
get merged now because the power-consumption issues are resolved now, right ?

Regards,

Hans



>>>> On Thu, Apr 03, 2025 at 07:16:17PM +0000, Ricardo Ribalda wrote:
>>>>> This is just a refactor patch, no new functionality is added.
>>>>>
>>>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>>>> ---
>>>>>  drivers/media/usb/uvc/Makefile     |   3 +-
>>>>>  drivers/media/usb/uvc/uvc_driver.c | 121 +-----------------------------------
>>>>>  drivers/media/usb/uvc/uvc_gpio.c   | 123 +++++++++++++++++++++++++++++++++++++
>>>>>  drivers/media/usb/uvc/uvcvideo.h   |   6 ++
>>>>>  4 files changed, 133 insertions(+), 120 deletions(-)
>>>>>
>>>>> diff --git a/drivers/media/usb/uvc/Makefile b/drivers/media/usb/uvc/Makefile
>>>>> index 4f9eee4f81ab6436a8b90324a688a149b2c3bcd1..85514b6e538fbb8284e574ca14700f2d749e1a2e 100644
>>>>> --- a/drivers/media/usb/uvc/Makefile
>>>>> +++ b/drivers/media/usb/uvc/Makefile
>>>>> @@ -1,6 +1,7 @@
>>>>>  # SPDX-License-Identifier: GPL-2.0
>>>>>  uvcvideo-objs  := uvc_driver.o uvc_queue.o uvc_v4l2.o uvc_video.o uvc_ctrl.o \
>>>>> -               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o
>>>>> +               uvc_status.o uvc_isight.o uvc_debugfs.o uvc_metadata.o \
>>>>> +               uvc_gpio.o
>>>>>  ifeq ($(CONFIG_MEDIA_CONTROLLER),y)
>>>>>  uvcvideo-objs  += uvc_entity.o
>>>>>  endif
>>>>> diff --git a/drivers/media/usb/uvc/uvc_driver.c b/drivers/media/usb/uvc/uvc_driver.c
>>>>> index da24a655ab68cc0957762f2b67387677c22224d1..b52e1ff401e24f69b867b5e975cda4260463e760 100644
>>>>> --- a/drivers/media/usb/uvc/uvc_driver.c
>>>>> +++ b/drivers/media/usb/uvc/uvc_driver.c
>>>>> @@ -8,7 +8,6 @@
>>>>>
>>>>>  #include <linux/atomic.h>
>>>>>  #include <linux/bits.h>
>>>>> -#include <linux/gpio/consumer.h>
>>>>>  #include <linux/kernel.h>
>>>>>  #include <linux/list.h>
>>>>>  #include <linux/module.h>
>>>>> @@ -792,8 +791,8 @@ static const u8 uvc_media_transport_input_guid[16] =
>>>>>       UVC_GUID_UVC_MEDIA_TRANSPORT_INPUT;
>>>>>  static const u8 uvc_processing_guid[16] = UVC_GUID_UVC_PROCESSING;
>>>>>
>>>>> -static struct uvc_entity *uvc_alloc_entity(u16 type, u16 id,
>>>>> -             unsigned int num_pads, unsigned int extra_size)
>>>>> +struct uvc_entity *u16 type, u16 id, unsigned int num_pads,
>>>>> +                                 unsigned int extra_size)
>>>>>  {
>>>>>       struct uvc_entity *entity;
>>>>>       unsigned int num_inputs;
>>>>> @@ -1242,122 +1241,6 @@ static int uvc_parse_control(struct uvc_device *dev)
>>>>>       return 0;
>>>>>  }
>>>>>
>>>>> -/* -----------------------------------------------------------------------------
>>>>> - * Privacy GPIO
>>>>> - */
>>>>> -
>>>>> -static void uvc_gpio_event(struct uvc_device *dev)
>>>>> -{
>>>>> -     struct uvc_entity *unit = dev->gpio_unit;
>>>>> -     struct uvc_video_chain *chain;
>>>>> -     u8 new_val;
>>>>> -
>>>>> -     if (!unit)
>>>>> -             return;
>>>>> -
>>>>> -     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
>>>>> -
>>>>> -     /* GPIO entities are always on the first chain. */
>>>>> -     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
>>>>> -     uvc_ctrl_status_event(chain, unit->controls, &new_val);
>>>>> -}
>>>>> -
>>>>> -static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
>>>>> -                         u8 cs, void *data, u16 size)
>>>>> -{
>>>>> -     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
>>>>> -             return -EINVAL;
>>>>> -
>>>>> -     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
>>>>> -
>>>>> -     return 0;
>>>>> -}
>>>>> -
>>>>> -static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
>>>>> -                          u8 cs, u8 *caps)
>>>>> -{
>>>>> -     if (cs != UVC_CT_PRIVACY_CONTROL)
>>>>> -             return -EINVAL;
>>>>> -
>>>>> -     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
>>>>> -     return 0;
>>>>> -}
>>>>> -
>>>>> -static irqreturn_t uvc_gpio_irq(int irq, void *data)
>>>>> -{
>>>>> -     struct uvc_device *dev = data;
>>>>> -
>>>>> -     uvc_gpio_event(dev);
>>>>> -     return IRQ_HANDLED;
>>>>> -}
>>>>> -
>>>>> -static int uvc_gpio_parse(struct uvc_device *dev)
>>>>> -{
>>>>> -     struct uvc_entity *unit;
>>>>> -     struct gpio_desc *gpio_privacy;
>>>>> -     int irq;
>>>>> -
>>>>> -     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
>>>>> -                                            GPIOD_IN);
>>>>> -     if (!gpio_privacy)
>>>>> -             return 0;
>>>>> -
>>>>> -     if (IS_ERR(gpio_privacy))
>>>>> -             return dev_err_probe(&dev->intf->dev,
>>>>> -                                  PTR_ERR(gpio_privacy),
>>>>> -                                  "Can't get privacy GPIO\n");
>>>>> -
>>>>> -     irq = gpiod_to_irq(gpio_privacy);
>>>>> -     if (irq < 0)
>>>>> -             return dev_err_probe(&dev->intf->dev, irq,
>>>>> -                                  "No IRQ for privacy GPIO\n");
>>>>> -
>>>>> -     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
>>>>> -     if (!unit)
>>>>> -             return -ENOMEM;
>>>>> -
>>>>> -     unit->gpio.gpio_privacy = gpio_privacy;
>>>>> -     unit->gpio.irq = irq;
>>>>> -     unit->gpio.bControlSize = 1;
>>>>> -     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
>>>>> -     unit->gpio.bmControls[0] = 1;
>>>>> -     unit->get_cur = uvc_gpio_get_cur;
>>>>> -     unit->get_info = uvc_gpio_get_info;
>>>>> -     strscpy(unit->name, "GPIO", sizeof(unit->name));
>>>>> -
>>>>> -     list_add_tail(&unit->list, &dev->entities);
>>>>> -
>>>>> -     dev->gpio_unit = unit;
>>>>> -
>>>>> -     return 0;
>>>>> -}
>>>>> -
>>>>> -static int uvc_gpio_init_irq(struct uvc_device *dev)
>>>>> -{
>>>>> -     struct uvc_entity *unit = dev->gpio_unit;
>>>>> -     int ret;
>>>>> -
>>>>> -     if (!unit || unit->gpio.irq < 0)
>>>>> -             return 0;
>>>>> -
>>>>> -     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
>>>>> -                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
>>>>> -                                IRQF_TRIGGER_RISING,
>>>>> -                                "uvc_privacy_gpio", dev);
>>>>> -
>>>>> -     unit->gpio.initialized = !ret;
>>>>> -
>>>>> -     return ret;
>>>>> -}
>>>>> -
>>>>> -static void uvc_gpio_deinit(struct uvc_device *dev)
>>>>> -{
>>>>> -     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
>>>>> -             return;
>>>>> -
>>>>> -     free_irq(dev->gpio_unit->gpio.irq, dev);
>>>>> -}
>>>>> -
>>>>>  /* ------------------------------------------------------------------------
>>>>>   * UVC device scan
>>>>>   */
>>>>> diff --git a/drivers/media/usb/uvc/uvc_gpio.c b/drivers/media/usb/uvc/uvc_gpio.c
>>>>> new file mode 100644
>>>>> index 0000000000000000000000000000000000000000..30e3e6dd22cbc9cfee420dde7f7f64dbdce499b9
>>>>> --- /dev/null
>>>>> +++ b/drivers/media/usb/uvc/uvc_gpio.c
>>>>> @@ -0,0 +1,123 @@
>>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>>> +/*
>>>>> + *      uvc_gpio.c  --  USB Video Class driver
>>>>> + *
>>>>> + *      Copyright 2025 Google LLC
>>>>> + */
>>>>> +
>>>>> +#include <linux/kernel.h>
>>>>> +#include <linux/gpio/consumer.h>
>>>>> +#include "uvcvideo.h"
>>>>> +
>>>>> +static void uvc_gpio_event(struct uvc_device *dev)
>>>>> +{
>>>>> +     struct uvc_entity *unit = dev->gpio_unit;
>>>>> +     struct uvc_video_chain *chain;
>>>>> +     u8 new_val;
>>>>> +
>>>>> +     if (!unit)
>>>>> +             return;
>>>>> +
>>>>> +     new_val = gpiod_get_value_cansleep(unit->gpio.gpio_privacy);
>>>>> +
>>>>> +     /* GPIO entities are always on the first chain. */
>>>>> +     chain = list_first_entry(&dev->chains, struct uvc_video_chain, list);
>>>>> +     uvc_ctrl_status_event(chain, unit->controls, &new_val);
>>>>> +}
>>>>> +
>>>>> +static int uvc_gpio_get_cur(struct uvc_device *dev, struct uvc_entity *entity,
>>>>> +                         u8 cs, void *data, u16 size)
>>>>> +{
>>>>> +     if (cs != UVC_CT_PRIVACY_CONTROL || size < 1)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     *(u8 *)data = gpiod_get_value_cansleep(entity->gpio.gpio_privacy);
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static int uvc_gpio_get_info(struct uvc_device *dev, struct uvc_entity *entity,
>>>>> +                          u8 cs, u8 *caps)
>>>>> +{
>>>>> +     if (cs != UVC_CT_PRIVACY_CONTROL)
>>>>> +             return -EINVAL;
>>>>> +
>>>>> +     *caps = UVC_CONTROL_CAP_GET | UVC_CONTROL_CAP_AUTOUPDATE;
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +static irqreturn_t uvc_gpio_irq(int irq, void *data)
>>>>> +{
>>>>> +     struct uvc_device *dev = data;
>>>>> +
>>>>> +     uvc_gpio_event(dev);
>>>>> +     return IRQ_HANDLED;
>>>>> +}
>>>>> +
>>>>> +int uvc_gpio_parse(struct uvc_device *dev)
>>>>> +{
>>>>> +     struct uvc_entity *unit;
>>>>> +     struct gpio_desc *gpio_privacy;
>>>>> +     int irq;
>>>>> +
>>>>> +     gpio_privacy = devm_gpiod_get_optional(&dev->intf->dev, "privacy",
>>>>> +                                            GPIOD_IN);
>>>>> +     if (!gpio_privacy)
>>>>> +             return 0;
>>>>> +
>>>>> +     if (IS_ERR(gpio_privacy))
>>>>> +             return dev_err_probe(&dev->intf->dev,
>>>>> +                                  PTR_ERR(gpio_privacy),
>>>>> +                                  "Can't get privacy GPIO\n");
>>>>> +
>>>>> +     irq = gpiod_to_irq(gpio_privacy);
>>>>> +     if (irq < 0)
>>>>> +             return dev_err_probe(&dev->intf->dev, irq,
>>>>> +                                  "No IRQ for privacy GPIO\n");
>>>>> +
>>>>> +     unit = uvc_alloc_entity(UVC_EXT_GPIO_UNIT, UVC_EXT_GPIO_UNIT_ID, 0, 1);
>>>>> +     if (!unit)
>>>>> +             return -ENOMEM;
>>>>> +
>>>>> +     unit->gpio.gpio_privacy = gpio_privacy;
>>>>> +     unit->gpio.irq = irq;
>>>>> +     unit->gpio.bControlSize = 1;
>>>>> +     unit->gpio.bmControls = (u8 *)unit + sizeof(*unit);
>>>>> +     unit->gpio.bmControls[0] = 1;
>>>>> +     unit->get_cur = uvc_gpio_get_cur;
>>>>> +     unit->get_info = uvc_gpio_get_info;
>>>>> +     strscpy(unit->name, "GPIO", sizeof(unit->name));
>>>>> +
>>>>> +     list_add_tail(&unit->list, &dev->entities);
>>>>> +
>>>>> +     dev->gpio_unit = unit;
>>>>> +
>>>>> +     return 0;
>>>>> +}
>>>>> +
>>>>> +int uvc_gpio_init_irq(struct uvc_device *dev)
>>>>> +{
>>>>> +     struct uvc_entity *unit = dev->gpio_unit;
>>>>> +     int ret;
>>>>> +
>>>>> +     if (!unit || unit->gpio.irq < 0)
>>>>> +             return 0;
>>>>> +
>>>>> +     ret = request_threaded_irq(unit->gpio.irq, NULL, uvc_gpio_irq,
>>>>> +                                IRQF_ONESHOT | IRQF_TRIGGER_FALLING |
>>>>> +                                IRQF_TRIGGER_RISING,
>>>>> +                                "uvc_privacy_gpio", dev);
>>>>> +
>>>>> +     unit->gpio.initialized = !ret;
>>>>> +
>>>>> +     return ret;
>>>>> +}
>>>>> +
>>>>> +void uvc_gpio_deinit(struct uvc_device *dev)
>>>>> +{
>>>>> +     if (!dev->gpio_unit || !dev->gpio_unit->gpio.initialized)
>>>>> +             return;
>>>>> +
>>>>> +     free_irq(dev->gpio_unit->gpio.irq, dev);
>>>>> +}
>>>>> +
>>>>> diff --git a/drivers/media/usb/uvc/uvcvideo.h b/drivers/media/usb/uvc/uvcvideo.h
>>>>> index b4ee701835fc016474d2cd2a0b67b2aa915c1c60..aef96b96499ce09ffa286c51793482afd9832097 100644
>>>>> --- a/drivers/media/usb/uvc/uvcvideo.h
>>>>> +++ b/drivers/media/usb/uvc/uvcvideo.h
>>>>> @@ -683,6 +683,8 @@ do {                                                                      \
>>>>>   */
>>>>>
>>>>>  struct uvc_entity *uvc_entity_by_id(struct uvc_device *dev, int id);
>>>>> +struct uvc_entity *uvc_alloc_entity(u16 type, u16 id, unsigned int num_pads,
>>>>> +                                 unsigned int extra_size);
>>>>>
>>>>>  /* Video buffers queue management. */
>>>>>  int uvc_queue_init(struct uvc_video_queue *queue, enum v4l2_buf_type type);
>>>>> @@ -829,4 +831,8 @@ void uvc_debugfs_cleanup_stream(struct uvc_streaming *stream);
>>>>>  size_t uvc_video_stats_dump(struct uvc_streaming *stream, char *buf,
>>>>>                           size_t size);
>>>>>
>>>>> +/* gpio */
>>>>> +int uvc_gpio_parse(struct uvc_device *dev);
>>>>> +int uvc_gpio_init_irq(struct uvc_device *dev);
>>>>> +void uvc_gpio_deinit(struct uvc_device *dev);
>>>>>  #endif
>>>>>
>>
>> --
>> Regards,
>>
>> Laurent Pinchart
> 
> 
> 

