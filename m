Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E6C8367;
	Wed,  2 Apr 2025 06:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743576148; cv=none; b=i9nofnsahOVK9ITfb2NdThMNBRhpRTAdzH7HvPefFNM7N5z28mhOH/ri/LUJDqMB8tjvJNXXrw+aT2wmgMdvEoWqnMDu9XGZVz7rT8X/2ex52qOg+Pm4XMq722G4sFPi31lWIrGSl1Ujfmpy8z6oo3GLuOlycWDKsoItQdGhsyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743576148; c=relaxed/simple;
	bh=IvT6bXYIRNyYJbWDmQqou9gU5rQ1k2JDX+k31FQ4U2o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=r3KQVEU2FYYXtUPxIH7bp/qEareo/zNqAvs2jVB5AseDLeHUxJNKaskRJNx2UEpMDN8pmlKAanULTSsh88z543D0CnIsIvhPELBQfhlYUU+qRE0VoME3gWcqUgjHiBkA0dFG+y0QUurdeYjPDocJj15IbNtMa74kmEN/7NNbcY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YQJr2G8B; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YQJr2G8B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743576147; x=1775112147;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=IvT6bXYIRNyYJbWDmQqou9gU5rQ1k2JDX+k31FQ4U2o=;
  b=YQJr2G8BLeihBJksoHT2mYZ9lGLPP9XFfAwrWXytV9pbENb/kRMT2s+j
   ZNcx4wPwENd1LYGxKOQXyamvMuKO0vORbCc6WAAxsAil9+7Mdi8f/S86I
   A5IHx0vSchJUkzZJ0DPNYweKn1odmeDnJ3Cb69wieLlgv/5xO8SGmXd4W
   /1QYxGYDoJ6EP5OdlnOg3MDmfa+i4GFscmkz6n5Ida4nFmDwRJcAzKMvm
   smxu9Mx+W/5TScKqzub9OV+to6PqCKa+1lnOAL82ygtpQ28GtFYt5id6Z
   DkDOJPTphxLAlvnovsTtaSypOk07/GzGhFXIn2hyPhMlV28qrzKi/SnYi
   A==;
X-CSE-ConnectionGUID: sbnq/v44SsyxDqu/vAq4rw==
X-CSE-MsgGUID: IEU8SufoSMCYYoStpzjRDA==
X-IronPort-AV: E=McAfee;i="6700,10204,11391"; a="47640805"
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="47640805"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2025 23:42:26 -0700
X-CSE-ConnectionGUID: Y4U+mLA1TqW4h9UMyHtagw==
X-CSE-MsgGUID: Vf0QIeFTSC661sAvBhpz4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,295,1736841600"; 
   d="scan'208";a="131740239"
Received: from win-uq4qlp9a0jq.iind.intel.com (HELO madhum.iind.intel.com) ([10.223.138.63])
  by fmviesa004.fm.intel.com with ESMTP; 01 Apr 2025 23:42:23 -0700
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
Subject: [PATCH v4] usb: typec: ucsi: Add the UCSI commands in debugfs
Date: Wed,  2 Apr 2025 12:38:17 +0530
Message-Id: <20250402070817.1016635-1-madhu.m@intel.com>
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
PD/TypeC debugging capability

Signed-off-by: Madhu M <madhu.m@intel.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
v3->v4: Added Reviewer
v2->v3: Added changelog
v1->v2: Removed UCSI_READ_POWER_LEVEL and UCSI_SET_PDOS commands and
modified commit messages.
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

