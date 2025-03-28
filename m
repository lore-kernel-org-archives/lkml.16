Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B4A1C36;
	Fri, 28 Mar 2025 09:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743153437; cv=none; b=Bt6+neWz7hYAythUrqg5JVxFvvdlsc/QrmsFiH7t9Tqa/u6eHwqfsc349tvbeCUwr7jM1prTQgNvDNGv8OMGouvHbsJtt8Q4TWB9QihBm6jMw0jb7hBCaW204QeYSg+gOiOOmCyfmToeReQcB2xodNXmhSfXp8N7AlVivaBq5lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743153437; c=relaxed/simple;
	bh=R49xfafOMRZGIS4xB8rrTfPNt5gs5+WCiFiRuZHq/w4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=m4xyWyvlG+hmWVH4mNNsihAACQ1d2f2TrLxxDE1zNupRkz7bM+xKK/z/nmt/qn5042gqLgQeZg7q+fXLJwmDzafBQredyG1YMLmIDoy8ILAR0bOfkKRmzky6zi/T1ip6BfLNGgbVs2tls1+PWMM+ite/YVWgX0zrdHXbAjcHW6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VcDsR06d; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VcDsR06d"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743153435; x=1774689435;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=R49xfafOMRZGIS4xB8rrTfPNt5gs5+WCiFiRuZHq/w4=;
  b=VcDsR06du3n802uR5bGhlSunxTM1JI8f7K5dtu0QdvGYqjjHOpQ2KwDy
   ljYhFOpd0D9WjsTlyM1W3VZZvRRzNwKOYmJAc2Zenp47x6SGOvZa6eo+j
   NOu+qRdF04qwaYWqEmlPUH6nn+GwgQwFz+42pgpIEpFkcpVu8XNRyg/2R
   qz2e3UvuYnCcsh3mt1TnZgt2RR4VbC9PXmkpTXzxwU4RS3etGBsSY5OFP
   G9tb83+9AUhsrzPvO/zarFiZ4bnBnxgozQWtXlPN0nw1S8nSb33IhVNvd
   CEXIKdWL2K0tyVUc5f4zfRognyCO1DNLWL0NmG6za5F0etP2sz/ys63M8
   Q==;
X-CSE-ConnectionGUID: lg2XpSisTMmYpQBTMA3VuQ==
X-CSE-MsgGUID: F0IUrmXwS9+30sc45ub+Fw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44401854"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="44401854"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 02:17:14 -0700
X-CSE-ConnectionGUID: X3eEiq/8SWWfStwXYg0ZDw==
X-CSE-MsgGUID: mHjs0pwVTIaL56iYZ4kG7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="125622129"
Received: from win-uq4qlp9a0jq.iind.intel.com (HELO madhum.iind.intel.com) ([10.223.138.63])
  by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2025 02:17:10 -0700
From: madhu.m@intel.com
To: gregkh@linuxfoundation.org
Cc: heikki.krogerus@linux.intel.com,
	linux-usb@vger.kernel.org,
	pooja.katiyar@intel.com,
	dmitry.baryshkov@linaro.org,
	diogo.ivo@tecnico.ulisboa.pt,
	lk@c--e.de,
	linux-kernel@vger.kernel.org,
	Madhu M <madhu.m@intel.com>
Subject: [PATCH v2] usb: typec: ucsi: Add the UCSI commands in debugfs
Date: Fri, 28 Mar 2025 15:13:05 +0530
Message-Id: <20250328094305.546724-1-madhu.m@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Madhu M <madhu.m@intel.com>

Added the UCSI commands UCSI_GET_CAM_SUPPORTED, UCSI_GET_PD_MESSAGE,
UCSI_GET_ATTENTION_VDO and UCSI_SET_USB support in debugfs to enhance
PD/TypeC debugging capability.

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
 drivers/usb/typec/ucsi/debugfs.c | 4 ++++
 drivers/usb/typec/ucsi/ucsi.h    | 2 ++
 2 files changed, 6 insertions(+)

diff --git a/drivers/usb/typec/ucsi/debugfs.c b/drivers/usb/typec/ucsi/debugfs.c
index eae2b18a2d8a..92ebf1a2defd 100644
--- a/drivers/usb/typec/ucsi/debugfs.c
+++ b/drivers/usb/typec/ucsi/debugfs.c
@@ -34,16 +34,20 @@ static int ucsi_cmd(void *data, u64 val)
 	case UCSI_CONNECTOR_RESET:
 	case UCSI_SET_SINK_PATH:
 	case UCSI_SET_NEW_CAM:
+	case UCSI_SET_USB:
 		ret = ucsi_send_command(ucsi, val, NULL, 0);
 		break;
 	case UCSI_GET_CAPABILITY:
 	case UCSI_GET_CONNECTOR_CAPABILITY:
 	case UCSI_GET_ALTERNATE_MODES:
+	case UCSI_GET_CAM_SUPPORTED:
 	case UCSI_GET_CURRENT_CAM:
 	case UCSI_GET_PDOS:
 	case UCSI_GET_CABLE_PROPERTY:
 	case UCSI_GET_CONNECTOR_STATUS:
 	case UCSI_GET_ERROR_STATUS:
+	case UCSI_GET_PD_MESSAGE:
+	case UCSI_GET_ATTENTION_VDO:
 	case UCSI_GET_CAM_CS:
 	case UCSI_GET_LPM_PPM_INFO:
 		ret = ucsi_send_command(ucsi, val,
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 3a2c1762bec1..72b9d5a42961 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -123,9 +123,11 @@ void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 #define UCSI_GET_CONNECTOR_STATUS		0x12
 #define UCSI_GET_CONNECTOR_STATUS_SIZE		152
 #define UCSI_GET_ERROR_STATUS			0x13
+#define UCSI_GET_ATTENTION_VDO			0x16
 #define UCSI_GET_PD_MESSAGE			0x15
 #define UCSI_GET_CAM_CS			0x18
 #define UCSI_SET_SINK_PATH			0x1c
+#define UCSI_SET_USB				0x21
 #define UCSI_GET_LPM_PPM_INFO			0x22
 
 #define UCSI_CONNECTOR_NUMBER(_num_)		((u64)(_num_) << 16)
-- 
2.34.1

