Received: from mail-ot1-f73.google.com (mail-ot1-f73.google.com [209.85.210.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AF8213B590
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 17:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744998606; cv=none; b=gBEypTpPhJylFEI4F4PPmi5ycYiV+/ePKuiQqsLdk1VFFLKE0rhHH8boZQp8+JRWZUEI41HPUFKM0dwS/wqr6vzifj8ClvZKAkLZEG7qxOTJCzCtpP5s8Mpm3l9rJX+nKqIGIolPf2rXuDmEZFyfm4I/E7kGqlbvCtPIETsA8ik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744998606; c=relaxed/simple;
	bh=J2Lz0EDBuhAnvIhVI7WuWBYiMB01TvLRzTph4cwRKFQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XSQPp+QrHwLyIjzacYbi6lUKsgy5QF7rQ7HwfScptuFNZY7rPxdVErAsDef84sw4OfgcROfN9pl+llyBZK+Ywm9v69LVJ9psA6jLUpyRRiu5EB0RVdHcka2jGMFad1WqprGJglw/K95mOq6nkW0t1wEJYmIddeACTDrY2F9rrcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rzJe3yX0; arc=none smtp.client-ip=209.85.210.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rzJe3yX0"
Received: by mail-ot1-f73.google.com with SMTP id 46e09a7af769-72b881599f6so1665076a34.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744998603; x=1745603403; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NChENxjYlbY+fearBpat5nnFIT5zlqPLQI15hZf3lPM=;
        b=rzJe3yX0C7w6K9BnrlPj3zwCRnc1vtNfFMpapaxLX0kcyRu21vrQZTZTaskoD58wQc
         7CxiZJcfyOqBfsWX3lQ+JdoYGe3e0pMb/oeYcyoUDRinG0V7Q2RTrwE8LFHJ72gTGcHJ
         pvnuGNxbzcyqrCZtCww2kIFdTBNksQb/T5uokamoU6Svr1LNnpEvTqPYrYCt1VJeBmSt
         vHh4bROW9JUOhmwpm7xs1CgzSmFrUq0j7Emy2IdycdG1P9i/omuA0MRObveQOIneObfC
         9LIvSt99GUg65BLGuP/6KcYJThrewC3t6OnwvZ00JzaTWL1rrpwZENryww7rMIxViMK2
         T28g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744998603; x=1745603403;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NChENxjYlbY+fearBpat5nnFIT5zlqPLQI15hZf3lPM=;
        b=R2YoatytCTi+birEWILRc5lH1TeYztEg2Yk6DS9ng7fzCvn2zJ7poA/mFSBKJUMHKo
         TQGM2j5IFpsU8ZAJxrOcbcwOMCasKmdhYxPXRhCADyydlfrNq2ZCgVOdVdyBFXguh6Di
         0NlcVWR+2uKrGrwXOLsjmW51yzCo/uIyncTOXzoy6O0DYOGcKhzgzPckh8rnMS+zdiij
         QuP2RpOYpbLjD2tB8bIq0TK1qdtq0PQLBBPlAfynTF2TaaSi8Y10ss9fALdys7OWZhTp
         BueYrYrvIgE4KyrVqqaxuL8gau18gDjzGtloKTcfTI1FO4swDIYhCqugVyRh/9GGj7jw
         HgWA==
X-Forwarded-Encrypted: i=1; AJvYcCUdSGVMYCGXeF9ItyR7zHS1ebIe6KIkQM2x8fwBpSdXkZkuPANaOFzP7tJsokNqsAtTp/aH3/iIPHeYgCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuH0UMCHFCh32NSyLAIuGMTnAJd0Ittc5TpsEv8gYP492+9L93
	IEuTer571uelDLywrkno/w2EVHpzggDVYS2+GvWNcnKFDdANuPBJTFtctcMbClc7QPxdO5ACAkL
	/4Q==
X-Google-Smtp-Source: AGHT+IE3aftsn9hfNjPsF8qSwC5r3XHYkK9rjlStJcjhr+jAxmTp8vjQYXiW/ySOAL58Q0hdZgfr9P9bsm4=
X-Received: from oabuz10.prod.google.com ([2002:a05:6870:af8a:b0:29f:d208:6db])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6870:ef83:b0:2d5:4f4:e24d
 with SMTP id 586e51a60fabf-2d5269799d4mr2188610fac.6.1744998603619; Fri, 18
 Apr 2025 10:50:03 -0700 (PDT)
Date: Fri, 18 Apr 2025 10:49:51 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Message-ID: <20250418174959.1431962-1-surenb@google.com>
Subject: [PATCH v3 0/8] perform /proc/pid/maps read and PROCMAP_QUERY under RCU
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-kselftest@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

After a long delay I'm posting next iteration of lockless /proc/pid/maps
reading patchset. Differences from v2 [1]:
- Add a set of tests concurrently modifying address space and checking for
correct reading results;
- Use new mmap_lock_speculate_xxx APIs for concurrent change detection and
retries;
- Add lockless PROCMAP_QUERY execution support;

The new tests are designed to check for any unexpected data tearing while
performing some common address space modifications (vma split, resize and
remap). Even before these changes, reading /proc/pid/maps might have
inconsistent data because the file is read page-by-page with mmap_lock
being dropped between the pages. Such tearing is expected and userspace
is supposed to deal with that possibility. An example of user-visible
inconsistency can be that the same vma is printed twice: once before
it was modified and then after the modifications. For example if vma was
extended, it might be found and reported twice. Whan is not expected is
to see a gap where there should have been a vma both before and after
modification. This patchset increases the chances of such tearing,
therefore it's event more important now to test for unexpected
inconsistencies.

Thanks to Paul McKenney who developed a benchmark to test performance
of concurrent reads and updates, we also have data on performance
benefits:

The test has a pair of processes scanning /proc/PID/maps, and another
process unmapping and remapping 4K pages from a 128MB range of anonymous
memory.  At the end of each 10-second run, the latency of each mmap()
or munmap() operation is measured, and for each run the maximum and mean
latency is printed.  (Yes, the map/unmap process is started first, its
PID is passed to the scanners, and then the map/unmap process waits until
both scanners are running before starting its timed test.  The scanners
keep scanning until the specified /proc/PID/maps file disappears.)
In summary, with stock mm, 78% of the runs had maximum latencies in
excess of 0.5 milliseconds, and with more then half of the runs' latencies
exceeding a full millisecond.  In contrast, 98% of the runs with Suren's
patch series applied had maximum latencies of less than 0.5 milliseconds.
From a median-performance viewpoint, Suren's series also looks good,
with stock mm weighing in at 13 microseconds and Suren's series at 10
microseconds, better than a 20% improvement.

[1] https://lore.kernel.org/all/20240123231014.3801041-1-surenb@google.com/

Suren Baghdasaryan (8):
  selftests/proc: add /proc/pid/maps tearing from vma split test
  selftests/proc: extend /proc/pid/maps tearing test to include vma
    resizing
  selftests/proc: extend /proc/pid/maps tearing test to include vma
    remapping
  selftests/proc: test PROCMAP_QUERY ioctl while vma is concurrently
    modified
  selftests/proc: add verbose more for tests to facilitate debugging
  mm: make vm_area_struct anon_name field RCU-safe
  mm/maps: read proc/pid/maps under RCU
  mm/maps: execute PROCMAP_QUERY ioctl under RCU

 fs/proc/internal.h                         |   6 +
 fs/proc/task_mmu.c                         | 233 +++++-
 include/linux/mm_inline.h                  |  28 +-
 include/linux/mm_types.h                   |   3 +-
 mm/madvise.c                               |  30 +-
 tools/testing/selftests/proc/proc-pid-vm.c | 793 ++++++++++++++++++++-
 6 files changed, 1061 insertions(+), 32 deletions(-)


base-commit: 79f35c4125a9a3fd98efeed4cce1cd7ce5311a44
-- 
2.49.0.805.g082f7c87e0-goog

