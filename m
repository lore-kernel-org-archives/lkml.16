Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50C91F03EF;
	Thu, 12 Jun 2025 18:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749752100; cv=none; b=XyEiI53ztLWkslVKj+bL6P8faQIlyqBjr8HK3zZ3HIERsE9DScyNNyv8CpL/bdIchAsH7Y2f6bBMJ9B5OPU+odf+CK0E/YGoNht4qOY+GdHVFdLxSJWH5LMp1tvWl3e35zA6iix0egTG3Mu/2wXiywiHHWBLOD70sN1VcSiNodk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749752100; c=relaxed/simple;
	bh=hHNRTNeRRwURj4qUEFDg68faIMn6MbkoXsjohNC0DzE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NxUEY64YLTVajEzVmSSITx4O5alQABuqEMWwS7F2MKSX0BmJ43/bn5XY8gM8jmpQunYcPZWy+z40HL5B/Q2QbHcvAjDDhW3DEiknoFjgC7gGl5lOHlXaNJBqWQjJEJ0aWxwvIVV6tXvK4QuntWsJj2kSl5CionVbuumYzGyn2g4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GJ21sGii; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GJ21sGii"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-e731a56e111so1222836276.1;
        Thu, 12 Jun 2025 11:14:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749752097; x=1750356897; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7dGCBQnCx0nj6LJC8ipSZAzvXRddXH3Z76gYMfvl3qo=;
        b=GJ21sGiiEI8CCLGV/1bzPt1ea24g2QpzmYzXuliIFKrPTakA+qJcRxpNN74RWgFAyz
         G5mD/ubw0aIO1mFUdIVv6AnK2NBhL9+Zf2JcXAk1W0O0BK86BKkwI7zOzIogo1gPaeKz
         FTvYd9ITd0m/HIwlxNrViA0XQpsK5rzDp/NZCRKcn/FwYpqnUMLD9wyR6sB8/bJlwH9Y
         tn+9BQvEaBgHLEhT5D0c8844ap9Amo9Lyq/XarWlMa56VlQRk6Fi2d+aqyqYwCgj7EwP
         dFkO38xRBN54QNc2AIwKU3GQSLMpI0df1kAzxxlk1YGenazjc16aC2QoQxOT92rtyKPn
         Xo7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749752097; x=1750356897;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7dGCBQnCx0nj6LJC8ipSZAzvXRddXH3Z76gYMfvl3qo=;
        b=l7wz6ETuTJLIGyWWRHPnI/SaD+jS/bWyPWq86FHqGIq4DE4lPUF4JHeN4UkwN50JC6
         raCI1CO0Z11EHE2QuSN0crpu8w6mPOJZpd4fWsZjJf6rlbP4CzrVSz8CvfVyJQN0OAMr
         crpozOWYn/z9B55b+sr0UKYrqgpxXGrxrNztN7oX9mZcGZtNFyuSZgkNLGGwmu+7FdCj
         1qlMUw369vxq63QKfSDyGGCaR+qk5KGZVIwDmBQpoxZbGy/5jGNlxBrRo/I7FMpfQIl8
         UMD5MEyM4CyRI/BoiAU0WWknTAt/ctfHNCub+lfnoPdeMFbmUNws/FeW6G/Snw3lYeUf
         ovDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQo5xPAAvrYUGoRgwWl/qvSP1HZ+8pKZO6aRPEpH7hPTivMzC9SfbG1XGhTXbSHoKj4Kk6RvFCOJNk6OlP@vger.kernel.org, AJvYcCVSPIrkAOvbbqwTCGHGp5Uub6fmR5AZi6/MDoz7AQ360hbaxqID+Jhy/IdvRoJZX1VsZ/Tu1LuWK5g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAOXwfzBNhLl++y31X0I+AcmOn68BmuxyxFQqJnrk0QEy5V+VY
	Ql4iOntx7PyCTvFK9+rYiDMhGQSH9jo/8OAwBhkIwPzfjZV9X0kyOXaY
X-Gm-Gg: ASbGncvzDjbjBdgnibxsp22cKHzsu5BneX3Lu13KKprkIqE7kt7QAr9auyHNEdl0bKa
	5fLc0Bj2RanlrkMlEc77gTbb0XrdG594/RxTd5Im89u8va08NMxivKTRxC3UqLLF9y294Gm4wPF
	wrwVDn8sxwC1FaF5N444FsvWJ4mwC+vZaELLzBz4zpD4p+eBVA9KOm2is1EbBzyyIFuWtaW6eja
	suYIsLPi/wrvCZol/PXd5rCgX3P0/mPD6cUL/16dspUfJ23Wi/vHGeLnZAEWy0kCQgaOmkt/HEY
	vixopUrND8ixUKRG06XvUXA9PqbRmcX3BlOUDjkqCnRxGsc3qRCm4dbf6CTAP6p+HFl9M6bV9ZS
	2ZDC1SXaejmJJ734reQ==
X-Google-Smtp-Source: AGHT+IHuilM8OKD/FKaBak0BosxjVKmpehSXwuiIqtTuQ6Jsg2kCbvgxdn/IU8iSp6RJyUJ/a8SdjA==
X-Received: by 2002:a05:6902:15c1:b0:e82:61:6536 with SMTP id 3f1490d57ef6-e821a74a74bmr951361276.7.1749752097431;
        Thu, 12 Jun 2025 11:14:57 -0700 (PDT)
Received: from bijan-laptop.attlocal.net ([2600:1700:680e:c000:dd1b:d4ae:15de:11db])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e820e312452sm592480276.40.2025.06.12.11.14.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:14:57 -0700 (PDT)
From: Bijan Tabatabai <bijan311@gmail.com>
To: damon@lists.linux.com,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: sj@kernel.org,
	akpm@linux-foundation.org,
	corbet@lwn.net,
	david@redhat.com,
	ziy@nvidia.com,
	matthew.brost@intel.com,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	apopple@nvidia.com,
	bijantabatab@micron.com,
	venkataravis@micron.com,
	emirakhur@micron.com,
	ajayjoshi@micron.com,
	vtavarespetr@micron.com
Subject: [RFC PATCH 0/4] mm/damon: Add DAMOS action to interleave data across nodes
Date: Thu, 12 Jun 2025 13:13:26 -0500
Message-ID: <20250612181330.31236-1-bijan311@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bijan Tabatabai <bijantabatab@micron.com>

A recent patch set automatically set the interleave weight for each node
according to the node's maximum bandwidth [1]. In another thread, the patch
set's author, Joshua Hahn, wondered if/how these weights should be changed
if the bandwidth utilization of the system changes [2].

This patch set adds the mechanism for dynamically changing how application
data is interleaved across nodes while leaving the policy of what the
interleave weights should be to userspace. It does this by adding a new
DAMOS action: DAMOS_INTERLEAVE. We implement DAMOS_INTERLEAVE with both
paddr and vaddr operations sets. Using the paddr version is useful for
managing page placement globally. Using the vaddr version limits tracking
to one process per kdamond instance, but the va based tracking better
captures spacial locality.

DAMOS_INTERLEAVE interleaves pages within a region across nodes using the
interleave weights at /sys/kernel/mm/mempolicy/weighted_interleave/node<N>
and the page placement algorithm in weighted_interleave_nid via
policy_nodemask. We chose to reuse the mempolicy weighted interleave
infrastructure to avoid reimplementing code. However, this has the awkward
side effect that only pages that are mapped to processes using
MPOL_WEIGHTED_INTERLEAVE will be migrated according to new interleave
weights. This might be fine because workloads that want their data to be
dynamically interleaved will want their newly allocated data to be
interleaved at the same ratio.

If exposing policy_nodemask is undesirable, we have two alternative methods
for having DAMON access the interleave weights it should use. We would
appreciate feedback on which method is preferred.
1. Use mpol_misplaced instead
  pros: mpol_misplaced is already exposed publically
  cons: Would require refactoring mpol_misplaced to take a struct vm_area
  instead of a struct vm_fault, and require refactoring mpol_misplaced and
  get_vma_policy to take in a struct task_struct rather than just using
  current. Also requires processes to use MPOL_WEIGHTED_INTERLEAVE.
2. Add a new field to struct damos, similar to target_nid for the
MIGRATE_HOT/COLD schemes.
  pros: Keeps changes contained inside DAMON. Would not require processes
  to use MPOL_WEIGHTED_INTERLEAVE.
  cons: Duplicates page placement code. Requires discussion on the sysfs
  interface to use for users to pass in the interleave weights.

This patchset was tested on an AMD machine with a NUMA node with CPUs
attached to DDR memory and a cpu-less NUMA node attached to CXL memory.
However, this patch set should generalize to other architectures and number
of NUMA nodes.

Patches Sequence
________________
The first patch exposes policy_nodemask() in include/linux/mempolicy.h to
let DAMON determine where a page should be placed for interleaving.
The second patch implements DAMOS_INTERLEAVE as a paddr action.
The third patch moves the DAMON page migration code to ops-common, allowing
vaddr actions to use it.
Finally, the fourth patch implements a vaddr version of DAMOS_INTERLEAVE.

[1] https://lore.kernel.org/linux-mm/20250520141236.2987309-1-joshua.hahnjy@gmail.com/
[2] https://lore.kernel.org/linux-mm/20250313155705.1943522-1-joshua.hahnjy@gmail.com/

Bijan Tabatabai (4):
  mm/mempolicy: Expose policy_nodemask() in include/linux/mempolicy.h
  mm/damon/paddr: Add DAMOS_INTERLEAVE action
  mm/damon: Move damon_pa_migrate_pages to ops-common
  mm/damon/vaddr: Add vaddr version of DAMOS_INTERLEAVE

 Documentation/mm/damon/design.rst |   2 +
 include/linux/damon.h             |   2 +
 include/linux/mempolicy.h         |   2 +
 mm/damon/ops-common.c             | 136 ++++++++++++++++++++
 mm/damon/ops-common.h             |   4 +
 mm/damon/paddr.c                  | 198 +++++++++++++-----------------
 mm/damon/sysfs-schemes.c          |   1 +
 mm/damon/vaddr.c                  | 124 +++++++++++++++++++
 mm/mempolicy.c                    |   4 +-
 9 files changed, 360 insertions(+), 113 deletions(-)

-- 
2.43.5

