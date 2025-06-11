Received: from out30-75.freemail.mail.aliyun.com (out30-75.freemail.mail.aliyun.com [115.124.30.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A696B40849
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:53:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749610395; cv=none; b=HYsLXvHtLiUQY+9avcy820cvC1b3ohnOvmMCO9E0axS3rfXcFB9k3vUDjqLHykFbcIajSMpsM+3hTPI9K0uHuECrZdDFCmYU8sqbXWCVGGg+x8iCloJ7sixQ9ZkNhi87Kl1OC5oU0m2hEU12iUdRRv7kG60NzVypYXLx8nB3Ew0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749610395; c=relaxed/simple;
	bh=SpQvXJc2e28PuzHGIhgJ36LX63O/nxiN9wXc0leIUp8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=sWT6bNnul3QgImLUzlXqw6+spXeSgrvhrs+Qg/N2SkjX42uF6hoJ/fLn103wfdTWdzq3K24bvXi9bAg7E73PLj0u+LcDY5Eo+BYvxWAT61N+CjSEAqrPDmZfb2Ku8daAr5y+q5ds+TUEBgoZoQ15MigC55F3FlAmFAwfZVIyXqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliyun.com; spf=pass smtp.mailfrom=aliyun.com; dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b=bCYMm86s; arc=none smtp.client-ip=115.124.30.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliyun.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliyun.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=aliyun.com header.i=@aliyun.com header.b="bCYMm86s"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=aliyun.com; s=s1024;
	t=1749610389; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=oh5qvsmzf9WNolSWybgX+O4V7CTdQmvoMYjXLIZyyL4=;
	b=bCYMm86sB1zawm4i7ZS7YMRiwo/T8RMIeVkFLjK5bHbKAO6x6zm+4+EsKOKLRUb601BXEwEe0QWGPaetuA5NUkNiGCn93Y6hTvKcBJVfa4W/Omz848I+UBVIPQ33FAvm+mVKYe1I8LoG3DeV8FP3qrbPSZzK3YAzHY+it/1A4Ic=
Received: from wdhh6.sugon.cn(mailfrom:wdhh6@aliyun.com fp:SMTPD_---0WdbIugO_1749610387 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 11 Jun 2025 10:53:08 +0800
From: Chaohai Chen <wdhh6@aliyun.com>
To: James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	=linux-scsi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Chaohai Chen <wdhh6@aliyun.com>
Subject: [PATCH] scsi:core: Delete the boring judgment in sdev_evt_alloc()
Date: Wed, 11 Jun 2025 10:53:04 +0800
Message-Id: <20250611025304.206306-1-wdhh6@aliyun.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delte the boring judgment.

Signed-off-by: Chaohai Chen <wdhh6@aliyun.com>
---
 drivers/scsi/scsi_lib.c | 15 ---------------
 1 file changed, 15 deletions(-)

diff --git a/drivers/scsi/scsi_lib.c b/drivers/scsi/scsi_lib.c
index 144c72f0737a..7e7d5a04cfdf 100644
--- a/drivers/scsi/scsi_lib.c
+++ b/drivers/scsi/scsi_lib.c
@@ -2683,21 +2683,6 @@ struct scsi_event *sdev_evt_alloc(enum scsi_device_event evt_type,
 	evt->evt_type = evt_type;
 	INIT_LIST_HEAD(&evt->node);
 
-	/* evt_type-specific initialization, if any */
-	switch (evt_type) {
-	case SDEV_EVT_MEDIA_CHANGE:
-	case SDEV_EVT_INQUIRY_CHANGE_REPORTED:
-	case SDEV_EVT_CAPACITY_CHANGE_REPORTED:
-	case SDEV_EVT_SOFT_THRESHOLD_REACHED_REPORTED:
-	case SDEV_EVT_MODE_PARAMETER_CHANGE_REPORTED:
-	case SDEV_EVT_LUN_CHANGE_REPORTED:
-	case SDEV_EVT_ALUA_STATE_CHANGE_REPORTED:
-	case SDEV_EVT_POWER_ON_RESET_OCCURRED:
-	default:
-		/* do nothing */
-		break;
-	}
-
 	return evt;
 }
 EXPORT_SYMBOL_GPL(sdev_evt_alloc);
-- 
2.34.1

