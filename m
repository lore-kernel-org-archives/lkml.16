Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9338C11
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 01:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.181.97.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751505647; cv=none; b=FJ7XlAt2hSiy5xsbrZpaL+9x5Ujnjd/5babixYYsnYfRGsao8dSvxj3YaXyJIDY+wOfHP4zJdTrXr370o/RWV7p6iXnKMZnGInWpdcGfflcHOY/SsU/ztzcsQ8wYlymq7H9drJzF97aGWeQKhOMiPkRz4D9Ftcjd1LiQeHCkEtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751505647; c=relaxed/simple;
	bh=qVu169YXutsP5idfgw0BMxFuAfndl6k77f83xodGXoY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nLkfipbdIcAWYcINP0A/dAL5Wpg4BfWgFnk0M2a86y7sCiQLSvXtg5EgSy+z78+Qks1Flwl9HkQ85fVxhwhbUnChsw2din38ZlAlBD6yzDDflXltAM+NCMw5MNX/JixwJetsgp6UmlVMDyV2ic2pLyGfzzJTcwg2Lz9f5vSqCmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp; arc=none smtp.client-ip=202.181.97.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=I-love.SAKURA.ne.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=I-love.SAKURA.ne.jp
Received: from www262.sakura.ne.jp (localhost [127.0.0.1])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 5631Kaf7023377;
	Thu, 3 Jul 2025 10:20:36 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from [192.168.1.6] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 5631KaYa023373
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 3 Jul 2025 10:20:36 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d73e0c09-b71e-40c9-af60-86b0dd6258e8@I-love.SAKURA.ne.jp>
Date: Thu, 3 Jul 2025 10:20:37 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [syzbot] [usb?] INFO: task hung in hub_activate (3)
To: Hillf Danton <hdanton@sina.com>, Alan Stern <stern@rowland.harvard.edu>,
        Mark Brown <broonie@kernel.org>,
        Mathias Nyman <mathias.nyman@linux.intel.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: syzbot <syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        Boqun Feng <boqun.feng@gmail.com>, linux-usb@vger.kernel.org,
        syzkaller-bugs@googlegroups.com
References: <68648254.a70a0220.3b7e22.20c4.GAE@google.com>
 <20250702080515.2160-1-hdanton@sina.com>
 <20250703000946.2200-1-hdanton@sina.com>
Content-Language: en-US
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <20250703000946.2200-1-hdanton@sina.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Anti-Virus-Server: fsav401.rs.sakura.ne.jp
X-Virus-Status: clean

On 2025/07/03 9:09, Hillf Danton wrote:
> On Wed, 2 Jul 2025 10:34:51 -0400 Alan Stern wrote:
>> On Wed, Jul 02, 2025 at 04:05:14PM +0800, Hillf Danton wrote:
>>> On Tue, 01 Jul 2025 17:50:28 -0700
>>>> Hello,
>>>>
>>>> syzbot found the following issue on:
>>>>
>>>> HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
>>>> git tree:       linux-next
>>>> console output: https://syzkaller.appspot.com/x/log.txt?x=10d1f88c580000
>>>> kernel config:  https://syzkaller.appspot.com/x/.config?x=66357ac5b0466f16
>>>> dashboard link: https://syzkaller.appspot.com/bug?extid=d630bd89141124cc543e
>>>> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6
>>>>
>>>> Unfortunately, I don't have any reproducer for this issue yet.
>>>>
>>>> Downloadable assets:
>>>> disk image: https://storage.googleapis.com/syzbot-assets/b005e1db0f8c/disk-1343433e.raw.xz
>>>> vmlinux: https://storage.googleapis.com/syzbot-assets/cb3aa8bfd514/vmlinux-1343433e.xz
>>>> kernel image: https://storage.googleapis.com/syzbot-assets/e01227599a09/bzImage-1343433e.xz
>>>>
>>>> IMPORTANT: if you fix the issue, please add the following tag to the commit:
>>>> Reported-by: syzbot+d630bd89141124cc543e@syzkaller.appspotmail.com
>>>>
>>>> INFO: task kworker/0:0:9 blocked for more than 143 seconds.
>>>>       Not tainted 6.16.0-rc4-next-20250630-syzkaller #0
>>>> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
>>>> task:kworker/0:0     state:D stack:21240 pid:9     tgid:9     ppid:2      task_flags:0x4208060 flags:0x00004000
>>>> Workqueue: events_power_efficient hub_init_func2
>>>> Call Trace:
>>>>  <TASK>
>>>>  context_switch kernel/sched/core.c:5313 [inline]
>>>>  __schedule+0x16f5/0x4d00 kernel/sched/core.c:6696
>>>>  __schedule_loop kernel/sched/core.c:6774 [inline]
>>>>  schedule+0x165/0x360 kernel/sched/core.c:6789
>>>>  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6846
>>>>  __mutex_lock_common kernel/locking/mutex.c:679 [inline]
>>>>  __mutex_lock+0x724/0xe80 kernel/locking/mutex.c:747
>>>>  device_lock include/linux/device.h:884 [inline]
>>>>  hub_activate+0xb7/0x1ea0 drivers/usb/core/hub.c:1096
>>>>  process_one_work kernel/workqueue.c:3239 [inline]
>>>>  process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3322
>>>>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3403
>>>>  kthread+0x70e/0x8a0 kernel/kthread.c:463
>>>>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>>>>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>>>>  </TASK>
>>>
>>> Due to lockdep_set_novalidate_class(&dev->mutex) in device_initialize(),
>>> task hung instead of deadlock is reported once more.
>>>
>>> 	kworker/0:0:9		kworker/0:5:5923
>>> 	---			---
>>> 	hub_init_func2()	usb_disconnect()
>>> 				device_lock()
>>> 	device_lock()		hub_disconnect()
>>> 				hub_quiesce()
>>> 				flush_delayed_work(&hub->init_work);
>>> 	*** DEADLOCK ***
>>
>> This analysis looks right.  How would you fix the deadlock?  Make 
>> hub_disconnect do device_unlock() and device_lock() around the 
>> flush_delayed_work() call?
>>
> I will try it once a reproducer is available.

Caused by commit 9bd9c8026341 ("usb: hub: Fix flushing of delayed work
used for post resume purposes") with cc: stable.
Shouldn't we revert that commit and seek for a different approach
than wait for a reproducer?

