Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281662957A7;
	Tue, 17 Jun 2025 23:18:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750202321; cv=none; b=jR+sxAmg+8cSEcytZ93DJOkPA8tU7er+uS5M9n+lMG5kwYR3+trGIRrZrG5msNLUbDhkWUz/IvCpDm1O34g2g3MekxsACQupe5DHQIM4RtGUyAVk5csPXJLszu9rpp5AAmUVvyGP2zRh5JLVpAe7UYhrAQFMfsWLojTeR93e4kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750202321; c=relaxed/simple;
	bh=/vMmGBqzE24P8FsLP9s5W+/tB04dPiPU+BJNaUonudc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=XWZkOR+wSnxvNZWt+89YE0J5gV6F8MbdthMhPlckbfyBfyFzEn4MGg44stoDNp8UNG8D9qe2JoXHZhMcln7yFVjNz4FGij9wLMmWMAoNMaD0DYT9tR4p0GFSzf1Ho3rydyBNOi2eIVQ2GRGGSQnHN4ct9AMFcoFOYZGWHXEPp3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XlAmBFu5; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XlAmBFu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750202320; x=1781738320;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=/vMmGBqzE24P8FsLP9s5W+/tB04dPiPU+BJNaUonudc=;
  b=XlAmBFu5xno0RhDR/unlkEb0BlTxY62qYFkSOk+/nozQfv8lY1v1v+ug
   jrt4RllkzfZ/5oT7GuOtzFQiRJTWFmFmx9zH6W/MQtNveQIviU/kX0vzz
   lUtw8cwRgLE35Ryu5Uxyq/aQJ1GHBXxk85v5XUFlq+fakCDjcaphnnUJV
   mbHxat453uzWOQiCX0T+g+FOi7T8zhenPKbmAkSQMtAHhfjVu/If67oKU
   LCNJT55fzxVlfr8fS+sVFeEAbx7u1rACQPWMwJQarUR8jvLID2MZWDpH2
   spF6HkkmmWNjtZDfSJyVrKEaVgKIEaHH4Q7Jg9Kgn9PVHVzJCyqMzOKIx
   A==;
X-CSE-ConnectionGUID: KYuM1V5wS+OLuK5ulcOpdg==
X-CSE-MsgGUID: BgvPeZ1rTfu1CgxDNOh3HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11467"; a="63821385"
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="63821385"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 16:18:38 -0700
X-CSE-ConnectionGUID: h3Yt53drQwKSeUK2twuIow==
X-CSE-MsgGUID: IfZEbRw/RVyShptRRlV8KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,244,1744095600"; 
   d="scan'208";a="179928707"
Received: from spandruv-desk.jf.intel.com ([10.54.75.16])
  by orviesa002.jf.intel.com with ESMTP; 17 Jun 2025 16:18:39 -0700
From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To: rafael@kernel.org,
	rui.zhang@intel.com
Cc: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] ACPI: DPTF: Support for Wildcat Lake
Date: Tue, 17 Jun 2025 16:18:24 -0700
Message-ID: <20250617231824.3314507-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add Wildcat Lake ACPI IDs for DPTF.

Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 drivers/acpi/dptf/dptf_power.c                          | 2 ++
 drivers/acpi/dptf/int340x_thermal.c                     | 7 +++++++
 drivers/acpi/fan.h                                      | 1 +
 drivers/thermal/intel/int340x_thermal/int3400_thermal.c | 1 +
 drivers/thermal/intel/int340x_thermal/int3403_thermal.c | 1 +
 5 files changed, 12 insertions(+)

diff --git a/drivers/acpi/dptf/dptf_power.c b/drivers/acpi/dptf/dptf_power.c
index e8caf4106ff9..776914f31b9e 100644
--- a/drivers/acpi/dptf/dptf_power.c
+++ b/drivers/acpi/dptf/dptf_power.c
@@ -238,6 +238,8 @@ static const struct acpi_device_id int3407_device_ids[] = {
 	{"INTC10A5", 0},
 	{"INTC10D8", 0},
 	{"INTC10D9", 0},
+	{"INTC1100", 0},
+	{"INTC1101", 0},
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, int3407_device_ids);
diff --git a/drivers/acpi/dptf/int340x_thermal.c b/drivers/acpi/dptf/int340x_thermal.c
index aef7aca2161d..a222df059a16 100644
--- a/drivers/acpi/dptf/int340x_thermal.c
+++ b/drivers/acpi/dptf/int340x_thermal.c
@@ -61,6 +61,13 @@ static const struct acpi_device_id int340x_thermal_device_ids[] = {
 	{"INTC10D7"},
 	{"INTC10D8"},
 	{"INTC10D9"},
+	{"INTC10FC"},
+	{"INTC10FD"},
+	{"INTC10FE"},
+	{"INTC10FF"},
+	{"INTC1100"},
+	{"INTC1101"},
+	{"INTC1102"},
 	{""},
 };
 
diff --git a/drivers/acpi/fan.h b/drivers/acpi/fan.h
index 15eba1c70e66..8a28a72a7c6a 100644
--- a/drivers/acpi/fan.h
+++ b/drivers/acpi/fan.h
@@ -20,6 +20,7 @@
 	{"INTC106A", }, /* Fan for Lunar Lake generation */ \
 	{"INTC10A2", }, /* Fan for Raptor Lake generation */ \
 	{"INTC10D6", }, /* Fan for Panther Lake generation */ \
+	{"INTC10FE", }, /* Fan for Wildcat Lake generation */ \
 	{"PNP0C0B", } /* Generic ACPI fan */
 
 #define ACPI_FPS_NAME_LEN	20
diff --git a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
index 0e07693ecf59..ecb4ea443b9b 100644
--- a/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3400_thermal.c
@@ -690,6 +690,7 @@ static const struct acpi_device_id int3400_thermal_match[] = {
 	{"INTC1068", 0},
 	{"INTC10A0", 0},
 	{"INTC10D4", 0},
+	{"INTC10FC", 0},
 	{}
 };
 
diff --git a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
index 5a925a8df7b3..ba63796761eb 100644
--- a/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
+++ b/drivers/thermal/intel/int340x_thermal/int3403_thermal.c
@@ -276,6 +276,7 @@ static const struct acpi_device_id int3403_device_ids[] = {
 	{"INTC1069", 0},
 	{"INTC10A1", 0},
 	{"INTC10D5", 0},
+	{"INTC10FD", 0},
 	{"", 0},
 };
 MODULE_DEVICE_TABLE(acpi, int3403_device_ids);
-- 
2.49.0

