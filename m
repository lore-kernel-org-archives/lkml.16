Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96E72D29A4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:48:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.123
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746499717; cv=none; b=aaKbZoBgIx/d5ch8cKSZloKs1rrt+k7dDTwCMNdF9qBoOgPW1pUUweJv1SOQZWZyDlTAFVIbE9goIktDrxdDGAx6M3ZTIqI5iRi988FPkjXR4yfBgOGTXEaXP44g81PksPg3Eg46ZnOPdBfbJq0HevYBZY/nxG48aLG8F5Klouk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746499717; c=relaxed/simple;
	bh=wpG2NshjV02nFvy4dXQW2otXZ1IoWUq8+zAg8SsRscg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J/2l1o6NjjCU6MrNE5R1pCPoR4mWlbgRGsVQ1gelb0xonAsXGfqOAem9Vx4+Lq7pGMfYIYJoMTWOKW2BHJiBrR6Nv9OQXFEGb6xfDMEjDH2g1BRnb9xbNKaIJKmH6bWRzOjbj7L+ltCSsXUwVQRJOC8HaAThv/8hUKVf4aXuduU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=SbNJVeDb; arc=none smtp.client-ip=185.125.188.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="SbNJVeDb"
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 603433F290
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 02:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746499707;
	bh=ponU8MTyH0aCn11QB2SNP989sAX4rVPkn2tWaOm/YIc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=SbNJVeDbEva/Rj5iAZdd/x035gVQrv3DJ8Obd5HXTxF7DL8i0KO8N/57+5AA8E1rd
	 0tZjgauMoGHHQvZWQ3UDE8LQt+OHf67j+xqKwxAD9fLj9D3CY67RijnQ+KuCyt2YqN
	 iuIK3bQSgd1y+NmYtWci1fMf1HBFQbTdTVsqWFklTQZQiFm1hq1dj96mbKqZET109T
	 AW/haEe4uF90LbqXAkHCWR7WuSfOsWod+vZ4bk6XT+GG1hVWmRPcqfrt0Yciavf2RE
	 seXfVWg2BBlusGKyIDxil+32V+3s2VQlogMucwNdAX8fAn1js/orImuGF6ujCptHq0
	 A+PJY78V5Tuvw==
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b115fb801bcso5400302a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 19:48:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746499706; x=1747104506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ponU8MTyH0aCn11QB2SNP989sAX4rVPkn2tWaOm/YIc=;
        b=ir1tUrAiYHC1JQv15UgWUhpm10p/RtxgK/QFBzzxwo1yF3YFyznwG4+ARVOoa3BgxW
         PkLyoedETgyMy45DaosQLK7XO4D5G3tjoaJ3zljO0RAkp+ePKHWnCEuMnqf+DaI6WNHW
         yW478Yqasn8cYLMyRqe0yBd2+/soksf+ceglqwL+EAiTlHTqQ9CVnR/jKPbMqhTq7m85
         8vidQCIiPjcs8uvtswkQOuW9jCZCP1TkwImXZWvbOfjRyEXbBLpH4YTGYYZxQvW6HLrw
         ikeesKVFZkZgkt66wdfTJvRtJJI8ukMJtN/J8UZJfrZ3CoCH+y1O3uB0gcB2crEJe7XU
         LAsA==
X-Forwarded-Encrypted: i=1; AJvYcCVNfCZKway7LhErcWBgcnC8P3cgZYcaHW8X8zedL4xe1SiyphMFUMDSLbgoWKgrqJj9wGiAlRrW7bOf6Q4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHstBFIykvi6VPJzeChPKkN/A+oli9dVv9eiTNfi97CeCOPJ7i
	stpYYAo1DHdwBNycNnNFz7LDXvbRJJHWmN/+/7FrnFWB6urDOHdjx3y7lVZo70N9qsIRdbDiGlU
	xurXeBJCvnLUmVo0/Lhkjl28XwPSRwAK4jg1gRan2REUeOzLWwQ8chUV0F7gPUTQDL0/4hUGn2y
	wngQ==
X-Gm-Gg: ASbGncsfVQzN8gY81P/LdehL4UCpUPrbMd/g+B9vQSUSx3Szd9fYApOHrvfYx8Gf2e6
	eHMHKENuWF3qe1Fd0nIJvhoOsNE9uXtphMclSzs7fJEBFhzOui6s/+mWaqOUJcbxMJ2TTAt7sO4
	RNDvu/HKj2e/B7d7tW5WAahbdsQn4gCvk16OyQ1dZjxCH30J4zzt0K014quGviVqBOftgu04Ovn
	0FsEG+3n8YcDJuA7Guhwnb8e8iebTCiR65KrFYPvjPFDoumjbieaw4Ika0GqNwKm5cBFvjLlqvD
	soKeWSg10FGZ81R7wqZwoOjc5jQx78UuiipZ/zNv3J83oSDvkMsqrWI9SnudtGXl0rpBvzeZUJ3
	LpknKypGYUCMEmw==
X-Received: by 2002:a17:90b:4f42:b0:308:65d4:9dda with SMTP id 98e67ed59e1d1-30a7e0b5b60mr1630948a91.16.1746499705919;
        Mon, 05 May 2025 19:48:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAO/bISkF4fqgNxPNRTZRMePQKzo7kPZhLRy3q28sg5/TTHBFLBkPeRfc1GAaq/IZZojhrdA==
X-Received: by 2002:a17:90b:4f42:b0:308:65d4:9dda with SMTP id 98e67ed59e1d1-30a7e0b5b60mr1630930a91.16.1746499705583;
        Mon, 05 May 2025 19:48:25 -0700 (PDT)
Received: from rickywu0421-ThinkPad-X1-Carbon-Gen-11.. (118-163-61-247.hinet-ip.hinet.net. [118.163.61.247])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a4745f92csm9905801a91.6.2025.05.05.19.48.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 19:48:25 -0700 (PDT)
From: En-Wei Wu <en-wei.wu@canonical.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de
Cc: quic_tjiang@quicinc.com
Subject: [PATCH] Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump handling
Date: Tue,  6 May 2025 10:48:22 +0800
Message-ID: <20250506024822.327776-1-en-wei.wu@canonical.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use skb_pull() and skb_pull_data() to safely parse QCA dump packets.

This avoids direct pointer math on skb->data, which could lead to
invalid access if the packet is shorter than expected.

Signed-off-by: En-Wei Wu <en-wei.wu@canonical.com>
---
 drivers/bluetooth/btusb.c | 99 ++++++++++++++++-----------------------
 1 file changed, 41 insertions(+), 58 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 357b18dae8de..17136924a278 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2979,9 +2979,8 @@ static void btusb_coredump_qca(struct hci_dev *hdev)
 static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	int ret = 0;
+	int skip = 0;
 	u8 pkt_type;
-	u8 *sk_ptr;
-	unsigned int sk_len;
 	u16 seqno;
 	u32 dump_size;
 
@@ -2990,18 +2989,14 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 	struct usb_device *udev = btdata->udev;
 
 	pkt_type = hci_skb_pkt_type(skb);
-	sk_ptr = skb->data;
-	sk_len = skb->len;
-
-	if (pkt_type == HCI_ACLDATA_PKT) {
-		sk_ptr += HCI_ACL_HDR_SIZE;
-		sk_len -= HCI_ACL_HDR_SIZE;
-	}
+	if (pkt_type == HCI_ACLDATA_PKT)
+		skip = sizeof(struct hci_acl_hdr) + sizeof(struct hci_event_hdr);
+	else
+		skip = sizeof(struct hci_event_hdr);
 
-	sk_ptr += HCI_EVENT_HDR_SIZE;
-	sk_len -= HCI_EVENT_HDR_SIZE;
+	skb_pull(skb, skip);
+	dump_hdr = (struct qca_dump_hdr *)skb->data;
 
-	dump_hdr = (struct qca_dump_hdr *)sk_ptr;
 	seqno = le16_to_cpu(dump_hdr->seqno);
 	if (seqno == 0) {
 		set_bit(BTUSB_HW_SSR_ACTIVE, &btdata->flags);
@@ -3021,16 +3016,15 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 
 		btdata->qca_dump.ram_dump_size = dump_size;
 		btdata->qca_dump.ram_dump_seqno = 0;
-		sk_ptr += offsetof(struct qca_dump_hdr, data0);
-		sk_len -= offsetof(struct qca_dump_hdr, data0);
+
+		skb_pull(skb, offsetof(struct qca_dump_hdr, data0));
 
 		usb_disable_autosuspend(udev);
 		bt_dev_info(hdev, "%s memdump size(%u)\n",
 			    (pkt_type == HCI_ACLDATA_PKT) ? "ACL" : "event",
 			    dump_size);
 	} else {
-		sk_ptr += offsetof(struct qca_dump_hdr, data);
-		sk_len -= offsetof(struct qca_dump_hdr, data);
+		skb_pull(skb, offsetof(struct qca_dump_hdr, data));
 	}
 
 	if (!btdata->qca_dump.ram_dump_size) {
@@ -3050,7 +3044,6 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 		return ret;
 	}
 
-	skb_pull(skb, skb->len - sk_len);
 	hci_devcd_append(hdev, skb);
 	btdata->qca_dump.ram_dump_seqno++;
 	if (seqno == QCA_LAST_SEQUENCE_NUM) {
@@ -3078,68 +3071,58 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 /* Return: true if the ACL packet is a dump packet, false otherwise. */
 static bool acl_pkt_is_dump_qca(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	u8 *sk_ptr;
-	unsigned int sk_len;
-
 	struct hci_event_hdr *event_hdr;
 	struct hci_acl_hdr *acl_hdr;
 	struct qca_dump_hdr *dump_hdr;
+	struct sk_buff *clone = skb_clone(skb, GFP_ATOMIC);
+	bool is_dump = false;
 
-	sk_ptr = skb->data;
-	sk_len = skb->len;
-
-	acl_hdr = hci_acl_hdr(skb);
-	if (le16_to_cpu(acl_hdr->handle) != QCA_MEMDUMP_ACL_HANDLE)
+	if (!clone)
 		return false;
 
-	sk_ptr += HCI_ACL_HDR_SIZE;
-	sk_len -= HCI_ACL_HDR_SIZE;
-	event_hdr = (struct hci_event_hdr *)sk_ptr;
-
-	if ((event_hdr->evt != HCI_VENDOR_PKT) ||
-	    (event_hdr->plen != (sk_len - HCI_EVENT_HDR_SIZE)))
-		return false;
+	acl_hdr = skb_pull_data(clone, sizeof(*acl_hdr));
+	if (!acl_hdr || (le16_to_cpu(acl_hdr->handle) != QCA_MEMDUMP_ACL_HANDLE))
+		goto out;
 
-	sk_ptr += HCI_EVENT_HDR_SIZE;
-	sk_len -= HCI_EVENT_HDR_SIZE;
+	event_hdr = skb_pull_data(clone, sizeof(*event_hdr));
+	if (!event_hdr || (event_hdr->evt != HCI_VENDOR_PKT))
+		goto out;
 
-	dump_hdr = (struct qca_dump_hdr *)sk_ptr;
-	if ((sk_len < offsetof(struct qca_dump_hdr, data)) ||
-	    (dump_hdr->vse_class != QCA_MEMDUMP_VSE_CLASS) ||
-	    (dump_hdr->msg_type != QCA_MEMDUMP_MSG_TYPE))
-		return false;
+	dump_hdr = skb_pull_data(clone, sizeof(*dump_hdr));
+	if (!dump_hdr || (dump_hdr->vse_class != QCA_MEMDUMP_VSE_CLASS) ||
+	   (dump_hdr->msg_type != QCA_MEMDUMP_MSG_TYPE))
+		goto out;
 
-	return true;
+	is_dump = true;
+out:
+	consume_skb(clone);
+	return is_dump;
 }
 
 /* Return: true if the event packet is a dump packet, false otherwise. */
 static bool evt_pkt_is_dump_qca(struct hci_dev *hdev, struct sk_buff *skb)
 {
-	u8 *sk_ptr;
-	unsigned int sk_len;
-
 	struct hci_event_hdr *event_hdr;
 	struct qca_dump_hdr *dump_hdr;
+	struct sk_buff *clone = skb_clone(skb, GFP_ATOMIC);
+	bool is_dump = false;
 
-	sk_ptr = skb->data;
-	sk_len = skb->len;
-
-	event_hdr = hci_event_hdr(skb);
-
-	if ((event_hdr->evt != HCI_VENDOR_PKT)
-	    || (event_hdr->plen != (sk_len - HCI_EVENT_HDR_SIZE)))
+	if (!clone)
 		return false;
 
-	sk_ptr += HCI_EVENT_HDR_SIZE;
-	sk_len -= HCI_EVENT_HDR_SIZE;
+	event_hdr = skb_pull_data(clone, sizeof(*event_hdr));
+	if (!event_hdr || (event_hdr->evt != HCI_VENDOR_PKT))
+		goto out;
 
-	dump_hdr = (struct qca_dump_hdr *)sk_ptr;
-	if ((sk_len < offsetof(struct qca_dump_hdr, data)) ||
-	    (dump_hdr->vse_class != QCA_MEMDUMP_VSE_CLASS) ||
-	    (dump_hdr->msg_type != QCA_MEMDUMP_MSG_TYPE))
-		return false;
+	dump_hdr = skb_pull_data(clone, sizeof(*dump_hdr));
+	if (!dump_hdr || (dump_hdr->vse_class != QCA_MEMDUMP_VSE_CLASS) ||
+	   (dump_hdr->msg_type != QCA_MEMDUMP_MSG_TYPE))
+		goto out;
 
-	return true;
+	is_dump = true;
+out:
+	consume_skb(clone);
+	return is_dump;
 }
 
 static int btusb_recv_acl_qca(struct hci_dev *hdev, struct sk_buff *skb)
-- 
2.43.0

