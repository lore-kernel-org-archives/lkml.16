Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9D451AAC9;
	Fri,  2 May 2025 02:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151296; cv=none; b=rmcYB+FJQfmkAzUSkZBXKWCcoycIHx1f0IMjd/bDWn5wnDMO92ffFhoniOyVsTSG/EJYXYfoz6JdKJ5aSH+c34LF2baDg7Xf//wtXfTsygMm3o6UTCydZjXGN0d90oY8iP3oYn0dnPdfMxXE0zv2VcgD56kNfm2qOSP+HZWL89A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151296; c=relaxed/simple;
	bh=Tx019rffAzcElOMLoD91qVcTLaWOHox1SeNEl3rijXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J9t12p4euLWgLUPq2TDEoDYe8fYNAInCEKmXsKCBenCopUxl/0rZTINNV+FGPJPG9FgbY0PaC0FDrrL8Qkao2psXWrghf5+Ch1773BpcjYtlcS/Esz2ixXzEm2W371N4i66EvHdB7H7eCbgccUrTAl5Vr3qkv1nrjwQdyiO2g6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=cb8tHUbC; arc=none smtp.client-ip=212.227.17.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="cb8tHUbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1746151262; x=1746756062; i=w_armin@gmx.de;
	bh=fa73kpic82E0cfqOoJzw6I90rwaZLd7ugMtC/3+7nXY=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=cb8tHUbCOgcWVgQrNHBwHu/kdtBxULJ2yCGNz2KrgfDoutTyBHdYDuIghZ1dfdQ+
	 6Kbly7N040/Qj/aI2FiIbfdlStVT19UsktqIxvxg34UyOlnHh71flzT8qAjAy7/yh
	 nGrY07/rs96z5LjYZyxxd/JBd5xwpD1BEm/qLBEG8HpzN9W+keC6CjChFQtvh9Prz
	 RuAT7/tn3Dani+WzmELHR6w1ujqb81YHYWfCNtIjMqLhwEt2wtarWxe7CQqg5hVPr
	 aEBeBpU6reY/SfHUHV0o5MrOR8UWuuFx8WWfEHF8ObW97awhbL5VXQ6ac1lOj30Bx
	 vNQudmwH3S+m7MyPGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MS3il-1ue8Ob22xf-00IaQY; Fri, 02
 May 2025 04:01:02 +0200
Message-ID: <f189fde3-2921-4869-820b-208da85fd75c@gmx.de>
Date: Fri, 2 May 2025 04:00:54 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [External] : [PATCH v6 3/6] platform/x86: Add Lenovo WMI Events
 Driver
To: "Derek J. Clark" <derekjohn.clark@gmail.com>,
 ALOK TIWARI <alok.a.tiwari@oracle.com>, Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>,
 Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>,
 Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>,
 Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com>
 <20250428012029.970017-4-derekjohn.clark@gmail.com>
 <b7d3a60a-7298-41ef-8f4e-7dc56c1ccc8a@oracle.com>
 <25BA2FEB-288B-455E-A4B4-11968613EF41@gmail.com>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <25BA2FEB-288B-455E-A4B4-11968613EF41@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:RLGFh8313BIrq5CbvSn41j0MXZUEjyxODD9KlTpzSwegXuBcl3t
 1n1NilVvAWzgHv/iausWG6nVp+hjdyX4n+Y5qjZCYLS0hC9xJMTJMTl4b8HKm/PujWkVhLl
 E5C3JJMdGM/4dftEitINMTAsFS94s/8qlvvumJtoWSs2v3uPggU17ey3TK4SVamsNjr3nwe
 gfcWt9H+168TiVcXK2Q+Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:GEpddLRiBOM=;4zivlpT7uhIoVevEiBGYldQndoZ
 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
 2HkO2xxuvItegUE/oIsko9nnUOWluCGKyP

Am 30.04.25 um 05:23 schrieb Derek J. Clark:

>
> On April 28, 2025 1:57:30 PM PDT, ALOK TIWARI <alok.a.tiwari@oracle.com> wrote:
>>
>> On 28-04-2025 06:48, Derek J. Clark wrote:
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-events.c
>>> @@ -0,0 +1,196 @@
>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>> +/*
>>> + * Lenovo WMI Events driver. Lenovo WMI interfaces provide various
>>> + * hardware triggered events that many drivers need to have propagated.
>>> + * This driver provides a uniform entrypoint for these events so that
>>> + * any driver that needs to respond to these events can subscribe to a
>>> + * notifier chain.
>>> + *
>>> + * Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com>
>>> + */
>>> +
>>> +#include <linux/acpi.h>
>>> +#include <linux/export.h>
>>> +#include <linux/module.h>
>>> +#include <linux/notifier.h>
>>> +#include <linux/types.h>
>>> +#include <linux/wmi.h>
>>> +
>>> +#include "lenovo-wmi-events.h"
>>> +#include "lenovo-wmi-gamezone.h"
>>> +
>>> +#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
>>> +
>>> +#define LWMI_EVENT_DEVICE(guid, type)                        \
>>> +	.guid_string = (guid), .context = &(enum lwmi_events_type) \
>>> +	{                                                          \
>>> +		type                                               \
>>> +	}
>>> +
>>> +static BLOCKING_NOTIFIER_HEAD(events_chain_head);
>>> +
>>> +struct lwmi_events_priv {
>>> +	struct wmi_device *wdev;
>>> +	enum lwmi_events_type type;
>>> +};
>>> +
>>> +/**
>>> + * lwmi_events_register_notifier() - Add a notifier to the notifier chain.
>>> + * @nb: The notifier_block struct to register
>>> + *
>>> + * Call blocking_notifier_chain_register to register the notifier block to the
>>> + * lenovo-wmi-events driver blocking notifer chain.
>> typo notifer -> notifier in all register/unregister
>>
>>> + *
>>> + * Return: 0 on success, %-EEXIST on error.
>>> + */
>>> +int lwmi_events_register_notifier(struct notifier_block *nb)
>>> +{
>>> +	return blocking_notifier_chain_register(&events_chain_head, nb);
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
>>> +
>>> +/**
>>> + * lwmi_events_unregister_notifier() - Remove a notifier from the notifier
>>> + * chain.
>>> + * @nb: The notifier_block struct to register
>> the @nb parameter is described inconsistently:
>> @nb: The notifier_block struct to unregister
>>
>>> + *
>>> + * Call blocking_notifier_chain_unregister to unregister the notifier block
>>> + * from the lenovo-wmi-events driver blocking notifer chain.
>>> + *
>>> + * Return: 0 on success, %-ENOENT on error.
>>> + */
>>> +int lwmi_events_unregister_notifier(struct notifier_block *nb)
>>> +{
>>> +	return blocking_notifier_chain_unregister(&events_chain_head, nb);
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVENTS");
>> can be consider lwmi_events_un/register_notifier as static
>> if they are wrapper func?
> I do think it's unlikely these would be used externally, but this pattern is consistent with other drivers with this type of function. TBS I'm not tied to one solution if there are objections to it one way or the other.

Hi,

please only make private functions static. Public functions should remain non-static.

>>> +
>>> +/**
>>> + * devm_lwmi_events_unregister_notifier() - Remove a notifier from the notifier
>>> + * chain.
>>> + * @data: Void pointer to the notifier_block struct to register.
>> * @data: Void pointer to the notifier_block struct to unregister.
>>
>>> + *
>>> + * Call lwmi_events_unregister_notifier to unregister the notifier block from
>>> + * the lenovo-wmi-events driver blocking notifer chain.
>>> + *
>>> + * Return: 0 on success, %-ENOENT on error.
>>> + */
>>> +static void devm_lwmi_events_unregister_notifier(void *data)
>>> +{
>>> +	struct notifier_block *nb = data;
>>> +
>> if (nb) Consider checking NULL pointer

devm_add_action_or_reset() will never call this function with data being NULL, so we do not need that check.

>>
>>> +	lwmi_events_unregister_notifier(nb);
>>> +}
>>> +
>>> +/**
>>> + * devm_lwmi_events_register_notifier() - Add a notifier to the notifier chain.
>>> + * @dev: The parent device of the notifier_block struct.
>>> + * @nb: The notifier_block struct to register
>>> + *
>>> + * Call lwmi_events_register_notifier to register the notifier block to the
>>> + * lenovo-wmi-events driver blocking notifer chain. Then add, as a device
>>> + * managed action, unregister_notifier to automatically unregister the
>>> + * notifier block upon its parent device removal.
>>> + *
>>> + * Return: 0 on success, or an error code.
>>> + */
>>> +int devm_lwmi_events_register_notifier(struct device *dev,
>>> +				       struct notifier_block *nb)
>>> +{
>>> +	int ret;
>>> +
>>> +	ret = lwmi_events_register_notifier(nb);
>>> +	if (ret < 0)
>>> +		return ret;
>>> +
>>> +	return devm_add_action_or_reset(dev, devm_lwmi_events_unregister_notifier, nb);
>>> +}
>>> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_EVENTS");
>>> +
>>> +/**
>>> + * lwmi_events_notify() - Call functions for the notifier call chain.
>>> + * @wdev: The parent WMI device of the driver.
>>> + * @obj: ACPI object passed by the registered WMI Event.
>>> + *
>>> + * Validate WMI event data and notify all registered drivers of the event and
>>> + * its output.
>>> + *
>>> + * Return: 0 on success, or an error code.
>>> + */
>>> +static void lwmi_events_notify(struct wmi_device *wdev, union acpi_object *obj)
>>> +{
>>> +	struct lwmi_events_priv *priv = dev_get_drvdata(&wdev->dev);
>>> +	int sel_prof;
>>> +	int ret;
>>> +
>>> +	switch (priv->type) {
>>> +	case LWMI_EVENT_THERMAL_MODE:
>>> +		if (obj->type != ACPI_TYPE_INTEGER)
>>> +			return;
>>> +
>>> +		sel_prof = obj->integer.value;
>>> +
>>> +		switch (sel_prof) {
>>> +		case LWMI_GZ_THERMAL_MODE_QUIET:
>>> +		case LWMI_GZ_THERMAL_MODE_BALANCED:
>>> +		case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
>>> +		case LWMI_GZ_THERMAL_MODE_EXTREME:
>>> +		case LWMI_GZ_THERMAL_MODE_CUSTOM:
>>> +			ret = blocking_notifier_call_chain(&events_chain_head,
>>> +							   LWMI_EVENT_THERMAL_MODE,
>>> +							   &sel_prof);
>>> +			if (ret == NOTIFY_BAD)
>>> +				dev_err(&wdev->dev,
>>> +					"Failed to send notification to call chain for WMI Events\n");
>>> +			return;
>>> +		default:
>>> +			dev_err(&wdev->dev, "Got invalid thermal mode: %x",
>>> +				sel_prof);
>>> +			return;
>>> +		}
>>> +		break;
>>> +	default:
>>> +		return;
>>> +	}
>>> +}
>>> +
>>> +static int lwmi_events_probe(struct wmi_device *wdev, const void *context)
>>> +{
>>> +	struct lwmi_events_priv *priv;
>>> +
>>> +	priv = devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>>> +	if (!priv)
>>> +		return -ENOMEM;
>>> +
>>> +	if (!context)
>>> +		return -EINVAL;
>>> +
>> might want to check context before using devm_kzalloc()
>> to avoid unnecessary memory allocation
>>
>>> +	priv->wdev = wdev;
>>> +	priv->type = *(enum lwmi_events_type *)context;
>>> +
>>> +	dev_set_drvdata(&wdev->dev, priv);
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct wmi_device_id lwmi_events_id_table[] = {
>>> +	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MODE) },
>>> +	{}
>>> +};
>>> +
>>> +static struct wmi_driver lwmi_events_driver = {
>>> +	.driver = {
>>> +		.name = "lenovo_wmi_events",
>>> +		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
>>> +	},
>>> +	.id_table = lwmi_events_id_table,
>>> +	.probe = lwmi_events_probe,
>>> +	.notify = lwmi_events_notify,
>>> +	.no_singleton = true,
>>> +};
>>> +
>>> +module_wmi_driver(lwmi_events_driver);
>>> +
>>> +MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
>>> +MODULE_AUTHOR("Derek J. Clark <derekjohn.clark@gmail.com>");
>>> +MODULE_DESCRIPTION("Lenovo WMI Events Driver");
>>> +MODULE_LICENSE("GPL");
>>> diff --git a/drivers/platform/x86/lenovo-wmi-events.h b/drivers/platform/x86/lenovo-wmi-events.h
>>> new file mode 100644
>>> index 000000000000..e4c5459c2f24
>>> --- /dev/null
>>> +++ b/drivers/platform/x86/lenovo-wmi-events.h
>>> @@ -0,0 +1,20 @@
>>> +/* SPDX-License-Identifier: GPL-2.0-or-later */
>>> +
>>> +/* Copyright(C) 2025 Derek J. Clark <derekjohn.clark@gmail.com> */
>>> +
>>> +#ifndef _LENOVO_WMI_EVENTS_H_
>>> +#define _LENOVO_WMI_EVENTS_H_
>>> +
>>> +struct device;
>>> +struct notifier_block;
>>> +
>>> +enum lwmi_events_type {
>>> +	LWMI_EVENT_THERMAL_MODE = 1,
>>> +};
>>> +
>>> +int lwmi_events_register_notifier(struct notifier_block *nb);
>>> +int lwmi_events_unregister_notifier(struct notifier_block *nb);
>>> +int devm_lwmi_events_register_notifier(struct device *dev,
>>> +				       struct notifier_block *nb);
>> why devm_lwmi_events_unregister_notifier not here ?
>>
> devm_lwmi_events_unregister_notifier is static as it's automatically added as a removal action during registration. It wouldn't be used directly.

I agree, most drivers have no need for such a function.

Thanks,
Armin Wolf

>>> +
>>> +#endif /* !_LENOVO_WMI_EVENTS_H_ */
>>
>> Thanks,
>> Alok
>   Ack remaining, thanks.
> - Derek
>
