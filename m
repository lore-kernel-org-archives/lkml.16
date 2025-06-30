Received: from mail-il1-f208.google.com (mail-il1-f208.google.com [209.85.166.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17111226188
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 11:19:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751282398; cv=none; b=JCT/GyeVdqs/sNUNFJCVN5uJrLxQowJqXN+ivpVSWTet6rpGC0XhMtnFHJ5NFIqW5CB9RNvFANxXGR5LT18t0Gf0wr209ysbiwSNNFEVv0DZ/o7BkAKRfurlKUvQcxKR9jeb+6ef5rh7RrkPj3+rHtfDIgjKh3zcJdJw+B6HXA0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751282398; c=relaxed/simple;
	bh=2CuYnl13YaHnzRJfXPXhz33ccj7tRxktGozAKtEOhgY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:Cc:
	 Content-Type; b=LthqjzJQ+TeC2GO9XzK3WhPGSeBrVitp5MhEm124OCGKqv4cp/aWKTtg4Wvh3n/WvKnGi/hWFGrj7oc+c01E4O8Pz9HMMk2wJsK37G/217smW2lVWuyC0sF4G+xlzSf2yAuAOj4KHbt+x2+g7rfe1uPJ0E9F8j/5N5k5uK+lGzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.166.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-il1-f208.google.com with SMTP id e9e14a558f8ab-3df4189cd09so41168925ab.2
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 04:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751282395; x=1751887195;
        h=content-transfer-encoding:cc:to:from:subject:message-id:in-reply-to
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n7A4JBKFTzbCJPAk8mYV8n06KvVsgn96Rn9+GwPUXoU=;
        b=XJd4rQDjhbG4JA3BcRKHR0Dh5Kg2AIGdP4XFlI4C8f6jJimM7D/45jixervQJv37QO
         BExdR0xtU8CxhSwn+FFuSPD6Fwb0K8cDnR+Ydn+cS+CE1xozzrxCwomZqotjZ/G6j7jH
         J24f0Syb2M6VGPmLijmPGFEGAZ9oxgv3YcBAnU6dKQJjEg5U/DrD3yvIIDi0V7DFcUhf
         Gi4Mwo8oxxgUR369Ia8bT+4PIrbcQsGV/MlOm8Mccn9ObKWL4vHgm3WA3Y9isWgi1vbd
         1WJWerqfRNpeUPNHID5iXuHssnfkHY3Eqadc8ru8k0CgohhYgx5HFL0nmscwt60l5VS0
         b+tw==
X-Forwarded-Encrypted: i=1; AJvYcCUZXRMFtoWOlBo4Uc8W8F7V4+p6e8ZvYKr889vtF5/gUwu4xTwYaZeiPxsX7ML2CwBYTb5YbhmiL7xJrX4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOiF0FTsd8BkPf4hCceQQYDhkVzzUR/oTxKD45DCqdrwog9qhg
	wKwEro+S2MT8yI08lm5jIhqs7pg+QPCqZCEfIFdrT4DtsoAttrBOVv0aulFiV9zaEt+EONAxVPT
	DyNV0gXutSEgtifvWgCCI2PDncEQtVihOh84jOSHb857AKqE248TBS3PA1gs=
X-Google-Smtp-Source: AGHT+IE3oHkBULsABHfDS6XCb0Bql39tKut0IUdL1QRzLVLmGoVMEzDkIDjcuYvE1LJV52wdu+2KwmZ9zDSQJ5Fi0y/FmRU5aBE/
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:3708:b0:3da:71c7:5c7f with SMTP id
 e9e14a558f8ab-3df4ab9bd2bmr159595715ab.15.1751282395199; Mon, 30 Jun 2025
 04:19:55 -0700 (PDT)
Date: Mon, 30 Jun 2025 04:19:55 -0700
In-Reply-To: <e641b1a1-ac30-474f-a40e-5a605718ba7dn@googlegroups.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <686272db.a70a0220.3b7e22.0db2.GAE@google.com>
Subject: Re: Private message regarding: [syzbot] [bcachefs?] kernel BUG in bch2_journal_keys_peek_prev_min
From: syzbot <syzbot+5e43fb34e0478e83681c@syzkaller.appspotmail.com>
To: kapoorarnav43@gmail.com
Cc: kapoorarnav43@gmail.com, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> #syz test=20
>
> 0001-bcachefs-avoid-BUG-when-journal-index-is-out-of-bounds.patch
>
> From 56f5b5e4abcde123456789012345678901234567 Mon Sep 17 00:00:00 2001
> From: Arnav Kapoor <kapoor...@gmail.com <https://groups.google.com/u/1/>>
> Date: Sat, 29 Jun 2025 17:05:00 +0000
> Subject: [PATCH] bcachefs: avoid BUG when journal index is out of bounds
>
> Replace BUG_ON(*idx > keys->nr) with a proper bounds check. =20
> Log an error and safely return NULL if idx is invalid, instead of crashin=
g.
>
> Fixes a kernel BUG triggered by syzbot when calling
> bch2_journal_keys_peek_prev_min with invalid idx.
>
> Reported-by: syzbot+5e43fb...@syzkaller.appspotmail.com=20
> <https://groups.google.com/u/1/>
> Signed-off-by: Arnav Kapoor <kapoor...@gmail.com=20
> <https://groups.google.com/u/1/>>
> ---
>  fs/bcachefs/btree_journal_iter.c | 10 +++++++++-
>  1 file changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/fs/bcachefs/btree_journal_iter.c=20
> b/fs/bcachefs/btree_journal_iter.c
> index 0123456789ab..abcdef012345 100644
> --- a/fs/bcachefs/btree_journal_iter.c
> +++ b/fs/bcachefs/btree_journal_iter.c
> @@
>  struct bkey_i *bch2_journal_keys_peek_prev_min(struct bch_fs *c, enum=20
> btree_id btree_id,
>         unsigned level, struct bpos pos,
>         struct bpos end_pos, size_t *idx)
>  {
>   struct journal_keys *keys =3D &c->journal_keys;
>   unsigned iters =3D 0;
>   struct journal_key *k;
> =20
> - BUG_ON(*idx > keys->nr);
> + if (unlikely(*idx > keys->nr)) {
> + pr_err("bch2_journal_keys_peek_prev_min: invalid idx %zu > nr %zu\n",
> +        *idx, keys->nr);
> + return NULL;
> + }
> +
> + if (!keys->nr)
> + return NULL;
> =20
>  search:
>   if (!*idx)
>   *idx =3D __bch2_journal_key_search(keys, btree_id, level, pos);
> =20
>   while (*idx &&
>          __journal_key_cmp(btree_id, level, end_pos, idx_to_key(keys, *id=
x=20
> - 1)) <=3D 0) {
>   (*idx)++;
>   iters++;
>   if (iters =3D=3D 10) {
>   *idx =3D 0;
>   goto search;
>   }
>   }
> =20
>   return (*idx && *idx <=3D keys->nr) ? idx_to_key(keys, *idx - 1) : NULL=
;
>  }
> --=20
> 2.40.1
>
>
> On Sunday, 29 June 2025 at 22:25:29 UTC+5:30 syzbot wrote:
>
> Hello,=20
>
> syzbot found the following issue on:=20
>
> HEAD commit: 7595b66ae9de Merge tag 'selinux-pr-20250624' of git://git...=
=20
> git tree: upstream=20
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10edd18258000=
0=20
> kernel config: https://syzkaller.appspot.com/x/.config?x=3D79da270cec5ffd=
65=20
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D5e43fb34e0478e8=
3681c=20
> compiler: Debian clang version 20.1.6=20
> (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD=20
> 20.1.6=20
>
> Unfortunately, I don't have any reproducer for this issue yet.=20
>
> Downloadable assets:=20
> disk image (non-bootable):=20
> https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_di=
sk-7595b66a.raw.xz=20
> vmlinux:=20
> https://storage.googleapis.com/syzbot-assets/3332acf57c8d/vmlinux-7595b66=
a.xz=20
> kernel image:=20
> https://storage.googleapis.com/syzbot-assets/e83a48cfe09a/bzImage-7595b66=
a.xz=20
>
> IMPORTANT: if you fix the issue, please add the following tag to the=20
> commit:=20
> Reported-by: syzbot+5e43fb...@syzkaller.appspotmail.com=20
>
> loop0: detected capacity change from 0 to 32768=20
> bcachefs (loop0): starting version 1.7: mi_btree_bitmap=20
> opts=3Dmetadata_checksum=3Dcrc64,data_checksum=3Dnone,compression=3Dlz4,j=
ournal_flush_disabled,fsck,recovery_pass_last=3Dset_may_go_rw,reconstruct_a=
lloc,no_data_io=20
>
> allowing incompatible features above 0.0: (unknown version)=20
> features:=20
> lz4,new_siphash,inline_data,new_extent_overwrite,btree_ptr_v2,new_varint,=
journal_no_flush,alloc_v2,extents_across_btree_nodes=20
>
> bcachefs (loop0): Using encoding defined by superblock: utf8-12.1.0=20
> bcachefs (loop0): recovering from clean shutdown, journal seq 10=20
> bcachefs (loop0): Version upgrade required:=20
> Version upgrade from 0.24: unwritten_extents to 1.7: mi_btree_bitmap=20
> incomplete=20
> Doing incompatible version upgrade from 0.24: unwritten_extents to 1.28:=
=20
> inode_has_case_insensitive=20
> running recovery passes:=20
> check_allocations,check_alloc_info,check_lrus,check_btree_backpointers,ch=
eck_backpointers_to_extents,check_extents_to_backpointers,check_alloc_to_lr=
u_refs,bucket_gens_init,check_snapshot_trees,check_snapshots,check_subvols,=
check_subvol_children,delete_dead_snapshots,check_inodes,check_extents,chec=
k_indirect_extents,check_dirents,check_xattrs,check_root,check_unreachable_=
inodes,check_subvolume_structure,check_directory_structure,check_nlinks,che=
ck_rebalance_work,set_fs_needs_rebalance=20
>
> bcachefs (loop0): dropping and reconstructing all alloc info=20
> bcachefs (loop0): accounting_read... done=20
> bcachefs (loop0): alloc_read... done=20
> bcachefs (loop0): snapshots_read... done=20
> bcachefs (loop0): check_allocations... done=20
> bcachefs (loop0): going read-write=20
> bcachefs (loop0): done starting filesystem=20
> ------------[ cut here ]------------=20
> kernel BUG at fs/bcachefs/btree_journal_iter.c:139!=20
> Oops: invalid opcode: 0000 [#1] SMP KASAN NOPTI=20
> CPU: 0 UID: 0 PID: 5329 Comm: syz.0.0 Not tainted=20
> 6.16.0-rc3-syzkaller-00044-g7595b66ae9de #0 PREEMPT(full)=20
> Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS=20
> 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014=20
> RIP: 0010:bch2_journal_keys_peek_prev_min+0x15e4/0x15f0=20
> fs/bcachefs/btree_journal_iter.c:139=20
> Code: b9 00 00 00 00 00 fc ff df 80 3c 08 00 74 08 48 89 df e8 ff 87 fe f=
d=20
> 48 8b 1b e9 b6 fe ff ff e8 a2 5f 41 07 e8 1d 05 9b fd 90 <0f> 0b 66 2e 0f=
=20
> 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90=20
> RSP: 0018:ffffc9000d38f1a0 EFLAGS: 00010283=20
> RAX: ffffffff84254803 RBX: ffffffffffffffff RCX: 0000000000100000=20
> RDX: ffffc9000df5a000 RSI: 00000000000337b5 RDI: 00000000000337b6=20
> RBP: ffffc9000d38f380 R08: 00090018ffffffff R09: 2000000000000000=20
> R10: 0000000000000000 R11: 00090018ffffffff R12: ffffc9000d38f9b0=20
> R13: dffffc0000000000 R14: 000000000000003b R15: ffff888052f00000=20
> FS: 00007fe8791aa6c0(0000) GS:ffff88808d251000(0000) knlGS:00000000000000=
00=20
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20
> CR2: 00007f1f90184000 CR3: 0000000043c47000 CR4: 0000000000352ef0=20
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000=20
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400=20
> Call Trace:=20
> <TASK>=20
> bch2_btree_journal_peek_prev fs/bcachefs/btree_iter.c:2172 [inline]=20
> btree_trans_peek_prev_journal+0x259/0x3b0 fs/bcachefs/btree_iter.c:2186=
=20
> __bch2_btree_iter_peek_prev fs/bcachefs/btree_iter.c:2560 [inline]=20
> bch2_btree_iter_peek_prev_min+0x1439/0x5400 fs/bcachefs/btree_iter.c:2635=
=20
> __bch2_resume_logged_op_finsert+0x7fc/0x2240 fs/bcachefs/io_misc.c:432=20
> bch2_fcollapse_finsert+0x19b/0x250 fs/bcachefs/io_misc.c:536=20
> bchfs_fcollapse_finsert+0x378/0x470 fs/bcachefs/fs-io.c:621=20
> bch2_fallocate_dispatch+0x2a4/0x410 fs/bcachefs/fs-io.c:-1=20
> vfs_fallocate+0x6a0/0x830 fs/open.c:341=20
> ksys_fallocate fs/open.c:365 [inline]=20
> __do_sys_fallocate fs/open.c:370 [inline]=20
> __se_sys_fallocate fs/open.c:368 [inline]=20
> __x64_sys_fallocate+0xc0/0x110 fs/open.c:368=20
> do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]=20
> do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94=20
> entry_SYSCALL_64_after_hwframe+0x77/0x7f=20
> RIP: 0033:0x7fe87838e929=20
> Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f=
7=20
> 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff=
=20
> ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48=20
> RSP: 002b:00007fe8791aa038 EFLAGS: 00000246 ORIG_RAX: 000000000000011d=20
> RAX: ffffffffffffffda RBX: 00007fe8785b5fa0 RCX: 00007fe87838e929=20
> RDX: 0000000000000000 RSI: 0000000000000020 RDI: 000000000000000a=20
> RBP: 00007fe878410b39 R08: 0000000000000000 R09: 0000000000000000=20
> R10: 0000000007000000 R11: 0000000000000246 R12: 0000000000000000=20
> R13: 0000000000000000 R14: 00007fe8785b5fa0 R15: 00007ffc77682dc8=20
> </TASK>=20
> Modules linked in:=20
> ---[ end trace 0000000000000000 ]---=20
> RIP: 0010:bch2_journal_keys_peek_prev_min+0x15e4/0x15f0=20
> fs/bcachefs/btree_journal_iter.c:139=20
> Code: b9 00 00 00 00 00 fc ff df 80 3c 08 00 74 08 48 89 df e8 ff 87 fe f=
d=20
> 48 8b 1b e9 b6 fe ff ff e8 a2 5f 41 07 e8 1d 05 9b fd 90 <0f> 0b 66 2e 0f=
=20
> 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90=20
> RSP: 0018:ffffc9000d38f1a0 EFLAGS: 00010283=20
> RAX: ffffffff84254803 RBX: ffffffffffffffff RCX: 0000000000100000=20
> RDX: ffffc9000df5a000 RSI: 00000000000337b5 RDI: 00000000000337b6=20
> RBP: ffffc9000d38f380 R08: 00090018ffffffff R09: 2000000000000000=20
> R10: 0000000000000000 R11: 00090018ffffffff R12: ffffc9000d38f9b0=20
> R13: dffffc0000000000 R14: 000000000000003b R15: ffff888052f00000=20
> FS: 00007fe8791aa6c0(0000) GS:ffff88808d251000(0000) knlGS:00000000000000=
00=20
> CS: 0010 DS: 0000 ES: 0000 CR0: 0000000080050033=20
> CR2: 00007fe8783ec970 CR3: 0000000043c47000 CR4: 0000000000352ef0=20
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000=20
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400=20
>
>
> ---=20
> This report is generated by a bot. It may contain errors.=20
> See https://goo.gl/tpsmEJ for more information about syzbot.=20
> syzbot engineers can be reached at syzk...@googlegroups.com.=20
>
> syzbot will keep track of this issue. See:=20
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.=20
>
> If the report is already addressed, let syzbot know by replying with:=20
> #syz fix: exact-commit-title=20
>
> If you want to overwrite report's subsystems, reply with:=20
> #syz set subsystems: new-subsystem=20
> (See the list of subsystem names on the web dashboard)=20
>
> If the report is a duplicate of another one, reply with:=20
> #syz dup: exact-subject-of-another-report=20
>
> If you want to undo deduplication, reply with:=20
> #syz undup=20
>

Command #1:
This crash does not have a reproducer. I cannot test it.

