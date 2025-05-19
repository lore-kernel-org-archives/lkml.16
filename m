Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E0EB11185;
	Mon, 19 May 2025 01:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747619482; cv=none; b=KBhuV+Lbn+yAvpTTY1hPGogSLNmEobHY1Gas6SLbu8cZ1ifeUmnua22xYaZN8FWHnCW5PdezIHoH0HgncF1LiJiuKtGZDnXARg23WcXaqiryqVFaRTbREvigljFTvi2ZVH5kV+t2r+waEgkYtSS1ubxwLAQnSNShLwr3d4Br+zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747619482; c=relaxed/simple;
	bh=LdGZ9oSw8upMkUz2sJWOm3+LniNhVuiot1x1EmuQNeI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sKKsG4B+LlqhDakJ1aTWJWHoldUzZLwJPQKPfsrPdNymVc2DgttXdc+TItql88IC9je4PJpM07WSMlRwDBq54iBCDOfUM7/VMNLvnqqAPMh6N2Xhs2mo43N9s8t+xTNkF7ZyBF/Rf5r4XWCq96jXeu3IkgcPK4K/Coy4g+/nrIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=sG0jM7ux; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="sG0jM7ux"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1747619470; x=1748224270; i=w_armin@gmx.de;
	bh=nTYai8MBDGmkA3cwhQ8WQnn7BNT56FLACQnr3X2giTo=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=sG0jM7uxkCjxigvb0AyJxNXceSaC6YKHp+Q5aQjvghYuwOdPLlpPEYf274HZciKO
	 Aims+2AeIwaB/ca/3Xo+H9Ftn2lNODscvMSwRsgsGETIW/R9eoBYh7fSbICBSSyp+
	 ALlmxWdV84otLPbdzlDI/MF08T5MJD0NyX7AK2Kn81jCwHj7wOfGtgeVGmw1jrost
	 QOdZunXtBYog+FpCsNHg8dPBL5xhCXWEuoO5som2Xi6rtEBxsR51J5hvfHDisHHGQ
	 iI0QDZH1Nwj0dsFnVJzjyBqKkSl+3a1/wVEI7idfAVAfWWEkvqda8SGdQcZbhnm7p
	 x6DLHXYch+HnpZdCzQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MNbkp-1uaQsQ47p5-00Vo3t; Mon, 19
 May 2025 03:51:10 +0200
Message-ID: <87446412-7787-4459-a435-a61c1ffc843e@gmx.de>
Date: Mon, 19 May 2025 03:51:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 05/10] platform/x86: msi-wmi-platform: Add platform
 profile through shift mode
To: Antheas Kapenekakis <lkml@antheas.dev>, Kurt Borja <kuurtb@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org
References: <20250511204427.327558-1-lkml@antheas.dev>
 <20250511204427.327558-6-lkml@antheas.dev>
 <D9TQ3FWVTOBM.4GU600TZ7NZ9@gmail.com>
 <CAGwozwE6J-WFCh6j79sg-ALut0_wya0m-4=Rfzf6xhKKxvf0Tw@mail.gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <CAGwozwE6J-WFCh6j79sg-ALut0_wya0m-4=Rfzf6xhKKxvf0Tw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cIZ9TzxYHfS92CWr1awHF0l95dSTcTBdq/VIMhuQM4ktG86aqX9
 apS+rQ8ty5iUl5+dOSPIuT64ymUcafiyCfCBHo5pFquS5BkPB9LLthAvgUj7EQm+J9LwIZO
 N0fYuIUGe3mv4JziDOkAl+nv6knxWWaffHY8tDceJlaSxmvvgDU3p1Nvg7WV13SqHhDcHeQ
 d7f6+/zW6nzbof3gW+NHw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:2pPJ/SM7VsQ=;Cg2UTAD9FgeSbgsKawkLaOnv1M1
 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

Am 12.05.25 um 23:59 schrieb Antheas Kapenekakis:

> On Mon, 12 May 2025 at 01:34, Kurt Borja <kuurtb@gmail.com> wrote:
>> On Sun May 11, 2025 at 5:44 PM -03, Antheas Kapenekakis wrote:
>>> MSI's version of platform profile in Windows is called shift mode.
>>> Introduce it here, and add a profile handler to it.
>>>
>>> It has 5 modes: sport, comfort, green, eco, and user.
>>> Confusingly, for the Claw, MSI only uses sport, green, and eco,
>>> where they correspond to performance, balanced, and low-power.
>>> Therefore, comfort is mapped to balanced-performance, and user to
>>> custom.
>>>
>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
>>> ---
>>>   drivers/platform/x86/Kconfig            |   1 +
>>>   drivers/platform/x86/msi-wmi-platform.c | 117 ++++++++++++++++++++++++
>>>   2 files changed, 118 insertions(+)
>>>
>>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>>> index bee98251b8f0b..57a48910c8fd4 100644
>>> --- a/drivers/platform/x86/Kconfig
>>> +++ b/drivers/platform/x86/Kconfig
>>> @@ -746,6 +746,7 @@ config MSI_WMI_PLATFORM
>>>        tristate "MSI WMI Platform features"
>>>        depends on ACPI_WMI
>>>        depends on HWMON
>>> +     select ACPI_PLATFORM_PROFILE
>>>        help
>>>          Say Y here if you want to have support for WMI-based platform features
>>>          like fan sensor access on MSI machines.
>>> diff --git a/drivers/platform/x86/msi-wmi-platform.c b/drivers/platform/x86/msi-wmi-platform.c
>>> index 9ac3c6f1b3f1d..c0b577c95c079 100644
>>> --- a/drivers/platform/x86/msi-wmi-platform.c
>>> +++ b/drivers/platform/x86/msi-wmi-platform.c
>>> @@ -17,6 +17,7 @@
>>>   #include <linux/dmi.h>
>>>   #include <linux/errno.h>
>>>   #include <linux/fixp-arith.h>
>>> +#include <linux/platform_profile.h>
>>>   #include <linux/hwmon.h>
>>>   #include <linux/hwmon-sysfs.h>
>>>   #include <linux/kernel.h>
>>> @@ -63,6 +64,16 @@
>>>   #define MSI_PLATFORM_AP_FAN_FLAGS_OFFSET     1
>>>   #define MSI_PLATFORM_AP_ENABLE_FAN_TABLES    BIT(7)
>>>
>>> +/* Get_Data() and Set_Data() Shift Mode Register */
>> Maybe you can write short documentation for these methods?
>>
>>> +#define MSI_PLATFORM_SHIFT_ADDR              0xd2
>>> +#define MSI_PLATFORM_SHIFT_DISABLE   BIT(7)
>>> +#define MSI_PLATFORM_SHIFT_ENABLE    (BIT(7) | BIT(6))
>>> +#define MSI_PLATFORM_SHIFT_SPORT     (MSI_PLATFORM_SHIFT_ENABLE + 4)
>>> +#define MSI_PLATFORM_SHIFT_COMFORT   (MSI_PLATFORM_SHIFT_ENABLE + 0)
>>> +#define MSI_PLATFORM_SHIFT_GREEN     (MSI_PLATFORM_SHIFT_ENABLE + 1)
>>> +#define MSI_PLATFORM_SHIFT_ECO               (MSI_PLATFORM_SHIFT_ENABLE + 2)
>>> +#define MSI_PLATFORM_SHIFT_USER              (MSI_PLATFORM_SHIFT_ENABLE + 3)
>> Instead of summing the profiles I suggest something like:
>>
>> enum MSI_PLATFORM_PROFILES {
>>          MSI_PROFILE_COMFORT,
>>          MSI_PROFILE_GREEN,
>>          MSI_PROFILE_ECO,
>>          MSI_PROFILE_USER,
>>          MSI_PROFILE_SPORT,
>> }
>>
>> And you can prepare your commands like
>>
>> command = MSI_PLATFORM_SHIT_ENABLE;
>> command |= FIELD_PREP(GENMASK(1,0), MSI_PROFILE_{profile});
>>
>> I feel that it's cleaner this way. This is only a suggestion though.
>>
>>> +
>>>   static bool force;
>>>   module_param_unsafe(force, bool, 0);
>>>   MODULE_PARM_DESC(force, "Force loading without checking for supported WMI interface versions");
>>> @@ -100,12 +111,14 @@ enum msi_wmi_platform_method {
>>>   };
>>>
>>>   struct msi_wmi_platform_quirk {
>>> +     bool shift_mode;        /* Shift mode is supported */
>>>   };
>>>
>>>   struct msi_wmi_platform_data {
>>>        struct wmi_device *wdev;
>>>        struct msi_wmi_platform_quirk *quirks;
>>>        struct mutex wmi_lock;  /* Necessary when calling WMI methods */
>>> +     struct device *ppdev;
>>>   };
>>>
>>>   struct msi_wmi_platform_debugfs_data {
>>> @@ -150,8 +163,10 @@ static const char * const msi_wmi_platform_debugfs_names[] = {
>>>
>>>   static struct msi_wmi_platform_quirk quirk_default = {};
>>>   static struct msi_wmi_platform_quirk quirk_gen1 = {
>>> +     .shift_mode = true
>>>   };
>>>   static struct msi_wmi_platform_quirk quirk_gen2 = {
>>> +     .shift_mode = true
>>>   };
>>>
>>>   static const struct dmi_system_id msi_quirks[] = {
>>> @@ -561,6 +576,90 @@ static const struct hwmon_chip_info msi_wmi_platform_chip_info = {
>>>        .info = msi_wmi_platform_info,
>>>   };
>>>
>>> +static int msi_wmi_platform_profile_probe(void *drvdata, unsigned long *choices)
>>> +{
>>> +     set_bit(PLATFORM_PROFILE_LOW_POWER, choices);
>>> +     set_bit(PLATFORM_PROFILE_BALANCED, choices);
>>> +     set_bit(PLATFORM_PROFILE_BALANCED_PERFORMANCE, choices);
>>> +     set_bit(PLATFORM_PROFILE_PERFORMANCE, choices);
>> Please, use the non-atomic __set_bit(). `choices` is not shared between
>> threads.
>>
>>> +     return 0;
>>> +}
>>> +
>>> +static int msi_wmi_platform_profile_get(struct device *dev,
>>> +                                     enum platform_profile_option *profile)
>>> +{
>>> +     struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
>>> +     int ret;
>>> +
>>> +     u8 buffer[32] = { };
>> Move this to the top.
>>
>>> +
>>> +     buffer[0] = MSI_PLATFORM_SHIFT_ADDR;
>>> +
>>> +     ret = msi_wmi_platform_query(data, MSI_PLATFORM_GET_DATA, buffer, sizeof(buffer));
>>> +     if (ret < 0)
>>> +             return ret;
>>> +
>>> +     if (buffer[0] != 1)
>>> +             return -EINVAL;
>>> +
>>> +     switch (buffer[1]) {
>>> +     case MSI_PLATFORM_SHIFT_SPORT:
>>> +             *profile = PLATFORM_PROFILE_PERFORMANCE;
>>> +             return 0;
>>> +     case MSI_PLATFORM_SHIFT_COMFORT:
>>> +             *profile = PLATFORM_PROFILE_BALANCED_PERFORMANCE;
>> Maybe comfort can be mapped to balanced and green to cool. What do you
>> think?
> I forgot to comment on this one. The Claw uses ECO, GREEN, and
> PERFORMANCE as its primary modes with 8, 12, 30W respectively. Comfort
> is not used specifically for it. So I chose to push Green upwards to
> balanced.
>
> @Armin might know more about this one. If it turns out using comfort
> for balanced fits better for laptops we can do that instead.
>
> Antheas

I prefer comfort mode to be mapped as "balanced".

Thanks,
Armin Wolf

>>> +             return 0;
>>> +     case MSI_PLATFORM_SHIFT_GREEN:
>>> +             *profile = PLATFORM_PROFILE_BALANCED;
>>> +             return 0;
>>> +     case MSI_PLATFORM_SHIFT_ECO:
>>> +             *profile = PLATFORM_PROFILE_LOW_POWER;
>>> +             return 0;
>>> +     case MSI_PLATFORM_SHIFT_USER:
>>> +             *profile = PLATFORM_PROFILE_CUSTOM;
>>> +             return 0;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +}
>>> +
>>> +static int msi_wmi_platform_profile_set(struct device *dev,
>>> +                                     enum platform_profile_option profile)
>>> +{
>>> +     struct msi_wmi_platform_data *data = dev_get_drvdata(dev);
>>> +     u8 buffer[32] = { };
>>> +
>>> +     buffer[0] = MSI_PLATFORM_SHIFT_ADDR;
>>> +
>>> +     switch (profile) {
>>> +     case PLATFORM_PROFILE_PERFORMANCE:
>>> +             buffer[1] = MSI_PLATFORM_SHIFT_SPORT;
>>> +             break;
>>> +     case PLATFORM_PROFILE_BALANCED_PERFORMANCE:
>>> +             buffer[1] = MSI_PLATFORM_SHIFT_COMFORT;
>>> +             break;
>>> +     case PLATFORM_PROFILE_BALANCED:
>>> +             buffer[1] = MSI_PLATFORM_SHIFT_GREEN;
>>> +             break;
>>> +     case PLATFORM_PROFILE_LOW_POWER:
>>> +             buffer[1] = MSI_PLATFORM_SHIFT_ECO;
>>> +             break;
>>> +     case PLATFORM_PROFILE_CUSTOM:
>>> +             buffer[1] = MSI_PLATFORM_SHIFT_USER;
>>> +             break;
>>> +     default:
>>> +             return -EINVAL;
>>> +     }
>>> +
>>> +     return msi_wmi_platform_query(data, MSI_PLATFORM_SET_DATA, buffer, sizeof(buffer));
>>> +}
>>> +
>>> +static const struct platform_profile_ops msi_wmi_platform_profile_ops = {
>>> +     .probe = msi_wmi_platform_profile_probe,
>>> +     .profile_get = msi_wmi_platform_profile_get,
>>> +     .profile_set = msi_wmi_platform_profile_set,
>>> +};
>>> +
>>>   static ssize_t msi_wmi_platform_debugfs_write(struct file *fp, const char __user *input,
>>>                                              size_t length, loff_t *offset)
>>>   {
>>> @@ -742,6 +841,22 @@ static int msi_wmi_platform_init(struct msi_wmi_platform_data *data)
>>>        return 0;
>>>   }
>>>
>>> +static int msi_wmi_platform_profile_setup(struct msi_wmi_platform_data *data)
>>> +{
>>> +     int err;
>>> +
>>> +     if (!data->quirks->shift_mode)
>>> +             return 0;
>>> +
>>> +     data->ppdev = devm_platform_profile_register(
>>> +             &data->wdev->dev, "msi-wmi-platform", data,
>>> +             &msi_wmi_platform_profile_ops);
>> Broken format.
>>
>>> +     if (err)
>>> +             return err;
>> `err` is not initialized. Is it a leftover?
>>
>>> +
>>> +     return PTR_ERR_OR_ZERO(data->ppdev);
>>> +}
>>> +
>>>   static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
>>>   {
>>>        struct msi_wmi_platform_data *data;
>>> @@ -775,6 +890,8 @@ static int msi_wmi_platform_probe(struct wmi_device *wdev, const void *context)
>>>
>>>        msi_wmi_platform_debugfs_init(data);
>>>
>>> +     msi_wmi_platform_profile_setup(data);
>> Check return value.
>>
>> --
>>   ~ Kurt
>>
>>> +
>>>        return msi_wmi_platform_hwmon_init(data);
>>>   }
>>>
