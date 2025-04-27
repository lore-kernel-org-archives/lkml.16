Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FCA81A3145
	for <linux-kernel@vger.kernel.org>; Sun, 27 Apr 2025 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745748294; cv=none; b=qYwqhyVQX/rNIbPuOkdKJ9qq3D7vMOAR3I3KIDYW2Iv8zF3Utc5BqdKxw2j8hbyDz1SqfyaR17CMcDy1M2Ql84rok/HcOslqQfYqAM1+yqtYkmDFwm4OXBVGIIlswcjVxIVdV8KN/K//TnecgcVYx0u92fJ/H2uEckFubNp7u9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745748294; c=relaxed/simple;
	bh=c9UqvVJ2/MCwfV5zHOTMwYiiXbKeScmps3lkPQjrlVE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=o8qZ9Efoiwf65VCqZlXS7hVJF1FYjhFnTUWztn21jO6Elcqt9nvXhYRV/FbWokmZMJSC5PyQR6vsBGS+2P8Mu5K89iM5J37sBnaOLoH8NecyCd6eHR3dyMWCWsC6T46epMY8PJIvPqNAVgSALqpgHwL7yVejFzRe3HqnPTKR0O8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=RZ2UX+N9; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="RZ2UX+N9"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745748289;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=4EzL0gg/ZOMcD64AXocynJGMI3aJnHhcWM7AS860QNo=;
	b=RZ2UX+N9vyQgPJL2SnGB91RBsqWrw6PuCcuw9Y3kiQphG+BaeZVLw2JCKhtIWoTBZWDsFB
	s4roRYTc1aoaCNM51jP3RbqSgxqSLTt0sVzUFOtOG6/29lGDW8I3VdiOXy7PQ3+oOfwhHK
	IulEnz/Xax9PV6PgMYX3hUXEiAUVpRY=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	rppt@kernel.org,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	david@redhat.com,
	harry.yoo@oracle.com,
	riel@surriel.com,
	vbabka@suse.cz,
	liuye@kylinos.cn,
	ye.liu@linux.dev
Subject: [PATCH 0/3] mm: small cleanups for io-mapping, debug_page_alloc and numa
Date: Sun, 27 Apr 2025 18:04:39 +0800
Message-Id: <20250427100442.958352-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

This series includes three small cleanups to mm/:

- io-mapping: simplify remap protection flag calculation
- debug_page_alloc: improve error message by printing invalid input
- numa: remove unnecessary variable for clarity

No functional changes.

Ye Liu (3):
  mm/io-mapping: precompute remap protection flags for clarity
  mm/debug_page_alloc: improve error message for invalid guardpage
    minorder
  mm/numa: remove unnecessary local variable in alloc_node_data()

 mm/debug_page_alloc.c | 2 +-
 mm/io-mapping.c       | 7 ++++---
 mm/numa.c             | 4 +---
 3 files changed, 6 insertions(+), 7 deletions(-)

-- 
2.25.1

