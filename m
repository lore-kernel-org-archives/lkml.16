Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC3291EEA5F
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 16:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751474880; cv=none; b=In/ayOqVZtjAsRtJWfyUxBKmX9oPrHUiftgFYDaQV3iwu8NqxWWL/LUwjlu2tALnpyLfgiPspyy7vwUaQ0B1X10bdIWz63t/EPK9Lo7RM80xtHZOvm+mkkpCoeY4mjwkLlXWKQLBlKoXmg1yD9RYcfgQgcZPfhhlmcpMoR7L6Gk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751474880; c=relaxed/simple;
	bh=u16CpbdUihPkyI+FiM2IX3TbeuU1zDLWDn5AwsQR/6k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=N+vqhU2I87RpgqXjVvqpYkvi1JkGCyTWVgwDa+iQwCR6qtKc4o3E4NjnjbUHBi83hQ1TJCW30pMVEZH443AhxzdMYorNrbUnWKbxTP4rA8KQT7g+/AgwbqkbC6lCGjxrugXZGv+cMDJs8/EEcDhu6joUm5tEAWfCQsGbCAkf9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BIs0LYRl; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BIs0LYRl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751474879; x=1783010879;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=u16CpbdUihPkyI+FiM2IX3TbeuU1zDLWDn5AwsQR/6k=;
  b=BIs0LYRlwZDz0M0YBeFOEg+wIUZFWW4W0t16qYW/xl86+903wxZN1maB
   OS+kEAehYNTYG/6akwyfT+0gprNE85ocIZ2VAJRLYtmK/P4zm4XNbxfdw
   QeOBtrAtZyRQZqDdDvOz+4hsUyRA7ZDksp2FbfnvYCstOvFEPqJT7ufE0
   weBjizGWAneQtxxyV81PcI9PBWjOG3cK0Jsr70VZM73uF7YmMI2dNtWRA
   teiiPJ5CCEsuIUPXWihIsdoKcLpIhAJnJUGBxV16hkh2LxDkTSq5YibCZ
   SnkGx+R+J4trHSuOB7M8tX78rW73KZ9Y2zRxDa81ivlb5J45WL2V9tFCp
   A==;
X-CSE-ConnectionGUID: hCv/dB+FQ12/YqwR1WC/Rw==
X-CSE-MsgGUID: 058MwKY8RDKltzqNJCDLRA==
X-IronPort-AV: E=McAfee;i="6800,10657,11482"; a="64380739"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="64380739"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:47:58 -0700
X-CSE-ConnectionGUID: u18Jat1PRwWDab7EmvPTSw==
X-CSE-MsgGUID: I7sM5QJmQOC5flBOXJJw9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="153535583"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 09:47:56 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v5 01/10] mei: bus: add mei_cldev_mtu interface
Date: Wed,  2 Jul 2025 22:22:07 +0530
Message-Id: <20250702165216.557074-2-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250702165216.557074-1-badal.nilawar@intel.com>
References: <20250702165216.557074-1-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Usyskin <alexander.usyskin@intel.com>

Allow to bus client to obtain client mtu.

Signed-off-by: Alexander Usyskin <alexander.usyskin@intel.com>
Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
---
 drivers/misc/mei/bus.c     | 13 +++++++++++++
 include/linux/mei_cl_bus.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/misc/mei/bus.c b/drivers/misc/mei/bus.c
index 67176caf5416..f860b1b6eda0 100644
--- a/drivers/misc/mei/bus.c
+++ b/drivers/misc/mei/bus.c
@@ -614,6 +614,19 @@ u8 mei_cldev_ver(const struct mei_cl_device *cldev)
 }
 EXPORT_SYMBOL_GPL(mei_cldev_ver);
 
+/**
+ * mei_cldev_mtu - max message that client can send and receive
+ *
+ * @cldev: mei client device
+ *
+ * Return: mtu or 0 if client is not connected
+ */
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev)
+{
+	return mei_cl_mtu(cldev->cl);
+}
+EXPORT_SYMBOL_GPL(mei_cldev_mtu);
+
 /**
  * mei_cldev_enabled - check whether the device is enabled
  *
diff --git a/include/linux/mei_cl_bus.h b/include/linux/mei_cl_bus.h
index 725fd7727422..a82755e1fc40 100644
--- a/include/linux/mei_cl_bus.h
+++ b/include/linux/mei_cl_bus.h
@@ -113,6 +113,7 @@ int mei_cldev_register_notif_cb(struct mei_cl_device *cldev,
 				mei_cldev_cb_t notif_cb);
 
 u8 mei_cldev_ver(const struct mei_cl_device *cldev);
+size_t mei_cldev_mtu(const struct mei_cl_device *cldev);
 
 void *mei_cldev_get_drvdata(const struct mei_cl_device *cldev);
 void mei_cldev_set_drvdata(struct mei_cl_device *cldev, void *data);
-- 
2.34.1

