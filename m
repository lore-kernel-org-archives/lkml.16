Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C56BC35966;
	Mon,  3 Feb 2025 09:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738574455; cv=none; b=jFcH0yX/pRyMO9s1GArdzm9E5dq978JXnlTchiSlyhWOeFOzVgFyMJwzb2M///yQkB7AkcdDw8VskSZ5vfC8cwDiyzL5VnWni48mCPqEMEZFxLzaR1pLFdJlxgUMVbZHJyoqTzH9pvTPR6hKqw9uxxDhmZuGJwfbFkJIIiOVMAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738574455; c=relaxed/simple;
	bh=8nLfpnzQDcxbHNzeLggAsAc2VUzfaRKt25oxEShK2/I=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=FNGo/FyWUVBD9OWHSbTlua77/+4/WA1tETmox1Wqw+Li4kszO1gZnefP/kK1nAj6+2PdqKOfzwUJzhY7AwDekFjk2/5do9q0vrVLBLh2uhNTh2aFv/czrNw3zqQBaHbUdhFYlm+JJbiLdZxfNhddrHkv+D2eLw4QoQs4zf2Bp4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AEp9n6HY; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AEp9n6HY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738574454; x=1770110454;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=8nLfpnzQDcxbHNzeLggAsAc2VUzfaRKt25oxEShK2/I=;
  b=AEp9n6HYiwKi9Lg3EsAMptPZE3zhXGggbBoe3OO9K5rudTV51UQ8SXw7
   3dK2Nc914YVi89pGAJ1vCA0+znnISQuUxic/N5K74bJatOByJNRCXKki8
   4axQMIO+m5wnxe1cDTutNUiR5RVStKNWqrddD0gjgVxyJ3sYuM9JmrMGD
   zu/G7uh98nbrkfFarolJZgcyRmF7SAbHAASAYGpVNsdWuAnXJfIJ9XVs4
   e6yRHh/VU53dQoNtxRfrsyh1t47mEP8MyAtiXekJgwdZp5/yHiFDongkc
   diu6oD5s8WxMrvSBhOq7bW6uD8rz66bPs33UaOvEeXZvUJC0dJ0/oCk5j
   A==;
X-CSE-ConnectionGUID: QXX36E+TRq+GF4Dh2d5IUg==
X-CSE-MsgGUID: 7H6PpG/7Q4yE3zlrdKy7Vw==
X-IronPort-AV: E=McAfee;i="6700,10204,11334"; a="38964613"
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="38964613"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:20:53 -0800
X-CSE-ConnectionGUID: 4O4lhcyqSRCPQNsBq2Uk5Q==
X-CSE-MsgGUID: uchkHYW0RJ+jTk9z55UjYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,255,1732608000"; 
   d="scan'208";a="110184227"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.194])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2025 01:20:50 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Mon, 3 Feb 2025 11:20:46 +0200 (EET)
To: Kurt Borja <kuurtb@gmail.com>
cc: platform-driver-x86@vger.kernel.org, Armin Wolf <W_Armin@gmx.de>, 
    Mario Limonciello <mario.limonciello@amd.com>, 
    Hans de Goede <hdegoede@redhat.com>, Dell.Client.Kernel@dell.com, 
    LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v7 00/14] platform/x86: alienware-wmi driver rework
In-Reply-To: <20250203062055.2915-1-kuurtb@gmail.com>
Message-ID: <c6e10cdd-6fba-6e8b-0913-66766cb9248e@linux.intel.com>
References: <20250203062055.2915-1-kuurtb@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Mon, 3 Feb 2025, Kurt Borja wrote:

> Hi!
>
> I bring some last minute modifications.
> 
> I found commit
> 
> 	8d8fc146dd7a ("nvmem: core: switch to use device_add_groups()")
> 
> which states that it's unnecesary to call device_remove_groups() when
> the device is removed, so I dropped it to simplify things.

Hi Kurt,

> I also found commit
> 
> 	957961b6dcc8 ("hwmon: (oxp-sensors) Move tt_toggle attribute to dev_groups")
> 
> which states that no driver should add sysfs groups while probing the
> device as it races with userspace, so I re-added PROBE_FORCE_SYNCHRONOUS
> to the platform driver, so groups are added only after the device has
> finished probing.
>
> I'm not 100% sure that the second commit message applies here, but it is
> revd-by Greg K-H so I added it just in case.

Which is why .dev_groups should be used as it is able to avoid those 
races on driver core level.

Why you call device_add_groups() at all? Can't you just insert it into 
.dev_groups member in alienware_wmax_wmi_driver?

-- 
 i.

> Aside from that, I added .pprof to awcc_quirks because I'm going to add
> support for new features after this series, and it makes sense that
> force_platform_profile only forces the pprof and not other upcoming
> features.
> 
> ~ Kurt
> ---
> [02/14]
>   - In alienware_alienfx_setup() add a devm action to remove the created
>     platform device
>   - Drop device_remove_groups() in WMAX .remove callback
>   - Add PROBE_FORCE_SYNCHRONOUS to the platform driver
>   - Drop .remove callbacks on both WMI drivers
> 
> [03/14]
>   - Add awcc_platform_profile_init() to create the platform_profile
>     device on quirks->thermal == true condition
> 
> [07/14]
>   - Add .pprof to awcc_quirks
> 
> [10/14]
>   - Drop unused member `quirks` on `alienfx_priv` (remnant of another
>     version)
> 
> v6: https://lore.kernel.org/platform-driver-x86/20250127040406.17112-1-kuurtb@gmail.com/
> 
> Kurt Borja (14):
>   platform/x86: alienware-wmi: Add a state container for LED control
>     feature
>   platform/x86: alienware-wmi: Add WMI Drivers
>   platform/x86: alienware-wmi: Add a state container for thermal control
>     methods
>   platform/x86: alienware-wmi: Refactor LED control methods
>   platform/x86: alienware-wmi: Refactor hdmi, amplifier, deepslp methods
>   platform/x86: alienware-wmi: Refactor thermal control methods
>   platform/x86: alienware-wmi: Split DMI table
>   MAINTAINERS: Update ALIENWARE WMI DRIVER entry
>   platform/x86: Rename alienware-wmi.c
>   platform/x86: Add alienware-wmi.h
>   platform/x86: Split the alienware-wmi driver
>   platform/x86: dell: Modify Makefile alignment
>   platform/x86: Update alienware-wmi config entries
>   platform/x86: alienware-wmi: Update header and module information
> 
>  MAINTAINERS                                   |    4 +-
>  drivers/platform/x86/dell/Kconfig             |   30 +-
>  drivers/platform/x86/dell/Makefile            |   45 +-
>  .../platform/x86/dell/alienware-wmi-base.c    |  496 +++++++
>  .../platform/x86/dell/alienware-wmi-legacy.c  |   95 ++
>  .../platform/x86/dell/alienware-wmi-wmax.c    |  790 +++++++++++
>  drivers/platform/x86/dell/alienware-wmi.c     | 1249 -----------------
>  drivers/platform/x86/dell/alienware-wmi.h     |  101 ++
>  8 files changed, 1534 insertions(+), 1276 deletions(-)
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi-base.c
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi-legacy.c
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi-wmax.c
>  delete mode 100644 drivers/platform/x86/dell/alienware-wmi.c
>  create mode 100644 drivers/platform/x86/dell/alienware-wmi.h
> 
> 
> base-commit: 05dbaf8dd8bf537d4b4eb3115ab42a5fb40ff1f5
> 
