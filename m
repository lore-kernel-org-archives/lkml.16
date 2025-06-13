Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F85D258CEC;
	Fri, 13 Jun 2025 09:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749805646; cv=none; b=ti9+bmmD/eY03hgLeziM2JIR1q1mFhFuWOi1WaXBI7z1Xgr23TC7Z9qYzLWz87ul+pTPg8SyI6k7O12cD/QKEGV1n/JtGm+HLntjzRmQmA1C3WizK2br+VcE35Jn39Ekoze5wwWZUPzlUEsroAjy9yt8QRfPU+IxIvlDnSdzHH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749805646; c=relaxed/simple;
	bh=SSoLBs1Dj9VaOQGgLvM3js2Zg2+so1xSH1u+6KrD7sE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=sRN/Pjdr2cIm6/M80R0Fn30LZszIAczt9A3xrDZ0SPitATB3lJsAM/ct26Mkg9+Pj8IabQW5ThKvhXBS3+q5U2FsQq5Vfs91w3/P/5YUcNFXaBNM6y1q/yzOV7xNzQSxDrabD/Sov00Tlm9kRIwtrUkJ9E5cAhhrPBNdllVpExs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CoxbCyoD; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CoxbCyoD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749805644; x=1781341644;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=SSoLBs1Dj9VaOQGgLvM3js2Zg2+so1xSH1u+6KrD7sE=;
  b=CoxbCyoDxK5NWXSI93BEDQkNZlOnP65edoWFyOfUajRP9z/lBQKsn3kk
   kdcHjijrHUMAxWTNmhRQEZkrbnosVibpctAfypzwcpql12Fwa4Yo/uBt3
   SJvMyBx/8n6J6VVvBv/QSWH86kbi0eX0oJSmXb6bFO4XF6di2bonFsG3A
   k2L+Ao9yTbmGJJ6p5PBeT0dxYMRMy2AmPX5pBfzsNUFXdwvCWDXm1EAQi
   is845YOwvb2RplL0xt+Q39+iT9w87MK4Yir2U6ALkcjvM2AeA6+TfJrpI
   QejTtKsZgvEyIwxc+SB4B7SxEEW+AIz0bqhKeVd5qbIkGtmDbqvp01cYn
   w==;
X-CSE-ConnectionGUID: LiwomMADSBmLs/nLwpFJfQ==
X-CSE-MsgGUID: o2T5Fj4UTKepwPDevYmYLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11462"; a="51994958"
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="51994958"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 02:07:23 -0700
X-CSE-ConnectionGUID: +Sn6F1J4S7S/IR6NZecJ1w==
X-CSE-MsgGUID: bpdT6QYLQEitc82RVDRyZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,233,1744095600"; 
   d="scan'208";a="148665506"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.102])
  by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2025 02:07:17 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Fri, 13 Jun 2025 12:07:14 +0300 (EEST)
To: "Derek J. Clark" <derekjohn.clark@gmail.com>
cc: Hans de Goede <hdegoede@redhat.com>, Armin Wolf <W_Armin@gmx.de>, 
    Jonathan Corbet <corbet@lwn.net>, Mario Limonciello <superm1@kernel.org>, 
    Luke Jones <luke@ljones.dev>, Xino Ni <nijs1@lenovo.com>, 
    Zhixin Zhang <zhangzx36@lenovo.com>, Mia Shao <shaohz1@lenovo.com>, 
    Mark Pearson <mpearson-lenovo@squebb.ca>, 
    "Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>, 
    "Cody T . H . Chiu" <codyit@gmail.com>, John Martens <johnfanv2@gmail.com>, 
    Kurt Borja <kuurtb@gmail.com>, platform-driver-x86@vger.kernel.org, 
    linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v12 0/6] platform/x86: Add Lenovo WMI Gaming Series
 Drivers
In-Reply-To: <20250609185027.7378-1-derekjohn.clark@gmail.com>
Message-ID: <facbb66b-ea34-bc57-d673-adb84f79fb8d@linux.intel.com>
References: <20250609185027.7378-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 9 Jun 2025, Derek J. Clark wrote:

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
> v12:
>  - Fix warnings from make W=1
> v11:
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
>  drivers/platform/x86/lenovo-wmi-gamezone.c    | 409 +++++++++++
>  drivers/platform/x86/lenovo-wmi-gamezone.h    |  20 +
>  drivers/platform/x86/lenovo-wmi-helpers.c     |  74 ++
>  drivers/platform/x86/lenovo-wmi-helpers.h     |  20 +
>  drivers/platform/x86/lenovo-wmi-other.c       | 665 ++++++++++++++++++
>  drivers/platform/x86/lenovo-wmi-other.h       |  16 +
>  15 files changed, 2116 insertions(+)
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

Hi Derek,

Could you please rebase this on top of for-next placing the files under 
lenovo/ folder which we just created. I could have easily changed the 
placement of the files themselves, but making the Kconfig & Makefile 
changes into the new files while applying would have been more 
complicated. It is better you do it so I won't end up messing up anything.

There's the lenovo-target in lenovo/Makefile which will auto add the 
'lenovo-' prefix to the files so you can basically rename the files like 
this:

drivers/platform/x86/lenovo-wmi-other.c ->
drivers/platform/x86/lenovo/wmi-other.c

...and add them using that lenovo-target.

-- 
 i.

