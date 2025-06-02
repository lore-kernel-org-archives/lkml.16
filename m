Received: from mail-il1-f199.google.com (mail-il1-f199.google.com [209.85.166.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B47FD22A4EF
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 18:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748887336; cv=none; b=pFM6t7JKlnqklhQEHomir8PUyeFaSbKnt+or/gMottJWbdmZiUJYeqgZCHO8qceYn+ad2ageCuiD5SNc9U95SIKb4suXK3gbxAwbOO3eGWvPqxSGmoe5lTOLSzcbBeybZYhAWMvVC4Mj4At7w0yK8gMOspDQylo/uPkOz0Vpubw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748887336; c=relaxed/simple;
	bh=EOwQZ8y5FLXVvLArV277cVDVOySAjMWs1kHwXfgM+9o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=W1fcfVOIlPhCBqc6hgQKj4ugvRdRgydNZ+LHqCGMxHlH0fSHjDl46RD5sgWstXHTUpkiQIWhvS4EVqVg2HDVMICAq+VSZFBSlduBPJwfsCYTE1KYsWN1mU1FiWsCqrj1ZYCBCaFuBz1QWOI1ivNLCiXJfJEvkffphwsuX6N5R04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3ddb4dcebfaso7965405ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 11:02:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748887333; x=1749492133;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RxgEDlKAl9SvUPYxrH9gt2BWWWvHZbZuX7cfipWR8k=;
        b=F1oIm7iqfFWSguyg6EEss4BfR7WvuaamTilp1RDV9vKMhyGR2r/wCTEmqgCqlnnbpI
         FfreuHHoarvigUGLrn2arx2BBtDgx/vHSToZknIq27V00iDZb1fLZ/L6snpv+t4ghYlg
         PF28Ayo2EAcqUaLgs6X3y5zunB2Y0PzSpUgLcYwadaJ1oH4E07ImFXR3ajTguJZyYaL7
         JLsHp1Yg8KX6flEEku0cGlhp0r/jujkc+lv3O65fYVwVeNkYH/3ODQuCzNff8xnjyx7S
         DdsYHBfKrhxeN2/FI4ZpL6nI8pIjRJHlA1aOcLP92xT5NY2saWwY2ScaVlbGtenqRTrW
         zjjg==
X-Gm-Message-State: AOJu0Yy8EetqiMzyqoGCZDzJbBxjkLPx0cjB95+CXt/ji50MlhmlO3M5
	Kwsv3Sjof9lZVUnnQagW5Fw/f+sM4o8og8ss6qdy2TBserFkBVfGtlZIH1x9GFpwI1CX8NbOnaE
	tf5HTxIoRPb39/VuxL+hJpVh1QNqxWQ23Hpg4QROeZvaKvjcS5M8PO/z3bTQ=
X-Google-Smtp-Source: AGHT+IFuC8FVbmpqE2msgnBxx7MI7aZruWxlGuuxSVum9jDEg1pgR71XN7vlGKvQEhLP/uH4Sb3fTHX6V4+QW8wSzCOa/ARvSORF
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c269:0:b0:3da:71ea:91c2 with SMTP id
 e9e14a558f8ab-3dd99c418cfmr169524165ab.22.1748887332683; Mon, 02 Jun 2025
 11:02:12 -0700 (PDT)
Date: Mon, 02 Jun 2025 11:02:12 -0700
In-Reply-To: <000000000000782b4706210a8dcd@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <683de724.a00a0220.d8eae.0056.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH v3] Bluetooth: MGMT: Protect mgmt_pending
 list with its own lock
From: syzbot <syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH v3] Bluetooth: MGMT: Protect mgmt_pending list with its=
 own lock
Author: luiz.dentz@gmail.com

#syz test

On Mon, Jun 2, 2025 at 2:01=E2=80=AFPM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> #syz test
>
> On Mon, Jun 2, 2025 at 2:00=E2=80=AFPM Luiz Augusto von Dentz <luiz.dentz=
@gmail.com> wrote:
> >
> > #syz test
> >
> > On Mon, Jun 2, 2025 at 1:46=E2=80=AFPM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > >
> > > This uses a mutex to protect from concurrent access of mgmt_pending
> > > list which can cause crashes like:
> > >
> > > =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > > BUG: KASAN: slab-use-after-free in mgmt_remove_adv_monitor_complete+0=
xe5/0x540 net/bluetooth/mgmt.c:5405
> > > Read of size 8 at addr ffff888048891a18 by task kworker/u5:8/5333
> > >
> > > CPU: 0 UID: 0 PID: 5333 Comm: kworker/u5:8 Not tainted 6.15.0-rc5-syz=
kaller-00197-gea34704d6ad7 #0 PREEMPT(full)
> > > Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debia=
n-1.16.3-2~bpo12+1 04/01/2014
> > > Workqueue: hci0 hci_cmd_sync_work
> > > Call Trace:
> > >  <TASK>
> > >  dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
> > >  print_address_description mm/kasan/report.c:408 [inline]
> > >  print_report+0xb4/0x290 mm/kasan/report.c:521
> > >  kasan_report+0x118/0x150 mm/kasan/report.c:634
> > >  mgmt_remove_adv_monitor_complete+0xe5/0x540 net/bluetooth/mgmt.c:540=
5
> > >  hci_cmd_sync_work+0x25e/0x3a0 net/bluetooth/hci_sync.c:334
> > >  process_one_work kernel/workqueue.c:3238 [inline]
> > >  process_scheduled_works+0xadb/0x17a0 kernel/workqueue.c:3319
> > >  worker_thread+0x8a0/0xda0 kernel/workqueue.c:3400
> > >  kthread+0x70e/0x8a0 kernel/kthread.c:464
> > >  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
> > >  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
> > >  </TASK>
> > >
> > > Allocated by task 5702:
> > >  kasan_save_stack mm/kasan/common.c:47 [inline]
> > >  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
> > >  poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
> > >  __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:394
> > >  kasan_kmalloc include/linux/kasan.h:260 [inline]
> > >  __kmalloc_cache_noprof+0x230/0x3d0 mm/slub.c:4358
> > >  kmalloc_noprof include/linux/slab.h:905 [inline]
> > >  kzalloc_noprof include/linux/slab.h:1039 [inline]
> > >  mgmt_pending_new+0x65/0x240 net/bluetooth/mgmt_util.c:252
> > >  mgmt_pending_add+0x34/0x120 net/bluetooth/mgmt_util.c:279
> > >  remove_adv_monitor+0x103/0x1b0 net/bluetooth/mgmt.c:5453
> > >  hci_mgmt_cmd+0x9c6/0xef0 net/bluetooth/hci_sock.c:1712
> > >  hci_sock_sendmsg+0x6ca/0xee0 net/bluetooth/hci_sock.c:1832
> > >  sock_sendmsg_nosec net/socket.c:712 [inline]
> > >  __sock_sendmsg+0x219/0x270 net/socket.c:727
> > >  sock_write_iter+0x258/0x330 net/socket.c:1131
> > >  new_sync_write fs/read_write.c:591 [inline]
> > >  vfs_write+0x548/0xa90 fs/read_write.c:684
> > >  ksys_write+0x145/0x250 fs/read_write.c:736
> > >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > >  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
> > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > >
> > > Freed by task 5700:
> > >  kasan_save_stack mm/kasan/common.c:47 [inline]
> > >  kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
> > >  kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
> > >  poison_slab_object mm/kasan/common.c:247 [inline]
> > >  __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
> > >  kasan_slab_free include/linux/kasan.h:233 [inline]
> > >  slab_free_hook mm/slub.c:2380 [inline]
> > >  slab_free mm/slub.c:4642 [inline]
> > >  kfree+0x193/0x440 mm/slub.c:4841
> > >  mgmt_pending_foreach+0xc9/0x120 net/bluetooth/mgmt_util.c:242
> > >  mgmt_index_removed+0x10d/0x2f0 net/bluetooth/mgmt.c:9362
> > >  hci_sock_bind+0xbe9/0x1000 net/bluetooth/hci_sock.c:1307
> > >  __sys_bind_socket net/socket.c:1810 [inline]
> > >  __sys_bind+0x2c3/0x3e0 net/socket.c:1841
> > >  __do_sys_bind net/socket.c:1846 [inline]
> > >  __se_sys_bind net/socket.c:1844 [inline]
> > >  __x64_sys_bind+0x7a/0x90 net/socket.c:1844
> > >  do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
> > >  do_syscall_64+0xf6/0x210 arch/x86/entry/syscall_64.c:94
> > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > >
> > > Fixes: a380b6cff1a2 ("Bluetooth: Add generic mgmt helper API")
> > > Closes: https://syzkaller.appspot.com/bug?extid=3Dfeb0dc579bbe30a1319=
0
> > > Closes: https://syzkaller.appspot.com/bug?extid=3D0a7039d5d9986ff4ece=
ci
> > > Closes: https://syzkaller.appspot.com/bug?extid=3Dcc0cc52e7f43dc9e6df=
1
> > > Reported-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
> > > Tested-by: syzbot+feb0dc579bbe30a13190@syzkaller.appspotmail.com
> > > Tested-by: syzbot+0a7039d5d9986ff4ecec@syzkaller.appspotmail.com
> > > Tested-by: syzbot+cc0cc52e7f43dc9e6df1@syzkaller.appspotmail.com
> > > Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> > > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > > ---
> > >  include/net/bluetooth/hci_core.h |   1 +
> > >  net/bluetooth/hci_core.c         |   1 +
> > >  net/bluetooth/mgmt.c             | 101 +++++++++++++++--------------=
--
> > >  net/bluetooth/mgmt_util.c        |  32 ++++++++--
> > >  net/bluetooth/mgmt_util.h        |   4 +-
> > >  5 files changed, 80 insertions(+), 59 deletions(-)
> > >
> > > diff --git a/include/net/bluetooth/hci_core.h b/include/net/bluetooth=
/hci_core.h
> > > index 2b261e74e2c4..b9ff0e825071 100644
> > > --- a/include/net/bluetooth/hci_core.h
> > > +++ b/include/net/bluetooth/hci_core.h
> > > @@ -546,6 +546,7 @@ struct hci_dev {
> > >         struct hci_conn_hash    conn_hash;
> > >
> > >         struct list_head        mesh_pending;
> > > +       struct mutex            mgmt_pending_lock;
> > >         struct list_head        mgmt_pending;
> > >         struct list_head        reject_list;
> > >         struct list_head        accept_list;
> > > diff --git a/net/bluetooth/hci_core.c b/net/bluetooth/hci_core.c
> > > index 04845ff3ad57..f197f5497043 100644
> > > --- a/net/bluetooth/hci_core.c
> > > +++ b/net/bluetooth/hci_core.c
> > > @@ -2487,6 +2487,7 @@ struct hci_dev *hci_alloc_dev_priv(int sizeof_p=
riv)
> > >
> > >         mutex_init(&hdev->lock);
> > >         mutex_init(&hdev->req_lock);
> > > +       mutex_init(&hdev->mgmt_pending_lock);
> > >
> > >         ida_init(&hdev->unset_handle_ida);
> > >
> > > diff --git a/net/bluetooth/mgmt.c b/net/bluetooth/mgmt.c
> > > index 14a9462fced5..7d9ed7db377f 100644
> > > --- a/net/bluetooth/mgmt.c
> > > +++ b/net/bluetooth/mgmt.c
> > > @@ -1447,22 +1447,17 @@ static void settings_rsp(struct mgmt_pending_=
cmd *cmd, void *data)
> > >
> > >         send_settings_rsp(cmd->sk, cmd->opcode, match->hdev);
> > >
> > > -       list_del(&cmd->list);
> > > -
> > >         if (match->sk =3D=3D NULL) {
> > >                 match->sk =3D cmd->sk;
> > >                 sock_hold(match->sk);
> > >         }
> > > -
> > > -       mgmt_pending_free(cmd);
> > >  }
> > >
> > >  static void cmd_status_rsp(struct mgmt_pending_cmd *cmd, void *data)
> > >  {
> > >         u8 *status =3D data;
> > >
> > > -       mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, *status);
> > > -       mgmt_pending_remove(cmd);
> > > +       mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, *status)=
;
> > >  }
> > >
> > >  static void cmd_complete_rsp(struct mgmt_pending_cmd *cmd, void *dat=
a)
> > > @@ -1476,8 +1471,6 @@ static void cmd_complete_rsp(struct mgmt_pendin=
g_cmd *cmd, void *data)
> > >
> > >         if (cmd->cmd_complete) {
> > >                 cmd->cmd_complete(cmd, match->mgmt_status);
> > > -               mgmt_pending_remove(cmd);
> > > -
> > >                 return;
> > >         }
> > >
> > > @@ -1486,13 +1479,13 @@ static void cmd_complete_rsp(struct mgmt_pend=
ing_cmd *cmd, void *data)
> > >
> > >  static int generic_cmd_complete(struct mgmt_pending_cmd *cmd, u8 sta=
tus)
> > >  {
> > > -       return mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, st=
atus,
> > > +       return mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,=
 status,
> > >                                  cmd->param, cmd->param_len);
> > >  }
> > >
> > >  static int addr_cmd_complete(struct mgmt_pending_cmd *cmd, u8 status=
)
> > >  {
> > > -       return mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, st=
atus,
> > > +       return mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,=
 status,
> > >                                  cmd->param, sizeof(struct mgmt_addr_=
info));
> > >  }
> > >
> > > @@ -1532,7 +1525,7 @@ static void mgmt_set_discoverable_complete(stru=
ct hci_dev *hdev, void *data,
> > >
> > >         if (err) {
> > >                 u8 mgmt_err =3D mgmt_status(err);
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgm=
t_err);
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, =
mgmt_err);
> > >                 hci_dev_clear_flag(hdev, HCI_LIMITED_DISCOVERABLE);
> > >                 goto done;
> > >         }
> > > @@ -1707,7 +1700,7 @@ static void mgmt_set_connectable_complete(struc=
t hci_dev *hdev, void *data,
> > >
> > >         if (err) {
> > >                 u8 mgmt_err =3D mgmt_status(err);
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgm=
t_err);
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, =
mgmt_err);
> > >                 goto done;
> > >         }
> > >
> > > @@ -1943,8 +1936,8 @@ static void set_ssp_complete(struct hci_dev *hd=
ev, void *data, int err)
> > >                         new_settings(hdev, NULL);
> > >                 }
> > >
> > > -               mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, cmd_statu=
s_rsp,
> > > -                                    &mgmt_err);
> > > +               mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, true,
> > > +                                    cmd_status_rsp, &mgmt_err);
> > >                 return;
> > >         }
> > >
> > > @@ -1954,7 +1947,7 @@ static void set_ssp_complete(struct hci_dev *hd=
ev, void *data, int err)
> > >                 changed =3D hci_dev_test_and_clear_flag(hdev, HCI_SSP=
_ENABLED);
> > >         }
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, settings_rsp, &ma=
tch);
> > > +       mgmt_pending_foreach(MGMT_OP_SET_SSP, hdev, true, settings_rs=
p, &match);
> > >
> > >         if (changed)
> > >                 new_settings(hdev, match.sk);
> > > @@ -2074,12 +2067,12 @@ static void set_le_complete(struct hci_dev *h=
dev, void *data, int err)
> > >         bt_dev_dbg(hdev, "err %d", err);
> > >
> > >         if (status) {
> > > -               mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, cmd_status=
_rsp,
> > > -                                                       &status);
> > > +               mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, true, cmd_=
status_rsp,
> > > +                                    &status);
> > >                 return;
> > >         }
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, settings_rsp, &mat=
ch);
> > > +       mgmt_pending_foreach(MGMT_OP_SET_LE, hdev, true, settings_rsp=
, &match);
> > >
> > >         new_settings(hdev, match.sk);
> > >
> > > @@ -2138,7 +2131,7 @@ static void set_mesh_complete(struct hci_dev *h=
dev, void *data, int err)
> > >         struct sock *sk =3D cmd->sk;
> > >
> > >         if (status) {
> > > -               mgmt_pending_foreach(MGMT_OP_SET_MESH_RECEIVER, hdev,
> > > +               mgmt_pending_foreach(MGMT_OP_SET_MESH_RECEIVER, hdev,=
 true,
> > >                                      cmd_status_rsp, &status);
> > >                 return;
> > >         }
> > > @@ -2638,7 +2631,7 @@ static void mgmt_class_complete(struct hci_dev =
*hdev, void *data, int err)
> > >
> > >         bt_dev_dbg(hdev, "err %d", err);
> > >
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                           mgmt_status(err), hdev->dev_class, 3);
> > >
> > >         mgmt_pending_free(cmd);
> > > @@ -3427,7 +3420,7 @@ static int pairing_complete(struct mgmt_pending=
_cmd *cmd, u8 status)
> > >         bacpy(&rp.addr.bdaddr, &conn->dst);
> > >         rp.addr.type =3D link_to_bdaddr(conn->type, conn->dst_type);
> > >
> > > -       err =3D mgmt_cmd_complete(cmd->sk, cmd->index, MGMT_OP_PAIR_D=
EVICE,
> > > +       err =3D mgmt_cmd_complete(cmd->sk, cmd->hdev->id, MGMT_OP_PAI=
R_DEVICE,
> > >                                 status, &rp, sizeof(rp));
> > >
> > >         /* So we don't get further callbacks for this connection */
> > > @@ -5196,7 +5189,7 @@ static void mgmt_add_adv_patterns_monitor_compl=
ete(struct hci_dev *hdev,
> > >                 hci_update_passive_scan(hdev);
> > >         }
> > >
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                           mgmt_status(status), &rp, sizeof(rp));
> > >         mgmt_pending_remove(cmd);
> > >
> > > @@ -5411,7 +5404,7 @@ static void mgmt_remove_adv_monitor_complete(st=
ruct hci_dev *hdev,
> > >         if (!status)
> > >                 hci_update_passive_scan(hdev);
> > >
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                           mgmt_status(status), &rp, sizeof(rp));
> > >         mgmt_pending_remove(cmd);
> > >
> > > @@ -5792,7 +5785,7 @@ static void start_discovery_complete(struct hci=
_dev *hdev, void *data, int err)
> > >             cmd !=3D pending_find(MGMT_OP_START_SERVICE_DISCOVERY, hd=
ev))
> > >                 return;
> > >
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, mgmt_stat=
us(err),
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_s=
tatus(err),
> > >                           cmd->param, 1);
> > >         mgmt_pending_remove(cmd);
> > >
> > > @@ -6013,7 +6006,7 @@ static void stop_discovery_complete(struct hci_=
dev *hdev, void *data, int err)
> > >
> > >         bt_dev_dbg(hdev, "err %d", err);
> > >
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, mgmt_stat=
us(err),
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, mgmt_s=
tatus(err),
> > >                           cmd->param, 1);
> > >         mgmt_pending_remove(cmd);
> > >
> > > @@ -6238,7 +6231,7 @@ static void set_advertising_complete(struct hci=
_dev *hdev, void *data, int err)
> > >         u8 status =3D mgmt_status(err);
> > >
> > >         if (status) {
> > > -               mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev,
> > > +               mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev, t=
rue,
> > >                                      cmd_status_rsp, &status);
> > >                 return;
> > >         }
> > > @@ -6248,7 +6241,7 @@ static void set_advertising_complete(struct hci=
_dev *hdev, void *data, int err)
> > >         else
> > >                 hci_dev_clear_flag(hdev, HCI_ADVERTISING);
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev, settings_=
rsp,
> > > +       mgmt_pending_foreach(MGMT_OP_SET_ADVERTISING, hdev, true, set=
tings_rsp,
> > >                              &match);
> > >
> > >         new_settings(hdev, match.sk);
> > > @@ -6592,7 +6585,7 @@ static void set_bredr_complete(struct hci_dev *=
hdev, void *data, int err)
> > >                  */
> > >                 hci_dev_clear_flag(hdev, HCI_BREDR_ENABLED);
> > >
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgm=
t_err);
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, =
mgmt_err);
> > >         } else {
> > >                 send_settings_rsp(cmd->sk, MGMT_OP_SET_BREDR, hdev);
> > >                 new_settings(hdev, cmd->sk);
> > > @@ -6729,7 +6722,7 @@ static void set_secure_conn_complete(struct hci=
_dev *hdev, void *data, int err)
> > >         if (err) {
> > >                 u8 mgmt_err =3D mgmt_status(err);
> > >
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode, mgm=
t_err);
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode, =
mgmt_err);
> > >                 goto done;
> > >         }
> > >
> > > @@ -7176,7 +7169,7 @@ static void get_conn_info_complete(struct hci_d=
ev *hdev, void *data, int err)
> > >                 rp.max_tx_power =3D HCI_TX_POWER_INVALID;
> > >         }
> > >
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, MGMT_OP_GET_CONN_INFO,=
 status,
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, MGMT_OP_GET_CONN_IN=
FO, status,
> > >                           &rp, sizeof(rp));
> > >
> > >         mgmt_pending_free(cmd);
> > > @@ -7336,7 +7329,7 @@ static void get_clock_info_complete(struct hci_=
dev *hdev, void *data, int err)
> > >         }
> > >
> > >  complete:
> > > -       mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode, status, &=
rp,
> > > +       mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode, status=
, &rp,
> > >                           sizeof(rp));
> > >
> > >         mgmt_pending_free(cmd);
> > > @@ -8586,10 +8579,10 @@ static void add_advertising_complete(struct h=
ci_dev *hdev, void *data, int err)
> > >         rp.instance =3D cp->instance;
> > >
> > >         if (err)
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                                 mgmt_status(err));
> > >         else
> > > -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode=
,
> > >                                   mgmt_status(err), &rp, sizeof(rp));
> > >
> > >         add_adv_complete(hdev, cmd->sk, cp->instance, err);
> > > @@ -8777,10 +8770,10 @@ static void add_ext_adv_params_complete(struc=
t hci_dev *hdev, void *data,
> > >
> > >                 hci_remove_adv_instance(hdev, cp->instance);
> > >
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                                 mgmt_status(err));
> > >         } else {
> > > -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode=
,
> > >                                   mgmt_status(err), &rp, sizeof(rp));
> > >         }
> > >
> > > @@ -8927,10 +8920,10 @@ static void add_ext_adv_data_complete(struct =
hci_dev *hdev, void *data, int err)
> > >         rp.instance =3D cp->instance;
> > >
> > >         if (err)
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                                 mgmt_status(err));
> > >         else
> > > -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode=
,
> > >                                   mgmt_status(err), &rp, sizeof(rp));
> > >
> > >         mgmt_pending_free(cmd);
> > > @@ -9089,10 +9082,10 @@ static void remove_advertising_complete(struc=
t hci_dev *hdev, void *data,
> > >         rp.instance =3D cp->instance;
> > >
> > >         if (err)
> > > -               mgmt_cmd_status(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_status(cmd->sk, cmd->hdev->id, cmd->opcode,
> > >                                 mgmt_status(err));
> > >         else
> > > -               mgmt_cmd_complete(cmd->sk, cmd->index, cmd->opcode,
> > > +               mgmt_cmd_complete(cmd->sk, cmd->hdev->id, cmd->opcode=
,
> > >                                   MGMT_STATUS_SUCCESS, &rp, sizeof(rp=
));
> > >
> > >         mgmt_pending_free(cmd);
> > > @@ -9364,7 +9357,7 @@ void mgmt_index_removed(struct hci_dev *hdev)
> > >         if (test_bit(HCI_QUIRK_RAW_DEVICE, &hdev->quirks))
> > >                 return;
> > >
> > > -       mgmt_pending_foreach(0, hdev, cmd_complete_rsp, &match);
> > > +       mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match)=
;
> > >
> > >         if (hci_dev_test_flag(hdev, HCI_UNCONFIGURED)) {
> > >                 mgmt_index_event(MGMT_EV_UNCONF_INDEX_REMOVED, hdev, =
NULL, 0,
> > > @@ -9402,7 +9395,8 @@ void mgmt_power_on(struct hci_dev *hdev, int er=
r)
> > >                 hci_update_passive_scan(hdev);
> > >         }
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, settings_rsp,=
 &match);
> > > +       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, true, setting=
s_rsp,
> > > +                            &match);
> > >
> > >         new_settings(hdev, match.sk);
> > >
> > > @@ -9417,7 +9411,8 @@ void __mgmt_power_off(struct hci_dev *hdev)
> > >         struct cmd_lookup match =3D { NULL, hdev };
> > >         u8 zero_cod[] =3D { 0, 0, 0 };
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, settings_rsp,=
 &match);
> > > +       mgmt_pending_foreach(MGMT_OP_SET_POWERED, hdev, true, setting=
s_rsp,
> > > +                            &match);
> > >
> > >         /* If the power off is because of hdev unregistration let
> > >          * use the appropriate INVALID_INDEX status. Otherwise use
> > > @@ -9431,7 +9426,7 @@ void __mgmt_power_off(struct hci_dev *hdev)
> > >         else
> > >                 match.mgmt_status =3D MGMT_STATUS_NOT_POWERED;
> > >
> > > -       mgmt_pending_foreach(0, hdev, cmd_complete_rsp, &match);
> > > +       mgmt_pending_foreach(0, hdev, true, cmd_complete_rsp, &match)=
;
> > >
> > >         if (memcmp(hdev->dev_class, zero_cod, sizeof(zero_cod)) !=3D =
0) {
> > >                 mgmt_limited_event(MGMT_EV_CLASS_OF_DEV_CHANGED, hdev=
,
> > > @@ -9672,7 +9667,6 @@ static void unpair_device_rsp(struct mgmt_pendi=
ng_cmd *cmd, void *data)
> > >         device_unpaired(hdev, &cp->addr.bdaddr, cp->addr.type, cmd->s=
k);
> > >
> > >         cmd->cmd_complete(cmd, 0);
> > > -       mgmt_pending_remove(cmd);
> > >  }
> > >
> > >  bool mgmt_powering_down(struct hci_dev *hdev)
> > > @@ -9728,8 +9722,8 @@ void mgmt_disconnect_failed(struct hci_dev *hde=
v, bdaddr_t *bdaddr,
> > >         struct mgmt_cp_disconnect *cp;
> > >         struct mgmt_pending_cmd *cmd;
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_UNPAIR_DEVICE, hdev, unpair_devi=
ce_rsp,
> > > -                            hdev);
> > > +       mgmt_pending_foreach(MGMT_OP_UNPAIR_DEVICE, hdev, true,
> > > +                            unpair_device_rsp, hdev);
> > >
> > >         cmd =3D pending_find(MGMT_OP_DISCONNECT, hdev);
> > >         if (!cmd)
> > > @@ -9922,7 +9916,7 @@ void mgmt_auth_enable_complete(struct hci_dev *=
hdev, u8 status)
> > >
> > >         if (status) {
> > >                 u8 mgmt_err =3D mgmt_status(status);
> > > -               mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev,
> > > +               mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev,=
 true,
> > >                                      cmd_status_rsp, &mgmt_err);
> > >                 return;
> > >         }
> > > @@ -9932,8 +9926,8 @@ void mgmt_auth_enable_complete(struct hci_dev *=
hdev, u8 status)
> > >         else
> > >                 changed =3D hci_dev_test_and_clear_flag(hdev, HCI_LIN=
K_SECURITY);
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev, setting=
s_rsp,
> > > -                            &match);
> > > +       mgmt_pending_foreach(MGMT_OP_SET_LINK_SECURITY, hdev, true,
> > > +                            settings_rsp, &match);
> > >
> > >         if (changed)
> > >                 new_settings(hdev, match.sk);
> > > @@ -9957,9 +9951,12 @@ void mgmt_set_class_of_dev_complete(struct hci=
_dev *hdev, u8 *dev_class,
> > >  {
> > >         struct cmd_lookup match =3D { NULL, hdev, mgmt_status(status)=
 };
> > >
> > > -       mgmt_pending_foreach(MGMT_OP_SET_DEV_CLASS, hdev, sk_lookup, =
&match);
> > > -       mgmt_pending_foreach(MGMT_OP_ADD_UUID, hdev, sk_lookup, &matc=
h);
> > > -       mgmt_pending_foreach(MGMT_OP_REMOVE_UUID, hdev, sk_lookup, &m=
atch);
> > > +       mgmt_pending_foreach(MGMT_OP_SET_DEV_CLASS, hdev, false, sk_l=
ookup,
> > > +                            &match);
> > > +       mgmt_pending_foreach(MGMT_OP_ADD_UUID, hdev, false, sk_lookup=
,
> > > +                            &match);
> > > +       mgmt_pending_foreach(MGMT_OP_REMOVE_UUID, hdev, false, sk_loo=
kup,
> > > +                            &match);
> > >
> > >         if (!status) {
> > >                 mgmt_limited_event(MGMT_EV_CLASS_OF_DEV_CHANGED, hdev=
, dev_class,
> > > diff --git a/net/bluetooth/mgmt_util.c b/net/bluetooth/mgmt_util.c
> > > index 3713ff490c65..a88a07da3947 100644
> > > --- a/net/bluetooth/mgmt_util.c
> > > +++ b/net/bluetooth/mgmt_util.c
> > > @@ -217,30 +217,47 @@ int mgmt_cmd_complete(struct sock *sk, u16 inde=
x, u16 cmd, u8 status,
> > >  struct mgmt_pending_cmd *mgmt_pending_find(unsigned short channel, u=
16 opcode,
> > >                                            struct hci_dev *hdev)
> > >  {
> > > -       struct mgmt_pending_cmd *cmd;
> > > +       struct mgmt_pending_cmd *cmd, *tmp;
> > >
> > > -       list_for_each_entry(cmd, &hdev->mgmt_pending, list) {
> > > +       mutex_lock(&hdev->mgmt_pending_lock);
> > > +
> > > +       list_for_each_entry_safe(cmd, tmp, &hdev->mgmt_pending, list)=
 {
> > >                 if (hci_sock_get_channel(cmd->sk) !=3D channel)
> > >                         continue;
> > > -               if (cmd->opcode =3D=3D opcode)
> > > +
> > > +               if (cmd->opcode =3D=3D opcode) {
> > > +                       mutex_unlock(&hdev->mgmt_pending_lock);
> > >                         return cmd;
> > > +               }
> > >         }
> > >
> > > +       mutex_unlock(&hdev->mgmt_pending_lock);
> > > +
> > >         return NULL;
> > >  }
> > >
> > > -void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev,
> > > +void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev, bool rem=
ove,
> > >                           void (*cb)(struct mgmt_pending_cmd *cmd, vo=
id *data),
> > >                           void *data)
> > >  {
> > >         struct mgmt_pending_cmd *cmd, *tmp;
> > >
> > > +       mutex_lock(&hdev->mgmt_pending_lock);
> > > +
> > >         list_for_each_entry_safe(cmd, tmp, &hdev->mgmt_pending, list)=
 {
> > >                 if (opcode > 0 && cmd->opcode !=3D opcode)
> > >                         continue;
> > >
> > > +               if (remove)
> > > +                       list_del(&cmd->list);
> > > +
> > >                 cb(cmd, data);
> > > +
> > > +               if (remove)
> > > +                       mgmt_pending_free(cmd);
> > >         }
> > > +
> > > +       mutex_unlock(&hdev->mgmt_pending_lock);
> > >  }
> > >
> > >  struct mgmt_pending_cmd *mgmt_pending_new(struct sock *sk, u16 opcod=
e,
> > > @@ -254,7 +271,7 @@ struct mgmt_pending_cmd *mgmt_pending_new(struct =
sock *sk, u16 opcode,
> > >                 return NULL;
> > >
> > >         cmd->opcode =3D opcode;
> > > -       cmd->index =3D hdev->id;
> > > +       cmd->hdev =3D hdev;
> > >
> > >         cmd->param =3D kmemdup(data, len, GFP_KERNEL);
> > >         if (!cmd->param) {
> > > @@ -280,7 +297,9 @@ struct mgmt_pending_cmd *mgmt_pending_add(struct =
sock *sk, u16 opcode,
> > >         if (!cmd)
> > >                 return NULL;
> > >
> > > +       mutex_lock(&hdev->mgmt_pending_lock);
> > >         list_add_tail(&cmd->list, &hdev->mgmt_pending);
> > > +       mutex_unlock(&hdev->mgmt_pending_lock);
> > >
> > >         return cmd;
> > >  }
> > > @@ -294,7 +313,10 @@ void mgmt_pending_free(struct mgmt_pending_cmd *=
cmd)
> > >
> > >  void mgmt_pending_remove(struct mgmt_pending_cmd *cmd)
> > >  {
> > > +       mutex_lock(&cmd->hdev->mgmt_pending_lock);
> > >         list_del(&cmd->list);
> > > +       mutex_unlock(&cmd->hdev->mgmt_pending_lock);
> > > +
> > >         mgmt_pending_free(cmd);
> > >  }
> > >
> > > diff --git a/net/bluetooth/mgmt_util.h b/net/bluetooth/mgmt_util.h
> > > index f2ba994ab1d8..024e51dd6937 100644
> > > --- a/net/bluetooth/mgmt_util.h
> > > +++ b/net/bluetooth/mgmt_util.h
> > > @@ -33,7 +33,7 @@ struct mgmt_mesh_tx {
> > >  struct mgmt_pending_cmd {
> > >         struct list_head list;
> > >         u16 opcode;
> > > -       int index;
> > > +       struct hci_dev *hdev;
> > >         void *param;
> > >         size_t param_len;
> > >         struct sock *sk;
> > > @@ -54,7 +54,7 @@ int mgmt_cmd_complete(struct sock *sk, u16 index, u=
16 cmd, u8 status,
> > >
> > >  struct mgmt_pending_cmd *mgmt_pending_find(unsigned short channel, u=
16 opcode,
> > >                                            struct hci_dev *hdev);
> > > -void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev,
> > > +void mgmt_pending_foreach(u16 opcode, struct hci_dev *hdev, bool rem=
ove,
> > >                           void (*cb)(struct mgmt_pending_cmd *cmd, vo=
id *data),
> > >                           void *data);
> > >  struct mgmt_pending_cmd *mgmt_pending_add(struct sock *sk, u16 opcod=
e,
> > > --
> > > 2.49.0
> > >
> >
> >
> > --
> > Luiz Augusto von Dentz
>
>
>
> --
> Luiz Augusto von Dentz



--=20
Luiz Augusto von Dentz
