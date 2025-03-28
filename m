Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56D10B676;
	Fri, 28 Mar 2025 11:06:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159996; cv=none; b=hFUUzBxwBwIvj6ROv7gK+XZKE2SCfIi7MPQXT+KZdahvfB2+3eZ8rxWqJttprs48Zb7y6l2NU3NJuoem7a3B+1oD1lUJ2NsIIw6Wpr6hZQ1S1R+slTY0FnTSIg9TqqoPkhdu3GVbB2dEPN5/JSzctLaWNE6CNkQqzyCe3vDI9q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159996; c=relaxed/simple;
	bh=KITmyAiTQTCE6UaFMWxBRg+TpNuFpe6uMazmeLCKXxI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aRQabDILcHINsnIl+8fkOjvYhgBKXUYOJo34TL4knCazUxaN4IQlLw/ZPJgAI3w13NXnn7WmqH05xU5amfQFOAxy7vG2dYX7YGBFwoR/z5EwXkenLEDlYuQ5Gmsf5F/1/IjaeNsrD5+QDaOXJq0JUsk+v69KgT9vlhKg/b1e/+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wr68pL72; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wr68pL72"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743159995; x=1774695995;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KITmyAiTQTCE6UaFMWxBRg+TpNuFpe6uMazmeLCKXxI=;
  b=Wr68pL723tnJkaJYVxv4lFMrm6Mdr5Kg3UGEU+bB/GTUjLfA7DPytNUT
   oylWMpypb+8qIyJAyBfaCanelYgrq0OZABrhKsn99meOTYEp9geFmBKbP
   QQpLga8BNo44sleHbRXP3BQF9OYocXTusccREIDfyqHKHKuVhb+nXqM+L
   mQuOjBkt5kEA7+8c7KOYvCjZFikBHelUZ2k0TaBtQtUhZ2hK6ksqQ7Pho
   S8KXjx11F4x9qRf/SPKg3s8I9EJjL5+bIMi7kmNT5XQDjounANevACSKE
   w7HMh6jmSMoAxGeMm0jxfDw/QO0omFZNZd+jDLQ5gZcEI+JxWwu9nVSYl
   Q==;
X-CSE-ConnectionGUID: pTzjOig2SXKb/ESeL8++sw==
X-CSE-MsgGUID: 1FjDI2PsS6K5Xgbv0c4wDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="48175948"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="48175948"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:06:34 -0700
X-CSE-ConnectionGUID: JySGm6xZT/Or262AOtoxow==
X-CSE-MsgGUID: 3bOImvsSSgavOkKNMedv9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="125644421"
Received: from win-uq4qlp9a0jq.iind.intel.com (HELO madhum.iind.intel.com) ([10.223.138.63])
  by fmviesa008.fm.intel.com with ESMTP; 28 Mar 2025 04:06:30 -0700
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
Date: Fri, 28 Mar 2025 17:02:27 +0530
Message-Id: <20250328113227.554096-1-madhu.m@intel.com>
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
---
Changes in v1:
- Removed UCSI_READ_POWER_LEVEL and UCSI_SET_PDOS commands.
- Modified commit messages.
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

