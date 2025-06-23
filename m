Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C70631F3FF8
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 20:50:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750711813; cv=none; b=OiCXuzrSmbhZz1ESGn1R6x9g0qTynH+JCiG45DW/S3lm8H991mN5HOGWMokUAPC/MMguPM8Kc09vIEYGQEl7dAgRJqTOVR+enEJC5MlVSCS47IvRruIBMDSv87iuBqLGInhic6cDWn1RER5DRl91dCAB0CgY4SRch6AxT8G0qqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750711813; c=relaxed/simple;
	bh=uz2ElJYIzX/cgxoKu5QBxgP+WP9haMEoF7b6RVX3zZ0=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=M6Xs52DXsD3SUw9krzp8N/4vy4HXVatazeFYSupe/50wiIwwwgmYeUQJAOqlGTL5RMde2f6+rrpX6+7AxGa2fg5Ob80eOiWMEXsuNw8Xq8GNryA7YlG0xTdNj0qk13yQsGG0mqq0MUGZYLwwj75Igdclngogh31oCKzmHhhAb8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TB9qhk5V; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TB9qhk5V"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235842baba4so40687955ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 13:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750711811; x=1751316611; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:from:subject:message-id:mime-version
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=i1zclfHGYxg3v3CZHfO4BrhgqnbUkfK0CqXRN/pzU0E=;
        b=TB9qhk5VMjmWqowiWam6wZc28NuyGMUEWHyJeanS6vKx5aHc0cGQ9rZ0xKsCwdx/gp
         2vRY+C85T9kOLGEuNFk8MEGKNlwLBPzm5WpmXsdoIB1dEf470oOcqjePPk+SUNjUEQCv
         y0n2bXU3XtfgzozAUm3KJFDiYAPeOOI1RuZs/YTcIoEa+ENmbg55H5ZG6e/zm60kVUFg
         KYpTIOYCCtaW85+DmpKtNG9wnRCKhOPXKP2Pija0gK3C+kuB7eexAQvuHxVzgoOWL1VW
         Qjfo4SjPzyJ6G7qLEgs29XabRjQudgwhrY+syiN6iU47uzj9ZWndj7DzlR9khtJVCptl
         8RSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750711811; x=1751316611;
        h=content-transfer-encoding:cc:from:subject:message-id:mime-version
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i1zclfHGYxg3v3CZHfO4BrhgqnbUkfK0CqXRN/pzU0E=;
        b=UUwWtd0ZPEvgIefefJKecRW4Hmxf1dQBx2hDUkJ2WfS1LyUo2jqFya3xXrBDxKa6xF
         QOQUwdTGB98GaKIExwReZIVtSqnTGIozl33a2pOigXfGW5OPy4erYkc8PGW5h97qBnF7
         55ZqiBpvr5KGPTgkr81pn9Lku960oY/7zumSMQt/hdAmob3VIkX+Fe5Gu6cPCR41UXri
         RU+i+/tyMLu9QkcO+kbV6q0FcoOc5LyspJLyXyYXc3zsGuxN080BLDF3N7+KNFyb9p24
         MdHBeeLsxaFnTNZ1x6qK0qtARwSpQ+k0KouKnBinniu+tO2TWvBW5f0nDw9hDe9wb1mC
         T91w==
X-Forwarded-Encrypted: i=1; AJvYcCXo8U+LHjOyGEKNRWjIrDM1zb1cEQYvcZVdGzAhKTDKtrICB1ZSWl+Im4vz9W/kzBEPNOwdl+m2IBRhC58=@vger.kernel.org
X-Gm-Message-State: AOJu0YwM5CT1XjJ1jRnKsiIjkdh/6SddIpl8VCkOJbVS0O7XftLs+9RL
	WjQC9ecShn/RewaOYdBxegRsZfcSbOyeE7pMyTM4CkaJMsGrq26WvW+cY/airiix7uLvexs99L9
	HyqAN4kNDiuyLghWmyQ==
X-Google-Smtp-Source: AGHT+IFDGJLG0QlqDQnT3WtSeQpyn/e6JxnM+cmkts63ncExcI0VOTu4ODfryuTASzY0kSDdxCfdlc9Zebc4m2g=
X-Received: from pjboi14.prod.google.com ([2002:a17:90b:3a0e:b0:2ff:6132:8710])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:ea0c:b0:234:f19a:eead with SMTP id d9443c01a7336-237d991ebf6mr221096795ad.43.1750711811223;
 Mon, 23 Jun 2025 13:50:11 -0700 (PDT)
Date: Mon, 23 Jun 2025 20:49:45 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4465; i=rdbabiera@google.com;
 h=from:subject; bh=v3QvCmL9HP7IokaiL57iE+36eWNE8t2pZpwDIUWeDHA=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBmRe18/0r1gp+K6s+xocHazWdbV+nTXNI049hyDvny1e
 74vty3tKGVhEONgkBVTZNH1zzO4cSV1yxzOGmOYOaxMIEMYuDgFYCJGfgz/g/Zl2p9XaLy0cF+D
 94IqgSrW5ZPOHnXwm7Hi+5ZdF88+c2P47zpz06Q1Jxf7ZX3gke/xux52Wqub/fQEjXsPLzPOVus xZwMA
X-Mailer: git-send-email 2.50.0.rc2.761.g2dc52ea45b-goog
Message-ID: <20250623204947.732915-2-rdbabiera@google.com>
Subject: [PATCH v2] usb: typec: altmodes/displayport: add irq_hpd to sysfs
From: RD Babiera <rdbabiera@google.com>
Cc: heikki.krogerus@linux.intel.com, badhri@google.com, 
	gregkh@linuxfoundation.org, linux-usb@vger.kernel.org, 
	linux-kernel@vger.kernel.org, RD Babiera <rdbabiera@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Add irq_hpd sysfs node to displayport driver. This allows the userspace
to subscribe to irq events similar to how it can subscribe to changes in
hpd.

irq_hpd is read only and returns the number of irq events generated since
driver probe. pending_irq_hpd is added so that a sysfs_emit can be
generated if the HPD high event belonging to the same status message
is delayed until a successful configuration.

Signed-off-by: RD Babiera <rdbabiera@google.com>
Reviewed-by: Badhri Jagan Sridharan <badhri@google.com>
---
Changes since v1:
* fixed bracket styling error
---
 .../testing/sysfs-driver-typec-displayport    | 10 +++++++
 drivers/usb/typec/altmodes/displayport.c      | 28 +++++++++++++++++++
 2 files changed, 38 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-driver-typec-displayport b/Doc=
umentation/ABI/testing/sysfs-driver-typec-displayport
index 256c87c5219a..314acd54e13e 100644
--- a/Documentation/ABI/testing/sysfs-driver-typec-displayport
+++ b/Documentation/ABI/testing/sysfs-driver-typec-displayport
@@ -62,3 +62,13 @@ Description:
 			     by VESA DisplayPort Alt Mode on USB Type-C Standard.
 			- 0 when HPD=E2=80=99s logical state is low (HPD_Low) as defined by
 			     VESA DisplayPort Alt Mode on USB Type-C Standard.
+
+What:		/sys/bus/typec/devices/.../displayport/irq_hpd
+Date:		June 2025
+Contact:	RD Babiera <rdbabiera@google.com>
+Description:
+		IRQ_HPD events are sent over the USB PD protocol in Status Update and
+		Attention messages. IRQ_HPD can only be asserted when HPD is high,
+		and is asserted when an IRQ_HPD has been issued since the last Status
+		Update. This is a read only node that returns the number of IRQ events
+		raised in the driver's lifetime.
diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/a=
ltmodes/displayport.c
index b09b58d7311d..7f9f1f98f450 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -65,6 +65,13 @@ struct dp_altmode {
 	enum dp_state state;
 	bool hpd;
 	bool pending_hpd;
+	u32 irq_hpd_count;
+	/*
+	 * hpd is mandatory for irq_hpd assertion, so irq_hpd also needs its own =
pending flag if
+	 * both hpd and irq_hpd are asserted in the first Status Update before th=
e pin assignment
+	 * is configured.
+	 */
+	bool pending_irq_hpd;
=20
 	struct mutex lock; /* device lock */
 	struct work_struct work;
@@ -151,6 +158,7 @@ static int dp_altmode_status_update(struct dp_altmode *=
dp)
 {
 	bool configured =3D !!DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
 	bool hpd =3D !!(dp->data.status & DP_STATUS_HPD_STATE);
+	bool irq_hpd =3D !!(dp->data.status & DP_STATUS_IRQ_HPD);
 	u8 con =3D DP_STATUS_CONNECTION(dp->data.status);
 	int ret =3D 0;
=20
@@ -170,6 +178,8 @@ static int dp_altmode_status_update(struct dp_altmode *=
dp)
 				dp->hpd =3D hpd;
 				dp->pending_hpd =3D true;
 			}
+			if (dp->hpd && dp->pending_hpd && irq_hpd)
+				dp->pending_irq_hpd =3D true;
 		}
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
@@ -177,6 +187,10 @@ static int dp_altmode_status_update(struct dp_altmode =
*dp)
 						      connector_status_disconnected);
 		dp->hpd =3D hpd;
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
+		if (hpd && irq_hpd) {
+			dp->irq_hpd_count++;
+			sysfs_notify(&dp->alt->dev.kobj, "displayport", "irq_hpd");
+		}
 	}
=20
 	return ret;
@@ -196,6 +210,11 @@ static int dp_altmode_configured(struct dp_altmode *dp=
)
 						connector_status_connected);
 		sysfs_notify(&dp->alt->dev.kobj, "displayport", "hpd");
 		dp->pending_hpd =3D false;
+		if (dp->pending_irq_hpd) {
+			dp->irq_hpd_count++;
+			sysfs_notify(&dp->alt->dev.kobj, "displayport", "irq_hpd");
+			dp->pending_irq_hpd =3D false;
+		}
 	}
=20
 	return dp_altmode_notify(dp);
@@ -707,10 +726,19 @@ static ssize_t hpd_show(struct device *dev, struct de=
vice_attribute *attr, char
 }
 static DEVICE_ATTR_RO(hpd);
=20
+static ssize_t irq_hpd_show(struct device *dev, struct device_attribute *a=
ttr, char *buf)
+{
+	struct dp_altmode *dp =3D dev_get_drvdata(dev);
+
+	return sysfs_emit(buf, "%d\n", dp->irq_hpd_count);
+}
+static DEVICE_ATTR_RO(irq_hpd);
+
 static struct attribute *displayport_attrs[] =3D {
 	&dev_attr_configuration.attr,
 	&dev_attr_pin_assignment.attr,
 	&dev_attr_hpd.attr,
+	&dev_attr_irq_hpd.attr,
 	NULL
 };
=20

base-commit: e04c78d86a9699d136910cfc0bdcf01087e3267e
--=20
2.50.0.rc2.761.g2dc52ea45b-goog

