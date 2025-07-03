Received: from smtpout.efficios.com (smtpout.efficios.com [158.69.130.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91662DE6F8
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 15:24:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.69.130.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751556294; cv=none; b=jBiU9t0nKfa+at12a4vGH8PMnaw8JziXZp6bf5nPCAGaMqp7xDZeNRK8yioPJVEKJJ+mt3CsCvGfYxzBpU5tLoda1yEmGSIwOHENJ6m4ejy8NgwQvbya7j6UeVPgIR1XMzmUrbHRgFkJRbQwBttRFhWP6gBIlmBAESHcFYTFt9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751556294; c=relaxed/simple;
	bh=nimh2wrjzwUAubhNUrY5HI4y+sVu3X6UHelg6hWX5Iw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TlHEgWiaYEIzYIZPPm2fbhtGyUYDMOAkDqhjy073VOw3H8wQ04xPG/jXfrs7dygcsJEV22jj0LptIpFfwJYrjzH1QqkB1cVwtBYlOlL2s5qxmSbaId0/dF5c7zRqXMDnNkfDDb3h88sqb9xOfkxv/nCPA+uIY/5sx/yvCzqGVgs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com; spf=pass smtp.mailfrom=efficios.com; dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b=FO7Aq2Cl; arc=none smtp.client-ip=158.69.130.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=efficios.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=efficios.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=efficios.com header.i=@efficios.com header.b="FO7Aq2Cl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=efficios.com;
	s=smtpout1; t=1751555897;
	bh=nimh2wrjzwUAubhNUrY5HI4y+sVu3X6UHelg6hWX5Iw=;
	h=From:To:Cc:Subject:Date:From;
	b=FO7Aq2ClsUX1EoSVIZCdxcOBGyeAP0Q8vbYOBVli0RT+wf3JQSe8U+kVT3Q0HoDmQ
	 Pp4lPVGsJYT5CM9ZpogZHN9j5gyw5Bh+EXs+NuKPaNZhiYMSxxzJqgjBpQgrlVf2hZ
	 VIJM4iPRuu1zWClibnKE6m1Ew7NZ5KE+3t5FTtLfA1hEHneKXim9m1yfU9F7il7Tu4
	 0wooZEVwet5xwEYt5KVP9HfxS4e4X6t1Deivm4bnmkviPNq7GOb65BhgjQ00JBnanE
	 0XKCVz9vklRpkVByfo9h6QsG0qor6Ny1pBmTHGU4in6FfSipr1RhfsLF//Z6k6iTeC
	 DJZFJHZq8WJeA==
Received: from thinkos.internal.efficios.com (192-222-132-26.qc.cable.ebox.net [192.222.132.26])
	by smtpout.efficios.com (Postfix) with ESMTPSA id 4bY0lF4Lhhz1Mhg;
	Thu,  3 Jul 2025 11:18:17 -0400 (EDT)
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org
Subject: 
Date: Thu,  3 Jul 2025 11:18:14 -0400
Message-Id: <20250703151816.9786-1-mathieu.desnoyers@efficios.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From 8b020924c24dd1d0914ab04961b15ac040e59b70 Mon Sep 17 00:00:00 2001
From: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Date: Thu, 3 Jul 2025 11:14:45 -0400
Subject: [RFC PATCH v4 0/2] mm: Fix OOM killer inaccuracy on large many-core systems

Introduce hierarchical per-cpu counters and use them for rss tracking to
fix the per-mm RSS tracking which has become too inaccurate for OOM
killer purposes on large many-core systems.

The approach proposed here is to replace this by the hierarchical
per-cpu counters, which bounds the inaccuracy based on the system
topology with O(N*logN).

Testing and feedback are welcome!

Thanks,

Mathieu

Mathieu Desnoyers (2):
  lib: Introduce hierarchical per-cpu counters
  mm: Fix OOM killer inaccuracy on large many-core systems

 include/linux/mm.h                  |   8 +-
 include/linux/mm_types.h            |   4 +-
 include/linux/percpu_counter_tree.h | 108 ++++++++
 include/trace/events/kmem.h         |   2 +-
 kernel/fork.c                       |  31 ++-
 lib/Makefile                        |   1 +
 lib/percpu_counter_tree.c           | 393 ++++++++++++++++++++++++++++
 7 files changed, 530 insertions(+), 17 deletions(-)
 create mode 100644 include/linux/percpu_counter_tree.h
 create mode 100644 lib/percpu_counter_tree.c

-- 
2.39.5
