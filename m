Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30C024C66C;
	Tue, 20 May 2025 14:51:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747752713; cv=none; b=hWMCpL1TQPJXMP/aiAcedA+3nHyoAiSZyTmuechcYsEYs4DRw7OI/DYhnQ8HegHvD2Lo7ZAXbcfWK80bNYDBffPvdK4tzrmrUvP1fMox6Dsnz3/kb8LJEAKaCaKJCkP6J5SIJtwltfZjDuaw1DumixBS07PBEu+OYpulX+bdmUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747752713; c=relaxed/simple;
	bh=HzZk53yXe64Q9JoYrPSSFLZy1uhVL1npi4obG+ABvaE=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=ge78vw7XVJSOz6CaINk3VNdWQ7qbEmmBTx4MX9+oh++NNaZ0zLIqKxl69M2rvQrOWOYFRagFo7ethSuzOskNsrnB5lDAD48GS8Q1Wb6e/YOOl+nMu1UGAYzZqmuslCFf1718BUySAnpK2SrWkM30vCquJjUz7kWtX2o/sKvCgfM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VOSMRSwj; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VOSMRSwj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747752712; x=1779288712;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=HzZk53yXe64Q9JoYrPSSFLZy1uhVL1npi4obG+ABvaE=;
  b=VOSMRSwjqxzJEsq8eXzl/FsvvSoPezeiiZ7n0Z6Cq9VyY5x+krjX/2iM
   I16qBLS7T4jfT82jcF9CxfEZxgZnhkTa5tX/WS5aPusMpfsnM+lhfZkCj
   pInsaZwipU/n80NIaS+z2GBaOYxeO+BIezNCIwjVPqLUJo6j1uWVOGJxT
   sgNtgV3k+b9YsV9KhvybGu884yB9ZmZIcf/gHe80+gUi3is/ToFiDYDEK
   1OaVgn2e20gPHJtChuoyhWteW7GmJsKDMyNinZIQ3ximC/uSgetEeJFGc
   iElXF4I4co6fIcRgFIzVw0J5Yrzu3OD4gf82FepX+CBckiH/0vZveuHUN
   A==;
X-CSE-ConnectionGUID: NHD9++6uSRe0dnuU8A98SA==
X-CSE-MsgGUID: u3nMVECaQ6i8CiQDfT7e4w==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="49622240"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="49622240"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:51:51 -0700
X-CSE-ConnectionGUID: ORl7SB1eRPaBmM8MXDhtqQ==
X-CSE-MsgGUID: 1lTvD0mKRJ6J4CdCqalxDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; 
   d="scan'208";a="140242843"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.235])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2025 07:51:47 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 20 May 2025 17:51:44 +0300 (EEST)
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    srinivas.pandruvada@linux.intel.com, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, 
    xi.pardee@linux.intel.com, Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH 09/15] docs: Add ABI documentation for intel_pmt feature
 directories
In-Reply-To: <20250430212106.369208-10-david.e.box@linux.intel.com>
Message-ID: <faecf78c-ee7e-686b-ab1d-f040050c55d8@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com> <20250430212106.369208-10-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-357066394-1747752704=:936"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-357066394-1747752704=:936
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Wed, 30 Apr 2025, David E. Box wrote:

> Add a new sysfs ABI documentation file describing the layout and content =
of
> the features-<PCI BDF>/ directory used by Intel PMT (Platform Monitoring
> Technology). This directory exposes telemetry and control feature details
> for a given PMT PCI device.
>=20
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  .../testing/sysfs-class-intel_pmt-features    | 128 ++++++++++++++++++
>  MAINTAINERS                                   |   1 +
>  2 files changed, 129 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-featu=
res
>=20
> diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/D=
ocumentation/ABI/testing/sysfs-class-intel_pmt-features
> new file mode 100644
> index 000000000000..6dfb9b4b30b5
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
> @@ -0,0 +1,128 @@
> +What:          /sys/class/intel_pmt/features-<PCI BDF>/
> +Date:          2025-04-24
> +KernelVersion: 6.16
> +Contact:       david.e.box@linux.intel.com
> +Description:
> +               The `features-<PCI BDF>/` directory represents the "featu=
res"
> +               capability exposed by Intel PMT (Platform Monitoring Tech=
nology)
> +               for the given PCI device.
> +
> +               Each directory corresponds to a PMT feature and contains
> +               attributes describing the available telemetry, monitoring=
, or
> +               control functionalities.
> +
> +Directory Structure:
> +
> +  /sys/class/intel_pmt/features-<PCI BDF>/
> +  =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry/=09=09# Per-accelera=
tor telemetry data
> +  =E2=94=9C=E2=94=80=E2=94=80 crash_log/=09=09=09# Contains system crash=
 telemetry logs
> +  =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry/=09# Enviro=
nmental telemetry per core
> +  =E2=94=9C=E2=94=80=E2=94=80 per_core_performance_telemetry/=09# Perfor=
mance telemetry per core
> +  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry/=09# Energy tele=
metry for RMIDs
> +  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_perf_telemetry/=09=09# Performanc=
e telemetry for RMIDs
> +  =E2=94=9C=E2=94=80=E2=94=80 tpmi_control/=09=09=09# TPMI-related contr=
ols and telemetry
> +  =E2=94=9C=E2=94=80=E2=94=80 tracing/=09=09=09=09# PMT tracing features
> +  =E2=94=94=E2=94=80=E2=94=80 uncore_telemetry/=09=09=09# Uncore telemet=
ry data
> +
> +Common Files (Present in all feature directories):
> +
> +  caps
> +    - Read-only
> +    - Lists available capabilities for this feature.
> +
> +  guids
> +    - Read-only
> +    - Lists GUIDs associated with this feature.
> +
> +Additional Attributes (Conditional Presence):
> +
> +  max_command_size
> +    - Read-only
> +    - Present if the feature supports out-of-band MCTP access.
> +    - Maximum supported MCTP command size for out-of-band PMT access (by=
tes).
> +
> +  max_stream_size
> +    - Read-only
> +    - Present if the feature supports out-of-band MCTP access.
> +    - Maximum supported MCTP stream size (bytes).
> +
> +  min_watcher_period_ms
> +    - Read-only
> +    - Present if the feature supports the watcher API.
> +    - Minimum supported time period for the watcher interface (milliseco=
nds).
> +
> +  num_rmids
> +    - Read-only
> +    - Present if the feature supports RMID telemetry.
> +    - Maximum number of RMIDs tracked simultaneously.
> +
> +Example:
> +For a device with PCI BDF `0000:00:03.1`, the directory tree could look =
like:
> +
> +  /sys/class/intel_pmt/features-0000:00:03.1/
> +  =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
> +  =E2=94=9C=E2=94=80=E2=94=80 crash_log/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
> +  =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
> +  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 num_rmids
> +  =E2=94=9C=E2=94=80=E2=94=80 tpmi_control/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=9C=E2=94=80=E2=94=80 tracing/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=9C=E2=94=80=E2=94=80 uncore_telemetry/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
> +
> +Notes:
> +  - Some attributes are only present if the corresponding feature suppor=
ts
> +    the capability (e.g., `max_command_size` for MCTP-capable features).
> +  - Features supporting RMIDs include `num_rmids`.
> +  - Features supporting the watcher API include `min_watcher_period_ms`.
> +  - The `caps` file provides additional information about the functional=
ity
> +    of the feature.
> +
> +Example 'caps' content for the 'tracing' feature:
> +
> +  /sys/class/intel_pmt/features-0000:00:03.1/
> +  =E2=94=9C=E2=94=80=E2=94=80 tracing/
> +  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
> +
> +=09telemetry                                Available: No
> +=09watcher                                  Available: Yes
> +=09crashlog                                 Available: No
> +=09streaming                                Available: No
> +=09threashold                               Available: No
> +=09window                                   Available: No
> +=09config                                   Available: Yes
> +=09tracing                                  Available: No
> +=09inband                                   Available: Yes
> +=09oob                                      Available: Yes
> +=09secure_chan                              Available: No
> +=09pmt_sp                                   Available: Yes
> +=09PMT SP Policy                            Available: Yes
> +=09mailbox                                  Available: Yes
> +=09bios_lock                                Available: Yes

It would be good to open RMID somewhere as I'm not sure if that acronym=20
is well-known.

> diff --git a/MAINTAINERS b/MAINTAINERS
> index bd9f99585894..10338ea81667 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -12181,6 +12181,7 @@ INTEL PMT DRIVERS
>  M:=09David E. Box <david.e.box@linux.intel.com>
>  S:=09Supported
>  F:=09Documentation/ABI/testing/sysfs-class-intel_pmt
> +F:=09Documentation/ABI/testing/sysfs-class-intel_pmt-features
>  F:=09drivers/platform/x86/intel/pmt/
> =20
>  INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
>=20

--=20
 i.

--8323328-357066394-1747752704=:936--
