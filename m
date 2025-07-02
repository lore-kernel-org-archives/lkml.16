Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45F92561AE
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:49:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751453378; cv=none; b=cU6+3wbYxZGqnXMGKiMWIgnS0WrGaJSM1f7zb/cMXfhFbokqEruYQkz1JlVxrp/WWILDpoUEDR61nWlIazJOGOF/IKaD2fhH6bnGlTvdOxIHUDhjeswRGc+AWY6WJN/emUJz6l+2mP8T+o9A7/Oc58IaKkFEZrIARGO0m6NTrBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751453378; c=relaxed/simple;
	bh=BB2wl0R+XZaxOZPcvq2RzY3AmFLq0gyiEYcy9U4FCFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FZYCLFxZCOCdVV+0xfv2G/rVc4l/AQD+nCNeAWv5x4EIpKuT8HeFvrKNGRCvFrcX3M7tIhtfwQUoNEoonc+Ldi1C3cLi+uG2tjz+Y/6P945gzAe+MOddb9vVqLscYBLX/Q81gYQNNmP0PlnDJ58RHBEfVRVekhux7E4TEaOVfbU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VyfTXJ3c; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VyfTXJ3c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751453373;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Oa8CuK3lKLwHxss7ndJU3sMoB9BY9Ik1zqSGHV471bc=;
	b=VyfTXJ3cOgFJXQ6F4qGRxUzwPy+T25aiMUPxJQ3tDq6XIFXEJN7TOHngcYEqGkNCW4fFYx
	RbrwzjZaWYEX/Y1yiHJXYJRdZYceV+KxC5flWjFNaS7o1SOs4d7OKPh8gHpuIr9ikkucvp
	i5r9A+4TAh06YtbKkS9TGYNpozBUVak=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-589-bbf16F84Mei1OidXDCGvSQ-1; Wed, 02 Jul 2025 06:49:30 -0400
X-MC-Unique: bbf16F84Mei1OidXDCGvSQ-1
X-Mimecast-MFC-AGG-ID: bbf16F84Mei1OidXDCGvSQ_1751453369
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-450d64026baso36060345e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:49:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751453369; x=1752058169;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oa8CuK3lKLwHxss7ndJU3sMoB9BY9Ik1zqSGHV471bc=;
        b=QF+/Dvv9UZo2unBZ26yMOwKTyJc4ez4euVyE4+eFIOVDpI0Q1KpRgX//3y6/ks69ww
         lUppIVCZSy6/lOuLiI96Hzc6eehT8cG84JH/k8qE++IkzFiMIzScJrF17qshMR8KN1jB
         XF8SOuFp1T+Z+rZD9zWyqi8CJpdCTPcl7pGwl+0BMmHd/cDz91e9Xoy6TvLNrEnJhp0M
         e083gfM7AQmVOelr8xOW+1llND9z5aMRsklfJbPS6jO7kwRBC7ZRp3tj2ysud+6ccBLz
         2rRLDSG0gMl6L6JWat6355RE7mmGvUtqp9XjPdd2S0o9mjmbsYUk5Lpvu8QB4ON2GoIk
         FVbw==
X-Gm-Message-State: AOJu0YyGZ5DQfuKeWc6bAVnckcKzsvqft7xgfrHq1F/cHGT7tXtyu44L
	AF7WLwEfhNHUH+mK19AS8uzcFR9uwj90TtPXYVk2/i18sq/b27W5kG3iBZN1olQiyvguMtIbD37
	aa8ft3KVtszKgyH1OTDvxfuA5I8P52G+PkoZBhCe7HyeWZ4errlsFQeTjKojIBsaR/VumX/mhzy
	oGWGcejXVqJdgCbM91UKvangZWCrvD+MrZHhCbjNvooOccUk5J
X-Gm-Gg: ASbGncu6/lxpuQ0O7UmYOR1FhqFSbNfaVWNYIXyr3LQDTUBjFMX3ernNSWj832wQxHe
	f4tQhGN1PnTNsllFTy+Ji2y8lXR3UUXNCDdQ6Idh0hHyVRRcxyP+7t0VF4mCjjRJ8IFcfo4Gdhw
	u2kIjGLrYKpqCOEHOYq6tf6K8wOR1fqqQTMZQpMflKsbSTfoI2pUnkv7pdz6pII5cGoDGM+Kd1V
	U9i8cujLPXMQm8oyJQmYX2OJYl7gPlFQFQpHUMW8KhMcTJiwD83ySdSXqCYsrmGJF4beZnTgs3Q
	ycOvTqnxP4WHn6dV
X-Received: by 2002:a05:600c:5249:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-454a3731fdbmr28428295e9.30.1751453369356;
        Wed, 02 Jul 2025 03:49:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1V4gpMqvZ+DPfmB/raMjVhoKNE0BKdAfmWSWxZQksD9hYccIlEA+BHl6OVZGVgABGV7TxMg==
X-Received: by 2002:a05:600c:5249:b0:441:d4e8:76c6 with SMTP id 5b1f17b1804b1-454a3731fdbmr28427665e9.30.1751453368795;
        Wed, 02 Jul 2025 03:49:28 -0700 (PDT)
Received: from localhost ([2a09:80c0:192:0:5dac:bf3d:c41:c3e7])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-453823b6d50sm227734495e9.30.2025.07.02.03.49.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 03:49:28 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org,
	David Hildenbrand <david@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Jann Horn <jannh@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Matthew Brost <matthew.brost@intel.com>,
	Joshua Hahn <joshua.hahnjy@gmail.com>,
	Rakie Kim <rakie.kim@sk.com>,
	Byungchul Park <byungchul@sk.com>,
	Gregory Price <gourry@gourry.net>,
	Ying Huang <ying.huang@linux.alibaba.com>,
	Alistair Popple <apopple@nvidia.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Rik van Riel <riel@surriel.com>,
	Harry Yoo <harry.yoo@oracle.com>,
	Lance Yang <ioworker0@gmail.com>,
	Oscar Salvador <osalvador@suse.de>
Subject: [PATCH v2 0/4] mm: folio_pte_batch() improvements
Date: Wed,  2 Jul 2025 12:49:22 +0200
Message-ID: <20250702104926.212243-1-david@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ever since we added folio_pte_batch() for fork() + munmap() purposes,
a lot more users appeared (and more are being proposed), and more
functionality was added.

Most of the users only need basic functionality, and could benefit from
a non-inlined version.

So let's clean up folio_pte_batch() and split it into a basic
folio_pte_batch() (no flags) and a more advanced folio_pte_batch_ext().
Using either variant will now look much cleaner.

This series will likely conflict with some changes in some
(old+new) folio_pte_batch() users, but conflicts should be trivial to
resolve.

Tested on x86-64. Cross-compile tested.

v1 -> v2:
* Use FPB_RESPECT_* instead of FPB_HONOR_*
* Use folio_pte_batch_flags() instead of folio_pte_batch_ext()
* Improvements to patch descriptions + comments/doc

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>
Cc: Jann Horn <jannh@google.com>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Zi Yan <ziy@nvidia.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Joshua Hahn <joshua.hahnjy@gmail.com>
Cc: Rakie Kim <rakie.kim@sk.com>
Cc: Byungchul Park <byungchul@sk.com>
Cc: Gregory Price <gourry@gourry.net>
Cc: Ying Huang <ying.huang@linux.alibaba.com>
Cc: Alistair Popple <apopple@nvidia.com>
Cc: Pedro Falcato <pfalcato@suse.de>
Cc: Rik van Riel <riel@surriel.com>
Cc: Harry Yoo <harry.yoo@oracle.com>
Cc: Lance Yang <ioworker0@gmail.com>
Cc: Oscar Salvador <osalvador@suse.de>

David Hildenbrand (4):
  mm: convert FPB_IGNORE_* into FPB_RESPECT_*
  mm: smaller folio_pte_batch() improvements
  mm: split folio_pte_batch() into folio_pte_batch() and
    folio_pte_batch_flags()
  mm: remove boolean output parameters from folio_pte_batch_ext()

 mm/internal.h  | 117 ++++++++++++++++++++++++++++---------------------
 mm/madvise.c   |  27 +++---------
 mm/memory.c    |  21 +++------
 mm/mempolicy.c |   5 +--
 mm/mlock.c     |   4 +-
 mm/mremap.c    |   4 +-
 mm/rmap.c      |   4 +-
 mm/util.c      |  29 ++++++++++++
 8 files changed, 112 insertions(+), 99 deletions(-)


base-commit: 01136079697c6686e7198bf1797c004767ecf6f1
-- 
2.49.0

