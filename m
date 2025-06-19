Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0212110
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750291428; cv=none; b=PaTRVP3x2EkBOcXvlVK2Wnnu42SmS0Wrs+kRWU6gXXl0bHe/LFBrb9RwVwMLukCUUOIGiSzfht3sK/m9axhmbSPtd7kNizA50XC8ZnrifVETSO3Kyr4fkvcZiz2ZyQh14HM5rU0dunR+Ml9XcJwfnDi5iE3dGDqMAmtiCGPxtv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750291428; c=relaxed/simple;
	bh=cAf4egJg1fZRvMYN/JjnagzFqq9NvFK4Mge00IJH+Ik=;
	h=Date:Mime-Version:Message-ID:Subject:From:Cc:Content-Type; b=ng/pHFqVDu0UOi42DtifxN2yISy/AnJ5G4/Zbw080bSGrcybfNwgd7KeKgdMFiupXeebQZRBYhtfCHec2J4eo3ZqEf6zTpTMRdq1UDdWEV/rQqAQegLy9rLf0nY0jAum+tQpt1FeNlji7lDRNuTwgWgWzqTGtrGXQndSHMm9uTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BVBOeP0r; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--rdbabiera.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BVBOeP0r"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3141f9ce4e2so230066a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 17:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750291426; x=1750896226; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:from:subject:message-id:mime-version
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2M+SvCzh/vdIrPElotSPe0K1FbeVhTu6K7LIGETQWi0=;
        b=BVBOeP0rwaPwiFiDEs1oT0io34s4ChYWUMj4CnWFNocEefv7m4FljNtr8YORQGzStt
         y9epV6LQ63n8s04oJSWkGS2hn/1ZOXcHPlbwvQRiVEeC7XeJ4iFdqWPX/S0ATujO/Hfk
         bP7j+IBcU0/0HDOM2pfFuO1OCPcdeitfHWdN/Zb5W21XMXZwJQp0k0Wguux5yKJBLUi7
         z0LHaSefATUIRtWDzu9HJDXy9sGw2XbjrCWTxGcYwWgl5STBJMpr8B1kkTOoS3lGJhiN
         q9wZr232AIdjVvqelUUE6W75SSBVMS1pIVH4k1eKWEd53RZjfHyWHkuvKTI7QDdHgO1C
         RT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750291426; x=1750896226;
        h=content-transfer-encoding:cc:from:subject:message-id:mime-version
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2M+SvCzh/vdIrPElotSPe0K1FbeVhTu6K7LIGETQWi0=;
        b=Yj74fTUEhLR/7hZGX8yJCxDIu0h4H8dtANwEYmkgoKPWfO37FaPXKhV0xha2EfbWzB
         CgSzbi1OkgG8hiC9BKEVXO1rR0PyxSe6jIky5g32EHNhm2924i+9cYunnPLBa2d0q7FH
         GhBwi/jdoyGiypzjnLWy9UCHkE6e10hSpzZK+H+P3UVd7vsPDXN6nCi4Rg9Bc9LaXLyO
         GIjv7mYNgjXWnZuvXvZTufRMKVrEFHQKSyET/+RpEMWmiw6pUlu4gTCy8V4ss3YJtqua
         ln1TrZn8ivICh0dDndecPylfpF6gxEDL/eNWuwCvpM0A5z2Cp+0nffCWE5qlKbIAMvvw
         OEpw==
X-Forwarded-Encrypted: i=1; AJvYcCUpKWxQ2oxMhlg7UQWD77mKtKUoLahmAbRvRe4Pi0BbKEyI0K8WwsH/j4YQKB09o6HYAqmC3nm6SwsQE9E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAJ6WlMC3HSKe9zyzW+nPz/Doz8GDHlVaLQhjjIf31GaNhK/i4
	i/tMs6cMZUqJG843C9pQDHwh6TJR1AteQZEFiz7xRjeN/uoIVo0Yzh027MBfRmHUrZL5fKEPc68
	N+0CRFf74wU1eDysJqg==
X-Google-Smtp-Source: AGHT+IFacVF+vsfHMyl3wwxTXDl98slFIDS+L6XdwpEqcbUoyNJGXQ6DDGKrfdPoJYuEJhmHY/3D8q/R82TbOzg=
X-Received: from pjbsx5.prod.google.com ([2002:a17:90b:2cc5:b0:311:9b9e:5384])
 (user=rdbabiera job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3ec5:b0:311:e8cc:4248 with SMTP id 98e67ed59e1d1-313f1e51737mr33158791a91.33.1750291426182;
 Wed, 18 Jun 2025 17:03:46 -0700 (PDT)
Date: Thu, 19 Jun 2025 00:03:40 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Developer-Key: i=rdbabiera@google.com; a=openpgp; fpr=639A331F1A21D691815CE090416E17CA2BBBD5C8
X-Developer-Signature: v=1; a=openpgp-sha256; l=4419; i=rdbabiera@google.com;
 h=from:subject; bh=iB/Jt3U6/lhf4Qzr2FSJv+JKZkR5VyB+VUoMTd7vBrs=;
 b=owGbwMvMwCFW0bfok0KS4TbG02pJDBnBwffPL1nwfJt7x0dDjbUvHCR/yL37NMtwXvyhK6IBr
 B2VCr+edpSyMIhxMMiKKbLo+ucZ3LiSumUOZ40xzBxWJpAhDFycAjCRRVKMDCcX3s40l928MCoz
 QZn9+vddalu/PlzwJM3XWM5zkTqr0GOGfzr3pu+c883rcV5PcOdXdsFYn185zpetq6b9Xc18p/T uCw4A
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250619000343.3299526-2-rdbabiera@google.com>
Subject: [PATCH v1] usb: typec: altmodes/displayport: add irq_hpd to sysfs
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
 .../testing/sysfs-driver-typec-displayport    | 10 +++++++
 drivers/usb/typec/altmodes/displayport.c      | 29 +++++++++++++++++++
 2 files changed, 39 insertions(+)

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
index b09b58d7311d..7a04bb101337 100644
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
@@ -170,6 +178,9 @@ static int dp_altmode_status_update(struct dp_altmode *=
dp)
 				dp->hpd =3D hpd;
 				dp->pending_hpd =3D true;
 			}
+			if (dp->hpd && dp->pending_hpd && irq_hpd) {
+				dp->pending_irq_hpd =3D true;
+			}
 		}
 	} else {
 		drm_connector_oob_hotplug_event(dp->connector_fwnode,
@@ -177,6 +188,10 @@ static int dp_altmode_status_update(struct dp_altmode =
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
@@ -196,6 +211,11 @@ static int dp_altmode_configured(struct dp_altmode *dp=
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
@@ -707,10 +727,19 @@ static ssize_t hpd_show(struct device *dev, struct de=
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
2.50.0.rc2.701.gf1e915cc24-goog

