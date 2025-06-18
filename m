Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C09DA3085A6;
	Wed, 18 Jun 2025 20:06:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750277199; cv=none; b=kqL+xTAif7y6sZMD04McXgMuiiDZlwRzE8K3xSvrLi5hQ88ylevHXpiJbIE73RjeHCeU++NGpXgydOJ4W4OF/kMXnaexcSfgoVTY/py9wl2wb8XTnNTbpZG6eHlkuG6lHfpjS2fMGHnVYM6p88+q9hvwo1Elz5ZgnsN0qRqd6ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750277199; c=relaxed/simple;
	bh=RFDfdoxMfKu0T4SSGgFwA9CpNlcAfTAkHuhwIufugMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MSZ9O513v7re4SHpxPTsYCpZUorX/KUFqC0rRUHt7MpIxI8Nj0ZY9lRZhdKRMbp3D9LApfhNA0nC3MTwnGbZYAaGnYmN2zE+qM1EDdkKaYm6abspWJBa4pB8TNQ+Xas6pqMtQmxL3oND6EAgsalHF7pPCq4pLjMQFeTGbrsOBBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=p7FutNw8; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="p7FutNw8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1750277193; x=1750881993; i=w_armin@gmx.de;
	bh=PN5j4dqZLxSE7VwcSbHj2qNTknn4/APwQOfC8Ge160U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=p7FutNw8pY2mRLGbvnrQk7KKgGdncwGseSCaRfkDbU98DgVxUOgioOarUsY6zdvw
	 oPcxMIBc09VtzadEmelpWnD9kwYLelotvcfPm8h1+oms8NAjdwI2nnOIYSh6A9OmO
	 cfI1tpkzFeYFNuwvbaw8g1j80v+j6TZ6clpwWPRW/lrE4Q6W/yaD48hQismm4D8Hl
	 c3CyeKQfwdlGVqeukQXJtz+VDxvzLF1MYEt/LpX674AHxbrIOfjYNu9sehyaPGi9p
	 BSHgbtC4C3V+9PIMeen/5VdksQ5ftcXdm9JkNEr3eq/fn6SL8YGXYQFT/leRofLuO
	 vnhBkOQMruFgc9WR2g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.0.69] ([87.177.78.219]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mn2W5-1vAQYh3tvL-00lc1v; Wed, 18
 Jun 2025 22:06:33 +0200
Message-ID: <09403187-7746-42a6-88fe-7ca9e658962d@gmx.de>
Date: Wed, 18 Jun 2025 22:06:31 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] Documentation: laptops: Add documentation for
 uniwill laptops
To: Randy Dunlap <rdunlap@infradead.org>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-4-W_Armin@gmx.de>
 <45184ccd-04c7-4883-9500-8a628272c2cd@infradead.org>
Content-Language: en-US
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <45184ccd-04c7-4883-9500-8a628272c2cd@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:lwr2qAtd31P6bLuu9Rs26u6WJfsec6ukRF/ziJuip7+l2ftMJ87
 lJBvbR7vtasa+9F90eaA8KTxHCYFKfJBo3jFfwRtFvYTcSPJ78DfSKptljibtMpzDtOAPIm
 EJmSwEwCWwk8HP5RZ0QmoQuGtLM8NdH92bfy+nuQ9RH/HuV2zcNsuK23sc1dDyoUy87F/38
 RJa6W3kSCISjJBL3yhNbg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:D7UfdWnRRN8=;xvU0o17qrfSwAs+OuwhY3BGoF57
 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

Am 18.06.25 um 08:23 schrieb Randy Dunlap:

> Hi,
>
> On 6/15/25 10:59 AM, Armin Wolf wrote:
>> Add documentation for admins regarding Uniwill laptops. This should
>> help users to setup the uniwill-laptop and uniwill-wmi drivers, which
>> sadly cannot be loaded automatically.
>>
>> Reported-by: cyear <chumuzero@gmail.com>
>> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
>> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>> ---
>>   Documentation/admin-guide/laptops/index.rst   |  1 +
>>   .../admin-guide/laptops/uniwill-laptop.rst    | 68 +++++++++++++++++++
>>   MAINTAINERS                                   |  1 +
>>   3 files changed, 70 insertions(+)
>>   create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst
>
>> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> new file mode 100644
>> index 000000000000..8b977c09e747
>> --- /dev/null
>> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
>> @@ -0,0 +1,68 @@
>> +.. SPDX-License-Identifier: GPL-2.0+
>> +
>> +Uniwill laptop extra features
>> +=============================
>> +
>> +On laptops manufactured by Uniwill (either directly or as ODM), the ``uniwill-laptop`` and
>> +``uniwill-wmi`` driver both handle various platform-specific features.
>> +However due to a design flaw in the underlying firmware interface, both drivers might need
>> +to be loaded manually on some devices.
>> +
>> +.. warning:: Not all devices supporting the firmware interface will necessarily support those
>> +             drivers, please be careful.
>> +
>> +Module Loading
>> +--------------
>> +
>> +The ``uniwill-laptop`` driver relies on a DMI table to automatically load on supported devices.
>> +When using the ``force`` module parameter, this DMI check will be omitted, allowing the driver
>> +to be loaded on unsupported devices for testing purposes.
>> +
>> +The ``uniwill-wmi`` driver always needs to be loaded manually. However the ``uniwill-laptop``
>> +driver will automatically load it as a dependency.
>> +
>> +Hotkeys
>> +-------
>> +
>> +Usually the FN keys work without a special driver. However as soon as the ``uniwill-laptop`` driver
>> +is loaded, the FN keys need to be handled manually. This is done by the ``uniwill-wmi`` driver.
>> +
>> +Keyboard settings
>> +-----------------
>> +
>> +The ``uniwill-laptop`` driver allows the user to enable/disable:
>> +
>> + - the FN and super key lock functionality of the integrated keyboard
>> + - the touchpad toggle functionality of the integrated touchpad
> What is this touchpad toggle functionality, please?

The integrated touchpad has a button to enable/disable touchpad input. This feature can be
enabled/disabled using this setting.

Thanks,
Armin Wolf

>> +
>> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
>> +
>> +Hwmon interface
>> +---------------
>> +
>> +The ``uniwill-laptop`` driver supports reading of the CPU and GPU temperature and supports up to
>> +two fans. Userspace applications can access sensor readings over the hwmon sysfs interface.
>> +
>> +Platform profile
>> +----------------
>> +
>> +Support for changing the platform performance mode is currently not implemented.
>> +
>> +Battery Charging Control
>> +------------------------
>> +
>> +The ``uniwill-laptop`` driver supports controlling the battery charge limit. This happens over
>> +the standard ``charge_control_end_threshold`` power supply sysfs attribute. All values
>> +between 1 and 100 percent are supported.
>> +
>> +Additionally the driver signals the presence of battery charging issues thru the standard ``health``
>> +power supply sysfs attribute.
>> +
>> +Lightbar
>> +--------
>> +
>> +The ``uniwill-laptop`` driver exposes the lightbar found on some models as a standard multicolor
>> +led class device. The default name of this led class device is ``uniwill:multicolor:status``.
> s/led/LED/ 2 places, preferably.
>
>> +
>> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on how to control the various
>> +animation modes of the lightbar.
