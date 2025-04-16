Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68C066F30C
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 00:02:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744761739; cv=none; b=KlHvzH/3rdhIJcoZJvm8xDaL+etVj57+OiJjYSvZnXuaUaeTefflLjpuVZODaP5RyZqHxO3YmSXXln4zH+yOG1RsGuH3b7Am5KVydsmLbQDM1Tudu/IASyx9GWEh98aKEEOv9fuccQuvIL85QUSG8+XS1x776dCklLYv8qcG8N4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744761739; c=relaxed/simple;
	bh=GwnkAZU+uW9fAkCDWWme3oB1O6PxoBs+pYMPoHkdFMQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=aYHJDwgUecFp/raF+GoVkOOnALrHZwVPe8i3qqO+EU4c1heFEyjLzevJUL73Gu4UowBoCsMZZJPUsq5//r4Tf7V8HxkJabdevv9N/MryVNqX+HeCEiUeGL1e3opWRWxkI2F/Zs1ExKCHqq4Ja+zSjupimNCYPt1o9LwNUxXfRvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jDxg0ZmW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jDxg0ZmW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2254e0b4b79so84045125ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 17:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1744761737; x=1745366537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pLpTjFW7p6ghiYRblP02dy0kbs1t/nRG9KfdA64BMng=;
        b=jDxg0ZmWXkY7/crCU4dh2s0ImdvGa3j7mKy8npK2BmZp6SxxErN+YJw5TL8PoSxTc6
         9G5uulvzJU1bR9eFHsBjgU2rEnJAtHWJb+7b+QmwwZqZ0JTBhAlU/34sZDLC6DnJjlNo
         J3DrfSpyMsN9ZDzq2VZpjr4riVdV+FqZlWbLQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744761737; x=1745366537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pLpTjFW7p6ghiYRblP02dy0kbs1t/nRG9KfdA64BMng=;
        b=ViQ1fGtVGU0vr9mv+tkX8zlYPdDa5ShIs6FQ9ugejW8B6dl0mh/9KMLgqqwJlgoiIM
         F49Uddn6tC0gcFrz4pdK4jjCg9HXSk2SUzVk20mIrh+a7tJ8bkc+N7EZ2Z07rPT9nCZf
         OuX0MMa8xpja53ysLKNS9iZsE63qCMSouNZ4wmi2OiWAZc5TbWhJesr3iLz7+W+t1Fkt
         t12Po31pbGskHjU+ly4FnTymo5+ZprVCeVHa+QM4YiJpXzo0zTSOMiwZg9ZeLk30u8lJ
         uOUAhbx75r2gQZ6BajFg8TVyTDhKZIJau2iqjbwLs+LLQC2N8d91E9Usg+E2QCG1V1aQ
         rjPw==
X-Gm-Message-State: AOJu0Yw7e/uFwWtXoyyRwWA6qdzH7CVorfsaU4sWSi4IDy27dZ1EMF11
	HGmdgqazgvYoCu//tNBrc5/YadRQtBKcbIi8vCnmUizeodP1CGNnLH8qE+9lFw==
X-Gm-Gg: ASbGncvKXzxyryjKvJ12JJE/LdiJ/XpXBI4EOUgx8p8vxa/hh/uVuk7pPBvC9eDta7L
	q5x2Lf2Y/1rIaYTTycY4NYxNx9bX+q1reDBWRdvICm0LI79ioHF3DaoEJAPgTp47Szjpe1MrC7h
	7QIrrXTZmZuWATD6sztYFiQ01djjd442D1UsjPV3YeACiKRbZ9XrtcEgOq2xzYa/dKL8TH+2380
	IxHopSplUOMcnNi9G59i3igIbPdJj3z2Wpze690sSf7Xkyf/TwF66MulFoehFex3ujsW3kY/T1q
	GZaVhFLupX2thfs1Ka0V9AkwoEdGt2NLKPH3wrQldb3xgPLgjhczHxGAAUoYgdSw1qPeOpkkreZ
	NOw==
X-Google-Smtp-Source: AGHT+IFgDSfSzHJQGblYKtBgX+uGjROsnXUma1oaTnVLcJEUU+QM71Xipmk/uC+evcJTJfTYjoWWzQ==
X-Received: by 2002:a17:902:d585:b0:223:536d:f67b with SMTP id d9443c01a7336-22c31a86b22mr19203715ad.38.1744761736701;
        Tue, 15 Apr 2025 17:02:16 -0700 (PDT)
Received: from localhost (199.24.125.34.bc.googleusercontent.com. [34.125.24.199])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-308613b3849sm196331a91.38.2025.04.15.17.02.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 17:02:16 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor+dt@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	chrome-platform@lists.linux.dev,
	Pin-yen Lin <treapking@chromium.org>,
	Abhishek Pandit-Subedi <abhishekpandit@chromium.org>,
	=?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
	Jameson Thies <jthies@google.com>,
	Andrei Kuchynski <akuchynski@chromium.org>
Subject: [PATCH 3/7] platform/chrome: cros_ec_typec: Support EC mode entry
Date: Tue, 15 Apr 2025 17:02:03 -0700
Message-ID: <20250416000208.3568635-4-swboyd@chromium.org>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
In-Reply-To: <20250416000208.3568635-1-swboyd@chromium.org>
References: <20250416000208.3568635-1-swboyd@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Support ChromeOS EC firmwares that don't support AP mode entry. Check
that the mode has been entered by querying the EC and reject mode entry
attempts if the EC hasn't already entered the mode requested. This
allows us to bind the DP altmode driver on devices that don't support AP
mode entry, i.e. most ChromeOS devices where the EC controls mode entry.

Cc: Benson Leung <bleung@chromium.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: <chrome-platform@lists.linux.dev>
Cc: Pin-yen Lin <treapking@chromium.org>
Cc: Abhishek Pandit-Subedi <abhishekpandit@chromium.org>
Cc: Łukasz Bartosik <ukaszb@chromium.org>
Cc: Jameson Thies <jthies@google.com>
Cc: Andrei Kuchynski <akuchynski@chromium.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/chrome/cros_typec_altmode.c | 112 +++++++++++++------
 1 file changed, 75 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index c2d9c548b5e8..97ca4cfabbc0 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -58,31 +58,50 @@ static void cros_typec_altmode_work(struct work_struct *work)
 static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 {
 	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
-	struct ec_params_typec_control req = {
-		.port = adata->port->port_num,
-		.command = TYPEC_CONTROL_COMMAND_ENTER_MODE,
-	};
+	struct cros_ec_device *ec = adata->port->typec_data->ec;
+	unsigned int port = adata->port->port_num;
 	int svdm_version;
 	int ret;
 
 	if (!adata->ap_mode_entry) {
-		dev_warn(&alt->dev,
-			 "EC does not support AP driven mode entry\n");
-		return -EOPNOTSUPP;
+		struct ec_response_usb_pd_mux_info resp;
+		struct ec_params_usb_pd_mux_info req = {
+			.port = port,
+		};
+		uint8_t flags;
+
+		if (adata->sid == USB_TYPEC_DP_SID)
+			flags = USB_PD_MUX_DP_ENABLED;
+		else if (adata->sid == USB_TYPEC_TBT_SID)
+			flags = USB_PD_MUX_TBT_COMPAT_ENABLED;
+		else
+			return -EOPNOTSUPP;
+
+		ret = cros_ec_cmd(ec, 0, EC_CMD_USB_PD_MUX_INFO,
+				  &req, sizeof(req), &resp, sizeof(resp));
+		if (ret < 0)
+			return ret;
+
+		if (!(resp.flags & flags))
+			return -EINVAL;
+	} else {
+		struct ec_params_typec_control req = {
+			.port = port,
+			.command = TYPEC_CONTROL_COMMAND_ENTER_MODE,
+		};
+
+		if (adata->sid == USB_TYPEC_DP_SID)
+			req.mode_to_enter = CROS_EC_ALTMODE_DP;
+		else if (adata->sid == USB_TYPEC_TBT_SID)
+			req.mode_to_enter = CROS_EC_ALTMODE_TBT;
+		else
+			return -EOPNOTSUPP;
+
+		ret = cros_ec_cmd(ec, 0, EC_CMD_TYPEC_CONTROL, &req, sizeof(req), NULL, 0);
+		if (ret < 0)
+			return ret;
 	}
 
-	if (adata->sid == USB_TYPEC_DP_SID)
-		req.mode_to_enter = CROS_EC_ALTMODE_DP;
-	else if (adata->sid == USB_TYPEC_TBT_SID)
-		req.mode_to_enter = CROS_EC_ALTMODE_TBT;
-	else
-		return -EOPNOTSUPP;
-
-	ret = cros_ec_cmd(adata->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
-			  &req, sizeof(req), NULL, 0);
-	if (ret < 0)
-		return ret;
-
 	svdm_version = typec_altmode_get_svdm_version(alt);
 	if (svdm_version < 0)
 		return svdm_version;
@@ -97,31 +116,52 @@ static int cros_typec_altmode_enter(struct typec_altmode *alt, u32 *vdo)
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
-	return ret;
+
+	return 0;
 }
 
 static int cros_typec_altmode_exit(struct typec_altmode *alt)
 {
 	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
-	struct ec_params_typec_control req = {
-		.port = adata->port->port_num,
-		.command = TYPEC_CONTROL_COMMAND_EXIT_MODES,
-	};
+	struct cros_ec_device *ec = adata->port->typec_data->ec;
+	unsigned int port = adata->port->port_num;
 	int svdm_version;
 	int ret;
 
 	if (!adata->ap_mode_entry) {
-		dev_warn(&alt->dev,
-			 "EC does not support AP driven mode exit\n");
-		return -EOPNOTSUPP;
+		struct ec_response_usb_pd_mux_info resp;
+		struct ec_params_usb_pd_mux_info req = {
+			.port = port,
+		};
+		uint8_t flags;
+
+		if (adata->sid == USB_TYPEC_DP_SID)
+			flags = USB_PD_MUX_DP_ENABLED;
+		else if (adata->sid == USB_TYPEC_TBT_SID)
+			flags = USB_PD_MUX_TBT_COMPAT_ENABLED;
+		else
+			return -EOPNOTSUPP;
+
+		ret = cros_ec_cmd(ec, 0, EC_CMD_USB_PD_MUX_INFO,
+				  &req, sizeof(req), &resp, sizeof(resp));
+		if (ret < 0)
+			return ret;
+
+		if (resp.flags & flags)
+			return -EINVAL;
+	} else {
+		struct ec_params_typec_control req = {
+			.port = port,
+			.command = TYPEC_CONTROL_COMMAND_EXIT_MODES,
+		};
+
+		ret = cros_ec_cmd(adata->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
+				  &req, sizeof(req), NULL, 0);
+
+		if (ret < 0)
+			return ret;
 	}
 
-	ret = cros_ec_cmd(adata->port->typec_data->ec, 0, EC_CMD_TYPEC_CONTROL,
-			  &req, sizeof(req), NULL, 0);
-
-	if (ret < 0)
-		return ret;
-
 	svdm_version = typec_altmode_get_svdm_version(alt);
 	if (svdm_version < 0)
 		return svdm_version;
@@ -136,7 +176,8 @@ static int cros_typec_altmode_exit(struct typec_altmode *alt)
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
-	return ret;
+
+	return 0;
 }
 
 static int cros_typec_displayport_vdm(struct typec_altmode *alt, u32 header,
@@ -254,9 +295,6 @@ static int cros_typec_altmode_vdm(struct typec_altmode *alt, u32 header,
 {
 	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
 
-	if (!adata->ap_mode_entry)
-		return -EOPNOTSUPP;
-
 	if (adata->sid == USB_TYPEC_DP_SID)
 		return cros_typec_displayport_vdm(alt, header, data, count);
 
-- 
https://chromeos.dev

