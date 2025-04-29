Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954E7221D92;
	Tue, 29 Apr 2025 18:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745949701; cv=none; b=R8SCt/RlhVWn+/qOIcaFNkF68qn1oP1WiIiaheutGYJCZV5HbJxwrnnxuCC++GSm618E5203qnd1zx+O1Xd8TN51O6G5hbIeKHNPwPCmNlghTqekDzLTHWLeLraiqqhkKLp34ddwVt7/yaSy5oIFOhfXHWWb05CHR0lNm/t6hdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745949701; c=relaxed/simple;
	bh=LvGbPxbkEdeIhdvI0IxwGmVX6/bmJJKvXczq0MNwfqM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ZtiQbI9qGF2dCogv1absiveBBx4Bsk8Ye8BEjzI+ppWqJPz70kILChIeV3sID8TEmnZWPMr0YSOmf/Tdh1QycJJDksKdC8V6mPf8b3TvqFTNB0ayixDmZhI/QU1p1AadP/Y/weyEVW6UMRQySYysX1iRxvBGLhO7mlLPMhHWUXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S8cJrKej; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S8cJrKej"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3085f827538so8674801a91.0;
        Tue, 29 Apr 2025 11:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745949699; x=1746554499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=TinNNXsX1Ic8PBw6JUphr0k80Is0w232Du3jOOtgo5w=;
        b=S8cJrKej8S9APXG5vnP49c0xYrCwxjZy1euUY4h03I4NsdEv5aOZqY/MJhewYmOm68
         mfN/w9uujoQdQTuBd2gOqQ3/fh0o/qua5uFqX9AOWo8l7593R675R54RJTcjWHSBYchh
         sf5QgRKdyeBRAy3K9vtPTAPSWLCViQI5z3y6w65nPRRoXzaRgHKfrk7JOjvSk2GwV2T6
         6HBm+GsRXW1nRKVdhZGOEnC5gdR5Lfyl7QSheUO3zIKlhxhnNtFSlCPUeq30wiQj1HoF
         BhwDHJ5yT6CS0hHl3/dh9HHjWvsis3UmWw0ul5KnF4owni5o1l+DVwZB+a+AgZVtCZXV
         1d6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745949699; x=1746554499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TinNNXsX1Ic8PBw6JUphr0k80Is0w232Du3jOOtgo5w=;
        b=UXyKUDlx2bpb3IPS68Mg3c6NfvUqUZLBYSBIc662dB9B3cmpuNwfDyCvg7J+AKGhi4
         w+HJ3X7zt3G4V65KBxAk9DkKapjIb7mrgz3LkejPwQtWylUdP/Y6L9MxClNs/c+JGs9l
         qV0LSnYOdVTH8Eb6SM9woBfJ6mq8PW1Ah+zLhFYkMNI8+D8vK9sRDCwM1YR0QDwU6pO5
         /N9xEK/36yzv8LmdmIK/S+FLT+lBjw9Squ+vz8WCDAiiK82HY3aBXQngP3iyxu/jIsMw
         qX70cv5w0TN7jjpPOgX6it0ypKV616xcyU+TESo3P+Lo8pSsrmSVPfBzmdc2xYjEAM3v
         SMBg==
X-Forwarded-Encrypted: i=1; AJvYcCWRZJAgqwzJEz3nkrOgI6Xh6nAzPalS04BVIGdf6SNhmqFRieIDO6ihTw6BwOHRy8Qv+2qgxFG64g+jWQY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4FGoZd0b5zNEzcy2UI3jP70MyWuDvgNBXp8TRsDpmvePED63o
	xQEY3d9eWD76TNCfSC2Ym6TE+hoyttHZntonjyPluwESPS040pv24iXCZ2ZPIOA=
X-Gm-Gg: ASbGncuKXoNgNXDCe4R6SkLtxNv4HH2HwpOrIwod7KwenbVhv1gaWN//pnyOe/OtdWB
	HFc8U3f21ZywOtGR647Ju3xNfq8pyC7FgDmhN0KDbCinzBbo+MPTA5e/7t0COVhZzR88HVHR1RZ
	fPTPOXQrlHULq8eGSGBh81zfmrjBuheQeVdgFT2QktdcN1dycFsCk3kOAqsDV7NopIQUtqlgBOJ
	BfRhEUlvYs0NmyJ6sp2iCfJjUQlkjAiZg+Yhsb69TXBlAgTZHz/A20vN2eD492NyC1JG9Ci6e3G
	ZRoG2BSEBoYgSWcfqsurxWRxE2rLmBXViR/c4KY8ceAaIpg6RsUVJnVD483qJSDlbcrMvgjgTz6
	wjlJTT1+mVyJlgCLrgRnHssk1IxsNQLJ1Zw==
X-Google-Smtp-Source: AGHT+IEnOZCQYR0ek/0QFNfkR8sLZ8n9evSLtXGdtx0jR/9uqgUPMkzbLSeDtEFnpGL9Mw2xx+32AA==
X-Received: by 2002:a17:90b:2752:b0:305:2d68:8d57 with SMTP id 98e67ed59e1d1-30a332dccb7mr120732a91.5.1745949698523;
        Tue, 29 Apr 2025 11:01:38 -0700 (PDT)
Received: from localhost.localdomain (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f862e82fa2sm398872173.35.2025.04.29.11.01.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:01:38 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v2] usb: gadget: hid: allow dynamic interval configuration via configfs
Date: Tue, 29 Apr 2025 14:01:28 -0400
Message-ID: <20250429180128.806780-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ben Hoff <hoff.benjamin.k@gmail.com>

This patch enhances the HID gadget driver to support dynamic configuration
of the interrupt polling interval (bInterval) via configfs.  A new
‘interval’ attribute is exposed under each HID function’s configfs
directory, and any write to it will adjust the poll rate for all endpoints
without requiring a rebuild.

When the attribute has never been written, legacy defaults are preserved:
  • Full-Speed (FS) endpoints (IN & OUT) poll every 10 ms
  • High-Speed (HS) endpoints (IN & OUT) poll every 4 micro-frames
    (~1 ms)

To implement this cleanly:
  • Add two new fields to f_hid_opts and f_hidg:
      – unsigned char interval
      – bool           interval_user_set
  • Introduce dedicated f_hid_opts_interval_show/store functions.
    The store routine parses into an unsigned int, bounds‐checks against
    UCHAR_MAX, assigns to opts->interval, and sets
    opts->interval_user_set = true.
  • Remove the string-compare hack from the generic F_HID_OPT macro.
  • Initialize opts->interval = 4 and opts->interval_user_set = false in
    hidg_alloc_inst(), then copy both into the live f_hidg instance in
    hidg_alloc().
  • In hidg_bind(), set each endpoint’s bInterval based on whether the
  user has written the attribute:
      – If interval_user_set == false, use FS=10 / HS=4
      – If interval_user_set == true, use the user’s value for both FS
        & HS
  • Add <limits.h> to support UCHAR_MAX in the store helper.

Changes since v1:
  - Added dedicated interval_show/store helpers instead of macro hack.
  - Restored original default values (FS=10 ms, HS=4 µ-frame) for both
    IN and OUT when unset.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 119 ++++++++++++++++++++--------
 drivers/usb/gadget/function/u_hid.h |   2 +
 2 files changed, 90 insertions(+), 31 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 740311c4fa24..3c4212929812 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -62,6 +62,9 @@ struct f_hidg {
 	unsigned short			report_desc_length;
 	char				*report_desc;
 	unsigned short			report_length;
+	unsigned char			interval;
+	bool				interval_user_set;
+
 	/*
 	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
 	 *              will be used to receive reports from the host
@@ -156,10 +159,7 @@ static struct usb_endpoint_descriptor hidg_ss_in_ep_desc = {
 	.bEndpointAddress	= USB_DIR_IN,
 	.bmAttributes		= USB_ENDPOINT_XFER_INT,
 	/*.wMaxPacketSize	= DYNAMIC */
-	.bInterval		= 4, /* FIXME: Add this field in the
-				      * HID gadget configuration?
-				      * (struct hidg_func_descriptor)
-				      */
+	/*.bInterval		= DYNAMIC */
 };
 
 static struct usb_ss_ep_comp_descriptor hidg_ss_in_comp_desc = {
@@ -177,10 +177,7 @@ static struct usb_endpoint_descriptor hidg_ss_out_ep_desc = {
 	.bEndpointAddress	= USB_DIR_OUT,
 	.bmAttributes		= USB_ENDPOINT_XFER_INT,
 	/*.wMaxPacketSize	= DYNAMIC */
-	.bInterval		= 4, /* FIXME: Add this field in the
-				      * HID gadget configuration?
-				      * (struct hidg_func_descriptor)
-				      */
+	/*.bInterval		= DYNAMIC */
 };
 
 static struct usb_ss_ep_comp_descriptor hidg_ss_out_comp_desc = {
@@ -218,10 +215,7 @@ static struct usb_endpoint_descriptor hidg_hs_in_ep_desc = {
 	.bEndpointAddress	= USB_DIR_IN,
 	.bmAttributes		= USB_ENDPOINT_XFER_INT,
 	/*.wMaxPacketSize	= DYNAMIC */
-	.bInterval		= 4, /* FIXME: Add this field in the
-				      * HID gadget configuration?
-				      * (struct hidg_func_descriptor)
-				      */
+	/* .bInterval		= DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor hidg_hs_out_ep_desc = {
@@ -230,10 +224,7 @@ static struct usb_endpoint_descriptor hidg_hs_out_ep_desc = {
 	.bEndpointAddress	= USB_DIR_OUT,
 	.bmAttributes		= USB_ENDPOINT_XFER_INT,
 	/*.wMaxPacketSize	= DYNAMIC */
-	.bInterval		= 4, /* FIXME: Add this field in the
-				      * HID gadget configuration?
-				      * (struct hidg_func_descriptor)
-				      */
+	/*.bInterval		= DYNAMIC */
 };
 
 static struct usb_descriptor_header *hidg_hs_descriptors_intout[] = {
@@ -259,10 +250,7 @@ static struct usb_endpoint_descriptor hidg_fs_in_ep_desc = {
 	.bEndpointAddress	= USB_DIR_IN,
 	.bmAttributes		= USB_ENDPOINT_XFER_INT,
 	/*.wMaxPacketSize	= DYNAMIC */
-	.bInterval		= 10, /* FIXME: Add this field in the
-				       * HID gadget configuration?
-				       * (struct hidg_func_descriptor)
-				       */
+	/*.bInterval		= DYNAMIC */
 };
 
 static struct usb_endpoint_descriptor hidg_fs_out_ep_desc = {
@@ -271,10 +259,7 @@ static struct usb_endpoint_descriptor hidg_fs_out_ep_desc = {
 	.bEndpointAddress	= USB_DIR_OUT,
 	.bmAttributes		= USB_ENDPOINT_XFER_INT,
 	/*.wMaxPacketSize	= DYNAMIC */
-	.bInterval		= 10, /* FIXME: Add this field in the
-				       * HID gadget configuration?
-				       * (struct hidg_func_descriptor)
-				       */
+	/*.bInterval		= DYNAMIC */
 };
 
 static struct usb_descriptor_header *hidg_fs_descriptors_intout[] = {
@@ -1202,6 +1187,16 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_hs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
+
+	/* IN endpoints: FS default=10ms, HS default=4µ-frame; user override if set */
+	if (!hidg->interval_user_set) {
+		hidg_fs_in_ep_desc.bInterval = 10;
+		hidg_hs_in_ep_desc.bInterval = 4;
+	} else {
+		hidg_fs_in_ep_desc.bInterval = hidg->interval;
+		hidg_hs_in_ep_desc.bInterval = hidg->interval;
+	}
+
 	hidg_ss_out_comp_desc.wBytesPerInterval =
 				cpu_to_le16(hidg->report_length);
 	hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
@@ -1224,19 +1219,27 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_ss_out_ep_desc.bEndpointAddress =
 		hidg_fs_out_ep_desc.bEndpointAddress;
 
-	if (hidg->use_out_ep)
+	if (hidg->use_out_ep) {
+		/* OUT endpoints: same defaults (FS=10, HS=4) unless user set */
+		if (!hidg->interval_user_set) {
+			hidg_fs_out_ep_desc.bInterval = 10;
+			hidg_hs_out_ep_desc.bInterval = 4;
+		} else {
+			hidg_fs_out_ep_desc.bInterval = hidg->interval;
+			hidg_hs_out_ep_desc.bInterval = hidg->interval;
+		}
 		status = usb_assign_descriptors(f,
-			hidg_fs_descriptors_intout,
-			hidg_hs_descriptors_intout,
-			hidg_ss_descriptors_intout,
-			hidg_ss_descriptors_intout);
-	else
+			    hidg_fs_descriptors_intout,
+			    hidg_hs_descriptors_intout,
+			    hidg_ss_descriptors_intout,
+			    hidg_ss_descriptors_intout);
+	} else {
 		status = usb_assign_descriptors(f,
 			hidg_fs_descriptors_ssreport,
 			hidg_hs_descriptors_ssreport,
 			hidg_ss_descriptors_ssreport,
 			hidg_ss_descriptors_ssreport);
-
+	}
 	if (status)
 		goto fail;
 
@@ -1408,6 +1411,53 @@ static ssize_t f_hid_opts_report_desc_store(struct config_item *item,
 
 CONFIGFS_ATTR(f_hid_opts_, report_desc);
 
+static ssize_t f_hid_opts_interval_show(struct config_item *item, char *page)
+{
+	struct f_hid_opts *opts = to_f_hid_opts(item);
+	int result;
+
+	mutex_lock(&opts->lock);
+	result = sprintf(page, "%d\n", opts->interval);
+	mutex_unlock(&opts->lock);
+
+	return result;
+}
+
+static ssize_t f_hid_opts_interval_store(struct config_item *item,
+		const char *page, size_t len)
+{
+	struct f_hid_opts *opts = to_f_hid_opts(item);
+	int ret;
+	unsigned int tmp;
+
+	mutex_lock(&opts->lock);
+	if (opts->refcnt) {
+		ret = -EBUSY;
+		goto end;
+	}
+
+	/* parse into a wider type first */
+	ret = kstrtouint(page, 0, &tmp);
+	if (ret)
+		goto end;
+
+	/* range-check against unsigned char max */
+	if (tmp > 255) {
+		ret = -EINVAL;
+		goto end;
+	}
+
+	opts->interval = (unsigned char)tmp;
+	opts->interval_user_set = true;
+	ret = len;
+
+end:
+	mutex_unlock(&opts->lock);
+	return ret;
+}
+
+CONFIGFS_ATTR(f_hid_opts_, interval);
+
 static ssize_t f_hid_opts_dev_show(struct config_item *item, char *page)
 {
 	struct f_hid_opts *opts = to_f_hid_opts(item);
@@ -1422,6 +1472,7 @@ static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_protocol,
 	&f_hid_opts_attr_no_out_endpoint,
 	&f_hid_opts_attr_report_length,
+	&f_hid_opts_attr_interval,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
 	NULL,
@@ -1468,6 +1519,10 @@ static struct usb_function_instance *hidg_alloc_inst(void)
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
 	mutex_init(&opts->lock);
+
+	opts->interval = 4;
+	opts->interval_user_set = false;
+
 	opts->func_inst.free_func_inst = hidg_free_inst;
 	ret = &opts->func_inst;
 
@@ -1546,6 +1601,8 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->bInterfaceProtocol = opts->protocol;
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
+	hidg->interval = opts->interval;
+	hidg->interval_user_set = opts->interval_user_set;
 	if (opts->report_desc) {
 		hidg->report_desc = kmemdup(opts->report_desc,
 					    opts->report_desc_length,
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index 84bb70292855..a9ed9720caee 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -25,6 +25,8 @@ struct f_hid_opts {
 	unsigned short			report_desc_length;
 	unsigned char			*report_desc;
 	bool				report_desc_alloc;
+	unsigned char			interval;
+	bool				interval_user_set;
 
 	/*
 	 * Protect the data form concurrent access by read/write
-- 
2.49.0

