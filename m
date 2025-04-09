Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1345264F8A
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 14:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744207359; cv=none; b=IcNDWqu50XV0G5j0pxAKt38WDe/zw2jM+SO0nzFflKtMt6MuPy5XImXJvl6+YX36z0Bryf5+QMuqMkXCqS4cBDkpxTZDwELOoqU8EKM7EF9xTMXwhd1FoC5/ztIRe4l95y7u0jK/hA2HhJdqxmBfMKectoLwEqguewKDVFAYhjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744207359; c=relaxed/simple;
	bh=iFyXqVFXEULPsNSqQwDUF2/Adtt/V3zIh9vrgqGq5bc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DydT5RAHyWls/Z4p0fXP3JZlOy0fDav/COWaC8iL+cvFOXyoe19oOksxsAC0lr2QC3dsxboK2ADsLazfwc4Mf9rF1Smg6ZF5Tz6bTw33vqV1YSYKp3fSWcAPgpuiNW7mFlZGa6UxNA2omVbFJ3B0qcyI3VpM+JINWLn08ZrQMos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nL8SGc+4; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nL8SGc+4"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac29fd22163so1197361766b.3
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744207356; x=1744812156; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5bQBdzdrrxAwjVcMoSn7R6YHyOz0D1Ji82aPtHYgp0=;
        b=nL8SGc+4dlyVuEapohvoPNZ7JPue1fzj9JSh9l4rQb763aOMiRYsXH/YJKlmcGTzGJ
         mAckIn+QgZSjm9MJMd+CQKRLvNqXgzKnV+iCX+w15eEC8iR2zp4boAeFiWSMArIQDOXM
         vO9tGpogD2TWWjj6mKFwNQuhOJtHgk2haOixM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744207356; x=1744812156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E5bQBdzdrrxAwjVcMoSn7R6YHyOz0D1Ji82aPtHYgp0=;
        b=I8G6VZ8rudCwaVRyowCM1EQYrxY+PnQmvem2RVFZ7qEO4Y/5lDAnkpjZvd2WE3/sxT
         brcfjNg3RpGLQA07UegiNVKsOSb5MsWNpRaL4oCPa54pJQq/Dm5DallGzsoylNW12OnU
         RtkE2IZAVuOLqd6B1CfkCPAO1Pm6CeVoyDbxnp9fa49zvJv10wCpr4lMQky5NLJ5sviP
         2E4U7xpb4voNRc7MP1AE9RRitS04aNF943Gbudcyi6LMPGmHMzXCeGa7j0qv8/rfzkHX
         HHNg3ExbHvAozOIT/TETXeS0YI9nsW5vrwEqu8HBjx2Erd6fe5BbflyErnK4j0blQrNo
         YScg==
X-Forwarded-Encrypted: i=1; AJvYcCX6i98KNOdOgVZbi4azm8w5SJeGsqro2kjkYOK0+N7xmgI6yecXJv59O6Wb02FgT6VAJkM9aQ4mbtGMmsM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywihc3pcAcPvNRqAMHR/Ber9GFnUpQIeCWMLrBoJRm2O9Wt6TS5
	K1RAVLe8EOeSgVB1ZfbIC8JaoGlT5KgxKjqkBAzi+eAYvJIEgzWjxUp/oDDfqA==
X-Gm-Gg: ASbGncsGLKsgMCFTtGPVwJZimsG6HCoP6ewhjkPdsqNbThwhRCYUfziFItB9HDQLqvJ
	EWAfB28MZfraRN8FbbbUZuwLYf2SKEwpJHCNVb9N5QH3Z1qnSYogy8OfhIp+4qwS7adkfvznJUV
	ghPMhH2nmQ/zgp3h6jctVk4ynoSN5qYO/Ua/Pmhbf+3Nfqi1VrnslL4+D7CAxgGYJzHvPqLIWVi
	Xtr8fyjitbhWhEMQDNWRF8ONsWkLbXUZsaVvakXOpOpVshNGeE4RUYWs0Y2VlisjKVTg6aphKNc
	iWrHgusQfT9YxHlZTHBT5O6epcWDSeUsU2Xw9zCyu9ng+jEbLXPPEvxvm23CUxRNpTd8X8C5ZkZ
	UUNA7bmGcUTol23aSRGoPHvtZIXZpKWGjfg==
X-Google-Smtp-Source: AGHT+IF7PMb1R5q8p59rA8TPAQBNjDsN03YUpj4RFQLPJr+kj5p6VXfvnMhdUKLLBLycNLAOFsyk9g==
X-Received: by 2002:a17:907:97c9:b0:ac2:cdcb:6a85 with SMTP id a640c23a62f3a-aca9b65e427mr329385266b.22.1744207355609;
        Wed, 09 Apr 2025 07:02:35 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (185.155.90.34.bc.googleusercontent.com. [34.90.155.185])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be95d0sm102657966b.55.2025.04.09.07.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 07:02:35 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jameson Thies <jthies@google.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Madhu M <madhu.m@intel.com>
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] usb: typec: ucsi: displayport: Fix deadlock
Date: Wed,  9 Apr 2025 14:02:20 +0000
Message-ID: <20250409140221.654892-2-akuchynski@chromium.org>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
In-Reply-To: <20250409140221.654892-1-akuchynski@chromium.org>
References: <20250409140221.654892-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch introduces the ucsi_con_mutex_lock / ucsi_con_mutex_unlock
functions to the UCSI driver. ucsi_con_mutex_lock ensures the connector
mutex is only locked if a connection is established and the partner pointer
is valid. This resolves a deadlock scenario where
ucsi_displayport_remove_partner holds con->mutex waiting for
dp_altmode_work to complete while dp_altmode_work attempts to acquire it.

Cc: stable@vger.kernel.org
Fixes: af8622f6a585 ("usb: typec: ucsi: Support for DisplayPort alt mode")
Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/ucsi/displayport.c | 19 ++++++++-------
 drivers/usb/typec/ucsi/ucsi.c        | 36 ++++++++++++++++++++++++++++
 drivers/usb/typec/ucsi/ucsi.h        |  2 ++
 3 files changed, 49 insertions(+), 8 deletions(-)

diff --git a/drivers/usb/typec/ucsi/displayport.c b/drivers/usb/typec/ucsi/displayport.c
index 420af5139c70..acd053d4e38c 100644
--- a/drivers/usb/typec/ucsi/displayport.c
+++ b/drivers/usb/typec/ucsi/displayport.c
@@ -54,7 +54,8 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	u8 cur = 0;
 	int ret;
 
-	mutex_lock(&dp->con->lock);
+	if (!ucsi_con_mutex_lock(dp->con))
+		return -ENOTCONN;
 
 	if (!dp->override && dp->initialized) {
 		const struct typec_altmode *p = typec_altmode_get_partner(alt);
@@ -100,7 +101,7 @@ static int ucsi_displayport_enter(struct typec_altmode *alt, u32 *vdo)
 	schedule_work(&dp->work);
 	ret = 0;
 err_unlock:
-	mutex_unlock(&dp->con->lock);
+	ucsi_con_mutex_unlock(dp->con);
 
 	return ret;
 }
@@ -112,7 +113,8 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	u64 command;
 	int ret = 0;
 
-	mutex_lock(&dp->con->lock);
+	if (!ucsi_con_mutex_lock(dp->con))
+		return -ENOTCONN;
 
 	if (!dp->override) {
 		const struct typec_altmode *p = typec_altmode_get_partner(alt);
@@ -144,7 +146,7 @@ static int ucsi_displayport_exit(struct typec_altmode *alt)
 	schedule_work(&dp->work);
 
 out_unlock:
-	mutex_unlock(&dp->con->lock);
+	ucsi_con_mutex_unlock(dp->con);
 
 	return ret;
 }
@@ -202,20 +204,21 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 	int cmd = PD_VDO_CMD(header);
 	int svdm_version;
 
-	mutex_lock(&dp->con->lock);
+	if (!ucsi_con_mutex_lock(dp->con))
+		return -ENOTCONN;
 
 	if (!dp->override && dp->initialized) {
 		const struct typec_altmode *p = typec_altmode_get_partner(alt);
 
 		dev_warn(&p->dev,
 			 "firmware doesn't support alternate mode overriding\n");
-		mutex_unlock(&dp->con->lock);
+		ucsi_con_mutex_unlock(dp->con);
 		return -EOPNOTSUPP;
 	}
 
 	svdm_version = typec_altmode_get_svdm_version(alt);
 	if (svdm_version < 0) {
-		mutex_unlock(&dp->con->lock);
+		ucsi_con_mutex_unlock(dp->con);
 		return svdm_version;
 	}
 
@@ -259,7 +262,7 @@ static int ucsi_displayport_vdm(struct typec_altmode *alt,
 		break;
 	}
 
-	mutex_unlock(&dp->con->lock);
+	ucsi_con_mutex_unlock(dp->con);
 
 	return 0;
 }
diff --git a/drivers/usb/typec/ucsi/ucsi.c b/drivers/usb/typec/ucsi/ucsi.c
index e8c7e9dc4930..ef867136e51d 100644
--- a/drivers/usb/typec/ucsi/ucsi.c
+++ b/drivers/usb/typec/ucsi/ucsi.c
@@ -1922,6 +1922,42 @@ void ucsi_set_drvdata(struct ucsi *ucsi, void *data)
 }
 EXPORT_SYMBOL_GPL(ucsi_set_drvdata);
 
+/**
+ * ucsi_con_mutex_lock - Acquire the connector mutex
+ * @con: The connector interface to lock
+ *
+ * Returns true on success, false if the connector is disconnected
+ */
+bool ucsi_con_mutex_lock(struct ucsi_connector *con)
+{
+	bool mutex_locked = false;
+	bool connected = true;
+
+	while (connected && !mutex_locked) {
+		mutex_locked = mutex_trylock(&con->lock) != 0;
+		connected = UCSI_CONSTAT(con, CONNECTED);
+		if (connected && !mutex_locked)
+			msleep(20);
+	}
+
+	connected = connected && con->partner;
+	if (!connected && mutex_locked)
+		mutex_unlock(&con->lock);
+
+	return connected;
+}
+EXPORT_SYMBOL_GPL(ucsi_con_mutex_lock);
+
+/**
+ * ucsi_con_mutex_unlock - Release the connector mutex
+ * @con: The connector interface to unlock
+ */
+void ucsi_con_mutex_unlock(struct ucsi_connector *con)
+{
+	mutex_unlock(&con->lock);
+}
+EXPORT_SYMBOL_GPL(ucsi_con_mutex_unlock);
+
 /**
  * ucsi_create - Allocate UCSI instance
  * @dev: Device interface to the PPM (Platform Policy Manager)
diff --git a/drivers/usb/typec/ucsi/ucsi.h b/drivers/usb/typec/ucsi/ucsi.h
index 3a2c1762bec1..9c5278a0c5d4 100644
--- a/drivers/usb/typec/ucsi/ucsi.h
+++ b/drivers/usb/typec/ucsi/ucsi.h
@@ -94,6 +94,8 @@ int ucsi_register(struct ucsi *ucsi);
 void ucsi_unregister(struct ucsi *ucsi);
 void *ucsi_get_drvdata(struct ucsi *ucsi);
 void ucsi_set_drvdata(struct ucsi *ucsi, void *data);
+bool ucsi_con_mutex_lock(struct ucsi_connector *con);
+void ucsi_con_mutex_unlock(struct ucsi_connector *con);
 
 void ucsi_connector_change(struct ucsi *ucsi, u8 num);
 
-- 
2.49.0.504.g3bcea36a83-goog

