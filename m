Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C63AD22126F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 05:01:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746507681; cv=none; b=FdlcV9CJ6mzJGPG52fuCLcBNM4dp2pfDK4pE1E9Y8HKkYrAJ7cRe5O3/AaNsi0h4QU8eaP3n43w/l0NSooJi48hVbvWri0A4MmxFK4CMOpi5UffgnuV2fGg1qI1sj+Gxq45HJsHwoHD8Qj4PmK6CSNBAhIZnSFfKjQvdceWTDdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746507681; c=relaxed/simple;
	bh=WhQGphGGXVkzuhFqkEicZ63k9LHumItMJjCC4nZHGyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=pJjmmSxLZV6UW8NIf+4hRHF/7JoWZz2PWWX1ugKYt6QBJNjstYDOE9965g+u6HC5htLkRHE6azoy64H4tOqGi7HJGkOHJINHuZp3UGujRL4M43Yr9F+iE46qDBpyW2MZynzFvJbJpuRLILp0hpSCo8nLaO4knSavee8Ml0NSP+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54B57113E;
	Mon,  5 May 2025 22:01:09 -0700 (PDT)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.43.13])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 8D4863F5A1;
	Mon,  5 May 2025 22:01:12 -0700 (PDT)
From: Dev Jain <dev.jain@arm.com>
To: akpm@linux-foundation.org
Cc: Liam.Howlett@oracle.com,
	lorenzo.stoakes@oracle.com,
	vbabka@suse.cz,
	jannh@google.com,
	pfalcato@suse.de,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	david@redhat.com,
	peterx@redhat.com,
	ryan.roberts@arm.com,
	mingo@kernel.org,
	libang.li@antgroup.com,
	maobibo@loongson.cn,
	zhengqi.arch@bytedance.com,
	baohua@kernel.org,
	anshuman.khandual@arm.com,
	willy@infradead.org,
	ioworker0@gmail.com,
	yang@os.amperecomputing.com,
	Dev Jain <dev.jain@arm.com>
Subject: [PATCH 0/3] Optimize mremap() by PTE-batching
Date: Tue,  6 May 2025 10:30:53 +0530
Message-Id: <20250506050056.59250-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use PTE batching to optimize mremap().

Mapping 512K of memory, memsetting it, remapping it to src + 512K, and
munmapping it 10,000 times, the average execution time reduces from 1.9 to
1.2 seconds, giving a 37% performance optimization. (Apple M3)

Dev Jain (3):
  mm: Call pointers to ptes as ptep
  mm: Add generic helper to hint a large folio
  mm: Optimize mremap() by PTE batching

 include/linux/pgtable.h | 16 +++++++++++++++
 mm/mremap.c             | 44 +++++++++++++++++++++++++++--------------
 2 files changed, 45 insertions(+), 15 deletions(-)

-- 
2.30.2

