Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB8328DB57
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 14:13:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751292791; cv=none; b=M059pfnZ2lfK6G5HAltv/1KlUXdqsJTqzQsSMfxsjzHpApMcwc9wkRWyrl0RkOGtdprmoQMG7VUqrfN3ocC9ovDDYY1Cc990NQWDb65ClGTEedIPy+JcQceepresFHzeP5GD7EzfzL4IVpJEMZ9BKwDFlOFJg8d3LVM0mZupSpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751292791; c=relaxed/simple;
	bh=jY2kl9ZPMO1inB5dCrD4v6khuWhLHIwJ9BEpVcZ+hmI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bluLtJg5kI1YwrRh7KGjNMGTma5pVMx9gzNL9pyRVRvFh/BQVjt5KmfYq/DnqFlBqYOVKderhqqQPzOsYXC5v1cDGXwo33Mw2XHnAQh6Mp2NuLfn9jRBY2h8Bf2gO5j0jsdZ50oprz54gh90T2TYLksG3D87N1LaWUEfGUdAkD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k1ifZ+oB; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k1ifZ+oB"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad572ba1347so325722066b.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 07:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1751292787; x=1751897587; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LKcKyNroNdhYDyM3neEw35xcf3wigABtK62twr/XvoA=;
        b=k1ifZ+oB5UHzBpwVegb0xh2+imVRzxFVT54UumLchZ/UiU/9CulZrGiHu0XoeuVxmN
         ensZ2c1uRvbi+/MROcyJ4EqF6QzN0UqWnlLvx6Q5+biN6w0LbkubuAy91AZmWN8+ITZ/
         qs2+2P+tKSChv9SSA1F/yCV1DI5TXrOgJGzkI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751292787; x=1751897587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LKcKyNroNdhYDyM3neEw35xcf3wigABtK62twr/XvoA=;
        b=WINfVROsQya39noa0vS8vtqbKRJgqZwcL2XtPuarGlFuIHNzJkQae+hh+2+etemtYy
         EAjp3cnvqNTTV3sg2lWyCn3pkJ9xnnl9iEiY+SU5m3jue71Hx0MAvpL1DgceNlnjJEww
         NqzUfpFQ91VJVK/0/EwjILGtmSUsZJjsFugNcbq7Tb2RZkkegvu/R61CRb5Rx7JuCcfs
         V6SYXmfsbHwp/KYyv7b4chFZtilqR4b+PixhzmaEAm0jJ5svldDh88ZJZRa++vEKzwnM
         79S6ig9Wibjf6D0c2efPBK5ybEd104+4Uy/x72b9dpBgyBQJ5p4STbdlmZszGYeVsQ/l
         74Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWIlZ08sz4uzl+p6oIPF1LmMeS04+WRlbOHTXZSF8BQpbDvP2MToSn2Y2+QLg15fTcJ3QDG4pFKMfj13xU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjDSmJpue4zEa2lsS1WNAV6zT58Ug3qCRix2IjxPrU+w7/edLo
	VBIxgT4/F8z96cbYKnHnfB5XUVn9wkoDashFojfsciYZxgwJd1Rl8D8BfVhqZFCaVQ==
X-Gm-Gg: ASbGncvwYDNj4gOe6BwnStnxaK8cDA/wDxyAGOsYR3RiBZdefcqbetMAkD2tR6vmTiy
	YlFwmCm6CwY92RIbq2C2a+VcPSq6QfQcpBUzQ+Gw3ABxZft0rgtCCSHsNhT5ti4j8e+qPLPUvDe
	62MrjVftWAj9kgBKMOC0GXiPBap2d8r8ClZJh34ZSU2VpHdmlxmUjDAusQweCbOF2qU+bBkoETr
	1zBLpVN1XRRa1LgIcccz8kN4L9TCPgn6x5xd1way1DE2ufPjJ22FdrABVEvOt1nG8pmQ6xSXc53
	KR3zHycgDGX61U/xt5KWD1rzJ/9VT06zQQTDr5oPkd4XCCMq71BYtyyp2sdjjgPjhsTxPkm+KWG
	j1Om2JHpHYxMtEeaHWgLsOiBOxEf5apK2pssjonXoTp8GBMGlk1OU5sgHZHuEKVI=
X-Google-Smtp-Source: AGHT+IEtMD4sbN5MFgRBUz6sC266Jsy/uQbBZWwtTQF8DL1F5ZClStA2819UuHd7XVsuqRIuVz6m4g==
X-Received: by 2002:a17:907:728e:b0:ae3:4f99:a5aa with SMTP id a640c23a62f3a-ae34fcf30e3mr1386108366b.4.1751292787420;
        Mon, 30 Jun 2025 07:13:07 -0700 (PDT)
Received: from akuchynski.c.googlers.com.com (72.144.91.34.bc.googleusercontent.com. [34.91.144.72])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae35363b416sm670643866b.28.2025.06.30.07.13.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 07:13:06 -0700 (PDT)
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
Subject: [PATCH v2 08/10] platform/chrome: cros_ec_typec: Propagate altmode entry result
Date: Mon, 30 Jun 2025 14:12:37 +0000
Message-ID: <20250630141239.3174390-9-akuchynski@chromium.org>
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

In the `cros_typec_configure_mux` function, which concludes the DP/TBT
alternate mode entry, the error code should be reported back to the Type-C
mode selection logic. This ensures a detailed result is conveyed to user
space. To inform partner drivers about the result, the VDM mechanism is
used: DP_CMD_STATUS_UPDATE for DP altmode and TBT_CMD_STATUS_UPDATE for
TBT altmode.

Signed-off-by: Andrei Kuchynski <akuchynski@chromium.org>
---
 drivers/platform/chrome/cros_ec_typec.c      |  9 ++++++
 drivers/platform/chrome/cros_typec_altmode.c | 32 ++++++++++++++++++--
 drivers/platform/chrome/cros_typec_altmode.h |  6 ++++
 include/linux/usb/typec_dp.h                 |  2 ++
 4 files changed, 46 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chrome/cros_ec_typec.c
index 3aed429fde03..a4f338771094 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -610,6 +610,7 @@ static int cros_typec_enable_dp(struct cros_typec_data *typec,
 	if (!ret)
 		ret = typec_mux_set(port->mux, &port->state);
 
+	dp_data.error = 0;
 	if (!ret)
 		ret = cros_typec_displayport_status_update(port->state.alt,
 							   port->state.data);
@@ -699,8 +700,16 @@ static int cros_typec_configure_mux(struct cros_typec_data *typec, int port_num,
 		ret = cros_typec_enable_usb4(typec, port_num, pd_ctrl);
 	} else if (port->mux_flags & USB_PD_MUX_TBT_COMPAT_ENABLED) {
 		ret = cros_typec_enable_tbt(typec, port_num, pd_ctrl);
+		cros_typec_tbt_status_update(
+			port->port_altmode[CROS_EC_ALTMODE_TBT], ret);
 	} else if (port->mux_flags & USB_PD_MUX_DP_ENABLED) {
 		ret = cros_typec_enable_dp(typec, port_num, pd_ctrl);
+		if (ret) {
+			struct typec_displayport_data dp_data = {.error = ret};
+
+			cros_typec_displayport_status_update(
+				port->port_altmode[CROS_EC_ALTMODE_DP], &dp_data);
+		}
 	} else if (port->mux_flags & USB_PD_MUX_SAFE_MODE) {
 		ret = cros_typec_usb_safe_state(port);
 	} else if (port->mux_flags & USB_PD_MUX_USB_ENABLED) {
diff --git a/drivers/platform/chrome/cros_typec_altmode.c b/drivers/platform/chrome/cros_typec_altmode.c
index 557340b53af0..7ee295cf0c02 100644
--- a/drivers/platform/chrome/cros_typec_altmode.c
+++ b/drivers/platform/chrome/cros_typec_altmode.c
@@ -28,6 +28,7 @@ struct cros_typec_altmode_data {
 
 	u16 sid;
 	u8 mode;
+	int error;
 };
 
 struct cros_typec_dp_data {
@@ -295,9 +296,16 @@ int cros_typec_displayport_status_update(struct typec_altmode *altmode,
 
 	dp_data->data = *data;
 	dp_data->pending_status_update = false;
-	adata->header |= VDO_CMDT(CMDT_RSP_ACK);
-	adata->vdo_data = &dp_data->data.status;
-	adata->vdo_size = 2;
+	if (data->error) {
+		adata->header |= VDO_CMDT(CMDT_RSP_NAK);
+		adata->error = dp_data->data.error;
+		adata->vdo_data = &adata->error;
+		adata->vdo_size = 1;
+	} else {
+		adata->header |= VDO_CMDT(CMDT_RSP_ACK);
+		adata->vdo_data = &dp_data->data.status;
+		adata->vdo_size = 2;
+	}
 	schedule_work(&adata->work);
 
 	mutex_unlock(&adata->lock);
@@ -370,4 +378,22 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 
 	return alt;
 }
+
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error)
+{
+	struct cros_typec_altmode_data *adata = typec_altmode_get_drvdata(alt);
+
+	mutex_lock(&adata->lock);
+
+	adata->header = VDO(adata->sid, 1, SVDM_VER_2_0, TBT_CMD_STATUS_UPDATE);
+	adata->header |= VDO_CMDT(error ? CMDT_RSP_NAK : CMDT_RSP_ACK);
+	adata->error = error;
+	adata->vdo_data = &adata->error;
+	adata->vdo_size = 1;
+	schedule_work(&adata->work);
+
+	mutex_unlock(&adata->lock);
+
+	return 0;
+}
 #endif
diff --git a/drivers/platform/chrome/cros_typec_altmode.h b/drivers/platform/chrome/cros_typec_altmode.h
index 3f2aa95d065a..848a2b194b34 100644
--- a/drivers/platform/chrome/cros_typec_altmode.h
+++ b/drivers/platform/chrome/cros_typec_altmode.h
@@ -39,6 +39,7 @@ static inline int cros_typec_displayport_status_update(struct typec_altmode *alt
 struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
 				struct typec_altmode_desc *desc);
+int cros_typec_tbt_status_update(struct typec_altmode *alt, int error);
 #else
 static inline struct typec_altmode *
 cros_typec_register_thunderbolt(struct cros_typec_port *port,
@@ -46,6 +47,11 @@ cros_typec_register_thunderbolt(struct cros_typec_port *port,
 {
 	return typec_port_register_altmode(port->port, desc);
 }
+static inline int cros_typec_tbt_status_update(struct typec_altmode *alt,
+					int error)
+{
+	return 0;
+}
 #endif
 
 #endif /* __CROS_TYPEC_ALTMODE_H__ */
diff --git a/include/linux/usb/typec_dp.h b/include/linux/usb/typec_dp.h
index acb0ad03bdac..c9fa68cd1265 100644
--- a/include/linux/usb/typec_dp.h
+++ b/include/linux/usb/typec_dp.h
@@ -44,10 +44,12 @@ enum {
  * commands: Status Update and Configure.
  *
  * @status will show for example the status of the HPD signal.
+ * @error will contain the error code, if applicable.
  */
 struct typec_displayport_data {
 	u32 status;
 	u32 conf;
+	int error;
 };
 
 enum {
-- 
2.50.0.727.gbf7dc18ff4-goog

