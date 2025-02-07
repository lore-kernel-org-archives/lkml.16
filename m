Received: from mail-il1-f197.google.com (mail-il1-f197.google.com [209.85.166.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81C401946A1
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738947257; cv=none; b=ZuXQcU5SmmK6o9nGCqc5RXnTcr3lpy/1eYh4HMBPe0tUg6Cguim4SUNGg4dqS+Mr7WrdQTijhJSLA75BrvPzCrl8k83L0f/6lwZg+agkg2iRLQZK7bhX53cZW//vYoZXNG/oQFcknmM3/IxHN8Ns+ZD/v7nCoZ93HZMqWLc9E3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738947257; c=relaxed/simple;
	bh=wQW+YiDNPFwzXqkMy3yQb0TUztAah7x2KlFFiIWRwjk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JvSv7H1XpLsbqkRkbkMBl0vImi3VAFCPqX5++WuKwvCNg45D5p6exXzordartoYFjqALYw7Hn4UzKLJS+2ZpoH9yzZzudyGObOHgeYDUjnxnhuEFm/eUf7Y4RC5jHg0TF7lUQidThsTR2JQejrLpYd2DDzcs13rFm0x7Wy81FTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f197.google.com with SMTP id e9e14a558f8ab-3d14a3f812fso4527205ab.3
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:54:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738947254; x=1739552054;
        h=content-transfer-encoding:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cvFG0vQSH1u5BYfEEDfFslIkkmOt7Q/EPMcPaX1uygg=;
        b=bPH7nxAbCs1vWMvQf61YvZpDXQrzmzJqC9MeXjiPjgokpAr8df5vWMh2obpg1obdvI
         Ns/BZCJgcjZzp5mU9SnlRl6yaxY7Ojsg4uvvT4bCM0rYy/13wqX2m+bB8WNYWeLAwMJ1
         hNp5FLfLULloJqzZ1QYujlNdpDgI2zuj0rcbgAbGm+GGv43+Jrp46ID9AAyXZr+5t+qM
         NeVQ4ZpAluxF9WIKoNkD0OVWEPcZM7Dy18MhHlSzmVZjflBU8j9WLwJCiG/FN6r53fUz
         jqewwzlHNUQlO+Ij+PMou0Y6qnRCWlAdQ16eEY72pEVboWro8wQ5M0BBX+GOH9KBalKK
         HEnw==
X-Gm-Message-State: AOJu0Yw2f5wEVHzK+cb7AC3aGyeg+RRs5W9wcQwiih8EqBijFZ7raBzc
	zDJJRtJkXZVOvfVbdloEIWAP7rLWLlm9HNjlYsQggfJx07TyJJS/k/dtFw5YWR7bcf9P2MMH3tb
	mb9dATBLgRk6otVhZnkx2i7NLaBJ3xN3TiQ7tBXygDD8Hb6PvDbvc5iA=
X-Google-Smtp-Source: AGHT+IFyqt2+JtPG+uedj/XstW5An9L18ZxxQqaRF4h/4P0c0/fEymDUAkbxpMScUrxsrRkjatgd7Jo48YTUj0lJsS6eqjHI9R03
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a92:c263:0:b0:3cf:c803:1295 with SMTP id
 e9e14a558f8ab-3d13dcfcdeamr36447105ab.3.1738947254667; Fri, 07 Feb 2025
 08:54:14 -0800 (PST)
Date: Fri, 07 Feb 2025 08:54:14 -0800
In-Reply-To: <67a4b4c3.050a0220.264083.0005.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67a63ab6.050a0220.f64af.0001.GAE@google.com>
Subject: Re: [syzbot] Re: [PATCH v1] Bluetooth: L2CAP: Fix corrupted list in hci_chan_del
From: syzbot <syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com>
To: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

For archival purposes, forwarding an incoming command email to
linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com.

***

Subject: Re: [PATCH v1] Bluetooth: L2CAP: Fix corrupted list in hci_chan_de=
l
Author: luiz.dentz@gmail.com

#syz test

On Fri, Feb 7, 2025 at 11:12=E2=80=AFAM Luiz Augusto von Dentz
<luiz.dentz@gmail.com> wrote:
>
> #syz test
>
> On Thu, Feb 6, 2025 at 5:05=E2=80=AFPM Luiz Augusto von Dentz
> <luiz.dentz@gmail.com> wrote:
> >
> > #syz test
> >
> > On Thu, Feb 6, 2025 at 4:01=E2=80=AFPM Luiz Augusto von Dentz
> > <luiz.dentz@gmail.com> wrote:
> > >
> > > From: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > >
> > > This fixes the following trace by reworking the locking of l2cap_conn
> > > so instead of only locking when changing the chan_l list this promote=
s
> > > chan_lock to a general lock of l2cap_conn so whenever it is being hel=
d
> > > it would prevents the likes of l2cap_conn_del to run:
> > >
> > > list_del corruption, ffff888021297e00->prev is LIST_POISON2 (dead0000=
00000122)
> > > ------------[ cut here ]------------
> > > kernel BUG at lib/list_debug.c:61!
> > > Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
> > > CPU: 1 UID: 0 PID: 5896 Comm: syz-executor213 Not tainted 6.14.0-rc1-=
next-20250204-syzkaller #0
> > > Hardware name: Google Google Compute Engine/Google Compute Engine, BI=
OS Google 12/27/2024
> > > RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug=
.c:59
> > > Code: 8c 4c 89 fe 48 89 da e8 32 8c 37 fc 90 0f 0b 48 89 df e8 27 9f =
14 fd 48 c7 c7 a0 c0 60 8c 4c 89 fe 48 89 da e8 15 8c 37 fc 90 <0f> 0b 4c 8=
9 e7 e8 0a 9f 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
> > > RSP: 0018:ffffc90003f6f998 EFLAGS: 00010246
> > > RAX: 000000000000004e RBX: dead000000000122 RCX: 01454d423f7fbf00
> > > RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
> > > RBP: dffffc0000000000 R08: ffffffff819f077c R09: 1ffff920007eded0
> > > R10: dffffc0000000000 R11: fffff520007eded1 R12: dead000000000122
> > > R13: dffffc0000000000 R14: ffff8880352248d8 R15: ffff888021297e00
> > > FS:  00007f7ace6686c0(0000) GS:ffff8880b8700000(0000) knlGS:000000000=
0000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007f7aceeeb1d0 CR3: 000000003527c000 CR4: 00000000003526f0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > > Call Trace:
> > >  <TASK>
> > >  __list_del_entry_valid include/linux/list.h:124 [inline]
> > >  __list_del_entry include/linux/list.h:215 [inline]
> > >  list_del_rcu include/linux/rculist.h:168 [inline]
> > >  hci_chan_del+0x70/0x1b0 net/bluetooth/hci_conn.c:2858
> > >  l2cap_conn_free net/bluetooth/l2cap_core.c:1816 [inline]
> > >  kref_put include/linux/kref.h:65 [inline]
> > >  l2cap_conn_put+0x70/0xe0 net/bluetooth/l2cap_core.c:1830
> > >  l2cap_sock_shutdown+0xa8a/0x1020 net/bluetooth/l2cap_sock.c:1377
> > >  l2cap_sock_release+0x79/0x1d0 net/bluetooth/l2cap_sock.c:1416
> > >  __sock_release net/socket.c:642 [inline]
> > >  sock_close+0xbc/0x240 net/socket.c:1393
> > >  __fput+0x3e9/0x9f0 fs/file_table.c:448
> > >  task_work_run+0x24f/0x310 kernel/task_work.c:227
> > >  ptrace_notify+0x2d2/0x380 kernel/signal.c:2522
> > >  ptrace_report_syscall include/linux/ptrace.h:415 [inline]
> > >  ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
> > >  syscall_exit_work+0xc7/0x1d0 kernel/entry/common.c:173
> > >  syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
> > >  __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
> > >  syscall_exit_to_user_mode+0x24a/0x340 kernel/entry/common.c:218
> > >  do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
> > >  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> > > RIP: 0033:0x7f7aceeaf449
> > > Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 41 19 00 00 90 48 89 f8 48 =
89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f=
0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
> > > RSP: 002b:00007f7ace668218 EFLAGS: 00000246 ORIG_RAX: 000000000000002=
a
> > > RAX: fffffffffffffffc RBX: 00007f7acef39328 RCX: 00007f7aceeaf449
> > > RDX: 000000000000000e RSI: 0000000020000100 RDI: 0000000000000004
> > > RBP: 00007f7acef39320 R08: 0000000000000000 R09: 0000000000000000
> > > R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
> > > R13: 0000000000000004 R14: 00007f7ace668670 R15: 000000000000000b
> > >  </TASK>
> > > Modules linked in:
> > > ---[ end trace 0000000000000000 ]---
> > > RIP: 0010:__list_del_entry_valid_or_report+0x12c/0x190 lib/list_debug=
.c:59
> > > Code: 8c 4c 89 fe 48 89 da e8 32 8c 37 fc 90 0f 0b 48 89 df e8 27 9f =
14 fd 48 c7 c7 a0 c0 60 8c 4c 89 fe 48 89 da e8 15 8c 37 fc 90 <0f> 0b 4c 8=
9 e7 e8 0a 9f 14 fd 42 80 3c 2b 00 74 08 4c 89 e7 e8 cb
> > > RSP: 0018:ffffc90003f6f998 EFLAGS: 00010246
> > > RAX: 000000000000004e RBX: dead000000000122 RCX: 01454d423f7fbf00
> > > RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
> > > RBP: dffffc0000000000 R08: ffffffff819f077c R09: 1ffff920007eded0
> > > R10: dffffc0000000000 R11: fffff520007eded1 R12: dead000000000122
> > > R13: dffffc0000000000 R14: ffff8880352248d8 R15: ffff888021297e00
> > > FS:  00007f7ace6686c0(0000) GS:ffff8880b8600000(0000) knlGS:000000000=
0000000
> > > CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> > > CR2: 00007f7acef05b08 CR3: 000000003527c000 CR4: 00000000003526f0
> > > DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> > > DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> > >
> > > Reported-by: syzbot+10bd8fe6741eedd2be2e@syzkaller.appspotmail.com
> > > Fixes: 6ab54a717189 ("Bluetooth: L2CAP: Fix slab-use-after-free Read =
in l2cap_send_cmd")
> > > Signed-off-by: Luiz Augusto von Dentz <luiz.von.dentz@intel.com>
> > > ---
> > >  include/net/bluetooth/l2cap.h |   2 +-
> > >  net/bluetooth/l2cap_core.c    | 123 +++++++++++---------------------=
--
> > >  net/bluetooth/l2cap_sock.c    |   4 +-
> > >  3 files changed, 41 insertions(+), 88 deletions(-)
> > >
> > > diff --git a/include/net/bluetooth/l2cap.h b/include/net/bluetooth/l2=
cap.h
> > > index d9c767cf773d..6b90cfa15d88 100644
> > > --- a/include/net/bluetooth/l2cap.h
> > > +++ b/include/net/bluetooth/l2cap.h
> > > @@ -668,7 +668,7 @@ struct l2cap_conn {
> > >         struct l2cap_chan       *smp;
> > >
> > >         struct list_head        chan_l;
> > > -       struct mutex            chan_lock;
> > > +       struct mutex            lock;
> > >         struct kref             ref;
> > >         struct list_head        users;
> > >  };
> > > diff --git a/net/bluetooth/l2cap_core.c b/net/bluetooth/l2cap_core.c
> > > index adb8c33ac595..5eedd6611f6c 100644
> > > --- a/net/bluetooth/l2cap_core.c
> > > +++ b/net/bluetooth/l2cap_core.c
> > > @@ -119,7 +119,6 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(=
struct l2cap_conn *conn,
> > >  {
> > >         struct l2cap_chan *c;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > >         c =3D __l2cap_get_chan_by_scid(conn, cid);
> > >         if (c) {
> > >                 /* Only lock if chan reference is not 0 */
> > > @@ -127,7 +126,6 @@ static struct l2cap_chan *l2cap_get_chan_by_scid(=
struct l2cap_conn *conn,
> > >                 if (c)
> > >                         l2cap_chan_lock(c);
> > >         }
> > > -       mutex_unlock(&conn->chan_lock);
> > >
> > >         return c;
> > >  }
> > > @@ -140,7 +138,6 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(=
struct l2cap_conn *conn,
> > >  {
> > >         struct l2cap_chan *c;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > >         c =3D __l2cap_get_chan_by_dcid(conn, cid);
> > >         if (c) {
> > >                 /* Only lock if chan reference is not 0 */
> > > @@ -148,7 +145,6 @@ static struct l2cap_chan *l2cap_get_chan_by_dcid(=
struct l2cap_conn *conn,
> > >                 if (c)
> > >                         l2cap_chan_lock(c);
> > >         }
> > > -       mutex_unlock(&conn->chan_lock);
> > >
> > >         return c;
> > >  }
> > > @@ -418,7 +414,7 @@ static void l2cap_chan_timeout(struct work_struct=
 *work)
> > >         if (!conn)
> > >                 return;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >         /* __set_chan_timer() calls l2cap_chan_hold(chan) while sched=
uling
> > >          * this work. No need to call l2cap_chan_hold(chan) here agai=
n.
> > >          */
> > > @@ -439,7 +435,7 @@ static void l2cap_chan_timeout(struct work_struct=
 *work)
> > >         l2cap_chan_unlock(chan);
> > >         l2cap_chan_put(chan);
> > >
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  struct l2cap_chan *l2cap_chan_create(void)
> > > @@ -641,9 +637,9 @@ void __l2cap_chan_add(struct l2cap_conn *conn, st=
ruct l2cap_chan *chan)
> > >
> > >  void l2cap_chan_add(struct l2cap_conn *conn, struct l2cap_chan *chan=
)
> > >  {
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >         __l2cap_chan_add(conn, chan);
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  void l2cap_chan_del(struct l2cap_chan *chan, int err)
> > > @@ -731,9 +727,9 @@ void l2cap_chan_list(struct l2cap_conn *conn, l2c=
ap_chan_func_t func,
> > >         if (!conn)
> > >                 return;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >         __l2cap_chan_list(conn, func, data);
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  EXPORT_SYMBOL_GPL(l2cap_chan_list);
> > > @@ -745,7 +741,7 @@ static void l2cap_conn_update_id_addr(struct work=
_struct *work)
> > >         struct hci_conn *hcon =3D conn->hcon;
> > >         struct l2cap_chan *chan;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >
> > >         list_for_each_entry(chan, &conn->chan_l, list) {
> > >                 l2cap_chan_lock(chan);
> > > @@ -754,7 +750,7 @@ static void l2cap_conn_update_id_addr(struct work=
_struct *work)
> > >                 l2cap_chan_unlock(chan);
> > >         }
> > >
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  static void l2cap_chan_le_connect_reject(struct l2cap_chan *chan)
> > > @@ -1507,8 +1503,6 @@ static void l2cap_conn_start(struct l2cap_conn =
*conn)
> > >
> > >         BT_DBG("conn %p", conn);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
> > >                 l2cap_chan_lock(chan);
> > >
> > > @@ -1577,8 +1571,6 @@ static void l2cap_conn_start(struct l2cap_conn =
*conn)
> > >
> > >                 l2cap_chan_unlock(chan);
> > >         }
> > > -
> > > -       mutex_unlock(&conn->chan_lock);
> > >  }
> > >
> > >  static void l2cap_le_conn_ready(struct l2cap_conn *conn)
> > > @@ -1624,7 +1616,7 @@ static void l2cap_conn_ready(struct l2cap_conn =
*conn)
> > >         if (hcon->type =3D=3D ACL_LINK)
> > >                 l2cap_request_info(conn);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >
> > >         list_for_each_entry(chan, &conn->chan_l, list) {
> > >
> > > @@ -1642,7 +1634,7 @@ static void l2cap_conn_ready(struct l2cap_conn =
*conn)
> > >                 l2cap_chan_unlock(chan);
> > >         }
> > >
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >
> > >         if (hcon->type =3D=3D LE_LINK)
> > >                 l2cap_le_conn_ready(conn);
> > > @@ -1657,14 +1649,10 @@ static void l2cap_conn_unreliable(struct l2ca=
p_conn *conn, int err)
> > >
> > >         BT_DBG("conn %p", conn);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         list_for_each_entry(chan, &conn->chan_l, list) {
> > >                 if (test_bit(FLAG_FORCE_RELIABLE, &chan->flags))
> > >                         l2cap_chan_set_err(chan, err);
> > >         }
> > > -
> > > -       mutex_unlock(&conn->chan_lock);
> > >  }
> > >
> > >  static void l2cap_info_timeout(struct work_struct *work)
> > > @@ -1675,7 +1663,9 @@ static void l2cap_info_timeout(struct work_stru=
ct *work)
> > >         conn->info_state |=3D L2CAP_INFO_FEAT_MASK_REQ_DONE;
> > >         conn->info_ident =3D 0;
> > >
> > > +       mutex_lock(&conn->lock);
> > >         l2cap_conn_start(conn);
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  /*
> > > @@ -1767,6 +1757,8 @@ static void l2cap_conn_del(struct hci_conn *hco=
n, int err)
> > >
> > >         BT_DBG("hcon %p conn %p, err %d", hcon, conn, err);
> > >
> > > +       mutex_lock(&conn->lock);
> > > +
> > >         kfree_skb(conn->rx_skb);
> > >
> > >         skb_queue_purge(&conn->pending_rx);
> > > @@ -1785,8 +1777,6 @@ static void l2cap_conn_del(struct hci_conn *hco=
n, int err)
> > >         /* Force the connection to be immediately dropped */
> > >         hcon->disc_timeout =3D 0;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         /* Kill channels */
> > >         list_for_each_entry_safe(chan, l, &conn->chan_l, list) {
> > >                 l2cap_chan_hold(chan);
> > > @@ -1800,12 +1790,11 @@ static void l2cap_conn_del(struct hci_conn *h=
con, int err)
> > >                 l2cap_chan_put(chan);
> > >         }
> > >
> > > -       mutex_unlock(&conn->chan_lock);
> > > -
> > >         if (conn->info_state & L2CAP_INFO_FEAT_MASK_REQ_SENT)
> > >                 cancel_delayed_work_sync(&conn->info_timer);
> > >
> > >         hcon->l2cap_data =3D NULL;
> > > +       mutex_unlock(&conn->lock);
> > >         l2cap_conn_put(conn);
> > >  }
> > >
> > > @@ -2924,8 +2913,6 @@ static void l2cap_raw_recv(struct l2cap_conn *c=
onn, struct sk_buff *skb)
> > >
> > >         BT_DBG("conn %p", conn);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         list_for_each_entry(chan, &conn->chan_l, list) {
> > >                 if (chan->chan_type !=3D L2CAP_CHAN_RAW)
> > >                         continue;
> > > @@ -2940,8 +2927,6 @@ static void l2cap_raw_recv(struct l2cap_conn *c=
onn, struct sk_buff *skb)
> > >                 if (chan->ops->recv(chan, nskb))
> > >                         kfree_skb(nskb);
> > >         }
> > > -
> > > -       mutex_unlock(&conn->chan_lock);
> > >  }
> > >
> > >  /* ---- L2CAP signalling commands ---- */
> > > @@ -3960,7 +3945,6 @@ static void l2cap_connect(struct l2cap_conn *co=
nn, struct l2cap_cmd_hdr *cmd,
> > >                 goto response;
> > >         }
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > >         l2cap_chan_lock(pchan);
> > >
> > >         /* Check if the ACL is secure enough (if not SDP) */
> > > @@ -4067,7 +4051,6 @@ static void l2cap_connect(struct l2cap_conn *co=
nn, struct l2cap_cmd_hdr *cmd,
> > >         }
> > >
> > >         l2cap_chan_unlock(pchan);
> > > -       mutex_unlock(&conn->chan_lock);
> > >         l2cap_chan_put(pchan);
> > >  }
> > >
> > > @@ -4106,27 +4089,19 @@ static int l2cap_connect_create_rsp(struct l2=
cap_conn *conn,
> > >         BT_DBG("dcid 0x%4.4x scid 0x%4.4x result 0x%2.2x status 0x%2.=
2x",
> > >                dcid, scid, result, status);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         if (scid) {
> > >                 chan =3D __l2cap_get_chan_by_scid(conn, scid);
> > > -               if (!chan) {
> > > -                       err =3D -EBADSLT;
> > > -                       goto unlock;
> > > -               }
> > > +               if (!chan)
> > > +                       return -EBADSLT;
> > >         } else {
> > >                 chan =3D __l2cap_get_chan_by_ident(conn, cmd->ident);
> > > -               if (!chan) {
> > > -                       err =3D -EBADSLT;
> > > -                       goto unlock;
> > > -               }
> > > +               if (!chan)
> > > +                       return -EBADSLT;
> > >         }
> > >
> > >         chan =3D l2cap_chan_hold_unless_zero(chan);
> > > -       if (!chan) {
> > > -               err =3D -EBADSLT;
> > > -               goto unlock;
> > > -       }
> > > +       if (!chan)
> > > +               return -EBADSLT;
> > >
> > >         err =3D 0;
> > >
> > > @@ -4164,9 +4139,6 @@ static int l2cap_connect_create_rsp(struct l2ca=
p_conn *conn,
> > >         l2cap_chan_unlock(chan);
> > >         l2cap_chan_put(chan);
> > >
> > > -unlock:
> > > -       mutex_unlock(&conn->chan_lock);
> > > -
> > >         return err;
> > >  }
> > >
> > > @@ -4454,11 +4426,7 @@ static inline int l2cap_disconnect_req(struct =
l2cap_conn *conn,
> > >
> > >         chan->ops->set_shutdown(chan);
> > >
> > > -       l2cap_chan_unlock(chan);
> > > -       mutex_lock(&conn->chan_lock);
> > > -       l2cap_chan_lock(chan);
> > >         l2cap_chan_del(chan, ECONNRESET);
> > > -       mutex_unlock(&conn->chan_lock);
> > >
> > >         chan->ops->close(chan);
> > >
> > > @@ -4495,11 +4463,7 @@ static inline int l2cap_disconnect_rsp(struct =
l2cap_conn *conn,
> > >                 return 0;
> > >         }
> > >
> > > -       l2cap_chan_unlock(chan);
> > > -       mutex_lock(&conn->chan_lock);
> > > -       l2cap_chan_lock(chan);
> > >         l2cap_chan_del(chan, 0);
> > > -       mutex_unlock(&conn->chan_lock);
> > >
> > >         chan->ops->close(chan);
> > >
> > > @@ -4697,13 +4661,9 @@ static int l2cap_le_connect_rsp(struct l2cap_c=
onn *conn,
> > >         BT_DBG("dcid 0x%4.4x mtu %u mps %u credits %u result 0x%2.2x"=
,
> > >                dcid, mtu, mps, credits, result);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         chan =3D __l2cap_get_chan_by_ident(conn, cmd->ident);
> > > -       if (!chan) {
> > > -               err =3D -EBADSLT;
> > > -               goto unlock;
> > > -       }
> > > +       if (!chan)
> > > +               return -EBADSLT;
> > >
> > >         err =3D 0;
> > >
> > > @@ -4751,9 +4711,6 @@ static int l2cap_le_connect_rsp(struct l2cap_co=
nn *conn,
> > >
> > >         l2cap_chan_unlock(chan);
> > >
> > > -unlock:
> > > -       mutex_unlock(&conn->chan_lock);
> > > -
> > >         return err;
> > >  }
> > >
> > > @@ -4865,7 +4822,6 @@ static int l2cap_le_connect_req(struct l2cap_co=
nn *conn,
> > >                 goto response;
> > >         }
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > >         l2cap_chan_lock(pchan);
> > >
> > >         if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
> > > @@ -4931,7 +4887,6 @@ static int l2cap_le_connect_req(struct l2cap_co=
nn *conn,
> > >
> > >  response_unlock:
> > >         l2cap_chan_unlock(pchan);
> > > -       mutex_unlock(&conn->chan_lock);
> > >         l2cap_chan_put(pchan);
> > >
> > >         if (result =3D=3D L2CAP_CR_PEND)
> > > @@ -5065,7 +5020,6 @@ static inline int l2cap_ecred_conn_req(struct l=
2cap_conn *conn,
> > >                 goto response;
> > >         }
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > >         l2cap_chan_lock(pchan);
> > >
> > >         if (!smp_sufficient_security(conn->hcon, pchan->sec_level,
> > > @@ -5140,7 +5094,6 @@ static inline int l2cap_ecred_conn_req(struct l=
2cap_conn *conn,
> > >
> > >  unlock:
> > >         l2cap_chan_unlock(pchan);
> > > -       mutex_unlock(&conn->chan_lock);
> > >         l2cap_chan_put(pchan);
> > >
> > >  response:
> > > @@ -5177,8 +5130,6 @@ static inline int l2cap_ecred_conn_rsp(struct l=
2cap_conn *conn,
> > >         BT_DBG("mtu %u mps %u credits %u result 0x%4.4x", mtu, mps, c=
redits,
> > >                result);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         cmd_len -=3D sizeof(*rsp);
> > >
> > >         list_for_each_entry_safe(chan, tmp, &conn->chan_l, list) {
> > > @@ -5264,8 +5215,6 @@ static inline int l2cap_ecred_conn_rsp(struct l=
2cap_conn *conn,
> > >                 l2cap_chan_unlock(chan);
> > >         }
> > >
> > > -       mutex_unlock(&conn->chan_lock);
> > > -
> > >         return err;
> > >  }
> > >
> > > @@ -5378,8 +5327,6 @@ static inline int l2cap_le_command_rej(struct l=
2cap_conn *conn,
> > >         if (cmd_len < sizeof(*rej))
> > >                 return -EPROTO;
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > -
> > >         chan =3D __l2cap_get_chan_by_ident(conn, cmd->ident);
> > >         if (!chan)
> > >                 goto done;
> > > @@ -5394,7 +5341,6 @@ static inline int l2cap_le_command_rej(struct l=
2cap_conn *conn,
> > >         l2cap_chan_put(chan);
> > >
> > >  done:
> > > -       mutex_unlock(&conn->chan_lock);
> > >         return 0;
> > >  }
> > >
> > > @@ -6849,8 +6795,12 @@ static void process_pending_rx(struct work_str=
uct *work)
> > >
> > >         BT_DBG("");
> > >
> > > +       mutex_lock(&conn->lock);
> > > +
> > >         while ((skb =3D skb_dequeue(&conn->pending_rx)))
> > >                 l2cap_recv_frame(conn, skb);
> > > +
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  static struct l2cap_conn *l2cap_conn_add(struct hci_conn *hcon)
> > > @@ -6889,7 +6839,7 @@ static struct l2cap_conn *l2cap_conn_add(struct=
 hci_conn *hcon)
> > >                 conn->local_fixed_chan |=3D L2CAP_FC_SMP_BREDR;
> > >
> > >         mutex_init(&conn->ident_lock);
> > > -       mutex_init(&conn->chan_lock);
> > > +       mutex_init(&conn->lock);
> > >
> > >         INIT_LIST_HEAD(&conn->chan_l);
> > >         INIT_LIST_HEAD(&conn->users);
> > > @@ -7080,7 +7030,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan,=
 __le16 psm, u16 cid,
> > >                 }
> > >         }
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >         l2cap_chan_lock(chan);
> > >
> > >         if (cid && __l2cap_get_chan_by_dcid(conn, cid)) {
> > > @@ -7121,7 +7071,7 @@ int l2cap_chan_connect(struct l2cap_chan *chan,=
 __le16 psm, u16 cid,
> > >
> > >  chan_unlock:
> > >         l2cap_chan_unlock(chan);
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >  done:
> > >         hci_dev_unlock(hdev);
> > >         hci_dev_put(hdev);
> > > @@ -7333,7 +7283,7 @@ static void l2cap_security_cfm(struct hci_conn =
*hcon, u8 status, u8 encrypt)
> > >
> > >         BT_DBG("conn %p status 0x%2.2x encrypt %u", conn, status, enc=
rypt);
> > >
> > > -       mutex_lock(&conn->chan_lock);
> > > +       mutex_lock(&conn->lock);
> > >
> > >         list_for_each_entry(chan, &conn->chan_l, list) {
> > >                 l2cap_chan_lock(chan);
> > > @@ -7407,7 +7357,7 @@ static void l2cap_security_cfm(struct hci_conn =
*hcon, u8 status, u8 encrypt)
> > >                 l2cap_chan_unlock(chan);
> > >         }
> > >
> > > -       mutex_unlock(&conn->chan_lock);
> > > +       mutex_unlock(&conn->lock);
> > >  }
> > >
> > >  /* Append fragment into frame respecting the maximum len of rx_skb *=
/
> > > @@ -7506,6 +7456,8 @@ void l2cap_recv_acldata(struct hci_conn *hcon, =
struct sk_buff *skb, u16 flags)
> > >
> > >         BT_DBG("conn %p len %u flags 0x%x", conn, skb->len, flags);
> > >
> > > +       mutex_lock(&conn->lock);
> > > +
> > >         switch (flags) {
> > >         case ACL_START:
> > >         case ACL_START_NO_FLUSH:
> > > @@ -7530,7 +7482,7 @@ void l2cap_recv_acldata(struct hci_conn *hcon, =
struct sk_buff *skb, u16 flags)
> > >                 if (len =3D=3D skb->len) {
> > >                         /* Complete frame received */
> > >                         l2cap_recv_frame(conn, skb);
> > > -                       return;
> > > +                       goto unlock;
> > >                 }
> > >
> > >                 BT_DBG("Start: total len %d, frag len %u", len, skb->=
len);
> > > @@ -7592,10 +7544,11 @@ void l2cap_recv_acldata(struct hci_conn *hcon=
, struct sk_buff *skb, u16 flags)
> > >                 break;
> > >         }
> > >
> > > -       l2cap_conn_put(conn);
> > > -
> > >  drop:
> > >         kfree_skb(skb);
> > > +unlock:
> > > +       mutex_unlock(&conn->lock);
> > > +       l2cap_conn_put(conn);
> > >  }
> > >
> > >  static struct hci_cb l2cap_cb =3D {
> > > diff --git a/net/bluetooth/l2cap_sock.c b/net/bluetooth/l2cap_sock.c
> > > index 46ea0bee2259..831ab9b97001 100644
> > > --- a/net/bluetooth/l2cap_sock.c
> > > +++ b/net/bluetooth/l2cap_sock.c
> > > @@ -1366,14 +1366,14 @@ static int l2cap_sock_shutdown(struct socket =
*sock, int how)
> > >
> > >         if (conn)
> > >                 /* mutex lock must be taken before l2cap_chan_lock() =
*/
> > > -               mutex_lock(&conn->chan_lock);
> > > +               mutex_lock(&conn->lock);
> > >
> > >         l2cap_chan_lock(chan);
> > >         l2cap_chan_close(chan, 0);
> > >         l2cap_chan_unlock(chan);
> > >
> > >         if (conn) {
> > > -               mutex_unlock(&conn->chan_lock);
> > > +               mutex_unlock(&conn->lock);
> > >                 l2cap_conn_put(conn);
> > >         }
> > >
> > > --
> > > 2.48.1
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
