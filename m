Received: from mail3-163.sinamail.sina.com.cn (mail3-163.sinamail.sina.com.cn [202.108.3.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B70248F6F
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:24:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750764297; cv=none; b=QSB2UnPPgnCVCNd0lFNyKxwthbjdzFpHzr3L2kBY3f7gug92vI2XmY/OdUxxv3DcuX9sW8QnqC0wTrnH8BhP6JHNzo3hPWJvKiPjYmY02wq0T5gDnJNnmZato7LXssBwRs9JwpVWBMwCmFrbkNyxM2vQZs2AcSIPFPCjUJHoNAk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750764297; c=relaxed/simple;
	bh=Wk30HvSyuBuH07cU1AEBaxviuckmsr3nXlqhkCtrqA0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pwbCz6qv2yoo7Jp9caupOgcJpvXnbztCZE6a6m64phu7o5Cozekp5WYlo+uj6HjpAy+oE8hOauoFeWVYQ8/Ixl6IUrh9U2/NYlV04j8UF/7ilGFl54mW1pKCMHd6sq+KQ72Xl+TtYBpOeNk98DCyA8GNmci8XV80yTSVxz7X4FE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; arc=none smtp.client-ip=202.108.3.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
X-SMAIL-HELO: localhost.localdomain
Received: from unknown (HELO localhost.localdomain)([114.249.58.236])
	by sina.com (10.54.253.34) with ESMTP
	id 685A8AFF000051A4; Tue, 24 Jun 2025 19:24:48 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=hdanton@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=hdanton@sina.com
X-SMAIL-MID: 9353596291981
X-SMAIL-UIID: B7DDC452610D47DA8D2C714FBBE6E26E-20250624-192448-1
From: Hillf Danton <hdanton@sina.com>
To: linux-kernel@vger.kernel.org
Cc: Hillf Danton <hdanton@sina.com>
Subject: some works in 2025
Date: Tue, 24 Jun 2025 19:24:29 +0800
Message-ID: <20250624112437.1639-1-hdanton@sina.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


001 Subject: Re: [syzbot] [fs?] KASAN: slab-out-of-bounds Write in __put_unused_fd
https://lore.kernel.org/lkml/6774a257.050a0220.25abdd.097a.GAE@google.com/
002 Subject: Re: [syzbot] [mm?] [xfs?] KASAN: slab-use-after-free Read in filemap_map_pages
https://lore.kernel.org/lkml/6774eca1.050a0220.25abdd.09b2.GAE@google.com/
003 Subject: Re: [syzbot] [mptcp?] general protection fault in proc_scheduler
https://lore.kernel.org/lkml/6777c153.050a0220.178762.0041.GAE@google.com/
004 Subject: Re: [syzbot] [pm?] possible deadlock in rpm_suspend
https://lore.kernel.org/lkml/6777c641.050a0220.178762.0042.GAE@google.com/
005 Subject: Re: [syzbot] [input?] KASAN: null-ptr-deref Read in input_event
https://lore.kernel.org/lkml/677bd71a.050a0220.3b3668.000b.GAE@google.com/
006 Subject: Re: [syzbot] [net?] INFO: task hung in lock_sock_nested (5)
https://lore.kernel.org/lkml/677e6b19.050a0220.3b3668.02e6.GAE@google.com/
007 Subject: Re: [syzbot] [media?] KASAN: slab-use-after-free Read in dvb_device_open
https://lore.kernel.org/lkml/678c6605.050a0220.303755.0040.GAE@google.com/
008 Subject: Re: [syzbot] [wireless?] possible deadlock in ieee80211_remove_interfaces
https://lore.kernel.org/lkml/678ca8cf.050a0220.303755.004f.GAE@google.com/
009 Subject: Re: [syzbot] [net?] general protection fault in add_wait_queue
https://lore.kernel.org/lkml/67a1a9d7.050a0220.163cdc.0060.GAE@google.com/
010 Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in corsair_void_status_work_handler
https://lore.kernel.org/lkml/67a16f3d.050a0220.163cdc.005d.GAE@google.com/

011 Subject: Re: [syzbot] [kernfs?] possible deadlock in walk_component (4)
https://lore.kernel.org/lkml/67a08649.050a0220.d7c5a.0086.GAE@google.com/
012 Subject: Re: [syzbot] [net?] general protection fault in generic_hwtstamp_ioctl_lower (2)
https://lore.kernel.org/lkml/67a347fa.050a0220.50516.0032.GAE@google.com/
013 Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in skb_queue_purge_reason (2)
https://lore.kernel.org/lkml/67a34bf9.050a0220.50516.003f.GAE@google.com/
014 Subject: Re: [syzbot] [bluetooth?] general protection fault in __timer_delete_sync
https://lore.kernel.org/lkml/67a74eff.050a0220.3d72c.0026.GAE@google.com/
015 Subject: Re: [syzbot] [hams?] possible deadlock in nr_remove_neigh (2)
https://lore.kernel.org/lkml/67a7fbf5.050a0220.110943.0014.GAE@google.com/
016 Subject: Re: [syzbot] [bluetooth?] general protection fault in h5_recv
https://lore.kernel.org/lkml/67a9e73a.050a0220.3d72c.0051.GAE@google.com/
017 Subject: Re: [syzbot] [netfs?] WARNING: refcount bug in netfs_put_subrequest
https://lore.kernel.org/lkml/67afd723.050a0220.21dd3.005b.GAE@google.com/
018 Subject: Re: [syzbot] [netfs?] KASAN: slab-use-after-free Write in io_submit_one
https://lore.kernel.org/lkml/67b04bd9.050a0220.47157.0001.GAE@google.com/
019 Subject: Re: [syzbot] [block?] BUG: corrupted list in loop_process_work
https://lore.kernel.org/lkml/67b146a3.050a0220.173698.0003.GAE@google.com/
020 Subject: Re: [syzbot] [net?] WARNING in cleanup_net (4)
https://lore.kernel.org/lkml/67b87512.050a0220.14d86d.047d.GAE@google.com/

021 Subject: Re: [syzbot] [netfs?] kernel BUG in folio_unlock (3)
https://lore.kernel.org/lkml/67b9130b.050a0220.14d86d.0599.GAE@google.com/
022 Subject: Re: [syzbot] [input?] [usb?] KASAN: slab-use-after-free Read in steam_input_open
https://lore.kernel.org/lkml/67bc5c35.050a0220.bbfd1.0082.GAE@google.com/
023 Subject: Re: mm: zswap: fix crypto_free_acomp deadlock in zswap_cpu_comp_dead
https://lore.kernel.org/lkml/20250225104923.2802-1-hdanton@sina.com/
024 Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in task_work_run
https://lore.kernel.org/lkml/67c25547.050a0220.dc10f.0155.GAE@google.com/
025 Subject: Re: [syzbot] [block?] possible deadlock in loop_set_status
https://lore.kernel.org/lkml/67c31666.050a0220.dc10f.0168.GAE@google.com/
026 Subject: Re: [syzbot] [netfilter?] KASAN: slab-use-after-free Read in nf_tables_trans_destroy_work (2)
https://lore.kernel.org/lkml/67c5976c.050a0220.1dee4d.0131.GAE@google.com/
027 Subject: Re: [syzbot] [efi?] [fs?] possible deadlock in efivarfs_actor
https://lore.kernel.org/lkml/67cd6486.050a0220.24a339.00c8.GAE@google.com/
028 Subject: Re: [syzbot] [media?] [usb?] KASAN: slab-use-after-free Read in load_firmware_cb (2)
https://lore.kernel.org/lkml/67ef6717.050a0220.9040b.031f.GAE@google.com/
029 Subject: Re: [syzbot] [acpi?] KASAN: slab-use-after-free Read in software_node_notify_remove
https://lore.kernel.org/lkml/67fe4466.050a0220.6a185.01d7.GAE@google.com/
030 Subject: Re: [syzbot] [sound?] [usb?] WARNING: ODEBUG bug in snd_rawmidi_free
https://lore.kernel.org/lkml/681e017b.050a0220.a19a9.0132.GAE@google.com/

031 Subject: Re: [syzbot] [fs?] [efi?] BUG: unable to handle kernel paging request in alloc_fs_context
https://lore.kernel.org/lkml/6823ee1f.a00a0220.104b28.0005.GAE@google.com/
032 Subject: Re: [syzbot] [nbd?] KASAN: slab-use-after-free Write in recv_work (2)
https://lore.kernel.org/lkml/6823b478.a00a0220.104b28.0001.GAE@google.com/
033 Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in mgmt_remove_adv_monitor_complete (3)
https://lore.kernel.org/lkml/682990b3.a00a0220.398d88.02fa.GAE@google.com/
034 Subject: Re: [syzbot] [bluetooth?] WARNING in hci_recv_frame
https://lore.kernel.org/lkml/682c63c0.a00a0220.29bc26.027b.GAE@google.com/
035 Subject: Re: [syzbot] [fs?] possible deadlock in input_inject_event
https://lore.kernel.org/lkml/68327133.a70a0220.253bc2.007d.GAE@google.com/
036 Subject: Re: [syzbot] [bluetooth?] KASAN: slab-use-after-free Read in hci_sock_get_channel
https://lore.kernel.org/lkml/6834525e.a70a0220.29d4a0.0804.GAE@google.com/
037 Subject: Re: [syzbot] [bcachefs?] possible deadlock in start_poll_synchronize_rcu_expedited
https://lore.kernel.org/lkml/683bb3e7.a00a0220.d8eae.0023.GAE@google.com/
038 Subject: Re: [syzbot] [usb?] [input?] WARNING in cm109_input_open/usb_submit_urb (3)
https://lore.kernel.org/lkml/683bdb0c.a70a0220.1a6ae.0010.GAE@google.com/
039 Subject: Re: [syzbot] [kernel?] KASAN: slab-out-of-bounds Read in __futex_pivot_hash
https://lore.kernel.org/lkml/683d2f5c.a00a0220.d8eae.0042.GAE@google.com/
040 Subject: Re: [syzbot] [trace?] BUG: corrupted list in ring_buffer_subbuf_order_set
https://lore.kernel.org/lkml/6842e383.a00a0220.29ac89.0040.GAE@google.com/

041 Subject: Re: [syzbot] [mm?] WARNING in vma_modify
https://lore.kernel.org/lkml/6843781b.a00a0220.29ac89.004d.GAE@google.com/
042 Subject: Re: [syzbot] [wireless?] general protection fault in carl9170_usb_rx_complete
https://lore.kernel.org/lkml/6843b762.050a0220.d8705.000a.GAE@google.com/
043 Subject: Re: [syzbot] [afs?] INFO: task hung in afs_cell_purge (2)
https://lore.kernel.org/lkml/684529ee.a70a0220.27c366.004b.GAE@google.com/
044 Subject: Re: [syzbot] [bcachefs?] [rcu?] BUG: unable to handle kernel NULL pointer dereference in rcu_core (3)
https://lore.kernel.org/lkml/6846789f.050a0220.33aa0e.02ab.GAE@google.com/
045 Subject: Re: [syzbot] [hams?] possible deadlock in nr_rt_device_down (3)
https://lore.kernel.org/lkml/68482e6e.a70a0220.27c366.0064.GAE@google.com/
046 Subject: Re: [syzbot] [net?] KASAN: use-after-free Read in __linkwatch_run_queue
https://lore.kernel.org/lkml/68485556.050a0220.daf97.0b06.GAE@google.com/
047 Subject: Re: [syzbot] [mm?] KASAN: slab-use-after-free Read in do_sync_mmap_readahead
https://lore.kernel.org/lkml/68555d6e.a00a0220.137b3.004c.GAE@google.com/
048 Subject: Re: [syzbot] [kernel?] KMSAN: kernel-infoleak in vmci_host_unlocked_ioctl (3)
https://lore.kernel.org/lkml/6857b173.a70a0220.62859.0003.GAE@google.com/
049 Subject: Re: [syzbot] [fs?] general protection fault in pidfs_free_pid
https://lore.kernel.org/lkml/685a0c07.a00a0220.2e5631.0048.GAE@google.com/
050 Subject: Re: [syzbot] [trace?] KASAN: slab-use-after-free Read in __free_filter
https://lore.kernel.org/lkml/685a6606.a00a0220.2e5631.0064.GAE@google.com/

