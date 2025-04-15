Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E41CF2DFA26
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 02:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744685160; cv=none; b=NK8l6lzI9BgkfuEerk/GAqmwgiW7MZqnnKyA/x4w1pJWPRCp7tQBA7hTjB/WT9mO2Ba4hlDDnGye/wVG6NmJhxCfCrjKtEwCJ8j6Jj04bBTB4HPAiPl8hq5b8Bfo/l9L1CyF0cGRryNEMAOKHeaUilBL/krla+FRc5tnvjx70tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744685160; c=relaxed/simple;
	bh=JBWagI/b04ghXu58sKhKZXloEglf9TTNfTAKDNcOL2A=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=h1LruKfyk0fx2+Zka7TYP3oAVmssGLQGQ81139zhOlo7NbDUL8wA9NYY4IpuhP07LFPKchzesj2e8lwKWIKfjrb5I8USP7UUmYYm7Ohxi8Gb7w3UmAZAbXzmwht6beFlG6o+ztDx7Xw0lpuoJS3k+Y8eUKkNk4Dxu0Z+yi3oXpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=FDPWFLSW; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="FDPWFLSW"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2295d78b433so52209745ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 19:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1744685156; x=1745289956; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Vmef3ZlMZg7TO+ldIj898v58g7NCeQi8xtcn9yDmmsc=;
        b=FDPWFLSWG2HTak8aPJfuex5yNeLuP6Q14D8XTfX4i7z1hOHMVzAD7nhkSM4fF2y1OM
         r7RdADH6TSdWksWvd+mYraOITKaeJZ9MzLzOAlX80CcP1TjhAvzkGh5z7rmnSKfKQV08
         psTeoM1mJT7/WiTeLCGI+Enf05oVaFH0B+6EnkU7IF2QJourLzTavOv2pwTqH1S1bnde
         IHP4cl45og3C91q8/copPBZds6mmaHbsrNJJgfTmF+K7uMBPR9C02Q/c49v+SP/h2wMY
         puzXF9Mlcmr0MbWYa4noCWUMetsj6LFp2AmqoPGgwyBRn1jGD4Jikq6yAOY+lbL062+z
         4uxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744685156; x=1745289956;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vmef3ZlMZg7TO+ldIj898v58g7NCeQi8xtcn9yDmmsc=;
        b=SSPpyVDgXUaEdez+3GJVfB4r6mFZBHjMQNhkkQzoe8aXNqHdkAs/1GC+sQH5ZzWJ4b
         xzuYZuxm3eRztgCmMpJQcj+Wwa4bg7mmyafh39LPfaZiVHN5g4jKDDVEWrmhjk3e6H2y
         eTgmParqK/vt8mzJAoJWqq9Xlj5uh08MmIOWvBB8hgljwneGCAeaOhWYKtVtofanXvqu
         ZFlhAsSpCAwWeOqKR6rcae2tG/WhJUMPNVFKqALvzsURy1ooEDOqzxDsIayc6V+Qg0He
         7U6TIQsn3CmXk/NG6OPNYuwI1CxEIEZO7sme+6KL82rVIdmS7lmV9xuU9am8pyaVSe3o
         lRAg==
X-Gm-Message-State: AOJu0Yy2UkdOZz1rIhYUlYZeNfWkRKQL8u4hMPcreaR1rZEEwDW5/a4R
	vOhGjPvSNGYnCWRV9mndiQtLVIK+gpquLDAGN3lwI3sZYzYJaDsouDWhTX+A5nQ=
X-Gm-Gg: ASbGnct1yK0TK1cF2MQZPvqV3w0gYzcRe2hJggOQanvBwLsZBDxn3RaCzaBSqVfBy1Q
	PZC2GqGPVuzA2ZIq/LFVuy+QRaTdALh+9plLXKZKSWQOTI9a/eJ/c3fTMAEWC1prUbOjh+BuR7m
	5WhMu3cPEUUk3lljeOKmHMqNMGR9ru4ukSPkkVjExirLOhK50zIEL6o+0BBQK+EdryMhDgD6l+K
	q8fXgW5yHAjRcMPr6lkHJB1/9xAMgeQyx6Zw+WLUqkcPCC1ivZzIwi29Zlt1pegbL60HoS7t7n6
	JrRf9VDS71zOmWYZjuO8q1lZSrXCC7bDHQqOl/efohFPsu3tpUEVwX0CXhAbjVC9VqeCt0mu
X-Google-Smtp-Source: AGHT+IE0pZ/5yl+DX5hKsSJ8q3otL9DZ3TTCxY1dn2jd+uRX0/xON+LgsEquVuUnMUfbbGTr0hzbkg==
X-Received: by 2002:a17:902:d48d:b0:21f:6546:9af0 with SMTP id d9443c01a7336-22bea502685mr170782125ad.44.1744685155939;
        Mon, 14 Apr 2025 19:45:55 -0700 (PDT)
Received: from PXLDJ45XCM.bytedance.net ([61.213.176.5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccac49sm106681185ad.217.2025.04.14.19.45.49
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 14 Apr 2025 19:45:53 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: hannes@cmpxchg.org,
	mhocko@kernel.org,
	roman.gushchin@linux.dev,
	shakeel.butt@linux.dev,
	muchun.song@linux.dev,
	akpm@linux-foundation.org,
	david@fromorbit.com,
	zhengqi.arch@bytedance.com,
	yosry.ahmed@linux.dev,
	nphamcs@gmail.com,
	chengming.zhou@linux.dev
Cc: linux-kernel@vger.kernel.org,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	hamzamahfooz@linux.microsoft.com,
	apais@linux.microsoft.com,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH RFC 00/28] Eliminate Dying Memory Cgroup
Date: Tue, 15 Apr 2025 10:45:04 +0800
Message-Id: <20250415024532.26632-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patchset is based on v6.15-rc2. It functions correctly only when
CONFIG_LRU_GEN (Multi-Gen LRU) is disabled. Several issues were encountered
during rebasing onto the latest code. For more details and assistance, refer
to the "Challenges" section. This is the reason for adding the RFC tag.

## Introduction

This patchset is intended to transfer the LRU pages to the object cgroup
without holding a reference to the original memory cgroup in order to
address the issue of the dying memory cgroup. A consensus has already been
reached regarding this approach recently [1].

## Background

The issue of a dying memory cgroup refers to a situation where a memory
cgroup is no longer being used by users, but memory (the metadata
associated with memory cgroups) remains allocated to it. This situation
may potentially result in memory leaks or inefficiencies in memory
reclamation and has persisted as an issue for several years. Any memory
allocation that endures longer than the lifespan (from the users'
perspective) of a memory cgroup can lead to the issue of dying memory
cgroup. We have exerted greater efforts to tackle this problem by
introducing the infrastructure of object cgroup [2].

Presently, numerous types of objects (slab objects, non-slab kernel
allocations, per-CPU objects) are charged to the object cgroup without
holding a reference to the original memory cgroup. The final allocations
for LRU pages (anonymous pages and file pages) are charged at allocation
time and continues to hold a reference to the original memory cgroup
until reclaimed.

File pages are more complex than anonymous pages as they can be shared
among different memory cgroups and may persist beyond the lifespan of
the memory cgroup. The long-term pinning of file pages to memory cgroups
is a widespread issue that causes recurring problems in practical
scenarios [3]. File pages remain unreclaimed for extended periods.
Additionally, they are accessed by successive instances (second, third,
fourth, etc.) of the same job, which is restarted into a new cgroup each
time. As a result, unreclaimable dying memory cgroups accumulate,
leading to memory wastage and significantly reducing the efficiency
of page reclamation.

## Fundamentals

A folio will no longer pin its corresponding memory cgroup. It is necessary
to ensure that the memory cgroup or the lruvec associated with the memory
cgroup is not released when a user obtains a pointer to the memory cgroup
or lruvec returned by folio_memcg() or folio_lruvec(). Users are required
to hold the RCU read lock or acquire a reference to the memory cgroup
associated with the folio to prevent its release if they are not concerned
about the binding stability between the folio and its corresponding memory
cgroup. However, some users of folio_lruvec() (i.e., the lruvec lock)
desire a stable binding between the folio and its corresponding memory
cgroup. An approach is needed to ensure the stability of the binding while
the lruvec lock is held, and to detect the situation of holding the
incorrect lruvec lock when there is a race condition during memory cgroup
reparenting. The following four steps are taken to achieve these goals.

1. The first step  to be taken is to identify all users of both functions
   (folio_memcg() and folio_lruvec()) who are not concerned about binding
   stability and implement appropriate measures (such as holding a RCU read
   lock or temporarily obtaining a reference to the memory cgroup for a
   brief period) to prevent the release of the memory cgroup.

2. Secondly, the following refactoring of folio_lruvec_lock() demonstrates
   how to ensure the binding stability from the user's perspective of
   folio_lruvec().

   struct lruvec *folio_lruvec_lock(struct folio *folio)
   {
           struct lruvec *lruvec;

           rcu_read_lock();
   retry:
           lruvec = folio_lruvec(folio);
           spin_lock(&lruvec->lru_lock);
           if (unlikely(lruvec_memcg(lruvec) != folio_memcg(folio))) {
                   spin_unlock(&lruvec->lru_lock);
                   goto retry;
           }

           return lruvec;
   }

   From the perspective of memory cgroup removal, the entire reparenting
   process (altering the binding relationship between folio and its memory
   cgroup and moving the LRU lists to its parental memory cgroup) should be
   carried out under both the lruvec lock of the memory cgroup being removed
   and the lruvec lock of its parent.

3. Thirdly, another lock that requires the same approach is the split-queue
   lock of THP.

4. Finally, transfer the LRU pages to the object cgroup without holding a
   reference to the original memory cgroup.

## Challenges

In a non-MGLRU scenario, each lruvec of every memory cgroup comprises four
LRU lists (i.e., two active lists for anonymous and file folios, and two
inactive lists for anonymous and file folios). Due to the symmetry of the
LRU lists, it is feasible to transfer the LRU lists from a memory cgroup
to its parent memory cgroup during the reparenting process.

In a MGLRU scenario, each lruvec of every memory cgroup comprises at least
2 (MIN_NR_GENS) generations and at most 4 (MAX_NR_GENS) generations.

1. The first question is how to move the LRU lists from a memory cgroup to
   its parent memory cgroup during the reparenting process. This is due to
   the fact that the quantity of LRU lists (aka generations) may differ
   between a child memory cgroup and its parent memory cgroup.

2. The second question is how to make the process of reparenting more
   efficient, since each folio charged to a memory cgroup stores its
   generation counter into its ->flags. And the generation counter may
   differ between a child memory cgroup and its parent memory cgroup because
   the values of ->min_seq and ->max_seq are not identical. Should those
   generation counters be updated correspondingly?

I am uncertain about how to handle them appropriately as I am not an
expert at MGLRU. I would appreciate it if you could offer some suggestions.
Moreover, if you are willing to directly provide your patches, I would be
glad to incorporate them into this patchset.

## Compositions

Patches 1-8 involve code refactoring and cleanup with the aim of
facilitating the transfer LRU folios to object cgroup infrastructures.

Patches 9-10 aim to allocate the object cgroup for non-kmem scenarios,
enabling the ability that LRU folios could be charged to it and aligning
the behavior of object-cgroup-related APIs with that of the memory cgroup.

Patches 11-19 aim to prevent memory cgroup returned by folio_memcg() from
being released.

Patches 20-23 aim to prevent lruvec returned by folio_lruvec() from being
released.

Patches 24-25 implement the core mechanism to guarantee binding stability
between the folio and its corresponding memory cgroup while holding lruvec
lock or split-queue lock of THP.

Patches 26-27 are intended to transfer the LRU pages to the object cgroup
without holding a reference to the original memory cgroup in order to
address the issue of the dying memory cgroup.

Patch 28 aims to add VM_WARN_ON_ONCE_FOLIO to LRU maintenance helpers to
ensure correct folio operations in the future.

## Effect

Finally, it can be observed that the quantity of dying memory cgroups will
not experience a significant increase if the following test script is
executed to reproduce the issue.

```bash
#!/bin/bash

# Create a temporary file 'temp' filled with zero bytes
dd if=/dev/zero of=temp bs=4096 count=1

# Display memory-cgroup info from /proc/cgroups
cat /proc/cgroups | grep memory

for i in {0..2000}
do
    mkdir /sys/fs/cgroup/memory/test$i
    echo $$ > /sys/fs/cgroup/memory/test$i/cgroup.procs

    # Append 'temp' file content to 'log'
    cat temp >> log

    echo $$ > /sys/fs/cgroup/memory/cgroup.procs

    # Potentially create a dying memory cgroup
    rmdir /sys/fs/cgroup/memory/test$i
done

# Display memory-cgroup info after test
cat /proc/cgroups | grep memory

rm -f temp log
```

## References

[1] https://lore.kernel.org/linux-mm/Z6OkXXYDorPrBvEQ@hm-sls2/
[2] https://lwn.net/Articles/895431/
[3] https://github.com/systemd/systemd/pull/36827

Muchun Song (28):
  mm: memcontrol: remove dead code of checking parent memory cgroup
  mm: memcontrol: use folio_memcg_charged() to avoid potential rcu lock
    holding
  mm: workingset: use folio_lruvec() in workingset_refault()
  mm: rename unlock_page_lruvec_irq and its variants
  mm: thp: replace folio_memcg() with folio_memcg_charged()
  mm: thp: introduce folio_split_queue_lock and its variants
  mm: thp: use folio_batch to handle THP splitting in
    deferred_split_scan()
  mm: vmscan: refactor move_folios_to_lru()
  mm: memcontrol: allocate object cgroup for non-kmem case
  mm: memcontrol: return root object cgroup for root memory cgroup
  mm: memcontrol: prevent memory cgroup release in
    get_mem_cgroup_from_folio()
  buffer: prevent memory cgroup release in folio_alloc_buffers()
  writeback: prevent memory cgroup release in writeback module
  mm: memcontrol: prevent memory cgroup release in
    count_memcg_folio_events()
  mm: page_io: prevent memory cgroup release in page_io module
  mm: migrate: prevent memory cgroup release in folio_migrate_mapping()
  mm: mglru: prevent memory cgroup release in mglru
  mm: memcontrol: prevent memory cgroup release in
    mem_cgroup_swap_full()
  mm: workingset: prevent memory cgroup release in lru_gen_eviction()
  mm: workingset: prevent lruvec release in workingset_refault()
  mm: zswap: prevent lruvec release in zswap_folio_swapin()
  mm: swap: prevent lruvec release in swap module
  mm: workingset: prevent lruvec release in workingset_activation()
  mm: memcontrol: prepare for reparenting LRU pages for lruvec lock
  mm: thp: prepare for reparenting LRU pages for split queue lock
  mm: memcontrol: introduce memcg_reparent_ops
  mm: memcontrol: eliminate the problem of dying memory cgroup for LRU
    folios
  mm: lru: add VM_WARN_ON_ONCE_FOLIO to lru maintenance helpers

 fs/buffer.c                      |   4 +-
 fs/fs-writeback.c                |  22 +-
 include/linux/memcontrol.h       | 190 ++++++------
 include/linux/mm_inline.h        |   6 +
 include/trace/events/writeback.h |   3 +
 mm/compaction.c                  |  43 ++-
 mm/huge_memory.c                 | 218 +++++++++-----
 mm/memcontrol-v1.c               |  15 +-
 mm/memcontrol.c                  | 476 +++++++++++++++++++------------
 mm/migrate.c                     |   2 +
 mm/mlock.c                       |   2 +-
 mm/page_io.c                     |   8 +-
 mm/percpu.c                      |   2 +-
 mm/shrinker.c                    |   6 +-
 mm/swap.c                        |  22 +-
 mm/vmscan.c                      |  73 ++---
 mm/workingset.c                  |  26 +-
 mm/zswap.c                       |   2 +
 18 files changed, 696 insertions(+), 424 deletions(-)

-- 
2.20.1

