Received: from mail3-166.sinamail.sina.com.cn (mail3-166.sinamail.sina.com.cn [202.108.3.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8B0443ABC
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 03:50:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751082609; cv=none; b=hvZr3XCDqMixUyxQyetWJ2Pe/Iqdz4fhCa+V+8d4irUCfsbdIdHItcsN4GWkLINY0oOLXOKu99Z7s5gd5g2z+7kQlrypjLc8PeVaIA37AQ2aM1ajLw6JzAckFMADiwRY9gLyulmJCBgWrYDUPTo/QJ76yrVAMQEba/MPaKOVkec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751082609; c=relaxed/simple;
	bh=jJDXYDnKYY7Nj1a5Fop/VapQYzTrbSA7j+GYCXpsxao=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EB8jZfSQ/sHorREfVMxzOXrzzgqDs1sbjwQuVzP2evF/F3Xx9t5fDX03YBaj011yVMXuksddDkm79Kc0lv7g5pSoNEYCQj2lATBDa/RylHBN99a+XOPnsH6CLQI4FIW25cfm7t8Z7s1b4v8aSIOnCDWiikjO3HPfreUDO/BR3aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=NKeNQOdk; arc=none smtp.client-ip=202.108.3.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="NKeNQOdk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751082603;
	bh=rIlj0obA+UhsaK4Anr6InVEoWs/BhrzYWYPMa34L/Fs=;
	h=From:Subject:Date:Message-ID;
	b=NKeNQOdkqqTg+crGBDoX7g0v0ui6t6WpFrwpRGgSYfhhsCNKbWG1SlMBajoxuIkjo
	 5La6xeoSGlpJvK6d6rUeVpsfTXdgd31aBB/ULsu3aEsfdlKnN8FQhVNoNR6/9mAeQm
	 VTIDL9gyMKIF/mtTLVQtd4GxVs19D4eVTUA4z3k8=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.31) with ESMTP
	id 685F665F000036EE; Sat, 28 Jun 2025 11:49:53 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 2161856816209
X-SMAIL-UIID: D1BF6F09202543868C2A2E7E34AFAF30-20250628-114953-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+6f433bde86418d3f4fec@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] WARNING in flush_delayed_work
Date: Sat, 28 Jun 2025 11:49:40 +0800
Message-ID: <20250628034941.2001-1-hdanton@sina.com>
In-Reply-To: <685f1221.a00a0220.274b5f.0002.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Fri, 27 Jun 2025 14:50:25 -0700
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2aeda9592360 Add linux-next specific files for 20250627
> git tree:       linux-next
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1331908c580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=9e7e53eaffada5f7
> dashboard link: https://syzkaller.appspot.com/bug?extid=6f433bde86418d3f4fec
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1484e08c580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=141c43d4580000

#syz test

--- x/drivers/usb/core/hub.c
+++ y/drivers/usb/core/hub.c
@@ -1872,6 +1872,7 @@ static bool hub_descriptor_is_sane(struc
         return true;
 }
 
+static void hub_init_dumy_func(struct work_struct *ws) {}
 static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 {
 	struct usb_host_interface *desc;
@@ -1976,7 +1977,7 @@ static int hub_probe(struct usb_interfac
 	hub->intfdev = &intf->dev;
 	hub->hdev = hdev;
 	INIT_DELAYED_WORK(&hub->leds, led_work);
-	INIT_DELAYED_WORK(&hub->init_work, NULL);
+	INIT_DELAYED_WORK(&hub->init_work, hub_init_dumy_func);
 	INIT_WORK(&hub->events, hub_event);
 	INIT_LIST_HEAD(&hub->onboard_devs);
 	spin_lock_init(&hub->irq_urb_lock);
--
