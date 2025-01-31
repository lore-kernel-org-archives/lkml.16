Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0940816E863
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 09:07:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738314426; cv=none; b=hxJFOMDGIrFftFvOBvUxhhQXwIM8UraxJOokBzFNbcUT2CPW2L504MlzMK7v/JrMO3nPMJPWDPG8rssgat8UrgnV+VMRhAalILZBWDT8pMKnlr+FH1GAFZWqeiaAXb9IgSgxiOH9N9ehykuQLSapoyd/IfAIsBAc7reOKbyF5es=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738314426; c=relaxed/simple;
	bh=wgZADoVP4t7WTVIvwwkdknWc3HHRK+y06/eH1kG+eRU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rGjnsKrXHdnzOVq1GV+XzOI3pbzuSC8ZJOYhYaIoM699epnHnCS5mcE7zVShynUpQtWqXd8WSaMnHqio+yd5XbTQvAHlH1mVYJsfQszQqFtnS/62NHE8xMHlfdTzkpyTF5tirAGok8AiR1rD15YwO5ClwhxuULEtLq56D0RmuDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QzCvZDCF; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QzCvZDCF"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21680814d42so28479345ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 01:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1738314424; x=1738919224; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=F9JcGjIMFcg98+LHC87h8XWwbBL3uEEr95Wh1WByXFM=;
        b=QzCvZDCFNZ10Xmtgryx7qh5BKKzAmTSrVxFaswyrbRrlhQEv1aKY+rM3m+AHMY2Z9K
         LTctrV9QoRllM4ENVoGtKtetaa5nRywPn9KB6LVPhmqMRcku8QkmRkPtlhu8teRVidKK
         hpP3ZnPRWZvLgOAZbB93IjM67ScKRCyhYVARE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738314424; x=1738919224;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9JcGjIMFcg98+LHC87h8XWwbBL3uEEr95Wh1WByXFM=;
        b=fmhvBVaI0UydBpBKEo4QE4TPfzAaSCAqQ4Sk/LGu0S1bKyyf1UKacjCLM01GZmR/Dk
         qKlYVURm77v/nI0zyO5kuwXC+SZsIDp7MMaLdlocEDGBTDLsdJhGrz/EkvFGLogHpR8n
         HTaUWdxT/lA64Nspl1XPQrn6gezz85hUbMKTe9FzPcDXerFvIJRfzCAr24f7oJgtz0vf
         IH+DDXajuIeGNfIESEEFil+hKHawz7g11/sdMSyqMLzuSiO81AUz9V/lOvdY5hBlvMVh
         4EH+0TVZre6p6MxLkwild7kAIzC1Pi3LeA8/fnBAoqU7VuD712202xWXahDdd7DFIpdj
         fCBQ==
X-Forwarded-Encrypted: i=1; AJvYcCWpPcU5SbjDa74Th2yxqk0FSI67zTUXYrx27b6vWn17feF5vkScfmIpxjBUx+S+NzHPCp3EJ+jUdKHqfJE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/pvKCk32sYXftsiZcG2dBFiltuqZWGT9wqbb1R/pNvjVWDt9j
	36MjAKDAlKuZYtInGUoCBHRO6Le3dNYVLFeSFGPPvPZapASucrIuGM2fT3swpA==
X-Gm-Gg: ASbGncsGRtZV8rYsKkIx9orX2v+lTddTcjAwaWBpVChUv9y+KcklrLyJdRO/L+b84D0
	Qi4OTxfxOTDqtU2mGfnY/TG7393P06KBttLH9DgScwdcCBFDmZe1nctTskZY95oOsARwb9/oJS8
	4+Q0yJ9I4Q/mPXcFzG0JHCZaLYRmavr+q2qv4K4cWakZLqfGrGidV6c9I2AOxYuNU6R8kSrrt0Q
	fOZbq16Esq4eB8qNPLUPbBT+5Yr54YwKWU/RHRnIF7noZktDuq85n2sy+USzF4j7bGkKvYlokyd
	UwKLpBh1toKQUaxb3w==
X-Google-Smtp-Source: AGHT+IGwqFC/C39AdygqHo+Yli9e16nI+7gPzLB9FQLwrl60VgzRS9LksePf+6AJeFIYWHe5kq0OoQ==
X-Received: by 2002:a17:903:1205:b0:21a:8dec:e57a with SMTP id d9443c01a7336-21dd7dfad9dmr183337765ad.48.1738314424207;
        Fri, 31 Jan 2025 01:07:04 -0800 (PST)
Received: from localhost ([2401:fa00:8f:203:c752:be9d:3368:16fa])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-21de31f7554sm26143945ad.81.2025.01.31.01.07.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 01:07:03 -0800 (PST)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Minchan Kim <minchan@kernel.org>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv4 00/17] zsmalloc/zram: there be preemption
Date: Fri, 31 Jan 2025 18:05:59 +0900
Message-ID: <20250131090658.3386285-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Posting [1] and [2] combined into one series for the first time,
so don't get confused by v4.

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
fully preemptible; zram read(), sadly, is not always preemptible yet.
There are still indirect atomicity restrictions imposed by zsmalloc().
One notable example is object mapping API, which returns with:
a) local CPU lock held
b) zspage rwlock held

First, zsmalloc is converted to use sleepable RW-"lock" (it's atomic_t
in fact) for zspage migration protection.  Second, a new handle mapping
is introduced which doesn't use per-CPU buffers (and hence no local CPU
lock), does fewer memcpy() calls, but requires users to provide a
pointer to temp buffer for object copy-in (when needed).  Third, zram is
converted to the new zsmalloc mapping API and thus zram read() becomes
preemptible.

[1] https://lore.kernel.org/linux-mm/20250130111105.2861324-1-senozhatsky@chromium.org
[2] https://lore.kernel.org/linux-mm/20250130044455.2642465-1-senozhatsky@chromium.org

v4:
-- merged the series
-- renamed zs_pool migrate_lock (Yosry)
-- dropped zs_pool members re-shuffle patch (Yosry hated it with passion)
-- some minor cleanups

Sergey Senozhatsky (17):
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
  zsmalloc: factor out pool locking helpers
  zsmalloc: factor out size-class locking helpers
  zsmalloc: make zspage lock preemptible
  zsmalloc: introduce new object mapping API
  zram: switch to new zsmalloc object mapping API
  zram: add might_sleep to zcomp API

 Documentation/ABI/testing/sysfs-block-zram  |   8 -
 Documentation/admin-guide/blockdev/zram.rst |  36 +-
 drivers/block/zram/backend_zstd.c           |  11 +-
 drivers/block/zram/zcomp.c                  | 169 +++++----
 drivers/block/zram/zcomp.h                  |  19 +-
 drivers/block/zram/zram_drv.c               | 357 +++++++++----------
 drivers/block/zram/zram_drv.h               |   8 +-
 include/linux/cpuhotplug.h                  |   1 -
 include/linux/zsmalloc.h                    |   8 +
 mm/zsmalloc.c                               | 372 +++++++++++++++-----
 10 files changed, 577 insertions(+), 412 deletions(-)

-- 
2.48.1.362.g079036d154-goog

