Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A2A93196BE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 15:44:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751471094; cv=none; b=hiE8OfUwp2PkuumuYanbqkyifcWli5f3oXuv2mkoDggN8UEWoLSZO8fUSvfC86eYKrdoSHm23sZkSoZPNHe59wKow96Rbw5L4+xdzB9fpnKLrX/G9n7/XolhAMJWbkG/aFW7PyJkjQP2zn9u21o4tjw7fRBmTAUXWl8KUGZVoUE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751471094; c=relaxed/simple;
	bh=YCbLzO2wYS3//2Qehk6fuJAkHun6mfPhJWG+xcpPfEc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mQadihRFTfX+aXcIdWBzsUxPMlqH003Fd4P4OOhyeYS7CSW8Yd89b17nqFhUOTUqzM5WFKSRMEbARrDeqiJirWcVUwUKYFF4QQMyncEO/oCi4nPlrtk1ahfONG3al30Aw6xh4KZB7YWALI7KL37jzz6LW38IiIg6W88oF4nakH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ej10VMy/; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ej10VMy/"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a7fc24ed5cso774061cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 08:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751471092; x=1752075892; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DbkgKAmn+bi83qToikKwXJbsURjKG4A8Na3XWw3iFiw=;
        b=Ej10VMy/P5g0VHzwvJedrhms5z096pxb0XoLy1W3A3D9AvV36KMfnZVHLSj8IJRGag
         kKiQHMY8yPDoF0wu0mqbg5Pjh2nlNuK8LCaJxFFuPhB0tWz0WeGnkaQJcaBYYNkdJxIv
         GVi7X1k/pytrEl+akwtg/6E0IZwvchgWVL8jufOcvwEowh9U0+Isn8NkLYM8WCd7244u
         G66OQWwGflqlzMkRyb/+x9kHEs4psGb5g+8v0zmQlRkj5J7GxI7LObKR1josjpMVNWxL
         J/wjWx0waGtZe9yPf/VCEONU98BysiBBmSHYsMNllOxUGdR83nIEoZBcGrfD4F4r+M0c
         qDQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751471092; x=1752075892;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DbkgKAmn+bi83qToikKwXJbsURjKG4A8Na3XWw3iFiw=;
        b=n6HZLX2T9zceWEKd4x3Q/usNomRMlMEz8OXh0HLrG2DEbA+cXALrtoZclyIbPZNNGU
         QJBL55kNtF265mV+diJLbkhwgiViV/OmEKQ+CKl8/JmIG2YUsAUHG1ccU405onl/COnm
         gv8qqGeFIEEMi2yrfDRbJ9tG+hjsTvmG7A3TmO/11esYb6GUl4hUTVRSPySP3zadO0nZ
         /q8scxsWxKdK7HDemfuE3nWGsw5kYSUVBSGXcuEbIt7lhDlGvKgt3S4o2rijv9nkCtqe
         kQ1Sx23DcggbSz/QVsdmhYqrJi5IEZUPgEEe5mn7NuyPRhmVi6f7k8OrfRle74DvLkUW
         RKXA==
X-Forwarded-Encrypted: i=1; AJvYcCWEGSeB6S7bYMxaD/bVmIC+eXU1PknnnHYkHGSk1KPifPrsFs1UTcVWC6i8jsqYau2/MKnx/2FcoK9+o88=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ1gr1aOEViFMQOP6NbzXL7OsW2YBAWj4iNDoUxkI4x4LnyKHF
	rn7P7mN1Exqc+YGMZ8C8WF5bbY/fa+vAro44KTnTas72VCL1+vHy2otUlLTxpuudWPCitlFgY/m
	UeQyHLbiofIijLk8KAJUbBvd+NfEOVQ2enpCNjTofQ3wnShFToUoMFMJRfsw=
X-Gm-Gg: ASbGncv+NYUIDuI74Gg7z3RmcG7YLigm91ODHQIGgPxsXoXCJokWsQCzJeCKUeY/oHY
	Ee8K1ORZsfDykXLZf47MHtf1WD3q3UM/TcQVk70FbVwL5JdETv+iu2CBJg2DAU3UjDRm9cb2bv8
	StEsmK+eT1tUTnmBp7Or/fGfl42IwGUdI2+a+rPE+KOmww6AI7e6qoSmW/g5DYvinkFVVahKojC
	Q==
X-Google-Smtp-Source: AGHT+IF9K98cF53a+pYco5VOjQL0HtaJlcByUglJqIfWiMRZlfedcgCTMIzFAduG9eRjJKaNCGzSjeHkykglvcX+ZXg=
X-Received: by 2002:ac8:5fc3:0:b0:497:75b6:e542 with SMTP id
 d75a77b69052e-4a8729eba61mr10461931cf.10.1751471091497; Wed, 02 Jul 2025
 08:44:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <686502ff.a70a0220.3b7e22.22bb.GAE@google.com>
In-Reply-To: <686502ff.a70a0220.3b7e22.22bb.GAE@google.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 2 Jul 2025 08:44:39 -0700
X-Gm-Features: Ac12FXxuVbjMEgFeB6o_JUnN5Ff0OQjNdPtWGelS13ALdGILBrckYpSiZUBC6GM
Message-ID: <CAJuCfpF3z71GvSWSsQaEox6=BpPiwToXb34rK9a0R52rYRfRWA@mail.gmail.com>
Subject: Re: [syzbot] [fs?] BUG: sleeping function called from invalid context
 in procfs_procmap_ioctl
To: syzbot <syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com>
Cc: akpm@linux-foundation.org, andrii@kernel.org, david@redhat.com, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 2, 2025 at 2:59=E2=80=AFAM syzbot
<syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    1343433ed389 Add linux-next specific files for 20250630
> git tree:       linux-next
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1243e3d458000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc1ce97baf6bd6=
397
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D6246a83e7bd9f8a=
3e239
> compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e0775=
7-1~exp1~20250514183223.118), Debian LLD 20.1.6
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D11b1b88c580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c3387c64e9ec/dis=
k-1343433e.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/abf15e85d8dd/vmlinu=
x-1343433e.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/081c344403bc/b=
zImage-1343433e.xz
>
> The issue was bisected to:
>
> commit 8b877c5aaaaf9b5170928d0e033ea9b0c538fc94
> Author: Suren Baghdasaryan <surenb@google.com>
> Date:   Tue Jun 24 19:33:59 2025 +0000
>
>     mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks
>
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=3D1609577058=
0000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=3D1509577058=
0000
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D1109577058000=
0
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+6246a83e7bd9f8a3e239@syzkaller.appspotmail.com
> Fixes: 8b877c5aaaaf ("mm/maps: execute PROCMAP_QUERY ioctl under per-vma =
locks")
>
> BUG: sleeping function called from invalid context at ./include/linux/sch=
ed/mm.h:321
> in_atomic(): 0, irqs_disabled(): 0, non_block: 0, pid: 6032, name: syz.0.=
16
> preempt_count: 0, expected: 0
> RCU nest depth: 1, expected: 0
> 2 locks held by syz.0.16/6032:
>  #0: ffffffff8e13bee0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire i=
nclude/linux/rcupdate.h:331 [inline]
>  #0: ffffffff8e13bee0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock incl=
ude/linux/rcupdate.h:841 [inline]
>  #0: ffffffff8e13bee0 (rcu_read_lock){....}-{1:3}, at: query_vma_setup+0x=
18/0x110 fs/proc/task_mmu.c:499
>  #1: ffff888076dbe308 (vm_lock){++++}-{0:0}, at: lock_next_vma+0x146/0xdc=
0 mm/mmap_lock.c:220
> CPU: 1 UID: 0 PID: 6032 Comm: syz.0.16 Not tainted 6.16.0-rc4-next-202506=
30-syzkaller #0 PREEMPT(full)
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 05/07/2025
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  __might_resched+0x495/0x610 kernel/sched/core.c:8687
>  might_alloc include/linux/sched/mm.h:321 [inline]
>  slab_pre_alloc_hook mm/slub.c:4131 [inline]
>  slab_alloc_node mm/slub.c:4209 [inline]
>  __do_kmalloc_node mm/slub.c:4364 [inline]
>  __kmalloc_noprof+0xbc/0x4f0 mm/slub.c:4377
>  kmalloc_noprof include/linux/slab.h:909 [inline]
>  do_procmap_query fs/proc/task_mmu.c:690 [inline]
>  procfs_procmap_ioctl+0x877/0xd10 fs/proc/task_mmu.c:748
>  vfs_ioctl fs/ioctl.c:51 [inline]
>  __do_sys_ioctl fs/ioctl.c:907 [inline]
>  __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f107ed8e929
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f=
7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
 ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fffd594c468 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007f107efb5fa0 RCX: 00007f107ed8e929
> RDX: 0000200000000180 RSI: 00000000c0686611 RDI: 0000000000000003
> RBP: 00007f107ee10b39 R08: 0000000000000000 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> R13: 00007f107efb5fa0 R14: 00007f107efb5fa0 R15: 0000000000000003
>  </TASK>

I see. There is an allocation inside the new rcu_read section. I think
this is easy to fix. We don't need to be in the RCU read section from
query_vma_setup() up to query_vma_teardown(). Instead I can narrow it
down to query_matching_vma() only since that's the only place we need
that. Will post a new version tomorrow that will include this fix.
Thanks!

>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisect=
ion
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
