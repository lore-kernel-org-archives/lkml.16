Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95A281FDA7B;
	Tue, 17 Jun 2025 01:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750124459; cv=none; b=LP8xGp55yln/VC3QOqdQ+TaE72QueFtwU7i3nY0OcgmyOhGwgzcSrxyOxUjaUvRd0LYvz5miFQ2wRif4l3zCpwRJtqMZ9tIaFwR74p8iNAfiYTHMYc6Aw6K8P2uuyVT3P8nwRUA6akeX/V2p9JoDFsWl3p97BHzWu3xX9iJp3JQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750124459; c=relaxed/simple;
	bh=XflA3He/uIQWKsjj58cuT+fiN2doM1NxpPliAQNNeWI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cA4edb1E4FbGJMrQZRI0Ny5AegrpBTsXPRSSdAIfQkqPV7Dwzaf5NflHwyW42N1kipvaFtk7sabwp5SGuzd6FqjJLmkzCpEV076ccmcrpDbEQSFtycYQNVwjMZytBHWltixSS33/nU6B8MPClv553JfWZ97ahRrNog3WY2zXSZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VwBgqN5g; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VwBgqN5g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750124458; x=1781660458;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XflA3He/uIQWKsjj58cuT+fiN2doM1NxpPliAQNNeWI=;
  b=VwBgqN5gfyypoYy6YAX3SFqIBPHuJj9l8s6ihMMSx/N0oMFRJPXzUJY2
   T/zoVKZy30+hHWZJdq+vHL+8bg9hPOSsGXfpAxTGpPLw34u32KN9SY56I
   B8XxQtWdFsSfmwYHf7fI2iYr85HdWOdddF2acKbLdwwl1UobIOXFOWwjN
   nx8HtzsjrjYicA6El+9lRvZA1YTtpR+nFTAq4TRHJ3/5KTIusAUN5WqTF
   gPOOXfdQYtNP/9thmrukTGaxz9iApftZ+qdW7ucNMO+ZnKQRU1PxSbyr0
   03fCe8vWTIlaoHE/aYSuAHdrd3lxC6YDH245ZGnINDNBELXfvLfoNnE/g
   Q==;
X-CSE-ConnectionGUID: RJQqFsGnRbatxv0PWxrPgg==
X-CSE-MsgGUID: 8gWL1g/MRrSOasIZ7OG8+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="62556570"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="62556570"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:54 -0700
X-CSE-ConnectionGUID: O4jfocQ7SoGkJAujRTwtYQ==
X-CSE-MsgGUID: O0z7k+4pQ52mCb+eW+1mGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148989481"
Received: from spandruv-desk2.amr.corp.intel.com (HELO debox1-desk4.intel.com) ([10.124.223.117])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 18:40:52 -0700
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
Subject: [PATCH V2 09/15] docs: Add ABI documentation for intel_pmt feature directories
Date: Mon, 16 Jun 2025 18:40:33 -0700
Message-ID: <20250617014041.2861032-10-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250617014041.2861032-1-david.e.box@linux.intel.com>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
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

Changes in v2:
  - Spell out RMID and add description of the feature.
  - Add a description of the watcher API
  - Update example to use snake case for pmt_sp_policy

 .../testing/sysfs-class-intel_pmt-features    | 134 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 135 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt-features

diff --git a/Documentation/ABI/testing/sysfs-class-intel_pmt-features b/Doc=
umentation/ABI/testing/sysfs-class-intel_pmt-features
new file mode 100644
index 000000000000..cddb30e5bdf6
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-class-intel_pmt-features
@@ -0,0 +1,134 @@
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
+      The watcher API provides a writable control interface that allows us=
er
+      configuration of monitoring behavior, such as setting the sampling or
+      reporting interval.
+    - Minimum supported time period for the watcher interface (millisecond=
s).
+
+  num_rmids
+    - Read-only
+    - Present if the feature supports RMID (Resource Monitoring ID) teleme=
try.
+      RMIDs are identifiers used by hardware to track and report resource =
usage,
+      such as memory bandwidth or energy consumption, on a per-logical-ent=
ity
+      basis (e.g., per core, thread, or process group).
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
+	pmt_sp_policy                            Available: Yes
+	mailbox                                  Available: Yes
+	bios_lock                                Available: Yes
diff --git a/MAINTAINERS b/MAINTAINERS
index b704107859a6..31ab584890cc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12387,6 +12387,7 @@ INTEL PMT DRIVERS
 M:	David E. Box <david.e.box@linux.intel.com>
 S:	Supported
 F:	Documentation/ABI/testing/sysfs-class-intel_pmt
+F:	Documentation/ABI/testing/sysfs-class-intel_pmt-features
 F:	drivers/platform/x86/intel/pmt/
=20
 INTEL PRO/WIRELESS 2100, 2200BG, 2915ABG NETWORK CONNECTION SUPPORT
--=20
2.43.0

