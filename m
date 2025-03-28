Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5BE0C2F2;
	Fri, 28 Mar 2025 16:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743178979; cv=none; b=Ss7fr+iMq7UrqChkxDfaHAK7XLz3HNu/pI6aCNUw7YYV517Fb/VwsoXFsvo1LQV2E9iauNXd23qBuG9a29EybXFgIf+s9xVa89gpiGVeqtbEAAvQYpG4PoAYJBszHlqhfJKgZ4h+9UkkN0YDOrbX/+HA16yuIaHfnr1grK2+sHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743178979; c=relaxed/simple;
	bh=Ef5PBwKT4P+oC4XdvM7k/alPCz0kN/qqknbPORNtAZg=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=B3IAZCcLFa9bCHGQ+7Xi+6SLgzorKmreAq+ZcRUTjkTdxGVYjGghD3BUTXCRSp53Bh6xXmRN09MtwLLlYGoemB+OhUhXsi34o50N6iOsja9v8UNCef4XggSOTpTqO4bkWS/LWlkoj31NFSUchmXXvtJHAlRpTE3rDNa36qq8yNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k11RaNE9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k11RaNE9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743178978; x=1774714978;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Ef5PBwKT4P+oC4XdvM7k/alPCz0kN/qqknbPORNtAZg=;
  b=k11RaNE9FdzSwyBXbAMk+dKBIg4G+RrQedS7loJJVVZvI7BzmH151f3M
   VvRpfqk4TmSnLe1GyZKsjtA/4rk4sqLZdqFlpwZsw3jpac6DYfI/oJllh
   TB2Ykl/dsLO9xQggkVC6RFK6eERXxklhFPLs1exI0g22Z0CJ/peYFjI0z
   jbVkZ1BM03NXR0Jh8iGZhsuUIZBNq+hO/TMA/yLqnqvqUMdF4Z53/SLIF
   DapjAiGRpRSdpgzZVMAYXWwUwAAdaBOuXSoZMvTUIIHBWQEGSC8TlzV3x
   KtIwQr4YQQHtpW1nxeOrNNIt/nDXzcGN0rzLPVLcLXeCimokuFUj2+iiS
   g==;
X-CSE-ConnectionGUID: VBs6lPClSJO7gTg6R8/1Eg==
X-CSE-MsgGUID: BaiV7YcsSHWrnJNeoZY+Cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="44729264"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44729264"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:22:56 -0700
X-CSE-ConnectionGUID: iGboJiWaTOm3ySUxyixaRw==
X-CSE-MsgGUID: 81RXJ6tgQZGs921wgMeNUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125382635"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.244.43])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 09:22:54 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 28 Mar 2025 18:22:50 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: Armin Wolf <W_Armin@gmx.de>, Hans de Goede <hdegoede@redhat.com>, 
    platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 11/12] Documentation: admin-guide: laptops: Add
 documentation for alienware-wmi
In-Reply-To: <20250313-hwm-v6-11-17b57f787d77@gmail.com>
Message-ID: <0d6f1ec1-be44-4362-c574-064dd446873d@linux.intel.com>
References: <20250313-hwm-v6-0-17b57f787d77@gmail.com> <20250313-hwm-v6-11-17b57f787d77@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 13 Mar 2025, Kurt Borja wrote:

> Add driver admin-guide documentation for the alienware-wmi driver.
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Kurt Borja <kuurtb@gmail.com>
> ---
>  .../admin-guide/laptops/alienware-wmi.rst          | 128 +++++++++++++++++++++
>  Documentation/admin-guide/laptops/index.rst        |   1 +
>  MAINTAINERS                                        |   1 +
>  3 files changed, 130 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/alienware-wmi.rst b/Documentation/admin-guide/laptops/alienware-wmi.rst
> new file mode 100644
> index 0000000000000000000000000000000000000000..fe7dec73706f8ec85040dc1cbaec38ffda70b563
> --- /dev/null
> +++ b/Documentation/admin-guide/laptops/alienware-wmi.rst
> @@ -0,0 +1,128 @@
> +.. SPDX-License-Identifier: GPL-2.0-or-later
> +
> +====================
> +Alienware WMI Driver
> +====================
> +
> +Kurt Borja <kuurtb@gmail.com>
> +
> +This is a driver for the "WMAX" WMI device, which is found in most Dell gaming
> +laptops and controls various special features.
> +
> +Before the launch of M-Series laptops (~2018), the "WMAX" device controlled
> +basic RGB lighting, deep sleep mode, HDMI mode and amplifier status.
> +
> +Later, this device was completely repurpused. Now it mostly deals with thermal

repurposed

> +profiles, sensor monitoring and overclocking. This interface is named "AWCC" and
> +is known to be used by the AWCC OEM application to control these features.
> +
> +The alienware-wmi driver controls both interfaces.
> +
> +AWCC Interface
> +==============
> +
> +WMI device documentation: Documentation/wmi/devices/alienware-wmi.rst
> +
> +Supported devices
> +-----------------
> +
> +- Alienware M-Series laptops
> +- Alienware X-Series laptops
> +- Alienware Aurora Desktops
> +- Dell G-Series laptops
> +
> +If you believe your device supports the AWCC interface and you don't have any of
> +the features described in this document, try the following alienware-wmi module
> +parameters:
> +
> +- ``force_platform_profile=1``: Forces probing for platform profile support
> +- ``force_hwmon=1``: Forces probing for HWMON support
> +
> +If the module loads successfully with these parameters, consider submitting a
> +patch adding your model to the ``awcc_dmi_table`` located in
> +``drivers/platform/x86/dell/alienware-wmi-wmax.c`` or contacting the maintainer
> +for further guidance.
> +
> +Status
> +------
> +
> +The following features are currently supported:
> +
> +- :ref:`Platform Profile <platform-profile>`:
> +
> +  - Thermal profile control
> +
> +  - G-Mode toggling
> +
> +- :ref:`HWMON <hwmon>`:
> +
> +  - Sensor monitoring
> +
> +  - Manual fan control
> +
> +.. _platform-profile:
> +
> +Platform Profile
> +----------------
> +
> +The AWCC interface exposes various firmware defined thermal profiles. We expose

Please don't use "We".

-- 
 i.

> +these profiles to user-space through the Platform Profile class interface.
> +Refer to
> +:ref:`sysfs-class-platform-profile <abi_file_testing_sysfs_class_platform_profile>`
> +for more information.
> +
> +The name of the platform-profile class device exported by this driver is
> +"alienware-wmi" and it's path can be found with:
> +
> +::
> +
> + grep -l "alienware-wmi" /sys/class/platform-profile/platform-profile-*/name | sed 's|/[^/]*$||'
> +
> +If the device supports G-Mode, it is also toggled when selecting the
> +``performance`` profile.
> +
> +.. note::
> +   You may set the ``force_gmode`` module parameter to always try to toggle this
> +   feature, without checking if your model supports it.
> +
> +.. _hwmon:
> +
> +HWMON
> +-----
> +
> +The AWCC interface also supports sensor monitoring and manual fan control. Both
> +of these features are exposed to user-space through the HWMON interface.
> +
> +The name of the hwmon class device exported by this driver is "alienware_wmi"
> +and it's path can be found with:
> +
> +::
> +
> + grep -l "alienware_wmi" /sys/class/hwmon/hwmon*/name | sed 's|/[^/]*$||'
> +
> +Sensor monitoring is done through the standard HWMON interface. Refer to
> +:ref:`sysfs-class-hwmon <abi_file_testing_sysfs_class_hwmon>` for more
> +information.
> +
> +Manual fan control on the other hand, is not exposed directly by the AWCC
> +interface. Instead it let's us control a fan `boost` value. This `boost` value
> +has the following aproximate behavior over the fan pwm:
> +
> +::
> +
> + pwm = pwm_base + (fan_boost / 255) * (pwm_max - pwm_base)
> +
> +Due to the above behavior, we expose the fan `boost` control to user-space
> +through the following, custom hwmon sysfs attribute:
> +
> +=============================== ======= =======================================
> +Name				Perm	Description
> +=============================== ======= =======================================
> +fan[1-4]_boost			RW	Fan boost value.
> +
> +					Integer value between 0 and 255
> +=============================== ======= =======================================
> +
> +.. note::
> +   In some devices, manual fan control only works reliably if the ``custom``
> +   platform profile is selected.
> diff --git a/Documentation/admin-guide/laptops/index.rst b/Documentation/admin-guide/laptops/index.rst
> index e71c8984c23e43ca7cd6373b88803354dff6bc60..db842b629303c1bcf02646204d51938f9bd4043e 100644
> --- a/Documentation/admin-guide/laptops/index.rst
> +++ b/Documentation/admin-guide/laptops/index.rst
> @@ -7,6 +7,7 @@ Laptop Drivers
>  .. toctree::
>     :maxdepth: 1
>  
> +   alienware-wmi
>     asus-laptop
>     disk-shock-protection
>     laptop-mode
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 1afd30d00aecf9a48f8c71e156affd5f329539bd..c609bc321b8dc3ab0e8d92b04e42483be8cc171c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -796,6 +796,7 @@ M:	Kurt Borja <kuurtb@gmail.com>
>  L:	platform-driver-x86@vger.kernel.org
>  L:	Dell.Client.Kernel@dell.com
>  S:	Maintained
> +F:	Documentation/admin-guide/laptops/alienware-wmi.rst
>  F:	Documentation/wmi/devices/alienware-wmi.rst
>  F:	drivers/platform/x86/dell/alienware-wmi*
>  
> 
> 
