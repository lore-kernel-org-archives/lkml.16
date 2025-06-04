Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96EB26B0A7
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 23:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749078717; cv=none; b=ck9zXFcO/paRQyTwdNnlRP6WmRe7+hCa1snSib8VCp76Zzb73AlNCzu7+33tJNqANeTLXFNCaftbXatV1RDfKdyJa5omMtET2XsLFz+i03Gy8htRiE3ubp4pCcM8flIEqCN0SlXaEZu0oAc3GRRwjfgGabtiTycyL/wtndGqxRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749078717; c=relaxed/simple;
	bh=pGoib3ydjtZ/I78fQ6QPvniLoEWzR+5uyTMk2OKAQ9s=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=sEcQ61gdSN7qZQKuuqNQy/SqQ6eHFBXeDZC2MAFhVhSuySFJJ4kucRMUtmSaUNU2417eRW+JdGZ1JLE/j7QQQr7ll4dhspFyKVuVAiYm7yFf/t+KRii6in4CYYF5ImafbGm1sVk6iKwjcRIvO3xC07Iu5llA3mg0URT4gv7U5AA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jUqqWFsH; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--surenb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jUqqWFsH"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2eb60594e8so146182a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 16:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749078715; x=1749683515; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=3npSTljTroS8UV+to+K7B0gejhUv63EMca56GSqeKhA=;
        b=jUqqWFsHJeauJ0UdL6a3yAD//Y5nRdJb+lt+Wu0tijNSrPD6kvpliaA4bdlIyuZUnl
         nufCdwEie7ELjDuQ+sKvQmW4TzsqezJErSbxWtWjOeah9rFLVO0tcERcpdPOEPsAXy4O
         NG0x2enC2+02iwrZ0ligWErT/SmgpabylcgCGIChaP8/CA/4Pv9SvYkfEUt1FOviDp7h
         ZWR4s2NkiRs5yfv0d2sbGSGmM1YAMAStfgmhUDChYiKBSf09E5jXvUWc4nC5g+J2rrrO
         AY3Yj3bMV2VYlhaDvcgbk+l8mAhqqs005lYANeSmzlYZxlTct5hZ9pukUd1TuPetaEiw
         VC6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749078715; x=1749683515;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3npSTljTroS8UV+to+K7B0gejhUv63EMca56GSqeKhA=;
        b=aRCRa5kBctekl8sJ7C9ctdRMwCIr53L19GyvsYZmvLhSgIcdP3olvOUQ7Nbw7lU/Lj
         aBcsA6tnDvmFZ32ctAYDsNACNQNYPdUIUvivqeCVrQTmliLgcqhPTQKrrTNziaiYJxla
         xZKFZXqlZtxt89VjIKpZEn5b4NXoi7l9UIVtDIJQaxTBZIgmkKl0VMd7anA0z4FdHg3Y
         asPJpsmlwAfov9EhZ8c1ucEEn5cAxZlhXTenWVeFBeRb4K76MVco4QkU7YP8tId8G3OA
         NpDBxW+ZEeWqdI8OhaVUYSdoChML1ASdZr7IzGfdMXEipd+eDpgKvVQsn/qNLtxSA9LL
         uwbA==
X-Forwarded-Encrypted: i=1; AJvYcCXkPMemlM7q0yS5GT4kWNAHBUka2Uo+2v3TKq/2/mG2ogQbgD/jlV2XoxdAAW8n9lyCKersgZEJGwacr2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj9CzhxjzS2mtzAs4U22hWXAbGpNV0wYe6Gv8eRHdrAPdUDEvX
	eSlCK4cuOa+0nuPqQH2ZfNS/MRSQ9Qao0m4IGEyoB6e9nqFyRqJHQzp8jv7Ne3sYKQm5YwaJ64U
	YxpJDnQ==
X-Google-Smtp-Source: AGHT+IE5vyjpR0b4JnX96tHDLjXZe/ay0gti7aWB7+1hKtbXecOEAJBb165hSe99jrOqgpdnI0DBhGLXyQk=
X-Received: from pgac22.prod.google.com ([2002:a05:6a02:2956:b0:b2c:3dd5:8139])
 (user=surenb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a21:6b02:b0:216:1ea0:a516
 with SMTP id adf61e73a8af0-21d22d4ce34mr7310828637.41.1749078715129; Wed, 04
 Jun 2025 16:11:55 -0700 (PDT)
Date: Wed,  4 Jun 2025 16:11:44 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Message-ID: <20250604231151.799834-1-surenb@google.com>
Subject: [PATCH v4 0/7] use per-vma locks for /proc/pid/maps reads and PROCMAP_QUERY
From: Suren Baghdasaryan <surenb@google.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, david@redhat.com, 
	vbabka@suse.cz, peterx@redhat.com, jannh@google.com, hannes@cmpxchg.org, 
	mhocko@kernel.org, paulmck@kernel.org, shuah@kernel.org, adobriyan@gmail.com, 
	brauner@kernel.org, josef@toxicpanda.com, yebin10@huawei.com, 
	linux@weissschuh.net, willy@infradead.org, osalvador@suse.de, 
	andrii@kernel.org, ryan.roberts@arm.com, christophe.leroy@csgroup.eu, 
	tjmercier@google.com, kaleshsingh@google.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, surenb@google.com
Content-Type: text/plain; charset="UTF-8"

Reading /proc/pid/maps requires read-locking mmap_lock which prevents any
other task from concurrently modifying the address space. This guarantees
coherent reporting of virtual address ranges, however it can block
important updates from happening. Oftentimes /proc/pid/maps readers are
low priority monitoring tasks and them blocking high priority tasks
results in priority inversion.

Locking the entire address space is required to present fully coherent
picture of the address space, however even current implementation does not
strictly guarantee that by outputting vmas in page-size chunks and
dropping mmap_lock in between each chunk. Address space modifications are
possible while mmap_lock is dropped and userspace reading the content is
expected to deal with possible concurrent address space modifications.
Considering these relaxed rules, holding mmap_lock is not strictly needed
as long as we can guarantee that a concurrently modified vma is reported
either in its original form or after it was modified.

This patchset switches from holding mmap_lock while reading /proc/pid/maps
to taking per-vma locks as we walk the vma tree. This reduces the
contention with tasks modifying the address space because they would have
to contend for the same vma as opposed to the entire address space. Same
is done for PROCMAP_QUERY ioctl which locks only the vma that fell into
the requested range instead of the entire address space. Previous version
of this patchset [1] tried to perform /proc/pid/maps reading under RCU,
however its implementation is quite complex and the results are worse than
the new version because it still relied on mmap_lock speculation which
retries if any part of the address space gets modified. New implementaion
is both simpler and results in less contention. Note that similar approach
would not work for /proc/pid/smaps reading as it also walks the page table
and that's not RCU-safe.

Paul McKenney's designed a test [2] to measure mmap/munmap latencies while
concurrently reading /proc/pid/maps. The test has a pair of processes
scanning /proc/PID/maps, and another process unmapping and remapping 4K
pages from a 128MB range of anonymous memory.  At the end of each 10
second run, the latency of each mmap() or munmap() operation is measured,
and for each run the maximum and mean latency is printed. The map/unmap
process is started first, its PID is passed to the scanners, and then the
map/unmap process waits until both scanners are running before starting
its timed test.  The scanners keep scanning until the specified
/proc/PID/maps file disappears. This test registered close to 10x
improvement in update latencies:

Before the change:
./run-proc-vs-map.sh --nsamples 100 --rawdata -- --busyduration 2
    0.011     0.008     0.455
    0.011     0.008     0.472
    0.011     0.008     0.535
    0.011     0.009     0.545
    ...
    0.011     0.014     2.875
    0.011     0.014     2.913
    0.011     0.014     3.007
    0.011     0.015     3.018

After the change:
./run-proc-vs-map.sh --nsamples 100 --rawdata -- --busyduration 2
    0.006     0.005     0.036
    0.006     0.005     0.039
    0.006     0.005     0.039
    0.006     0.005     0.039
    ...
    0.006     0.006     0.403
    0.006     0.006     0.474
    0.006     0.006     0.479
    0.006     0.006     0.498

The patchset also adds a number of tests to check for /proc/pid/maps data
coherency. They are designed to detect any unexpected data tearing while
performing some common address space modifications (vma split, resize and
remap). Even before these changes, reading /proc/pid/maps might have
inconsistent data because the file is read page-by-page with mmap_lock
being dropped between the pages. An example of user-visible inconsistency
can be that the same vma is printed twice: once before it was modified and
then after the modifications. For example if vma was extended, it might be
found and reported twice. What is not expected is to see a gap where there
should have been a vma both before and after modification. This patchset
increases the chances of such tearing, therefore it's event more important
now to test for unexpected inconsistencies.

[1] https://lore.kernel.org/all/20250418174959.1431962-1-surenb@google.com/
[2] https://github.com/paulmckrcu/proc-mmap_sem-test

Suren Baghdasaryan (7):
  selftests/proc: add /proc/pid/maps tearing from vma split test
  selftests/proc: extend /proc/pid/maps tearing test to include vma
    resizing
  selftests/proc: extend /proc/pid/maps tearing test to include vma
    remapping
  selftests/proc: test PROCMAP_QUERY ioctl while vma is concurrently
    modified
  selftests/proc: add verbose more for tests to facilitate debugging
  mm/maps: read proc/pid/maps under per-vma lock
  mm/maps: execute PROCMAP_QUERY ioctl under per-vma locks

 fs/proc/internal.h                         |   6 +
 fs/proc/task_mmu.c                         | 233 +++++-
 tools/testing/selftests/proc/proc-pid-vm.c | 793 ++++++++++++++++++++-
 3 files changed, 1011 insertions(+), 21 deletions(-)


base-commit: 2d0c297637e7d59771c1533847c666cdddc19884
-- 
2.49.0.1266.g31b7d2e469-goog

