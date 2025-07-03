Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86AF158535;
	Thu,  3 Jul 2025 02:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751510121; cv=none; b=Ad1c1ZxQAg5CxVVwRRAqgLcWaXZXmd2SIoTqGvxdG3A9RCRdDE6DwEkpazS0KJNEeubXdRkdP2uP89MDroNXj72PruxjvpVsx/UzuQ5OCc0Z8eeDJcDrK3GtRkD4r9dUxxlLi7gg16Jqw0zL6XU97WhA5L4RTa8/HmxiputLv60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751510121; c=relaxed/simple;
	bh=EYcr15pNEDaWzxlEkbiWlzq1Ea8/TuVaQq7VFpMXwh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OLKtvo7VkehxgJDElr1ELRvAzNX63lNoVeOn0PYMJPCcZKcEY7ROLcP5Y4wn9jkdKzi6YPwaWO4k+PX/SlazAaTA0FU5xJhlQLuB+vTokaEl7rxpFonds8dJxIS0mQTJhE8MkkLAF0Y0qI+BsFCfewp9CCIKOEWW5vYgo1I/WfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BwPtVhlq; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BwPtVhlq"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-5315ebfd92cso319481e0c.0;
        Wed, 02 Jul 2025 19:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751510118; x=1752114918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X1Z4S8cjDxGz3eZSv+C4YEYC8CAtlGGPVoxlC+h/myk=;
        b=BwPtVhlqgFMMKbODOdpVNYB/t82xy4BTW1aMb44gVLbG0HNyaThBfhQDxaEm7Jkg5N
         iy6knGYnu8f42SfRyesnfXfpidpT/T08+TOElK7Iy87ZLSOAzAUsCLgJODbQf70VNl27
         UYjI6/mkONM1i3c5PQi/nWnI40aWZKiz+pYIHOYFbXNCbkFbyxuR1o4dj6DhTbuP59+I
         D1HdRpXgmYTSPqCKq7ziZSkUzN1NwJeg45RC7YpJG6BzFRVtpH/ImztH8SkstgS6968v
         +cQLPmHiI+H65htoAmfToZXY6COHTLJjQGd0HNiTdVom5y7IJnym9AHhZ/dbQC21gJVe
         6tSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751510118; x=1752114918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1Z4S8cjDxGz3eZSv+C4YEYC8CAtlGGPVoxlC+h/myk=;
        b=fOdq9RdV9mwoJlddB/diOUEsfFYEW+lRFm4qMry4hA2ldd0r2J4LdiFjBttcv+2fVg
         KJpUnEvxLQ0uPdmQV8Tyg2um9XdEU6q1H7O6O7o9wOCfq4GEr6YxrPwiF1s22CbG+PyL
         uo28d+tXQBlvfZ4vw8XTBgnV5nReiLZUTDUAs3kBUVS5nSTAOH2/Cl/e7sThZYG1L0/J
         biSfXiJ0be0POESEcXkrkU4TNCPkkHSmjTZRsw2RT0AwPMWBp5hf2zb5bk9eGmsaNMov
         IIN3bvVBxSQIUN+O+smFsAO/pM0o8Iod0XnpcUb/ZEK42LhyXFy/FszhY5kLdlvKfYIJ
         YsRA==
X-Forwarded-Encrypted: i=1; AJvYcCVEZfqvlFJDpSg8YvzehBSAuwhP2eTGfTnBY4BsSDPYicnBK0BB8g6T950A3bf+KuC39AEMrJBkkJ29Tw7r@vger.kernel.org, AJvYcCWVPYMg9MDkXHaTguPfmV2XoWlo78RET2eExzh7YsfNRa7gvRRIW24Rgztm9cFvN1Vl3zMUd7Ol/Hw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTZCGj47iRaNA7O2EDxXsDGtU5zbsBd6PLu9c8q0HpfJO5/y/P
	dFyWBL5eAATO9j6wbMW/qyv3vvcKxgrIBJrU3FwlvxiGOJ8o7OUSfmDkgbpl8UEizbaR4g==
X-Gm-Gg: ASbGncuQgYBSG1y7csSjuhF5c1TZ+TOKhriOYr/AL+FMmI5uPyDATcO7GGTJXaW2GQv
	ETbhdSR5+j1+eb3scuJ8mKnb9/4mNd2mA/BhzCX7/mDFFuAdiOzsEwOHhnHZOuwZkJcLfsgidVK
	+oUBHU1VCshBjf3notumVmpy4IT4ADNZzc5Z9nzbhNCGTbkHYs7WwDgSy48lKM6oBlQrHKGpcfH
	8y5F5/0a1rXyvr3MKz7S/KVA6Kc7f7pMHfi+hqSOEDQeoS7DR7skGNWDreTp8CT7ghMMrSDXoDQ
	P0cC7WgPkrHb4xuURjc9Jy2nb5P1otXqO+i8clBIVVICKkPNOMGHECNgMJXJOZX/klKNA4onwGx
	8gH4vJbS1iGhYK0pOEA+tIqi/j9UH6gKh5sN1h53Hk+XgnNJziV/cKXmy
X-Google-Smtp-Source: AGHT+IGmSUxhDdof2AxfHAaWN0O0QT1k8qTk3pUsZNgWhCSldPmATJPDocJRb5+QEbvavwdoUGqNmA==
X-Received: by 2002:a05:6122:2489:b0:52f:a0c8:263d with SMTP id 71dfb90a1353d-5346beeae2emr229009e0c.5.1751510117734;
        Wed, 02 Jul 2025 19:35:17 -0700 (PDT)
Received: from 9950x.localdomain (syn-142-197-132-170.res.spectrum.com. [142.197.132.170])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-884d1c210e4sm2693320241.2.2025.07.02.19.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 19:35:17 -0700 (PDT)
From: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
To: corbet@lwn.net
Cc: alexandre.belloni@bootlin.com,
	pisa@cmp.felk.cvut.cz,
	ondrej.ille@gmail.com,
	mkl@pengutronix.de,
	James.Bottomley@HansenPartnership.com,
	martin.petersen@oracle.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Luis Felipe Hernandez <luis.hernandez093@gmail.com>
Subject: [PATCH] docs: Fix kernel-doc indentation errors in multiple drivers
Date: Wed,  2 Jul 2025 22:35:11 -0400
Message-ID: <20250703023511.82768-1-luis.hernandez093@gmail.com>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix kernel-doc formatting issues causing "Unexpected indentation"
errors during documentation build in CAN, SCSI, and I3C drivers.

Signed-off-by: Luis Felipe Hernandez <luis.hernandez093@gmail.com>
---
 drivers/i3c/device.c                     | 6 +++---
 drivers/net/can/ctucanfd/ctucanfd_base.c | 8 ++++----
 drivers/scsi/scsi.c                      | 4 ++--
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/i3c/device.c b/drivers/i3c/device.c
index e80e48756914..7aec9c1e01b9 100644
--- a/drivers/i3c/device.c
+++ b/drivers/i3c/device.c
@@ -28,9 +28,9 @@
  *
  * Return: 0 in case of success, a negative error core otherwise.
  *	   -EAGAIN: controller lost address arbitration. Target
- *		    (IBI, HJ or controller role request) win the bus. Client
- *		    driver needs to resend the 'xfers' some time later.
- *		    See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
+ *	   (IBI, HJ or controller role request) win the bus. Client
+ *	   driver needs to resend the 'xfers' some time later.
+ *	   See I3C spec ver 1.1.1 09-Jun-2021. Section: 5.1.2.2.3.
  */
 int i3c_device_do_priv_xfers(struct i3c_device *dev,
 			     struct i3c_priv_xfer *xfers,
diff --git a/drivers/net/can/ctucanfd/ctucanfd_base.c b/drivers/net/can/ctucanfd/ctucanfd_base.c
index bf6398772960..bd6938f6e105 100644
--- a/drivers/net/can/ctucanfd/ctucanfd_base.c
+++ b/drivers/net/can/ctucanfd/ctucanfd_base.c
@@ -507,10 +507,10 @@ static bool ctucan_is_txt_buf_writable(struct ctucan_priv *priv, u8 buf)
  * @isfdf:	True - CAN FD Frame, False - CAN 2.0 Frame
  *
  * Return: True - Frame inserted successfully
- *	   False - Frame was not inserted due to one of:
- *			1. TXT Buffer is not writable (it is in wrong state)
- *			2. Invalid TXT buffer index
- *			3. Invalid frame length
+ *         False - Frame was not inserted due to one of:
+ *         1. TXT Buffer is not writable (it is in wrong state)
+ *         2. Invalid TXT buffer index
+ *         3. Invalid frame length
  */
 static bool ctucan_insert_frame(struct ctucan_priv *priv, const struct canfd_frame *cf, u8 buf,
 				bool isfdf)
diff --git a/drivers/scsi/scsi.c b/drivers/scsi/scsi.c
index 534310224e8f..5f46f593d44f 100644
--- a/drivers/scsi/scsi.c
+++ b/drivers/scsi/scsi.c
@@ -243,8 +243,8 @@ EXPORT_SYMBOL(scsi_change_queue_depth);
  * 		need to adjust the queue depth on the device.
  *
  * Returns:	0 - No change needed, >0 - Adjust queue depth to this new depth,
- * 		-1 - Drop back to untagged operation using host->cmd_per_lun
- * 			as the untagged command depth
+ *              -1 - Drop back to untagged operation using host->cmd_per_lun
+ *              as the untagged command depth
  *
  * Lock Status:	None held on entry
  *
-- 
2.50.0

