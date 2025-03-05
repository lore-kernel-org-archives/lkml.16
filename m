Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BEDB620764E
	for <linux-kernel@vger.kernel.org>; Wed,  5 Mar 2025 10:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741170130; cv=none; b=emmFf7sZFVCk/Z00V3hGXKvznhO+5PPGzP1JIoruXvx0MPK2rGoWJ6GNLd0sK/LhidFtkcLNXEjlQzkFGzH+7lB0hBMO30QqHElzAjCywyIPKWj4FWidwnoLB2NeuJV5r19Wdjny/uSI8SqBjHoxEjSEdVHMNAm1u6WIAq+RXOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741170130; c=relaxed/simple;
	bh=C0JABhWR983FS7mWfgvjkH5bTJkNJTAxdw3DVxqtXc4=;
	h=From:To:Subject:Date:Message-Id:MIME-Version; b=K4tryHrecgDWTHDND/8odkrdItrDys3uAKwnJQQEe/7AdZodkkEZiUCKa7G72hVnaD0K42L5839Ed1aIuQy/slV+iNcaDRNgUwBR6p39zj7UmQ+owgEUwjNFe6IACjpVwLelIPODp9tJ4P9rn87oszmwtiy65g94mFdA8X3ZFq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 84253FEC;
	Wed,  5 Mar 2025 02:22:21 -0800 (PST)
Received: from K4MQJ0H1H2.emea.arm.com (K4MQJ0H1H2.blr.arm.com [10.162.42.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1FC623F673;
	Wed,  5 Mar 2025 02:22:04 -0800 (PST)
From: Dev Jain <dev.jain@arm.com>
To: david@redhat.com,
	willy@infradead.org,
	ziy@nvidia.com,
	hughd@google.com,
	ryan.roberts@arm.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [QUESTION] Plain dereference and READ_ONCE() in fault handler
Date: Wed,  5 Mar 2025 15:51:59 +0530
Message-Id: <20250305102159.96420-1-dev.jain@arm.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In __handle_mm_fault(),

1. Why is there a barrier() for the PUD logic?
2. For the PMD logic, in the if block, we use *vmf.pmd, and in the else block
   we use pmdp_get_lockless(); what if someone changes the pmd just when we
   have begun processing the conditions in the if block, fail in the if block
   and then the else block operates on a different pmd value. Shouldn't we cache
   the value of the pmd and operate on a single consistent value until we take the
   lock and then finally check using pxd_same() and friends?

Thanks,
Dev

