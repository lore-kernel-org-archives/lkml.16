Received: from mail-il1-f206.google.com (mail-il1-f206.google.com [209.85.166.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64BB241686
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 09:35:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751448940; cv=none; b=BOns0hK+n+BwGMgdTM7KSA+5XhAqorAp1oCyfWBRY/nwBfOyu6boPnhDtGCZdcsKD0nsISx0g80qLpptWVCY8y9fo9LAfqh434iEy9egAD678PVc6aMzyf7irFJZIbMsz3R5uMPIKDQGv8iuRUaWfQ+VXxPlupOumdfc04PpmGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751448940; c=relaxed/simple;
	bh=EvuZl2knE0j7t8cUbaeJ8ujnFHylB01hdfBrvqBRd8w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=sitnAfGIklxIMBxmLkjLc7wUN1vIUsym0I36OkHZn9Gh2h7c+YsS0Kot/zIo6qeJ4jLBsxiIl35eKj4XbN1KXucy6/yBRVvtLBQbnoRC2hbzXGXQW9z4E8HRXrwoAyjVJR3GnW2bOgCfB35inIS8x5n1ipk73PeCai4rafdGPgg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f206.google.com with SMTP id e9e14a558f8ab-3ddd03db21cso109096765ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 02:35:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751448935; x=1752053735;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G2En1hXley+fxQo5rpUH2NJQOiOQEVb0XdKHRU1z3f8=;
        b=dODoYYZ3b8fv5ZY2oa5D5JzbPf1xaILV+OK3rKquUJwavI1Fg5kHe4+bezr7VuAUF9
         2opuAIjH0lkpIAWJh1pkL5Z/Quqk8SFAI+sKqG7YPvSbIxX12QRjMD+0rxziyD9IBUWQ
         Zb6uon9A7Drx9/iiykxdLXRFwN93ab88Mji1mQyY3iquTbI/bn/bBcrbUGq5b0zUf12q
         vo4ZwITdesFhSgz4nk0wQYu010bPtoV1Hel3hX3LSyPpTNhIMZGo/iollqFnq88zf/cx
         K6TxcmqZzPYhIe5E/FwvinYptTHp+AUywn312lfHZPyN76moThyU5d5c/BL+kYZx+S0Q
         pjFg==
X-Forwarded-Encrypted: i=1; AJvYcCXJWPPXiEsk/BJs+IvsoforM/0NikUR83t33ooeqRKfFDq5k5idp/kXQ7VXvIV/G+mCRoszcQnLpQvcjow=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDbtUiyuaINWavAiwbEez19ERYZPb0jROszcbl+WdjXzA4tTRE
	8GMz9whDtRx8VF3PHf5niFaiMlU4XGUcn36IHssSbpoRJXBbD6uOizncfjdYkdPKG9HD5BiOyxM
	bb6x1efEyTBEJvhTC+TXdLJ4QmLlgaRs8TcIR4iYhosbg0GfWA+YMc30cGR0=
X-Google-Smtp-Source: AGHT+IGOwgqtQXVq/SOJsn5wzbxhsly3b3TRegT50bh0lPh/Uo+hBuHy7fpVLeB6K5mDZ1UUipxoDp0STStsnECa5peVpXIvGbvP
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:74a:b0:3dd:b5ef:4556 with SMTP id
 e9e14a558f8ab-3e054a307fbmr28048315ab.18.1751448934879; Wed, 02 Jul 2025
 02:35:34 -0700 (PDT)
Date: Wed, 02 Jul 2025 02:35:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6864fd66.a70a0220.3b7e22.22ba.GAE@google.com>
Subject: [syzbot] [tipc?] general protection fault in tipc_conn_close (4)
From: syzbot <syzbot+c9964a461e912b0e41a6@syzkaller.appspotmail.com>
To: davem@davemloft.net, edumazet@google.com, horms@kernel.org, 
	jmaloy@redhat.com, kuba@kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, pabeni@redhat.com, syzkaller-bugs@googlegroups.com, 
	tipc-discussion@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    aaf724ed6926 Merge tag 'v6.16-rc3-smb3-client-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13df4982580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4ad206eb0100c6a2
dashboard link: https://syzkaller.appspot.com/bug?extid=c9964a461e912b0e41a6
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/46fd31cc8b63/disk-aaf724ed.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6a4ede98a00a/vmlinux-aaf724ed.xz
kernel image: https://storage.googleapis.com/syzbot-assets/9ec9bec36dfc/bzImage-aaf724ed.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c9964a461e912b0e41a6@syzkaller.appspotmail.com

HfR: left promiscuous mode
Oops: general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN PTI
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 0 UID: 0 PID: 16606 Comm: kworker/u10:0 Tainted: G     U              6.16.0-rc3-syzkaller-00306-gaaf724ed6926 #0 PREEMPT(full) 
Tainted: [U]=USER
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: netns cleanup_net
RIP: 0010:tipc_conn_close+0x48/0x1c0 net/tipc/topsrv.c:158
Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 5b 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 08 48 8d 7d 18 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 45 01 00 00 4c 8b 6d 18 49 8d ad d8 03 00 00 48
RSP: 0018:ffffc9000ba3fa58 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88805234ac00 RCX: 0000000000000007
RDX: 0000000000000003 RSI: ffffffff8b1ed264 RDI: 0000000000000018
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff90a82757 R11: 0000000000000001 R12: ffff8881457a4c58
R13: ffffed1028af4993 R14: ffff88805234ac08 R15: ffff88805234ac00
FS:  0000000000000000(0000) GS:ffff88812475f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fffbf822d88 CR3: 0000000031fe6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 tipc_topsrv_stop net/tipc/topsrv.c:708 [inline]
 tipc_topsrv_exit_net+0x146/0x3b0 net/tipc/topsrv.c:730
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x2eb/0xab0 net/core/net_namespace.c:253
 cleanup_net+0x408/0x890 net/core/net_namespace.c:686
 process_one_work+0x9cc/0x1b70 kernel/workqueue.c:3238
 process_scheduled_works kernel/workqueue.c:3321 [inline]
 worker_thread+0x6c8/0xf10 kernel/workqueue.c:3402
 kthread+0x3c5/0x780 kernel/kthread.c:464
 ret_from_fork+0x5d4/0x6f0 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:tipc_conn_close+0x48/0x1c0 net/tipc/topsrv.c:158
Code: fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 5b 01 00 00 48 b8 00 00 00 00 00 fc ff df 48 8b 6b 08 48 8d 7d 18 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 45 01 00 00 4c 8b 6d 18 49 8d ad d8 03 00 00 48
RSP: 0018:ffffc9000ba3fa58 EFLAGS: 00010206
RAX: dffffc0000000000 RBX: ffff88805234ac00 RCX: 0000000000000007
RDX: 0000000000000003 RSI: ffffffff8b1ed264 RDI: 0000000000000018
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000001
R10: ffffffff90a82757 R11: 0000000000000001 R12: ffff8881457a4c58
R13: ffffed1028af4993 R14: ffff88805234ac08 R15: ffff88805234ac00
FS:  0000000000000000(0000) GS:ffff88812475f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f1017b8bf98 CR3: 000000004ec58000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess), 3 bytes skipped:
   0:	48 c1 ea 03          	shr    $0x3,%rdx
   4:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   8:	0f 85 5b 01 00 00    	jne    0x169
   e:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  15:	fc ff df
  18:	48 8b 6b 08          	mov    0x8(%rbx),%rbp
  1c:	48 8d 7d 18          	lea    0x18(%rbp),%rdi
  20:	48 89 fa             	mov    %rdi,%rdx
  23:	48 c1 ea 03          	shr    $0x3,%rdx
* 27:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2b:	0f 85 45 01 00 00    	jne    0x176
  31:	4c 8b 6d 18          	mov    0x18(%rbp),%r13
  35:	49 8d ad d8 03 00 00 	lea    0x3d8(%r13),%rbp
  3c:	48                   	rex.W


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
