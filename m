Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FD5921B9F4
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 09:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746522467; cv=none; b=Foome6azz0+On7+7O6eP3wQ6jKHhRNDNy7bKyzL9i46HFfy+7bC2/yfEUih/HTZA5lxt0lEcDXYhErh/3WPTmCAwdbIt+VYyyIhPiJlSzAWhwUZSek9uySHSt5MEH3yFDFqgFH8DC3JNEHfUMlAuFwJBXpZLh4CxmfRs45vBztI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746522467; c=relaxed/simple;
	bh=y4psligqOOOcGinyIsgA2Br7W2c62BO7w90ZuvurxOU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pJT/2q4ojLz8E54FBQH7Pmelx852+UY/CLi0N1FjUIv/CXhWsF0yYbgZyG9obBBACZVy1IRntFmo5pKYuZT38/gZ+p95C4HEMkH1Bhqlm1hrObIITgfql+qxQf3juyO2kl2rmcmgCIqcKZ8mpIOosLKkfxS9fNJ1fz3fu1JrHn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D1gmcXbi; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D1gmcXbi"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-6f0cfbe2042so70384186d6.1
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 02:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746522463; x=1747127263; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X51Rrkwx3opz4kS9+2PJYedHgMCaMvzr8QLzl3Vlb0w=;
        b=D1gmcXbiKNnO9cB4Cu/wqqvDUasFhhCtdoetHyVNBlVsVNdlV7yUiuDGe3d4Wm5n5b
         rwXvzRvXrB1+G1Q62Xa+O/TX5kbc4YypyE3dsUX1BN7tjSpwXNRigFqIRrrLTPvQwdBE
         ALXXt67FgQzM+Ac5R7QnqRwxHH1YX/dZJ3OwZYu+UM4RQrYtlV74QQCIiaDeZtfjci21
         xhqKA98fHkEmXDJp5yl10MfWSaaQvsBELZNIUiJOqMkHu0JMnzvcrj24pfBa4uw+w2xx
         GE7BBY2Axf6tLqSA1KumUb8uTaMtwSnDdZWA0XQ2YnKHFPdG1N3leg8OYpwzLewsauDb
         3vUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522463; x=1747127263;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X51Rrkwx3opz4kS9+2PJYedHgMCaMvzr8QLzl3Vlb0w=;
        b=dLeT5TatZASCL9aoJQZ8IA0KwZyRAz1tkjQXpez78HJecmz9CnFV8WDNmrsFqhWy4U
         WHmKCAgeoSMH3hYudD1Ylv9DbjsxOi0QzEjM42O5R/ORz7G8Apcbsuns/mS/qDF9uVMI
         A6aovZTT8Uq0xJMa3Lz1Dbg91KC262Ah4lY45fw60Kiix3LJsdVw7CDOf37ZfTIkgEUe
         GHSRExRwmXh+iq0oRJzK0z/as28saoe/uBtP+I7U5LQ2XDh8PcIRTpnBGddme2HorCce
         6YYIcqh1/coV1uIBS949xz4Vk5pq4eMgrHlfiPTDBE/r0+lWK5A1r3DX5YXaVmEgQJ8s
         VfqQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0K/iqCImhrinEkVqxhm80s9FGtEmnd/bDTiod17UcKyR1WCogV6n9pJ0wjCOFyU/WmEJNwUOhxnZpoQU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr5DwVcTxOG+DX1gam1aRiSfWHLswggI2XZH3VdUhVtxFNQwJ/
	NpUjgUXadhrMAAcArWpVaRth1w3uTjj/c+XIs0LAaOVN2kxCJX6Exnth+TTFk4gfuQZ0GnkYmtD
	2sx0nlILitAaj/F5tMGLYJ9NEQOoT+6NEms01
X-Gm-Gg: ASbGncuK3tin3WOlECwpcbIFuodDR0lBuM+/JAXsTBIfnceSB6vyW/4YJWOXblLzwTh
	e5A10C1DyFBo5HtoFEA9A+LE5TOhWxQPjfQPHlZ7Xx+iphAec97RVrQVYv1O7O6A8klS62b98ub
	8Hg3h6w5qbdFklFmn522a2elLTWylJMhpCohdY2M08eIfCXq7ruvUx
X-Google-Smtp-Source: AGHT+IF5P4VPj6x/BAHYBz9itbJYgSSIaKPeilE1Y/IPx0Ey2fzjkCnq/QJ5zyEjR7XocjYZi2V568epC3iTVtWPGWc=
X-Received: by 2002:a05:6214:5012:b0:6e2:383f:4acd with SMTP id
 6a1803df08f44-6f535347dbbmr43800436d6.7.1746522462705; Tue, 06 May 2025
 02:07:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <6819cce1.050a0220.37980e.038e.GAE@google.com>
In-Reply-To: <6819cce1.050a0220.37980e.038e.GAE@google.com>
From: Alexander Potapenko <glider@google.com>
Date: Tue, 6 May 2025 11:07:05 +0200
X-Gm-Features: ATxdqUGXqJf9_gQwVbq2SDoD6PNekFw9ekQXHfFNCh-hwwTSkOIDFCop0KSkUaQ
Message-ID: <CAG_fn=XiU7YOsj40X3m-ZOrdHnFY-5nuJaL_OXeH3Ha26u3t0Q@mail.gmail.com>
Subject: Re: [syzbot] [kernel?] upstream test error: KASAN: invalid-access
 Write in binder_add_device
To: syzbot <syzbot+10ed5e36a416a32f127e@syzkaller.appspotmail.com>
Cc: arve@android.com, brauner@kernel.org, cmllamas@google.com, 
	gregkh@linuxfoundation.org, joel@joelfernandes.org, 
	linux-kernel@vger.kernel.org, maco@android.com, surenb@google.com, 
	syzkaller-bugs@googlegroups.com, tkjos@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 6, 2025 at 10:48=E2=80=AFAM syzbot
<syzbot+10ed5e36a416a32f127e@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    29281a76709c Merge tag 'kvmarm-fixes-6.14-2' into kvmarm-=
m..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/kvmarm/kvma=
rm.git fuzzme
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D16921f7458000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3D22c3bbf92fcca=
116
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D10ed5e36a416a32=
f127e
> compiler:       Debian clang version 20.1.3 (++20250415083350+2131242240f=
7-1~exp1~20250415203523.103), Debian LLD 20.1.3
> userspace arch: arm64
>
> Downloadable assets:
> disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/3=
84ffdcca292/non_bootable_disk-29281a76.raw.xz
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+10ed5e36a416a32f127e@syzkaller.appspotmail.com
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: invalid-access in hlist_add_head include/linux/list.h:1026 [i=
nline]
> BUG: KASAN: invalid-access in binder_add_device+0xf4/0xf8 drivers/android=
/binder.c:6932
> Write of size 8 at addr d9f000001772ec08 by task syz-executor/3290
> Pointer tag: [d9], memory tag: [85]
>
> CPU: 0 UID: 0 PID: 3290 Comm: syz-executor Not tainted 6.14.0-rc2-syzkall=
er-g29281a76709c #0
> Hardware name: linux,dummy-virt (DT)
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>  dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
>  print_address_description+0xac/0x290 mm/kasan/report.c:378
>  print_report+0x84/0xa0 mm/kasan/report.c:489
>  kasan_report+0xb0/0x110 mm/kasan/report.c:602
>  kasan_tag_mismatch+0x28/0x3c mm/kasan/sw_tags.c:175
>  __hwasan_tag_mismatch+0x30/0x60 arch/arm64/lib/kasan_sw_tags.S:55
>  hlist_add_head include/linux/list.h:1026 [inline]
>  binder_add_device+0xf4/0xf8 drivers/android/binder.c:6932
>  binderfs_binder_device_create+0xbfc/0xc28 drivers/android/binderfs.c:210
>  binderfs_fill_super+0xb30/0xe20 drivers/android/binderfs.c:729
>  vfs_get_super fs/super.c:1280 [inline]
>  get_tree_nodev+0xdc/0x1cc fs/super.c:1299
>  binderfs_fs_context_get_tree+0x28/0x38 drivers/android/binderfs.c:749
>  vfs_get_tree+0xc4/0x3cc fs/super.c:1814
>  do_new_mount+0x2a0/0x988 fs/namespace.c:3560
>  path_mount+0x650/0x101c fs/namespace.c:3887
>  do_mount fs/namespace.c:3900 [inline]
>  __do_sys_mount fs/namespace.c:4111 [inline]
>  __se_sys_mount fs/namespace.c:4088 [inline]
>  __arm64_sys_mount+0x36c/0x468 fs/namespace.c:4088
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x90/0x2b4 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x180/0x2f4 arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x58/0x74 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x134 arch/arm64/kernel/entry-common.c:744
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:762
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x4df000001772=
e000 pfn:0x5772e
> flags: 0x1ffde8000000000(node=3D0|zone=3D0|lastcpupid=3D0x7ff|kasantag=3D=
0x7a)
> page_type: f2(table)
> raw: 01ffde8000000000 0000000000000000 dead000000000122 0000000000000000
> raw: 4df000001772e000 0000000000000000 00000001f2000000 0000000000000000
> page dumped because: kasan: bad access detected
>
> Memory state around the buggy address:
>  fff000001772ea00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
>  fff000001772eb00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
> >fff000001772ec00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
>                    ^
>  fff000001772ed00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
>  fff000001772ee00: 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85 85
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
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

#syz invalid

This bug was found on an obsolete kernel branch.
