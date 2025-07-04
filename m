Received: from smtp153-170.sina.com.cn (smtp153-170.sina.com.cn [61.135.153.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F5B082C60
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751640763; cv=none; b=BmnTJ9hOh032D0tb62RN163AE8QlZOBkwvHOnDkdu/WejEJmnLOm0j94CKikjvFQbF4YyM2fAF9f6EVF+JeOph6G5W3fHjseB7SyEklmPhBGEXZnNTIR74zR1+KkYs5UWaeQiJy1P1yEvKmndLhnvPV1Tzd1Ix7v1QlL3AyNsAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751640763; c=relaxed/simple;
	bh=ebzy+L2kDzPSh0AbweyyGdq0j7lJb5zpEI3DTbgf62E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GJ216wghM19VnIBHo08QCOLzCzO5qc1Sj+4QBBKu26Ka98E1JjHYKI7UEKxkpjZd/+IL4LNYqPqo2Ezq/rtrI30/9kUyg9oOEwrjVkVU19nsbu1vAY7OnI1ZeQAh9yUlxvJ3akfTvwenFsFlGR99NAR9Qt5jUSbK+hxCYIEolaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=Wp0cQBRj; arc=none smtp.client-ip=61.135.153.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="Wp0cQBRj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751640752;
	bh=zXpGu7hMwY17GClItf6VxP/amPRruId0ptQiYfJD7As=;
	h=From:Subject:Date:Message-ID;
	b=Wp0cQBRjcP9Md11rO5Hh+GbQsTfRX8cwKjv8DKnh1lL5i+W7kX5H0PGjoRg+XNU6a
	 H//Q9JV6WOsYZuw1ZTiBjsSB7GRUuowJgaJ53HcftM0t96ZXjJRnZEy0o5oxkxwceN
	 FN3djUhDzdt+zP7QPfbUVw6lWSKIUFqY5YBZraeo=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 6867EAA50000411F; Fri, 4 Jul 2025 22:52:23 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 3120106292002
X-SMAIL-UIID: 2D7CD7CE3D804D40A0674AD0055D249A-20250704-225223-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+bc71245e56f06e3127b7@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in force_devcd_write
Date: Fri,  4 Jul 2025 22:52:10 +0800
Message-ID: <20250704145211.2487-1-hdanton@sina.com>
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
@@ -320,11 +320,13 @@ static inline void force_devcd_timeout(s
 #endif
 }
 
+static DEFINE_MUTEX(vhci_release_lock);
+static int released = 0;
 static ssize_t force_devcd_write(struct file *file, const char __user *user_buf,
 				 size_t count, loff_t *ppos)
 {
-	struct vhci_data *data = file->private_data;
-	struct hci_dev *hdev = data->hdev;
+	struct vhci_data *data;
+	struct hci_dev *hdev;
 	struct sk_buff *skb = NULL;
 	struct devcoredump_test_data dump_data;
 	size_t data_size;
@@ -343,6 +345,21 @@ static ssize_t force_devcd_write(struct
 		return -ENOMEM;
 	skb_put_data(skb, &dump_data.data, data_size);
 
+	if (!mutex_trylock(&vhci_release_lock)) {
+out:
+		kfree_skb(skb);
+		return -EBUSY;
+	}
+	if (released) {
+		mutex_unlock(&vhci_release_lock);
+		goto out;
+	}
+	data = file->private_data;
+	if (!data) {
+		mutex_unlock(&vhci_release_lock);
+		goto out;
+	}
+	hdev = data->hdev;
 	hci_devcd_register(hdev, vhci_coredump, vhci_coredump_hdr, NULL);
 
 	/* Force the devcoredump timeout */
@@ -352,6 +369,7 @@ static ssize_t force_devcd_write(struct
 	ret = hci_devcd_init(hdev, skb->len);
 	if (ret) {
 		BT_ERR("Failed to generate devcoredump");
+		mutex_unlock(&vhci_release_lock);
 		kfree_skb(skb);
 		return ret;
 	}
@@ -369,9 +387,11 @@ static ssize_t force_devcd_write(struct
 		/* Do nothing */
 		break;
 	default:
+		mutex_unlock(&vhci_release_lock);
 		return -EINVAL;
 	}
 
+	mutex_unlock(&vhci_release_lock);
 	return count;
 }
 
@@ -656,6 +676,8 @@ static int vhci_release(struct inode *in
 	struct vhci_data *data = file->private_data;
 	struct hci_dev *hdev;
 
+	mutex_lock(&vhci_release_lock);
+	data = file->private_data;
 	cancel_delayed_work_sync(&data->open_timeout);
 	flush_work(&data->suspend_work);
 
@@ -669,6 +691,8 @@ static int vhci_release(struct inode *in
 	skb_queue_purge(&data->readq);
 	file->private_data = NULL;
 	kfree(data);
+	released++;
+	mutex_unlock(&vhci_release_lock);
 
 	return 0;
 }
--
