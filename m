Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DBD42AC17
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750818669; cv=none; b=PGpQtuOaXitPCJWp/33jOFM5/a1rMXvllpiuJLHQZt/8ZdQbe/QY2X+p3pl+40FR++JI76BudqVQW+8kGp9iDOlb8Z/2WGjTBYLnrFOa7BBxAWVsx6N0DDQjztfwLXIF5FUTFM0ZZFetU4199YbHY8213Ie8BadwD0GmXVS0ij4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750818669; c=relaxed/simple;
	bh=IUdUe4hErkyq7rIukicRJdTYRcOSNcyxjrYo1/6NGME=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MQxIAv4W3kjYbznJnv1QEZYmAWu9M9rqs1Sl3GeerFrcwNROcbk8nSOrinaAOuXJZ4ZHa1/E2ZT0grqR7ScDIOh7Iq7TMOD8OxIahDiZTgOqiOkjuyl54p++ZDSzFspIY12ROjFBHtxbpgJ2J3Cu1YiZLBbiZWAaTRLU0cTLk+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com; spf=pass smtp.mailfrom=fromorbit.com; dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b=iAHuSnv4; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fromorbit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fromorbit-com.20230601.gappssmtp.com header.i=@fromorbit-com.20230601.gappssmtp.com header.b="iAHuSnv4"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b2fd091f826so421249a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 19:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fromorbit-com.20230601.gappssmtp.com; s=20230601; t=1750818666; x=1751423466; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PlFlBhmq4Z1ZoYYptYfQua9omlg8L/n2hatyvmI4zwg=;
        b=iAHuSnv4ybBDJBU0vQnDdQJQ/iBokkvhyzEcjjN35tPkEOV+40+sawsiYAgaSuCNdG
         iFYInQ5eSfH55SxyxhbaedproHDVhc0uJbKg8c54PktH3nVTYcWwf3AUKdbagm64iq8m
         r9UdkyJi9hLxmk3//0ZJscQVVTrB36Qmx9unhgK9jfOgl9jekjo8V3whd7wGkI90K3iv
         UinVS0j2LioYxnUAPX5wcGCbAbe9uv42aR3Ta8ilKsRWSEzrAtY+BwkfW3crrkaEy/pE
         XVDPel148mvLJ0hAS7ozRQzeSoK9uGXpb0ReTNRf080hstaAnc0x/IPh3OB7G0XzDDsN
         2+7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750818666; x=1751423466;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PlFlBhmq4Z1ZoYYptYfQua9omlg8L/n2hatyvmI4zwg=;
        b=bo6HGJyZCmn++mWPIGDYro84UsRO2/yI+AYW4L7Zoe96EDAY2UfkECxB/ClDRM01Rp
         gXCOJLVTqLAy1u909uoTuhHiZLj0ikeSyTH1YLTxxOe7LD865aKqwtJ8pfTk5/r0LJvP
         SZqWpi1dMNPU9hGQFqT2u1O5avZt7NXcXgI1jlypuicMr6cOZ0ribegca+WGNqac6/hL
         roK/ruTmjGTAAVuMbsegOw2l0MVt9Gzn1Et/cKMQHGIvyXiFkgVq+gYHfqcCFOP2xWSI
         vp5jk4UFeAPOiTDDrtQg3dKw/i87Y0ErqDbVolE9AT/cBERRf1LusR8TbmzMVVNioaA9
         Aq2A==
X-Gm-Message-State: AOJu0YyATOPaIOxpLZQllZVUanCG5Bu9wWQE4x+TIDiRo09W2EC6HrE5
	LFKd12jmysGDxMQzJVFvnYBzZTk6WiD3ZTWcoTjpBuIEsc06TWvpKcLjqaKTt2kI+raNJE036e9
	2V+Pa
X-Gm-Gg: ASbGnctukAZlzj1JryE5wT6HQkohgrOLcr33vmEp7GSrD74HY/sXwsANmogwsvFcomG
	f0uImXEJlFdL/bp60oZi8B3F2d7aPBWakJjFlsWEItN6iBcLu1IcB6TgCRXgvHLhj/R20EqOorD
	t91HhXcxGXldOB+/opK9M/VsNI0Z82H/NpdxBi35D+O9bETtfAMCXgnOBLO4LK/LaNDpzjY+Ssv
	me/IJmX+zgrFsOzq53LL2LcCu+lLB/m9W38IZTQGCEKUoAZzzUOiEsOVc0IKwesqa67hQavjvMU
	1HfeaIaFG4jfKyXEIFhTrsx0JDuqteyV0JnkcvLg/SIE7CrOSNqJr3SAj9WNWH/ODJ7toZIBcle
	BfDygK5Tew+1FCwpNUPiA9bnS9bScrBK9dVuiqg==
X-Google-Smtp-Source: AGHT+IHQubcQFQyxX+XdrpV8bmffpY3w6wrf0qmeEnPO+gNB43O/5vNFbkkbBsRv5odZtcU9uhBxmA==
X-Received: by 2002:a17:90b:5145:b0:315:9624:37db with SMTP id 98e67ed59e1d1-315f22fc04cmr1832000a91.3.1750818666193;
        Tue, 24 Jun 2025 19:31:06 -0700 (PDT)
Received: from dread.disaster.area (pa49-180-184-88.pa.nsw.optusnet.com.au. [49.180.184.88])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53bc247sm426627a91.21.2025.06.24.19.31.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 19:31:05 -0700 (PDT)
Received: from dave by dread.disaster.area with local (Exim 4.98.2)
	(envelope-from <david@fromorbit.com>)
	id 1uUFug-00000002tpe-2zkc;
	Wed, 25 Jun 2025 12:31:02 +1000
Date: Wed, 25 Jun 2025 12:31:02 +1000
From: Dave Chinner <david@fromorbit.com>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>
Subject: [BUG v6.16-rc3] kernel oops in __migrate_swap_task
Message-ID: <aFtfZgcL66nq6TcY@dread.disaster.area>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi folks,

I had this happen once randomly on 6.16-rc2 but was messed up in
amongst a heap of failures, but I've now got a clean, single failure
on 6.16-rc3 that looks like this:

[11001.388660] BUG: kernel NULL pointer dereference, address: 00000000000004c8
[11001.392374] #PF: supervisor read access in kernel mode
[11001.394574] #PF: error_code(0x0000) - not-present page
[11001.396687] PGD 0 P4D 0
[11001.397821] Oops: Oops: 0000 [#1] SMP NOPTI
[11001.399507] CPU: 10 UID: 0 PID: 66 Comm: migration/10 Not tainted 6.16.0-rc3-dgc+ #342 PREEMPT(full)
[11001.403327] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[11001.407288] Stopper: multi_cpu_stop+0x0/0x120 <- migrate_swap+0x80/0x110
[11001.410066] RIP: 0010:__migrate_swap_task+0x31/0x1a0
[11001.412132] Code: 89 e5 41 57 41 56 53 48 89 fb 48 ff 87 60 03 00 00 41 89 f7 65 48 ff 05 7d 13 22 04 4c 8b b7 10 09 00 00 66 90 e8 ff db 05 00 0
[11001.419845] RSP: 0018:ffffc90006677d90 EFLAGS: 00010002
[11001.422015] RAX: ffff88810231d100 RBX: ffff888843982880 RCX: 000000000000392e
[11001.425316] RDX: 0000000075dcabe7 RSI: 0000000000000020 RDI: ffff888843982880
[11001.428559] RBP: ffffc90006677da8 R08: 0000000000000001 R09: 0000000000000090
[11001.431695] R10: 0000000000000080 R11: 00000000000000d0 R12: ffff88881fcab440
[11001.434781] R13: ffff88981fa2b440 R14: 0000000000000000 R15: 0000000000000020
[11001.437783] FS:  0000000000000000(0000) GS:ffff88889a6f1000(0000) knlGS:0000000000000000
[11001.441208] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11001.443645] CR2: 00000000000004c8 CR3: 000000013c31b000 CR4: 0000000000350ef0
[11001.446645] Call Trace:
[11001.447770]  <TASK>
[11001.448618]  migrate_swap_stop+0x16a/0x1d0
[11001.450458]  multi_cpu_stop+0xcd/0x120
[11001.452034]  ? __pfx_multi_cpu_stop+0x10/0x10
[11001.453895]  cpu_stopper_thread+0xdc/0x190
[11001.455631]  smpboot_thread_fn+0x150/0x230
[11001.457447]  kthread+0x20c/0x240
[11001.458824]  ? __pfx_smpboot_thread_fn+0x10/0x10
[11001.460760]  ? __pfx_kthread+0x10/0x10
[11001.462312]  ret_from_fork+0x77/0x140
[11001.463938]  ? __pfx_kthread+0x10/0x10
[11001.465570]  ret_from_fork_asm+0x1a/0x30
[11001.467272]  </TASK>
[11001.468233] Modules linked in:
[11001.469586] CR2: 00000000000004c8
[11001.471094] ---[ end trace 0000000000000000 ]---
[11001.473044] RIP: 0010:__migrate_swap_task+0x31/0x1a0
[11001.475112] Code: 89 e5 41 57 41 56 53 48 89 fb 48 ff 87 60 03 00 00 41 89 f7 65 48 ff 05 7d 13 22 04 4c 8b b7 10 09 00 00 66 90 e8 ff db 05 00 0
[11001.482744] RSP: 0018:ffffc90006677d90 EFLAGS: 00010002
[11001.484925] RAX: ffff88810231d100 RBX: ffff888843982880 RCX: 000000000000392e
[11001.487844] RDX: 0000000075dcabe7 RSI: 0000000000000020 RDI: ffff888843982880
[11001.490797] RBP: ffffc90006677da8 R08: 0000000000000001 R09: 0000000000000090
[11001.493740] R10: 0000000000000080 R11: 00000000000000d0 R12: ffff88881fcab440
[11001.496642] R13: ffff88981fa2b440 R14: 0000000000000000 R15: 0000000000000020
[11001.499579] FS:  0000000000000000(0000) GS:ffff88889a6f1000(0000) knlGS:0000000000000000
[11001.502873] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11001.505253] CR2: 00000000000004c8 CR3: 000000013c31b000 CR4: 0000000000350ef0
[11001.508155] note: migration/10[66] exited with irqs disabled

At this point, the system effectively hangs, and the only thing that
fires from here on is soft lockup warnings like so:

[11024.562203] watchdog: BUG: soft lockup - CPU#24 stuck for 22s! [xfs_io:3957707]
[11024.562211] Modules linked in:
[11024.562217] CPU: 24 UID: 0 PID: 3957707 Comm: xfs_io Tainted: G      D             6.16.0-rc3-dgc+ #342 PREEMPT(full)
[11024.562224] Tainted: [D]=DIE
[11024.562225] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
[11024.562228] RIP: 0010:pv_native_safe_halt+0xf/0x20
[11024.562238] Code: e3 8c 00 5d c3 cc cc cc cc cc cc 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 eb 07 0f 00 2d 41 eb 15 00 55 48 89 e5 fb f4 0
[11024.562241] RSP: 0018:ffffc90021ba7d60 EFLAGS: 00000246
[11024.562244] RAX: 0000000000000001 RBX: ffffffff83208044 RCX: 0000000000000000
[11024.562247] RDX: fffffffffffffff8 RSI: 0000000000000001 RDI: ffff88901fc2c214
[11024.562248] RBP: ffffc90021ba7d60 R08: ffff88901fc2c214 R09: 00000000412a7da6
[11024.562250] R10: 00007fe40e7a0000 R11: ffff8881603c0800 R12: 0000000000640000
[11024.562252] R13: ffff88889a631000 R14: ffff88901fc2c214 R15: ffff88901fc2c200
[11024.562259] FS:  0000000000000000(0000) GS:ffff88909a671000(0000) knlGS:0000000000000000
[11024.562261] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
[11024.562263] CR2: 00007fe40e82d3dc CR3: 00000001603c0000 CR4: 0000000000350ef0
[11024.562269] Call Trace:
[11024.562272]  <TASK>
[11024.562275]  kvm_wait+0x6b/0x80
[11024.562282]  __pv_queued_spin_lock_slowpath+0x173/0x430
[11024.562287]  queued_read_lock_slowpath+0x6f/0x120
[11024.562291]  _raw_read_lock+0x2b/0x40
[11024.562294]  mm_update_next_owner+0x53/0x270
[11024.562300]  exit_mm+0xa9/0x100
[11024.562303]  do_exit+0x1b9/0x980
[11024.562307]  do_group_exit+0x8f/0x90
[11024.562311]  __x64_sys_exit_group+0x17/0x20
[11024.562315]  x64_sys_call+0x2f60/0x2f60
[11024.562321]  do_syscall_64+0x6b/0x1f0
[11024.562325]  ? exc_page_fault+0x70/0xa0
[11024.562328]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[11024.562331] RIP: 0033:0x7fe40eb04295

I don't know exactly what triggers it, except to say I'm running the
parallel variant of fstests with 64 concurrent tests being run.
These tests are in parallel with operations like random CPU hotplug,
memory migration, cache dropping, etc whilst there may be thousands
of processes executing filesystem stress across more than a hundred
mounted filesystems on loop devices.

This is not reproducable on 6.15.0, so it is likely a regression
introduced in the 6.16 merge window....

-Dave.
-- 
Dave Chinner
david@fromorbit.com
