Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E09E264F8C
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:55:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026155; cv=none; b=nqgLMM+DpdqcMq/tZh8EcVSDpEOMFDOAwvE1GmWAeRz4QndxqulRQpcnGOF8ehPcNd1Amivzgs9xN/gIsUcjoPe29+HIIqhnxqUIyLyi7R1Ce/RAumICY8Y4C21B8nFOFo3v9SRtZKOJ++xbtHLo2RjB24vl//l8QhjBqlrjOBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026155; c=relaxed/simple;
	bh=Rm0pSLzGDttp6pRIj+5Mmw/lG8TrofiU0Ov8yG4KxXw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dm4F5dhiSwiqmm4aGhJpcBjtw39w3B37V8h7yXbEOXCb4I2zJpLHS5k5jbb5bcPD5zMBSJYFoA9Bd9RiCK9RAYbqs83v/vVBMiJ6x2Raqafr0NDGnHqBzqJuz7bYRIL3YyEOZcJxqRzEeXbnj8gVtUULh44zYIwUOX9/nPc0C/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fDip3NNb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fDip3NNb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091D6C4CEE5;
	Wed, 26 Mar 2025 21:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743026154;
	bh=Rm0pSLzGDttp6pRIj+5Mmw/lG8TrofiU0Ov8yG4KxXw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fDip3NNboEON8k6fKYuyrEEGy67eMFDcevrDcfpdrQr+elwsN+580PO8uw3B6uZst
	 9wJRsFrvefRVKMoa6OiA4JDBnFmAGbustua/wz3S46qMvl3shhmFK10rLgNwcUW9p2
	 DUnoVs4WXCLrA/DOIN2HkOXvkaQFyYmLVlW4QtctaUtqoM4nBWp4ZASM3//j1AlVvs
	 OfB+q19qxS7p+GLdVJyphQynXHdv+QocuZiDExvxItQK2ACDzlDRuI1lQOJecB/v84
	 uI2ktYBmr2QcX8/1/sR33ob/+0Gu+enBdUx7E/z/GIa9fNgCECMlsQE/6WlqlTOQPO
	 VoEqwx1d411HA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] MAINTAINERS: mm: add entry for numa memblocks and numa emulation
Date: Wed, 26 Mar 2025 23:55:40 +0200
Message-ID: <20250326215541.1809379-4-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250326215541.1809379-1-rppt@kernel.org>
References: <20250326215541.1809379-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index baff55807a65..882fa62bcb28 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15208,6 +15208,16 @@ S:	Maintained
 F:	include/linux/execmem.h
 F:	mm/execmem.c
 
+MEMORY MANAGEMENT - NUMA MEMBLOCKS AND NUMA EMULATION
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Mike Rapoport <rppt@kernel.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/numa_memblks.h
+F:	mm/numa.c
+F:	mm/numa_emulation.c
+F:	mm/numa_memblks.c
+
 MEMORY MANAGEMENT - USERFAULTFD
 M:	Andrew Morton <akpm@linux-foundation.org>
 R:	Peter Xu <peterx@redhat.com>
-- 
2.47.2

