Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D496145B27;
	Fri, 28 Mar 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743161090; cv=none; b=aOpKuJZW7rd7dWcq4wzDo9zyWg28rc2rCCp+jbb4biWME+QW+VZJElG9w3I37aRHPjo/oX1b+/xhVEPv7F3Dr7o/vWnQCOI3LuzxufcLb1RnaCMHNa6QvG0aoDOqQNFwVrK4c9wpLBI9j5rIKeDpXyiXnW5gJrte7trK7jywnfg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743161090; c=relaxed/simple;
	bh=uOQtP6lL6Ge7T833eHO6JChDyq2YE0dX5lWBJluwnCM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Krd9mVZOjDLMQ2M2M1/f/bLSGWtkw+0MLbloIwpNceUlQFf/t0v+w8E+gwE3B1V0jnRfkb+p3Mo2q43bzNKBQnyPTXWw6WxvO1tBoxihWiEFkR6EEbk7Cb0yaW6ZDyLe8QE8er7x9TnF4su0F2v6O6AFUtT5dml0W6OdjYU/3rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDTiM9p9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDTiM9p9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743161088; x=1774697088;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uOQtP6lL6Ge7T833eHO6JChDyq2YE0dX5lWBJluwnCM=;
  b=jDTiM9p9b6QZqQJDEI7knlaFh3lOZmPr/6zDA7tpLtNJjrQF4jXRPJyw
   xh2LCnBofS45vpkf0M6qLA+lQRlJ7C3wNII/UTPOvvMrbwYrqeKbtr8j2
   woJSnOrSnPL9eawzfn9e9huayznbD+h2cp+YImZtLXgKUIzuqnOg4JWIb
   1EzSyqndMlAKDir8G60ThaBa87rIswdN954inzQhxVzBJQna0wZeaym9q
   j3U2xiDViXpgmD5l1uRF6Y9jzGEqcDAgxLx8FUiDBxwaXocwyahG9Hr5A
   67KwcTvx27UoCHOMI4OhYNRVZ6xedjCowXBpL/l/2bOn9H7QBP3XBrHlr
   w==;
X-CSE-ConnectionGUID: kzRkAIzDR9ewfjnXHfGS4g==
X-CSE-MsgGUID: q/sVeovVSDOoR/BBi7VFow==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="44702597"
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="44702597"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2025 04:24:47 -0700
X-CSE-ConnectionGUID: iGEpRbFDRTe1f3qqVfXKNQ==
X-CSE-MsgGUID: 9iY+bSG4R2+xiE+9+p69xA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,283,1736841600"; 
   d="scan'208";a="130277056"
Received: from win-uq4qlp9a0jq.iind.intel.com (HELO madhum.iind.intel.com) ([10.223.138.63])
  by orviesa003.jf.intel.com with ESMTP; 28 Mar 2025 04:24:44 -0700
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
Date: Fri, 28 Mar 2025 17:20:41 +0530
Message-Id: <20250328115041.555008-1-madhu.m@intel.com>
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

