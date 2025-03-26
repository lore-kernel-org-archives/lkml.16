Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBEE0264FAE
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026158; cv=none; b=c5pPOVLvsYZF4stcb0eOk15mUkgc0wkWRJNsB01slH/T/qjIejYzoMUNVsDhvt5O4An5eNLsGA0pW1QB0C30vuaAyKf+YVFS2IvOj0y/iK0j036+84F8T/IAyVLIVstrQpooAWFXntnbTBzGoQhShIEMJtMkbpd07b373GEDI0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026158; c=relaxed/simple;
	bh=/wl5mv0P6SicGkmS9UB05MMQjCKZA3KBnf+P3Gic6hk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fufCNGDjdWHE+dYWAebcwAWOTqYsed+nqULjySj6Pn9Gzcf8vilgTQbYNUVkgL094IM33ME9+I9tbEa9JNwUTPG2h2RWfklKkzXdgYM4Qi/+BpNYzex069m+rp0y936KG24Nusq95mHHdL/zRXKvTvOo1JkzVRkShn9EdmF0RhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6xHN67M; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6xHN67M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 751C4C4CEED;
	Wed, 26 Mar 2025 21:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743026157;
	bh=/wl5mv0P6SicGkmS9UB05MMQjCKZA3KBnf+P3Gic6hk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W6xHN67MzzGrD8xstgl/imo7G9ZP+0QaNz5OowUpWXukDgjR5foFlyr5G0wyUJhWz
	 fvrJTMEoe42j/iZFSSgTSiMY4Ltxx8/QYMpvTky93Djl6wT0qsqsZqvewt+kz9YXoT
	 N8peYZNtWs5TxSlmd55pErLsTLTfeV4ryfUJkvLugwV6xrko0qFHNFa8zLcsGwBJ7n
	 aEdKY2CUpXmiS57J/PaIKS/4Kbtgmum0V/XPrD6L/uAoSkWEBFyCQppP789LfHYs3O
	 1tY5QgMue9XXJ+xJ84rnTcyS6x8jRszEc/6ZypkyrUPqdlK4Od2ybbkhoIBwrLTxQZ
	 QaTQaMUtXf7bQ==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/4] MAINTAINERS: mm: add entry for secretmem
Date: Wed, 26 Mar 2025 23:55:41 +0200
Message-ID: <20250326215541.1809379-5-rppt@kernel.org>
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
 MAINTAINERS | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882fa62bcb28..e3dfc4c34086 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15218,6 +15218,14 @@ F:	mm/numa.c
 F:	mm/numa_emulation.c
 F:	mm/numa_memblks.c
 
+MEMORY MANAGEMENT - SECRETMEM
+M:	Andrew Morton <akpm@linux-foundation.org>
+M:	Mike Rapoport <rppt@kernel.org>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	include/linux/secretmem.h
+F:	mm/secretmem.c
+
 MEMORY MANAGEMENT - USERFAULTFD
 M:	Andrew Morton <akpm@linux-foundation.org>
 R:	Peter Xu <peterx@redhat.com>
-- 
2.47.2

