Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768CA374D1;
	Tue, 29 Apr 2025 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745933605; cv=none; b=VsnejD9JsvzkDDZoD2MD5f03M+JMgXv6bCACMl+fk8iWyDSbYgQ67ZT04quc3nTWWBbAvILghriQ9x0dcAx5qOxJOiZSj/vzRYvjv+SAkjIhTHgi0phFjq/Ya8L17GlLrRueXJZbanUG4/5Q+EtZwJ9SkFgK5pfM+RgTXwzkZvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745933605; c=relaxed/simple;
	bh=I4fM/o1bJjEGGY39wKCGAi6BcejJkqTUjX3MJmTypsQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ut943KYGfQnQHydkYWNbkpox5BAkqox1CPCmrH7xDZxpS6c6OBsEl//8uRFQnLc8OS53wsS1BMwEcnFs+brnvxtx6zOIgxiiWHJL1jsm7+KidoIhsTQE7YyelO/VtLXCdZE8ZgChMVleNEpKGghIe7tyEv91dRR03gz11KVtftI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+QML0O3; arc=none smtp.client-ip=209.85.166.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+QML0O3"
Received: by mail-io1-f45.google.com with SMTP id ca18e2360f4ac-86135af1045so562575539f.1;
        Tue, 29 Apr 2025 06:33:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745933602; x=1746538402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Df6b5iFE6W5u/roV6WT6hUMpstd2mlknLmR5T2FH1iY=;
        b=P+QML0O3OasK2Z7kJqDUqTXGbJ81Kpe0p7AGOctTjyX3IuMAUI2Wer4iwownNf4Vwb
         AVr0VKziG5r1RhIfLf+0gOauicBEdXvFgao2bWtqS1yE4DXbwrA81+Nsy8mYMiKleG0A
         tCzVkRIpxKGnXE3SGbBs1XoAm6CziiiqrR4q4zaoQ1C0gTMyU4AI83R5/KC+JdD3SwKs
         oK7Tqk7MVDP8ZG6n5NhXeCzDq4KlVqsUGTrQtG1xX+/SAgnyOHGvbUgzK35gvX+8fVmo
         NLzLLYGCqusxu9hyAYfYmqcVMrO05C7ZAx8+m39Mmdlzl7m7SXiKGr1/MvebOWhNwEVG
         kB+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745933602; x=1746538402;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Df6b5iFE6W5u/roV6WT6hUMpstd2mlknLmR5T2FH1iY=;
        b=xLeBKFNujdN+JQjUbY5dkvb/odaiRlBP9H3h9qWW/b3TT88eDBQCm5SdZdF1y8QMva
         m8lnu0Sz2rbxcIadzMUwfpbPcRIFFkpLKkrXaqnzZ2fhiQadIfaeBHiiyTFzdJ3XoKoS
         OkvRK8tx+R2ltHlsJMwYV0hcJa6BUcHfwryvQIuyzAWpERV+sm/+pHubHBhu6WZbe0wv
         gzcrJWhVnK4ssFDfSpbXjd18LAlz9ybzisAGelVt7ZCOevjsBr27pcGOHAImKx/fxyl7
         O1W1GGl2C9y1IjLcQIpmYSBJo7MFwKjKPVIjBTVw85gcHCKrnpQtgF0aJQPGC3uhDeVm
         3T3A==
X-Forwarded-Encrypted: i=1; AJvYcCWEnq9LjAFY050Dj7sWF2HeCpUPFK4tXLVL1qgF4YNyfAyQEva9JKYFSBQKYiRFB+j2NrxJgUDivdu5Pr8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/ZI4xB6/484Xr7cVsulgyJZz1up69f5lHDNMMtxaFLLl/hu6O
	niwtVUkf0xlOLB1p30o2cTnPO+2lAvcuHiIGAV+78x18ZuMUTYZjxNqTI/ccnBQ=
X-Gm-Gg: ASbGncu7XbaELF1/XKLuauZGN3MXlBSAKw70DkArtWmlxLLtrb1WU02/kImxWh5zGXF
	suNUWpwfZNf+XqLO8SntRUB1q8aDZqpCt/HugUgXlKAreK/Hn0XtmXNG9yczq1ctuvk2DWug8SU
	f0UyKYdTlyb+iVBx+NSJROblsH1P+X3VNHdtk+qhxD33X71tSiQGRws2T/gfKpCATA1XFjysYUo
	ZKWc4qKSUTGi5MAEfCF9Ur5LZkiU0RIuJYIp4Xo6XxsWPbjHnX4sRyD3+iVkTPW2h7GNJVWfdDL
	TDATZZ6DNY69jR2/rZCQGlkZPpSSRAQXwqwL+EvjocBskmELoUdeOYbewHR6aPWqRTxSjwg3GE+
	fnLu9MyBdt9f/XuJDJCdFpEYUb+cpbLF7m/1+h0/vTuC9
X-Google-Smtp-Source: AGHT+IGAvIf6TiaMuGR5+zGThvHlOgy2GE1EJpUQ5RCSOJTJ/exL3XN8GCXSeK49Pqktc98Lpcv+uw==
X-Received: by 2002:a92:dd02:0:b0:3d9:64cd:9490 with SMTP id e9e14a558f8ab-3d964cd9699mr7221095ab.16.1745933602102;
        Tue, 29 Apr 2025 06:33:22 -0700 (PDT)
Received: from localhost.localdomain (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f862e82ffesm280645173.36.2025.04.29.06.33.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:33:21 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: linux-usb@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH] usb: gadget: hid: allow dynamic interval configuration via configfs
Date: Tue, 29 Apr 2025 09:33:10 -0400
Message-ID: <20250429133310.353977-1-hoff.benjamin.k@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Ben Hoff <hoff.benjamin.k@gmail.com>

This patch adds support for dynamically configuring the polling interval
(bInterval) for HID function drivers using configfs. This enables
custom HID gadgets with user-specified poll rates without recompilation.

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
 drivers/usb/gadget/function/f_hid.c | 54 ++++++++++++++---------------
 drivers/usb/gadget/function/u_hid.h |  1 +
 2 files changed, 27 insertions(+), 28 deletions(-)

diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 740311c4fa24..8aae22f9d609 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -62,6 +62,7 @@ struct f_hidg {
 	unsigned short			report_desc_length;
 	char				*report_desc;
 	unsigned short			report_length;
+	unsigned char			interval;
 	/*
 	 * use_out_ep - if true, the OUT Endpoint (interrupt out method)
 	 *              will be used to receive reports from the host
@@ -156,10 +157,7 @@ static struct usb_endpoint_descriptor hidg_ss_in_ep_desc = {
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
@@ -177,10 +175,7 @@ static struct usb_endpoint_descriptor hidg_ss_out_ep_desc = {
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
@@ -218,10 +213,7 @@ static struct usb_endpoint_descriptor hidg_hs_in_ep_desc = {
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
@@ -230,10 +222,7 @@ static struct usb_endpoint_descriptor hidg_hs_out_ep_desc = {
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
@@ -259,10 +248,7 @@ static struct usb_endpoint_descriptor hidg_fs_in_ep_desc = {
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
@@ -1202,6 +1188,10 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_hs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_fs_in_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
 	hidg_ss_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
+
+	hidg_fs_in_ep_desc.bInterval = hidg->interval;
+	hidg_hs_in_ep_desc.bInterval = hidg->interval;
+
 	hidg_ss_out_comp_desc.wBytesPerInterval =
 				cpu_to_le16(hidg->report_length);
 	hidg_hs_out_ep_desc.wMaxPacketSize = cpu_to_le16(hidg->report_length);
@@ -1224,19 +1214,21 @@ static int hidg_bind(struct usb_configuration *c, struct usb_function *f)
 	hidg_ss_out_ep_desc.bEndpointAddress =
 		hidg_fs_out_ep_desc.bEndpointAddress;
 
-	if (hidg->use_out_ep)
-		status = usb_assign_descriptors(f,
-			hidg_fs_descriptors_intout,
-			hidg_hs_descriptors_intout,
-			hidg_ss_descriptors_intout,
-			hidg_ss_descriptors_intout);
-	else
+	if (hidg->use_out_ep) {
+		hidg_fs_out_ep_desc.bInterval = hidg->interval;
+		hidg_hs_out_ep_desc.bInterval = hidg->interval;
+		status = usb_assign_descriptors(f,
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
 
@@ -1362,6 +1354,7 @@ F_HID_OPT(subclass, 8, 255);
 F_HID_OPT(protocol, 8, 255);
 F_HID_OPT(no_out_endpoint, 8, 1);
 F_HID_OPT(report_length, 16, 65535);
+F_HID_OPT(interval, 8, 255);
 
 static ssize_t f_hid_opts_report_desc_show(struct config_item *item, char *page)
 {
@@ -1422,6 +1415,7 @@ static struct configfs_attribute *hid_attrs[] = {
 	&f_hid_opts_attr_protocol,
 	&f_hid_opts_attr_no_out_endpoint,
 	&f_hid_opts_attr_report_length,
+	&f_hid_opts_attr_interval,
 	&f_hid_opts_attr_report_desc,
 	&f_hid_opts_attr_dev,
 	NULL,
@@ -1468,6 +1462,9 @@ static struct usb_function_instance *hidg_alloc_inst(void)
 	if (!opts)
 		return ERR_PTR(-ENOMEM);
 	mutex_init(&opts->lock);
+
+	opts->interval = 10;
+
 	opts->func_inst.free_func_inst = hidg_free_inst;
 	ret = &opts->func_inst;
 
@@ -1546,6 +1543,7 @@ static struct usb_function *hidg_alloc(struct usb_function_instance *fi)
 	hidg->bInterfaceProtocol = opts->protocol;
 	hidg->report_length = opts->report_length;
 	hidg->report_desc_length = opts->report_desc_length;
+	hidg->interval = opts->interval;
 	if (opts->report_desc) {
 		hidg->report_desc = kmemdup(opts->report_desc,
 					    opts->report_desc_length,
diff --git a/drivers/usb/gadget/function/u_hid.h b/drivers/usb/gadget/function/u_hid.h
index 84bb70292855..a29dcb14f738 100644
--- a/drivers/usb/gadget/function/u_hid.h
+++ b/drivers/usb/gadget/function/u_hid.h
@@ -25,6 +25,7 @@ struct f_hid_opts {
 	unsigned short			report_desc_length;
 	unsigned char			*report_desc;
 	bool				report_desc_alloc;
+	unsigned char			interval;
 
 	/*
 	 * Protect the data form concurrent access by read/write
-- 
2.49.0

