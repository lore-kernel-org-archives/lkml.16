Received: from r3-24.sinamail.sina.com.cn (r3-24.sinamail.sina.com.cn [202.108.3.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169E22D77E8
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 13:52:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637129; cv=none; b=kdq8txEFGkSXQzOHJWAxAAev+i2OiFAtejKHu3lXsODYi/JtOqmLO8kgIRpxW9YDRZA7dNp1zFh+F653OXqxYbz6cYxCDiozjbu+uIa0/e1FmlDzaVtKEaufjnrZFo1o9Tu+gk0KjcxKsuXzJf5Qc00A2kD7wblGAxIxcUiAWc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637129; c=relaxed/simple;
	bh=ZLdvYAxW1DQxR/hA4qtc3cLNehkTQoufV9UWZc8YQsw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AmeAtd4nabYDqJbBpz6fdGr0kQd7UYeOUIL7YWjQiZ+a9EzzU6ml031epL/GHgly8zwKiujC84w5oeUJKUspMEG2kLVZEanaGlpTz70FZDpTwAQ8RxEYOm/xhr1UH8PiJJ9QZwfb5qFNi7AsmNLX2xQx2bzfy1CgXQVeuiavFMI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=YVpZU9/P; arc=none smtp.client-ip=202.108.3.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="YVpZU9/P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751637124;
	bh=XCWb0VIEl6AONUmdJsEwB9R0dutf6jIoeox21Q4ZYk4=;
	h=From:Subject:Date:Message-ID;
	b=YVpZU9/PR8ym9qb3mKvKBN721jiaxgERrgGvmltDM5W4U19Jml66HKVxnayUWf+vH
	 m6MhuEN4mDk7vRcih/AAiPOMFK/Uxsj9SRTptzEdcfnzOjoEkLZW6yefrGKpxzxZIn
	 vc28XlR1ocwWJiWc+K3fRuYOU5QoLyXFYrjBG+Zw=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 6867DC7900003AA3; Fri, 4 Jul 2025 21:51:54 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9984266816217
X-SMAIL-UIID: 022DA8B4F7AB4A5CA7104670C4BF6A13-20250704-215154-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+bc71245e56f06e3127b7@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in force_devcd_write
Date: Fri,  4 Jul 2025 21:51:41 +0800
Message-ID: <20250704135143.2415-1-hdanton@sina.com>
In-Reply-To: <6867a14e.a70a0220.29cf51.0017.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Fri, 04 Jul 2025 02:39:26 -0700
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    4c06e63b9203 Merge tag 'for-6.16-rc4-tag' of git://git.ker..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=11594c8c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9887aa986c36cc50
> dashboard link: https://syzkaller.appspot.com/bug?extid=bc71245e56f06e3127b7
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=139dac8c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14b90f70580000

#syz test

--- x/drivers/bluetooth/hci_vhci.c
+++ y/drivers/bluetooth/hci_vhci.c
@@ -320,6 +320,7 @@ static inline void force_devcd_timeout(s
 #endif
 }
 
+static DEFINE_MUTEX(vhci_release_lock);
 static ssize_t force_devcd_write(struct file *file, const char __user *user_buf,
 				 size_t count, loff_t *ppos)
 {
@@ -343,6 +344,17 @@ static ssize_t force_devcd_write(struct
 		return -ENOMEM;
 	skb_put_data(skb, &dump_data.data, data_size);
 
+	if (!mutex_trylock(&vhci_release_lock)) {
+out:
+		kfree_skb(skb);
+		return -EBUSY;
+	}
+	data = file->private_data;
+	if (!data) {
+		mutex_unlock(&vhci_release_lock);
+		goto out;
+	}
+	hdev = data->hdev;
 	hci_devcd_register(hdev, vhci_coredump, vhci_coredump_hdr, NULL);
 
 	/* Force the devcoredump timeout */
@@ -352,6 +364,7 @@ static ssize_t force_devcd_write(struct
 	ret = hci_devcd_init(hdev, skb->len);
 	if (ret) {
 		BT_ERR("Failed to generate devcoredump");
+		mutex_unlock(&vhci_release_lock);
 		kfree_skb(skb);
 		return ret;
 	}
@@ -369,9 +382,11 @@ static ssize_t force_devcd_write(struct
 		/* Do nothing */
 		break;
 	default:
+		mutex_unlock(&vhci_release_lock);
 		return -EINVAL;
 	}
 
+	mutex_unlock(&vhci_release_lock);
 	return count;
 }
 
@@ -656,6 +671,7 @@ static int vhci_release(struct inode *in
 	struct vhci_data *data = file->private_data;
 	struct hci_dev *hdev;
 
+	mutex_lock(&vhci_release_lock);
 	cancel_delayed_work_sync(&data->open_timeout);
 	flush_work(&data->suspend_work);
 
@@ -669,6 +685,7 @@ static int vhci_release(struct inode *in
 	skb_queue_purge(&data->readq);
 	file->private_data = NULL;
 	kfree(data);
+	mutex_unlock(&vhci_release_lock);
 
 	return 0;
 }
--
