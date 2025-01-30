Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08B7984D34
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 11:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738235475; cv=none; b=oxDS1MYQUPh01AN5ImOUx6awGByc3OUPLefVEvHuz1ReoymWxjLVcA+Ity6Wn2zwiDOLnKFyjj71sJWRQ4XYTX90CRBJ6BnA1ttzz9HtknGhCUaWagP678VYIIoO/qbk10b7L4NDv9bBrJA6eegJYWNA5KgYh0H2i8fzLZSNhjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738235475; c=relaxed/simple;
	bh=c+qSpFw+tiKqdZrlBRdeIVtBsth4VYWIeOmfIrJNfHU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fg64ZlZGQ4jyaMO+NzgGSu1RnjWvOLAerW4YsAdMFtsxSZHMHCZjRiA4ev7Tv5rKZ7tk3Xwkr4qIZzEXbsqBgCcuB6o8gR6sg6ThxjsGLushMZyvM8q+wcbrvttWafjI+KUGEY1datk6q/Oc1OSCcFdlFWONZv+F8N4SzgP2CsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Bxdz8m6B; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bxdz8m6B"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2166360285dso9969365ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 03:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738235473; x=1738840273; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=53/T5bAFGFqTW4BKQwy7L5Ysup918Ui5c6VNURPleaw=;
        b=Bxdz8m6BkWeiEbXhpvImG0y75Cy9hl8pukBuDCiqLaqu/MUaapZ5sHXSY1193m0nZz
         +b/yEDj0gIyvNBf3c4LWYW1s3ln6XPCHp6PShjjBLzIruMEc1wGWTedM/XQacMzvU4DY
         ohk1fe5bMRc8g9hXyji9fPjqKgtBiZqdJJGsQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738235473; x=1738840273;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=53/T5bAFGFqTW4BKQwy7L5Ysup918Ui5c6VNURPleaw=;
        b=K8AOhMb2h1s+ldhsj9mspvzaT87I4cdwgWSt/DbIK1kMKpd1N2LU0hZ/w+8X0XZ1hz
         gdI/fz1uGEW8c/Eeshx2rJ6DkKdaOdXhz9XtoZfzXYAhLAB+065r2Wh0g1/a7kbn+DY7
         4qxo623q/LYi2Yc9LkocleDwi9Pc9Hkqgc6V9ARKfE+szU+vY2nsR2X9wtfiUoS+5KLZ
         nimmGOugw9lHqfjK7bZjVi3bh4z/h2fduBR8pOieZej1YDRIaKssRAGKijRz5rHx2oLS
         /gSw7bFXtSvl/fFL1Mlg6lXJOrfI1RJtmJCRHh2hDZec6OB+PhxD9gbh/hekeLs9uGNv
         Y6EQ==
X-Forwarded-Encrypted: i=1; AJvYcCWnhgkNY7/ZRhQ/NUX6Nqxf4Qmp++QA4LsMgICknW/WEJ8nLDTLWgjX1HlL7CH49VfvNXlkT5zAUnxeyds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4MRXvvE9AqZZ66luBwWJ0ExqVNw36zvGoylw/DbWZJK4yTfvf
	reSMtWitwfNq+IJtndM5Cn3bnHkNGAtRtTBAWZpbeQYmBRcc+V3r/77UNwZG2w==
X-Gm-Gg: ASbGncsd4+sE6rzvE6IDwEs4qYiUBKTXVf4BnceiXECf0wbBBr+yUwnMoRqo4oT9mjx
	wSWM4GePt3Ql1sOi91LZGe/jwR9oIla9AOJf89L3UUs7t/l8JI5W7yRsTPUydvOUKllcwKHSAJ9
	Dph4YIDiwS9+t2G1I/rPG6UO9UdeiWhOXRQuprOHFqzdznYzfdaP6BA4A5nxGSytHCzNvfQWQM3
	yrVnqi2aHbFr25m3vmTLzmMo41SKQ6YsJJAhE+8J6AA6kg+q7YullT9YhYyFhCTdC0Nir1HcSM/
	3QskgMlgf8P4IqPF
X-Google-Smtp-Source: AGHT+IHL4Kna9jaxcRu05vdTceS9QAljYz/df3s5STVn/fe4k/r+WgjqGmkxVKfc8QjBK/njaagzow==
X-Received: by 2002:a05:6a00:a25:b0:727:99a8:cd31 with SMTP id d2e1a72fcca58-72fd0c148ffmr9136811b3a.14.1738235473252;
        Thu, 30 Jan 2025 03:11:13 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:d4ce:e744:f46b:4fb])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-72fe631bf9asm1165150b3a.27.2025.01.30.03.11.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Jan 2025 03:11:12 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv3 00/11] zram: preemptible writes and occasionally preemptible reads
Date: Thu, 30 Jan 2025 20:10:45 +0900
Message-ID: <20250130111105.2861324-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.262.g85cc9f2d1e-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is Part I which only changes zram.  In order to make reads()
preemptible we also need Part II [1] which changes zsmalloc.

There are more details in the commit messages, but in short:

Currently zram runs compression and decompression in non-preemptible
sections, e.g.

    zcomp_stream_get()     // grabs CPU local lock
    zcomp_compress()

or

    zram_slot_lock()       // grabs entry spin-lock
    zcomp_stream_get()     // grabs CPU local lock
    zs_map_object()        // grabs rwlock and CPU local lock
    zcomp_decompress()

Potentially a little troublesome for a number of reasons.

For instance, this makes it impossible to use async compression
algorithms or/and H/W compression algorithms, which can wait for OP
completion or resource availability.  This also restricts what
compression algorithms can do internally, for example, zstd can
allocate internal state memory for C/D dictionaries:

do_fsync()
 do_writepages()
  zram_bio_write()
   zram_write_page()                          // become non-preemptible
    zcomp_compress()
     zstd_compress()
      ZSTD_compress_usingCDict()
       ZSTD_compressBegin_usingCDict_internal()
        ZSTD_resetCCtx_usingCDict()
         ZSTD_resetCCtx_internal()
          zstd_custom_alloc()                 // memory allocation

Not to mention that the system can be configured to maximize
compression ratio at a cost of CPU/HW time (e.g. lz4hc or deflate
with very high compression level) so zram can stay in non-preemptible
section (even under spin-lock or/and rwlock) for an extended period
of time.  Aside from compression algorithms, this also restricts what
zram can do.  One particular example is zram_write_page() zsmalloc
handle allocation, which has an optimistic allocation (disallowing
direct reclaim) and a pessimistic fallback path, which then forces
zram to compress the page one more time.

This series changes zram to not directly impose atomicity restrictions
on compression algorithms (and on itself), which makes zram write()
fully preemptible; zram read(), sadly, is not always preemptible.  There
are still indirect atomicity restrictions imposed by zsmalloc().  Changing
zsmalloc to permit preemption under zs_map_object() is a separate effort
(Part II [1]) and will be posted shortly.

[1] https://lore.kernel.org/linux-mm/20250130044455.2642465-1-senozhatsky@chromium.org

v2 -> v3:
- Fixed a potential double stream-put during recompression (Dan Carpenter)
- Added a patch to filter out recompression slots by compression priority
- Tweaked cmpxchg loops (based on similar zsmalloc feedback from Uros
  Bizjak)
- Added some more sanity checks to recompression

Sergey Senozhatsky (11):
  zram: switch to non-atomic entry locking
  zram: do not use per-CPU compression streams
  zram: remove crypto include
  zram: remove max_comp_streams device attr
  zram: remove two-staged handle allocation
  zram: permit reclaim in zstd custom allocator
  zram: permit reclaim in recompression handle allocation
  zram: remove writestall zram_stats member
  zram: limit max recompress prio to num_active_comps
  zram: filter out recomp targets based on priority
  zram: unlock slot during recompression

 Documentation/ABI/testing/sysfs-block-zram  |   8 -
 Documentation/admin-guide/blockdev/zram.rst |  36 +-
 drivers/block/zram/backend_zstd.c           |  11 +-
 drivers/block/zram/zcomp.c                  | 165 +++++----
 drivers/block/zram/zcomp.h                  |  17 +-
 drivers/block/zram/zram_drv.c               | 353 ++++++++++----------
 drivers/block/zram/zram_drv.h               |   9 +-
 include/linux/cpuhotplug.h                  |   1 -
 8 files changed, 283 insertions(+), 317 deletions(-)

-- 
2.48.1.262.g85cc9f2d1e-goog

