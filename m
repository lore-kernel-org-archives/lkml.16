Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB510208AD;
	Wed, 30 Apr 2025 03:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745983411; cv=none; b=HubKwghqEHnaEpONXeYnj+qAgP6dV5jhj5eXkOZvEYcfLFM+gzRbBTpIrbDeqIxLkXQ9xOyo/wi53kgvUcqjjq3a9ATqwPfvVDiETFVPWwPSO0VIK3I4RUqHqAt2Vbi8nFLhfc96p/8vJu/15lExxBe5cgJdh7sG0l884jq7+Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745983411; c=relaxed/simple;
	bh=yCO1zpRgX4F2Rp7vbFSfoTOuz33IiGNjrAv0CabLq54=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type; b=Ev078wHldX8BWfzoksZP9HEpQS+A94QE/+2y1VNx2HFnRuNO8FnIMajNmFMETeHhj+DKyrchBJBy0V4B2dlEgGyM+QpJoe2sOABEzET0VlZRiicMlttr1J1Hj/WrmUcilm00f/S21ZC386BXVfHJ7B7lMuwW6CwfYaNe6boO9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aEdDV5U+; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aEdDV5U+"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-af6a315b491so6565783a12.1;
        Tue, 29 Apr 2025 20:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745983409; x=1746588209; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=oXnNf93LKgcznWvLRmkQjReaWhvKzFlLmw8gnYUQD4w=;
        b=aEdDV5U+b9zILjmtc8AcGKoVLmq1cpLT3XurfuuEJxexgT8g3A8fdK4aiT/qNvTveO
         60xeI9bzYF4NgDRNpSS0QV4O8xUanWRPhNBmCu+SFfKNyX2iTVtsbYWrZ0+mfp/PY3FO
         7RELn7iuqibmOCHO7bL/dx5i/M5G0BGr57GX0JIZWHyPy/GefI/hWQzZ2tm9VlAHqZ5k
         hCg9ipxSXCMQDLlLwqXVV1XMwZIhyCYqqFenswYKd4eH5vLlCN2hMCEjbH0FieJYZKV2
         zXXWiS9F3/dI0sjbTCyjxUe/0z/bv1GU9hqazUfIWEonZGN3i6mxe/3GjCaglkViSKyi
         2vmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745983409; x=1746588209;
        h=content-transfer-encoding:mime-version:message-id:references
         :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oXnNf93LKgcznWvLRmkQjReaWhvKzFlLmw8gnYUQD4w=;
        b=AjSdRMKMlH0E7Z6lZnjSGM6VmesbJhHGxckUYst52aTIK3xXZdee6ZAjJSkuL2pBOJ
         VtP3nTrXRcrF3WGvciewTH7LUHxD6uyiuu9mwuFfcLpdR9xF3tjS6x1fTn+rNuf3WmLC
         dk4LamKxlDbWrCm09pVe9OtRRxFMLXNnIJeAUOKzMOGD2yqYNTmODJsxsWyuCmSPo0L2
         Ci4hza1HNf2s2ZBq39uZpTgyfU0fI5XCCu3VeaH9BXRmbCSK/jeS0ru0F8xv3/KdGN5+
         uuEZD8OuRU2upsrWvrs+HZzAAc1NVPEY1xjTxq59HbrUBlVO/4apyLXYsXCc6NY0cOHY
         Vt4g==
X-Forwarded-Encrypted: i=1; AJvYcCUKEFakaPHvJLYpgzhPT9GkGRtOteOzixoWn8pm7tedcUIv4cN+o8DbFrRWirEY7CNxeakRU61nIeYttqUJ@vger.kernel.org, AJvYcCXGsbQp1QpMFZo4PpoBD6aOreImEuBHPMtG+3R7GzzyT3cRNkiZQgCGpr+fhSOncE7bzmWbwOie3DzJCP4EwwxBMe+Dyw==@vger.kernel.org, AJvYcCXQPJ3BhDvmTatWcpN68WEz0j8bfez1gADY8vrtXaVaYXw+yJiGbofc5WrUB+hx2+UlgV0k+TRM5kQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YysTI1xP8HMFvPcvC4UDLjQ5MMYaIO9jdkOrvqWQZbBBgz8DpgC
	VdK+KSHaMppBKwMbxD+i5UiB9r7EPwRek8lD822Dwhhp4CndzbQ5
X-Gm-Gg: ASbGnct4/dZUKipZYs+aJPyc3ZlRk2zflZJ9Al3OJ1iir5eVRfu60gq/ceQ2f5gqnhy
	CiqHnbS4bmmTPQPzj1s6lVNql8utS1RQkxt2GYvPPpsRmKAq3h3NHQv8fxCRQuzS15vJppYCVzr
	tw7oFEqta9LwSKDCtz+YqcmgsoOPZz3wLgg5jHhkkqZL3fpStDNDu5QlvZ6GCst8wCpQFHJhUdX
	/p+Eew9lLFWoRhRmLyagt1JRx56hOl7IL/uAfuTyc8wxeXvi97Ze51puSQhKko2M8Dg141XXVnz
	+/GNOgLmBzuiB8a46G4ev2Ro5A6T4hWH3R7nebcseT4tgr35
X-Google-Smtp-Source: AGHT+IHUnRBuiix1eecl0KB8MzZqy9bKIURlJREwPCdb2nZjhei3vE5IEyeWt/y2cjVZY/0k24ni5g==
X-Received: by 2002:a17:90b:4ad2:b0:30a:2173:9f0b with SMTP id 98e67ed59e1d1-30a34467f57mr1585896a91.28.1745983408606;
        Tue, 29 Apr 2025 20:23:28 -0700 (PDT)
Received: from ?IPv6:::1? ([2607:fb90:8ee3:c96c:ad2:9358:5231:4c28])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a3480f0aasm478762a91.35.2025.04.29.20.23.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 20:23:28 -0700 (PDT)
Date: Tue, 29 Apr 2025 20:23:27 -0700
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: ALOK TIWARI <alok.a.tiwari@oracle.com>, Hans de Goede <hdegoede@redhat.com>,
 =?ISO-8859-1?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
CC: Armin Wolf <W_Armin@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 Mario Limonciello <superm1@kernel.org>, Luke Jones <luke@ljones.dev>,
 Xino Ni <nijs1@lenovo.com>, Zhixin Zhang <zhangzx36@lenovo.com>,
 Mia Shao <shaohz1@lenovo.com>, Mark Pearson <mpearson-lenovo@squebb.ca>,
 "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
 "Cody T . -H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>,
 platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>
Subject: =?US-ASCII?Q?Re=3A_=5BExternal=5D_=3A_=5BPATCH_v6_3/6=5D_platf?=
 =?US-ASCII?Q?orm/x86=3A_Add_Lenovo_WMI_Events_Driver?=
User-Agent: Thunderbird for Android
In-Reply-To: <b7d3a60a-7298-41ef-8f4e-7dc56c1ccc8a@oracle.com>
References: <20250428012029.970017-1-derekjohn.clark@gmail.com> <20250428012029.970017-4-derekjohn.clark@gmail.com> <b7d3a60a-7298-41ef-8f4e-7dc56c1ccc8a@oracle.com>
Message-ID: <25BA2FEB-288B-455E-A4B4-11968613EF41@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On April 28, 2025 1:57:30 PM PDT, ALOK TIWARI <alok=2Ea=2Etiwari@oracle=2E=
com> wrote:
>
>
>On 28-04-2025 06:48, Derek J=2E Clark wrote:
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-events=2Ec
>> @@ -0,0 +1,196 @@
>> +// SPDX-License-Identifier: GPL-2=2E0-or-later
>> +/*
>> + * Lenovo WMI Events driver=2E Lenovo WMI interfaces provide various
>> + * hardware triggered events that many drivers need to have propagated=
=2E
>> + * This driver provides a uniform entrypoint for these events so that
>> + * any driver that needs to respond to these events can subscribe to a
>> + * notifier chain=2E
>> + *
>> + * Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>
>> + */
>> +
>> +#include <linux/acpi=2Eh>
>> +#include <linux/export=2Eh>
>> +#include <linux/module=2Eh>
>> +#include <linux/notifier=2Eh>
>> +#include <linux/types=2Eh>
>> +#include <linux/wmi=2Eh>
>> +
>> +#include "lenovo-wmi-events=2Eh"
>> +#include "lenovo-wmi-gamezone=2Eh"
>> +
>> +#define THERMAL_MODE_EVENT_GUID "D320289E-8FEA-41E0-86F9-911D83151B5F"
>> +
>> +#define LWMI_EVENT_DEVICE(guid, type)                        \
>> +	=2Eguid_string =3D (guid), =2Econtext =3D &(enum lwmi_events_type) \
>> +	{                                                          \
>> +		type                                               \
>> +	}
>> +
>> +static BLOCKING_NOTIFIER_HEAD(events_chain_head);
>> +
>> +struct lwmi_events_priv {
>> +	struct wmi_device *wdev;
>> +	enum lwmi_events_type type;
>> +};
>> +
>> +/**
>> + * lwmi_events_register_notifier() - Add a notifier to the notifier ch=
ain=2E
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call blocking_notifier_chain_register to register the notifier bloc=
k to the
>> + * lenovo-wmi-events driver blocking notifer chain=2E
>
>typo notifer -> notifier in all register/unregister
>
>> + *
>> + * Return: 0 on success, %-EEXIST on error=2E
>> + */
>> +int lwmi_events_register_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_register(&events_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_events_register_notifier, "LENOVO_WMI_EVENTS=
");
>> +
>> +/**
>> + * lwmi_events_unregister_notifier() - Remove a notifier from the noti=
fier
>> + * chain=2E
>> + * @nb: The notifier_block struct to register
>
>the @nb parameter is described inconsistently:
>@nb: The notifier_block struct to unregister
>
>> + *
>> + * Call blocking_notifier_chain_unregister to unregister the notifier =
block
>> + * from the lenovo-wmi-events driver blocking notifer chain=2E
>> + *
>> + * Return: 0 on success, %-ENOENT on error=2E
>> + */
>> +int lwmi_events_unregister_notifier(struct notifier_block *nb)
>> +{
>> +	return blocking_notifier_chain_unregister(&events_chain_head, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(lwmi_events_unregister_notifier, "LENOVO_WMI_EVEN=
TS");
>
>can be consider lwmi_events_un/register_notifier as static
>if they are wrapper func?

I do think it's unlikely these would be used externally, but this pattern =
is consistent with other drivers with this type of function=2E TBS I'm not =
tied to one solution if there are objections to it one way or the other=2E

>> +
>> +/**
>> + * devm_lwmi_events_unregister_notifier() - Remove a notifier from the=
 notifier
>> + * chain=2E
>> + * @data: Void pointer to the notifier_block struct to register=2E
>
>* @data: Void pointer to the notifier_block struct to unregister=2E
>
>> + *
>> + * Call lwmi_events_unregister_notifier to unregister the notifier blo=
ck from
>> + * the lenovo-wmi-events driver blocking notifer chain=2E
>> + *
>> + * Return: 0 on success, %-ENOENT on error=2E
>> + */
>> +static void devm_lwmi_events_unregister_notifier(void *data)
>> +{
>> +	struct notifier_block *nb =3D data;
>> +
>
>if (nb) Consider checking NULL pointer
>
>> +	lwmi_events_unregister_notifier(nb);
>> +}
>> +
>> +/**
>> + * devm_lwmi_events_register_notifier() - Add a notifier to the notifi=
er chain=2E
>> + * @dev: The parent device of the notifier_block struct=2E
>> + * @nb: The notifier_block struct to register
>> + *
>> + * Call lwmi_events_register_notifier to register the notifier block t=
o the
>> + * lenovo-wmi-events driver blocking notifer chain=2E Then add, as a d=
evice
>> + * managed action, unregister_notifier to automatically unregister the
>> + * notifier block upon its parent device removal=2E
>> + *
>> + * Return: 0 on success, or an error code=2E
>> + */
>> +int devm_lwmi_events_register_notifier(struct device *dev,
>> +				       struct notifier_block *nb)
>> +{
>> +	int ret;
>> +
>> +	ret =3D lwmi_events_register_notifier(nb);
>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return devm_add_action_or_reset(dev, devm_lwmi_events_unregister_noti=
fier, nb);
>> +}
>> +EXPORT_SYMBOL_NS_GPL(devm_lwmi_events_register_notifier, "LENOVO_WMI_E=
VENTS");
>> +
>> +/**
>> + * lwmi_events_notify() - Call functions for the notifier call chain=
=2E
>> + * @wdev: The parent WMI device of the driver=2E
>> + * @obj: ACPI object passed by the registered WMI Event=2E
>> + *
>> + * Validate WMI event data and notify all registered drivers of the ev=
ent and
>> + * its output=2E
>> + *
>> + * Return: 0 on success, or an error code=2E
>> + */
>> +static void lwmi_events_notify(struct wmi_device *wdev, union acpi_obj=
ect *obj)
>> +{
>> +	struct lwmi_events_priv *priv =3D dev_get_drvdata(&wdev->dev);
>> +	int sel_prof;
>> +	int ret;
>> +
>> +	switch (priv->type) {
>> +	case LWMI_EVENT_THERMAL_MODE:
>> +		if (obj->type !=3D ACPI_TYPE_INTEGER)
>> +			return;
>> +
>> +		sel_prof =3D obj->integer=2Evalue;
>> +
>> +		switch (sel_prof) {
>> +		case LWMI_GZ_THERMAL_MODE_QUIET:
>> +		case LWMI_GZ_THERMAL_MODE_BALANCED:
>> +		case LWMI_GZ_THERMAL_MODE_PERFORMANCE:
>> +		case LWMI_GZ_THERMAL_MODE_EXTREME:
>> +		case LWMI_GZ_THERMAL_MODE_CUSTOM:
>> +			ret =3D blocking_notifier_call_chain(&events_chain_head,
>> +							   LWMI_EVENT_THERMAL_MODE,
>> +							   &sel_prof);
>> +			if (ret =3D=3D NOTIFY_BAD)
>> +				dev_err(&wdev->dev,
>> +					"Failed to send notification to call chain for WMI Events\n");
>> +			return;
>> +		default:
>> +			dev_err(&wdev->dev, "Got invalid thermal mode: %x",
>> +				sel_prof);
>> +			return;
>> +		}
>> +		break;
>> +	default:
>> +		return;
>> +	}
>> +}
>> +
>> +static int lwmi_events_probe(struct wmi_device *wdev, const void *cont=
ext)
>> +{
>> +	struct lwmi_events_priv *priv;
>> +
>> +	priv =3D devm_kzalloc(&wdev->dev, sizeof(*priv), GFP_KERNEL);
>> +	if (!priv)
>> +		return -ENOMEM;
>> +
>> +	if (!context)
>> +		return -EINVAL;
>> +
>
>might want to check context before using devm_kzalloc()
>to avoid unnecessary memory allocation
>
>> +	priv->wdev =3D wdev;
>> +	priv->type =3D *(enum lwmi_events_type *)context;
>> +
>> +	dev_set_drvdata(&wdev->dev, priv);
>> +	return 0;
>> +}
>> +
>> +static const struct wmi_device_id lwmi_events_id_table[] =3D {
>> +	{ LWMI_EVENT_DEVICE(THERMAL_MODE_EVENT_GUID, LWMI_EVENT_THERMAL_MODE)=
 },
>> +	{}
>> +};
>> +
>> +static struct wmi_driver lwmi_events_driver =3D {
>> +	=2Edriver =3D {
>> +		=2Ename =3D "lenovo_wmi_events",
>> +		=2Eprobe_type =3D PROBE_PREFER_ASYNCHRONOUS,
>> +	},
>> +	=2Eid_table =3D lwmi_events_id_table,
>> +	=2Eprobe =3D lwmi_events_probe,
>> +	=2Enotify =3D lwmi_events_notify,
>> +	=2Eno_singleton =3D true,
>> +};
>> +
>> +module_wmi_driver(lwmi_events_driver);
>> +
>> +MODULE_DEVICE_TABLE(wmi, lwmi_events_id_table);
>> +MODULE_AUTHOR("Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom>");
>> +MODULE_DESCRIPTION("Lenovo WMI Events Driver");
>> +MODULE_LICENSE("GPL");
>> diff --git a/drivers/platform/x86/lenovo-wmi-events=2Eh b/drivers/platf=
orm/x86/lenovo-wmi-events=2Eh
>> new file mode 100644
>> index 000000000000=2E=2Ee4c5459c2f24
>> --- /dev/null
>> +++ b/drivers/platform/x86/lenovo-wmi-events=2Eh
>> @@ -0,0 +1,20 @@
>> +/* SPDX-License-Identifier: GPL-2=2E0-or-later */
>> +
>> +/* Copyright(C) 2025 Derek J=2E Clark <derekjohn=2Eclark@gmail=2Ecom> =
*/
>> +
>> +#ifndef _LENOVO_WMI_EVENTS_H_
>> +#define _LENOVO_WMI_EVENTS_H_
>> +
>> +struct device;
>> +struct notifier_block;
>> +
>> +enum lwmi_events_type {
>> +	LWMI_EVENT_THERMAL_MODE =3D 1,
>> +};
>> +
>> +int lwmi_events_register_notifier(struct notifier_block *nb);
>> +int lwmi_events_unregister_notifier(struct notifier_block *nb);
>> +int devm_lwmi_events_register_notifier(struct device *dev,
>> +				       struct notifier_block *nb);
>
>why devm_lwmi_events_unregister_notifier not here ?
>

devm_lwmi_events_unregister_notifier is static as it's automatically added=
 as a removal action during registration=2E It wouldn't be used directly=2E

>> +
>> +#endif /* !_LENOVO_WMI_EVENTS_H_ */
>
>
>Thanks,
>Alok

 Ack remaining, thanks=2E
- Derek
