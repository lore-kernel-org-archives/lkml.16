Received: from n169-113.mail.139.com (n169-113.mail.139.com [120.232.169.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8A471F1908;
	Tue, 11 Feb 2025 14:14:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=120.232.169.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739283258; cv=none; b=GI607l/naTSCXy1wW3Brv6964HLbBUIKPacDxDEvqFItrbts9koUewEBCmFzLZxzijQhy9wD/WJi0RgflQCOcZfVrCoTL3sSbEV9h8q6D5pFwp8hJXG2TFBIegyUIsYf6oJfc0tGTGOkPD6Zf7pOURLa31yWrDMxp7lZ23KVMeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739283258; c=relaxed/simple;
	bh=quGlzxj1rKadRPMkUQff2q27VGmByCWl9wrachv+tiA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iL9yfvRFC8Dfa4cN3/8L6LnjlGVc7+VvzA+sLSJyXeQepVPvaoeUYVXh9auFuS+Wcqlxdqc5i+xL6s4poR3RrBjk8/KWRk1LEPqXoHNoaBq320tfUxOwthyRp0H1WaUwPPQIWnfMSGlw59dqzWxvxiM0S/xsbhyt2ewnYKlAlf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com; spf=pass smtp.mailfrom=139.com; arc=none smtp.client-ip=120.232.169.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=139.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=139.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM:                                                                                        
X-RM-SPAM-FLAG:00000000
Received:from [IPV6:2409:8a00:7877:4fa0:7ad3:126f:a98b:8484] (unknown[2409:8A00:7877:4FA0:7AD3:126F:A98B:8484])
	by rmsmtp-lg-appmail-28-12033 (RichMail) with SMTP id 2f0167ab5b30c71-21f42;
	Tue, 11 Feb 2025 22:14:10 +0800 (CST)
X-RM-TRANSID:2f0167ab5b30c71-21f42
Message-ID: <de7c5dcf-f7c1-4aa4-8bb0-4deab7bdfe6c@139.com>
Date: Tue, 11 Feb 2025 22:14:09 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] platform/x86: lenovo-super-hotkey-wmi.c: Supportformic
 and audio mute LEDs
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>, LKML <linux-kernel@vger.kernel.org>,
 platform-driver-x86@vger.kernel.org, dongeg1@lenovo.com,
 Mark Pearson <mpearson-lenovo@squebb.ca>
References: <20250208144114.11685-1-xy-jackie@139.com>
 <59c73f9e-2b3c-0a52-3328-257dcbb52a90@linux.intel.com>
 <437086da-f14e-474a-ac4b-9a235ab89d18@139.com>
 <5dd6d08b-33eb-f74d-e3b1-d1380ad25565@linux.intel.com>
Content-Language: en-US
From: Jackie Dong <xy-jackie@139.com>
In-Reply-To: <5dd6d08b-33eb-f74d-e3b1-d1380ad25565@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/11/25 22:00, Ilpo Järvinen wrote:
> On Tue, 11 Feb 2025, Jackie Dong wrote:
> 
>> On 2/10/25 18:45, Ilpo Järvinen wrote:
>>> On Sat, 8 Feb 2025, Jackie Dong wrote:
>>>
>>>> Implement Lenovo utility data WMI calls needed to make LEDs
>>>> work on Ideapads that support this GUID.
>>>> This enables the mic and audio LEDs to be updated correctly.
>>>>
>>>> Tested on below samples.
>>>> ThinkBook 13X Gen4 IMH
>>>> ThinkBook 14 G6 ABP
>>>> ThinkBook 16p Gen4-21J8
>>>> ThinkBook 16p Gen8-IRL
>>>> ThinkBook 16p G7+ ASP
>>>>
>>>> Signed-off-by: Jackie Dong <xy-jackie@139.com>
>>>> Suggested-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>>>> ---
>>>> Changes in v3:
>>>>    - Changed the name of the Kconfig entry to LENOVO_SUPER_HOTKEY_WMI
>>>>    - Renamed everything in this driver which contains the name "ideapad"
>>>>      to instead contain the name of this driver.
>>>>    - Moved struct wmi_device *led_wdev in lenovo_super_hotkey_wmi_private,
>>>>      and use container_of() to the led_wdev pointer.
>>>>    - Replaced sizeof(struct wmi_led_args) by sizeof(led_arg)
>>>>    - Added condtions checking for obj && obj->type == ACPI_TYPE_INTEGER
>>>>      and free the ACPI object after get the required value.
>>>>    - Removed led_classdev_unregister() after led_reg_failed label, but
>>>>      add lenovo_super_hotkey_wmi_remove(struct wmi_device *wdev) to free
>>>>      resource.
>>>>    - Removed IDEAPAD_WMI_EVENT_FN_KEYS/IDEAPAD_WMI_EVENT_LUD_KEYS related
>>>>      source codes and only keep LUD_WMI_METHOD_GUID.
>>>>
>>>> Changes in v2:
>>>>    - Update code layout and formatting as recommended in review
>>>>    - Improved error handling in ideapad_wmi_led_init
>>>>    - Separated a WMI driver named lenovo-super-hotkey-wmi.c from
>>>>      ideapad-lap.c, it's only for Lenovo Super Hotkey WMI devices.
>>>>
>>>>    drivers/platform/x86/Kconfig                  |   9 +
>>>>    drivers/platform/x86/Makefile                 |   1 +
>>>>    .../platform/x86/lenovo-super-hotkey-wmi.c    | 248 ++++++++++++++++++
>>>>    3 files changed, 258 insertions(+)
>>>>    create mode 100644 drivers/platform/x86/lenovo-super-hotkey-wmi.c
>>>>
>>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>>> index 0258dd879d64..c1792e8f04e1 100644
>>>> --- a/drivers/platform/x86/Kconfig
>>>> +++ b/drivers/platform/x86/Kconfig
>>>> @@ -475,6 +475,15 @@ config IDEAPAD_LAPTOP
>>>>    	  This is a driver for Lenovo IdeaPad netbooks contains drivers for
>>>>    	  rfkill switch, hotkey, fan control and backlight control.
>>>>    +config LENOVO_SUPER_HOTKEY_WMI
>>>> +	tristate "Lenovo Super Hotkey Utility WMI extras driver"
>>>> +	depends on ACPI_WMI
>>>> +	depends on IDEAPAD_LAPTOP
>>>> +	help
>>>> +	  This driver provides WMI support for Lenovo customized hotkeys
>>>> function
>>>> +	  of Lenovo NoteBooks which are for Consumer and SMB customers, such
>>>> as
>>>> +	  Ideapad/YOGA/XiaoXin/Gaming/ThinkBook and so on.
>>>> +
>>>>    config LENOVO_YMC
>>>>    	tristate "Lenovo Yoga Tablet Mode Control"
>>>>    	depends on ACPI_WMI
>>>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>>>> index e1b142947067..598335da9f55 100644
>>>> --- a/drivers/platform/x86/Makefile
>>>> +++ b/drivers/platform/x86/Makefile
>>>> @@ -61,6 +61,7 @@ obj-$(CONFIG_UV_SYSFS)       += uv_sysfs.o
>>>>    # IBM Thinkpad and Lenovo
>>>>    obj-$(CONFIG_IBM_RTL)		+= ibm_rtl.o
>>>>    obj-$(CONFIG_IDEAPAD_LAPTOP)	+= ideapad-laptop.o
>>>> +obj-$(CONFIG_LENOVO_SUPER_HOTKEY_WMI)	+= lenovo-super-hotkey-wmi.o
>>>>    obj-$(CONFIG_LENOVO_YMC)	+= lenovo-ymc.o
>>>>    obj-$(CONFIG_SENSORS_HDAPS)	+= hdaps.o
>>>>    obj-$(CONFIG_THINKPAD_ACPI)	+= thinkpad_acpi.o
>>>> diff --git a/drivers/platform/x86/lenovo-super-hotkey-wmi.c
>>>> b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
>>>> new file mode 100644
>>>> index 000000000000..e677bd11fa2f
>>>> --- /dev/null
>>>> +++ b/drivers/platform/x86/lenovo-super-hotkey-wmi.c
>>>> @@ -0,0 +1,248 @@
>>>> +// SPDX-License-Identifier: GPL-2.0
>>>> +/*
>>>> + *  Lenovo Super Hotkey Utility WMI extras driver for Ideapad laptop
>>>> + *
>>>> + *  Copyright (C) 2025	Lenovo
>>>> + */
>>>> +
>>>> +#include <linux/leds.h>
>>>> +#include <linux/wmi.h>
>>>> +#include "ideapad-laptop.h"
>>>
>>> Add an empty line before the local includes.
>> Hi Ilpo,
>>     Thanks for your review and comments.
>>     I'll update it in next version patch.
>>>
>>>> +
>>>> +/* Lenovo Super Hotkey WMI GUIDs */
>>>> +#define LUD_WMI_METHOD_GUID	"CE6C0974-0407-4F50-88BA-4FC3B6559AD8"
>>>> +
>>>> +/* Lenovo Utility Data WMI method_id */
>>>> +#define WMI_LUD_GET_SUPPORT 1
>>>> +#define WMI_LUD_SET_FEATURE 2
>>>> +
>>>> +#define WMI_LUD_GET_MICMUTE_LED_VER   20
>>>> +#define WMI_LUD_GET_AUDIOMUTE_LED_VER 26
>>>> +
>>>> +#define WMI_LUD_SUPPORT_MICMUTE_LED_VER   25
>>>> +#define WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER 27
>>>> +
>>>> +/* Input parameters to mute/unmute audio LED and Mic LED */
>>>> +struct wmi_led_args {
>>>> +	u8 id;
>>>> +	u8 subid;
>>>> +	u16 value;
>>>> +};
>>>> +
>>>> +/* Values of input parameters to SetFeature of audio LED and Mic LED */
>>>> +enum hotkey_set_feature {
>>>> +	MIC_MUTE_LED_ON = 1,
>>>> +	MIC_MUTE_LED_OFF,
>>>> +	AUDIO_MUTE_LED_ON = 4,
>>>> +	AUDIO_MUTE_LED_OFF,
>>>> +};
>>>> +
>>>> +#define LSH_ACPI_LED_MAX 2
>>>> +
>>>> +enum lenovo_super_hotkey_wmi_event_type {
>>>> +	LSH_WMI_EVENT_LUD_KEYS = 2,
>>>> +};
>>>> +
>>>> +struct lenovo_super_hotkey_wmi_private {
>>>> +	enum lenovo_super_hotkey_wmi_event_type event;
>>>> +	struct led_classdev cdev[LSH_ACPI_LED_MAX];
>>>> +	struct wmi_device *led_wdev;
>>>> +};
>>>> +
>>>> +enum mute_led_type {
>>>> +	MIC_MUTE,
>>>> +	AUDIO_MUTE,
>>>> +};
>>>> +
>>>> +static int lsh_wmi_mute_led_set(enum mute_led_type led_type, struct
>>>> led_classdev *led_cdev,
>>>> +				enum led_brightness brightness)
>>>> +
>>>> +{
>>>> +	struct lenovo_super_hotkey_wmi_private *wpriv = container_of(led_cdev,
>>>> +			struct lenovo_super_hotkey_wmi_private,
>>>> cdev[led_type]);
>>>> +	struct wmi_led_args led_arg = {0, 0, 0};
>>>> +	struct acpi_buffer input;
>>>> +	acpi_status status;
>>>> +
>>>> +	switch (led_type) {
>>>> +	case MIC_MUTE:
>>>> +		led_arg.id = brightness == LED_ON ? MIC_MUTE_LED_ON :
>>>> MIC_MUTE_LED_OFF;
>>>> +		break;
>>>> +	case AUDIO_MUTE:
>>>> +		led_arg.id = brightness == LED_ON ? AUDIO_MUTE_LED_ON :
>>>> AUDIO_MUTE_LED_OFF;
>>>> +		break;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	input.length = sizeof(led_arg);
>>>> +	input.pointer = &led_arg;
>>>> +	status = wmidev_evaluate_method(wpriv->led_wdev, 0,
>>>> WMI_LUD_SET_FEATURE, &input, NULL);
>>>> +	if (ACPI_FAILURE(status))
>>>> +		return -EIO;
>>>> +
>>>> +	return 0;
>>>> +}
>>>> +
>>>> +static int lsh_wmi_audiomute_led_set(struct led_classdev *led_cdev,
>>>> +				     enum led_brightness brightness)
>>>> +
>>>> +{
>>>> +	return lsh_wmi_mute_led_set(AUDIO_MUTE, led_cdev, brightness);
>>>> +}
>>>> +
>>>> +static int lsh_wmi_micmute_led_set(struct led_classdev *led_cdev,
>>>> +				   enum led_brightness brightness)
>>>> +{
>>>> +	return lsh_wmi_mute_led_set(MIC_MUTE, led_cdev, brightness);
>>>> +}
>>>> +
>>>> +static int lenovo_super_hotkey_wmi_led_init(enum mute_led_type led_type,
>>>> struct device *dev)
>>>> +{
>>>> +	struct lenovo_super_hotkey_wmi_private *wpriv = dev_get_drvdata(dev);
>>>> +	struct acpi_buffer output = { ACPI_ALLOCATE_BUFFER, NULL };
>>>> +	struct acpi_buffer input;
>>>> +	union acpi_object *obj;
>>>> +	int led_version, err = 0;
>>>> +	unsigned int wmiarg;
>>>> +	acpi_status status;
>>>> +
>>>> +	switch (led_type) {
>>>> +	case MIC_MUTE:
>>>> +		wmiarg = WMI_LUD_GET_MICMUTE_LED_VER;
>>>> +		break;
>>>> +	case AUDIO_MUTE:
>>>> +		wmiarg = WMI_LUD_GET_AUDIOMUTE_LED_VER;
>>>> +		break;
>>>> +	default:
>>>> +		return -EINVAL;
>>>> +	}
>>>> +
>>>> +	input.length = sizeof(wmiarg);
>>>> +	input.pointer = &wmiarg;
>>>> +	status = wmidev_evaluate_method(wpriv->led_wdev, 0,
>>>> WMI_LUD_GET_SUPPORT, &input, &output);
>>>> +	if (ACPI_FAILURE(status))
>>>> +		return -EIO;
>>>> +
>>>> +	obj = output.pointer;
>>>> +	if (obj && obj->type == ACPI_TYPE_INTEGER) {
>>>> +		led_version = obj->integer.value;
>>>> +		kfree(output.pointer);
>>>> +	} else {
>>>> +		err = -EIO;
>>>> +		goto led_error;
>>>> +	}
>>>> +
>>>> +	wpriv->cdev[led_type].max_brightness = LED_ON;
>>>> +	wpriv->cdev[led_type].dev = dev;
>>>> +	wpriv->cdev[led_type].flags = LED_CORE_SUSPENDRESUME;
>>>> +
>>>> +	switch (led_type) {
>>>> +	case MIC_MUTE:
>>>> +		if (led_version != WMI_LUD_SUPPORT_MICMUTE_LED_VER) {
>>>> +			err = -EIO;
>>>> +			goto led_error;
>>>> +		}
>>>> +		wpriv->cdev[led_type].name = "platform::micmute";
>>>> +		wpriv->cdev[led_type].brightness_set_blocking =
>>>> &lsh_wmi_micmute_led_set;
>>>> +		wpriv->cdev[led_type].default_trigger = "audio-micmute";
>>>> +
>>>> +		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
>>>> +		if (err < 0)
>>>> +			goto led_reg_failed;
>>>> +
>>>> +		break;
>>>> +	case AUDIO_MUTE:
>>>> +		if (led_version != WMI_LUD_SUPPORT_AUDIOMUTE_LED_VER) {
>>>> +			err = -EIO;
>>>> +			goto led_error;
>>>> +		}
>>>> +		wpriv->cdev[led_type].name = "platform::mute";
>>>> +		wpriv->cdev[led_type].brightness_set_blocking =
>>>> &lsh_wmi_audiomute_led_set;
>>>> +		wpriv->cdev[led_type].default_trigger = "audio-mute";
>>>> +
>>>> +		err = devm_led_classdev_register(dev, &wpriv->cdev[led_type]);
>>>> +		if (err < 0)
>>>> +			goto led_reg_failed;
>>>> +
>>>> +		break;
>>>> +	default:
>>>> +		err = -EINVAL;
>>>> +		dev_err(dev, "Unknown LED type %d\n", led_type);
>>>
>>> Add include.
>> For this comment, I understand that it need to add include for dev_err(). If
>> so, my comments is below. If you think that it still need to add the include
>> include/linux/dev_printk.h, pls comfirm it again, I'll add it in next version
>> patch.
>> dev_err() is defined in include/linux/dev_printk.h which is included by
>> include/linux/device.h which is included by include/linux/wmi.h which is
>> included by this file as below.
> 
> Hi,
> 
> Even if there's an indirect include path through other headers, you should
> include linux/dev_printk.h also here. There's nothing fundamendal that
> requires device.h to include dev_printk.h even if it currently does so
> relying on these indirect includes is fragile (and hopefully somebody
> eventually cleans up the entire include mess).
> 
> Same applies to the other case I marked below so please add those as
> well.
> 
> There are some guaranteed include paths through another header and
> I normally won't flag those, e.g., wmi.h will always have to include
> device.h because struct device resides within struct wmi_device (it won't
> build at all if device.h include is removed from wmi.h unless something
> else by chance included device.h before wmi.h).
> 
Hi Ilpo,
      Thanks for your careful explaintion, I understand your view now 
and will add the include files in next version patch.

Jackie Dong

