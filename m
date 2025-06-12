Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681C9223327
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749763516; cv=none; b=VfB+WNHH3Jtp2aEMOUTegg+01HrvjGK97S5Msw5DU62xDN5KUdkY5UNsg5xBSLZLXgbynmCuPCntAjqjEEZtMctaE8JMX1oi1iqLt0k5e7NpYOj2jeIfv3NmKlU3kW1ZSmb1v86kh+UygKDX+to4i1KiBmE8+GIW3Zgg6HOcZ9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749763516; c=relaxed/simple;
	bh=mOjY4eoiqhwRuat0DYgAlouuJaGp2SZZ5wyrdxxW/1M=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=mUWfAq3UtAzdf5mS42AnFoTZVmFIbfKPdD/JiCqtjodWZCnpDRrkxOjz3bT512J6VcDt0NZcyyFknY+rc6rOF9FO9vhqk/KYx4N9HwFErwlEtXsmtGm6H3MCOwrsUGKPo8Rtp6DKi+Clkw9+oFnFWBSfG8Jcvob633XMgr9+baY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--salomondush.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fnyGLGjA; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--salomondush.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fnyGLGjA"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3132c8437ffso1632214a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 14:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749763514; x=1750368314; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=49H/u4xHuXH3kNd0ZN1kjpTsXf6BcbH0tfxU5dQvTo4=;
        b=fnyGLGjAm4XCK8J9DhQvm82gb/TSJQYLbP7/GGauvRRiu2BBlqClWGe7hNCDL4UURu
         9IerHtr+MwTilpXDvVVDJSDiPDjsc7JF2zm+GeZhV8WG+8XGqCaLLFbr5ExYfbLE359e
         4W0CP4gM0KA9JBEexcDHZ1WVDzIU+Bi7tRI825W3HyP0mQ/NOtDpszSG8n7EGZrZ42oi
         5TlDcpy0tJ0DB0ryDenHMhSvTlw0WTDreDneAyC91Z40hu0FqJX8oCRwPvMRU5oJlh24
         ZfA4djNvoe/iSSZf1iCx4ozgXc5TBC7T0y2osC/u2121RqRnNfD2k8n37L4m7u3vv6I8
         U00Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749763514; x=1750368314;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=49H/u4xHuXH3kNd0ZN1kjpTsXf6BcbH0tfxU5dQvTo4=;
        b=u7ZCtpdgs0IGPGq2EKb0xZ2NhaSKkeXLJ10w7hP+FkhhCCWH/tiez4kEZ6/danlf0o
         tAUlwVchL7p2aUKJMfuBOOEOI/6iPaTDFd7Y5k1DiAzt+KFnz0n7RBayp7C2lDNYeEio
         8j2mj3om51Eq4FB9ZzAyf/1vc+3kRCJh3rpQOeAuQ/A+4NNVibda9zRujcfolrb7bhBG
         1QCCloNnQI4YvBzKSA9mSrJ73tMcIeomTTIW43hmpuZLIeiNu8dPpIs6vnXA2q59re/E
         Xp/qd5xjjN4TtSVaAXpqDUn6kVlcDDYbqxF48U5M3WdNVQ3AuDljJhQXEG5C2Fo8wNWv
         KiKA==
X-Forwarded-Encrypted: i=1; AJvYcCWiZkNvzPS73IhB2Q9NgRG0dtFXVJNw4vfZ1LzVQ7mdVlDd86u65NLPAZNZ1bVhJBpwWfFCzErz6RBN3oo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGh/Wvl9nxk4rEL+UavJV9qO7CIYTZvfVXBFBC2iqdFLiTGqyK
	zd4Xk/SNAf44Veuf6h0vlCus14rVZvNIrLleLpGKq3Ai+6o16CDQ1kagVzfpSWEGxIe529mvTAD
	LzvDgrWUMp8P3y7x4prCkD2n9Ug==
X-Google-Smtp-Source: AGHT+IH7DpKidXltZ14HPMKNKNeaJcPPrDyah8HHXnIqXY3bINqh/Nv8WY7WUw5Ijtcc17p2cu9uR+BHVdzLeHXFXA==
X-Received: from pjxx15.prod.google.com ([2002:a17:90b:58cf:b0:311:c5d3:c7d0])
 (user=salomondush job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2686:b0:313:db0b:75e4 with SMTP id 98e67ed59e1d1-313db0b7883mr618567a91.33.1749763513836;
 Thu, 12 Jun 2025 14:25:13 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:25:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250612212504.512786-1-salomondush@google.com>
Subject: [PATCH] scsi: pm80xx: add controller scsi host fatal error uevents
From: Salomon Dushimirimana <salomondush@google.com>
To: Jack Wang <jinpu.wang@cloud.ionos.com>, 
	"James E . J . Bottomley" <James.Bottomley@HansenPartnership.com>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>
Cc: linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Salomon Dushimirimana <salomondush@google.com>
Content-Type: text/plain; charset="UTF-8"

Adds pm80xx_fatal_error_uevent_emit(), called when the pm80xx driver
encouters a fatal error. The uevent has the following additional custom
key/value pair sets:

- DRIVER: driver name, pm80xx in this case
- HBA_NUM: the scsi host id of the device
- EVENT_TYPE: to indicate a fatal error
- REPORTED_BY: either driver or firmware

The uevent is anchored to the kernel object that represents the scsi
controller, which includes other useful core variables, such as, ACTION,
DEVPATH, SUBSYSTEM, and more.

The fatal_error_uevent_emit() function is called when the controller
fatal error state changes. Since this doesn't happen often for a
specific scsi host, there is no worries of a uevent storm.

Signed-off-by: Salomon Dushimirimana <salomondush@google.com>
---
 drivers/scsi/pm8001/pm8001_sas.h | 10 +++++++
 drivers/scsi/pm8001/pm80xx_hwi.c | 48 ++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/scsi/pm8001/pm8001_sas.h b/drivers/scsi/pm8001/pm8001_sas.h
index 315f6a7523f0..334485bb2c12 100644
--- a/drivers/scsi/pm8001/pm8001_sas.h
+++ b/drivers/scsi/pm8001/pm8001_sas.h
@@ -170,6 +170,14 @@ struct forensic_data {
 #define SPCV_MSGU_CFG_TABLE_TRANSFER_DEBUG_INFO  0x80
 #define MAIN_MERRDCTO_MERRDCES		         0xA0/* DWORD 0x28) */
 
+/**
+ * enum fatal_error_reporter: Indicates the originator of the fatal error
+ */
+enum fatal_error_reporter {
+	REPORTER_DRIVER,
+	REPORTER_FIRMWARE,
+};
+
 struct pm8001_dispatch {
 	char *name;
 	int (*chip_init)(struct pm8001_hba_info *pm8001_ha);
@@ -715,6 +723,8 @@ ssize_t pm80xx_get_non_fatal_dump(struct device *cdev,
 		struct device_attribute *attr, char *buf);
 ssize_t pm8001_get_gsm_dump(struct device *cdev, u32, char *buf);
 int pm80xx_fatal_errors(struct pm8001_hba_info *pm8001_ha);
+void pm80xx_fatal_error_uevent_emit(struct pm8001_hba_info *pm8001_ha,
+	enum fatal_error_reporter error_reporter);
 void pm8001_free_dev(struct pm8001_device *pm8001_dev);
 /* ctl shared API */
 extern const struct attribute_group *pm8001_host_groups[];
diff --git a/drivers/scsi/pm8001/pm80xx_hwi.c b/drivers/scsi/pm8001/pm80xx_hwi.c
index 5b373c53c036..dfa9494fa659 100644
--- a/drivers/scsi/pm8001/pm80xx_hwi.c
+++ b/drivers/scsi/pm8001/pm80xx_hwi.c
@@ -1551,6 +1551,52 @@ static int mpi_uninit_check(struct pm8001_hba_info *pm8001_ha)
 	return 0;
 }
 
+/**
+ * pm80xx_fatal_error_uevent_emit - emits a single fatal error uevent
+ * @pm8001_ha: our hba card information
+ * @error_type: fatal error type to emit
+ */
+void pm80xx_fatal_error_uevent_emit(struct pm8001_hba_info *pm8001_ha,
+	enum fatal_error_reporter error_reporter)
+{
+	struct kobj_uevent_env *env;
+
+	pm8001_dbg(pm8001_ha, FAIL, "emitting fatal error uevent");
+
+	env = kzalloc(sizeof(struct kobj_uevent_env), GFP_KERNEL);
+	if (!env)
+		return;
+
+	if (add_uevent_var(env, "DRIVER=%s", DRV_NAME))
+		goto exit;
+
+	if (add_uevent_var(env, "HBA_NUM=%u", pm8001_ha->id))
+		goto exit;
+
+	if (add_uevent_var(env, "EVENT_TYPE=FATAL_ERROR"))
+		goto exit;
+
+	switch (error_reporter) {
+	case REPORTER_DRIVER:
+		if (add_uevent_var(env, "REPORTED_BY=DRIVER"))
+			goto exit;
+		break;
+	case REPORTER_FIRMWARE:
+		if (add_uevent_var(env, "REPORTED_BY=FIRMWARE"))
+			goto exit;
+		break;
+	default:
+		if (add_uevent_var(env, "REPORTED_BY=OTHER"))
+			goto exit;
+		break;
+	}
+
+	kobject_uevent_env(&pm8001_ha->shost->shost_dev.kobj, KOBJ_CHANGE, env->envp);
+
+exit:
+	kfree(env);
+}
+
 /**
  * pm80xx_fatal_errors - returns non-zero *ONLY* when fatal errors
  * @pm8001_ha: our hba card information
@@ -1580,6 +1626,7 @@ pm80xx_fatal_errors(struct pm8001_hba_info *pm8001_ha)
 			"Fatal error SCRATCHPAD1 = 0x%x SCRATCHPAD2 = 0x%x SCRATCHPAD3 = 0x%x SCRATCHPAD_RSVD0 = 0x%x SCRATCHPAD_RSVD1 = 0x%x\n",
 				scratch_pad1, scratch_pad2, scratch_pad3,
 				scratch_pad_rsvd0, scratch_pad_rsvd1);
+		pm80xx_fatal_error_uevent_emit(pm8001_ha, REPORTER_DRIVER);
 		ret = 1;
 	}
 
@@ -4039,6 +4086,7 @@ static int process_oq(struct pm8001_hba_info *pm8001_ha, u8 vec)
 			pm8001_dbg(pm8001_ha, FAIL,
 				   "Firmware Fatal error! Regval:0x%x\n",
 				   regval);
+			pm80xx_fatal_error_uevent_emit(pm8001_ha, REPORTER_FIRMWARE);
 			pm8001_handle_event(pm8001_ha, NULL, IO_FATAL_ERROR);
 			print_scratchpad_registers(pm8001_ha);
 			return ret;
-- 
2.50.0.rc2.696.g1fc2a0284f-goog

