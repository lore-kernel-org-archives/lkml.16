Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73C3028D844
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292787; cv=none; b=tkiRBaA7Mt9JiUMjcbDOYcqwc6jIHMVZ0FGZSCayw3qTPmSwBIncHOwyCCLBXihSJ17siSq2vYo3jXP8zb87KGgLBgZA6oYOogqZMOXY2bQnLnOe+KId7Ws5ZOOazW7N8K/f1S8Z2ndEZLw3qi21sBEiqFjcew8jhFh80Gz8/vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292787; c=relaxed/simple;
	bh=JA24plc6JdjA4fikFG6BIX4URnAqtE4V6iIC4bwufO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LtSEpuu3+m/XGGgkbW23rHnIF/vrMXNFyjb9/S2FJ66pIIqQT6NWQL4qXr9cCP0s2hJtz0VU4g2EAHb9jgsigClAYcJ3RsVyCVePja/yVMIIvFh3gAXFq9Qpmt94QCBXOcgbFsnpe2ChucyY0nyWcCILLaktbmokrPzusaYGyos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=FSogK4VZ; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="FSogK4VZ"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-ae3a604b43bso39537866b.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292784; x=1751897584; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnfzEhcMGH710pP5n1hL+xNgQ88oIo7YgySroYK1fww=;
        b=FSogK4VZG+7yf3CRktFJwtPI8J53l0Hs94SdQ0zGK9X9K9AURNdw23ydsVJgWX77Dv
         qx0b8EAVDIe/NNxmIf73lyq9ApjQfoY81FF6wwYOewVRkjQA0cL7bmVlYMJrLSRBI8RM
         8zeFQ7Mx2Q9Y1d1gaNWYrWiZUFeFN1k8D0nfQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292784; x=1751897584;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KnfzEhcMGH710pP5n1hL+xNgQ88oIo7YgySroYK1fww=;
        b=vqPqfmPlm9stlfbLEir3vomJIMiz0cAMlhx8M9o5Va7eks0Vok0bFVJ1d9nYEc/6QO
         EUIXDudjmZ1znnmmfSCugQWydrMU7uAhPgtjyD+1uvmBzVqWU/PsD9DXYlvPegoPL3CE
         3mf6XYpjDq25a2wV1jc8x4lL3erGN5CyEoMwB13tfE25/iJFWN0kl2OCr+kaNa9fNuPk
         HePnc3SbL3tILwTMa7ZYOPCQYT3SYT+QQXPIGVKM6DR9BWslZaGM/dMae82v/c6+xXuF
         aYRqHlvULt2IEiASN0i7+GABMQ7ssqUtEjAB0Of56XyP14CWt4s+e080UoboqK0DBO4I
         cDVQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8JBDkulgf1evKJj7/uH4Bz7jHLOEKXKSXujd3ky/x1J+3IfflaphpNhkm6iR49dQY7KdzCoYAhAR/6sk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXDaY8Q4RBwcoo4HsSocFWaq57PZi/cCgM658JpWPQ7Nwxm55E
	MvQGubyAN0nwnG5BfumLNVotKGHRyklF3Sgsn+cbeyIz0vXyz7eul4nHgajwfDeAJA==
X-Gm-Gg: ASbGncshni2rvqjP89ngKGf28hT5AH1jpG4+HpFusEVcfNBYfnmZDPXe7fwk7cuJS3P
	PE1N2hguD3wdmBSDJeSd7Vvk4wQ8LuxQP6RveuhGJFbdJYIAqKMCD7ucyhIgWgUBxK4CcfzioVQ
	SlTbfGi0egvOp5ScV1mVXGurNxf1Hse5aV6jBii3XJTGSAqEaaC80LbxPztUwqDyuk7ximZl7iK
	90iJ4LElY7fslyWcH9FzboYGKYcsS7BTSLlF21VsqLtl1r++admxYKWZhzcJ9vo+MFyYEIvhcCr
	BHicv/nHqhxld2VLipFezfyowYT+XYR9pTkzFhFHDv24CBcw7INi7QRekxiGeeFFj6ikGLf1Qef
	bG/WKTSOWvjbzqDl8OoJkk3/ymO0JY2SkhWUvY5OICItmdPd/YVpI
X-Google-Smtp-Source: AGHT+IFRl69xcS5vTWBsPpI7KkA2Isw3/oNvqKOqHzWPALspUIXL6/n50O56D58RXbIYSpJYvzr3+w==
X-Received: by 2002:a17:907:8691:b0:ae0:180b:bb54 with SMTP id a640c23a62f3a-ae34fd8981fmr1240152466b.26.1751292782963;
        Mon, 30 Jun 2025 07:13:02 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:02 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	linux-usb@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Guenter Roeck <groeck@chromium.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	"Christian A. Ehrhardt" <lk@c--e.de>,
	linux-kernel@vger.kernel.org,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH v2 06/10] usb: typec: Report altmode entry status via callback
Date: Mon, 30 Jun 2025 14:12:35 +0000
Message-ID: <20250630141239.3174390-7-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
In-Reply-To: <20250630141239.3174390-1-akuchynski@chromium.org>
References: <20250630141239.3174390-1-akuchynski@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Type-C mode selection logic requires feedback on the result of an
alternate mode entry attempt.
Call the `typec_mode_selection_altmode_complete()` callback to provide
this final success or failure status.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/usb/typec/altmodes/displayport.c | 17 +++++++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c |  8 ++++++++
 include/linux/usb/typec_tbt.h            |  3 +++
 3 files changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index d8b906ec4d1c..f0c8395a6652 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -274,16 +274,20 @@ static void dp_altmode_work(struct work_struct *work)
 		header = DP_HEADER(dp, svdm_version, DP_CMD_STATUS_UPDATE);
 		vdo = 1;
 		ret = typec_altmode_vdm(dp->alt, header, &vdo, 2);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Status Update command (%d)\n",
 				ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE:
 		ret = dp_altmode_configure_vdm(dp, dp->data.conf);
-		if (ret)
+		if (ret) {
 			dev_err(&dp->alt->dev,
 				"unable to send Configure command (%d)\n", ret);
+			typec_mode_selection_altmode_complete(dp->alt, ret);
+		}
 		break;
 	case DP_STATE_CONFIGURE_PRIME:
 		ret = dp_altmode_configure_vdm_cable(dp, dp->data_prime.conf);
@@ -352,6 +356,7 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
 	int ret = 0;
+	int entry_result = 0;
 
 	mutex_lock(&dp->lock);
 
@@ -395,10 +400,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case DP_CMD_STATUS_UPDATE:
 			dp->state = DP_STATE_EXIT;
+			entry_result = *(int *)vdo;
 			break;
 		case DP_CMD_CONFIGURE:
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
+			entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -413,6 +420,12 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 err_unlock:
 	mutex_unlock(&dp->lock);
+
+	if (!entry_result)
+		entry_result = ret;
+	if (entry_result || cmd == DP_CMD_CONFIGURE)
+		typec_mode_selection_altmode_complete(dp->alt, entry_result);
+
 	return ret;
 }
 
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..bbba3c6bc8b8 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -214,6 +214,7 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 	struct typec_thunderbolt_data data;
 	int cmd_type = PD_VDO_CMDT(hdr);
 	int cmd = PD_VDO_CMD(hdr);
+	int entry_result = 0;
 
 	mutex_lock(&tbt->lock);
 
@@ -248,6 +249,10 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		switch (cmd) {
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
+			entry_result = *(int *)vdo;
+			break;
+		case TBT_CMD_STATUS_UPDATE:
+			entry_result = *(int *)vdo;
 			break;
 		default:
 			break;
@@ -262,6 +267,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 
 	mutex_unlock(&tbt->lock);
 
+	if (entry_result || cmd == TBT_CMD_STATUS_UPDATE)
+		typec_mode_selection_altmode_complete(alt, entry_result);
+
 	return 0;
 }
 
diff --git a/include/linux/usb/typec_tbt.h b/include/linux/usb/typec_tbt.h
index 55dcea12082c..57cbda5292bb 100644
--- a/include/linux/usb/typec_tbt.h
+++ b/include/linux/usb/typec_tbt.h
@@ -24,6 +24,9 @@ struct typec_thunderbolt_data {
 	u32 enter_vdo;
 };
 
+/* TBT3 alt mode specific commands */
+#define TBT_CMD_STATUS_UPDATE		VDO_CMD_VENDOR(0)
+
 /* TBT3 Device Discover Mode VDO bits */
 #define TBT_MODE			BIT(0)
 #define TBT_ADAPTER(_vdo_)		FIELD_GET(BIT(16), _vdo_)
-- 
2.50.0.727.gbf7dc18ff4-goog

