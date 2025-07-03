Received: from smtp153-166.sina.com.cn (smtp153-166.sina.com.cn [61.135.153.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07674A2D
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 00:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751501413; cv=none; b=DkFGTAmra6AfchJrnh0TUSWeyuZ2mEEQacQ6u21Ig3WmEhmVOXiiLfrNCdPs0n8PNYG+0zy3TDR0EFmSs/1Foorsc0MU6I1tpGSClgj8bJRok+Z/HDvaKqE1shXlNFuqFQx6iYCLefyIVJ/u2GvaCH7DPEwwkcprppvrWYPlm7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751501413; c=relaxed/simple;
	bh=rRPioumneuiJaVlhzjVZhRS9MlUjEeHTutmHxkuuMrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LrZEsCdn+IKukDa47sdsNln0NHoxokTk5ghGHFSR2VToLvKGr2L6P7ZZSb9SluAgBqVx7ad6S7dPTIddh+ZaoY/zBik4WtZ7il+pAon7gt/GKeSd55t4CClvX5j88wFbTbb1Zp+y8iOfNGL9Cl0VyWcu35fCBB12UuFte652Vqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ZBoHmU5B; arc=none smtp.client-ip=61.135.153.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ZBoHmU5B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1751501406;
	bh=6m40dybLDUQecOAnZiZrJZiryDjKCDJTyHboSV03wXA=;
	h=From:Subject:Date:Message-ID;
	b=ZBoHmU5B/teard6miBHBnZeg+LCnkfglt2V3HTavUlBjYsX34bnZgrgI4ED7hH5cO
	 Uj/Xyqm3QIMvFJLPz4XX8ujHej0WBIdK76s4pCKw4HF/dRGTthoLKaVMIlprEag6tn
	 HEmoW08PPU1YiDGA9VfWBHxCYhcr5Y6zUsrUJqoI=
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.33) with ESMTP
	id 6865CA5400002D5F; Thu, 3 Jul 2025 08:09:58 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 313486685340
X-SMAIL-UIID: F0653F4ED50045D6A8531C61B87761C7-20250703-080958-1
From: Hillf Danton <hdanton@sina.com>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
	Boqun Feng <boqun.feng@gmail.com>,
	linux-usb@vger.kernel.org,
	syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
Date: Thu,  3 Jul 2025 08:09:45 +0800
Message-ID: <20250703000946.2200-1-hdanton@sina.com>
In-Reply-To: <fc5f7057-1c91-4354-89d5-f8bdeeae988a@rowland.harvard.edu>
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com> <20250702080515.2160-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, 2 Jul 2025 10:34:51 -0400 Alan Stern wrote:
> On Wed, Jul 02, 2025 at 04:05:14PM +0800, Hillf Danton wrote:
> > On Tue, 01 Jul 2025 17:50:28 -0700
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
> > > git tree:       linux-next
> > > console output: https://syzkaller.appspot.com/x/log.txt?x=10d1f88c580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=d630bd89141124cc543e
> > > compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
> > > 
> > > Unfortunately, I don't have any reproducer for this issue yet.
> > > 
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/b005e1db0f8c/disk-1343433e.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/cb3aa8bfd514/vmlinux-1343433e.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/e01227599a09/bzImage-1343433e.xz
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com
> > > 
> > > INFO: task kworker/0:0:9 blocked for more than 143 seconds.
> > >       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > task:kworker/0:0     state:D stack:21240 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00004000
> > > Workqueue: events_power_efficient hub_init_func2
> > > Call Trace:
> > >  <TASK>
> > >  context_switch kernel/sched/core.c:5313 [inline]
> > >  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
> > >  __schedule_loop kernel/sched/core.c:6774 [inline]
> > >  schedule+0x165/0x360 kernel/sched/core.c:6789
> > >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6846
> > >  __mutex_lock_common kernel/locking/mutex.c:679 [inline]
> > >  __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:747
> > >  device_lock include/linux/device.h:884 [inline]
> > >  hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
> > >  process_one_work kernel/workqueue.c:3239 [inline]
> > >  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
> > >  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
> > >  kthread+0x70e/0x8a0 kernel/kthread.c:463
> > >  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
> > >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> > >  </TASK>
> > 
> > Due to lockdep_set_novalidate_class(&dev->mutex) in device_initialize(),
> > task hung instead of deadlock is reported once more.
> > 
> > 	kworker/0:0:9		kworker/0:5:5923
> > 	---			---
> > 	hub_init_func2()	usb_disconnect()
> > 				device_lock()
> > 	device_lock()		hub_disconnect()
> > 				hub_quiesce()
> > 				flush_delayed_work(&hub->init_work);
> > 	*** DEADLOCK ***
> 
> This analysis looks right.  How would you fix the deadlock?  Make 
> hub_disconnect do device_unlock() and device_lock() around the 
> flush_delayed_work() call?
> 
I will try it once a reproducer is available.

Hillf

> Alan Stern
