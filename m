Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A34281343
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 15:38:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746545885; cv=none; b=Qzvv04+O4bxTsirVIoZHidtFzl+9DoW0yEbhvazUnBkyhnfK/WDur4FJGeVqx1M9+5zwjVbLJJsbrO444IOKpWFqBbn6VsvqoxgyX9goUqxtAucZvo6UojneFk6MhfruWkKcBpBgeYttyUp0IXpR5iZaT5UbuUGuTztECPWczCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746545885; c=relaxed/simple;
	bh=iZ0LSWRVTIwu/9wZFw4azv85LpaIlUxP4V6VI8Vp78w=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=n3PxlVmm7jEFfVcKhE6u1pSms/ybsxsWxk0SNwBd2sytvwkkmUHLQni6WkgWPTHNxI//1dXQtIiFtKwiwQ7cjC3LvNNYTWvC9PJUtvvOsw5zhY3zMlNg8LIYur2wXqhvLXwU+IB/wrENfWIkZxaN6JEd1Ii00UIL6UCOYebkXlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3d8a9b1c84eso74531635ab.2
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 08:38:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746545883; x=1747150683;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+SuKz/7sOY7LRHeHPW359MsxZJUDN+LcPS2aZ2/ZeGU=;
        b=Whl1Z/livV/vWYA7625jAejDcQhm04p5ziM3gvQsN2ZPf0q83asoXucmklAJ3exKwG
         6NDpJdqsjl8Kt43I3aUrkahtxTLlwFNazXWYJoluS+eC1wmVee8st3KEiyFDQodQDTcN
         gfhWbLjvhQ0Ga2IIxuFlR3jwZHa85nCXts52ziMsHlEtEh86848rI+dkmadODxhIZrbF
         7AHkxvQP/VZifu7a2l3QC/XyWq9FhbMWNpOqRNxUXojJxtvVnCp8RjeJBRCSx0R/diZv
         V8NqSEQ+wJmO7JXtKhpbsNhSYJBejwU3/q6mNv0XpoF/6XVvFDCNTId1tNppIYsWQxoi
         BO+Q==
X-Gm-Message-State: AOJu0YwPCrDRfWXXqLcHkEx9b/JBwb+ONOk98NLVwwAA5Nvc5c6TImIV
	KXX3JtBGLyFqb5gfFn56HnIc20GICMe+f6ooHPJvOTukMMjyCzrxycssiO3h4yCVC7SglkYY96t
	YiqnBCtU+xDPF4QNkIJqfDoU8bTviX0JxWP3u+8hiF7vLHwDLK6zc5nY=
X-Google-Smtp-Source: AGHT+IFWP8JH7O7F6P5X0f8/BxoHjr039jU2tmk4He+hG64uSO4s3HMbeuiEoE8sYw6seUoMpfIx+Mir166V6xAQvffQy7GD260c
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c242:0:b0:3d8:3b31:5046 with SMTP id
 e9e14a558f8ab-3da5b31ec06mr114618355ab.17.1746545883066; Tue, 06 May 2025
 08:38:03 -0700 (PDT)
Date: Tue, 06 May 2025 08:38:03 -0700
In-Reply-To: <20250506142010.802613-1-richard120310@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <681a2cdb.050a0220.a19a9.0010.GAE@google.com>
Subject: Re: [syzbot] [jfs?] KMSAN: uninit-value in BT_STACK_DUMP
From: syzbot <syzbot+ba5f49027aace342d24d@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, richard120310@gmail.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
KMSAN: use-after-free in dtSearch

loop0: detected capacity change from 0 to 32768
=====================================================
BUG: KMSAN: use-after-free in UniStrncmp_le fs/jfs/jfs_unicode.h:55 [inline]
BUG: KMSAN: use-after-free in dtCompare fs/jfs/jfs_dtree.c:3340 [inline]
BUG: KMSAN: use-after-free in dtSearch+0x1261/0x3d30 fs/jfs/jfs_dtree.c:650
 UniStrncmp_le fs/jfs/jfs_unicode.h:55 [inline]
 dtCompare fs/jfs/jfs_dtree.c:3340 [inline]
 dtSearch+0x1261/0x3d30 fs/jfs/jfs_dtree.c:650
 jfs_lookup+0x18b/0x5a0 fs/jfs/namei.c:1461
 lookup_one_qstr_excl_raw+0x204/0x5b0 fs/namei.c:1689
 lookup_one_qstr_excl fs/namei.c:1711 [inline]
 do_unlinkat+0x2e3/0xe50 fs/namei.c:4631
 __do_sys_unlink fs/namei.c:4689 [inline]
 __se_sys_unlink fs/namei.c:4687 [inline]
 __x64_sys_unlink+0x71/0xb0 fs/namei.c:4687
 x64_sys_call+0x29de/0x3db0 arch/x86/include/generated/asm/syscalls_64.h:88
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xd9/0x1b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was created at:
 slab_free_hook mm/slub.c:2324 [inline]
 slab_free mm/slub.c:4656 [inline]
 kmem_cache_free+0x286/0xf00 mm/slub.c:4758
 __d_free+0x43/0x60 fs/dcache.c:336
 rcu_do_batch kernel/rcu/tree.c:2568 [inline]
 rcu_core+0xa5a/0x21e0 kernel/rcu/tree.c:2824
 rcu_core_si+0x12/0x20 kernel/rcu/tree.c:2841
 handle_softirqs+0x166/0x6e0 kernel/softirq.c:579
 __do_softirq kernel/softirq.c:613 [inline]
 invoke_softirq kernel/softirq.c:453 [inline]
 __irq_exit_rcu+0x66/0x180 kernel/softirq.c:680
 irq_exit_rcu+0x12/0x20 kernel/softirq.c:696
 instr_sysvec_apic_timer_interrupt arch/x86/kernel/apic/apic.c:1049 [inline]
 sysvec_apic_timer_interrupt+0x84/0x90 arch/x86/kernel/apic/apic.c:1049
 asm_sysvec_apic_timer_interrupt+0x1f/0x30 arch/x86/include/asm/idtentry.h:702

CPU: 0 UID: 0 PID: 6979 Comm: syz.0.35 Not tainted 6.15.0-rc3-syzkaller-00094-g02ddfb981de8-dirty #0 PREEMPT(undef) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/29/2025
=====================================================


Tested on:

commit:         02ddfb98 Merge tag 'scsi-fixes' of git://git.kernel.or..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=134ee8f4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=9dc42c34a3f5c357
dashboard link: https://syzkaller.appspot.com/bug?extid=ba5f49027aace342d24d
compiler:       Debian clang version 20.1.2 (++20250402124445+58df0ef89dd6-1~exp1~20250402004600.97), Debian LLD 20.1.2
patch:          https://syzkaller.appspot.com/x/patch.diff?x=10efba70580000

