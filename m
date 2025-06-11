Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD1B1C36
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 02:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749609736; cv=none; b=TnYgoeeipC+4M4lyZ4v/vTCL1mYARYaaYjkbFsBN1G8xnttBbGm4OdrF/8K9OVH2b0vgigDDbtBjeqVj9mVGI5a0glVvuO6aqHUJ18V5+FQonBEEZhnexZJGphcr+8m3GTwpo/C0PFHAVg8gw06kOu/IM8AK7zpenEqTKukcD60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749609736; c=relaxed/simple;
	bh=Ikk1/0g0chGDQLY5aUmaTLPlc0t/mrdyOAaXMwjVMiU=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=BEM4vLzd1ant+XAT43QjBP9tlz/YfkGeA0dy+Y8RntTwtyGSNe79TZaWjblgCiEJ3opcMs8OVCDpTatTCS/TEDhtdzQ+EXQhpTqfev2JDloZ7UimEiSUmXiL/o9SLP1GS+c7xVWDvUJNowrSLxVqO56BZo1keMxzfMLdU5YkmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cf306fc68so987817839f.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 19:42:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749609733; x=1750214533;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=600XtS43DiuJGNnd8s0qy+BP+0I4UZKrWfNSqSlPpIU=;
        b=OPqpVUNdBisa8ZLQL4yFxwYscaPV+bmdyf2y+uNeVIlysjyb276bS/63iiTEwxQPOR
         iuiE/b2ZRJB/xSzxyqCM7wuuvN8KuFoFYGeIbiCC78upxdjw0UwHUy+nn2nDkyj53iGG
         AHSXC0hqVOMgHDGbhYka3vxMTQd6A8vkZnJ+mZxQcASkaUFkQBsyDAfbdffzFBuo2Mx/
         lADXv4ZDRFkz+0/l8byC9G6Jvqo6GmqnGysGlyanGKKyPkUJlV7dfeWXtKrCRlF5r8A8
         /TVcY3cmevqsC/vl7VIRoiNDdrz601UnP/wGNxY84gLT1786VSRjJcWeYimL85xSDwES
         f6AQ==
X-Gm-Message-State: AOJu0YxibXjsRXbxBjcgC+aJzwDSAAuOWeShIDUvAhmvjyA5EONuaJd0
	RdrL+wIBO3topVfb4aBw57YqpCC0LDOGatYPz6QIhzZc4ei6rNT2zFAQdO5yJPsRQvnDYrmZR58
	Jh8MflUsbAftEh1C/3wWeEbJkW53IyRzccOrxU4livcyvqlpzuMVchajAujQ=
X-Google-Smtp-Source: AGHT+IEaUl/FJIU/DmKHTCKH+23xeZyagV+gHUqeeVu9QNn2k3biths+9upANfMOlxCxbox8EhtLmq2IlgJwss3uzFeit9MFKJtX
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:188d:b0:3dd:dd37:293a with SMTP id
 e9e14a558f8ab-3ddf4263c46mr18936195ab.7.1749609733551; Tue, 10 Jun 2025
 19:42:13 -0700 (PDT)
Date: Tue, 10 Jun 2025 19:42:13 -0700
In-Reply-To: <67eaa688.050a0220.1547ec.014a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6848ed05.050a0220.daf97.0b0d.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [bluetooth?] KASAN: vmalloc-out-of-bounds
 Read in hci_devcd_dump
From: syzbot <syzbot+ac3c79181f6aecc5120c@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [bluetooth?] KASAN: vmalloc-out-of-bounds Read in hci_devcd_dump
Author: ipravdin.official@gmail.com

#syz test

diff --git a/drivers/bluetooth/hci_vhci.c b/drivers/bluetooth/hci_vhci.c
index 59f4d7bdffdc..82a1088cd662 100644
--- a/drivers/bluetooth/hci_vhci.c
+++ b/drivers/bluetooth/hci_vhci.c
@@ -380,6 +380,31 @@ static const struct file_operations force_devcoredump_fops = {
 	.write		= force_devcd_write,
 };
 
+static void vhci_debugfs_init(struct vhci_data *data)
+{
+	struct hci_dev *hdev = data->hdev;
+
+	if (!hdev->debugfs)
+		return;
+
+	debugfs_create_file("force_suspend", 0644, hdev->debugfs, data,
+			    &force_suspend_fops);
+
+	debugfs_create_file("force_wakeup", 0644, hdev->debugfs, data,
+			    &force_wakeup_fops);
+
+	if (IS_ENABLED(CONFIG_BT_MSFTEXT))
+		debugfs_create_file("msft_opcode", 0644, hdev->debugfs, data,
+				    &msft_opcode_fops);
+
+	if (IS_ENABLED(CONFIG_BT_AOSPEXT))
+		debugfs_create_file("aosp_capable", 0644, hdev->debugfs, data,
+				    &aosp_capable_fops);
+
+	debugfs_create_file("force_devcoredump", 0644, hdev->debugfs, data,
+			    &force_devcoredump_fops);
+}
+
 static int __vhci_create_device(struct vhci_data *data, __u8 opcode)
 {
 	struct hci_dev *hdev;
@@ -434,22 +459,9 @@ static int __vhci_create_device(struct vhci_data *data, __u8 opcode)
 		return -EBUSY;
 	}
 
-	debugfs_create_file("force_suspend", 0644, hdev->debugfs, data,
-			    &force_suspend_fops);
-
-	debugfs_create_file("force_wakeup", 0644, hdev->debugfs, data,
-			    &force_wakeup_fops);
-
-	if (IS_ENABLED(CONFIG_BT_MSFTEXT))
-		debugfs_create_file("msft_opcode", 0644, hdev->debugfs, data,
-				    &msft_opcode_fops);
-
-	if (IS_ENABLED(CONFIG_BT_AOSPEXT))
-		debugfs_create_file("aosp_capable", 0644, hdev->debugfs, data,
-				    &aosp_capable_fops);
-
-	debugfs_create_file("force_devcoredump", 0644, hdev->debugfs, data,
-			    &force_devcoredump_fops);
+#ifdef CONFIG_DEBUG_FS
+	vhci_debugfs_init(data);
+#endif
 
 	hci_skb_pkt_type(skb) = HCI_VENDOR_PKT;
 
@@ -651,6 +663,26 @@ static int vhci_open(struct inode *inode, struct file *file)
 	return 0;
 }
 
+static void vhci_debugfs_remove(struct vhci_data *data)
+{
+	struct hci_dev *hdev = data->hdev;
+
+	if (!hdev->debugfs)
+		return;
+
+	debugfs_lookup_and_remove("force_suspend", hdev->debugfs);
+
+	debugfs_lookup_and_remove("force_wakeup", hdev->debugfs);
+
+	if (IS_ENABLED(CONFIG_BT_MSFTEXT))
+		debugfs_lookup_and_remove("msft_opcode", hdev->debugfs);
+
+	if (IS_ENABLED(CONFIG_BT_AOSPEXT))
+		debugfs_lookup_and_remove("aosp_capable", hdev->debugfs);
+
+	debugfs_lookup_and_remove("force_devcoredump", hdev->debugfs);
+}
+
 static int vhci_release(struct inode *inode, struct file *file)
 {
 	struct vhci_data *data = file->private_data;
@@ -661,6 +693,10 @@ static int vhci_release(struct inode *inode, struct file *file)
 
 	hdev = data->hdev;
 
+#ifdef CONFIG_DEBUG_FS
+	vhci_debugfs_remove(data);
+#endif
+
 	if (hdev) {
 		hci_unregister_dev(hdev);
 		hci_free_dev(hdev);
diff --git a/net/bluetooth/coredump.c b/net/bluetooth/coredump.c
index 819eacb38762..908ad0d242c3 100644
--- a/net/bluetooth/coredump.c
+++ b/net/bluetooth/coredump.c
@@ -243,6 +243,7 @@ static void hci_devcd_handle_pkt_pattern(struct hci_dev *hdev,
 static void hci_devcd_dump(struct hci_dev *hdev)
 {
 	struct sk_buff *skb;
+	char* coredump;
 	u32 size;
 
 	bt_dev_dbg(hdev, "state %d", hdev->dump.state);
@@ -250,7 +251,11 @@ static void hci_devcd_dump(struct hci_dev *hdev)
 	size = hdev->dump.tail - hdev->dump.head;
 
 	/* Emit a devcoredump with the available data */
-	dev_coredumpv(&hdev->dev, hdev->dump.head, size, GFP_KERNEL);
+	coredump = vmalloc(size);
+	if (coredump) {
+		memcpy(coredump, hdev->dump.head, size);
+		dev_coredumpv(&hdev->dev, coredump, size, GFP_KERNEL);
+	}
 
 	/* Send a copy to monitor as a diagnostic packet */
 	skb = bt_skb_alloc(size, GFP_ATOMIC);

Ivan Pravdin

