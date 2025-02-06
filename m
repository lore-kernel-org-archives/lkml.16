Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42967080E
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 06:15:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738822520; cv=none; b=TaMHl0dHLgqZoeNyMuq4CMVTOxXNLKpd5G2uY0JNIaGMez1wJ1+idN+cLsdSy05q9tl6b/JSWqelphKbd5hA2eMUaEvU4t4sYdTLZRJKye8jwQFlwacQx51KDNj1gsPaEDND7SrBb4oJhamip+vsR00kUgNCdULYHj2YzbUduhE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738822520; c=relaxed/simple;
	bh=iWdTbe3mmnWsRjoHtENYO9aq9qZcUVZrQ372et9oBu4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ANdARHa01k6RquGstMLtbpc3RmUcY/vn6rdYDXLLt951y4neb1Ek6qSilQ79URR0o1PG5tG5CM5CXkp3unSTSVUXcig0xM3z9Dje1AgiL/2iK4VzwOcO9AW5mCB08NQN9/WUAQYtgqDd24Cuk7tG+H7z4QDHe9B9AY7Rdp+5HGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eh1t7C4R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eh1t7C4R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15499C4CEDD;
	Thu,  6 Feb 2025 06:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738822520;
	bh=iWdTbe3mmnWsRjoHtENYO9aq9qZcUVZrQ372et9oBu4=;
	h=From:To:Cc:Subject:Date:From;
	b=eh1t7C4R4L8GkMluuDkkDp6mnD1ZzejGdKTTIacgplM3VMozjSgrEeD0siKI5mWOX
	 dVMivFwzwqjLsLvT0dSMwvMo6hD/tQ+DMnW9KNGGmOB50onZwwafkIb0qwux9HuoZf
	 pQBHbYosoPgjhtfaQEhGiiCoS7hR4hyr6zlU3eiiP5z+Jjfu2ynVfjHQ9q0ui8YU2+
	 ZWF7VYBLdXxOg5KckeIL4Gi+sdrcE94j9pj3fNXjI5G8ct1V4n5/lxmiZP7xxIIAsh
	 i95jULBbJxEIB5PoBd9XlO2BDe/JR9nva4Q7jHk9eqqC1CCyE5MlmAOW0gJt5bsgIO
	 D8291B+LvdQNQ==
From: SeongJae Park <sj@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: SeongJae Park <sj@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	David Hildenbrand <david@redhat.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH 0/4] mm/madvise: remove redundant mmap_lock operations from process_madvise()
Date: Wed,  5 Feb 2025 22:15:13 -0800
Message-Id: <20250206061517.2958-1-sj@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

process_madvise() calls do_madvise() for each address range.  Then, each
do_madvise() invocation holds and releases same mmap_lock.  Optimize the
redundant lock operations by splitting do_madvise() internal logics
including the mmap_lock operations, and calling the small logics
directly from process_madvise() in a sequence that removes the redundant
locking.  As a result of this change, process_madvise() becomes more
efficient and less racy in terms of its results and latency.

Note that the potential downside of this series is that other mmap_lock
holders may take more time due to the increased length of mmap_lock
critical section for process_madvise() calls.  But there is maximum
limit in the kernel space (IOV_MAX), and the user space can control the
critical section length by setting the request size.  Hence, the
downside would be limited and controllable.

Evaluation
==========

I measured the time to apply MADV_DONTNEED advice to 256 MiB memory
using multiple madvise() calls, 4 KiB per each call.  I also do the same
with process_madvise(), but with varying batch size (vlen) from 1 to
1024.  The source code for the measurement is available at GitHub[1].
Because the microbenchmark result is not that stable, I ran each
configuration five times and use the average.

The measurement results are as below.  'sz_batches' column shows the
batch size of process_madvise() calls.  '0' batch size is for madvise()
calls case.  'before' and 'after' columns are the measured time to apply
MADV_DONTNEED to the 256 MiB memory buffer in nanoseconds, on kernels
that built without and with the last patch of this series, respectively.
So lower value means better efficiency.  'after/before' column is the
ratio of 'after' to 'before'.

    sz_batches  before       after        after/before
    0           146294215.2  121280536.2  0.829017989769427
    1           165851018.8  136305598.2  0.821855658085351
    2           129469321.2  103740383.6  0.801273866569094
    4           110369232.4  87835896.2   0.795836795182785
    8           102906232.4  77420920.2   0.752344327397609
    16          97551017.4   74959714.4   0.768415506038587
    32          94809848.2   71200848.4   0.750985786305689
    64          96087575.6   72593180     0.755489765942227
    128         96154163.8   68517055.4   0.712575022154163
    256         92901257.6   69054216.6   0.743307662177439
    512         93646170.8   67053296.2   0.716028168874151
    1024        92663219.2   70168196.8   0.75723892830177

In despite of the unstable nature of the tet program, the trend is
somewhat we can expect.  The measurement shows this patch reduces the
process_madvise() latency, proportional to the batching size.  The
latency gain was about 20% with the batch size 2, and it has increased
to about 28% with the batch size 512, since more number of mmap locking
is reduced with larger batch size.

Note that the standard devitation of the measurements for each
sz_batches configuration was ranging from 1.9% to 7.2%.  That is, this
result is still not very stable.  The average of the standard deviations
for different batch sizes were 4.62% and 4.70% for the 'before' and
'after' kernel measurements.

Also note that this patch has somehow decreased latencies of madvise()
and single batch size process_madvise().  Seems this code path is small
enough to significantly be affected by compiler optimizations including
inlining of split-out functions.  Please focus on only the improvement
amount that changed by the batch size.

Changelog
=========

Changes from RFC v2
(https://lore.kernel.org/20250117013058.1843-1-sj@kernel.org)
- Release and acquire mmap lock again when a race-caused failure happens
  (Lorenzo Stoakes)
- Collected Reviewed-by: tags from Shakeel, Lorenzo and Davidlohr.

Changes from RFC v1
(https://lore.kernel.org/20250111004618.1566-1-sj@kernel.org)
- Split out do_madvise() and use those from vector_madvise(), instead of
  adding a flag to do_madvise() (Liam R. Howlett)

[1] https://github.com/sjp38/eval_proc_madvise

SeongJae Park (4):
  mm/madvise: split out mmap locking operations for madvise()
  mm/madvise: split out madvise input validity check
  mm/madvise: split out madvise() behavior execution
  mm/madvise: remove redundant mmap_lock operations from
    process_madvise()

 mm/madvise.c | 154 +++++++++++++++++++++++++++++++++++----------------
 1 file changed, 107 insertions(+), 47 deletions(-)


base-commit: f104b8534d19f31443a4fe6cb701bdb15fd931eb
-- 
2.39.5
