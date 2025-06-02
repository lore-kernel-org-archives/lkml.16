Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20F59223DE5
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 16:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748880062; cv=none; b=KmPerefb9PTzMk4DcwwF/lfFVbqhqhqTdMaTxxqfAMq1HAN2oCSLpcU2xmpuo20RrkOgyfPw09C2k4EDDSDqdpDiQnqRiOoLf2MBihlwYx3oeG4tlWY7VR4E7ha8aJ2aJEd1AJJ6keXvjzY/Suz1xabQKRggDQ1oVO23V++sfK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748880062; c=relaxed/simple;
	bh=Atsb3FmDCMYLaGRCKeUvKOfj13/6auRUtd+/QwpENto=;
	h=MIME-Version:from:Date:Message-ID:Subject:To:Content-Type; b=JlNWwjiLUozu38ZWI04W7Tw3hT6OVLfk/XCTRQkc9C88m7RqZOYciM/s8K2VkhPYJfIUmuEX/W4KTwKki/Ty7wuiiBJ+t5WaR87ft2Izc87Timi1wfVdGqa+xUoFA1KRnEHOgfqDNvWURlSsbdaSfRPH3rrxSPviSaoggrjL3S0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems; spf=pass smtp.mailfrom=starlabs.systems; dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b=ykcXUk/Z; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=starlabs.systems
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=starlabs-systems.20230601.gappssmtp.com header.i=@starlabs-systems.20230601.gappssmtp.com header.b="ykcXUk/Z"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-6049431b409so8250216a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 09:00:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=starlabs-systems.20230601.gappssmtp.com; s=20230601; t=1748880056; x=1749484856; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V3AQt7okVGS+iN5CFDDze0bbnpT/tdNa33E8gOwjuNI=;
        b=ykcXUk/ZkjL6IPZYLm5qPzlwZvuaqZyHsXTqBEbp7M77jZQzjNnkSyPbs8CeRGs9jP
         l99CIi/WITDtiBTHYF+LG5eOJSNOfPXAfz6bLnUVj4oG+hOF0xltSo1yFZRIHz/JTGlp
         c3cV+oV1qu9fEoLZTD7RL95+HO0SpB+Yr4PAkwOk9pJVT7davZwAS+XvQbWJKsO2M9Ya
         UWBt1BG3ZIFobgiA4yDTFMqV2PGcLl80E5TiTOHfopdKXOQY/x82qomKIaMBCbB3kJHX
         kDEtuon9bFKfupFbOsnuQXc++LMRVeQk6/YQxoJpAYJWf40lMclQ0D54dDQn5xibh9QF
         c33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748880056; x=1749484856;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V3AQt7okVGS+iN5CFDDze0bbnpT/tdNa33E8gOwjuNI=;
        b=SuEl+MM9X7256Y+7+1DwtNRKuymFTm54ISP8CdT6PkhQvuZ2Cte67CkQw8Jwsbu5V+
         C6CCV2uKXyEcbgxyq1+xmQwB+7KA8EFV4mVMsVKJMJnfcqPc3+5kReXEbTj4/ayzGx/O
         kgjeeN3AEXTrDbs5flIh/mzUqsWJ0xg32+4F/P6IWwnidJwEhrYeTo3zj6S490ebSCFq
         gilIinOysvRMhmgT0KdyyHV+8q+p2fOjL2tGr5vNWtwyQHxJi8hf75zWKdnkdeLcfF0s
         J0nFAdtWhtnR4ufcZsZIDFHMhVP9Ptm5WCKuVk9ZKnC+w9sGx+8sCDiCw0ivTUGQsGY3
         ueHw==
X-Gm-Message-State: AOJu0Yyav5g0ZmO3mSFK8Pjur7H+UsxmC2ZUbeZIG/FxZ8KvhQyA5kvz
	pqzD2qa4R9MoKY1ZEnfPhXjaF/yWxQNNpCRr3cnoKRvFZBs0FwK53mqx0eFtBp7uwFA+oboy8Ws
	utymNnvg3IZrunPibDpQ4andjavy/9CVYYdox02FTqx8PLjx78CA=
X-Gm-Gg: ASbGncuRmKSvJEgMuVJYymO7WXVX7ULx0Ht1VnZBTG95G4I9jf3usJCamCZFNGmWrxd
	7LUuNv4fnpbE0AjxX3f5Hkp1a+vE1NsRpSqNoV1I9cMa6YsdTGxusmniNnMIG8gwVqIrBgNc17E
	qXgJVWtZAoynDQRzDNgfIFLqhMDFAd+dKRmg==
X-Google-Smtp-Source: AGHT+IFhhUBOW4ICPhC/1ks7zI5Z89r8bTcgiPhYVkSZ7KegonmC5m9AzyPmkPaRj5yRj5PefpDWeNbL1bIMEX+qfX8=
X-Received: by 2002:a17:907:3c8b:b0:ad2:4d69:6da5 with SMTP id
 a640c23a62f3a-adb495d7f62mr861107266b.57.1748880052569; Mon, 02 Jun 2025
 09:00:52 -0700 (PDT)
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Jun 2025 09:00:51 -0700
Received: from 239600423368 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 2 Jun 2025 09:00:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
from: Sean Rhodes <sean@starlabs.systems>
Date: Mon, 2 Jun 2025 09:00:51 -0700
X-Gm-Features: AX0GCFuOObgVW6agl8dKdeiqb_4IH4635dR6ZEj7l96G8W8BtLIDC0UIeyqExpA
Message-ID: <CABtds-3_eJbkcyXFAD77L5hmJRWwWu+WTzB3BRhvhEyD9bxzEQ@mail.gmail.com>
Subject: [PATCH] Bluetooth: Revert vendor-specific ISO classification for
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

From 7b9a9ee0d6d2cb1bff5c44b16bf1a181d6d57df3 Mon Sep 17 00:00:00 2001
From: Sean Rhodes <sean@starlabs.systems>
Date: Wed, 2 Apr 2025 09:05:17 +0100
Subject: [PATCH] Bluetooth: Revert vendor-specific ISO classification for
 non-offload cards

This reverts commit f25b7fd36cc3a850e006aed686f5bbecd200de1b.

The commit introduces vendor-specific classification of ISO data,
but breaks Bluetooth functionality on certain Intel cards that do
not support audio offload, such as the 9462. Affected devices are
unable to discover new Bluetooth peripherals, and previously paired
devices fail to reconnect.

This issue does not affect newer cards (e.g., AX201+) that support
audio offload. A conditional check using AOLD() could be used in
the future to reintroduce this behavior only on supported hardware.

Cc: Marcel Holtmann <marcel@holtmann.org>
Cc: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Cc: Ying Hsu <yinghsu@chromium.org>
Cc: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
Signed-off-by: Sean Rhodes <sean@starlabs.systems>
---
 drivers/bluetooth/btintel.c      |  7 ++-----
 include/net/bluetooth/hci_core.h |  1 -
 net/bluetooth/hci_core.c         | 16 ----------------
 3 files changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/bluetooth/btintel.c b/drivers/bluetooth/btintel.c
index 55cc1652bfe4..1a5108cf6517 100644
--- a/drivers/bluetooth/btintel.c
+++ b/drivers/bluetooth/btintel.c
@@ -3582,15 +3582,12 @@ static int btintel_setup_combined(struct hci_dev *hdev)
 		err = btintel_bootloader_setup(hdev, &ver);
 		btintel_register_devcoredump_support(hdev);
 		break;
-	case 0x18: /* GfP2 */
-	case 0x1c: /* GaP */
-		/* Re-classify packet type for controllers with LE audio */
-		hdev->classify_pkt_type = btintel_classify_pkt_type;
-		fallthrough;
 	case 0x17:
+	case 0x18:
 	case 0x19:
 	case 0x1b:
 	case 0x1d:
+	case 0x1c:
 	case 0x1e:
 	case 0x1f:
 		/* Display version information of TLV type */
diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci_core.h
index 2b261e74e2c4..648ee7e2403f 100644
--- a/include/net/bluetooth/hci_core.h
+++ b/include/net/bluetooth/hci_core.h
@@ -649,7 +649,6 @@ struct hci_dev {
 	int (*get_codec_config_data)(struct hci_dev *hdev, __u8 type,
 				     struct bt_codec *codec, __u8 *vnd_len,
 				     __u8 **vnd_data);
-	u8 (*classify_pkt_type)(struct hci_dev *hdev, struct sk_buff *skb);
 };

 #define HCI_PHY_HANDLE(handle)	(handle & 0xff)
diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
index 3b49828160b7..64ab7702be81 100644
--- a/net/bluetooth/hci_core.c
+++ b/net/bluetooth/hci_core.c
@@ -2868,31 +2868,15 @@ int hci_reset_dev(struct hci_dev *hdev)
 }
 EXPORT_SYMBOL(hci_reset_dev);

-static u8 hci_dev_classify_pkt_type(struct hci_dev *hdev, struct sk_buff *skb)
-{
-	if (hdev->classify_pkt_type)
-		return hdev->classify_pkt_type(hdev, skb);
-
-	return hci_skb_pkt_type(skb);
-}
-
 /* Receive frame from HCI drivers */
 int hci_recv_frame(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	u8 dev_pkt_type;
-
 	if (!hdev || (!test_bit(HCI_UP, &hdev->flags)
 		      && !test_bit(HCI_INIT, &hdev->flags))) {
 		kfree_skb(skb);
 		return -ENXIO;
 	}

-	/* Check if the driver agree with packet type classification */
-	dev_pkt_type = hci_dev_classify_pkt_type(hdev, skb);
-	if (hci_skb_pkt_type(skb) != dev_pkt_type) {
-		hci_skb_pkt_type(skb) = dev_pkt_type;
-	}
-
 	switch (hci_skb_pkt_type(skb)) {
 	case HCI_EVENT_PKT:
 		break;
-- 
2.48.1
