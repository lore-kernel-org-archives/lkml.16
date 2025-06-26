Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C49D62F1FFE
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750897825; cv=none; b=RU6mzmQrAitJDhECU/PPwSgXpokb3kxM0kSRUd9blgpZJnc1yqBl7ysr9t+735TuK2XJprT7y/ORS5kuVfAtfeEOHwbF3kETYWwsbI3gHdkJwnw160qWTTKmdP4ueukddSXFbRL2dMYJ7R3/hmQmHebtRuLMU40WEcDrzwZeATI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750897825; c=relaxed/simple;
	bh=hjpEX4N+a1zcIUBRi9Y+EzOHHOzahOm+CCneYg+iulc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LS0oDdwRgQv9HlktssMjRB4QGry7T+4eicswMC0wvVcDXlvy0koJ0jXaUc7ee8FUc7R9o1XBp7M67i9wJDK+iTp7SqdHRoqFZHlGu5j5lMiN7nq3LVAkNAtcE2on2/Gi5X4/Kbp4lEfkqJ5vEguCoI79f+i3D1+/ruVoz5kTi/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 685C949300004912; Thu, 26 Jun 2025 08:30:13 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3453796685246
X-SMAIL-UIID: B64117F872394ED0AA61082E42A6C986-20250626-083013-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+01fdb2cc3f0b4ddcfcf1@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] BUG: corrupted list in _hci_cmd_sync_cancel_entry
Date: Thu, 26 Jun 2025 08:29:59 +0800
Message-ID: <20250626003001.1826-1-hdanton@sina.com>
In-Reply-To: <685c2e73.050a0220.2303ee.004c.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Wed, 25 Jun 2025 10:14:27 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    7595b66ae9de Merge tag 'selinux-pr-20250624' of git://git...
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=10ed4f0c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=641bc01f4fbdccd4
> dashboard link: https://syzkaller.appspot.com/bug?extid=01fdb2cc3f0b4ddcfcf1
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14bc9b70580000

#syz test

--- x/net/bluetooth/hci_sync.c
+++ y/net/bluetooth/hci_sync.c
@@ -862,14 +862,17 @@ bool hci_cmd_sync_dequeue_once(struct hc
 			       void *data, hci_cmd_sync_work_destroy_t destroy)
 {
 	struct hci_cmd_sync_work_entry *entry;
+	bool ret = false;
 
-	entry = hci_cmd_sync_lookup_entry(hdev, func, data, destroy);
-	if (!entry)
-		return false;
+	mutex_lock(&hdev->cmd_sync_work_lock);
+	entry = _hci_cmd_sync_lookup_entry(hdev, func, data, destroy);
+	if (entry) {
+		_hci_cmd_sync_cancel_entry(hdev, entry, -ECANCELED);
+		ret = true;
+	}
+	mutex_unlock(&hdev->cmd_sync_work_lock);
 
-	hci_cmd_sync_cancel_entry(hdev, entry);
-
-	return true;
+	return ret;
 }
 EXPORT_SYMBOL(hci_cmd_sync_dequeue_once);
 
--
