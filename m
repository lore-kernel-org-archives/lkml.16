Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E20B22F173
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751144; cv=none; b=cB4X8nPhCqjEgJRtYKEkosrGLvkODfTY5hoW9N7GyDp4umzjeiBdGSxlqr50URIjrKrdZDODkUBLCxk2v5EhDK3LDPzJZH+aKd15WIPm2bDqfQ7CLDdi4O5e+qo+i1H7BmZhiQ/6RT8BtOoHZ/6bYaQXwrJyXLxf3d1z68+uj3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751144; c=relaxed/simple;
	bh=jkluaH4XEYEQte8xGB2hv1h2ykK+4gRIqt1RXfpWLbg=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type; b=dN+syEgdwPXpaOwNOFPxRGvoopIeamTVhQA4ZO9vOlUJmHpRArVtUIDcY9Ac1sGluLuYcaqrXQ+4AQyw4yFAUR6RiUwLN4sMzYIkm303Sis0GBFSU1J4slSUFtv9g1fzJ02F1gexZoeeoXHMQFG6aURdYqjAhJ/bpG6IE+g2jg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RBVWViR0; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RBVWViR0"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:MIME-Version:References:
	Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:In-Reply-To;
	bh=ae6cNYVBi7drCixIq97d0s/5QVUjP8FLagtyIO73Xkc=; b=RBVWViR07Kf9g8zQn/4BaWuRoR
	setm5JM/ZlhmOaZq79WO5hFJljs2/4PxLqmm9v8kQt+UmKgZ9WOY55MtR2zRhLbjuxiIooms6/P75
	BsZXD+YrMqu8jAQ8KNOp3qgyGX6ydVFY11P8Z8EDbf4Pl4uArzIthqZTmI5CGMKr0no1nyk5U0y9O
	NkD1SOE27z632qiAyrX76er/2CEtjz4Ctl77P8F5afTOWNKCbl9aI39xsNRxPnRsS5+ADIkxd+yU+
	0scqmYrQ/ox210VRUnNRcY3hnlcEOpIwv+ECnGzn3MIMTGYQEEWrWkGPq4RrdBeIkzwCBlKdsVnv5
	0SnLL1Ow==;
Received: from 77-249-17-89.cable.dynamic.v4.ziggo.nl ([77.249.17.89] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tfcb2-00000004GPR-2bak;
	Wed, 05 Feb 2025 10:25:28 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 0)
	id B0F703003E1; Wed,  5 Feb 2025 11:25:27 +0100 (CET)
Message-ID: <20250205102448.348146549@infradead.org>
User-Agent: quilt/0.66
Date: Wed, 05 Feb 2025 11:21:21 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: mingo@kernel.org,
 ravi.bangoria@amd.com,
 lucas.demarchi@intel.com
Cc: linux-kernel@vger.kernel.org,
 peterz@infradead.org,
 willy@infradead.org,
 acme@kernel.org,
 namhyung@kernel.org,
 mark.rutland@arm.com,
 alexander.shishkin@linux.intel.com,
 jolsa@kernel.org,
 irogers@google.com,
 adrian.hunter@intel.com,
 kan.liang@linux.intel.com,
 David Hildenbrand <david@redhat.com>
Subject: [PATCH v2 01/24] lockdep: Fix might_fault()
References: <20250205102120.531585416@infradead.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8

Turns out that commit 9ec23531fd48 ("sched/preempt, mm/fault: Trigger
might_sleep() in might_fault() with disabled pagefaults") accidentally
(and unnessecarily) put the lockdep part of __might_fault() under
CONFIG_DEBUG_ATOMIC_SLEEP.

Cc: David Hildenbrand <david@redhat.com>
Fixes: 9ec23531fd48 ("sched/preempt, mm/fault: Trigger might_sleep() in might_fault() with disabled pagefaults")
Signed-off-by: Peter Zijlstra (Intel) <peterz@infradead.org>
---
 mm/memory.c |    2 --
 1 file changed, 2 deletions(-)

--- a/mm/memory.c
+++ b/mm/memory.c
@@ -6695,10 +6695,8 @@ void __might_fault(const char *file, int
 	if (pagefault_disabled())
 		return;
 	__might_sleep(file, line);
-#if defined(CONFIG_DEBUG_ATOMIC_SLEEP)
 	if (current->mm)
 		might_lock_read(&current->mm->mmap_lock);
-#endif
 }
 EXPORT_SYMBOL(__might_fault);
 #endif


