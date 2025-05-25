Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47CE21991B2;
	Sun, 25 May 2025 21:20:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748208032; cv=none; b=gJv8IS5IggrLrxDBxUjHhuuKjweNECJK0CPR5jdvYzL+NcH7IrErHudtWVElXdE0x1ws3KCQsxlrEuulmEv4/7Jtf7ZMxirFdkZDQjYPIT/uojoINrBwQ0GKaSakKetaPi46WVlIN+wl0TVT6zn1pxZJVYB02USKq8DQ47nTR4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748208032; c=relaxed/simple;
	bh=EDFuoyMcYd+ir+l9BqvYDoBIwYbeyOUDXC3ohXNUvQk=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=h7SbfY9ovL7/K0zhBjbSbcUwZ9/j9J+oL7ZRnDZMUMzHRRRGq/QNvp59dW0e+TdIPGhen+KBQ5Qe7zTGVEMqtXCgH1v67nZi0gJc1V/wxBiCoTxbbsP+pA0lTG+AKwZCSaUu/jhQ2KRE2EH6kdZxlUhLxA1cRZSy0TbPt+j2TYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S28dTJQg; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S28dTJQg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748208031; x=1779744031;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=EDFuoyMcYd+ir+l9BqvYDoBIwYbeyOUDXC3ohXNUvQk=;
  b=S28dTJQgcSZDni7hNdgNze2KRzV+L3274uqB3uHhs204AvXi5P7+vP1C
   2UyZVGXlSE42z536ghy4YxG3/dHD4vT3gAwn/ZMixB9SYVIriB3TAFJI9
   OQnpncBdT3Xq//5grqR/GsbYcYrUWMbBDr7O9sIhGTuf0N9eSAF4C1Ie8
   07rFTniMjZoBHi1ROyhOLHt7hsvaLBKYwKuL/o0jzT3NY9JR5bjLu8yLH
   9cF14yHOESYhNvLBekXS5r3vwm7yV729lklvyV4vW5cv6nLJlxwdmYVTV
   hbo00hdMDI2W/qam16nZj35sivOjbHa51PLQthI/sGo3yAE9t+oDi4n9s
   Q==;
X-CSE-ConnectionGUID: n2DOhzecRvW+Rxap95DngQ==
X-CSE-MsgGUID: fWDIfK0ZTqmL76GpeG2/eQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="61237222"
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="61237222"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:20:30 -0700
X-CSE-ConnectionGUID: 7Hl4ydr1QKmbMwrKiIV0Hw==
X-CSE-MsgGUID: QSLjaHziS2eoN8sToUShvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,314,1739865600"; 
   d="scan'208";a="141981976"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.99])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 14:20:24 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 26 May 2025 00:20:20 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . -H . Chiu" <codyit@gmail.com>, 
    John Martens <johnfanv2@gmail.com>, Kurt Borja <kuurtb@gmail.com>, 
    platform-driver-x86@vger.kernel.org, linux-doc@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v11 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
In-Reply-To: <20250522015350.471070-1-derekjohn.clark@gmail.com>
Message-ID: <2972c4c6-7080-e058-ec39-b8c1dc603f7a@linux.intel.com>
References: <20250522015350.471070-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Wed, 21 May 2025, Derek J. Clark wrote:

> Adds support for the Lenovo "Gaming Series" of laptop hardware that use
> WMI interfaces that control various power settings. There are multiple WMI
> interfaces that work in concert to provide getting and setting values as
> well as validation of input. Currently only the "Gamezone", "Other
> Mode", and "LENOVO_CAPABILITY_DATA_01" interfaces are implemented, but
> I attempted to structure the driver so that adding the "Custom Mode",
> "Lighting", and other data block interfaces would be trivial in later
> patches.
> 
> This driver attempts to standardize the exposed sysfs by mirroring the
> asus-armoury driver currently under review. As such, a lot of
> inspiration has been drawn from that driver.
> https://lore.kernel.org/platform-driver-x86/20250319065827.53478-1-luke@ljones.dev/#t
> 
> The drivers have been tested by me on the Lenovo Legion Go and Legion Go
> S.
> 
> Suggested-by: Mario Limonciello <superm1@kernel.org>
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>
> Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
> ---
> v11:
>   - Fix formmating issues.

Thanks for the update, I've applied this now into the review-ilpo-next 
branch. BUT, this is very late in the cycle now and if there's a build 
issue (or LKP doesn't build test it in reasonable time), I'll have to drop 
this series and postpone it into the next cycle as I don't want to delay 
the main PR to Linus too long.

But lets hope for the best, I think some depends on issues were fixed 
earlier (IIRC), so hopefully it works good enough now. :-)

--
 i.

> v10:
> https://lore.kernel.org/platform-driver-x86/20250515182224.8277-1-derekjohn.clark@gmail.com/
> v9:
> https://lore.kernel.org/platform-driver-x86/20250508235217.12256-1-derekjohn.clark@gmail.com/
> v8:
> https://lore.kernel.org/platform-driver-x86/20250505010659.1450984-1-derekjohn.clark@gmail.com/
> v7:
> https://lore.kernel.org/platform-driver-x86/20250503000142.1190354-1-derekjohn.clark@gmail.com/
> v6:
> https://lore.kernel.org/platform-driver-x86/20250428012029.970017-1-derekjohn.clark@gmail.com/
> v5:
> https://lore.kernel.org/platform-driver-x86/20250408012815.1032357-1-derekjohn.clark@gmail.com/
> v4:
> https://lore.kernel.org/platform-driver-x86/20250317144326.5850-1-derekjohn.clark@gmail.com/
> v3:
> https://lore.kernel.org/platform-driver-x86/20250225220037.16073-1-derekjohn.clark@gmail.com/
> v2:
> https://lore.kernel.org/platform-driver-x86/20250102004854.14874-1-derekjohn.clark@gmail.com/
> v1:
> https://lore.kernel.org/platform-driver-x86/20241217230645.15027-1-derekjohn.clark@gmail.com/
> 
> Derek J. Clark (6):
>   platform/x86: Add lenovo-wmi-* driver Documentation
>   platform/x86: Add lenovo-wmi-helpers
>   platform/x86: Add Lenovo WMI Events Driver
>   platform/x86: Add Lenovo Capability Data 01 WMI Driver
>   platform/x86: Add Lenovo Gamezone WMI Driver
>   platform/x86: Add Lenovo Other Mode WMI Driver
> 
>  .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++
>  .../wmi/devices/lenovo-wmi-other.rst          | 108 +++
>  MAINTAINERS                                   |  12 +
>  drivers/platform/x86/Kconfig                  |  41 ++
>  drivers/platform/x86/Makefile                 |   5 +
>  drivers/platform/x86/lenovo-wmi-capdata01.c   | 302 ++++++++
>  drivers/platform/x86/lenovo-wmi-capdata01.h   |  25 +
>  drivers/platform/x86/lenovo-wmi-events.c      | 196 ++++++
>  drivers/platform/x86/lenovo-wmi-events.h      |  20 +
>  drivers/platform/x86/lenovo-wmi-gamezone.c    | 407 +++++++++++
>  drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
>  drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
>  drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
>  drivers/platform/x86/lenovo-wmi-other.c       | 665 ++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-other.h       |  16 +
>  15 files changed, 2114 insertions(+)
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
>  create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst
>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-capdata01.h
>  create mode 100644 drivers/platform/x86/lenovo-wmi-events.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-events.h
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-gamezone.h
>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-helpers.h
>  create mode 100644 drivers/platform/x86/lenovo-wmi-other.c
>  create mode 100644 drivers/platform/x86/lenovo-wmi-other.h
> 
> 
