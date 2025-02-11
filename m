Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CB5017580
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 06:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739256386; cv=none; b=LI0t2ce/oeuqux20Eip4vs8Kfvi7XxElbGfVg96DEzbelTZ04k20pJJ5nKut+G5/HVXniyKGeIu6g2JWA2fruFUaEpvHf/xpZRfVjUGwdYknFJ3BTiT7GnQ70cTZ8BeYLpw3ybN1c8VD1G1DwLJz12kl7/3ssuF09G5dLfvELZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739256386; c=relaxed/simple;
	bh=4/bBof4nBSuycBoOjyQ4CVJX/pOkJRoqAHG3YArMPk0=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ABPBNkYq75yV+BWtdibcxSY1SHBO8/8c1gW4deBceufCCyBwF9o+2rFud1AxFM/SNbZsRz1ZzhUzJio3UyRRV+/7DyLVb2JB4rmxEl2INlfr1ncgX4F4lBvb45xgLAOMIxusPfyPGFJpbjgw9zdMlk5nkw2P67gJfp50InxQEmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CUS4waoW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CUS4waoW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 108ECC4CEDD;
	Tue, 11 Feb 2025 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739256385;
	bh=4/bBof4nBSuycBoOjyQ4CVJX/pOkJRoqAHG3YArMPk0=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=CUS4waoWWpM6MsiwgbHHlLJ7pSj3mmuCAerVKXgcHx7pdGsxb408fKa4zNsVJMJVx
	 6+F2pFMsQh8GHswDxvEoe86hccHyJL9S47iaIwPXIjy6yxPu+MQbA4keXoI+fzDpTx
	 tTP9y5bSz5eWNPnzAHrek51tSkSYUII0dcapSoV3KC2OUwAfy94UQDBLCgh/J8mNB8
	 Yi1IDjZKFQAcr2zZcuaKdcE2kiPYvxl7hjlcAxC8af+aNByug7NZVX4fp6TZnSOK95
	 7LhPT10C/vm2NxFXiGrQYA89F8IdP7Tt7cSp1pLXUGz8X/4GGqJO9nDug+VmyMPexq
	 GHJOMRZp4bTGA==
Message-ID: <9995fa83-c964-485c-911f-43e4df526ba2@kernel.org>
Date: Tue, 11 Feb 2025 14:46:22 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: chao@kernel.org
Subject: Re: [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 inline_xattr_addr
To: syzbot <syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <6764cecc.050a0220.1bfc9e.0001.GAE@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
In-Reply-To: <6764cecc.050a0220.1bfc9e.0001.GAE@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

#syz fix: f2fs: fix to do sanity check correctly on i_inline_xattr_size

On 12/20/24 09:56, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    2e7aff49b5da Merge branches 'for-next/core' and 'for-next/..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=11b77344580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=696fb014d05da3a3
> dashboard link: https://syzkaller.appspot.com/bug?extid=e4876215632c2d23b481
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1121d4f8580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13511730580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/ef408f67fde3/disk-2e7aff49.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/414ac17a20dc/vmlinux-2e7aff49.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/a93415d2a7e7/Image-2e7aff49.gz.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/57bb66f25be5/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+e4876215632c2d23b481@syzkaller.appspotmail.com
> 
> F2FS-fs (loop0): Failed to enable quota tracking (type=1, err=-22). Please run fsck to fix.
> F2FS-fs (loop0): Cannot turn on quotas: error -22
> F2FS-fs (loop0): Mounted with checkpoint version = 1b41e954
> ------------[ cut here ]------------
> UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3292:19
> index 18446744073709500059 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
> CPU: 0 UID: 0 PID: 6410 Comm: syz-executor883 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>  dump_stack+0x1c/0x28 lib/dump_stack.c:129
>  ubsan_epilogue lib/ubsan.c:231 [inline]
>  __ubsan_handle_out_of_bounds+0xf8/0x148 lib/ubsan.c:429
>  inline_xattr_addr+0x524/0x530 fs/f2fs/f2fs.h:3292
>  read_inline_xattr fs/f2fs/xattr.c:289 [inline]
>  lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>  f2fs_getxattr+0x5b4/0x1064 fs/f2fs/xattr.c:533
>  f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
>  __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
>  smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
>  smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
>  security_d_instantiate+0x100/0x204 security/security.c:4070
>  d_splice_alias+0x70/0x310 fs/dcache.c:3001
>  f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
>  lookup_one_qstr_excl+0x108/0x230 fs/namei.c:1692
>  filename_create+0x230/0x468 fs/namei.c:4081
>  do_mkdirat+0xac/0x574 fs/namei.c:4326
>  __do_sys_mkdirat fs/namei.c:4349 [inline]
>  __se_sys_mkdirat fs/namei.c:4347 [inline]
>  __arm64_sys_mkdirat+0x8c/0xa4 fs/namei.c:4347
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> ---[ end trace ]---
> ==================================================================
> BUG: KASAN: slab-use-after-free in read_inline_xattr fs/f2fs/xattr.c:291 [inline]
> BUG: KASAN: slab-use-after-free in lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
> BUG: KASAN: slab-use-after-free in f2fs_getxattr+0x5c8/0x1064 fs/f2fs/xattr.c:533
> Read of size 209920 at addr ffff0000d7f1ebd4 by task syz-executor883/6410
> 
> CPU: 0 UID: 0 PID: 6410 Comm: syz-executor883 Not tainted 6.13.0-rc2-syzkaller-g2e7aff49b5da #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> Call trace:
>  show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:484 (C)
>  __dump_stack lib/dump_stack.c:94 [inline]
>  dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
>  print_address_description mm/kasan/report.c:378 [inline]
>  print_report+0x198/0x538 mm/kasan/report.c:489
>  kasan_report+0xd8/0x138 mm/kasan/report.c:602
>  kasan_check_range+0x268/0x2a8 mm/kasan/generic.c:189
>  __asan_memcpy+0x3c/0x84 mm/kasan/shadow.c:105
>  read_inline_xattr fs/f2fs/xattr.c:291 [inline]
>  lookup_all_xattrs fs/f2fs/xattr.c:341 [inline]
>  f2fs_getxattr+0x5c8/0x1064 fs/f2fs/xattr.c:533
>  f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
>  __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
>  smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
>  smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
>  security_d_instantiate+0x100/0x204 security/security.c:4070
>  d_splice_alias+0x70/0x310 fs/dcache.c:3001
>  f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
>  lookup_one_qstr_excl+0x108/0x230 fs/namei.c:1692
>  filename_create+0x230/0x468 fs/namei.c:4081
>  do_mkdirat+0xac/0x574 fs/namei.c:4326
>  __do_sys_mkdirat fs/namei.c:4349 [inline]
>  __se_sys_mkdirat fs/namei.c:4347 [inline]
>  __arm64_sys_mkdirat+0x8c/0xa4 fs/namei.c:4347
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> Allocated by task 6343:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>  kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:568
>  unpoison_slab_object mm/kasan/common.c:319 [inline]
>  __kasan_slab_alloc+0x74/0x8c mm/kasan/common.c:345
>  kasan_slab_alloc include/linux/kasan.h:250 [inline]
>  slab_post_alloc_hook mm/slub.c:4104 [inline]
>  slab_alloc_node mm/slub.c:4153 [inline]
>  kmem_cache_alloc_noprof+0x254/0x410 mm/slub.c:4160
>  getname_flags+0xcc/0x4b4 fs/namei.c:139
>  getname+0x24/0x34 fs/namei.c:223
>  do_sys_openat2+0xd0/0x1b8 fs/open.c:1396
>  do_sys_open fs/open.c:1417 [inline]
>  __do_sys_openat fs/open.c:1433 [inline]
>  __se_sys_openat fs/open.c:1428 [inline]
>  __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> Freed by task 6343:
>  kasan_save_stack mm/kasan/common.c:47 [inline]
>  kasan_save_track+0x40/0x78 mm/kasan/common.c:68
>  kasan_save_free_info+0x54/0x6c mm/kasan/generic.c:582
>  poison_slab_object mm/kasan/common.c:247 [inline]
>  __kasan_slab_free+0x64/0x8c mm/kasan/common.c:264
>  kasan_slab_free include/linux/kasan.h:233 [inline]
>  slab_free_hook mm/slub.c:2338 [inline]
>  slab_free mm/slub.c:4598 [inline]
>  kmem_cache_free+0x198/0x554 mm/slub.c:4700
>  putname+0x130/0x184 fs/namei.c:296
>  do_sys_openat2+0x164/0x1b8 fs/open.c:1410
>  do_sys_open fs/open.c:1417 [inline]
>  __do_sys_openat fs/open.c:1433 [inline]
>  __se_sys_openat fs/open.c:1428 [inline]
>  __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
>  __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
>  invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
>  el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
>  do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
>  el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
>  el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
>  el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
> 
> The buggy address belongs to the object at ffff0000d7f1e600
>  which belongs to the cache names_cache of size 4096
> The buggy address is located 1492 bytes inside of
>  freed 4096-byte region [ffff0000d7f1e600, ffff0000d7f1f600)
> 
> The buggy address belongs to the physical page:
> page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x117f18
> head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
> flags: 0x5ffc00000000040(head|node=0|zone=2|lastcpupid=0x7ff)
> page_type: f5(slab)
> raw: 05ffc00000000040 ffff0000c18958c0 dead000000000122 0000000000000000
> raw: 0000000000000000 0000000000070007 00000001f5000000 0000000000000000
> head: 05ffc00000000040 ffff0000c18958c0 dead000000000122 0000000000000000
> head: 0000000000000000 0000000000070007 00000001f5000000 0000000000000000
> head: 05ffc00000000003 fffffdffc35fc601 ffffffffffffffff 0000000000000000
> head: 0000000000000008 0000000000000000 00000000ffffffff 0000000000000000
> page dumped because: kasan: bad access detected
> 
> Memory state around the buggy address:
>  ffff0000d7f1ea80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff0000d7f1eb00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>> ffff0000d7f1eb80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>                                                  ^
>  ffff0000d7f1ec00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>  ffff0000d7f1ec80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
> ==================================================================
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

