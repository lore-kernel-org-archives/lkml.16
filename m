Received: from mail-io1-f71.google.com (mail-io1-f71.google.com [209.85.166.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66D17AD23
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 20:32:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748982732; cv=none; b=mY0mfLSWmPGMdRcUtHMIfHPN+xb16O2LY4b63eild+ogO+Iz2tsS494C9DLRoQtjCVhrNu1goF+5be9XqlTI19+LmsK6xyd0BSFJZwvM4k036/6I+V9oF+Ibw5l0d7+7zc+F3nPWgnkWwuT/RmPwjgZCTFXyfHeRkSkNtIkjnSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748982732; c=relaxed/simple;
	bh=x9e/uQjPZOBXgROKycxjpMdkRLsKzgDFPlxWs5vPoLc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=XcyZOEqDGriuiELrVRy7FySBtkTeEdTUKeKKwyoK+wWmCwWCl1Z+umj58PkcRBK5SzJEqW/ex/j027cRndJxCJZHawifwbVVZ9end8m9Qxbisf2M1j0VdLkAD7d9xBRb/W3yFpDc6jE8+6oZtWKu5XQ1fLnn2PXhv4Ki4/azqN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-io1-f71.google.com with SMTP id ca18e2360f4ac-86cfea700daso378608739f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 13:32:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748982729; x=1749587529;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YCV8hi2VIET5JOjyJuvhp19pmKvATKIElxBP1CSX99M=;
        b=CdwjXEqW194j34Q73zJTjJLBOu1AAJtgRXVK7sLUqscs8Qm8bCOefi1w+9dSO9LiWG
         TG2PHE/v+5ceezijFt89GjRVlxupeml/5qqqUk8qrR9RWv4eQbJGPLjA4EH/2FPDyPIY
         xXtJkRaYyBkDmIldi20zJeEhbCe2WWuKKuVSFAge/TlwWtEDCm/y1/lQE4KnN1eZbZX7
         z9X0Aj2DK63K5rGSzUE8GCPlQMDqtiVy62zwFcvH84HdnXhjwn9POLWJlzZJZXQMqNRp
         NT4DUpy5BdL462g78z5/ELEizuGo6ZE+jp7DXD4XPP0KpQmymH0rPIXmB+ncKD+8DPti
         3sQQ==
X-Gm-Message-State: AOJu0YxvEq72DABadLR3oF18Y+kFo4DCmn1ah5YFAibXbLUU4tEU4FpH
	IZSRKGVEFrVJ74ilaWqZ9PplqOdKaZzlk40t2neNTG0Uq9BcyzBMdtnlmNixJv2qbhcK06y0NS8
	9XQkmUqVNoMvU2D+0pamZxLsZBwQ907LY5650cj6ZLZYbevHwFB3nshduuM4=
X-Google-Smtp-Source: AGHT+IFZKa0KIy/a9S9lBUV5bj3Rp+9BdTIYwBhACs9GM6mHryQJPwyUsI5sWq4r3CvYKic8Aw733/BvYNxJvnmUWAXSwGvsfhKL
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19c6:b0:3dc:76ad:7990 with SMTP id
 e9e14a558f8ab-3ddbee4c45emr2980285ab.15.1748982729407; Tue, 03 Jun 2025
 13:32:09 -0700 (PDT)
Date: Tue, 03 Jun 2025 13:32:09 -0700
In-Reply-To: <6832ca5f.a70a0220.1765ec.015d.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683f5bc9.a00a0220.d8eae.0074.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH v4 2/2] Bluetooth: MGMT: Protect mgmt_pending
 list with its own lock
From: syzbot <syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH v4 2/2] Bluetooth: MGMT: Protect mgmt_pending list with=
 its own lock
Author: luiz.dentz@gmail.com

#syz test

On Tue, Jun 3, 2025 at 4:29=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
>
> This uses a mutex to protect from concurrent access of mgmt_pending
> list which can cause crashes like:
>
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> BUG: KASAN: slab-use-after-free in hci_sock_get_channel+0x60/0x68 net/blu=
etooth/hci_sock.c:91
> Read of size 2 at addr ffff0000c48885b2 by task syz.4.334/7318
>
> CPU: 0 UID: 0 PID: 7318 Comm: syz.4.334 Not tainted 6.15.0-rc7-syzkaller-=
g187899f4124a #0 PREEMPT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 02/12/2025
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
>  __dump_stack+0x30/0x40 lib/dump_stack.c:94
>  dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
>  print_address_description+0xa8/0x254 mm/kasan/report.c:408
>  print_report+0x68/0x84 mm/kasan/report.c:521
>  kasan_report+0xb0/0x110 mm/kasan/report.c:634
>  __asan_report_load2_noabort+0x20/0x2c mm/kasan/report_generic.c:379
>  hci_sock_get_channel+0x60/0x68 net/bluetooth/hci_sock.c:91
>  mgmt_pending_find+0x7c/0x140 net/bluetooth/mgmt_util.c:223
>  pending_find net/bluetooth/mgmt.c:947 [inline]
>  remove_adv_monitor+0x44/0x1a4 net/bluetooth/mgmt.c:5445
>  hci_mgmt_cmd+0x780/0xc00 net/bluetooth/hci_sock.c:1712
>  hci_sock_sendmsg+0x544/0xbb0 net/bluetooth/hci_sock.c:1832
>  sock_sendmsg_nosec net/socket.c:712 [inline]
>  __sock_sendmsg net/socket.c:727 [inline]
>  sock_write_iter+0x25c/0x378 net/socket.c:1131
>  new_sync_write fs/read_write.c:591 [inline]
>  vfs_write+0x62c/0x97c fs/read_write.c:684
>  ksys_write+0x120/0x210 fs/read_write.c:736
>  __do_sys_write fs/read_write.c:747 [inline]
>  __se_sys_write fs/read_write.c:744 [inline]
>  __arm64_sys_write+0x7c/0x90 fs/read_write.c:744
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> Allocated by task 7037:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>  kasan_save_alloc_info+0x44/0x54 mm/kasan/generic.c:562
>  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
>  __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:394
>  kasan_kmalloc include/linux/kasan.h:260 [inline]
>  __do_kmalloc_node mm/slub.c:4327 [inline]
>  __kmalloc_noprof+0x2fc/0x4c8 mm/slub.c:4339
>  kmalloc_noprof include/linux/slab.h:909 [inline]
>  sk_prot_alloc+0xc4/0x1f0 net/core/sock.c:2198
>  sk_alloc+0x44/0x3ac net/core/sock.c:2254
>  bt_sock_alloc+0x4c/0x300 net/bluetooth/af_bluetooth.c:148
>  hci_sock_create+0xa8/0x194 net/bluetooth/hci_sock.c:2202
>  bt_sock_create+0x14c/0x24c net/bluetooth/af_bluetooth.c:132
>  __sock_create+0x43c/0x91c net/socket.c:1541
>  sock_create net/socket.c:1599 [inline]
>  __sys_socket_create net/socket.c:1636 [inline]
>  __sys_socket+0xd4/0x1c0 net/socket.c:1683
>  __do_sys_socket net/socket.c:1697 [inline]
>  __se_sys_socket net/socket.c:1695 [inline]
>  __arm64_sys_socket+0x7c/0x94 net/socket.c:1695
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x58/0x17c arch/arm64/kernel/entry-common.c:767
>  el0t_64_sync_handler+0x78/0x108 arch/arm64/kernel/entry-common.c:786
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
>
> Freed by task 6607:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>  kasan_save_free_info+0x58/0x70 mm/kasan/generic.c:576
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x68/0x88 mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:233 [inline]
>  slab_free_hook mm/slub.c:2380 [inline]
>  slab_free mm/slub.c:4642 [inline]
>  kfree+0x17c/0x474 mm/slub.c:4841
>  sk_prot_free net/core/sock.c:2237 [inline]
>  __sk_destruct+0x4f4/0x760 net/core/sock.c:2332
>  sk_destruct net/core/sock.c:2360 [inline]
>  __sk_free+0x320/0x430 net/core/sock.c:2371
>  sk_free+0x60/0xc8 net/core/sock.c:2382
>  sock_put include/net/sock.h:1944 [inline]
>  mgmt_pending_free+0x88/0x118 net/bluetooth/mgmt_util.c:290
>  mgmt_pending_remove+0xec/0x104 net/bluetooth/mgmt_util.c:298
>  mgmt_set_powered_complete+0x418/0x5cc net/bluetooth/mgmt.c:1355
>  hci_cmd_sync_work+0x204/0x33c net/bluetooth/hci_sync.c:334
>  process_one_work+0x7e8/0x156c kernel/workqueue.c:3238
>  process_scheduled_works kernel/workqueue.c:3319 [inline]
>  worker_thread+0x958/0xed8 kernel/workqueue.c:3400
>  kthread+0x5fc/0x75c kernel/kthread.c:464
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:847
>
> Fixes: a380b6cff1a2 ("Bluetooth: Add generic mgmt helper API")
> Closes: https://syzkaller.appspot.com/bug?extid=3D0a7039d5d9986ff4ecec
> Closes: https://syzkaller.appspot.com/bug?extid=3Dcc0cc52e7f43dc9e6df1
> Reported-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
> Tested-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
> Tested-by: syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> ---
>  include/net/bluetooth/hci_core.h |   1 +
>  net/bluetooth/hci_core.c         |   1 +
>  net/bluetooth/mgmt.c             | 101 +++++++++++++++----------------
>  net/bluetooth/mgmt_util.c        |  32 ++++++++--
>  net/bluetooth/mgmt_util.h        |   4 +-
>  5 files changed, 80 insertions(+), 59 deletions(-)
>
> diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth/hci=
_core.h
> index 93fcb659f0d4..f7b1a9eb9543 100644
> --- a/include/net/bluetooth/hci_core.h
> +++ b/include/net/bluetooth/hci_core.h
> @@ -546,6 +546,7 @@ struct hci_dev {
>         struct hci_conn_hash    conn_hash;
>
>         struct list_head        mesh_pending;
> +       struct mutex            mgmt_pending_lock;
>         struct list_head        mgmt_pending;
>         struct list_head        reject_list;
>         struct list_head        accept_list;
> diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> index aeda2e4557d5..487c045a7ba8 100644
> --- a/net/bluetooth/hci_core.c
> +++ b/net/bluetooth/hci_core.c
> @@ -2485,6 +2485,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_priv)
>
>         mutex_init(&hdev->lock);
>         mutex_init(&hdev->req_lock);
> +       mutex_init(&hdev->mgmt_pending_lock);
>
>         ida_init(&hdev->unset_handle_ida);
>
> diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> index feaeec2423ae..de7adb9a47f9 100644
> --- a/net/bluetooth/mgmt.c
> +++ b/net/bluetooth/mgmt.c
> @@ -1447,22 +1447,17 @@ static void settings_rsp(struct mgmt_pending_cmd =
*cmd, void *data)
>
>         send_settings_rsp(cmd->sk, cmd->opcode, match->hdev);
>
> -       list_del(&cmd->list);
> -
>         if (match->sk =3D=3D NULL) {
>                 match->sk =3D cmd->sk;
>                 sock_hold(match->sk);
>         }
> -
> -       mgmt_pending_free(cmd);
>  }
>
>  static void cmd_status_rsp(struct mgmt_pending_cmd *cmd, void *data)
>  {
>         u8 *status =3D data;
>
> -       mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, *status);
> -       mgmt_pending_remove(cmd);
> +       mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, *status);
>  }
>
>  static void cmd_complete_rsp(struct mgmt_pending_cmd *cmd, void *data)
> @@ -1476,8 +1471,6 @@ static void cmd_complete_rsp(struct mgmt_pending_cm=
d *cmd, void *data)
>
>         if (cmd->cmd_complete) {
>                 cmd->cmd_complete(cmd, match->mgmt_status);
> -               mgmt_pending_remove(cmd);
> -
>                 return;
>         }
>
> @@ -1486,13 +1479,13 @@ static void cmd_complete_rsp(struct mgmt_pending_=
cmd *cmd, void *data)
>
>  static int generic_cmd_complete(struct mgmt_pending_cmd *cmd, u8 status)
>  {
> -       return mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, status=
,
> +       return mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, sta=
tus,
>                                  cmd->param, cmd->param_len);
>  }
>
>  static int addr_cmd_complete(struct mgmt_pending_cmd *cmd, u8 status)
>  {
> -       return mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, status=
,
> +       return mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, sta=
tus,
>                                  cmd->param, sizeof(struct mgmt_addr_info=
));
>  }
>
> @@ -1532,7 +1525,7 @@ static void mgmt_set_discoverable_complete(struct h=
ci_dev *hdev, void *data,
>
>         if (err) {
>                 u8 mgmt_err =3D mgmt_status(err);
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgmt_er=
r);
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt=
_err);
>                 hci_dev_clear_flag(hdev, HCI_LIMITED_DISCOVERABLE);
>                 goto done;
>         }
> @@ -1707,7 +1700,7 @@ static void mgmt_set_connectable_complete(struct hc=
i_dev *hdev, void *data,
>
>         if (err) {
>                 u8 mgmt_err =3D mgmt_status(err);
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgmt_er=
r);
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt=
_err);
>                 goto done;
>         }
>
> @@ -1943,8 +1936,8 @@ static void set_ssp_complete(struct hci_dev *hdev, =
void *data, int err)
>                         new_settings(hdev, NULL);
>                 }
>
> -               mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, cmd_status_rs=
p,
> -                                    &mgmt_err);
> +               mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, true,
> +                                    cmd_status_rsp, &mgmt_err);
>                 return;
>         }
>
> @@ -1954,7 +1947,7 @@ static void set_ssp_complete(struct hci_dev *hdev, =
void *data, int err)
>                 changed =3D hci_dev_test_and_clear_flag(hdev, HCI_SSP_ENA=
BLED);
>         }
>
> -       mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, settings_rsp, &match)=
;
> +       mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, true, settings_rsp, &=
match);
>
>         if (changed)
>                 new_settings(hdev, match.sk);
> @@ -2074,12 +2067,12 @@ static void set_le_complete(struct hci_dev *hdev,=
 void *data, int err)
>         bt_dev_dbg(hdev, "err %d", err);
>
>         if (status) {
> -               mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, cmd_status_rsp=
,
> -                                                       &status);
> +               mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, true, cmd_stat=
us_rsp,
> +                                    &status);
>                 return;
>         }
>
> -       mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, settings_rsp, &match);
> +       mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, true, settings_rsp, &m=
atch);
>
>         new_settings(hdev, match.sk);
>
> @@ -2138,7 +2131,7 @@ static void set_mesh_complete(struct hci_dev *hdev,=
 void *data, int err)
>         struct sock *sk =3D cmd->sk;
>
>         if (status) {
> -               mgmt_pending_foreach(MGMT_OP_SET_MESH_RECEIVER, hdev,
> +               mgmt_pending_foreach(MGMT_OP_SET_MESH_RECEIVER, hdev, tru=
e,
>                                      cmd_status_rsp, &status);
>                 return;
>         }
> @@ -2638,7 +2631,7 @@ static void mgmt_class_complete(struct hci_dev *hde=
v, void *data, int err)
>
>         bt_dev_dbg(hdev, "err %d", err);
>
> -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                           mgmt_status(err), hdev->dev_class, 3);
>
>         mgmt_pending_free(cmd);
> @@ -3427,7 +3420,7 @@ static int pairing_complete(struct mgmt_pending_cmd=
 *cmd, u8 status)
>         bacpy(&rp.addr.bdaddr, &conn->dst);
>         rp.addr.type =3D link_to_bdaddr(conn->type, conn->dst_type);
>
> -       err =3D mgmt_cmd_complete(cmd->sk, cmd->index, MGMT_OP_PAIR_DEVIC=
E,
> +       err =3D mgmt_cmd_complete(cmd->sk, cmd->hdev->id, MGMT_OP_PAIR_DE=
VICE,
>                                 status, &rp, sizeof(rp));
>
>         /* So we don't get further callbacks for this connection */
> @@ -5186,7 +5179,7 @@ static void mgmt_add_adv_patterns_monitor_complete(=
struct hci_dev *hdev,
>                 hci_update_passive_scan(hdev);
>         }
>
> -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                           mgmt_status(status), &rp, sizeof(rp));
>         mgmt_pending_remove(cmd);
>
> @@ -5401,7 +5394,7 @@ static void mgmt_remove_adv_monitor_complete(struct=
 hci_dev *hdev,
>                 hci_update_passive_scan(hdev);
>         }
>
> -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                           mgmt_status(status), &rp, sizeof(rp));
>         mgmt_pending_free(cmd);
>
> @@ -5777,7 +5770,7 @@ static void start_discovery_complete(struct hci_dev=
 *hdev, void *data, int err)
>             cmd !=3D pending_find(MGMT_OP_START_SERVICE_DISCOVERY, hdev))
>                 return;
>
> -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, mgmt_status(e=
rr),
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_statu=
s(err),
>                           cmd->param, 1);
>         mgmt_pending_remove(cmd);
>
> @@ -5998,7 +5991,7 @@ static void stop_discovery_complete(struct hci_dev =
*hdev, void *data, int err)
>
>         bt_dev_dbg(hdev, "err %d", err);
>
> -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, mgmt_status(e=
rr),
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_statu=
s(err),
>                           cmd->param, 1);
>         mgmt_pending_remove(cmd);
>
> @@ -6223,7 +6216,7 @@ static void set_advertising_complete(struct hci_dev=
 *hdev, void *data, int err)
>         u8 status =3D mgmt_status(err);
>
>         if (status) {
> -               mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev,
> +               mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev, true,
>                                      cmd_status_rsp, &status);
>                 return;
>         }
> @@ -6233,7 +6226,7 @@ static void set_advertising_complete(struct hci_dev=
 *hdev, void *data, int err)
>         else
>                 hci_dev_clear_flag(hdev, HCI_ADVERTISING);
>
> -       mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev, settings_rsp,
> +       mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev, true, setting=
s_rsp,
>                              &match);
>
>         new_settings(hdev, match.sk);
> @@ -6577,7 +6570,7 @@ static void set_bredr_complete(struct hci_dev *hdev=
, void *data, int err)
>                  */
>                 hci_dev_clear_flag(hdev, HCI_BREDR_ENABLED);
>
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgmt_er=
r);
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt=
_err);
>         } else {
>                 send_settings_rsp(cmd->sk, MGMT_OP_SET_BREDR, hdev);
>                 new_settings(hdev, cmd->sk);
> @@ -6714,7 +6707,7 @@ static void set_secure_conn_complete(struct hci_dev=
 *hdev, void *data, int err)
>         if (err) {
>                 u8 mgmt_err =3D mgmt_status(err);
>
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgmt_er=
r);
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt=
_err);
>                 goto done;
>         }
>
> @@ -7161,7 +7154,7 @@ static void get_conn_info_complete(struct hci_dev *=
hdev, void *data, int err)
>                 rp.max_tx_power =3D HCI_TX_POWER_INVALID;
>         }
>
> -       mgmt_cmd_complete(cmd->sk, cmd->index, MGMT_OP_GET_CONN_INFO, sta=
tus,
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, MGMT_OP_GET_CONN_INFO, =
status,
>                           &rp, sizeof(rp));
>
>         mgmt_pending_free(cmd);
> @@ -7321,7 +7314,7 @@ static void get_clock_info_complete(struct hci_dev =
*hdev, void *data, int err)
>         }
>
>  complete:
> -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, status, &rp,
> +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, status, &r=
p,
>                           sizeof(rp));
>
>         mgmt_pending_free(cmd);
> @@ -8571,10 +8564,10 @@ static void add_advertising_complete(struct hci_d=
ev *hdev, void *data, int err)
>         rp.instance =3D cp->instance;
>
>         if (err)
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                 mgmt_status(err));
>         else
> -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                   mgmt_status(err), &rp, sizeof(rp));
>
>         add_adv_complete(hdev, cmd->sk, cp->instance, err);
> @@ -8762,10 +8755,10 @@ static void add_ext_adv_params_complete(struct hc=
i_dev *hdev, void *data,
>
>                 hci_remove_adv_instance(hdev, cp->instance);
>
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                 mgmt_status(err));
>         } else {
> -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                   mgmt_status(err), &rp, sizeof(rp));
>         }
>
> @@ -8912,10 +8905,10 @@ static void add_ext_adv_data_complete(struct hci_=
dev *hdev, void *data, int err)
>         rp.instance =3D cp->instance;
>
>         if (err)
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                 mgmt_status(err));
>         else
> -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                   mgmt_status(err), &rp, sizeof(rp));
>
>         mgmt_pending_free(cmd);
> @@ -9074,10 +9067,10 @@ static void remove_advertising_complete(struct hc=
i_dev *hdev, void *data,
>         rp.instance =3D cp->instance;
>
>         if (err)
> -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                 mgmt_status(err));
>         else
> -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
>                                   MGMT_STATUS_SUCCESS, &rp, sizeof(rp));
>
>         mgmt_pending_free(cmd);
> @@ -9349,7 +9342,7 @@ void mgmt_index_removed(struct hci_dev *hdev)
>         if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
>                 return;
>
> -       mgmt_pending_foreach(0, hdev, cmd_complete_rsp, &match);
> +       mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match);
>
>         if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
>                 mgmt_index_event(MGMT_EV_UNCONF_INDEX_REMOVED, hdev, NULL=
, 0,
> @@ -9387,7 +9380,8 @@ void mgmt_power_on(struct hci_dev *hdev, int err)
>                 hci_update_passive_scan(hdev);
>         }
>
> -       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, settings_rsp, &ma=
tch);
> +       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, true, settings_rs=
p,
> +                            &match);
>
>         new_settings(hdev, match.sk);
>
> @@ -9402,7 +9396,8 @@ void __mgmt_power_off(struct hci_dev *hdev)
>         struct cmd_lookup match =3D { NULL, hdev };
>         u8 zero_cod[] =3D { 0, 0, 0 };
>
> -       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, settings_rsp, &ma=
tch);
> +       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, true, settings_rs=
p,
> +                            &match);
>
>         /* If the power off is because of hdev unregistration let
>          * use the appropriate INVALID_INDEX status. Otherwise use
> @@ -9416,7 +9411,7 @@ void __mgmt_power_off(struct hci_dev *hdev)
>         else
>                 match.mgmt_status =3D MGMT_STATUS_NOT_POWERED;
>
> -       mgmt_pending_foreach(0, hdev, cmd_complete_rsp, &match);
> +       mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match);
>
>         if (memcmp(hdev->dev_class, zero_cod, sizeof(zero_cod)) !=3D 0) {
>                 mgmt_limited_event(MGMT_EV_CLASS_OF_DEV_CHANGED, hdev,
> @@ -9657,7 +9652,6 @@ static void unpair_device_rsp(struct mgmt_pending_c=
md *cmd, void *data)
>         device_unpaired(hdev, &cp->addr.bdaddr, cp->addr.type, cmd->sk);
>
>         cmd->cmd_complete(cmd, 0);
> -       mgmt_pending_remove(cmd);
>  }
>
>  bool mgmt_powering_down(struct hci_dev *hdev)
> @@ -9713,8 +9707,8 @@ void mgmt_disconnect_failed(struct hci_dev *hdev, b=
daddr_t *bdaddr,
>         struct mgmt_cp_disconnect *cp;
>         struct mgmt_pending_cmd *cmd;
>
> -       mgmt_pending_foreach(MGMT_OP_UNPAIR_DEVICE, hdev, unpair_device_r=
sp,
> -                            hdev);
> +       mgmt_pending_foreach(MGMT_OP_UNPAIR_DEVICE, hdev, true,
> +                            unpair_device_rsp, hdev);
>
>         cmd =3D pending_find(MGMT_OP_DISCONNECT, hdev);
>         if (!cmd)
> @@ -9907,7 +9901,7 @@ void mgmt_auth_enable_complete(struct hci_dev *hdev=
, u8 status)
>
>         if (status) {
>                 u8 mgmt_err =3D mgmt_status(status);
> -               mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev,
> +               mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev, tru=
e,
>                                      cmd_status_rsp, &mgmt_err);
>                 return;
>         }
> @@ -9917,8 +9911,8 @@ void mgmt_auth_enable_complete(struct hci_dev *hdev=
, u8 status)
>         else
>                 changed =3D hci_dev_test_and_clear_flag(hdev, HCI_LINK_SE=
CURITY);
>
> -       mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev, settings_rs=
p,
> -                            &match);
> +       mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev, true,
> +                            settings_rsp, &match);
>
>         if (changed)
>                 new_settings(hdev, match.sk);
> @@ -9942,9 +9936,12 @@ void mgmt_set_class_of_dev_complete(struct hci_dev=
 *hdev, u8 *dev_class,
>  {
>         struct cmd_lookup match =3D { NULL, hdev, mgmt_status(status) };
>
> -       mgmt_pending_foreach(MGMT_OP_SET_DEV_CLASS, hdev, sk_lookup, &mat=
ch);
> -       mgmt_pending_foreach(MGMT_OP_ADD_UUID, hdev, sk_lookup, &match);
> -       mgmt_pending_foreach(MGMT_OP_REMOVE_UUID, hdev, sk_lookup, &match=
);
> +       mgmt_pending_foreach(MGMT_OP_SET_DEV_CLASS, hdev, false, sk_looku=
p,
> +                            &match);
> +       mgmt_pending_foreach(MGMT_OP_ADD_UUID, hdev, false, sk_lookup,
> +                            &match);
> +       mgmt_pending_foreach(MGMT_OP_REMOVE_UUID, hdev, false, sk_lookup,
> +                            &match);
>
>         if (!status) {
>                 mgmt_limited_event(MGMT_EV_CLASS_OF_DEV_CHANGED, hdev, de=
v_class,
> diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
> index 3713ff490c65..a88a07da3947 100644
> --- a/net/bluetooth/mgmt_util.c
> +++ b/net/bluetooth/mgmt_util.c
> @@ -217,30 +217,47 @@ int mgmt_cmd_complete(struct sock *sk, u16 index, u=
16 cmd, u8 status,
>  struct mgmt_pending_cmd *mgmt_pending_find(unsigned short channel, u16 o=
pcode,
>                                            struct hci_dev *hdev)
>  {
> -       struct mgmt_pending_cmd *cmd;
> +       struct mgmt_pending_cmd *cmd, *tmp;
>
> -       list_for_each_entry(cmd, &hdev->mgmt_pending, list) {
> +       mutex_lock(&hdev->mgmt_pending_lock);
> +
> +       list_for_each_entry_safe(cmd, tmp, &hdev->mgmt_pending, list) {
>                 if (hci_sock_get_channel(cmd->sk) !=3D channel)
>                         continue;
> -               if (cmd->opcode =3D=3D opcode)
> +
> +               if (cmd->opcode =3D=3D opcode) {
> +                       mutex_unlock(&hdev->mgmt_pending_lock);
>                         return cmd;
> +               }
>         }
>
> +       mutex_unlock(&hdev->mgmt_pending_lock);
> +
>         return NULL;
>  }
>
> -void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev,
> +void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev, bool remove,
>                           void (*cb)(struct mgmt_pending_cmd *cmd, void *=
data),
>                           void *data)
>  {
>         struct mgmt_pending_cmd *cmd, *tmp;
>
> +       mutex_lock(&hdev->mgmt_pending_lock);
> +
>         list_for_each_entry_safe(cmd, tmp, &hdev->mgmt_pending, list) {
>                 if (opcode > 0 && cmd->opcode !=3D opcode)
>                         continue;
>
> +               if (remove)
> +                       list_del(&cmd->list);
> +
>                 cb(cmd, data);
> +
> +               if (remove)
> +                       mgmt_pending_free(cmd);
>         }
> +
> +       mutex_unlock(&hdev->mgmt_pending_lock);
>  }
>
>  struct mgmt_pending_cmd *mgmt_pending_new(struct sock *sk, u16 opcode,
> @@ -254,7 +271,7 @@ struct mgmt_pending_cmd *mgmt_pending_new(struct sock=
 *sk, u16 opcode,
>                 return NULL;
>
>         cmd->opcode =3D opcode;
> -       cmd->index =3D hdev->id;
> +       cmd->hdev =3D hdev;
>
>         cmd->param =3D kmemdup(data, len, GFP_KERNEL);
>         if (!cmd->param) {
> @@ -280,7 +297,9 @@ struct mgmt_pending_cmd *mgmt_pending_add(struct sock=
 *sk, u16 opcode,
>         if (!cmd)
>                 return NULL;
>
> +       mutex_lock(&hdev->mgmt_pending_lock);
>         list_add_tail(&cmd->list, &hdev->mgmt_pending);
> +       mutex_unlock(&hdev->mgmt_pending_lock);
>
>         return cmd;
>  }
> @@ -294,7 +313,10 @@ void mgmt_pending_free(struct mgmt_pending_cmd *cmd)
>
>  void mgmt_pending_remove(struct mgmt_pending_cmd *cmd)
>  {
> +       mutex_lock(&cmd->hdev->mgmt_pending_lock);
>         list_del(&cmd->list);
> +       mutex_unlock(&cmd->hdev->mgmt_pending_lock);
> +
>         mgmt_pending_free(cmd);
>  }
>
> diff --git a/net/bluetooth/mgmt_util.h b/net/bluetooth/mgmt_util.h
> index f2ba994ab1d8..024e51dd6937 100644
> --- a/net/bluetooth/mgmt_util.h
> +++ b/net/bluetooth/mgmt_util.h
> @@ -33,7 +33,7 @@ struct mgmt_mesh_tx {
>  struct mgmt_pending_cmd {
>         struct list_head list;
>         u16 opcode;
> -       int index;
> +       struct hci_dev *hdev;
>         void *param;
>         size_t param_len;
>         struct sock *sk;
> @@ -54,7 +54,7 @@ int mgmt_cmd_complete(struct sock *sk, u16 index, u16 c=
md, u8 status,
>
>  struct mgmt_pending_cmd *mgmt_pending_find(unsigned short channel, u16 o=
pcode,
>                                            struct hci_dev *hdev);
> -void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev,
> +void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev, bool remove,
>                           void (*cb)(struct mgmt_pending_cmd *cmd, void *=
data),
>                           void *data);
>  struct mgmt_pending_cmd *mgmt_pending_add(struct sock *sk, u16 opcode,
> --
> 2.49.0
>


--=20
Luiz Augusto von Dentz
