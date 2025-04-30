Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2022D0ADD;
	Wed, 30 Apr 2025 21:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746048084; cv=none; b=NZcol22W2ilKHFj3VA05RiYZ58dY2dptyMJ648jgYmQpoC60cEvjzZ+d214kiAeqKY5PlFMKONtVZLIVnY0yVWaMdQrG8sfMoGB1OxuSgn9uYdrfawDUX2mJ/wzR4+8p2Kvc9AbgycHK58gugsNvORlbguFRrwwZhdLPUpmEjn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746048084; c=relaxed/simple;
	bh=Ed5KKuL7QB9+FeZsP+7au3QNKnRepENffiehN0892Gs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QPXEubYsrJq4Uo8fNZfZY3yUZzADXc8W6fLZMmXfo3Oq7Lq4U+leD3hKTJdJFzM0uempGPwUk9KyieupIlq4RqozCm9Xw1o7CA5uZygGPGw4QPkDy4lEmX8/iyfziGXxeOtMBw+Fwgt9U/gAbUp/erbO8blv3Si9suVEB/o1maU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XZxnb8G6; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XZxnb8G6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746048083; x=1777584083;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ed5KKuL7QB9+FeZsP+7au3QNKnRepENffiehN0892Gs=;
  b=XZxnb8G6bsaUy6KwMpkSI7mj+Z+phIJJmplH5cd1oojxb1RITkApatc4
   qwHK91vzkz/82umAY+/G2rSivcY5u+Yt6xQh9q8qhDtclBkMsqw2T1iJW
   X4ETvdY7rBc6XPqQSM/H7rXVONKzqv6T5GtnNPHTBTe28K8dBAA7m8GA2
   avtY84G/85XgpY1TKH7JNHZROI5Hb6l84Wq6f5X3jAhy/y4lvZLO1zLV3
   RwTLaRiIhd5/oXIUog3/lGJZF2bENJ4w+bz/hAC6FHh3Y/gHc7d/kl5BX
   yKIpzgUNTwrZLAnZskQp4EQBzGTqmmSq/LLWrtrHduR7yZk+IC0HQ8Mfb
   w==;
X-CSE-ConnectionGUID: 9a8eddX+QTqeWm6u3gRd3A==
X-CSE-MsgGUID: jFHnvinKRg66j5nvxSJ3Rw==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="65257547"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="65257547"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:16 -0700
X-CSE-ConnectionGUID: tvjSzugRRTakcWbuxzVcPw==
X-CSE-MsgGUID: UsbaxpXfSjeH+4YsUnwR4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="133972295"
Received: from agladkov-desk.ger.corp.intel.com (HELO debox1-desk4.lan) ([10.125.110.57])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 14:21:17 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	david.e.box@linux.intel.com,
	srinivas.pandruvada@linux.intel.com,
	andriy.shevchenko@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	tony.luck@intel.com,
	xi.pardee@linux.intel.com
Cc: hdegoede@redhat.com
Subject: [PATCH 09/15] docs: Add ABI documentation for intel_pmt feature directories
Date: Wed, 30 Apr 2025 14:20:58 -0700
Message-ID: <20250430212106.369208-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250430212106.369208-1-david.e.box@linux.intel.com>
References: <20250430212106.369208-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Add a new sysfs ABI documentation file describing the layout and content of
the features-<PCI BDF>/ directory used by Intel PMT (Platform Monitoring
Technology). This directory exposes telemetry and control feature details
for a given PMT PCI device.

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
 .../testing/sysfs-class-intel_pmt-features    | 128 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 129 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-features

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/Doc=
umentation/ABI/testing/sysfs-class-intel_pmt-features
new file mode 100644
index 000000000000..6dfb9b4b30b5
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
@@ -0,0 +1,128 @@
+What:          /sys/class/intel_pmt/features-<PCI BDF>/
+Date:          2025-04-24
+KernelVersion: 6.16
+Contact:       david.e.box@linux.intel.com
+Description:
+               The `features-<PCI BDF>/` directory represents the "feature=
s"
+               capability exposed by Intel PMT (Platform Monitoring Techno=
logy)
+               for the given PCI device.
+
+               Each directory corresponds to a PMT feature and contains
+               attributes describing the available telemetry, monitoring, =
or
+               control functionalities.
+
+Directory Structure:
+
+  /sys/class/intel_pmt/features-<PCI BDF>/
+  =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry/		# Per-accelerator te=
lemetry data
+  =E2=94=9C=E2=94=80=E2=94=80 crash_log/			# Contains system crash telemet=
ry logs
+  =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry/	# Environmen=
tal telemetry per core
+  =E2=94=9C=E2=94=80=E2=94=80 per_core_performance_telemetry/	# Performanc=
e telemetry per core
+  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry/	# Energy telemetr=
y for RMIDs
+  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_perf_telemetry/		# Performance tele=
metry for RMIDs
+  =E2=94=9C=E2=94=80=E2=94=80 tpmi_control/			# TPMI-related controls and =
telemetry
+  =E2=94=9C=E2=94=80=E2=94=80 tracing/				# PMT tracing features
+  =E2=94=94=E2=94=80=E2=94=80 uncore_telemetry/			# Uncore telemetry data
+
+Common Files (Present in all feature directories):
+
+  caps
+    - Read-only
+    - Lists available capabilities for this feature.
+
+  guids
+    - Read-only
+    - Lists GUIDs associated with this feature.
+
+Additional Attributes (Conditional Presence):
+
+  max_command_size
+    - Read-only
+    - Present if the feature supports out-of-band MCTP access.
+    - Maximum supported MCTP command size for out-of-band PMT access (byte=
s).
+
+  max_stream_size
+    - Read-only
+    - Present if the feature supports out-of-band MCTP access.
+    - Maximum supported MCTP stream size (bytes).
+
+  min_watcher_period_ms
+    - Read-only
+    - Present if the feature supports the watcher API.
+    - Minimum supported time period for the watcher interface (millisecond=
s).
+
+  num_rmids
+    - Read-only
+    - Present if the feature supports RMID telemetry.
+    - Maximum number of RMIDs tracked simultaneously.
+
+Example:
+For a device with PCI BDF `0000:00:03.1`, the directory tree could look li=
ke:
+
+  /sys/class/intel_pmt/features-0000:00:03.1/
+  =E2=94=9C=E2=94=80=E2=94=80 accelerator_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+  =E2=94=9C=E2=94=80=E2=94=80 crash_log/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=9C=E2=94=80=E2=94=80 per_core_environment_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+  =E2=94=9C=E2=94=80=E2=94=80 per_rmid_energy_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 num_rmids
+  =E2=94=9C=E2=94=80=E2=94=80 tpmi_control/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=9C=E2=94=80=E2=94=80 tracing/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=9C=E2=94=80=E2=94=80 uncore_telemetry/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 guids
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_command_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 max_stream_size
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 min_watcher_period_ms
+
+Notes:
+  - Some attributes are only present if the corresponding feature supports
+    the capability (e.g., `max_command_size` for MCTP-capable features).
+  - Features supporting RMIDs include `num_rmids`.
+  - Features supporting the watcher API include `min_watcher_period_ms`.
+  - The `caps` file provides additional information about the functionality
+    of the feature.
+
+Example 'caps' content for the 'tracing' feature:
+
+  /sys/class/intel_pmt/features-0000:00:03.1/
+  =E2=94=9C=E2=94=80=E2=94=80 tracing/
+  =E2=94=82   =E2=94=9C=E2=94=80=E2=94=80 caps
+
+	telemetry                                Available: No
+	watcher                                  Available: Yes
+	crashlog                                 Available: No
+	streaming                                Available: No
+	threashold                               Available: No
+	window                                   Available: No
+	config                                   Available: Yes
+	tracing                                  Available: No
+	inband                                   Available: Yes
+	oob                                      Available: Yes
+	secure_chan                              Available: No
+	pmt_sp                                   Available: Yes
+	PMT SP Policy                            Available: Yes
+	mailbox                                  Available: Yes
+	bios_lock                                Available: Yes
diff --git a/MAINTAINERS b/MAINTAINERS
index bd9f99585894..10338ea81667 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12181,6 +12181,7 @@ INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt
+F:	Documentation/ABI/testing/sysfs-class-intel_pmt-features
 F:	drivers/platform/x86/intel/pmt/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
--=20
2.43.0

