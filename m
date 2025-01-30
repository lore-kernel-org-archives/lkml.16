Received: from exchange.fintech.ru (exchange.fintech.ru [195.54.195.159])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E1520328
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 10:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.54.195.159
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738232431; cv=none; b=clyDKnn1zTrUrzSwifggNGIGyuLl3/ldlsiUMfYsKeOhysdlAH9lBNahFlCNYMiaxgZUErR507UZpt68ytzzAOipSR82/DzBqORA+GlpJibDU4L7MyaImmT+uqaLtOfdTTFfCQATvAu4Lo5fOkUIiRr1RFDGHBdLvGbkBa4x4qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738232431; c=relaxed/simple;
	bh=/Q//3YDpTj6b0GFe3MiWrtEA6Oe/J9oX4I2pg998Ito=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J6dF5odEXpGLG6ShPoQQ7fD5MBSNhsLdNMQf1HqhgY6lxEzpcuJvVPzUa6UFzl/iEarQXAMB97QQFwBIOsc/gvzTfIilkx5zsInCplE4Ge6m4z/nNxzxPinUf/49lX2V0Q5Zk+7LPGCeWpr8lnWjr0MIdWSNWhYtJEfQqwODHn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru; spf=pass smtp.mailfrom=fintech.ru; arc=none smtp.client-ip=195.54.195.159
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fintech.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fintech.ru
Received: from Ex16-01.fintech.ru (10.0.10.18) by exchange.fintech.ru
 (195.54.195.169) with Microsoft SMTP Server (TLS) id 14.3.498.0; Thu, 30 Jan
 2025 13:20:16 +0300
Received: from localhost (10.0.253.138) by Ex16-01.fintech.ru (10.0.10.18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2242.4; Thu, 30 Jan
 2025 13:20:16 +0300
From: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
To: syzbot <syzbot+c52569baf0c843f35495@syzkaller.appspotmail.com>
CC: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
	<syzkaller-bugs@googlegroups.com>, <linux-kernel@vger.kernel.org>
Subject: Re: [syzbot] [usb?] UBSAN: array-index-out-of-bounds in usbhid_parse
Date: Thu, 30 Jan 2025 02:20:12 -0800
Message-ID: <20250130102012.640564-1-n.zhandarovich@fintech.ru>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <000000000000d330500607d85a5f@google.com>
References:
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: Ex16-02.fintech.ru (10.0.10.19) To Ex16-01.fintech.ru
 (10.0.10.18)

Test to see that changes made to hid_descriptor are fine.

#syz test https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
---
 drivers/hid/usbhid/hid-core.c       |  2 +-
 drivers/usb/gadget/function/f_fs.c  |  3 ++-
 drivers/usb/gadget/function/f_hid.c | 22 ++++++++++++++--------
 include/linux/hid.h                 |  2 +-
 4 files changed, 18 insertions(+), 11 deletions(-)

diff --git a/drivers/hid/usbhid/hid-core.c b/drivers/hid/usbhid/hid-core.c
index a6eb6fe6130d..eb4807785d6d 100644
--- a/drivers/hid/usbhid/hid-core.c
+++ b/drivers/hid/usbhid/hid-core.c
@@ -1010,7 +1010,7 @@ static int usbhid_parse(struct hid_device *hid)
 		return -ENODEV;
 	}
 
-	if (hdesc->bLength < sizeof(struct hid_descriptor)) {
+	if (hdesc->bLength < struct_size(hdesc, desc, hdesc->bNumDescriptors)) {
 		dbg_hid("hid descriptor is too short\n");
 		return -EINVAL;
 	}
diff --git a/drivers/usb/gadget/function/f_fs.c b/drivers/usb/gadget/function/f_fs.c
index 2dea9e42a0f8..a4b6d7cbf56d 100644
--- a/drivers/usb/gadget/function/f_fs.c
+++ b/drivers/usb/gadget/function/f_fs.c
@@ -2550,7 +2550,8 @@ static int __must_check ffs_do_single_desc(char *data, unsigned len,
 	case USB_TYPE_CLASS | 0x01:
 		if (*current_class == USB_INTERFACE_CLASS_HID) {
 			pr_vdebug("hid descriptor\n");
-			if (length != sizeof(struct hid_descriptor))
+			if (length < sizeof(struct hid_descriptor) +
+				     sizeof(struct hid_class_descriptor))
 				goto inv_length;
 			break;
 		} else if (*current_class == USB_INTERFACE_CLASS_CCID) {
diff --git a/drivers/usb/gadget/function/f_hid.c b/drivers/usb/gadget/function/f_hid.c
index 740311c4fa24..ec8c2e2d6812 100644
--- a/drivers/usb/gadget/function/f_hid.c
+++ b/drivers/usb/gadget/function/f_hid.c
@@ -139,13 +139,17 @@ static struct usb_interface_descriptor hidg_interface_desc = {
 };
 
 static struct hid_descriptor hidg_desc = {
-	.bLength			= sizeof hidg_desc,
+	.bLength			= struct_size(&hidg_desc, desc, 1),
 	.bDescriptorType		= HID_DT_HID,
 	.bcdHID				= cpu_to_le16(0x0101),
 	.bCountryCode			= 0x00,
 	.bNumDescriptors		= 0x1,
-	/*.desc[0].bDescriptorType	= DYNAMIC */
-	/*.desc[0].wDescriptorLenght	= DYNAMIC */
+	.desc				= {
+		{
+			.bDescriptorType	= 0, /* DYNAMIC */
+			.wDescriptorLength	= 0, /* DYNAMIC */
+		}
+	}
 };
 
 /* Super-Speed Support */
@@ -936,16 +940,18 @@ static int hidg_setup(struct usb_function *f,
 		switch (value >> 8) {
 		case HID_DT_HID:
 		{
-			struct hid_descriptor hidg_desc_copy = hidg_desc;
+			DEFINE_FLEX(struct hid_descriptor, hidg_desc_copy,
+				desc, bNumDescriptors, 1);
+			*hidg_desc_copy = hidg_desc;
 
 			VDBG(cdev, "USB_REQ_GET_DESCRIPTOR: HID\n");
-			hidg_desc_copy.desc[0].bDescriptorType = HID_DT_REPORT;
-			hidg_desc_copy.desc[0].wDescriptorLength =
+			hidg_desc_copy->desc[0].bDescriptorType = HID_DT_REPORT;
+			hidg_desc_copy->desc[0].wDescriptorLength =
 				cpu_to_le16(hidg->report_desc_length);
 
 			length = min_t(unsigned short, length,
-						   hidg_desc_copy.bLength);
-			memcpy(req->buf, &hidg_desc_copy, length);
+						   hidg_desc_copy->bLength);
+			memcpy(req->buf, hidg_desc_copy, length);
 			goto respond;
 			break;
 		}
diff --git a/include/linux/hid.h b/include/linux/hid.h
index cdc0dc13c87f..85a58ae2c4a0 100644
--- a/include/linux/hid.h
+++ b/include/linux/hid.h
@@ -739,7 +739,7 @@ struct hid_descriptor {
 	__u8  bCountryCode;
 	__u8  bNumDescriptors;
 
-	struct hid_class_descriptor desc[1];
+	struct hid_class_descriptor desc[] __counted_by(bNumDescriptors);
 } __attribute__ ((packed));
 
 #define HID_DEVICE(b, g, ven, prod)					\
