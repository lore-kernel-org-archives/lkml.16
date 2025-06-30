Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E003618C011
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 02:00:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751248808; cv=none; b=VA/9UWnSyaqG7Si05S0hPfncUc+ApT57E/YpdqxR+EazVmUFFmdcJvQ+FBmZoP0neamPPDmnkF+LsxDnHW73nobxeYI/h6W2wK0VafL7L09i/dF09ugAZXw3lI7xozXYNHnyDPBuGZlnCk/U5ILilb1Oueh+geNJXUIZojm98lw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751248808; c=relaxed/simple;
	bh=UNHE+6OmTUAdY1GAYnIm/XNBA/bkwsSKiT4aVe8Y0iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KUmMqCUns2hn0CihZ/ccPv37YEM0mHFPRDjl4QpifOeTES33MD0Zf1QYytPjRxGVejjLY3nE2TJ4Hk+XUymQEnOEvcVHzXhMB0ekdl1D6RxpxAQ3BayNBsQPA2xdMRwJXBQ6HokODRt6/35F6/OWJZh1M8Req9+pvr+l200INYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hMnmKKzE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hMnmKKzE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751248804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7qx5v0KdW7INh0Q41668KL1wEYoR/92sOlCIFjPaGro=;
	b=hMnmKKzEfg4HcVX+MfzpDhaUDrGnwgRNe1KRpZxu6ImVQK+ZJTD53RVDroHfKEVMvC89kO
	jEffYyxefAa4zh/s6APHkd+kxAPwb+awTTsZrB2ti3a9PQS+swS7dc9YiatbhSb8wKiIaE
	t7aF8q1G+U4aXkzcKpgLu882aYXPZWA=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-LNeLK6ScPim0HyjIZN3Dhw-1; Sun, 29 Jun 2025 22:00:03 -0400
X-MC-Unique: LNeLK6ScPim0HyjIZN3Dhw-1
X-Mimecast-MFC-AGG-ID: LNeLK6ScPim0HyjIZN3Dhw_1751248802
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-236725af87fso46547785ad.3
        for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 19:00:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751248802; x=1751853602;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7qx5v0KdW7INh0Q41668KL1wEYoR/92sOlCIFjPaGro=;
        b=povEuqOB4577G/iOAKWGIbc0reYaw89UNxKzqdDC0ZZSdIi1gbYnfVycYeNBkkRfWZ
         FbkNxUTRvJtawvADEzkz+yFGmbtXczTQmhxM6wniJQbOheA3BplHXKi6CAlupD2hkeCj
         ouLySvvUIuCBYcfNjmMcukUfWgt5VP3V906K5Q6XtMuPpwmoR4ldNzRhGdzKaCnPdFzs
         tMjvFIo+jGJBegCvp5phQJC5957K7KWA/6NmGlguZhXW8pNVtUUH3HvCZsFq49kcl/UF
         zGhJxNNIZM2gk6kn3a3vXcnk4EzXfyTWJk0AcYkkrmwhW3IUrjx4WK5JQcyhbwSL/W9R
         YmVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVIZq3x94r8UVWEwGoWsQIt6MLV3f16eQE/Fy3/7CqRomZJd36m9aNux1yvsUoh5bZWyAVlUBB6V3R6wNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK8SPccybY1Gr+TQ+vHLfFE0BU4rXBfTi+04G7NxckAxJddr5Z
	plReLvcscK3jM4WHMyNmIqlk9i/35OTCZSC0NKBpjzX6PwKhDrS8rKxNoo5pYlttDypunDXgt9L
	rcP9nHlUHAcCMdysGAy+rxVR0g3lrIpIJRrSMmvZt5CtkZrAvTFhsGttInGAW4JTnaQ==
X-Gm-Gg: ASbGncu4les8x4QiBR+l6TV1lt+5zXxssV2onyYNyZG0NA89hph6iRqx2VmS77iYdqk
	A9dD7udA/pHHCfCEXOJ7xkn7TQz7ZsVC1KnaFrD0hvGfdMIxP8SFf5X965N9Ub615pjOKmvfFjn
	cKFGrAZHqZwIYBw2P57au62BAzjfkTFsdWItWVfor1VQVhIXuvqXl5ui7e0APxIyxuu5GUXvWny
	53vZvWCmOG4IWLfpGBBgSxi0DqkOFjEFUNlI60s88H2AGmlxt5/U1uJodfHBqLgEuxn2vzrkAt3
	fxFS6YhM0lnsCUYJLrALXBIYbrISag==
X-Received: by 2002:a17:902:e746:b0:234:d292:be7a with SMTP id d9443c01a7336-23ac3bffdbdmr173363065ad.1.1751248802033;
        Sun, 29 Jun 2025 19:00:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHVZrn7fj6vlaQGWQVjXpJslGdR1oXvka4Z0dq0YNVxgM6nQviBBBE+oFzuva0u5BXG1Z6PqA==
X-Received: by 2002:a17:902:e746:b0:234:d292:be7a with SMTP id d9443c01a7336-23ac3bffdbdmr173362695ad.1.1751248801520;
        Sun, 29 Jun 2025 19:00:01 -0700 (PDT)
Received: from [10.72.120.15] ([209.132.188.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39f4c0sm67788415ad.103.2025.06.29.18.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 29 Jun 2025 19:00:00 -0700 (PDT)
Message-ID: <808d3fb3-92a9-4a25-a70c-7408f20fb554@redhat.com>
Date: Mon, 30 Jun 2025 09:59:54 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/23] md/llbitmap: md/md-llbitmap: introduce a new
 lockless bitmap
To: Yu Kuai <yukuai1@huaweicloud.com>, hch@lst.de, colyli@kernel.org,
 song@kernel.org, yukuai3@huawei.com
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-raid@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com,
 johnny.chenyi@huawei.com
References: <20250524061320.370630-1-yukuai1@huaweicloud.com>
From: Xiao Ni <xni@redhat.com>
In-Reply-To: <20250524061320.370630-1-yukuai1@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


在 2025/5/24 下午2:12, Yu Kuai 写道:
> From: Yu Kuai <yukuai3@huawei.com>
>
> This is the formal version after previous RFC version:
>
> https://lore.kernel.org/all/20250512011927.2809400-1-yukuai1@huaweicloud.com/
>
> #### Background
>
> Redundant data is used to enhance data fault tolerance, and the storage
> method for redundant data vary depending on the RAID levels. And it's
> important to maintain the consistency of redundant data.
>
> Bitmap is used to record which data blocks have been synchronized and which
> ones need to be resynchronized or recovered. Each bit in the bitmap
> represents a segment of data in the array. When a bit is set, it indicates
> that the multiple redundant copies of that data segment may not be
> consistent. Data synchronization can be performed based on the bitmap after
> power failure or readding a disk. If there is no bitmap, a full disk
> synchronization is required.


Hi Kuai

>
> #### Key Features
>
>   - IO fastpath is lockless, if user issues lots of write IO to the same
>   bitmap bit in a short time, only the first write have additional overhead
>   to update bitmap bit, no additional overhead for the following writes;

After reading other patches, I want to check if I understand right.

The first write sets the bitmap bit. The second write which hits the 
same block (one sector, 512 bits) will call llbitmap_infect_dirty_bits 
to set all other bits. Then the third write doesn't need to set bitmap 
bits. If I'm right, the comments above should say only the first two 
writes have additional overhead?


>   - support only resync or recover written data, means in the case creating
>   new array or replacing with a new disk, there is no need to do a full disk
>   resync/recovery;
>
> #### Key Concept
>
> ##### State Machine
>
> Each bit is one byte, contain 6 difference state, see llbitmap_state. And
> there are total 8 differenct actions, see llbitmap_action, can change state:
>
> llbitmap state machine: transitions between states
>
> |           | Startwrite | Startsync | Endsync | Abortsync|
> | --------- | ---------- | --------- | ------- | -------  |
> | Unwritten | Dirty      | x         | x       | x        |
> | Clean     | Dirty      | x         | x       | x        |
> | Dirty     | x          | x         | x       | x        |
> | NeedSync  | x          | Syncing   | x       | x        |
> | Syncing   | x          | Syncing   | Dirty   | NeedSync |
>
> |           | Reload   | Daemon | Discard   | Stale     |
> | --------- | -------- | ------ | --------- | --------- |
> | Unwritten | x        | x      | x         | x         |
> | Clean     | x        | x      | Unwritten | NeedSync  |
> | Dirty     | NeedSync | Clean  | Unwritten | NeedSync  |
> | NeedSync  | x        | x      | Unwritten | x         |
> | Syncing   | NeedSync | x      | Unwritten | NeedSync  |


For Reload action, if the bitmap bit is NeedSync, the changed status 
will be x. It can't trigger resync/recovery.

For example:

cat /sys/block/md127/md/llbitmap/bits
unwritten 3480
clean 2
dirty 0
need sync 510

It doesn't do resync after aseembling the array. Does it need to modify 
the changed status from x to NeedSync?


Best Regards

Xiao

>
> Typical scenarios:
>
> 1) Create new array
> All bits will be set to Unwritten by default, if --assume-clean is set,
> all bits will be set to Clean instead.
>
> 2) write data, raid1/raid10 have full copy of data, while raid456 doesn't and
> rely on xor data
>
> 2.1) write new data to raid1/raid10:
> Unwritten --StartWrite--> Dirty
>
> 2.2) write new data to raid456:
> Unwritten --StartWrite--> NeedSync
>
> Because the initial recover for raid456 is skipped, the xor data is not build
> yet, the bit must set to NeedSync first and after lazy initial recover is
> finished, the bit will finially set to Dirty(see 5.1 and 5.4);
>
> 2.3) cover write
> Clean --StartWrite--> Dirty
>
> 3) daemon, if the array is not degraded:
> Dirty --Daemon--> Clean
>
> For degraded array, the Dirty bit will never be cleared, prevent full disk
> recovery while readding a removed disk.
>
> 4) discard
> {Clean, Dirty, NeedSync, Syncing} --Discard--> Unwritten
>
> 5) resync and recover
>
> 5.1) common process
> NeedSync --Startsync--> Syncing --Endsync--> Dirty --Daemon--> Clean
>
> 5.2) resync after power failure
> Dirty --Reload--> NeedSync
>
> 5.3) recover while replacing with a new disk
> By default, the old bitmap framework will recover all data, and llbitmap
> implement this by a new helper, see llbitmap_skip_sync_blocks:
>
> skip recover for bits other than dirty or clean;
>
> 5.4) lazy initial recover for raid5:
> By default, the old bitmap framework will only allow new recover when there
> are spares(new disk), a new recovery flag MD_RECOVERY_LAZY_RECOVER is add
> to perform raid456 lazy recover for set bits(from 2.2).
>
> ##### Bitmap IO
>
> ##### Chunksize
>
> The default bitmap size is 128k, incluing 1k bitmap super block, and
> the default size of segment of data in the array each bit(chunksize) is 64k,
> and chunksize will adjust to twice the old size each time if the total number
> bits is not less than 127k.(see llbitmap_init)
>
> ##### READ
>
> While creating bitmap, all pages will be allocated and read for llbitmap,
> there won't be read afterwards
>
> ##### WRITE
>
> WRITE IO is divided into logical_block_size of the array, the dirty state
> of each block is tracked independently, for example:
>
> each page is 4k, contain 8 blocks; each block is 512 bytes contain 512 bit;
>
> | page0 | page1 | ... | page 31 |
> |       |
> |        \-----------------------\
> |                                |
> | block0 | block1 | ... | block 8|
> |        |
> |         \-----------------\
> |                            |
> | bit0 | bit1 | ... | bit511 |
>
>  From IO path, if one bit is changed to Dirty or NeedSync, the corresponding
> subpage will be marked dirty, such block must write first before the IO is
> issued. This behaviour will affect IO performance, to reduce the impact, if
> multiple bits are changed in the same block in a short time, all bits in this
> block will be changed to Dirty/NeedSync, so that there won't be any overhead
> until daemon clears dirty bits.
>
> ##### Dirty Bits syncronization
>
> IO fast path will set bits to dirty, and those dirty bits will be cleared
> by daemon after IO is done. llbitmap_page_ctl is used to synchronize between
> IO path and daemon;
>
> IO path:
>   1) try to grab a reference, if succeed, set expire time after 5s and return;
>   2) if failed to grab a reference, wait for daemon to finish clearing dirty
>   bits;
>
> Daemon(Daemon will be waken up every daemon_sleep seconds):
> For each page:
>   1) check if page expired, if not skip this page; for expired page:
>   2) suspend the page and wait for inflight write IO to be done;
>   3) change dirty page to clean;
>   4) resume the page;
>
> Performance Test:
> Simple fio randwrite test to build array with 20GB ramdisk in my VM:
>
> |                      | none      | bitmap    | llbitmap  |
> | -------------------- | --------- | --------- | --------- |
> | raid1                | 13.7MiB/s | 9696KiB/s | 19.5MiB/s |
> | raid1(assume clean)  | 19.5MiB/s | 11.9MiB/s | 19.5MiB/s |
> | raid10               | 21.9MiB/s | 11.6MiB/s | 27.8MiB/s |
> | raid10(assume clean) | 27.8MiB/s | 15.4MiB/s | 27.8MiB/s |
> | raid5                | 14.0MiB/s | 11.6MiB/s | 12.9MiB/s |
> | raid5(assume clean)  | 17.8MiB/s | 13.4MiB/s | 13.9MiB/s |
>
> For raid1/raid10 llbitmap can be better than none bitmap with background
> initial resync, and it's the same as none bitmap without it.
>
> Noted that llbitmap performance improvement for raid5 is not obvious,
> this is due to raid5 has many other performance bottleneck, perf
> results still shows that bitmap overhead will be much less.
>
> following branch for review or test:
> https://git.kernel.org/pub/scm/linux/kernel/git/yukuai/linux.git/log/?h=yukuai/md-llbitmap
>
> Yu Kuai (23):
>    md: add a new parameter 'offset' to md_super_write()
>    md: factor out a helper raid_is_456()
>    md/md-bitmap: cleanup bitmap_ops->startwrite()
>    md/md-bitmap: support discard for bitmap ops
>    md/md-bitmap: remove parameter slot from bitmap_create()
>    md/md-bitmap: add a new sysfs api bitmap_type
>    md/md-bitmap: delay registration of bitmap_ops until creating bitmap
>    md/md-bitmap: add a new method skip_sync_blocks() in bitmap_operations
>    md/md-bitmap: add a new method blocks_synced() in bitmap_operations
>    md: add a new recovery_flag MD_RECOVERY_LAZY_RECOVER
>    md/md-bitmap: make method bitmap_ops->daemon_work optional
>    md/md-bitmap: add macros for lockless bitmap
>    md/md-bitmap: fix dm-raid max_write_behind setting
>    md/dm-raid: remove max_write_behind setting limit
>    md/md-llbitmap: implement llbitmap IO
>    md/md-llbitmap: implement bit state machine
>    md/md-llbitmap: implement APIs for page level dirty bits
>      synchronization
>    md/md-llbitmap: implement APIs to mange bitmap lifetime
>    md/md-llbitmap: implement APIs to dirty bits and clear bits
>    md/md-llbitmap: implement APIs for sync_thread
>    md/md-llbitmap: implement all bitmap operations
>    md/md-llbitmap: implement sysfs APIs
>    md/md-llbitmap: add Kconfig
>
>   Documentation/admin-guide/md.rst |   80 +-
>   drivers/md/Kconfig               |   11 +
>   drivers/md/Makefile              |    2 +-
>   drivers/md/dm-raid.c             |    6 +-
>   drivers/md/md-bitmap.c           |   50 +-
>   drivers/md/md-bitmap.h           |   55 +-
>   drivers/md/md-llbitmap.c         | 1556 ++++++++++++++++++++++++++++++
>   drivers/md/md.c                  |  247 +++--
>   drivers/md/md.h                  |   20 +-
>   drivers/md/raid5.c               |    6 +
>   10 files changed, 1901 insertions(+), 132 deletions(-)
>   create mode 100644 drivers/md/md-llbitmap.c
>

