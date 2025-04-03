Received: from mail-io1-f78.google.com (mail-io1-f78.google.com [209.85.166.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF7B423ED53
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 07:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743663860; cv=none; b=id3iPwc0901P2mq+la3oRVuCm6XOh4gPPdflDSg/ISEn8/tn8oWryosFLSy6aD5vTB0lPMNTP3X9DUcOdx/9u5iOPg1/6S+mZa83ehsDDOQRFp3oeV7BNKxMNvrL4Fb5H5Ci7I8v0qC8hOEvORPOW+B9eo1Za+paQJ7DO6gLVEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743663860; c=relaxed/simple;
	bh=atUgTzXsaeC3dRMkaoBUId/Y+NIEHliKUbEIi9237/Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=lzZ0sBWRI3BLd5Rk+Vde+6yAN91gS5EKAzgzbiErTIV2BvECW5HQK4UF3PK/xcjLvph6HOTgNHtwYFk0oZ4q7xsNdn2W7FgGS8MC7QsfrjPcLgUjhuqajZf5gTphEQIDCmm+yifq2UBIZMBcDoBH3TZ1kS5Q5VBOKsY0S+KEk2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f78.google.com with SMTP id ca18e2360f4ac-85b53875729so168089839f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 00:04:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743663858; x=1744268658;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=41qFJQvtYOEgdXsNKiWCUQolljvfI1RxAoSFkmI6I4s=;
        b=YpQ1CRtLSgiBE5Iek/LtqU77ySFJlLD1b0nlI6xlecDhYk8qdS5TGK9hpTkdt7Moq3
         VTVu7Jj3jwNq7nQitpFK1rVkUOC0ZaGgBQX/eL6PlyIJc5yjNX9m9LOVwCLxYfV3j//4
         1OElJCSS7RpL+Y/vxDhhZU3PcTMLpAMJb/pQ/OD7S7axLoRKGFqbvnNZF0mnBO+ADg4Z
         +ue4aLigy9Afe6G9YnPpP1H3vE29cyMoO0R7I9ySaS4r/TXRGhMJcIsGP7ZVvK08yFFn
         jcgT92muW7cEkGLAie6QDgtaKr2ox8AFbobt3Z62MeusDS6Ds6v9gbB+1qibKemPMAJd
         NQPw==
X-Forwarded-Encrypted: i=1; AJvYcCX4sD2HbhTmMK1+8zd7ynaqQ+4WX8wm7XINz6SfBJkpYfliJjO2kk3wgYqzPem/9VRVf05xOup/KFcMFOw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXjJq8VigSBMYxOSuDA9oSIMsU4S3dzN/fLHKi9zW8S8+vUyn7
	2ThiEtHi9lfp2IB4Pc5s0oGb9ZASDo3lEfFzeiQokGX+M31UhgsE0CuS8Y4CAtgCWfEUHDlgyWv
	2g+iU/DDML3oPbQTzyvvdD1/j6apFbJx3bmKBQPPLQ/npjdYJz27ld+Q=
X-Google-Smtp-Source: AGHT+IEn8LjjklgQSVl25kDq+vbsbiVfvSYHd2OKkTF4Csfum0CQ3AYlbgYY3VMe9TJfCTAx4+caf+mnmn5lg+h1vWoAeUJ6R7Ez
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:d308:0:b0:3d2:b72d:a507 with SMTP id
 e9e14a558f8ab-3d6de7e5cb7mr8307925ab.19.1743663858030; Thu, 03 Apr 2025
 00:04:18 -0700 (PDT)
Date: Thu, 03 Apr 2025 00:04:18 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67ee32f2.050a0220.9040b.014d.GAE@google.com>
Subject: [syzbot] [io-uring?] KCSAN: data-race in io_req_task_cancel / io_wq_free_work
From: syzbot <syzbot+903a2ad71fb3f1e47cf5@syzkaller.appspotmail.com>
To: asml.silence@gmail.com, axboe@kernel.dk, io-uring@vger.kernel.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    92b71befc349 Merge tag 'objtool-urgent-2025-04-01' of git:..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11195404580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a8120cade23cf14e
dashboard link: https://syzkaller.appspot.com/bug?extid=903a2ad71fb3f1e47cf5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2e7df7bc2f52/disk-92b71bef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/be59123d5efb/vmlinux-92b71bef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c9eff86053e/bzImage-92b71bef.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+903a2ad71fb3f1e47cf5@syzkaller.appspotmail.com

==================================================================
BUG: KCSAN: data-race in io_req_task_cancel / io_wq_free_work

write to 0xffff888117207448 of 8 bytes by task 3861 on cpu 1:
 req_set_fail io_uring/io_uring.h:-1 [inline]
 io_req_defer_failed io_uring/io_uring.c:927 [inline]
 io_req_task_cancel+0x7c/0x1a0 io_uring/io_uring.c:1360
 io_handle_tw_list+0x194/0x1d0 io_uring/io_uring.c:1057
 tctx_task_work_run+0x6e/0x1c0 io_uring/io_uring.c:1121
 tctx_task_work+0x44/0x80 io_uring/io_uring.c:1139
 task_work_run+0x13c/0x1b0 kernel/task_work.c:227
 get_signal+0xee2/0x1080 kernel/signal.c:2809
 arch_do_signal_or_restart+0x9a/0x4b0 arch/x86/kernel/signal.c:337
 exit_to_user_mode_loop kernel/entry/common.c:111 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x62/0x120 kernel/entry/common.c:218
 do_syscall_64+0xd6/0x1c0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

read to 0xffff888117207448 of 8 bytes by task 3871 on cpu 0:
 req_ref_put_and_test io_uring/refs.h:22 [inline]
 io_wq_free_work+0x24/0x1b0 io_uring/io_uring.c:1799
 io_worker_handle_work+0x4c9/0x9f0 io_uring/io-wq.c:618
 io_wq_worker+0x277/0x850 io_uring/io-wq.c:669
 ret_from_fork+0x4b/0x60 arch/x86/kernel/process.c:153
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

value changed: 0x0000000000180051 -> 0x0000000000980111

Reported by Kernel Concurrency Sanitizer on:
CPU: 0 UID: 0 PID: 3871 Comm: iou-wrk-3861 Not tainted 6.14.0-syzkaller-12508-g92b71befc349 #0 PREEMPT(voluntary) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
==================================================================


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
