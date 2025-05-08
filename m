Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52B8F26B948
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:15:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746713761; cv=none; b=W9k07C+u2/M0xhXNHBd/pQ/apJR72M2AGdUUYpfHeykNznH7Mp3hBTzcME0xc1/k/XbP93PIlYIkpvn6A3xqT/x6nbeAv9gOBT1xCnPrCy/M4+C6QUquiPhkvXzlhYf/EcfAhemlawK0RuZQQ4E1OMd06gIybBxA0qzCXmhavbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746713761; c=relaxed/simple;
	bh=JtzjgYZjUmv8xJecnwOszvA5vWhAZgVzf89hjDUcXlo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JalMCDkFhjAryWtLdyzrKux2rhJ5axKg5+z9Ntav+90k4lpFe3wxq9SKdBFfCwG1WUyAsPghqkbwFA1q4TcGFEZ4Qif+b9uiurAVoX0ThVP+MdlKb5KRABE8akvU9VaibsU3mUhB9k32Z6xwHS9sU9xt7MVedsefT67NPcW1ojE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=e0kI7ETH; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="e0kI7ETH"
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D3B963F47E
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 14:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1746713750;
	bh=iF2aaUgOBZjbcxj5kQqRdhdzT5At5gYVN6zsSjMLv50=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version;
	b=e0kI7ETH/6DUnKRkTpDgH6wxFQJCFp3ui5J3L999gaQWLdzQCKN7TcTVQOTmsOWc5
	 8V4prjTe1jWIN6qYixlDuBLZu2MZu35NzckGCV1CA3GUBdcEpz0r53u/Lx49Y2j+qI
	 jz/ZImLsVXMUbf1Z2FeoZ7yT993WXzTszhGROTtV9LuO0EfkNepFiYRZDMgZRNjWO2
	 fY7rtm3iivWWjj58sJoJrf0e4DTkzoKj84tCXHuhIAVNbkJrkGgun5nfoM9J+On4zy
	 FkH0A7CC5/j4AyJ8dP6Vi3HfRFbW5L1XxRUXzBEi2CF0WYM2FSmBHNedJLIlnAHJCm
	 UepaOce+gRWlw==
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3082946f829so1801715a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 07:15:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746713749; x=1747318549;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iF2aaUgOBZjbcxj5kQqRdhdzT5At5gYVN6zsSjMLv50=;
        b=sWGRIdpGAg+Ez91jrClzwEe6OfsGF4Zf9BU6dHFgDaOBPjGx4JPPccXEQ/NhATFV53
         o8sOYrQfxOtyPklBAdd4JvtXGMlLsXHlzgAnFi1cSGdmpXXLa+5C6FZHoDs5i0HYgpmB
         8tSFrFVq1bI5D5FF8yj/3lPHT+wULOYNqFiwGwqYCkU6qpILsoobCZdkCAL9UWT6/XPI
         EGqt/JgGqdpg/igJ/Kyv4wLQUpDI+kNPNScOwNV405mRMBAK+HmYm6QcNQgAAkr1QwbR
         gP7hWBOLafNuVmSaGE5fH3zV4UaHV5R2VM1zG80BiCZiZkSISmb7BSmiCAMpunuQ6VJK
         GIRw==
X-Forwarded-Encrypted: i=1; AJvYcCVgMIVItxfhbskkAIICj8Y8QZ2lttLuCNClDsP5dz3L6+VLvlPhAbSv/+HQ8V8ufWcHEse/TeV1u8lKYr0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6t1Kbzbt8RkwxSzs5vxyGYV9kk/FNljyPrfJ7mLTkl/rGGLR6
	82/Qipf+TunOygA4IHHwRokte5E4hf2r/gWZhFrTiT70HVpTAIJbCd4tJObej/84ktWXCyWmvnC
	KBZ5cb572RIXaTv8ufgGkVqPMNgQ4vQp9D9ykk0pLh0h7fxIxNi0YFMBEr8v8h0/0+bmkAq2GjO
	pXWA==
X-Gm-Gg: ASbGncvbTCGatT/nDNHai6SBSLa0gS1yVKRHGcy0FOFs9V6C26Y4eMrzT7D0+hzsQiU
	wBQK0uZYHhh1KBV5mn3sTpsnpz0UeN9PcBHiU1BgxYiMjX5hN+TJwWZK5EA/hRJ6XSUfhVAtXMC
	9us3xTbN9nrmNUSTZ14fr0nQ4bTHrUW9WUyx1Wu77jlh73wZ6/kWSNXIO+KpX3ek8aASrhrm+dr
	cuTrSfOvjxmMpIE+Uc+2rmnW27UrkuM2BO1w0+9EWAsXOLovPjXWlZNH0vPH3cYuNH4fzyr/piv
	ATNGsB0C66fvRjbZUOKA/AnZOYWXjIgkd3dmTI+ffhUFB49BgH2QK0+N4yy6EStORhM=
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30aac257b1dmr12023602a91.35.1746713749450;
        Thu, 08 May 2025 07:15:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSRBVKzn0GBkZAe62Mh3DWYjYyzL/faTNUZXv15yrik7NR+TwF827KVGGaCeXf/1ZTBQ+h4A==
X-Received: by 2002:a17:90b:1d09:b0:2ff:7c2d:6ff3 with SMTP id 98e67ed59e1d1-30aac257b1dmr12021735a91.35.1746713725220;
        Thu, 08 May 2025 07:15:25 -0700 (PDT)
Received: from rickywu0421-ThinkPad-X1-Carbon-Gen-11.cnshub.home ([182.233.178.56])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30ad4b40ecbsm2404638a91.12.2025.05.08.07.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 07:15:24 -0700 (PDT)
From: En-Wei Wu <en-wei.wu@canonical.com>
To: marcel@holtmann.org,
	luiz.dentz@gmail.com,
	linux-bluetooth@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	pmenzel@molgen.mpg.de
Cc: quic_tjiang@quicinc.com
Subject: [PATCH v2] Bluetooth: btusb: use skb_pull to avoid unsafe access in QCA dump handling
Date: Thu,  8 May 2025 22:15:20 +0800
Message-ID: <20250508141520.440552-1-en-wei.wu@canonical.com>
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

Fixes: 20981ce2d5a5 ("Bluetooth: btusb: Add WCN6855 devcoredump support")
Signed-off-by: En-Wei Wu <en-wei.wu@canonical.com>
---
Changes in v2:
- Add fixes tag
- Use unsigned int instead of int for the variable in handle_dump_pkt_qca
- Change coding style in handle_dump_pkt_qca

 drivers/bluetooth/btusb.c | 98 ++++++++++++++++-----------------------
 1 file changed, 40 insertions(+), 58 deletions(-)

diff --git a/drivers/bluetooth/btusb.c b/drivers/bluetooth/btusb.c
index 357b18dae8de..ef44817cad34 100644
--- a/drivers/bluetooth/btusb.c
+++ b/drivers/bluetooth/btusb.c
@@ -2979,9 +2979,8 @@ static void btusb_coredump_qca(struct hci_dev *hdev)
 static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 {
 	int ret = 0;
+	unsigned int skip = 0;
 	u8 pkt_type;
-	u8 *sk_ptr;
-	unsigned int sk_len;
 	u16 seqno;
 	u32 dump_size;
 
@@ -2990,18 +2989,13 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 	struct usb_device *udev = btdata->udev;
 
 	pkt_type = hci_skb_pkt_type(skb);
-	sk_ptr = skb->data;
-	sk_len = skb->len;
+	skip = sizeof(struct hci_event_hdr);
+	if (pkt_type == HCI_ACLDATA_PKT)
+		skip += sizeof(struct hci_acl_hdr);
 
-	if (pkt_type == HCI_ACLDATA_PKT) {
-		sk_ptr += HCI_ACL_HDR_SIZE;
-		sk_len -= HCI_ACL_HDR_SIZE;
-	}
-
-	sk_ptr += HCI_EVENT_HDR_SIZE;
-	sk_len -= HCI_EVENT_HDR_SIZE;
+	skb_pull(skb, skip);
+	dump_hdr = (struct qca_dump_hdr *)skb->data;
 
-	dump_hdr = (struct qca_dump_hdr *)sk_ptr;
 	seqno = le16_to_cpu(dump_hdr->seqno);
 	if (seqno == 0) {
 		set_bit(BTUSB_HW_SSR_ACTIVE, &btdata->flags);
@@ -3021,16 +3015,15 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 
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
@@ -3050,7 +3043,6 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
 		return ret;
 	}
 
-	skb_pull(skb, skb->len - sk_len);
 	hci_devcd_append(hdev, skb);
 	btdata->qca_dump.ram_dump_seqno++;
 	if (seqno == QCA_LAST_SEQUENCE_NUM) {
@@ -3078,68 +3070,58 @@ static int handle_dump_pkt_qca(struct hci_dev *hdev, struct sk_buff *skb)
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

