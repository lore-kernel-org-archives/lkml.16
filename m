Received: from mail-il1-f200.google.com (mail-il1-f200.google.com [209.85.166.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1782AD23
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:30:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748982660; cv=none; b=Bz8p+SmHiovJL6OZzhfd7uxho2151e5ynIgjhVExXBgGoN6VBbT+iB2DAdYQmAyJ8rtURqdqrhxr7ehQ4XHy9j2DvD/w3WrhwS9qMcunQUbTy7CuS0YrDc0saLqks6GoXzjArMG1JdSDDKRClxtyuKW9mUeqqCwsvvhbN0fOJ1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748982660; c=relaxed/simple;
	bh=mfLM/x78LfwexYLncORrSxrDNuj522S4yotgaci/414=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=mIiqVcs0HNtuaIqcpNs5jTewcwTeQ5aKNCMHMqgvj76u7wCY8/nVZwCCvBeS0wBjw1VcPmXTbnxjyTb2K6i+3k0KHD8Cz5gvLhhLxCkjUsvjpbHvd3lFDE9LQt6PQG8pb0Xu/f1S82a1NM6eBdRh1pBymznaTjWFA/QhgSwGUTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f200.google.com with SMTP id e9e14a558f8ab-3dc9cd70437so72374505ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:30:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748982658; x=1749587458;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C49XJTLviGRf9T0vUzvTYo8Jib7a0NzIVfBXde4o9QQ=;
        b=YaNr4h4dVlV2GNaHnrQdmuJUQYwDCwo1Mxf2Ey0HwufsWWbkezMLwFNFi4PQajKNxD
         I8HVQ6PIbj4ovq8mTsPdEKigBo4PNTHRg6QQo0qDrXzLleqZjjJUcv4VtvTfGV81AHR+
         B0oZFnnHN2NBrUCuQjyGuYwaxJcPbW8VbRMm5Gz61Z61BbwHGLOOHv6PBrwF0lM4HUy8
         ELEPjrfcREPC3fRr7XzWJTKcENR9zLvX10Okl9sZms2kJo4IWFYCBuXpjGec1YSU+62z
         oPDZ+Hzm7XxtUpvhZBrxM/6gaaXL0bRuowVJ3PEguCBl7qbVVqWPGdiEQLzA9O+zu6q7
         TT/A==
X-Gm-Message-State: AOJu0Yy3FLjdZ2tXw2bJIJ7mETNcY6PzEBTj7PjqFELSPRT99Zk/uQyE
	UCgjoP8Zs0x29AaJboXabfSU2D+GZxPagnuRE1gT2UBgDl7CG2zJYyJsdBSxhDhbAfeLIxg/keL
	HyGrncamKZw9oH88PxbuJoc1/q2RrsB1g3eT4ZHCvW5sXh5mnHtSYDZwY9jM=
X-Google-Smtp-Source: AGHT+IFsL311A1A0u8N6WfFQc3pvbfCZNkBlmVPWho4TTQUr/hNATna5zC7BnS323ozwUzsDMQN0ClKkx1oinP12Q94trjJvZRnR
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1582:b0:3d9:34c8:54ce with SMTP id
 e9e14a558f8ab-3ddbee4cd16mr3473965ab.18.1748982657717; Tue, 03 Jun 2025
 13:30:57 -0700 (PDT)
Date: Tue, 03 Jun 2025 13:30:57 -0700
In-Reply-To: <68241bb2.a70a0220.3e9d8.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683f5b81.a00a0220.d4325.0001.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH v4 1/2] Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_monitor_complete
From: syzbot <syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH v4 1/2] Bluetooth: MGMT: Fix UAF on mgmt_remove_adv_mon=
itor_complete
Author: luiz.dentz@gmail.com

#syz test

On Tue, Jun 3, 2025 at 4:29=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>
> This reworks MGMT_OP_REMOVE_ADV_MONITOR to not use mgmt_pending_add to
> avoid crashes like bellow:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_complete+0xe5/=
0x540 net/bluetooth/mgmt.c:5406
> Read of size 8 at addr ffff88801c53f318 by task kworker/u5:5/5341
>
> CPU: 0 UID: 0 PID: 5341 Comm: kworker/u5:5 Not tainted 6.15.0-syzkaller-1=
0402-g4cb6c8af8591 #0 PREEMPT(full)
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.=
16.3-2~bpo12+1 04/01/2014
> Workqueue: hci0 hci_cmd_sync_work
> Call Trace:
>  <TASK>
>  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:408 [inline]
>  print_report+0xd2/0x2b0 mm/kasan/report.c:521
>  kasan_report+0x118/0x150 mm/kasan/report.c:634
>  mgmt_remove_adv_monitor_complete+0xe5/0x540 net/bluetooth/mgmt.c:5406
>  hci_cmd_sync_work+0x261/0x3a0 net/bluetooth/hci_sync.c:334
>  process_one_work kernel/workqueue.c:3238 [inline]
>  process_scheduled_works+0xade/0x17b0 kernel/workqueue.c:3321
>  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
>  kthread+0x711/0x8a0 kernel/kthread.c:464
>  ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
>
> Allocated by task 5987:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
>  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
>  kasan_kmalloc include/linux/kasan.h:260 [inline]
>  __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
>  kmalloc_noprof include/linux/slab.h:905 [inline]
>  kzalloc_noprof include/linux/slab.h:1039 [inline]
>  mgmt_pending_new+0x65/0x240 net/bluetooth/mgmt_util.c:252
>  mgmt_pending_add+0x34/0x120 net/bluetooth/mgmt_util.c:279
>  remove_adv_monitor+0x103/0x1b0 net/bluetooth/mgmt.c:5454
>  hci_mgmt_cmd+0x9c9/0xef0 net/bluetooth/hci_sock.c:1719
>  hci_sock_sendmsg+0x6ca/0xef0 net/bluetooth/hci_sock.c:1839
>  sock_sendmsg_nosec net/socket.c:712 [inline]
>  __sock_sendmsg+0x219/0x270 net/socket.c:727
>  sock_write_iter+0x258/0x330 net/socket.c:1131
>  new_sync_write fs/read_write.c:593 [inline]
>  vfs_write+0x548/0xa90 fs/read_write.c:686
>  ksys_write+0x145/0x250 fs/read_write.c:738
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Freed by task 5989:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
>  kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:233 [inline]
>  slab_free_hook mm/slub.c:2380 [inline]
>  slab_free mm/slub.c:4642 [inline]
>  kfree+0x18e/0x440 mm/slub.c:4841
>  mgmt_pending_foreach+0xc9/0x120 net/bluetooth/mgmt_util.c:242
>  mgmt_index_removed+0x10d/0x2f0 net/bluetooth/mgmt.c:9366
>  hci_sock_bind+0xbe9/0x1000 net/bluetooth/hci_sock.c:1314
>  __sys_bind_socket net/socket.c:1810 [inline]
>  __sys_bind+0x2c3/0x3e0 net/socket.c:1841
>  __do_sys_bind net/socket.c:1846 [inline]
>  __se_sys_bind net/socket.c:1844 [inline]
>  __x64_sys_bind+0x7a/0x90 net/socket.c:1844
>  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
>  do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
>
> Fixes: 66bd095ab5d4 ("Bluetooth: advmon offload MSFT remove monitor")
> Closes: https://syzkaller.appspot.com/bug?extid=3Dfeb0dc579bbe30a13190
> Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
> Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
>  include/net/bluetooth/hci_core.h |  1 -
>  net/bluetooth/hci_core.c         |  4 +---
>  net/bluetooth/mgmt.c             | 37 ++++++++++----------------------
>  3 files changed, 12 insertions(+), 30 deletions(-)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index 2b261e74e2c4..93fcb659f0d4 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -2400,7 +2400,6 @@ void mgmt_advertising_added(struct sock *sk, struct=
 hci_dev *hdev,
>                             u8 instance);
>  void mgmt_advertising_removed(struct sock *sk, struct hci_dev *hdev,
>                               u8 instance);
> -void mgmt_adv_monitor_removed(struct hci_dev *hdev, u16 handle);
>  int mgmt_phy_configuration_changed(struct hci_dev *hdev, struct sock *sk=
ip);
>  void mgmt_adv_monitor_device_lost(struct hci_dev *hdev, u16 handle,
>                                   bdaddr_t *bdaddr, u8 addr_type);
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index 04845ff3ad57..aeda2e4557d5 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -1877,10 +1877,8 @@ void hci_free_adv_monitor(struct hci_dev *hdev, st=
ruct adv_monitor *monitor)
>         if (monitor->handle)
>                 idr_remove(&hdev->adv_monitors_idr, monitor->handle);
>
> -       if (monitor->state !=3D ADV_MONITOR_STATE_NOT_REGISTERED) {
> +       if (monitor->state !=3D ADV_MONITOR_STATE_NOT_REGISTERED)
>                 hdev->adv_monitors_cnt--;
> -               mgmt_adv_monitor_removed(hdev, monitor->handle);
> -       }
>
>         kfree(monitor);
>  }
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index 14a9462fced5..feaeec2423ae 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -5108,24 +5108,14 @@ static void mgmt_adv_monitor_added(struct sock *s=
k, struct hci_dev *hdev,
>         mgmt_event(MGMT_EV_ADV_MONITOR_ADDED, hdev, &ev, sizeof(ev), sk);
>  }
>
> -void mgmt_adv_monitor_removed(struct hci_dev *hdev, u16 handle)
> +static void mgmt_adv_monitor_removed(struct sock *sk, struct hci_dev *hd=
ev,
> +                                    u16 handle)
>  {
>         struct mgmt_ev_adv_monitor_removed ev;
> -       struct mgmt_pending_cmd *cmd;
> -       struct sock *sk_skip =3D NULL;
> -       struct mgmt_cp_remove_adv_monitor *cp;
> -
> -       cmd =3D pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev);
> -       if (cmd) {
> -               cp =3D cmd->param;
> -
> -               if (cp->monitor_handle)
> -                       sk_skip =3D cmd->sk;
> -       }
>
>         ev.monitor_handle =3D cpu_to_le16(handle);
>
> -       mgmt_event(MGMT_EV_ADV_MONITOR_REMOVED, hdev, &ev, sizeof(ev), sk=
_skip);
> +       mgmt_event(MGMT_EV_ADV_MONITOR_REMOVED, hdev, &ev, sizeof(ev), sk=
);
>  }
>
>  static int read_adv_mon_features(struct sock *sk, struct hci_dev *hdev,
> @@ -5227,8 +5217,7 @@ static int __add_adv_patterns_monitor(struct sock *=
sk, struct hci_dev *hdev,
>
>         if (pending_find(MGMT_OP_SET_LE, hdev) ||
>             pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR, hdev) ||
> -           pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, hdev) ||
> -           pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev)) {
> +           pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, hdev)) {
>                 status =3D MGMT_STATUS_BUSY;
>                 goto unlock;
>         }
> @@ -5398,8 +5387,7 @@ static void mgmt_remove_adv_monitor_complete(struct=
 hci_dev *hdev,
>         struct mgmt_pending_cmd *cmd =3D data;
>         struct mgmt_cp_remove_adv_monitor *cp;
>
> -       if (status =3D=3D -ECANCELED ||
> -           cmd !=3D pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev))
> +       if (status =3D=3D -ECANCELED)
>                 return;
>
>         hci_dev_lock(hdev);
> @@ -5408,12 +5396,14 @@ static void mgmt_remove_adv_monitor_complete(stru=
ct hci_dev *hdev,
>
>         rp.monitor_handle =3D cp->monitor_handle;
>
> -       if (!status)
> +       if (!status) {
> +               mgmt_adv_monitor_removed(cmd->sk, hdev, cp->monitor_handl=
e);
>                 hci_update_passive_scan(hdev);
> +       }
>
>         mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
>                           mgmt_status(status), &rp, sizeof(rp));
> -       mgmt_pending_remove(cmd);
> +       mgmt_pending_free(cmd);
>
>         hci_dev_unlock(hdev);
>         bt_dev_dbg(hdev, "remove monitor %d complete, status %d",
> @@ -5423,10 +5413,6 @@ static void mgmt_remove_adv_monitor_complete(struc=
t hci_dev *hdev,
>  static int mgmt_remove_adv_monitor_sync(struct hci_dev *hdev, void *data=
)
>  {
>         struct mgmt_pending_cmd *cmd =3D data;
> -
> -       if (cmd !=3D pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev))
> -               return -ECANCELED;
> -
>         struct mgmt_cp_remove_adv_monitor *cp =3D cmd->param;
>         u16 handle =3D __le16_to_cpu(cp->monitor_handle);
>
> @@ -5445,14 +5431,13 @@ static int remove_adv_monitor(struct sock *sk, st=
ruct hci_dev *hdev,
>         hci_dev_lock(hdev);
>
>         if (pending_find(MGMT_OP_SET_LE, hdev) ||
> -           pending_find(MGMT_OP_REMOVE_ADV_MONITOR, hdev) ||
>             pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR, hdev) ||
>             pending_find(MGMT_OP_ADD_ADV_PATTERNS_MONITOR_RSSI, hdev)) {
>                 status =3D MGMT_STATUS_BUSY;
>                 goto unlock;
>         }
>
> -       cmd =3D mgmt_pending_add(sk, MGMT_OP_REMOVE_ADV_MONITOR, hdev, da=
ta, len);
> +       cmd =3D mgmt_pending_new(sk, MGMT_OP_REMOVE_ADV_MONITOR, hdev, da=
ta, len);
>         if (!cmd) {
>                 status =3D MGMT_STATUS_NO_RESOURCES;
>                 goto unlock;
> @@ -5462,7 +5447,7 @@ static int remove_adv_monitor(struct sock *sk, stru=
ct hci_dev *hdev,
>                                   mgmt_remove_adv_monitor_complete);
>
>         if (err) {
> -               mgmt_pending_remove(cmd);
> +               mgmt_pending_free(cmd);
>
>                 if (err =3D=3D -ENOMEM)
>                         status =3D MGMT_STATUS_NO_RESOURCES;
> --
> 2.49.0
>


--=20
Luiz Augusto von Dentz
