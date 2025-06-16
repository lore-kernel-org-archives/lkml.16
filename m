Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0EA2877C3
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 13:33:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750080804; cv=none; b=Fmi3/d2ao5StZ+a61guV+/BieY+fqivu0Oazi12CMucRVF+9Kh+v4kRe99QcJQ4q/Qkbsbq+Z1DcT7yF3M9MoBB0PXiRyz1AuliMG/+ZmSkumgInl/7Jn6r/vK7Tw6ui2Ian3DZS2HHYjTETNgXlhAke9K1kMydCk/w6MRKHuc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750080804; c=relaxed/simple;
	bh=0PHI8c4cGupy6mr00/69MtbHFn0M40BQMFD2F7JuKUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NKgLT4EFAp9vL8geiKeh4e5teYGneSxJgg1Bh6r9XtaJhZ368k57oXpztHHUjvqg1O9D+Ry613xNTAx76qgxulUqJa7YSdnE78xRMxHGfZmdc31Kynksso12Tw7ogZXJUk2QFJmJqjbr9ReHUNH+oL4upxj/24i33ialChZUyQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VGrkzcjH; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VGrkzcjH"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso7859647a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 06:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1750080801; x=1750685601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zhqvBCRWi83ljiiFIoIKKjzL3JwEFntoAes/MRvHbvg=;
        b=VGrkzcjHJcxoKsVJO/hC0a5HRDzdSXGHs+xUtbV+PUKcnazteRKOU0/azSgJN7RpfK
         pp6D8TdJ/tYgGBJibvmMEIYYnBUAlU9lI7b2llWcotjEk1LeUS40amFJBWGGZQWdCYQm
         CgziL5y2yVh33bW8QCckwfwZKuQMruphZJlsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750080801; x=1750685601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhqvBCRWi83ljiiFIoIKKjzL3JwEFntoAes/MRvHbvg=;
        b=HXw4DiJ14B8FPoJDfgS+KXNy9BeL7ETJ2IyG8tMdRKBLnu6gk/b2uxbKnYkUO7oEX5
         6IdM//vmT/OlZqQYyv+gGx7DN4uUPKq9hsf4ZijqADf3+ZtnXqJLDZgoF/Jd+/S23RoY
         Ks1VIVaNjkzG5dRJTlNVPBZgafc14Rs8hIOEk6+GRcoPQW0RJXzqsk7gOqzYSGOwyQ9N
         mZl5pKAUueuZekTx7hy+rsIpPx8Ncl4NOyrUJpABaNxlyrr2W2xF9HefjsX8GCxMtd9R
         Ld0G21w0aMpVIEVTDjhsGLR0+kfF/rwVV92fSOwBtfKe3iKQVo5NDBHj0hzBX/5k+zuf
         DBVA==
X-Forwarded-Encrypted: i=1; AJvYcCVpLGRZLgmem8Hrwwf+2GqjqkWHI4//tEJXn1v3hqXbNRHKgzs4PwHiKdj4byP9/f8qWR08ZVcrVdpygDI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoHsj/8KE9AG8yWXBPNUjAgIPfD/J98/8oqtx7m1PrlinJjPP6
	tC1/NYkVxV+IBvNU1/fUr3xw7ThOnm17+858/lHH8uugHw6iDL4l7mAHukqmogcUsg==
X-Gm-Gg: ASbGncvWZJ3HyczHpxdRPUE6omwM77j4OBx/PRJy2+qzF7cHrudjCes44uOFNt2GZuY
	A1q3bmFe4e5cXRgj1bY9tZJYITFpNPKqpgoTXMr4YZx/MA3bvOV1iqL74p/Y1ossUaBQotbJggD
	L+Wgaq9ENJarmT8ujFm+EYqQLTR3yMLHFLBvd5GnLYr/IOQ89j7fC8SvUtC5ha2sgCK3Emqy4We
	ShvC0HkGwnF/yQ5C0E9Lv825gstKk2f3WZ/Q+rrW23r0FqqZC0R8zUrKQr7SeD7BJjzue45EeUg
	uyffcR8/96/RE7ZfW3EitVsDj9cnsRpb9Hq+yVAMg1tD4L5ThIP2p+asYaZVUbXxSG6WkieJVJr
	JgoKeGVkrCmbyoE8zgfEU3mLUS/rqEtH866pJG08VtwaYyb34BJEl1xMQTsgglEC1km00
X-Google-Smtp-Source: AGHT+IHfbJubtALYX705aMPJAZLadxG+o3H7c51K1HROrB1vOE0jaYQjb3BtZP2Tk8Y8fXZXY/12hQ==
X-Received: by 2002:a05:6402:13d4:b0:606:e754:62bb with SMTP id 4fb4d7f45d1cf-608d09e3938mr8395397a12.28.1750080800769;
        Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (244.175.141.34.bc.googleusercontent.com. [34.141.175.244])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a94ce7sm6036664a12.58.2025.06.16.06.33.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 06:33:20 -0700 (PDT)
From: Andrei Kuchynski <akuchynski@chromium.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guenter Roeck <groeck@chromium.org>,
	Pooja Katiyar <pooja.katiyar@intel.com>,
	Badhri Jagan Sridharan <badhri@google.com>,
	RD Babiera <rdbabiera@google.com>,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 07/10] usb: typec: Report altmode entry status via callback
Date: Mon, 16 Jun 2025 13:31:44 +0000
Message-ID: <20250616133147.1835939-8-akuchynski@chromium.org>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
In-Reply-To: <20250616133147.1835939-1-akuchynski@chromium.org>
References: <20250616133147.1835939-1-akuchynski@chromium.org>
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
 drivers/usb/typec/altmodes/displayport.c | 13 +++++++++++--
 drivers/usb/typec/altmodes/thunderbolt.c |  6 ++++++
 include/linux/usb/typec_tbt.h            |  3 +++
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index ac84a6d64c2f..946f61b57fa0 100644
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
@@ -397,6 +401,9 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 			dp->data.conf = 0;
 			ret = dp_altmode_configured(dp);
 			break;
+		case DP_CMD_STATUS_UPDATE:
+			ret = *(int *)vdo;
+			break;
 		default:
 			break;
 		}
@@ -407,6 +414,8 @@ static int dp_altmode_vdm(struct typec_altmode *alt,
 
 	if (dp->state != DP_STATE_IDLE)
 		schedule_work(&dp->work);
+	else if (ret || cmd == DP_CMD_CONFIGURE)
+		typec_mode_selection_altmode_complete(dp->alt, ret);
 
 err_unlock:
 	mutex_unlock(&dp->lock);
diff --git a/drivers/usb/typec/altmodes/thunderbolt.c b/drivers/usb/typec/altmodes/thunderbolt.c
index 6eadf7835f8f..697ab6060652 100644
--- a/drivers/usb/typec/altmodes/thunderbolt.c
+++ b/drivers/usb/typec/altmodes/thunderbolt.c
@@ -242,6 +242,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 			else if (tbt->plug[TYPEC_PLUG_SOP_P])
 				tbt->state = TBT_STATE_SOP_P_EXIT;
 			break;
+		case TBT_CMD_STATUS_UPDATE:
+			typec_mode_selection_altmode_complete(alt, 0);
+			break;
 		}
 		break;
 	case CMDT_RSP_NAK:
@@ -249,6 +252,9 @@ static int tbt_altmode_vdm(struct typec_altmode *alt,
 		case CMD_ENTER_MODE:
 			dev_warn(&alt->dev, "Enter Mode refused\n");
 			break;
+		case TBT_CMD_STATUS_UPDATE:
+			typec_mode_selection_altmode_complete(alt, *(int *)vdo);
+			break;
 		default:
 			break;
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
2.50.0.rc1.591.g9c95f17f64-goog

