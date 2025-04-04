Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D590028E8;
	Fri,  4 Apr 2025 10:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760931; cv=none; b=F6OGcih7EDIr6BYSZa+cRI1hNnEiIiqA0uGZHq1u26Fq4X1nyn8pK+UVNQ6EYwLVNgDKuDJ0Zjt457gd3alXFo+ZZziKL/4gVtukKT61jVsthLV6b/G/28FgW0vMlqv4JOP9O9ABSh5mVsDM+OfvY5fd23sgdwlnWB18YLQchfU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760931; c=relaxed/simple;
	bh=P44W9TBGYIy4COeX6ERDCkoQDNPOwf+Tl23i3YbjigY=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KGfg3Yn6+Z8+0AWYETq+kSwkNhAXj8OHLHInPDYYsHyfYxwFDsqRQZryWcuAidqyuQFDORlWkf3RnXwXXEa/WE3qVQc7ibn9L9fAw+RUUyLGgK4uwZV00+R3MpZ3t5qKYVkMfCn2UP/BrHZYB5dClQ4TMXp2u+WkdsnPTvQOa2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com; spf=pass smtp.mailfrom=pankajraghav.com; dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b=u76ELoMr; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pankajraghav.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pankajraghav.com header.i=@pankajraghav.com header.b="u76ELoMr"
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4ZTYzt6cgQz9tCZ;
	Fri,  4 Apr 2025 12:02:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pankajraghav.com;
	s=MBO0001; t=1743760923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wvXgALw2/FTOtjQUvzA4jCqzPQ7Rl7E6ZuhC+iHmpwg=;
	b=u76ELoMrB6xfInI/m7JESNTnB7GEtCoxFD/JFUFk5iTlsRA1y00Arn/FTsvg3XJpbT+853
	4OH1GoGWZ6DpsofTMmNQqNc/nBrFUi7t8ngfZS4ZHw9AH3f1rV9qRVd8dyWax15EaH528B
	aac2iAPt9K3CjDq8K+tYhH/7Jpz3YurJjE+UC9cv4AFy4F0QCy1O9HVQpoASTJZSg9E201
	Or9apWJ9gNviuVmXQq/u4P/V8AdACFVh8AXYLi1xhUoruS4HRoXV54VOHGtymGPnROv9oO
	WVTQdWXEyjZrPS5cXMKndL3kMVmamgcvGg6uwlCx5phkPL/oKnf3AhGqEymwng==
From: "Pankaj Raghav (Samsung)" <kernel@pankajraghav.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	willy@infradead.org,
	David Hildenbrand <david@redhat.com>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	da.gomez@kernel.org,
	mcgrof@kernel.org,
	gost.dev@samsung.com,
	linux-doc@vger.kernel.org,
	kernel@pankajraghav.com,
	Pankaj Raghav <p.raghav@samsung.com>
Subject: [PATCH v2 0/2] update thp admin doc
Date: Fri,  4 Apr 2025 12:01:57 +0200
Message-ID: <20250404100159.27086-1-kernel@pankajraghav.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 4ZTYzt6cgQz9tCZ

From: Pankaj Raghav <p.raghav@samsung.com>

Update the THP admin doc about non-tmpfs filesystem support and clarify
certain variables for clarity.

Changes since v1:
- Added RVB from Bagas Sanjaya
- Expanded on ShmemHugePage, ShmemPmdMapped and FilePmdMapped based on
  the feedback from David

Pankaj Raghav (2):
  docs: update THP admin guide about non-tmpfs filesystem support
  docs: clarify THP admin guide about (File|Shmem)PmdMapped and
    ShmemHugePage

 Documentation/admin-guide/mm/transhuge.rst | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)


base-commit: f0a16f5363325cc8d9382471cdc7b654c53254c9
-- 
2.47.2

