Received: from invmail4.hynix.com (exvmail4.skhynix.com [166.125.252.92])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2BF392628C
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 02:31:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=166.125.252.92
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750645921; cv=none; b=cdwfK4ZUfGyeIRlNV/VwTQAeGXtij36hb0ZtZuv10edzZso5hzTeB4HWw/lMprLiQ9QhdP2eo9lCARo2rrDtEIw9/urc2lixoah6DzQHLGRCZPynE0rUlIqKdNojepmu9sJec9lEGXMLmhhg3nfVKIJkBOb2Bg0N38kUyU3eiOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750645921; c=relaxed/simple;
	bh=T1H+tQLjKHHBNfk3Cx5an6LGooycIY80Gxxl+sYbAC4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AY1nxwq8kMPYOeLNmqsqtO8CagWWr9PCQmf13dhNiXNib+VBm56r/Ph2BRV1RXBzsGvUFr+xWLow0Dnyu2mR7Ted+7vgN3kuWkx91PvmJo3aANBL0f4cFnXE+uGdUYk1+ZQbbn3iMs8NRwr+iPMOJekh/fdHooSDWhexSn/ZW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com; spf=pass smtp.mailfrom=sk.com; arc=none smtp.client-ip=166.125.252.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sk.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sk.com
X-AuditID: a67dfc5b-681ff7000002311f-ca-6858bc9a27af
Date: Mon, 23 Jun 2025 11:31:49 +0900
From: Byungchul Park <byungchul@sk.com>
To: linux-kernel@vger.kernel.org, almaz.alexandrovich@paragon-software.com,
	ntfs3@lists.linux.dev
Cc: kernel_team@skhynix.com, torvalds@linux-foundation.org,
	akpm@linux-foundation.org, yeoreum.yun@arm.com,
	yunseong.kim@ericsson.com, gwan-gyeong.mun@intel.com,
	harry.yoo@oracle.com, ysk@kzalloc.com
Subject: [RFC] DEPT report on around ntfs3 and filemap
Message-ID: <20250623023149.GA70156@system.software.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrILMWRmVeSWpSXmKPExsXC9ZZnke6sPREZBtOPy1nMWb+GzeLa40Ps
	Fhdf/2GyuL/sGYvF5V1z2CxWPt7KZPGo7y27xdwvhhZfVq9is1j79xqjA5fHmnlrGD1+fb3K
	5rF4z0smj4W/XzB7nJjxm8XjxeaZjB4fn95i8Zh56AKLx+dNcgGcUVw2Kak5mWWpRfp2CVwZ
	nb/OsRac9Ky4vvcbUwPjGtsuRk4OCQETiRdXXzPD2CtuzGMBsVkEVCVuH58IFmcTUJe4ceMn
	mC0ikCzxZfk7xi5GLg5mgbOMEtdXXGYCSQgLmEks/fcFzOYVsJBYt3cJC4QtKHFy5hMwm1lA
	S+LGv5dANRxAtrTE8n8cIGFRAWWJA9uOM4HMlBA4wiYxZ2s7E8RBkhIHV9xgmcDINwvJqFlI
	Rs1CGLWAkXkVo1BmXlluYmaOiV5GZV5mhV5yfu4mRmDAL6v9E72D8dOF4EOMAhyMSjy8CTwR
	GUKsiWXFlbmHGCU4mJVEeA85hWUI8aYkVlalFuXHF5XmpBYfYpTmYFES5zX6Vp4iJJCeWJKa
	nZpakFoEk2Xi4JRqYDS3r/hpVbtW5OKFwz7PLsyQmLwkR9rls579ItEABV/OD3duiLaIPP+6
	Kq2Zz+V0xV3zm3prbpxT2tkR+p6bqejNp+3yaf9yb1+o9rtpyKrQMK0on6taNuhey6afVeXB
	Z9YoVj2VadCXkP+c0HLHxdRNTtvu0Upbo4fTGKZun++slDKvjZP1qBJLcUaioRZzUXEiALW6
	jn10AgAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrBLMWRmVeSWpSXmKPExsXC5WfdrDtrT0SGwYNzIhZz1q9hs7j2+BC7
	xcXXf5gs7i97xmJxeO5JVovLu+awWax8vJXJ4lHfW3aLuV8MLb6sXsVmsfbvNUYHbo8189Yw
	evz6epXNY/Gel0weC3+/YPY4MeM3i8eLzTMZPT4+vcXiMfPQBRaPxS8+MHl83iQXwBXFZZOS
	mpNZllqkb5fAldH56xxrwUnPiut7vzE1MK6x7WLk5JAQMJFYcWMeC4jNIqAqcfv4RGYQm01A
	XeLGjZ9gtohAssSX5e8Yuxi5OJgFzjJKXF9xmQkkISxgJrH03xcwm1fAQmLd3iUsELagxMmZ
	T8BsZgEtiRv/XgLVcADZ0hLL/3GAhEUFlCUObDvONIGRexaSjllIOmYhdCxgZF7FKJKZV5ab
	mJljqlecnVGZl1mhl5yfu4kRGL7Lav9M3MH45bL7IUYBDkYlHt4V3hEZQqyJZcWVuYcYJTiY
	lUR4DzmFZQjxpiRWVqUW5ccXleakFh9ilOZgURLn9QpPTRASSE8sSc1OTS1ILYLJMnFwSjUw
	nkjWzbQoY32R83DlnZlHdtsn1fn2b/JNrf/kr2b8sfLW73idTM/EY3pTdkqtCky0lipmf3Vt
	7blSEeP0nmsKQZFCaxQ27VPcusmo4pDhmTpOZV/etpLt0eu3e2tOPjDjycwg1ZthGs77lxYn
	5dx7UaFVmhCtxFa8ffWNvu32DKFPNgj7BdgpsRRnJBpqMRcVJwIAouruvVsCAAA=
X-CFilter-Loop: Reflected

Hi folks,

Thanks to Yunseong, we got a DEPT report in ntfs3.  It doesn't mean it's
an obvious deadlock, but after digging into the report, I'm wondering if
it could happen by any chance.  The scenario that I'm concerning is:

  CONTEXT A			  CONTEXT B

  ntfs_fill_super()
    inode_read_data() // for sbi->def_table and sbi->upcase
      ...			  ntfs_lookup()
				    mutex_lock(&ni->ni_lock) // hold
				    dir_search_u()
				      ...
				        btfs_bread()
        folio_lock() // hold
        filemap_read_folio() // with folio lock held
				          ...
				            __find_get_block_slow()
				              folio_lock() // stuck
          ntfs_read_folio()
	    mutex_lock(&ni->ni_lock) // stuck

Am I missing something?  One thing possibily I'm missing is that the two
ni_locks never contend, but I'm not sure if it's true for the all
possible cases e.g. manipulating block dev directly.

FYI, the following is the DEPT report we got.

	Byungchul
---
 [ 2279.669417][T42160] ===================================================
 [ 2279.669468][T42160] DEPT: Circular dependency has been detected.
 [ 2279.669483][T42160] 6.15.0-rc6-00043-ga83a69ec7f9f #5 Not tainted
 [ 2279.669499][T42160] ---------------------------------------------------
 [ 2279.669511][T42160] summary
 [ 2279.669522][T42160] ---------------------------------------------------
 [ 2279.669534][T42160] *** DEADLOCK ***
 [ 2279.669534][T42160]
 [ 2279.669545][T42160] context A
 [ 2279.669557][T42160]    [S] (unknown)(pg_locked_map:0)
 [ 2279.669572][T42160]    [W] lock(&ni->ni_lock:0)
 [ 2279.669587][T42160]    [E] dept_page_clear_bit(pg_locked_map:0)
 [ 2279.669601][T42160]
 [ 2279.669611][T42160] context B
 [ 2279.669622][T42160]    [S] lock(&ni->ni_lock:0)
 [ 2279.669635][T42160]    [W] dept_page_wait_on_bit(pg_locked_map:0)
 [ 2279.669650][T42160]    [E] unlock(&ni->ni_lock:0)
 [ 2279.669663][T42160]
 [ 2279.669673][T42160] [S]: start of the event context
 [ 2279.669683][T42160] [W]: the wait blocked
 [ 2279.669693][T42160] [E]: the event not reachable
 [ 2279.669704][T42160] ---------------------------------------------------
 [ 2279.669714][T42160] context A's detail
 [ 2279.669725][T42160] ---------------------------------------------------
 [ 2279.669735][T42160] context A
 [ 2279.669746][T42160]    [S] (unknown)(pg_locked_map:0)
 [ 2279.669759][T42160]    [W] lock(&ni->ni_lock:0)
 [ 2279.669772][T42160]    [E] dept_page_clear_bit(pg_locked_map:0)
 [ 2279.669786][T42160]
 [ 2279.669796][T42160] [S] (unknown)(pg_locked_map:0):
 [ 2279.669809][T42160] (N/A)
 [ 2279.669818][T42160]
 [ 2279.669828][T42160] [W] lock(&ni->ni_lock:0):
 [ 2279.669841][T42160] [<ffff800081935bd4>] ntfs_read_folio+0x174/0x200
 [ 2279.669875][T42160] stacktrace:
 [ 2279.669901][T42160]       __mutex_lock+0x730/0xa08
 [ 2279.669932][T42160]       mutex_lock_nested+0x24/0x38
 [ 2279.669952][T42160]       ntfs_read_folio+0x174/0x200
 [ 2279.669970][T42160]       filemap_read_folio+0xc8/0x280
 [ 2279.669990][T42160]       do_read_cache_folio+0x290/0x56c
 [ 2279.670010][T42160]       read_cache_page+0x64/0x150
 [ 2279.670027][T42160]       inode_read_data+0xa4/0x9c0
 [ 2279.670046][T42160]       ntfs_fill_super+0x1fec/0x3840
 [ 2279.670072][T42160]       get_tree_bdev_flags+0x330/0x528
 [ 2279.670099][T42160]       get_tree_bdev+0x2c/0x3c
 [ 2279.670119][T42160]       ntfs_fs_get_tree+0x28/0x38
 [ 2279.670139][T42160]       vfs_get_tree+0x7c/0x2c0
 [ 2279.670158][T42160]       path_mount+0x1380/0x1d20
 [ 2279.670184][T42160]       __arm64_sys_mount+0x438/0x530
 [ 2279.670204][T42160]       invoke_syscall+0x88/0x2e0
 [ 2279.670234][T42160]       el0_svc_common.constprop.0+0xe8/0x2e0
 [ 2279.670256][T42160]
 [ 2279.670265][T42160] [E] dept_page_clear_bit(pg_locked_map:0):
 [ 2279.670279][T42160] [<ffff800081935c14>] ntfs_read_folio+0x1b4/0x200
 [ 2279.670299][T42160] stacktrace:
 [ 2279.670309][T42160]       ntfs_read_folio+0x1b4/0x200
 [ 2279.670327][T42160]       filemap_read_folio+0xc8/0x280
 [ 2279.670343][T42160]       do_read_cache_folio+0x290/0x56c
 [ 2279.670361][T42160]       read_cache_page+0x64/0x150
 [ 2279.670378][T42160]       inode_read_data+0xa4/0x9c0
 [ 2279.670396][T42160]       ntfs_fill_super+0x1fec/0x3840
 [ 2279.670418][T42160]       get_tree_bdev_flags+0x330/0x528
 [ 2279.670438][T42160]       get_tree_bdev+0x2c/0x3c
 [ 2279.670458][T42160]       ntfs_fs_get_tree+0x28/0x38
 [ 2279.670478][T42160]       vfs_get_tree+0x7c/0x2c0
 [ 2279.670497][T42160]       path_mount+0x1380/0x1d20
 [ 2279.670516][T42160]       __arm64_sys_mount+0x438/0x530
 [ 2279.670535][T42160]       invoke_syscall+0x88/0x2e0
 [ 2279.670555][T42160]       el0_svc_common.constprop.0+0xe8/0x2e0
 [ 2279.670577][T42160]       do_el0_svc+0x44/0x60
 [ 2279.670597][T42160]       el0_svc+0x50/0x188
 [ 2279.670626][T42160] ---------------------------------------------------
 [ 2279.670637][T42160] context B's detail
 [ 2279.670648][T42160] ---------------------------------------------------
 [ 2279.670659][T42160] context B
 [ 2279.670669][T42160]    [S] lock(&ni->ni_lock:0)
 [ 2279.670683][T42160]    [W] dept_page_wait_on_bit(pg_locked_map:0)
 [ 2279.670697][T42160]    [E] unlock(&ni->ni_lock:0)
 [ 2279.670710][T42160]
 [ 2279.670719][T42160] [S] lock(&ni->ni_lock:0):
 [ 2279.670732][T42160] [<ffff800081951e78>] ntfs_lookup+0x188/0x238
 [ 2279.670755][T42160] stacktrace:
 [ 2279.670764][T42160]       __mutex_lock+0x74c/0xa08
 [ 2279.670783][T42160]       mutex_lock_nested+0x24/0x38
 [ 2279.670803][T42160]       ntfs_lookup+0x188/0x238
 [ 2279.670822][T42160]       lookup_open.isra.0+0x414/0x1310
 [ 2279.670846][T42160]       path_openat+0x1174/0x2740
 [ 2279.670867][T42160]       do_filp_open+0x198/0x3a0
 [ 2279.670895][T42160]       do_sys_openat2+0x11c/0x1e0
 [ 2279.670912][T42160]       __arm64_sys_openat+0x158/0x208
 [ 2279.670929][T42160]       invoke_syscall+0x88/0x2e0
 [ 2279.670949][T42160]       el0_svc_common.constprop.0+0xe8/0x2e0
 [ 2279.670970][T42160]       do_el0_svc+0x44/0x60
 [ 2279.670990][T42160]       el0_svc+0x50/0x188
 [ 2279.671011][T42160]       el0t_64_sync_handler+0x10c/0x140
 [ 2279.671034][T42160]       el0t_64_sync+0x198/0x19c
 [ 2279.671053][T42160]
 [ 2279.671062][T42160] [W] dept_page_wait_on_bit(pg_locked_map:0):
 [ 2279.671075][T42160] [<ffff800080dfcae4>] bdev_getblk+0x174/0x218
 [ 2279.671100][T42160] stacktrace:
 [ 2279.671110][T42160]       __find_get_block_slow+0x26c/0x684
 [ 2279.671128][T42160]       bdev_getblk+0x174/0x218
 [ 2279.671145][T42160]       __bread_gfp+0x8c/0x2b8
 [ 2279.671162][T42160]       ntfs_bread+0xb8/0x22c
 [ 2279.671192][T42160]       wnd_map+0x264/0x3a0
 [ 2279.671212][T42160]       wnd_is_used+0x338/0x520
 [ 2279.671232][T42160]       run_unpack_ex+0x454/0x62c
 [ 2279.671252][T42160]       ntfs_iget5+0x980/0x3048
 [ 2279.671270][T42160]       dir_search_u+0x140/0x348
 [ 2279.671290][T42160]       ntfs_lookup+0x198/0x238
 [ 2279.671309][T42160]       lookup_open.isra.0+0x414/0x1310
 [ 2279.671328][T42160]       path_openat+0x1174/0x2740
 [ 2279.671348][T42160]       do_filp_open+0x198/0x3a0
 [ 2279.671367][T42160]       do_sys_openat2+0x11c/0x1e0
 [ 2279.671383][T42160]       __arm64_sys_openat+0x158/0x208
 [ 2279.671400][T42160]       invoke_syscall+0x88/0x2e0
 [ 2279.671420][T42160]
 [ 2279.671430][T42160] [E] unlock(&ni->ni_lock:0):
 [ 2279.671442][T42160] (N/A)
 [ 2279.671452][T42160] ---------------------------------------------------
 [ 2279.671463][T42160] information that might be helpful
 [ 2279.671473][T42160] ---------------------------------------------------
 [ 2279.671488][T42160] CPU: 2 UID: 0 PID: 42160 Comm: syz.0.6499 Not tainted 6.15.0-rc6-00043-ga83a69ec7f9f #5 PREEMPT
 [ 2279.671502][T42160] Hardware name: QEMU KVM Virtual Machine, BIOS 2025.02-8 05/13/2025
 [ 2279.671510][T42160] Call trace:
 [ 2279.671515][T42160]  show_stack+0x34/0x80 (C)
 [ 2279.671542][T42160]  dump_stack_lvl+0x104/0x180
 [ 2279.671568][T42160]  dump_stack+0x20/0x2c
 [ 2279.671583][T42160]  cb_check_dl+0x1080/0x10ec
 [ 2279.671599][T42160]  bfs+0x4d8/0x630
 [ 2279.671610][T42160]  add_dep+0x1cc/0x364
 [ 2279.671623][T42160]  __dept_event.part.0+0xde0/0x1240
 [ 2279.671636][T42160]  dept_event+0x208/0x29c
 [ 2279.671649][T42160]  folio_unlock+0x8c/0x160
 [ 2279.671678][T42160]  ntfs_read_folio+0x1b4/0x200
 [ 2279.671691][T42160]  filemap_read_folio+0xc8/0x280
 [ 2279.671702][T42160]  do_read_cache_folio+0x290/0x56c
 [ 2279.671714][T42160]  read_cache_page+0x64/0x150
 [ 2279.671726][T42160]  inode_read_data+0xa4/0x9c0
 [ 2279.671740][T42160]  ntfs_fill_super+0x1fec/0x3840
 [ 2279.671756][T42160]  get_tree_bdev_flags+0x330/0x528
 [ 2279.671771][T42160]  get_tree_bdev+0x2c/0x3c
 [ 2279.671786][T42160]  ntfs_fs_get_tree+0x28/0x38
 [ 2279.671801][T42160]  vfs_get_tree+0x7c/0x2c0
 [ 2279.671815][T42160]  path_mount+0x1380/0x1d20
 [ 2279.671829][T42160]  __arm64_sys_mount+0x438/0x530
 [ 2279.671844][T42160]  invoke_syscall+0x88/0x2e0
 [ 2279.671859][T42160]  el0_svc_common.constprop.0+0xe8/0x2e0
 [ 2279.671875][T42160]  do_el0_svc+0x44/0x60
 [ 2279.671898][T42160]  el0_svc+0x50/0x188
 [ 2279.671915][T42160]  el0t_64_sync_handler+0x10c/0x140
 [ 2279.671932][T42160]  el0t_64_sync+0x198/0x19c
