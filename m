Received: from mail-io1-f69.google.com (mail-io1-f69.google.com [209.85.166.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81A0B213E78
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748459159; cv=none; b=iockzJD7mjfAUkFK32C8ktB0jtI/E2hmOF81c7bOQEe2XRmv7/nfbuIREjlcXHZ+AuWhJoCjLUBTykYaeKtRfve8EFyVw3gVdd69uY+l6sLKyXt+bjcNOHDsmcGnD9SSn95VGmAxc2s3rkgA5fWwlKspAVRQIzplAW2rvuvyUHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748459159; c=relaxed/simple;
	bh=sZ9FIcQVpn0uh9fCmpFV7+WIIQpiLB3e3RkxJVozPN8=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XV0mX36pfyntmXa/WTqznoz7up/BOnstXVpt1COsw2TKJZoZOQqYJwOBSBnfWmg0z0Vp/PTVQTvT41N2JdS/PuFoUi90Vbf3/LgSQASfuLO1ESA7X4iJbAoRu44oOENnj77fSljn6RD03iHzKr5lq3s1BQmyRpT8ueGOh/AmmC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f69.google.com with SMTP id ca18e2360f4ac-86cc7cdb86fso6656539f.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:05:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748459156; x=1749063956;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BoU3G5hmnMDZf8TfEo1AisxE9BKN/r0sRMS8lO5Dwng=;
        b=OENPvjQMBtB3uSg6FLnSykKnD7ICTGPPmIfZWKVEKscqaWD6C3vL06NOhY22p7KRLJ
         mUj8vtS4dRfINQVp4gA1CTFnpxxT/IZdDSNPw1XdxPMGCmhwfsod4J/BeEtqKZjhy58I
         mre7ugQI+V9Y2wH+SfiHlDY8xA2OoZhNu6AN89XrVNP1RFY/QFCcBwMzm7BksQEsDja0
         rFXpDu/hP7mJ0C2A2NqTc3w+Q+FW/6OgrhLLocK4ZUCGliuG1AICLJaKqanXg8YWmXn8
         V9AhAoCTo6IYv8fQDMaKvqoMLlTkFkne9y04nHXv4mhpzq1pKre2Qf3qv4X9AgL0XhHK
         belQ==
X-Gm-Message-State: AOJu0YyiM7P0nw7Jqy2A7eOlyR/7gRqWjTKv0t4U63m2FCUBHcgvW4Te
	GZni2EPnHwkzS3qJdfQeVDtrK/5MEdGnBW8oMoZstztOZ/6dRH7vjeAhqU0lWkKqULSZFLB1KZd
	AVwKueqZLklBXEehFX3k41/pGpJgXa5Fk3OwbD3EGggaz7VAIpl8oT8X8YcE=
X-Google-Smtp-Source: AGHT+IHEcFiWJx+aq4rrujh1U0qWDR+yRX9NIAc68zBmL3hm7q1iCA4EeHyWO+hywyLInLvW6G+ki5gJtkVbyUTfGtI3t59WmoaI
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6602:4894:b0:861:7237:9021 with SMTP id
 ca18e2360f4ac-86cbb818161mr2133480639f.3.1748459156686; Wed, 28 May 2025
 12:05:56 -0700 (PDT)
Date: Wed, 28 May 2025 12:05:56 -0700
In-Reply-To: <6832ca5f.a70a0220.1765ec.015d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68375e94.a70a0220.1765ec.0174.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH v1] Bluetooth: MGMT: Use RCU-protected in
 mgmt_pending list
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH v1] Bluetooth: MGMT: Use RCU-protected in mgmt_pending =
list
Author: luiz.dentz@gmail.com

#syz test

On Wed, May 28, 2025 at 3:03=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> #syz test
>
> On Wed, May 28, 2025 at 2:44=E2=80=AFPM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> >
> > This uses RCU procedures to protect from concurrent access of
> > mgmt_pending list which can cause crashes like:
> >
> > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_complete+0xe=
5/0x540 net/bluetooth/mgmt.c:5405
> > Read of size 8 at addr ffff888048891a18 by task kworker/u5:8/5333
> >
> > CPU: 0 UID: 0 PID: 5333 Comm: kworker/u5:8 Not tainted 6.15.0-rc5-syzka=
ller-00197-gea34704d6ad7 #0 PREEMPT(full)
> > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-=
1.16.3-2~bpo12+1 04/01/2014
> > Workqueue: hci0 hci_cmd_sync_work
> > Call Trace:
> >  <TASK>
> >  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
> >  print_address_description mm/kasan/report.c:408 [inline]
> >  print_report+0xb4/0x290 mm/kasan/report.c:521
> >  kasan_report+0x118/0x150 mm/kasan/report.c:634
> >  mgmt_remove_adv_monitor_complete+0xe5/0x540 net/bluetooth/mgmt.c:5405
> >  hci_cmd_sync_work+0x25e/0x3a0 net/bluetooth/hci_sync.c:334
> >  process_one_work kernel/workqueue.c:3238 [inline]
> >  process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
> >  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
> >  kthread+0x70e/0x8a0 kernel/kthread.c:464
> >  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
> >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> >  </TASK>
> >
> > Allocated by task 5702:
> >  kasan_save_stack mm/kasan/common.c:47 [inline]
> >  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
> >  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> >  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
> >  kasan_kmalloc include/linux/kasan.h:260 [inline]
> >  __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
> >  kmalloc_noprof include/linux/slab.h:905 [inline]
> >  kzalloc_noprof include/linux/slab.h:1039 [inline]
> >  mgmt_pending_new+0x65/0x240 net/bluetooth/mgmt_util.c:252
> >  mgmt_pending_add+0x34/0x120 net/bluetooth/mgmt_util.c:279
> >  remove_adv_monitor+0x103/0x1b0 net/bluetooth/mgmt.c:5453
> >  hci_mgmt_cmd+0x9c6/0xef0 net/bluetooth/hci_sock.c:1712
> >  hci_sock_sendmsg+0x6ca/0xee0 net/bluetooth/hci_sock.c:1832
> >  sock_sendmsg_nosec net/socket.c:712 [inline]
> >  __sock_sendmsg+0x219/0x270 net/socket.c:727
> >  sock_write_iter+0x258/0x330 net/socket.c:1131
> >  new_sync_write fs/read_write.c:591 [inline]
> >  vfs_write+0x548/0xa90 fs/read_write.c:684
> >  ksys_write+0x145/0x250 fs/read_write.c:736
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Freed by task 5700:
> >  kasan_save_stack mm/kasan/common.c:47 [inline]
> >  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
> >  kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
> >  poison_slab_object mm/kasan/common.c:247 [inline]
> >  __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
> >  kasan_slab_free include/linux/kasan.h:233 [inline]
> >  slab_free_hook mm/slub.c:2380 [inline]
> >  slab_free mm/slub.c:4642 [inline]
> >  kfree+0x193/0x440 mm/slub.c:4841
> >  mgmt_pending_foreach+0xc9/0x120 net/bluetooth/mgmt_util.c:242
> >  mgmt_index_removed+0x10d/0x2f0 net/bluetooth/mgmt.c:9362
> >  hci_sock_bind+0xbe9/0x1000 net/bluetooth/hci_sock.c:1307
> >  __sys_bind_socket net/socket.c:1810 [inline]
> >  __sys_bind+0x2c3/0x3e0 net/socket.c:1841
> >  __do_sys_bind net/socket.c:1846 [inline]
> >  __se_sys_bind net/socket.c:1844 [inline]
> >  __x64_sys_bind+0x7a/0x90 net/socket.c:1844
> >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> >  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
> >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> >
> > Fixes: a380b6cff1a2 ("Bluetooth: Add generic mgmt helper API")
> > Closes: https://syzkaller.appspot.com/bug?extid=3Dfeb0dc579bbe30a13190
> > Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > ---
> >  net/bluetooth/mgmt_util.c | 25 +++++++++++++++----------
> >  1 file changed, 15 insertions(+), 10 deletions(-)
> >
> > diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
> > index 3713ff490c65..c2dc8ddf5f78 100644
> > --- a/net/bluetooth/mgmt_util.c
> > +++ b/net/bluetooth/mgmt_util.c
> > @@ -219,13 +219,20 @@ struct mgmt_pending_cmd *mgmt_pending_find(unsign=
ed short channel, u16 opcode,
> >  {
> >         struct mgmt_pending_cmd *cmd;
> >
> > -       list_for_each_entry(cmd, &hdev->mgmt_pending, list) {
> > +       rcu_read_lock();
> > +
> > +       list_for_each_entry_rcu(cmd, &hdev->mgmt_pending, list) {
> >                 if (hci_sock_get_channel(cmd->sk) !=3D channel)
> >                         continue;
> > -               if (cmd->opcode =3D=3D opcode)
> > +
> > +               if (cmd->opcode =3D=3D opcode) {
> > +                       rcu_read_unlock();
> >                         return cmd;
> > +               }
> >         }
> >
> > +       rcu_read_unlock();
> > +
> >         return NULL;
> >  }
> >
> > @@ -233,14 +240,11 @@ void mgmt_pending_foreach(u16 opcode, struct hci_=
dev *hdev,
> >                           void (*cb)(struct mgmt_pending_cmd *cmd, void=
 *data),
> >                           void *data)
> >  {
> > -       struct mgmt_pending_cmd *cmd, *tmp;
> > -
> > -       list_for_each_entry_safe(cmd, tmp, &hdev->mgmt_pending, list) {
> > -               if (opcode > 0 && cmd->opcode !=3D opcode)
> > -                       continue;
> > +       struct mgmt_pending_cmd *cmd;
> >
> > +       cmd =3D mgmt_pending_find(HCI_CHANNEL_CONTROL, opcode, hdev);
> > +       if (cmd)
> >                 cb(cmd, data);
> > -       }
> >  }
> >
> >  struct mgmt_pending_cmd *mgmt_pending_new(struct sock *sk, u16 opcode,
> > @@ -280,7 +284,7 @@ struct mgmt_pending_cmd *mgmt_pending_add(struct so=
ck *sk, u16 opcode,
> >         if (!cmd)
> >                 return NULL;
> >
> > -       list_add_tail(&cmd->list, &hdev->mgmt_pending);
> > +       list_add_tail_rcu(&cmd->list, &hdev->mgmt_pending);
> >
> >         return cmd;
> >  }
> > @@ -294,7 +298,8 @@ void mgmt_pending_free(struct mgmt_pending_cmd *cmd=
)
> >
> >  void mgmt_pending_remove(struct mgmt_pending_cmd *cmd)
> >  {
> > -       list_del(&cmd->list);
> > +       list_del_rcu(&cmd->list);
> > +       synchronize_rcu();
> >         mgmt_pending_free(cmd);
> >  }
> >
> > --
> > 2.49.0
> >
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
