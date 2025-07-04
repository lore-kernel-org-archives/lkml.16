Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F029309A58
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751647606; cv=none; b=ZMk0qJBY4HDea5QWc0v++Pgi3kODOeSNVwGC2lPOz3T7LoHebWQIRroGAjGvSXMSDazXCR/69ZAtB49h8eWgcuyLNiS0J5Y8w4x4l7VaxP8p+ovTHmYXRM4eO+E6v60fP8oRMxKqI4M8/V2i3C7lejTnEbIIwBrPsiZA6c7vbRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751647606; c=relaxed/simple;
	bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MjYBbpb6JnHKvOCtm7e1O8CVzjw0nGKqCH/dZRMgZmJ+GSgHSeN7QZ+JDO0L4NZEuA563j0lXJFvVG8ifX659XZEmjcI03qsrM9upTAKnvibcC36kWpO/gFVoUc+e15W8VbikNQQIcak0dAjSe9azOvwS1KhrvoyZKZcOhlUPMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BA4S3YQ5; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BA4S3YQ5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751647605; x=1783183605;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=/UhG+PrAWuDRKhnrnXNOPvjeJ896dmbS6DO0ehBJdK0=;
  b=BA4S3YQ5jj6vYkeGTrjpcSP5OnzqxCipTXWErutVanSi11c8Mm0t5p3O
   oveEuT9Bcrna1JgarVrEc53hNPBoKNTnEo3IRFMhSQwmHHgNwJNuny6sJ
   MuKJO5bmMqX78X2/RPtHOyMNjf0u7otIqZHZOp6dQN4pZPDdqNi5xocNe
   1HBazqICWVLdXzVxXuFCwudgyQT1S84hopSbfVqIyyomHKHX8PaIH1y91
   ab9U5wNxNW+QXIS8vO9n1CDxJgMknYHJaYUmm6mFlLnjUDNSFDTZlsBKW
   CmUQO1v4FSPowb4EOJ5hxqU9S/uHCzfEUXZAYdb7OSsBX6II4cub+l8u3
   g==;
X-CSE-ConnectionGUID: MBHNHJN+TKWqS+LXTfH5Zg==
X-CSE-MsgGUID: iI9R296cQeubW2YmDE4ztg==
X-IronPort-AV: E=McAfee;i="6800,10657,11484"; a="57755829"
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="57755829"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:45 -0700
X-CSE-ConnectionGUID: NseANNQ9TjCwt2C3UgXdKw==
X-CSE-MsgGUID: a4w/rHn/TEGGKxh6xCVT2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,287,1744095600"; 
   d="scan'208";a="154424747"
Received: from unknown (HELO bnilawar-desk2.iind.intel.com) ([10.190.239.41])
  by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2025 09:46:43 -0700
From: Badal Nilawar <badal.nilawar@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Cc: anshuman.gupta@intel.com,
	rodrigo.vivi@intel.com,
	alexander.usyskin@intel.com,
	gregkh@linuxfoundation.org,
	daniele.ceraolospurio@intel.com
Subject: [PATCH v7 10/10] drm/xe/xe_late_bind_fw: Select INTEL_MEI_LATE_BIND for CI
Date: Fri,  4 Jul 2025 22:20:38 +0530
Message-Id: <20250704165038.1464460-11-badal.nilawar@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704165038.1464460-1-badal.nilawar@intel.com>
References: <20250704165038.1464460-1-badal.nilawar@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not review

Signed-off-by: Badal Nilawar <badal.nilawar@intel.com>
---
 drivers/gpu/drm/xe/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
index f66e6d39e319..ef3f4807b0b3 100644
--- a/drivers/gpu/drm/xe/Kconfig
+++ b/drivers/gpu/drm/xe/Kconfig
@@ -45,6 +45,7 @@ config DRM_XE
 	select WANT_DEV_COREDUMP
 	select AUXILIARY_BUS
 	select HMM_MIRROR
+	select INTEL_MEI_LATE_BIND
 	help
 	  Driver for Intel Xe2 series GPUs and later. Experimental support
 	  for Xe series is also available.
-- 
2.34.1

