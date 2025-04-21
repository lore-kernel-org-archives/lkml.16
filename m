Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1601CDFD4
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223630; cv=none; b=Kron7bzIg9rY2y79vY0YOtQiL2+x97tAlE2CKPbaTTDt3RR3brfeZmD0SL3hFtycLWzgOW/97yxVM5H51nZ6+bKBbVCpokBVfb34luHtPRS1pT5jPTzRhYKMoibWvrEXNwxLPqVU5KltRJOhFuuprPHgEf/J3VTFT24rYMCGD6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223630; c=relaxed/simple;
	bh=BP54PvuJU1VeE402pgOF/BnVPOACRE86oaDOc2e5kvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=uav2W/5uEvxN6B0tsnNadtFDzA3IwG6kJ4xF/C1a47znYc4dPjM+xR856aMPDK0n52IRwTvzFpIneSYKTiJws7ed0KK70I5S8sBey+KChDpi/LatQ73JDr49Gz3Gc9jk22VL0sChQ5435JPVUjyIjueTxkV2e2eSXsQ1L0s99Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=f1G2nsC1; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="f1G2nsC1"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-5e5deb6482cso8622222a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:20:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223626; x=1745828426; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+A2XVkaABk6k2gV2bYWae9UXmDaob74U/u+QQ0sSsqE=;
        b=f1G2nsC1oihF/o2CqejuEJnUDwKZlqAIHosuvttsFGYg2Y3NCcqZHGlb9RVoxjBhZv
         6do98DX1KmJ/3hj68Mb0Tm5UcotTnuYiynvGpy3E77xvS/DSPtNVX8c++8MNhgblw+tB
         /30U146LcUyBEcAYAuiZj1Up5DIZduNAx4RT6748oq9OP8P03twMhgnynyfUF3Wnlt26
         qIH2XClYIzagqGTn60pQoYaMgCq6TZ998YSw/vTzSt42JbWyVVwN+ekJI9IhhXkswv0+
         cDVZAKTlo6qoavQTMTiM7zLe5nQfHWgfwDY7B6g/X9mcGLOa6qraCziUyMBDVE1mwKYo
         UY5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223626; x=1745828426;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+A2XVkaABk6k2gV2bYWae9UXmDaob74U/u+QQ0sSsqE=;
        b=GuFG+EGlkQ2ppkHMPNgOBkkVM6FHydtvAfM3qhrOTMUX1tzqbOEe7Z045OEgnp3jLf
         5vVPnKo9txvj11aXNtjv4fhtwEscSuPbLXMLkdv505YpeC5DDmhXD2+ygEFBEmcPQebf
         XqSJEMvSetfoYvnaYON0n5i7PSd5f+iMCaKPcajdCeGof8mcrhKJivj2KtBTQgPf0Ugr
         qOZF7kPsF98BthuJG4DxCtwmQqHL6DSM00NULv42gYgOGlDOQDKjTzJZYljv3m560l0+
         WtjdmuU5JYMiHK+p4uAp0F74jOrvtneswFwQZitJqAXsyp5Bnk89BgZCII7nTFqPnY8h
         H9Cg==
X-Forwarded-Encrypted: i=1; AJvYcCW9TA0/h28SZ10X/OD17bPK+5AF8kQ13qosxqXxrZgvEP+E34h7k1p2DW0EyLNzb+tUe6vtpR8O1kzhvFE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5JauNbMAllbWKvLfjaFSt7fUnu2ueSDES61cHNRKKQH86FUsN
	y/bnri2pnV2xxF/7s6aUhgIdPG7d6BW0MMtlP0VESIeGWZGf3y1c66/MqVcbTFc=
X-Gm-Gg: ASbGncsPt0v1mm+OCblvBkAsSQPYNSmS/5AofivCbSxHDmoC3gA5VCF2oFhQ9ZTL2jj
	6Gw8B5QbS+d7+LID6hjRjZv4KJcOaUy/bJocM7aW8XLn1RvLcGD9NEB2KPUFFdrlKm3QU/FssR7
	tk4O4bvT+/cyNew1pTffGQ2vbtI/z6GKfTIc8Ok2Us75xYUoMlcBQYNXgPZFB6zxXavG/A5znAb
	ppZDg7gNA99RwcUMVcHTJL9+4MQzJZzqzqSl8KPVRkgtJn7YxMmiPvd2nlquQ3Uj/sTMmA9Fesh
	oUeicCdqM45Iqt3px1dgTsO6RbFu92aJNTI=
X-Google-Smtp-Source: AGHT+IG7DwQNOM8/nS3tnvxMTIy0guROVEv0SAKM9SSU92HIJl6hk3tL2HdbhZGR0Tr72dfDZsIpQA==
X-Received: by 2002:a17:907:868b:b0:ac1:dde7:b57f with SMTP id a640c23a62f3a-acb75346dbemr876034066b.23.1745223626357;
        Mon, 21 Apr 2025 01:20:26 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-acb6ec0b1e4sm477393466b.34.2025.04.21.01.20.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:20:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Date: Mon, 21 Apr 2025 10:20:00 +0200
Subject: [PATCH v6 2/2] firmware: ti_sci: Partial-IO support
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-topic-am62-partialio-v6-12-b4-v6-2-3b5cefab1339@baylibre.com>
References: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
In-Reply-To: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6749; i=msp@baylibre.com;
 h=from:subject:message-id; bh=BP54PvuJU1VeE402pgOF/BnVPOACRE86oaDOc2e5kvk=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzW/wf1076oXJumEn+603nbGYXAo7rdOgo35S/8XLCkg
 7N08oaNHaUsDGJcDLJiiiydiaFp/+V3HktetGwzzBxWJpAhDFycAjCRUysY/pl5LTHhLXHzs58x
 b3bGir/7Tq8NvLZr2t2sut3SDietHaYxMszzlX8cGH7e+fK6Z3WPim7G3v8e8eSzacmE4JcMleE
 cCxkA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Add support for Partial-IO poweroff. In Partial-IO pins of a few
hardware units can generate system wakeups while DDR memory is not
powered resulting in a fresh boot of the system. These hardware units in
the SoC are always powered so that some logic can detect pin activity.

If the system supports Partial-IO as described in the fw capabilities, a
sys_off handler is added. This sys_off handler decides if the poweroff
is executed by entering normal poweroff or Partial-IO instead. The
decision is made by checking if wakeup is enabled on all devices that
may wake up the SoC from Partial-IO.

The possible wakeup devices are found by checking which devices
reference a "Partial-IO" system state in the list of wakeup-source
system states. Only devices that are actually enabled by the user will
be considered as an active wakeup source. If none of the wakeup sources
is enabled the system will do a normal poweroff. If at least one wakeup
source is enabled it will instead send a TI_SCI_MSG_PREPARE_SLEEP
message from the sys_off handler. Sending this message will result in an
immediate shutdown of the system. No execution is expected after this
point. The code will wait for 5s and do an emergency_restart afterwards
if Partial-IO wasn't entered at that point.

A short documentation about Partial-IO can be found in section 6.2.4.5
of the TRM at
  https://www.ti.com/lit/pdf/spruiv7

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
 drivers/firmware/ti_sci.c | 127 +++++++++++++++++++++++++++++++++++++++++++++-
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 131 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/ti_sci.c b/drivers/firmware/ti_sci.c
index 09d11e75e14e6a6a82f6d99ab1852c142aeb7e5f..a4b7869134779c58f4ef381a940455dea1f86153 100644
--- a/drivers/firmware/ti_sci.c
+++ b/drivers/firmware/ti_sci.c
@@ -6,6 +6,7 @@
  *	Nishanth Menon
  */
 
+#include "linux/stddef.h"
 #define pr_fmt(fmt) "%s: " fmt, __func__
 
 #include <linux/bitmap.h>
@@ -3742,6 +3743,111 @@ static const struct dev_pm_ops ti_sci_pm_ops = {
 #endif
 };
 
+/*
+ * Enter Partial-IO, which disables everything including DDR with only a small
+ * logic being active for wakeup.
+ */
+static int ti_sci_enter_partial_io(struct ti_sci_info *info)
+{
+	struct ti_sci_msg_req_prepare_sleep *req;
+	struct ti_sci_xfer *xfer;
+	struct device *dev = info->dev;
+	int ret = 0;
+
+	xfer = ti_sci_get_one_xfer(info, TI_SCI_MSG_PREPARE_SLEEP,
+				   TI_SCI_FLAG_REQ_GENERIC_NORESPONSE,
+				   sizeof(*req), sizeof(struct ti_sci_msg_hdr));
+	if (IS_ERR(xfer)) {
+		ret = PTR_ERR(xfer);
+		dev_err(dev, "Message alloc failed(%d)\n", ret);
+		return ret;
+	}
+
+	req = (struct ti_sci_msg_req_prepare_sleep *)xfer->xfer_buf;
+	req->mode = TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO;
+	req->ctx_lo = 0;
+	req->ctx_hi = 0;
+	req->debug_flags = 0;
+
+	dev_info(dev, "Entering Partial-IO because a powered wakeup-enabled device was found.\n");
+
+	ret = ti_sci_do_xfer(info, xfer);
+	if (ret) {
+		dev_err(dev, "Mbox send fail %d\n", ret);
+		goto fail;
+	}
+
+fail:
+	ti_sci_put_one_xfer(&info->minfo, xfer);
+
+	return ret;
+}
+
+/*
+ * Iterate all device nodes that have a wakeup-source property and check if one
+ * of the possible phandles points to a Partial-IO system state. If it
+ * does resolve the device node to an actual device and check if wakeup is
+ * enabled.
+ */
+static bool ti_sci_partial_io_wakeup_enabled(struct ti_sci_info *info)
+{
+	struct device_node *wakeup_node = NULL;
+
+	for_each_node_with_property(wakeup_node, "wakeup-source") {
+		struct of_phandle_iterator it;
+		int err;
+
+		of_for_each_phandle(&it, err, wakeup_node, "wakeup-source", NULL, 0) {
+			struct platform_device *pdev;
+			bool may_wakeup;
+
+			if (of_property_match_string(it.node, "idle-state-name", "Partial-IO"))
+				continue;
+
+			pdev = of_find_device_by_node(wakeup_node);
+			if (!pdev)
+				continue;
+
+			may_wakeup = device_may_wakeup(&pdev->dev);
+			put_device(&pdev->dev);
+
+			if (may_wakeup) {
+				dev_dbg(info->dev, "%pOF identified as wakeup source for Partial-IO\n",
+					wakeup_node);
+				of_node_put(it.node);
+				of_node_put(wakeup_node);
+				return true;
+			}
+		}
+	}
+
+	return false;
+}
+
+static int ti_sci_sys_off_handler(struct sys_off_data *data)
+{
+	struct ti_sci_info *info = data->cb_data;
+	bool enter_partial_io = ti_sci_partial_io_wakeup_enabled(info);
+	int ret;
+
+	if (!enter_partial_io)
+		return NOTIFY_DONE;
+
+	ret = ti_sci_enter_partial_io(info);
+
+	if (ret) {
+		dev_err(info->dev,
+			"Failed to enter Partial-IO %pe, trying to do an emergency restart\n",
+			ERR_PTR(ret));
+		emergency_restart();
+	}
+
+	mdelay(5000);
+	emergency_restart();
+
+	return NOTIFY_DONE;
+}
+
 /* Description for K2G */
 static const struct ti_sci_desc ti_sci_pmmc_k2g_desc = {
 	.default_host_id = 2,
@@ -3885,6 +3991,19 @@ static int ti_sci_probe(struct platform_device *pdev)
 		goto out;
 	}
 
+	if (info->fw_caps & MSG_FLAG_CAPS_LPM_PARTIAL_IO) {
+		ret = devm_register_sys_off_handler(dev,
+						    SYS_OFF_MODE_POWER_OFF,
+						    SYS_OFF_PRIO_FIRMWARE,
+						    ti_sci_sys_off_handler,
+						    info);
+		if (ret) {
+			dev_err(dev, "Failed to register sys_off_handler %pe\n",
+				ERR_PTR(ret));
+			goto out;
+		}
+	}
+
 	dev_info(dev, "ABI: %d.%d (firmware rev 0x%04x '%s')\n",
 		 info->handle.version.abi_major, info->handle.version.abi_minor,
 		 info->handle.version.firmware_revision,
@@ -3894,7 +4013,13 @@ static int ti_sci_probe(struct platform_device *pdev)
 	list_add_tail(&info->node, &ti_sci_list);
 	mutex_unlock(&ti_sci_list_mutex);
 
-	return of_platform_populate(dev->of_node, NULL, NULL, dev);
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		dev_err(dev, "platform_populate failed %pe\n", ERR_PTR(ret));
+		goto out;
+	}
+	return 0;
+
 out:
 	if (!IS_ERR(info->chan_tx))
 		mbox_free_channel(info->chan_tx);
diff --git a/drivers/firmware/ti_sci.h b/drivers/firmware/ti_sci.h
index 053387d7baa064498e6a208daa7f70040ef87281..dec9e20cbe5da8f6d9393d56bb9a1e73cb083a42 100644
--- a/drivers/firmware/ti_sci.h
+++ b/drivers/firmware/ti_sci.h
@@ -592,6 +592,11 @@ struct ti_sci_msg_resp_get_clock_freq {
 struct ti_sci_msg_req_prepare_sleep {
 	struct ti_sci_msg_hdr	hdr;
 
+/*
+ * When sending perpare_sleep with MODE_PARTIAL_IO no response will be sent,
+ * no further steps are required.
+ */
+#define TISCI_MSG_VALUE_SLEEP_MODE_PARTIAL_IO				0x03
 #define TISCI_MSG_VALUE_SLEEP_MODE_DM_MANAGED				0xfd
 	u8			mode;
 	u32			ctx_lo;

-- 
2.49.0

