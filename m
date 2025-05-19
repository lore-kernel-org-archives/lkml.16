Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1747A220680;
	Mon, 19 May 2025 22:33:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747694036; cv=none; b=LB2B84CMOxWVqy+TVx2x/bWFAzyBs/XYJT9AEgDSUJPmMzXR294mBzioGDe6Z1GaqmcJkVSTvCNruQtOUHLe3L2bOBs/b1O0LtKuDvw+rxxm/sW66txkwJpfu/hiwL724Xx9ircqFyz7XJZFCyXu7b6O6m56xFHFZFza4IraiVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747694036; c=relaxed/simple;
	bh=VNV6UduRFqWLkLaJ9InTUQk8ok9iiWNF+codDWJu3KE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TBHRr2helN2t4cUjkqM5XVWmKRcMQBMRHgTMfpF91QvGrrd2hFDgY0+jysbf4pGAxIq0VRobfiU2NsEj7mczZEf3omrVwgnL4tiesRPsW4I5Lx9zsggaGIJX1AoB+nY0V11BhF4LibbMyUrhszZUP9akU7XDjNBtHFi4+/ekrmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hmEvyCsO; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hmEvyCsO"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6f8d663fa22so23100076d6.0;
        Mon, 19 May 2025 15:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747694034; x=1748298834; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=LpRy7jJXH2X94qR+7Z08vVSeFahgcmDit4WvxDXTDr8=;
        b=hmEvyCsO0CqG3/KJSXrxiWl8zUE6KaEUB3kQ6qXNlZI3Hnmu2uGy++P4R3M80in2K/
         p7C3GHLmpW0giJiQexMVJNyrEX1MmjjSM95Cq5uPUeBadQBvgWBUYhygSpl82OyrVVkn
         7VUaUH4Uia8zpj21dfaXNbnYeOXg7LHHxy0gkbJlw9CBtZRVV9wvnA+Ih6ONok+n+X/h
         ekDcAuP6Oongc90VeX2UYm9R/QxH++sCNkD1eshOxx1mMgy65Q2Zt2ADiqbIvAH/tm9q
         MeFYUegUjbtbc2ThAyKYHiYsR8KYmTW0Qi5AF149rHx5Q09z/7fXgHFyypYXcdi731QG
         Gwfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747694034; x=1748298834;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LpRy7jJXH2X94qR+7Z08vVSeFahgcmDit4WvxDXTDr8=;
        b=A64BBgEV+zz8alP7FMk1d8KOs/kyQPGUlIXHK5NAph3pW7ohtcthvug5yE753VDykd
         w1gvWHSY8QPt60KeJcpJgNH1GKZemAtDWW+5xmjRYYcSSm0HcN4kYlOrma07SEgA2YJu
         B6XsNUqy2buSz5aPpLj3nOHOF3oyzC4++upYq/j00vkMG4XqRnszdZE0EyNFjR3cOE1Z
         ZKM7GPwDaa6u7SyhYi8TXMftcgC3qfjVddtKCjyDQHmbZxuSLSU6mXtvBCy2z5vKziOr
         kT+sKCdy9JCvYHwdEtQSIIgNMqHSP9oW88XN9kEIr46uS8DJAnm7+Vh4Q3FxYD9qNPua
         cJnA==
X-Forwarded-Encrypted: i=1; AJvYcCUnqBy/Op6T8NL2wOUJJeX9cDJS7qcI/k7/Q4qDGcfZEoyrv1ks3bRS3SFvuImPbNQatye6tprl2CylvK5Q@vger.kernel.org, AJvYcCXi40UUWUmHm8Bgh2Zx4+DX8Pq9l9Aa5Yk5oPFKj3PnLNpZUgB5OADZzTp4wb6jF7MPvKOWsZmholk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJO4Eyffb8x55OSIfRRMo9BeQkvKHbTgtvgRmnzzHh4YqlC9VV
	ke6F+TRk4q/gPgjh3/toQc3tgKLwJb1yGn1QsqHcG9BypIE1KAS9htZEtLctkBc1
X-Gm-Gg: ASbGnctIGwyJ+qbkeDyuJv9aYY8+e/E0YTzyXqGHaCN3axRRWujj10wkrbg6vqOxoXc
	ITaeK9Y2penjAWb3XkSwREwMJNbVbrdvzMiERvln/1dLjpukASuxP/Wq3/kldJNAt83PjlUP98J
	Q4wDuJXP0u+dFZMrlycZF7CJ6R8N+GLW945/5PwHLKOXWPkHeUK+1lyQbLl7zMiOH86yMB3hCOb
	UOuvb0nI4AMNu1JDdMNjfVEI3ZMSRPbkBbDaBMOUmhugE3k/j3JxZ19Wb86CKINXu1Tghnbnh+A
	nNooDSh3zIc2m9IYyF/7LGxNgYymBukpyDgVZCeoJHCUucKx
X-Google-Smtp-Source: AGHT+IG9Rf1Ms6o1Iff8MOEn683LCyyVRYFlfukNUf26S1dHPnjB4DocWIpWObG8j4FUWQJEzi8IUA==
X-Received: by 2002:a05:622a:5805:b0:476:8db0:8cae with SMTP id d75a77b69052e-494b074cbf8mr167938981cf.10.1747694023468;
        Mon, 19 May 2025 15:33:43 -0700 (PDT)
Received: from localhost ([2a03:2880:20ff:9::])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494afbabee4sm59006981cf.55.2025.05.19.15.33.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 15:33:41 -0700 (PDT)
From: Usama Arif <usamaarif642@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	david@redhat.com,
	linux-mm@kvack.org
Cc: hannes@cmpxchg.org,
	shakeel.butt@linux.dev,
	riel@surriel.com,
	ziy@nvidia.com,
	laoar.shao@gmail.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	vbabka@suse.cz,
	jannh@google.com,
	Arnd Bergmann <arnd@arndb.de>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	Usama Arif <usamaarif642@gmail.com>
Subject: [PATCH v3 0/7] prctl: introduce PR_SET/GET_THP_POLICY
Date: Mon, 19 May 2025 23:29:52 +0100
Message-ID: <20250519223307.3601786-1-usamaarif642@gmail.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series allows to change the THP policy of a process, according to the
value set in arg2, all of which will be inherited during fork+exec:
- PR_DEFAULT_MADV_HUGEPAGE: This will set VM_HUGEPAGE and clear VM_NOHUGEPAGE
  for the default VMA flags. It will also iterate through every VMA in the
  process and call hugepage_madvise on it, with MADV_HUGEPAGE policy.
  This effectively allows setting MADV_HUGEPAGE on the entire process.
  In an environment where different types of workloads are run on the
  same machine, this will allow workloads that benefit from always having
  hugepages to do so, without regressing those that don't.
- PR_DEFAULT_MADV_NOHUGEPAGE: This will set VM_NOHUGEPAGE and clear VM_HUGEPAGE
  for the default VMA flags. It will also iterate through every VMA in the
  process and call hugepage_madvise on it, with MADV_NOHUGEPAGE policy.
  This effectively allows setting MADV_NOHUGEPAGE on the entire process.
  In an environment where different types of workloads are run on the
  same machine,this will allow workloads that benefit from having
  hugepages on an madvise basis only to do so, without regressing those
  that benefit from having hugepages always.
- PR_THP_POLICY_SYSTEM: This will reset (clear) both VM_HUGEPAGE and
  VM_NOHUGEPAGE process for the default flags.

In hyperscalers, we have a single THP policy for the entire fleet.
We have different types of workloads (e.g. AI/compute/databases/etc)
running on a single server.
Some of these workloads will benefit from always getting THP at fault
(or collapsed by khugepaged), some of them will benefit by only getting
them at madvise.

This series is useful for 2 usecases:
1) global system policy = madvise, while we want some workloads to get THPs
at fault and by khugepaged :- some processes (e.g. AI workloads) benefits
from getting THPs at fault (and collapsed by khugepaged). Other workloads
like databases will incur regression (either a performance regression or
they are completely memory bound and even a very slight increase in memory
will cause them to OOM). So what these patches will do is allow setting
prctl(PR_DEFAULT_MADV_HUGEPAGE) on the AI workloads, (This is how
workloads are deployed in our (Meta's/Facebook) fleet at this moment).

2) global system policy = always, while we want some workloads to get THPs
only on madvise basis :- Same reason as 1). What these patches
will do is allow setting prctl(PR_DEFAULT_MADV_NOHUGEPAGE) on the database
workloads. (We hope this is us (Meta) in the near future, if a majority of
workloads show that they benefit from always, we flip the default host
setting to "always" across the fleet and workloads that regress can opt-out
and be "madvise". New services developed will then be tested with always by
default. "always" is also the default defconfig option upstream, so I would
imagine this is faced by others as well.)

v2->v3: (Thanks Lorenzo for all the below feedback!)
v2: https://lore.kernel.org/all/20250515133519.2779639-1-usamaarif642@gmail.com/
- no more flags2.
- no more MMF2_...
- renamed policy to PR_DEFAULT_MADV_(NO)HUGEPAGE
- mmap_write_lock_killable acquired in PR_GET_THP_POLICY
- mmap_write lock fixed in PR_SET_THP_POLICY
- mmap assert check in process_default_madv_hugepage
- check if hugepage_global_enabled is enabled in the call and account for s390
- set mm->def_flags VM_HUGEPAGE and VM_NOHUGEPAGE according to the policy in
  the way done by madvise(). I believe VM merge will not be broken in
  this way.
- process_default_madv_hugepage function that does for_each_vma and calls
  hugepage_madvise.

v1->v2:
- change from modifying the THP decision making for the process, to modifying
  VMA flags only. This prevents further complicating the logic used to
  determine THP order (Thanks David!)
- change from using a prctl per policy change to just using PR_SET_THP_POLICY
  and arg2 to set the policy. (Zi Yan)
- Introduce PR_THP_POLICY_DEFAULT_NOHUGE and PR_THP_POLICY_DEFAULT_SYSTEM
- Add selftests and documentation.
 
Usama Arif (7):
  mm: khugepaged: extract vm flag setting outside of hugepage_madvise
  prctl: introduce PR_DEFAULT_MADV_HUGEPAGE for the process
  prctl: introduce PR_DEFAULT_MADV_NOHUGEPAGE for the process
  prctl: introduce PR_THP_POLICY_SYSTEM for the process
  selftests: prctl: introduce tests for PR_DEFAULT_MADV_NOHUGEPAGE
  selftests: prctl: introduce tests for PR_THP_POLICY_DEFAULT_HUGE
  docs: transhuge: document process level THP controls

 Documentation/admin-guide/mm/transhuge.rst    |  42 +++
 include/linux/huge_mm.h                       |   2 +
 include/linux/mm.h                            |   2 +-
 include/linux/mm_types.h                      |   4 +-
 include/uapi/linux/prctl.h                    |   6 +
 kernel/sys.c                                  |  53 ++++
 mm/huge_memory.c                              |  13 +
 mm/khugepaged.c                               |  26 +-
 tools/include/uapi/linux/prctl.h              |   6 +
 .../trace/beauty/include/uapi/linux/prctl.h   |   6 +
 tools/testing/selftests/prctl/Makefile        |   2 +-
 tools/testing/selftests/prctl/thp_policy.c    | 286 ++++++++++++++++++
 12 files changed, 436 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/prctl/thp_policy.c

-- 
2.47.1

