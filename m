Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B89632222CB
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 17:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748539450; cv=none; b=mnE/oIrk9JiEQgVZGJLB31LksDu3BeXZ3qzvcUZ5edJPCXaS23wBEOxWVCrl0YQ+Z8dcmdWKPDtO17UUNBuq4OIl8MT2WhC8WDonvwpY5dpgXfGgRHFCWdSgAKunpQld+45sZ6cuFBK3UKgGfn3vlgDLMcj5x7lyfhPPVpcG8EY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748539450; c=relaxed/simple;
	bh=TCNZ79DKxxL3606Erfrh0Gz5jMTFgc82a7Ox+P36FlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UeLzsZgvSYjJVYATDfIoeD3oUakHR5I7hgr4P7cPgLoZpilaK2Tz9cLvcROU+3d5K1eZ6d1PXmepI9EObQltc5f5NUgD25NUgMSsCBahHQa+2scw+Id3wHuowLjWm2CkciErS2jmVdTPuqM1AwSdDROFUWppT5oH0z/ck9qq+i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LllWXhfO; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LllWXhfO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748539449; x=1780075449;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=TCNZ79DKxxL3606Erfrh0Gz5jMTFgc82a7Ox+P36FlE=;
  b=LllWXhfOSgoNK/IHzumXSV8ZnuqC8SK6tKNh+iYZnEqC3QROeh+PJ5YA
   /UNj1VrZ4GVFr9bLYFVQCPJae1V2cJC0+0pVc9dnqYARHMTtgN8SqzSEk
   8MBDYJBCyNtcHM2zIWOdfPTf/U513wr6Awu+VQhe23LaRCH8KVscF0rL3
   kjv+mLZ+hay5snWTjU364lqUz082CRJCVb47UMoBEvO2QWjZUyI5ymU52
   GRR3q0bY3Yc7eZmiYF6w+Nl/ig+GEyQyr7k0juB5UQOLmNid8MKWA0VTa
   YuZeBiWcA6orplsMTZsW7FdZ4Dm9hY2XIKBA8Q8hKmOD6rdBRRWuqUzag
   Q==;
X-CSE-ConnectionGUID: KZpSIMqVSweATEb8nX8nzw==
X-CSE-MsgGUID: 4lpQnBloSkeuFRW6VodFgA==
X-IronPort-AV: E=McAfee;i="6700,10204,11448"; a="50501305"
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="50501305"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 10:24:08 -0700
X-CSE-ConnectionGUID: QyX+vvvbRqa3e/nF8pOjww==
X-CSE-MsgGUID: Zq/FIWhzTfeu0iLb8kP80Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,193,1744095600"; 
   d="scan'208";a="148484513"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.196])
  by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 10:24:07 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Lucas De Marchi <lucas.demarchi@intel.com>,
	Arnd Bergmann <arnd@kernel.org>,
	=?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Dave Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthew Brost <matthew.brost@intel.com>,
	Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
	Imre Deak <imre.deak@intel.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	"Michael J. Ruhl" <michael.j.ruhl@intel.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	dri-devel <dri-devel-bounces@lists.freedesktop.org>
Subject: [PATCH v2] drm/xe/vsec: fix CONFIG_INTEL_VSEC dependency
Date: Thu, 29 May 2025 10:23:56 -0700
Message-ID: <20250529172355.2395634-2-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The XE driver can be built with or without VSEC support, but fails to link as
built-in if vsec is in a loadable module:

x86_64-linux-ld: vmlinux.o: in function `xe_vsec_init':
(.text+0x1e83e16): undefined reference to `intel_vsec_register'

The normal fix for this is to add a 'depends on INTEL_VSEC || !INTEL_VSEC',
forcing XE to be a loadable module as well, but that causes a circular
dependency:

        symbol DRM_XE depends on INTEL_VSEC
        symbol INTEL_VSEC depends on X86_PLATFORM_DEVICES
        symbol X86_PLATFORM_DEVICES is selected by DRM_XE

The problem here is selecting a symbol from another subsystem, so change
that as well and rephrase the 'select' into the corresponding dependency.
Since X86_PLATFORM_DEVICES is 'default y', there is no change to
defconfig builds here.

Fixes: 0c45e76fcc62 ("drm/xe/vsec: Support BMG devices")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---

v2: s/INTEL_PLATFORM_DEVICES/X86_PLATFORM_DEVICES/

 drivers/gpu/drm/xe/Kconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index 9bce047901b22..98b46c5342787 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -2,6 +2,8 @@
 config DRM_XE
 	tristate "Intel Xe Graphics"
 	depends on DRM && PCI && MMU && (m || (y && KUNIT=y))
+	depends on INTEL_VSEC || !INTEL_VSEC
+	depends on X86_PLATFORM_DEVICES || !(X86 && ACPI)
 	select INTERVAL_TREE
 	# we need shmfs for the swappable backing store, and in particular
 	# the shmem_readpage() which depends upon tmpfs
@@ -27,7 +29,6 @@ config DRM_XE
 	select BACKLIGHT_CLASS_DEVICE if ACPI
 	select INPUT if ACPI
 	select ACPI_VIDEO if X86 && ACPI
-	select X86_PLATFORM_DEVICES if X86 && ACPI
 	select ACPI_WMI if X86 && ACPI
 	select SYNC_FILE
 	select IOSF_MBI
-- 
2.49.0

