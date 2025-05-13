Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 666AA1E883A
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 09:09:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747127365; cv=none; b=K2qA8Lo7a43qvAOmN9koEAMZac5ryXWHkkvFgZvYm3UDTig3HF8iz7F9Usr6hcMq5pELybmst2jrilzMKeHkWRoxT2XesB7JvwQmCUfl2IY0FqFLbtG5RAmxUhuHivDs3hKN0KJ1CnSeAlcjEgmrNtXfaqOAjoAAo2/JERIU4T8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747127365; c=relaxed/simple;
	bh=0VewDEz0OVdUFJoKtitteEe+7RDKAGh5SCrFJfrS0ew=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=WwYZp0oPVLz+3EFo1tsGJGQUKfrfNCT6GYsVag57NYNOXAXdWrY5Pjcw1TE8bkPyw1Mmx5bw8huqQcw+TBfPMDJGAI1TN9eTQNKokhKGz+dn8+xBewOXZkK5PEDsydz5u6J368ppI3iwHlFOnRgoki1dXUV3gujH+63YH31cm80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=e/zNg61Q; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e/zNg61Q"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e732386e4b7so5372967276.1
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 02:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747127362; x=1747732162; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0VewDEz0OVdUFJoKtitteEe+7RDKAGh5SCrFJfrS0ew=;
        b=e/zNg61QGDqbLlYZeuvOgCyOwpBviEUqJzA0xa4DOzHiwh+5wbT7qRMbMZY72SN7Rx
         xlAkESXDRvvlRMus45mrvhkYWfeLnYTO5ali3xgSjLqR7BAuZHJHc9wKpG7wkMCXU8LB
         AbYGdm8Ao8iQoLJU4qcAozt4HxWvRmM4OxbOBeESzvfqnS9PsFHyJ7LBigOGww3QIyrP
         HENluRAPducD5NCJInUgY0D0Pz4VPBfaMBXA1GSAJZOXTVw4+pX3HnLHUczUnJSYe1gw
         1I8ZEtRz2UPlAeGzocTCPyohHMZ4J9fVp3iHOHxOF7gOf0jU6xD6DDA8wMTA9gEnzwaO
         jxJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747127362; x=1747732162;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0VewDEz0OVdUFJoKtitteEe+7RDKAGh5SCrFJfrS0ew=;
        b=Pw7TMc4V/eNpkR4HIf8xb6ISF8EhNKk7AlmsdXKRROJgZ6rqZThow61KYa6bPX5rZ2
         u9BQSzoP+2DOVgEB41b2krq9jZznRIr1zvCqKz4oq//yl0nPTgIqpftosNhTE6vblPi9
         +Q7+du1mK+Zl493IH7cI+roCkiXnjuViYOK2HF8LDrzr4uCy5spAIzKoGuswowR8oov1
         Pz4WJhi+iYH369jENgrBtAn/s5dDijo8cOEZDDRBQ0MEi/GgqboSHWjUj6Ql11ogmAb+
         qX+8xpPdEEjcHhNWBp6wNAsIjQx3jQq52Br1MYCXnZCVJJ3dfM/O4I0zMiNDn8HLs6Hj
         lOTg==
X-Gm-Message-State: AOJu0YxQWq50Uwi/y7M38Fz7zYmGOut2h/fAPkXnsZB8G0XhgJVvNdKZ
	ef3Q6jx/TU9DAfSPtWtccgOFfi6NHwOIEGDShBYnheLXq5N0jOQEa1hFaORgnLu0jVIaRjvclHG
	Z4jfWAtn9FT235T08yvsv2vzRkJY=
X-Gm-Gg: ASbGncuXrlJauI0XUt19I6Xeig1Hv0/4RAComcdcE8eKTNCLsxzN3oWcL/chBP707/x
	XXYR/Br56fLp398zL/toVrkb4fhi6ViwuCbUpxubbfZ7qHoig+1IyDqUpM1+1ONLwrnIXs0l5Md
	AaPi4e1usOJBDhiZbQMkS3wzNdrzUv0ts=
X-Google-Smtp-Source: AGHT+IGCL1unN7OB+cKfHrGNgbV7oXHANzZetC/mDZeeYJ3nMajP4AYg44piHv4Kb2FUGowy4PhjC3lxXKL/4vSwxgs=
X-Received: by 2002:a25:df05:0:b0:e79:1011:a64a with SMTP id
 3f1490d57ef6-e791011acb0mr11021719276.42.1747127362156; Tue, 13 May 2025
 02:09:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: cen zhang <zzzccc427@gmail.com>
Date: Tue, 13 May 2025 17:09:09 +0800
X-Gm-Features: AX0GCFvs5hrBDDPajxEgjoQLQk4Up1svE0Hnv-AiJCv71HzcDVm6IpqzCnTUneo
Message-ID: <CAFRLqsXtezaJp+nUdukL2ocHGupHQX_=_NfeChjpTKG9RD3VJg@mail.gmail.com>
Subject: [BUG] Five data races in f2fs, two potentially harmful
To: jaegeuk@kernel.org, chao@kernel.org
Cc: linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, 
	zhenghaoran154@gmail.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello maintainers,

I would like to report five data race bugs we discovered in the F2FS
filesystem on Linux kernel v6.14-rc4. These issues were identified
using our data race detector.

Among the five races, we believe that three are benign, and might be
acceptable to annotate with `data_race()`. However, the remaining two
involve shared global state and may lead to inconsistencies. We are
uncertain about their potential harmfulness and would appreciate your
evaluation.

Below is a summary of the findings:

---

Benign Races
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

1. Race in `f2fs_update_time()` at lines 1915 and 1916
------------------------------------------------------

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: f2fs_fallocate+0xbb6/0x13e0 fs/f2fs/f2fs.h:1915
Function: vfs_fallocate+0x38d/0x440
Function: __x64_sys_fallocate+0xb0/0xf0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Function: f2fs_fallocate+0xbb6/0x13e0 fs/f2fs/f2fs.h:1915
Function: vfs_fallocate+0x38d/0x440
Function: __x64_sys_fallocate+0xb0/0xf0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: f2fs_fallocate+0xc30/0x13e0 fs/f2fs/f2fs.h:1916
Function: vfs_fallocate+0x38d/0x440
Function: __x64_sys_fallocate+0xb0/0xf0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Function: f2fs_setxattr+0x53d/0x8e0 fs/f2fs/f2fs.h:1916
Function: f2fs_xattr_generic_set+0x293/0x3c0 fs/f2fs/xattr.c:86
Function: __vfs_setxattr+0x3b6/0x3f0
Function: __vfs_setxattr_noperm+0x115/0x5c0
Function: vfs_setxattr+0x165/0x300
Function: file_setxattr+0x1a9/0x280
Function: path_setxattrat+0x2f4/0x370
Function: __x64_sys_fsetxattr+0xbc/0xe0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

2. Race on `inode->i_advise`
----------------------------
A read in `f2fs_update_inode()` and a write in
`f2fs_expand_inode_data()` can happen concurrently.

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: f2fs_update_inode+0x36a/0x7c30 fs/f2fs/inode.c:670
Function: f2fs_fsync_node_pages+0x3756/0x61a0 fs/f2fs/node.c:1848
Function: f2fs_do_sync_file+0x1935/0x3ba0 fs/f2fs/file.c:343
Function: f2fs_sync_file+0x2e2/0x450 fs/f2fs/file.c:395
Function: __x64_sys_fsync+0x18a/0x1d0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
VarName 7370413196168665605, BlockLineNumber 152, IrLineNumber 2,
watchpoint index 38631
Function: f2fs_expand_inode_data+0x14ad/0x1af0 fs/f2fs/f2fs.h:3346
Function: f2fs_fallocate+0x7be/0x13e0 fs/f2fs/file.c:1959
Function: vfs_fallocate+0x38d/0x440
Function: __x64_sys_fallocate+0xb0/0xf0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D

3. Race on `mapping->writeback_index` in `f2fs_write_cache_pages()`
-------------------------------------------------------------------
Multiple writers may assign to `mapping->writeback_index` concurrently.
This behavior is also seen in other subsystems and may be acceptable,
although racy in a strict sense.

Kernel panic: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Function: f2fs_write_data_pages+0x55ca/0x7220 fs/f2fs/data.c:3221
Function: do_writepages+0x302/0x7c0
Function: file_write_and_wait_range+0x1e2/0x3e0
Function: f2fs_do_sync_file+0xa41/0x3ba0 fs/f2fs/file.c:278
Function: f2fs_sync_file+0x2e2/0x450 fs/f2fs/file.c:395
Function: __x64_sys_fsync+0x18a/0x1d0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOTHER_INFO=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: f2fs_write_data_pages+0x55ca/0x7220 fs/f2fs/data.c:3221
Function: do_writepages+0x302/0x7c0
Function: file_write_and_wait_range+0x1e2/0x3e0
Function: f2fs_do_sync_file+0xa41/0x3ba0 fs/f2fs/file.c:278
Function: f2fs_sync_file+0x2e2/0x450 fs/f2fs/file.c:395
Function: __x64_sys_fsync+0x18a/0x1d0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
---

Possibly Harmful Race
----------------------------

1. Race on `free_sections` field of `struct f2fs_sb_info`
----------------------------

This race involves concurrent read and write to `sbi->free_sections`.
The read occurs in the function `has_not_enough_free_secs()` during a
write operation, while the write occurs deeper in `new_curseg()`
during a sync path.=EF=BC=9A

Kernel panic: =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
Function: has_not_enough_free_secs+0x11fd/0x1f50 fs/f2fs/segment.h:530
Function: f2fs_write_begin+0x33df/0x5580 fs/f2fs/data.c:3627
Function: generic_perform_write+0x26d/0x660
Function: f2fs_file_write_iter+0x15ea/0x55a0 fs/f2fs/file.c:4855
Function: vfs_write+0x940/0xd10
Function: ksys_write+0x116/0x200
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
Function: new_curseg+0x2382/0x3900 fs/f2fs/segment.h:456
Function: f2fs_allocate_data_block+0x47e3/0xa570 fs/f2fs/segment.c:3800
Function: do_write_page+0x321/0x1170 fs/f2fs/segment.c:3913
Function: f2fs_do_write_node_page+0x1aa/0x4d0 fs/f2fs/segment.c:3965
Function: __write_node_page+0x166e/0x4400 fs/f2fs/node.c:1706
Function: f2fs_fsync_node_pages+0x3b70/0x61a0 fs/f2fs/node.c:1860
Function: f2fs_do_sync_file+0x1935/0x3ba0 fs/f2fs/file.c:343
Function: f2fs_sync_file+0x2e2/0x450 fs/f2fs/file.c:395
Function: __x64_sys_fsync+0x18a/0x1d0
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
----

2. Race on `nat_cnt[TOTAL_NAT]` in `struct f2fs_nm_info`
----------------------------
A read from `f2fs_balance_fs()` (via `excess_cached_nats()`) and a
concurrent write from `__init_nat_entry()` (in the mkdir path) race on
the same counter field. No locking or atomic access is used.

 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D DATARACE =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: f2fs_balance_fs+0x269/0xcd0 fs/f2fs/node.h:138
Function: f2fs_setattr+0x2585/0x38f0 fs/f2fs/file.c:1142
Function: notify_change+0x9f9/0xca0
Function: chmod_common+0x1fe/0x410
Function: __x64_sys_fchmod+0xd4/0x130
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
Function: 0x0
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DOTHER_INFO=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D
Function: set_node_addr+0x8c1/0x3760 fs/f2fs/node.c:202
Function: f2fs_new_node_page+0x12ce/0x3870 fs/f2fs/node.c:1357
Function: f2fs_new_inode_page+0x1a6/0x290 fs/f2fs/node.c:1313
Function: f2fs_init_inode_metadata+0x13a/0x32a0 fs/f2fs/dir.c:524
Function: f2fs_add_regular_entry+0xa3f/0x1cc0 fs/f2fs/dir.c:721
Function: f2fs_add_dentry+0x15e/0x560 fs/f2fs/dir.c:769
Function: f2fs_do_add_link+0x660/0xb30 fs/f2fs/dir.c:808
Function: f2fs_mkdir+0x70c/0xd50 fs/f2fs/f2fs.h:3616
Function: vfs_mkdir+0x4b1/0x6e0
Function: do_mkdirat+0x1ae/0x260
Function: __x64_sys_mkdir+0x6c/0x80
Function: do_syscall_64+0xc9/0x1a0
Function: entry_SYSCALL_64_after_hwframe+0x77/0x7f
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DEND=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D
-----

Thank you for your attention to this matter.

Best regards,
Cen Zhang
