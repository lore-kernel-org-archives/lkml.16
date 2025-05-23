Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC71A2DCBE6
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 05:21:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747977695; cv=none; b=Ey5NjLEnVNDzQ2eCVCYXGu1z+1GDqN4PvLQMxGHOr8WwQsPM5vcbfB47VZRyI1lXEvamOTHAGmrQx1JySIan3AZgXKjrlD8czs78DpHaNTLlldj65xOy0jH6OvdHD/AXCKKSJZX13p6qur/Kdm3fWJneYiS6MexKnZkSlZV/6oU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747977695; c=relaxed/simple;
	bh=OUflqYaLiHmpF8ejkL19iK4yd6eBFrL8ivkCY992qiA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DChreocE6Ca0+17VhB6DWZ3kwW+w+JAcCJFUT3ZB9CdvYMQ14S8Bu2/bwAj6f3z0IHHJnxTJTEWpRoPRRrtEtYdCCI9elIL/0p98Y0lqdsGUWqUMkW2qj3HJuXF1EqYJdGrMMdd3Z9VoRtKdS05ds6Lre+l3uVDONQ/DVzXKdWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gpuh17M+; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gpuh17M+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747977694; x=1779513694;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=OUflqYaLiHmpF8ejkL19iK4yd6eBFrL8ivkCY992qiA=;
  b=gpuh17M+68sjWB47M1Y79cQZEkPH3DhMDyPw90aOUAtzeXonsig+cPte
   LCbfwRu+PXGct3BTvHhyMp/YtqCs8lFLxAQyRyoqc9ZVArw2HhOWBI7ny
   LrjCRpVQVP6h+rKqBzC4j9+lX9Pbwyim9eaurx3UVns14qDxlg0zsjDdU
   5Prz0/cxxhRc/e9+VG8UyeZ5+ie+zWlgRoGcljoSCJ8aAwprddAMW4TQO
   rK9WXFkepmEG0v3nbGp5M78C736n62Z/aX+ZLDH7FMe0GBa3BPSqITuQC
   IdEBpu7qBjTjuBPc+zMPrEGz5iAkD1RtF/Ceb4pWomjz6ZbYEFgpY7vuy
   w==;
X-CSE-ConnectionGUID: rFLLvnsLR2W41ZPDyuc0zQ==
X-CSE-MsgGUID: dHCvHPWdRiSnUWF5tPbOlA==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="53836400"
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="53836400"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2025 22:21:34 -0700
X-CSE-ConnectionGUID: ITKx6m+qT+uyq9XmHH8tIg==
X-CSE-MsgGUID: RsDUNP2PRDuOR42HVTmSww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,308,1739865600"; 
   d="scan'208";a="140841228"
Received: from baandr0id001.iind.intel.com ([10.66.253.151])
  by fmviesa006.fm.intel.com with ESMTP; 22 May 2025 22:21:32 -0700
From: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
To: lenb@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Kaushlendra Kumar <kaushlendra.kumar@intel.com>
Subject: [PATCH] tools/power x86_energy_perf_policy: Add Android support for MSR device path
Date: Fri, 23 May 2025 10:50:59 +0530
Message-Id: <20250523052059.3360532-1-kaushlendra.kumar@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch adds support for Android by updating the MSR device path
handling in x86_energy_perf_policy. The code now uses /dev/msrN on
Android systems instead of the default /dev/cpu/N/msr path. Error
messages and modprobe instructions are also updated accordingly to
improve clarity for Android users.

Signed-off-by: Kaushlendra Kumar <kaushlendra.kumar@intel.com>
---
 .../x86_energy_perf_policy.c                  | 28 +++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
index ebda9c366b2b..0c42cecca6a3 100644
--- a/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
+++ b/tools/power/x86/x86_energy_perf_policy/x86_energy_perf_policy.c
@@ -682,11 +682,19 @@ int get_msr(int cpu, int offset, unsigned long long *msr)
 	int retval;
 	char pathname[32];
 	int fd;
-
+#if defined(ANDROID)
+	sprintf(pathname, "/dev/msr%d", cpu);
+#else
 	sprintf(pathname, "/dev/cpu/%d/msr", cpu);
+#endif
 	fd = open(pathname, O_RDONLY);
 	if (fd < 0)
+#if defined(ANDROID)
+		err(-1, "%s open failed, try chown or chmod +r /dev/msr*, or run as root",
+		    pathname);
+#else
 		err(-1, "%s open failed, try chown or chmod +r /dev/cpu/*/msr, or run as root", pathname);
+#endif
 
 	retval = pread(fd, msr, sizeof(*msr), offset);
 	if (retval != sizeof(*msr)) {
@@ -706,11 +714,19 @@ int put_msr(int cpu, int offset, unsigned long long new_msr)
 	char pathname[32];
 	int retval;
 	int fd;
-
+#if defined(ANDROID)
+	sprintf(pathname, "/dev/msr%d", cpu);
+#else
 	sprintf(pathname, "/dev/cpu/%d/msr", cpu);
+#endif
 	fd = open(pathname, O_RDWR);
 	if (fd < 0)
+#if defined(ANDROID)
+		err(-1, "%s open failed, try chown or chmod +r /dev//msr*, or run as root",
+		    pathname);
+#else
 		err(-1, "%s open failed, try chown or chmod +r /dev/cpu/*/msr, or run as root", pathname);
+#endif
 
 	retval = pwrite(fd, &new_msr, sizeof(new_msr), offset);
 	if (retval != sizeof(new_msr))
@@ -1385,10 +1401,18 @@ void probe_dev_msr(void)
 	struct stat sb;
 	char pathname[32];
 
+#if defined(ANDROID)
+	sprintf(pathname, "/dev/msr%d", base_cpu);
+#else
 	sprintf(pathname, "/dev/cpu/%d/msr", base_cpu);
+#endif
 	if (stat(pathname, &sb))
 		if (system("/sbin/modprobe msr > /dev/null 2>&1"))
+#if defined(ANDROID)
+			err(-5, "no /dev/msr0, Try \"# modprobe msr\" ");
+#else
 			err(-5, "no /dev/cpu/0/msr, Try \"# modprobe msr\" ");
+#endif
 }
 
 static void get_cpuid_or_exit(unsigned int leaf,
-- 
2.34.1

