Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E5A1180A80;
	Mon, 10 Feb 2025 05:04:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739163884; cv=none; b=OEbMzvtJcnD7tbcZrag6y5iXeMFUhRyU3XIGbJs2JbiMDnjVthrDINLsXThLMIbAqAZPP98fnSJj2yXdE+7igeDevHE9s43bKvoe2Alwp5a1c/yf8JNv+mYnMen5Z0fJijfsV5fW49+qcNKSg2KgaVN0yu6+fAcV16alMum/C7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739163884; c=relaxed/simple;
	bh=BUMwJBFmmCgIajK9QzBHIVRRQQs+ucHortjyYy4kOlA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=RP5P/Z0RDwZH54SBnS0ZciZ8LODGYiGzhV5BT+IEfcykdCd6bETPcZG8b14sbjuGN+HprgIF9TpLbN5r+SwVgxp+AaNbAR0woHLiRrXnC97LVv1oIH1fwARoCr4VevFFy61w+XDBC5AhAA2Yiw15rru+AcuIQ/G/KRVOFE08P5g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C2VemQki; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C2VemQki"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739163883; x=1770699883;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=BUMwJBFmmCgIajK9QzBHIVRRQQs+ucHortjyYy4kOlA=;
  b=C2VemQkibTgA3fi7a8o7k3E9cA/q+eRjIVHjWsIkRbrA3dShG/KsoW+O
   q8JjP5MI+RTcOqAJQCvLaFJtedNyoH51ZZRHlcm1DlseA+W3QZg6Vd56B
   9k0oAseRkzdc75MP8IOMr8r3iaO87JTghXfAy/5hDLOkdJrSlriw32HHK
   NmVNvlKUdhQzJcfeDfWcrMN37g650Rj7auAyYyFJ1Fr/M4VzCABU/t5r6
   +cKJrx6iuwOWsek5lhzxFoqqGFg3jw6gNcavFXvk47YvdqDIj+2ZdEm3i
   alBA9gxmtDVUhVdqpFK/1X2oabmnTmtOPj1O9eQDIq8u3IaDi5z8WXetY
   g==;
X-CSE-ConnectionGUID: 76nmsuPRRgCOmSi0H6Pyvg==
X-CSE-MsgGUID: aOFW4lS7QZed9u9JYmM+lQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11340"; a="50369457"
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="50369457"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2025 21:04:43 -0800
X-CSE-ConnectionGUID: ruyGcTgATKOtt1Gx6Rsclg==
X-CSE-MsgGUID: sTGhxIZbRKmUc6N5AXB/5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,273,1732608000"; 
   d="scan'208";a="112312217"
Received: from inlubt0246.iind.intel.com ([10.191.24.87])
  by fmviesa008.fm.intel.com with ESMTP; 09 Feb 2025 21:04:39 -0800
From: subramanian.mohan@intel.com
To: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	gregkh@linuxfoundation.org,
	andriy.shevchenko@linux.intel.com,
	giometti@enneenne.com,
	tglx@linutronix.de,
	corbet@lwn.net
Cc: eddie.dong@intel.com,
	christopher.s.hall@intel.com,
	pandith.n@intel.com,
	thejesh.reddy.t.r@intel.com,
	david.zage@intel.com,
	srinivasan.chinnadurai@intel.com,
	subramanian.mohan@intel.com
Subject: [PATCH v13 4/4] ABI: pps: Add ABI documentation for Intel TIO
Date: Mon, 10 Feb 2025 10:34:21 +0530
Message-Id: <20250210050421.29256-5-subramanian.mohan@intel.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20250210050421.29256-1-subramanian.mohan@intel.com>
References: <20250210050421.29256-1-subramanian.mohan@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Subramanian Mohan <subramanian.mohan@intel.com>

Document sysfs interface for Intel Timed I/O PPS driver.

Signed-off-by: Lakshmi Sowjanya D <lakshmi.sowjanya.d@intel.com>
Signed-off-by: Subramanian Mohan <subramanian.mohan@intel.com>
---
 Documentation/ABI/testing/sysfs-pps-gen-tio | 6 ++++++
 MAINTAINERS                                 | 1 +
 2 files changed, 7 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-pps-gen-tio

diff --git a/Documentation/ABI/testing/sysfs-pps-gen-tio b/Documentation/ABI/testing/sysfs-pps-gen-tio
new file mode 100644
index 000000000000..3c34ff17a335
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-pps-gen-tio
@@ -0,0 +1,6 @@
+What:		/sys/class/pps-gen/pps-genx/enable
+Date:		April 2025
+KernelVersion:	6.15
+Contact:	Subramanian Mohan<subramanian.mohan@intel.com>
+Description:
+		Enable or disable PPS TIO generator output.
diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353d..d4280facbe51 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18916,6 +18916,7 @@ S:	Maintained
 W:	http://wiki.enneenne.com/index.php/LinuxPPS_support
 F:	Documentation/ABI/testing/sysfs-pps
 F:	Documentation/ABI/testing/sysfs-pps-gen
+F:	Documentation/ABI/testing/sysfs-pps-gen-tio
 F:	Documentation/devicetree/bindings/pps/pps-gpio.yaml
 F:	Documentation/driver-api/pps.rst
 F:	drivers/pps/
-- 
2.35.3

