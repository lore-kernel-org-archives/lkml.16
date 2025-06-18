Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54B2B1C8604;
	Wed, 18 Jun 2025 06:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227853; cv=none; b=tDf4BpGwtTONSY5lSTkEA2Jp9bPCqfNhBcxF73oO8NphRDuVlH2AmwMtpD7TssnYkocD0ldTZIgxg5qq0fcfpZJWAtsUIfhmF7IA2bFSfUKhb1BZEooHaeaYNMzOQnGylbzL/wR707OrmMODb1MDvPjtfd9P/wyEBdYpJsp1kiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227853; c=relaxed/simple;
	bh=onSnLvsz6DVt8iekrXxb1L4Z0MhwSokv1Ooo9nCMouo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=d/xtQ6EyULVpudOYliPvzAV8xtfKP4KIlB5+yUAebb8Odnho1iyzNnsD5Qpi5eqVF8WV5Hi7s94Vfdl4OwEq0qoo/2LCTHDyW59cKjGBWnRLP362zOq6UT1H7QS8cI7eJNMvfzmiJG+UGMAA+TwvYNxl/oIQPb+6Dj53hWwEOuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P3Q0wBnV; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P3Q0wBnV"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=Dhr4RW/Vvp94J0vVGybJ5KdBi6R1f3XY9y/GSp6VCSg=; b=P3Q0wBnV5IUeaW4j8mMKz5PV29
	vNNMYwAuNVjnongBRZtAZZqT3ftcvogT0IF7gmFmi+TwKr5JqYzufy8/BkgT7tbBlyYzcl/pwvS9t
	GbxdvlwftpW41stqvBzm4V8TnKI8WSoSaK3tnh0jQOU4n/wYXg3XhoVGDMqv9nGVC8DfGTW46cpzR
	o1UA11LqxIhHniB4Jlrin1Zlqv/DsignZCVa3ZEzZKChUjJEJSH/vN1mZUq3R+3y1jFNc5RtubqTf
	AE3v8wos+LVid05180XoGSAQ2Txr3qzvtgXBkeW5bdl59Rr7gfoXswBZkbqsKF/jl/tEkZNTxdVlc
	M66o0RWQ==;
Received: from [50.53.25.54] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRmD9-00000001WuR-0Qb3;
	Wed, 18 Jun 2025 06:23:51 +0000
Message-ID: <45184ccd-04c7-4883-9500-8a628272c2cd@infradead.org>
Date: Tue, 17 Jun 2025 23:23:46 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 3/3] Documentation: laptops: Add documentation for
 uniwill laptops
To: Armin Wolf <W_Armin@gmx.de>, ilpo.jarvinen@linux.intel.com,
 hdegoede@redhat.com, chumuzero@gmail.com, corbet@lwn.net, cs@tuxedo.de,
 wse@tuxedocomputers.com, ggo@tuxedocomputers.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250615175957.9781-1-W_Armin@gmx.de>
 <20250615175957.9781-4-W_Armin@gmx.de>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20250615175957.9781-4-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 6/15/25 10:59 AM, Armin Wolf wrote:
> Add documentation for admins regarding Uniwill laptops. This should
> help users to setup the uniwill-laptop and uniwill-wmi drivers, which
> sadly cannot be loaded automatically.
> 
> Reported-by: cyear <chumuzero@gmail.com>
> Closes: https://github.com/lm-sensors/lm-sensors/issues/508
> Closes: https://github.com/Wer-Wolf/uniwill-laptop/issues/3
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  Documentation/admin-guide/laptops/index.rst   |  1 +
>  .../admin-guide/laptops/uniwill-laptop.rst    | 68 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  3 files changed, 70 insertions(+)
>  create mode 100644 Documentation/admin-guide/laptops/uniwill-laptop.rst


> diff --git a/Documentation/admin-guide/laptops/uniwill-laptop.rst b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> new file mode 100644
> index 000000000000..8b977c09e747
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/uniwill-laptop.rst
> @@ -0,0 +1,68 @@
> +.. SPDX-License-Identifier: GPL-2.0+
> +
> +Uniwill laptop extra features
> +=============================
> +
> +On laptops manufactured by Uniwill (either directly or as ODM), the ``uniwill-laptop`` and
> +``uniwill-wmi`` driver both handle various platform-specific features.
> +However due to a design flaw in the underlying firmware interface, both drivers might need
> +to be loaded manually on some devices.
> +
> +.. warning:: Not all devices supporting the firmware interface will necessarily support those
> +             drivers, please be careful.
> +
> +Module Loading
> +--------------
> +
> +The ``uniwill-laptop`` driver relies on a DMI table to automatically load on supported devices.
> +When using the ``force`` module parameter, this DMI check will be omitted, allowing the driver
> +to be loaded on unsupported devices for testing purposes.
> +
> +The ``uniwill-wmi`` driver always needs to be loaded manually. However the ``uniwill-laptop``
> +driver will automatically load it as a dependency.
> +
> +Hotkeys
> +-------
> +
> +Usually the FN keys work without a special driver. However as soon as the ``uniwill-laptop`` driver
> +is loaded, the FN keys need to be handled manually. This is done by the ``uniwill-wmi`` driver.
> +
> +Keyboard settings
> +-----------------
> +
> +The ``uniwill-laptop`` driver allows the user to enable/disable:
> +
> + - the FN and super key lock functionality of the integrated keyboard
> + - the touchpad toggle functionality of the integrated touchpad

What is this touchpad toggle functionality, please?

> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details.
> +
> +Hwmon interface
> +---------------
> +
> +The ``uniwill-laptop`` driver supports reading of the CPU and GPU temperature and supports up to
> +two fans. Userspace applications can access sensor readings over the hwmon sysfs interface.
> +
> +Platform profile
> +----------------
> +
> +Support for changing the platform performance mode is currently not implemented.
> +
> +Battery Charging Control
> +------------------------
> +
> +The ``uniwill-laptop`` driver supports controlling the battery charge limit. This happens over
> +the standard ``charge_control_end_threshold`` power supply sysfs attribute. All values
> +between 1 and 100 percent are supported.
> +
> +Additionally the driver signals the presence of battery charging issues thru the standard ``health``
> +power supply sysfs attribute.
> +
> +Lightbar
> +--------
> +
> +The ``uniwill-laptop`` driver exposes the lightbar found on some models as a standard multicolor
> +led class device. The default name of this led class device is ``uniwill:multicolor:status``.

s/led/LED/ 2 places, preferably.

> +
> +See Documentation/ABI/testing/sysfs-driver-uniwill-laptop for details on how to control the various
> +animation modes of the lightbar.

-- 
~Randy

