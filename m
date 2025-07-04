Received: from r3-20.sinamail.sina.com.cn (r3-20.sinamail.sina.com.cn [202.108.3.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF954501A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751637868; cv=none; b=CWhm6KCJe1ypoovjZGK3EfKtRzHRWIskzPYL/HwIVrxMbXWg8iEJSpeFX4UFTd6fdCopRFnOGNkijDC6HxWgIq23WS3UISQVu1ZUGcztifN1AT9EKYPeXvLtWR90KTVcrUlTwNptsmXY6m9FAWOHbHdtcA9bzaKIP9c7i3F5UiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751637868; c=relaxed/simple;
	bh=/XVT+FQgsSodrAYeS54R4db2GNmt2wKkDoeASbaIkGM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rymvRZxIArpE7mMhcg2eTaKCCSEL1qcAorZWhXKP/7yOb3RWHBU9RsHXsZnl5abohRY5QLVu+9HiEwdsnLOZklpvxc9y0q/Ac+S3aAq4FRZLKUbFFNLdfK0csigRw1Fhx9YumyVstRX0b95qxDZu0lR1/weR0+AByFXHrtcgO5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=NNgM2Xvo; arc=none smtp.client-ip=202.108.3.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="NNgM2Xvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751637861;
	bh=2M+SZahFsfagSO96vLtty8UOKvoX708L7ou1rzhDVcM=;
	h=From:Subject:Date:Message-ID;
	b=NNgM2XvofBID1v8A+QT/4afNrniRNXKIIua6Ek/VjfJVBLOY/BtkQx1Ini3R3Yrsm
	 fC0HuYcTXeqVa49yZzSDy3pY4XoeD7IHJQVbpQDqvgKSJ3sFjUfh9LLzBsPq6Jz9Ba
	 9wiGmfs4wWUGOMMAM9RaM5+YNZmLKcyo5WFYOXOE=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.32) with ESMTP
	id 6867DF3D00003995; Fri, 4 Jul 2025 22:03:42 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 8452774456907
X-SMAIL-UIID: 928ABF1CBD0145218D47B0767C2F2302-20250704-220342-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+2fc81b50a4f8263a159b@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [bluetooth?] [usb?] KASAN: slab-use-after-free Read in btusb_disconnect
Date: Fri,  4 Jul 2025 22:03:30 +0800
Message-ID: <20250704140331.2436-1-hdanton@sina.com>
In-Reply-To: <68678de0.a70a0220.29cf51.0012.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Fri, 04 Jul 2025 01:16:32 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    cf16f408364e usb: core: config: Prevent OOB read in SS end..
> git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
> console output: https://syzkaller.appspot.com/x/log.txt?x=1356f48c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=a4c5153915e19e58
> dashboard link: https://syzkaller.appspot.com/bug?extid=2fc81b50a4f8263a159b
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12cf7770580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1756f48c580000

#syz test

--- x/drivers/bluetooth/btusb.c
+++ y/drivers/bluetooth/btusb.c
@@ -4269,6 +4269,11 @@ static void btusb_disconnect(struct usb_
 
 	hci_unregister_dev(hdev);
 
+	if (data->oob_wake_irq)
+		device_init_wakeup(&data->udev->dev, false);
+	if (data->reset_gpio)
+		gpiod_put(data->reset_gpio);
+
 	if (intf == data->intf) {
 		if (data->isoc)
 			usb_driver_release_interface(&btusb_driver, data->isoc);
@@ -4284,12 +4289,6 @@ static void btusb_disconnect(struct usb_
 			usb_driver_release_interface(&btusb_driver, data->isoc);
 	}
 
-	if (data->oob_wake_irq)
-		device_init_wakeup(&data->udev->dev, false);
-
-	if (data->reset_gpio)
-		gpiod_put(data->reset_gpio);
-
 	hci_free_dev(hdev);
 }
 
--
