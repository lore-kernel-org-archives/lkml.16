Received: from mail-il1-f178.google.com (mail-il1-f178.google.com [209.85.166.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E834D222589;
	Tue, 29 Apr 2025 18:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745951311; cv=none; b=cr/Lncky7Su/X7EHMFBzZ6Sfxc1Vcq3t3NndBkz3ZuakKz+QWUrZwEpq4gXyId/oljC4/FY5Gh1PgXU8SJ15Tn3sh8KHJ4FKJRPiv6ZsoPYCamNrEBg8RYcD/eMdQRgGU91z55AsYjCjfCQUVO1Q+Tk+I7jZe/axdjnOvQqDZ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745951311; c=relaxed/simple;
	bh=PgIaFDpM6gIctGO3nRn3fsJUnmH9NfdkRPuJe5WO1eQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=slSq5fAGKdJOsb+9Bc7Zu+UztW9WKUsyxrI5gV61L8wV9pi+RZBqS6wuGenwAzGF+wcWL/cKRqy0pP33Np/YYk6QsgKIRzT1AGv1ptCr8ww/QagVH2RE36jnOv8Nz2X32pPvMfM3OJqlFoiAEzM4ZNVQrlcSs/2NZR9gnx/gJsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=l4KjOFz6; arc=none smtp.client-ip=209.85.166.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4KjOFz6"
Received: by mail-il1-f178.google.com with SMTP id e9e14a558f8ab-3d5e2606a1bso56511145ab.0;
        Tue, 29 Apr 2025 11:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745951309; x=1746556109; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zeL2BwB7u1xEPIRTcq7lIWOhL/ESpWzbO+1v8p05vyI=;
        b=l4KjOFz6h6q2VTgGjE3jh+nOCMBwS6oXvNb+b1F4wMp8VscsQBtYNg058CO2RWf5VS
         oRoWFcaTeg+PBRMl47WJ6dzCvmXJ+BWX+Yola0uyd9aWJ3ZMBAJ3nhhenOCz0LKAkGz7
         3ZZYMlAJAMqvGwoSfkFYy3e0jV0cgs4EzzmQgIJlEQzJYG2KleSJIU24ffVkK0Kn17kz
         k7GqK2+M8ngreX34NQpVbkleI6TPdfJ1hbdAVn9OX0I9NpAS0V3s+ACiWHERbSIaDZxu
         UZHcHQFnpDu1Q907xutGnOWsXopgfILIen67hPjXvn+BMuAiQcziEEiVMHl5kZzOcvU4
         SbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745951309; x=1746556109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zeL2BwB7u1xEPIRTcq7lIWOhL/ESpWzbO+1v8p05vyI=;
        b=oeWiDKuixxy1d3/AQm4KBAJZADeJ6eIDUQxdYIEES5uHaIJoCeCx58ChxkwesmDGWY
         FiUsWEqUf3BAjGRKmS7rCFij3KTB+0y2s75fTdpD0DbbZ3Y5OS7v+kaW9lRNoX7Yq3+z
         ta5kkR6BXDxf11SseBTfdNTiQwlK97QtEPDVZ4pMJeVQtdtH3qbU1CME3N5qVJk0OJDs
         oEWWv5usWRIdvYFBYwXV7Q7O64ZZ6gq3N2HJojSC+huvkQG/nRGibVPaQlci77dWq6i4
         FLHJqqDB94Z3txpbenG5hdB0vpecH50T9tyt+WJ5juMZqabTjizUyfzAXwFhlNEqNfSa
         wgxA==
X-Forwarded-Encrypted: i=1; AJvYcCXGl/KBi9x6uk6I47Lzs6UvDnNORDenYYXCDFKs3QiUcUqfEFDBRppXMr7oadkZi7mP0Tdj1/mutoS0@vger.kernel.org, AJvYcCXi63sJ+05zEjDveo3s7n828NuC1d7Ge6qmhs5K/DPRvHge1WvUqwJAYea5I7bqtR9sVl5e526nN6KtuxY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhulgTDLhZ6YHH/etdv9sLW414KCS1gyYLIQdHPjeYW/mxwh5O
	pbyYa9pZ7U98Fw0grime8TZULC+tBzvwLOTdlVvqljkWiPDVTK6fsGBXSgGSqCg=
X-Gm-Gg: ASbGncvJdDiSGkLGJKaBXwsMdr3Dp3aXNERE9B367YKwB34uRuSD5D3ounYfqYYGjVm
	6GnG9AqaKaqpGbpSnOYR+AF07orwaGJTMTRac/p52D3DIrhYUR3MeItHqGZMEgVIOpsAkiYzFan
	kgQ/EROchq79kUHiobQP1VtR5xQHXBA90s669eh5O1SaoXXSi5lTYXRY6J1c3yH1MAqIs0DLOQK
	s3BS4lpSR2VjOfqEFENMhFc1esTL3hEhgF/R+kbq/qyv9bUk527zmTRrRALmvFC7ic7Rah/F2Qw
	eSpQ2R7fw2R0AtF5wc4ove+b9ylNrh8dPf+c5JKjg+uR1lCMkTR5c2ytUhFmCyK80KI7wMc12rL
	uBBcT9Gy/2SJWWaO3H6PI/8AkUgImFX/Lzg==
X-Google-Smtp-Source: AGHT+IGL5cw8kXd3KsKWcHUzEd3C06ZBcx4+hUMtnqA/7R/lHOQRusIWdyUYA/5LHQhnKEiUWc8XoA==
X-Received: by 2002:a05:6e02:1a8b:b0:3d4:3db1:77ae with SMTP id e9e14a558f8ab-3d96771a1a8mr1999895ab.18.1745951308849;
        Tue, 29 Apr 2025 11:28:28 -0700 (PDT)
Received: from localhost.localdomain (76-224-4-192.lightspeed.clmboh.sbcglobal.net. [76.224.4.192])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3d95f2d8bcdsm4152405ab.36.2025.04.29.11.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 11:28:28 -0700 (PDT)
From: hoff.benjamin.k@gmail.com
To: gregkh@linuxfoundation.org
Cc: m.grzeschik@pengutronix.de,
	jeff.johnson@oss.qualcomm.com,
	david.sands@biamp.com,
	Chris.Wulff@biamp.com,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Ben Hoff <hoff.benjamin.k@gmail.com>
Subject: [PATCH v3] usb: gadget: hid: allow dynamic interval configuration via configfs
Date: Tue, 29 Apr 2025 14:28:09 -0400
Message-ID: <20250429182809.811786-1-hoff.benjamin.k@gmail.com>
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
    The store routine parses into an unsigned int, bounds‐checks,
    assigns to opts->interval, and sets opts->interval_user_set = true.
  • Initialize opts->interval = 4 and opts->interval_user_set = false in
    hidg_alloc_inst(), then copy both into the live f_hidg instance in
    hidg_alloc().
  • In hidg_bind(), set each endpoint’s bInterval based on whether the
  user has written the attribute:
      – If interval_user_set == false, use FS=10 / HS=4
      – If interval_user_set == true, use the user’s value for both FS
        & HS

Signed-off-by: Ben Hoff <hoff.benjamin.k@gmail.com>
---
Changes since v1:
  - Added dedicated interval_show/store helpers
  - Restored original default values (FS=10 ms, HS=4 µ-frame) for both
    IN and OUT when unset.

Changes since v2:
  -  Corrected commit message

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

