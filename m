Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4239A14F70
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 17:47:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158448; cv=none; b=oHqP7Lx4AXXOApwc5hzysZClrIx8JZLXAHfsbApRUlYWhmXzauRFrKftAO16qgjOjui07Gi91NpwSyjJkfLjioWqL4Ope6Th1VowLDKPEGuuh0iz6knA0al3J9G3NJL7G5kkv/Y8GvNfDfC3MnwLhP7x6TbTebFA36JqhnYNvZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158448; c=relaxed/simple;
	bh=VsYavGNsEkHJxAbGXotgGBBtjHEq8v/B0o05ULr5pXU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=irUMEQV8PD7BAAw+HkSUiIz61ffWlMnIfh7ZHId5G9MftErB2lw2+q/YmNOxqbuLp6yFKfG+MCJkwBAY8AP+MDoAYgnSveKvODgysWfQOyuXp6m1ctAcZ8+GacXidlgO0AGKNfv2cm8Xc5VEfjcvc6fKzet0UuTnjKk6hEJ3UiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1867B14BF;
	Tue, 13 May 2025 10:47:13 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 52CB63F63F;
	Tue, 13 May 2025 10:47:22 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: gregkh@linuxfoundation.org,
	arve@android.com,
	tkjos@android.com,
	maco@android.com,
	joel@joelfernandes.org,
	brauner@kernel.org,
	mllamas@google.com,
	surenb@google.com
Cc: linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Yeoreum Yun <yeoreun.yun@arm.com>,
	Yunseong Kim <ysk@kzalloc.com>
Subject: [PATCH] driver/android/binderfs: fix race for binderfs' devices list
Date: Tue, 13 May 2025 18:47:19 +0100
Message-Id: <20250513174719.3096063-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

binderfs' devices list is global list and can be accesed by multi-thread
while unmount binder device.
Since there is no proper locking, it can meet datarace problem.
for example it's one of case reported UAF while binderfs_evict_inode()
removes binder device:

sudo ./stress-ng --binderfs 8 --binderfs-ops 10000 -t 15 \
  --pathological --timestamp --tz --syslog --perf --no-rand-seed \
  --times --metrics --klog-check --status 5 -x smi -v --interrupts --change-cpu

stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492292] '=================================================================='
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492301] 'BUG: KASAN: slab-use-after-free in binderfs_evict_inode+0x32c/0x338'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492309] 'Write of size 8 at addr ffff0000e48c3c08 by task stress-ng-binde/2960'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492312] ''
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492315] 'CPU: 7 UID: 0 PID: 2960 Comm: stress-ng-binde Not tainted 6.15.0-rc6+ #12 PREEMPT(full) '
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492319] 'Hardware name: QEMU QEMU Virtual Machine, BIOS 0.0.0 02/06/2015'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492321] 'Call trace:'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492322] ' show_stack+0x40/0xa8 (C)'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492327] ' dump_stack_lvl+0xd4/0x130'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492330] ' print_report+0x164/0x550'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492334] ' kasan_report+0xbc/0x1c8'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492339] ' __asan_report_store8_noabort+0x24/0x50'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492343] ' binderfs_evict_inode+0x32c/0x338'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492348] ' evict+0x2c4/0x6e0'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492351] ' iput+0x408/0x748'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492354] ' dentry_unlink_inode+0x268/0x520'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492358] ' __dentry_kill+0x17c/0x5c8'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492362] ' shrink_dentry_list+0x154/0x548'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492366] ' shrink_dcache_parent+0x16c/0x508'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492370] ' shrink_dcache_for_umount+0x9c/0x378'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492375] ' generic_shutdown_super+0x74/0x428'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492380] ' kill_litter_super+0x84/0xe8'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492384] ' binderfs_kill_super+0x48/0xc8'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492389] ' deactivate_locked_super+0xc0/0x200'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492393] ' deactivate_super+0x10c/0x160'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492398] ' cleanup_mnt+0x1ac/0x3a8'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492402] ' __cleanup_mnt+0x2c/0x58'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492407] ' task_work_run+0x14c/0x280'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492411] ' do_notify_resume+0x24c/0x2e0'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492415] ' el0_svc+0x13c/0x150'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492420] ' el0t_64_sync_handler+0x134/0x160'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492425] ' el0t_64_sync+0x1b8/0x1c0'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492428] ''
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492428] 'Allocated by task 2961:'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492430] ' kasan_save_stack+0x40/0x80'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492434] ' kasan_save_track+0x24/0x58'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492437] ' kasan_save_alloc_info+0x44/0x88'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492441] ' __kasan_kmalloc+0x108/0x110'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492444] ' __kmalloc_cache_noprof+0x18c/0x408'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492448] ' binderfs_binder_device_create.isra.0+0x1c4/0xce0'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492452] ' binder_ctl_ioctl+0x36c/0x4f0'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492456] ' __arm64_sys_ioctl+0x174/0x1c8'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492459] ' invoke_syscall+0xec/0x2b0'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492461] ' el0_svc_common.constprop.0+0x1ec/0x280'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492464] ' do_el0_svc+0x50/0x90'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492466] ' el0_svc+0x58/0x150'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492469] ' el0t_64_sync_handler+0x134/0x160'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492473] ' el0t_64_sync+0x1b8/0x1c0'
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492475] ''
stress-ng: 19:36:34.39 error: [2957] klog-check: error: [113.492476] 'Freed by task 2961:'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492478] ' kasan_save_stack+0x40/0x80'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492481] ' kasan_save_track+0x24/0x58'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492484] ' kasan_save_free_info+0x50/0xb8'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492488] ' __kasan_slab_free+0x70/0xc0'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492492] ' kfree+0x144/0x478'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492494] ' binderfs_evict_inode+0x228/0x338'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492498] ' evict+0x2c4/0x6e0'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492500] ' iput+0x408/0x748'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492502] ' dentry_unlink_inode+0x268/0x520'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492505] ' __dentry_kill+0x17c/0x5c8'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492509] ' shrink_dentry_list+0x154/0x548'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492512] ' shrink_dcache_parent+0x16c/0x508'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492516] ' shrink_dcache_for_umount+0x9c/0x378'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492520] ' generic_shutdown_super+0x74/0x428'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492524] ' kill_litter_super+0x84/0xe8'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492528] ' binderfs_kill_super+0x48/0xc8'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492532] ' deactivate_locked_super+0xc0/0x200'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492536] ' deactivate_super+0x10c/0x160'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492540] ' cleanup_mnt+0x1ac/0x3a8'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492544] ' __cleanup_mnt+0x2c/0x58'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492547] ' task_work_run+0x14c/0x280'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492551] ' do_notify_resume+0x24c/0x2e0'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492554] ' el0_svc+0x13c/0x150'
stress-ng: 19:36:34.39 info:  [2957] klog-check: warning: [113.492558] ' el0t_64_sync_handler+0x134/0x160'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492561] ' el0t_64_sync+0x1b8/0x1c0'
stress-ng: 19:36:34.40 error: [2957] klog-check: error: [113.492564] ''
stress-ng: 19:36:34.40 error: [2957] klog-check: error: [113.492564] 'The buggy address belongs to the object at ffff0000e48c3c00\x0a which belongs to the cache kmalloc-rnd-14-512 of size 512'
stress-ng: 19:36:34.40 error: [2957] klog-check: error: [113.492567] 'The buggy address is located 8 bytes inside of\x0a freed 512-byte region [ffff0000e48c3c00, ffff0000e48c3e00)'
stress-ng: 19:36:34.40 error: [2957] klog-check: error: [113.492569] ''
stress-ng: 19:36:34.40 error: [2957] klog-check: error: [113.492570] 'The buggy address belongs to the physical page:'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492572] 'page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x1248c0'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492575] 'head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492577] 'flags: 0x17fffc000000040(head|node=0|zone=2|lastcpupid=0x1ffff)'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492580] 'page_type: f5(slab)'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492583] 'raw: 017fffc000000040 ffff0000c001d540 dead000000000122 0000000000000000'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492586] 'raw: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492588] 'head: 017fffc000000040 ffff0000c001d540 dead000000000122 0000000000000000'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492591] 'head: 0000000000000000 0000000000200020 00000000f5000000 0000000000000000'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492593] 'head: 017fffc000000003 fffffdffc3923001 00000000ffffffff 00000000ffffffff'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492596] 'head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008'
stress-ng: 19:36:34.40 info:  [2957] klog-check: warning: [113.492597] 'page dumped because: kasan: bad access detected'

To resolve this, add proper locking for binder_devices hlist.

Signed-off-by: Yeoreum Yun <yeoreun.yun@arm.com>
Reported-by: Yunseong Kim <ysk@kzalloc.com>
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 drivers/android/binder.c          | 8 ++++++++
 drivers/android/binder_internal.h | 8 +++++++-
 drivers/android/binderfs.c        | 2 +-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/android/binder.c b/drivers/android/binder.c
index 5fc2c8ee61b1..6bb06d231a78 100644
--- a/drivers/android/binder.c
+++ b/drivers/android/binder.c
@@ -79,6 +79,7 @@ static HLIST_HEAD(binder_deferred_list);
 static DEFINE_MUTEX(binder_deferred_lock);

 static HLIST_HEAD(binder_devices);
+static DEFINE_SPINLOCK(binder_devices_lock);
 static HLIST_HEAD(binder_procs);
 static DEFINE_MUTEX(binder_procs_lock);

@@ -6929,9 +6930,16 @@ const struct binder_debugfs_entry binder_debugfs_entries[] = {

 void binder_add_device(struct binder_device *device)
 {
+	guard(spinlock)(&binder_devices_lock);
 	hlist_add_head(&device->hlist, &binder_devices);
 }

+void binder_del_device(struct binder_device *device)
+{
+	guard(spinlock)(&binder_devices_lock);
+	hlist_del_init(&device->hlist);
+}
+
 static int __init init_binder_device(const char *name)
 {
 	int ret;
diff --git a/drivers/android/binder_internal.h b/drivers/android/binder_internal.h
index 6a66c9769c6c..424b2a6443e5 100644
--- a/drivers/android/binder_internal.h
+++ b/drivers/android/binder_internal.h
@@ -584,8 +584,14 @@ struct binder_object {
  * Add a binder device to binder_devices
  * @device: the new binder device to add to the global list
  *
- * Not reentrant as the list is not protected by any locks
  */
 void binder_add_device(struct binder_device *device);

+/**
+ * Del a binder device from binder_devices
+ * @device: the binder device to be removed from the global list
+ *
+ */
+void binder_del_device(struct binder_device *device);
+
 #endif /* _LINUX_BINDER_INTERNAL_H */
diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
index 94c6446604fc..a0779a8338d7 100644
--- a/drivers/android/binderfs.c
+++ b/drivers/android/binderfs.c
@@ -274,7 +274,7 @@ static void binderfs_evict_inode(struct inode *inode)
 	mutex_unlock(&binderfs_minors_mutex);

 	if (refcount_dec_and_test(&device->ref)) {
-		hlist_del_init(&device->hlist);
+		binder_del_device(device);
 		kfree(device->context.name);
 		kfree(device);
 	}
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

