Received: from mail-il1-f207.google.com (mail-il1-f207.google.com [209.85.166.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C27691DFFD
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744232740; cv=none; b=Mq1Be2FUuHjATJ8PuNB/mlL/ooJc3vgnFxmZmPv5Bj7nBAqFCvmf8O0wKdaKzxyMPg0V/S9f58Mo34mlwtCERhv3aJk/vM4+6n543ikJIgDHBRKG9O2Iv55oUM1xjt+yfmIsrrEvvmsoVHRZ4gXDJK2KCF0xCliwv6YQ2iHvLvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744232740; c=relaxed/simple;
	bh=dszWltzNeQ5IsakrR7cEztZUvZrMLPXfhw/w0ukP+PE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=opIYUYRq9+VvRgfftgAR9ALGJErdlcrOXVJkq0WA0/qCoN9ayjxyHPFbNUc65HvBb2n3ITMX+X7XSv86V9VezpsYeIpQtpPkkLIF6YBelIu5ef9a+x1kyY8753Onr4rQAgXwLNtsB5xWR1X8kEUdohm4xVmL8DEHOI20Aj9udkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f207.google.com with SMTP id e9e14a558f8ab-3d43b460970so3115005ab.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 14:05:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744232736; x=1744837536;
        h=content-transfer-encoding:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=odu2kNJaLRFeF80kYyWwHuTDs1Am9zcadJUL+sfyYkw=;
        b=IUaPaMyk9GMd1iQoDePaF3WFruff2BH2JfT1as/g9IM9pGc30rygWRBQhn3FbppetS
         e97pIE1V61x9ITBES8mZSVeSIDK8VZ1CJM8KcZvsF5rQ+XzN7Ti2th3+zY5oMOG2BdJQ
         NkBd5vqHs1ydBNQTTCF8puVKoMB6CilEN5JbWAI77+eR2/PGyFRWqJ3ld1elTgs7gGSi
         xSO8tMfb4FdBB5nzz0JQstk1gpf9piOyc88jofi5SHxJ0/iPqitm8/5GYoWVQE4RmnIE
         HUQt7Mv55v7RyDT8i1I+vU+GfJvB4CMSVF+lSijl29Cdf+6sjUCt9FIiMwPLcKLPfMEN
         iDcw==
X-Forwarded-Encrypted: i=1; AJvYcCVjsrAmA1sy9gB30mN4o1jGIzpg6x8OSiCK9h2uNwZ65+sDu1oY2BifDgtIWLRy5suJhirQrBax7JokKp8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjaUa2sAYhUCRm7Ltd7hJnFDrJWFuzd81q0kAsAMyu5kWZRoii
	FwMdnlkwoNvBGjsim8VHICb3FHOixQh9NqJhZSaA9Wvnydk3hBEgM8wUXITiIdBUq3LiM4CryGK
	IIWToS0LVGojiMlY84WKYxDtBCCUIJVsnL+Dzo1sFXpohqIyYHCRsEKM=
X-Google-Smtp-Source: AGHT+IFUe3c/W6yUXsGg3pm6vLnGyMEUaa7jEufzk/Esjz0Qmq88kQJpr7Zp63IZQ0OY0znrJC0eQqvKp2uXutOLRmPyW0RTXRAJ
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1549:b0:3d1:a75e:65f6 with SMTP id
 e9e14a558f8ab-3d7e475979amr6214475ab.18.1744232735860; Wed, 09 Apr 2025
 14:05:35 -0700 (PDT)
Date: Wed, 09 Apr 2025 14:05:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67f6e11f.050a0220.25d1c8.000b.GAE@google.com>
Subject: [syzbot] [mm?] BUG: sleeping function called from invalid context in emon
From: syzbot <syzbot+bfec7fc02d461ac8508c@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    a8662bcd2ff1 Merge tag 'v6.15-p3' of git://git.kernel.org/.=
.
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=3D1679e23f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3Dc79406130aa88d2=
2
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dbfec7fc02d461ac85=
08c
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Deb=
ian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7fe=
b34a89c2a/non_bootable_disk-a8662bcd.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ece8f63b70db/vmlinux-=
a8662bcd.xz
kernel image: https://storage.googleapis.com/syzbot-assets/afe18493a5d1/bzI=
mage-a8662bcd.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+bfec7fc02d461ac8508c@syzkaller.appspotmail.com

Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr [  173.248805][   T45] BUG: sleeping function called from invalid conte=
xt at mm/util.c:743
 5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL devic=
e
Apr  5 20:58:42 sy[  173.254178][   T45] in_atomic(): 1, irqs_disabled(): 0=
, non_block: 0, pid: 45, name: kcompactd0
zkaller daemon.e[  173.258054][   T45] preempt_count: 1, expected: 0
rr dhcpcd[5660]:[  173.261277][   T45] 1 lock held by kcompactd0/45:
 libudev: receiv[  173.263149][   T45]  #0: ffff88801f84a0c8 (&mapping->i_p=
rivate_lock){+.+.}-{3:3}, at: spin_lock include/linux/spinlock.h:351 [inlin=
e]
 libudev: receiv[  173.263149][   T45]  #0: ffff88801f84a0c8 (&mapping->i_p=
rivate_lock){+.+.}-{3:3}, at: __buffer_migrate_folio+0x25b/0x690 mm/migrate=
.c:853
ed NULL device
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evi[  173.269529][   T45] CPU: 1 UID: 0 PID: 45 Comm: kcompactd0 Not tainte=
d 6.14.0-syzkaller-13423-ga8662bcd2ff1 #0 PREEMPT(full)=20
ce
Apr  5 20:58[  173.269544][   T45] Hardware name: QEMU Standard PC (Q35 + I=
CH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
:42 syzkaller da[  173.269550][   T45] Call Trace:
emon.err dhcpcd[[  173.269554][   T45]  <TASK>
5660]: libudev: [  173.269559][   T45]  __dump_stack lib/dump_stack.c:94 [i=
nline]
5660]: libudev: [  173.269559][   T45]  dump_stack_lvl+0x16c/0x1f0 lib/dump=
_stack.c:120
received NULL de[  173.269584][   T45]  __might_resched+0x3c0/0x5e0 kernel/=
sched/core.c:8818
vice
Apr  5 20:[  173.269600][   T45]  ? spin_unlock include/linux/spinlock.h:39=
1 [inline]
Apr  5 20:[  173.269600][   T45]  ? __free_frozen_pages+0x72a/0xff0 mm/page=
_alloc.c:2709
58:42 syzkaller [  173.269616][   T45]  ? __pfx___might_resched+0x10/0x10 k=
ernel/sched/core.c:5889
daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libud[  173.269633][   T=
45]  folio_mc_copy+0xfb/0x190 mm/util.c:743
ev: received NUL[  173.269649][   T45]  __migrate_folio.constprop.0+0xa1/0x=
3d0 mm/migrate.c:758
L device
Apr  5[  173.269669][   T45]  filemap_migrate_folio mm/migrate.c:943 [inlin=
e]
Apr  5[  173.269669][   T45]  __buffer_migrate_folio+0x5cd/0x690 mm/migrate=
.c:874
 20:58:42 syzkal[  173.269691][   T45]  ? __pfx_buffer_migrate_folio_norefs=
+0x10/0x10 mm/migrate.c:914
ler daemon.err dhcpcd[5660]: lib[  173.269710][   T45]  move_to_new_folio+0=
x1d9/0x700 mm/migrate.c:1050
udev: received N[  173.269731][   T45]  migrate_folio_move mm/migrate.c:135=
8 [inline]
udev: received N[  173.269731][   T45]  migrate_folios_move mm/migrate.c:17=
10 [inline]
udev: received N[  173.269731][   T45]  migrate_pages_batch+0x201d/0x31a0 m=
m/migrate.c:1957
ULL device
Apr [  173.269756][   T45]  ? __pfx_compaction_free+0x10/0x10 include/trace=
/events/compaction.h:56
 5 20:58:42 syzk[  173.269781][   T45]  ? __pfx_migrate_pages_batch+0x10/0x=
10 include/linux/list.h:196
aller daemon.err[  173.269800][   T45]  migrate_pages_sync+0x12d/0x8a0 mm/m=
igrate.c:1987
 dhcpcd[5660]: l[  173.269814][   T45]  ? __pfx_compaction_alloc+0x10/0x10 =
mm/compaction.c:431
ibudev: received NULL device
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 [  173.269974][   T45]  ? __pfx___might_resched+0x10/0x10 k=
ernel/sched/core.c:5889
syzkaller daemon[  173.269991][   T45]  compact_zone+0x1f6c/0x45f0 mm/compa=
ction.c:2689
.err dhcpcd[5660[  173.270014][   T45]  ? lookup_chain_cache_add kernel/loc=
king/lockdep.c:3821 [inline]
.err dhcpcd[5660[  173.270014][   T45]  ? validate_chain kernel/locking/loc=
kdep.c:3877 [inline]
.err dhcpcd[5660[  173.270014][   T45]  ? __lock_acquire+0xaa4/0x1ba0 kerne=
l/locking/lockdep.c:5235
]: libudev: rece[  173.270029][   T45]  ? __pfx_compact_zone+0x10/0x10 arch=
/x86/include/asm/atomic64_64.h:15
ived NULL device[  173.270050][   T45]  compact_node+0x1a4/0x2d0 mm/compact=
ion.c:2958

Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:42 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller kern.err kernel: [  173.248805][   T45] BUG: slee=
ping function called from invalid context at mm/util.c:743
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receiveApr  5 2=
0:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syz=
kaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:4=
3 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20=
:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err=
 dhcpcd[5660Apr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemo=
nApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL =
device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:5=
8:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libud=
ev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller kern.err kernel: [  173.254178][   T45] in_atomic=
(): 1, irqs_disabled(): 0, non_block: 0, pid: 45, name: kcompactd0
Apr  5 20:58:43 syzkaller kern.err kernel: [  173.258054][   T45] preempt_c=
ount: 1, expected: 0
Apr  5 20:58:43 syzkaller kern.err kernel: [  173.259779][   T45] RCU nest =
depth: 0, expected: 0
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.261277][   T45] 1 lock h=
eld by kcompactd0/45:
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.263149][   T45]  #0: fff=
f88801f84a0c8 (&mapping->i_private_lock){+.+.}-{3:3}, at: spin_lock include=
/linux/spinlock.h:351 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.263149][   T45]  #0: fff=
f88801f84a0c8 (&mapping->i_private_lock){+.+.}-{3:3}, at: __buffer_migrate_=
folio+0x25b/0x690 mm/migrate.c:853
Apr  5 20:58:43 syzkaller kern.err kernel: [  173.266595][   T45] Preemptio=
n disabled at:
Apr  5 20:58:43 syzkaller kern.err kernel: [  173.266601][   T45] [<0000000=
000000000>] 0x0
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269529][   T45] CPU: 1 U=
ID: 0 PID: 45 Comm: kcompactd0 Not tainted 6.14.0-syzkaller-13423-ga8662bcd=
2ff1 #0 PREEMPT(full)=20
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269544][   T45] Hardware=
 name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo=
12+1 04/01/2014
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269550][   T45] Call Tra=
ce:
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269554][   T45]  <TASK>
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269559][   T45]  __dump_=
stack lib/dump_stack.c:94 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269559][   T45]  dump_st=
ack_lvl+0x16c/0x1f0 lib/dump_stack.c:120
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269584][   T45]  __might=
_resched+0x3c0/0x5e0 kernel/sched/core.c:8818
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269600][   T45]  ? spin_=
unlock include/linux/spinlock.h:391 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269600][   T45]  ? __fre=
e_frozen_pages+0x72a/0xff0 mm/page_alloc.c:2709
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269616][   T45]  ? __pfx=
___might_resched+0x10/0x10 kernel/sched/core.c:5889
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269633][   T45]  folio_m=
c_copy+0xfb/0x190 mm/util.c:743
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269649][   T45]  __migra=
te_folio.constprop.0+0xa1/0x3d0 mm/migrate.c:758
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269669][   T45]  filemap=
_migrate_folio mm/migrate.c:943 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269669][   T45]  __buffe=
r_migrate_folio+0x5cd/0x690 mm/migrate.c:874
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269691][   T45]  ? __pfx=
_buffer_migrate_folio_norefs+0x10/0x10 mm/migrate.c:914
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269710][   T45]  move_to=
_new_folio+0x1d9/0x700 mm/migrate.c:1050
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269731][   T45]  migrate=
_folio_move mm/migrate.c:1358 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269731][   T45]  migrate=
_folios_move mm/migrate.c:1710 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269731][   T45]  migrate=
_pages_batch+0x201d/0x31a0 mm/migrate.c:1957
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269756][   T45]  ? __pfx=
_compaction_free+0x10/0x10 include/trace/events/compaction.h:56
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269781][   T45]  ? __pfx=
_migrate_pages_batch+0x10/0x10 include/linux/list.h:196
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269800][   T45]  migrate=
_pages_sync+0x12d/0x8a0 mm/migrate.c:1987
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269814][   T45]  ? __pfx=
_compaction_alloc+0x10/0x10 mm/compaction.c:431
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269840][   T45]  ? __pfx=
_compaction_free+0x10/0x10 include/trace/events/compaction.h:56
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269858][   T45]  ? __pfx=
_migrate_pages_sync+0x10/0x10 include/linux/list.h:153
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269875][   T45]  ? find_=
held_lock+0x2b/0x80 kernel/locking/lockdep.c:5348
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269891][   T45]  migrate=
_pages+0x1b28/0x2350 mm/migrate.c:2096
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269906][   T45]  ? __pfx=
_compaction_alloc+0x10/0x10 mm/compaction.c:431
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269921][   T45]  ? __pfx=
_compaction_free+0x10/0x10 include/trace/events/compaction.h:56
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269939][   T45]  ? __pfx=
_migrate_pages+0x10/0x10 arch/x86/include/asm/bitops.h:206
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269956][   T45]  ? __pfx=
_isolate_migratepages_block+0x10/0x10 mm/compaction.c:1696
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269974][   T45]  ? __pfx=
___might_resched+0x10/0x10 kernel/sched/core.c:5889
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.269991][   T45]  compact=
_zone+0x1f6c/0x45f0 mm/compaction.c:2689
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.270014][   T45]  ? looku=
p_chain_cache_add kernel/locking/lockdep.c:3821 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.270014][   T45]  ? valid=
ate_chain kernel/locking/lockdep.c:3877 [inline]
Apr  5 20:58:43 syzkaller kern.warn kernel: [  173.270014][   T45]  ? __loc=
k_acquire+0xaa4/0x1ba0 kernel/locking/lockdep.c:5235
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller kern.warn kernel: [  17Apr  5 20:58:43 syzkaller =
daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzka=
ller daemonApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon=
Apr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemonApr  5 20:5=
8:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: lib=
udev: received NULL deviceApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 s=
yzkaller daemonApr  5 20:58:43 syzkaller kern.wApr  5 20:58:43 syzkaller ke=
rn.wApr  5 20:58:43 syzkaller kern.wApr  5 20:58:43 syzkaller kern.wApr  5 =
20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.warn kernel: [  1Ap=
r  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.warn kernel: [=
  173.270135][   T45]  kcompactd+0x762/0xea0 mm/compaction.c:3256
Apr  5 20:58:43 syzkaller daemon.err Apr  5 20:58:43 syzkaller kern.wApr  5=
 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller kern.wA=
pr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.wApr  5 20:58=
:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller kern.warn ker=
nel: [  1Apr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.war=
n kernel: [  173.270214][   T4Apr  5 20:58:43 syzkaller daemonApr  5 20:58:=
43 syzkaller kern.wApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkalle=
r kern.wApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.warn=
 kernel: [  173.270258][   T4Apr  5 20:58:43 syzkaller daemonApr  5 20:58:4=
3 syzkaller kern.wApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libude=
v: received NULL device
Apr  5 20:58:43 syzkaller kern.warn kernel: [ Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660Apr  5 20:58:43 syzkaller kern.wApr  5 20:58:43 syzkalle=
r daemonApr  5 20:58:43 syzkaller kern.warn kernel: [  1Apr  5 20:58:43 syz=
kaller daemonApr  5 20:58:43 syzkaller kern.wApr  5 20:58:43 syzkaller daem=
onApr  5 20:58:43 syzkaller kern.warn kernel: [  173.270321][   T45]  ret_f=
rom_fork+0x45/0x80 arch/x86/kernel/process.c:153
Apr  5 20:58:43 syzkaller daemon.erApr  5 20:58:43 syzkaller kern.wApr  5 2=
0:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syz=
kaller kern.wApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern=
.wApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.wApr  5 20=
:58:43 syzkaller daemonApr  5 20:58:43 syzkaller kern.warn kernel: [  173.3=
36998][T11286]  failed with Apr  5 20:58:43 syzkaller daemon.err dhcpcd[566=
0]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:=
58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err =
dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: rece=
ived NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:5=
8:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err d=
hcpcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.=
err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58=
:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receive=
d NULL deviceApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daem=
on.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcp=
cd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received=
 NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudevApr  5 20:58:43 s=
yzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[=
5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.errApr  5 20:58:43 syzkaller daemon.err dh=
cpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receiv=
ed NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660Apr  5 20:58:43 Apr  5 20:58:43 syzkaller daemonApr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20=
:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err=
 dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libud=
ev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syz=
kaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller=
 daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syz=
kaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller=
 daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr =
 5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL devic=
e
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libud=
ev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libud=
ev: receApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL=
 device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpc=
d[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  =
5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon=
.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev:=
 received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receive=
d NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]:Apr  5 20:58:43 syzkaller=
 daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr =
 5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemonApr  5 20:58:43=
 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: li=
budev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: re=
ceived NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libude=
v: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULApr=
  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[56=
60]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkalle=
r daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr=
  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL devi=
ceApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcp=
cd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
monApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 2=
0:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syz=
kaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcp=
cd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daemonApr =
 5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[566=
0]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev=
: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 2=
0:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 2=
0:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daem=
on.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libude=
v: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[Apr  5 20:58:43 syzkaller daemo=
n.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpc=
d[5660Apr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemonApr  =
5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudApr  5 20:58:43 syz=
kaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daem=
on.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receive=
d NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:43=
 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzka=
ller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660=
]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULApr=
  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL devi=
ce
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:43=
 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpc=
d[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.err =
dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: rece=
ived NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev:=
 receApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemonApr  5=
 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 s=
yzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58=
:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libu=
dev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receAp=
r  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzkalle=
r daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: =
libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[56=
60]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NUL=
L device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: li=
budev: received NULL deviceApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 =
syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller d=
aemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5=
 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceA=
pr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller da=
emonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 =
20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]:=
 libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receive=
d NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkalle=
r daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20=
:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err=
 dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller=
 daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr =
 5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL devic=
eApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  =
5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon=
.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:5=
8:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err d=
hcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receA=
pr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller da=
emon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libud=
ev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: li=
budev: received NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660=
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller d=
aemonApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5=
 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.=
err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58=
:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudApr  5 20:58:43 syz=
kaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 2=
0:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpc=
d[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhc=
pcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 2=
0:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[56Apr  5 20:58:43 syzkaller dae=
mon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libud=
ev: receApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.er=
r dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemonApr  5 20:58:4=
3 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkalle=
r daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: =
libudev: received NULL deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller=
 daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:43 syzk=
aller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[566=
0Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL =
deviceApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzka=
ller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660=
]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:43=
 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemonApr  5 20:=
58:43 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzka=
ller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660=
]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULApr=
  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daem=
on.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:43 syzkaller daemonApr  5 20:58:43 syzkaller daemon.err dhcpc=
d[5660]: libudev: receApr  5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  =
5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:43=
 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:43 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:43=
 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller =
daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:43 syzkaller daemonApr  =
5 20:58:43 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:43 syzkaller daemon=
.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 2=
0:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receive=
d NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:44 syz=
kaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL =
device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: =
libudev: received NULL deviceApr  5 20:58:44 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcp=
cd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:44=
 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller =
daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:44 syzka=
ller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 =
syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd=
[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received N=
ULL deviceApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: recei=
ved NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL A=
pr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller da=
emonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkall=
er daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receiv=
ed NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:44 syz=
kaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 2=
0:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 2=
0:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.er=
r dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[Apr  5 20:58:44 syzkaller daemo=
n.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller =
daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemonApr  =
5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:44 syz=
kaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56=
60]: libudev: received NULL deviceApr  5 20:58:44 syzkaller daemon.err dhcp=
cd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzk=
aller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44=
 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL =
device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56Apr  5 20:58:44 syzkaller dae=
mon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemon.err dhc=
pcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receive=
d NULL deviceApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:4=
4 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkalle=
r daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: =
libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL A=
pr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller da=
emonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dh=
cpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Ap=
r  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL dev=
ice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:44=
 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:=
58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: li=
budev: receApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 =
syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcApr  5 20:58:44 syzkaller daemonA=
pr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58=
:44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkall=
er daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonAp=
r  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller dae=
monApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 2=
0:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller=
 daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr =
 5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemo=
n.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemonApr  5 20:=
58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err =
dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 =
syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:5=
8:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkal=
ler daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonA=
pr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[=
5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 2=
0:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syz=
kaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daem=
onApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcp=
cd[5660]: libudev: received NULL deviceApr  5 20:58:44 syzkaller daemonApr =
 5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44=
 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller =
daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  =
5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660=
]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56Apr  5 20:58:44 syzkaller dae=
monApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 2=
0:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syz=
kaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daem=
onApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20=
:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzk=
aller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemo=
nApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:=
58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: li=
budev: received NULL deviceApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 =
syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev:=
 receApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5=
 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 s=
yzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58=
:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkall=
er daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.e=
rr dhcpcd[5660]: libudev: receApr  5 20:58:44 syzkaller daemon.err dhcpcd[5=
660Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NUL=
L deviceApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.er=
r dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daem=
onApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20=
:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr =
 5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44=
 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller =
daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  =
5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device=
Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd=
[5660]: libudev: receApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5=
 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 s=
yzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller da=
emonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dh=
cpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonAp=
r  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:=
44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkalle=
r daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL devi=
ceApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20=
:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56Apr  5 20:58:44 syzkaller dae=
monApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkalle=
r daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daem=
onApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller=
 daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzk=
aller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44=
 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:=
58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzka=
ller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon=
.err dhcpcd[5660]: libudev: received NULL deviceApr  5 20:58:44 syzkaller d=
aemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkal=
ler daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonA=
pr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller da=
emonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 Apr  5 20:58:44 syzkall=
er daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: Apr  5 20:58:44=
 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:=
58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  =
5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 =
syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller d=
aemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkalle=
r daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[56=
60]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
evice
Apr  5 20:58:44 syzkaller daemon.err dhcApr  5 20:58:44 syzkaller daemon.er=
r dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daem=
onApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20=
:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzk=
aller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: rec=
eived NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56Apr  5 20:58:44 syzkaller dae=
monApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 2=
0:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syz=
kaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:4=
4 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libude=
v: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: received NULL d=
eviApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 2=
0:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syz=
kaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daem=
onApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20=
:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzk=
aller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44=
 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcpc=
d[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  =
5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 =
syzkaller daemon.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56Apr  5 20:58:44 syzkaller dae=
mon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkalle=
r daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:4=
4 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libude=
v: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]: libudev: reApr  5 20:58:=
44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkalle=
r daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[56=
60Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcp=
cd[5660]: libudev: received NULL deviceApr  5 20:58:44 syzkaller daemonApr =
 5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44=
 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:=
58:44 syzkaller daemon.err dhcpcd[5660]: libudev: receApr  5 20:58:44 syzka=
ller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon=
.err dhcpcd[5660]: libudev: received NULL device
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[56Apr  5 20:58:44 syzkaller dae=
mon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkalle=
r daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr=
  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:4=
4 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon.err dhcp=
cd[5660]: libudev: received NULL deviceApr  5 20:58:44 syzkaller daemonApr =
 5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44=
 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller =
daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  =
5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemon=
Apr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller d=
aemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkal=
ler daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonA=
pr  5 20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemonApr  5 20:58=
:44 syzkaller daemon.err dhcpcd[5660Apr  5 20:58:44 syzkaller daemonApr  5 =
20:58:44 syzkaller daemonApr  5 20:58:44 syzkaller daemon.err dhcpcd[5660]:=
 libudev: receApr  5 20:58:44 syz

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
