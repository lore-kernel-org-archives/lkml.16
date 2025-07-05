Received: from smtp153-168.sina.com.cn (smtp153-168.sina.com.cn [61.135.153.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 444B270813
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 08:21:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751703699; cv=none; b=OV8dIAR5Hd1tczY+XhvtyChvDDXuGo6ITEp+9cDAHipk6spwXfgC8HTUAZ8Xatq7iowjHR7PIhpTROS9coh4BT92RdzvQcdwy0EX3U/efJ19fasQhg2bEAGo7UWHR40U/orrplO40NLipZc5O9UwZ3OW73twLy16pjjp6cQYo/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751703699; c=relaxed/simple;
	bh=L+9pODuqq/ijOJU8ex+JwRkcoHZGpIJHB+hTtkEopAg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZSrK0IY8maXzuAunywUuNJX4zlIoxRQtvCswDYYft5bsMoodTbebdWSSf0gLL+0GKG+IPpQYhDVdf+PbFvknzQ0VyV6M+udJ+jpL4Jh0wLnyEXMZds+c/5LZ8+v9YROC/SnVWJ/SZ7NnlCrH4SZaR5GJDJTKLOOMQJPOx8K9Df0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=hcNB9Y/n; arc=none smtp.client-ip=61.135.153.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="hcNB9Y/n"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751703689;
	bh=zthT3jt8GIM/WAdNW204UEF6acnuYAzki0y2EbWl/Js=;
	h=From:Subject:Date:Message-ID;
	b=hcNB9Y/npKe+jnglLc8Iv2KqL/IwxYrwLnIla3uqMd0u3YDljVz3bPd0OtM6RYXfh
	 Zyy3VHue1oWMGdMrp6fFEXYgdMlSQvOLQehZ7NpJX30oIW2pyBSfoXIqL55jgxUk8d
	 d4CvrtskEx3Offgmye61PUtl3tc/8RMVi6qeE8jY=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 6868DFF50000677C; Sat, 5 Jul 2025 16:19:02 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 7747596685143
X-SMAIL-UIID: 0F3F1D7F0C55476C813FEECFBA0105ED-20250705-161902-1
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+6616bba359cec7a1def1@syzkaller.appspotmail.com>
Cc: linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [kernel?] WARNING in driver_unregister (2)
Date: Sat,  5 Jul 2025 16:18:49 +0800
Message-ID: <20250705081850.2552-1-hdanton@sina.com>
In-Reply-To: <68689a02.a00a0220.c7b3.002c.GAE@google.com>
References: 
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Date: Fri, 04 Jul 2025 20:20:34 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    c435a4f487e8 Merge tag 'riscv-for-linus-6.16-rc5' of git:/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=138f8f70580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5ba6cef8f153bfeb
> dashboard link: https://syzkaller.appspot.com/bug?extid=6616bba359cec7a1def1
> compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b8febc580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=118f6c8c580000

#syz test

--- x/drivers/comedi/drivers.c
+++ y/drivers/comedi/drivers.c
@@ -994,10 +994,13 @@ int comedi_device_attach(struct comedi_d
 	dev->board_name = dev->board_ptr ? *(const char **)dev->board_ptr
 					 : dev->driver->driver_name;
 	ret = driv->attach(dev, it);
-	if (ret >= 0)
+	if (ret >= 0) {
 		ret = comedi_device_postconfig(dev);
-	if (ret < 0) {
-		comedi_device_detach(dev);
+		if (ret < 0) {
+			comedi_device_detach(dev);
+			module_put(driv->module);
+		}
+	} else {
 		module_put(driv->module);
 	}
 	/* On success, the driver module count has been incremented. */
--
