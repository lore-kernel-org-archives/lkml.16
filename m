Received: from mail-io1-f77.google.com (mail-io1-f77.google.com [209.85.166.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B25C3232
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:13:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747401204; cv=none; b=VmUNMaa0+Ns0O3kTVLH2QADJ/UuyqKtG6JVTYAg6q8eYE9q0FAEXBZL07WTkhekTazkKeK873IXSssUPgncJZC7HUSx4X3csN1f4yJLdJm/XWy3kz3ZmKO9Nl4sjVHWyjMhx/rRKKl9R8C2GnPVHBDUNvMtyZjcDJt+BWIOZMVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747401204; c=relaxed/simple;
	bh=4Be/SwdbUI4CkZo/E5jXV7GgCfBnXclw74Qbc9akOck=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=P7iZqDe3Wk4EAZTEwB42yR0g5/DPymj3kCL/Gs+nTUR6yb+yxd5gOeWz3UOje4DXqzRzuvnCf15KkcooexHf/y/Asez2rYwQ2Hhuca2EO82NUN/VtplPA7Dcvof31SJQ4kLjxOhISAe0p47kJRtTFKXwH1MUPwd3MmpPHfanFVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f77.google.com with SMTP id ca18e2360f4ac-85b53875729so381137439f.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:13:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747401202; x=1748006002;
        h=to:from:subject:message-id:in-reply-to:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SbOF1pcM2hRYQ2OKu0CovxeSTceMmtEFbHdpm3t5ORM=;
        b=R/hbQqlbJgpuaBWBG9aQMwj0DFl53Cv0RVwDTCCoerr5Y5n4jb/B7sUbUaLtIXk7rM
         cU1hoLIfssk/d7tSxe571iCj5R9yjOla6LnJDoIbJt+6iQQsjeWGAUKElT5A5rymFnXI
         XdIN/qqra7RFOhveqAACV79+kMFUISVLbtUQVZ3/wt+NGlF0Up7LQH1U53B4B8nIGZew
         EIWHlcITXD4MSyq/5TZsXHHGYTMDqSORgMK29KucSLFEZsBSuq+3EbVIaTy2DYERik0y
         SJE9yKjIxCK8mnb00AExwQ/KgnD55cethbYEFmS8xpkn/6jeUPiCqBAOYPVibbWwcutl
         vESg==
X-Gm-Message-State: AOJu0YzZ6H5Qstnd5kQWqrBlICD6hpRxWt0bgfp1n2l3Y3oqVf6RWwgR
	gtnA1jcYnY6H5gpw5i9WZErxpkj9HLHEr0ZXau8uPF3bE0swEWs/jrxgIR7krjI31wYuu8B8LDs
	AuC7bqdi/09TPsgmS6uEqvcmXjq4dWUZgV9A4Hj/SDEwlk5fG0UgMWM45+0IWuA==
X-Google-Smtp-Source: AGHT+IHgFuUg7mgDRS4RYqxjJJDjLhEjGTEQCwB66JREykJ+xaJ0zBD70cu10cBWfN9jMYUr+TSVdyKV4ITSFHVhPOCVHXSKreU/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:3887:b0:867:d48:342b with SMTP id
 ca18e2360f4ac-86a2322a7e1mr233264339f.11.1747401202209; Fri, 16 May 2025
 06:13:22 -0700 (PDT)
Date: Fri, 16 May 2025 06:13:22 -0700
In-Reply-To: <67ddd191.050a0220.25ae54.006b.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <682739f2.a00a0220.398d88.020c.GAE@google.com>
Subject: Re: [syzbot] Re: [syzbot] [mptcp?] WARNING in mptcp_do_fallback
From: syzbot <syzbot+5cf807c20386d699b524@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org.

***

Subject: Re: [syzbot] [mptcp?] WARNING in mptcp_do_fallback
Author: matttbe@kernel.org

Hello,

(keeping only MPTCP and syzbot people, to reduce the noise)

On 21/03/2025 21:52, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    a7f2e10ecd8f Merge tag 'hwmon-fixes-for-v6.14-rc8/6.14' of..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=101d1e98580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=27515cfdbafbb90d
> dashboard link: https://syzkaller.appspot.com/bug?extid=5cf807c20386d699b524
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-a7f2e10e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/d3ebf10742dc/vmlinux-a7f2e10e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/ec059da4f420/bzImage-a7f2e10e.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+5cf807c20386d699b524@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5347 at net/mptcp/protocol.h:1202 __mptcp_do_fallback net/mptcp/protocol.h:1202 [inline]
> WARNING: CPU: 0 PID: 5347 at net/mptcp/protocol.h:1202 mptcp_do_fallback+0x244/0x360 net/mptcp/protocol.h:1223
> Modules linked in:
> CPU: 0 UID: 0 PID: 5347 Comm: syz.0.0 Not tainted 6.14.0-rc7-syzkaller-00074-ga7f2e10ecd8f #0
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
> RIP: 0010:__mptcp_do_fallback net/mptcp/protocol.h:1202 [inline]
> RIP: 0010:mptcp_do_fallback+0x244/0x360 net/mptcp/protocol.h:1223
> Code: 1c cd f5 48 83 c4 10 5b 41 5c 41 5d 41 5e 41 5f 5d c3 cc cc cc cc e8 cb 1c cd f5 90 0f 0b 90 e9 5b fe ff ff e8 bd 1c cd f5 90 <0f> 0b 90 e9 e1 fe ff ff 89 d9 80 e1 07 fe c1 38 c1 0f 8c 1e fe ff
> RSP: 0018:ffffc9000d4b75b8 EFLAGS: 00010293
> RAX: ffffffff8bf4c3c3 RBX: ffff888053250930 RCX: ffff888000d7a440
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff8bf4c283 R09: 1ffff1100a64a126
> R10: dffffc0000000000 R11: ffffed100a64a127 R12: ffff888053250948
> R13: dffffc0000000000 R14: ffff888042efd940 R15: ffff888053250000
> FS:  00007f03895756c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f0389574fe0 CR3: 0000000042c44000 CR4: 0000000000352ef0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  subflow_finish_connect+0x462/0x14e0 net/mptcp/subflow.c:548
>  tcp_finish_connect+0xc4/0x620 net/ipv4/tcp_input.c:6343
>  tcp_rcv_synsent_state_process net/ipv4/tcp_input.c:6573 [inline]
>  tcp_rcv_state_process+0x26aa/0x44e0 net/ipv4/tcp_input.c:6794
>  tcp_v4_do_rcv+0x77d/0xc70 net/ipv4/tcp_ipv4.c:1941
>  sk_backlog_rcv include/net/sock.h:1122 [inline]
>  __release_sock+0x214/0x350 net/core/sock.c:3123
>  release_sock+0x61/0x1f0 net/core/sock.c:3677
>  mptcp_connect+0x86b/0xc30 net/mptcp/protocol.c:3810
>  __inet_stream_connect+0x262/0xf30 net/ipv4/af_inet.c:677
>  inet_stream_connect+0x65/0xa0 net/ipv4/af_inet.c:748
>  __sys_connect_file net/socket.c:2045 [inline]
>  __sys_connect+0x288/0x2d0 net/socket.c:2064
>  __do_sys_connect net/socket.c:2070 [inline]
>  __se_sys_connect net/socket.c:2067 [inline]
>  __x64_sys_connect+0x7a/0x90 net/socket.c:2067
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f038878d169
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007f0389575038 EFLAGS: 00000246 ORIG_RAX: 000000000000002a
> RAX: ffffffffffffffda RBX: 00007f03889a6160 RCX: 00007f038878d169
> RDX: 0000000000000010 RSI: 0000200000000000 RDI: 0000000000000005
> RBP: 00007f038880e2a0 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 0000000000000001 R14: 00007f03889a6160 R15: 00007ffcae617168
>  </TASK>

I suggest closing this one: syzbot only saw it once in ~2 months, and my
syzbot machines, using different kernel config and targetting mainly
MPTCP, didn't manage to reproduce it either.

An analysis has been started there:

  https://github.com/multipath-tcp/mptcp_net-next/issues/555

Note that the warning is there because mptcp_do_fallback() should not be
called twice for the same MPTCP socket, but the code is supposed to
handle that case anyway, just in case. So no critical issue here I
guess. Let's close it. If we can reproduce it later, we can continue the
analysis started on the ticket #555.

#syz invalid

Cheers,
Matt
-- 
Sponsored by the NGI0 Core fund.

