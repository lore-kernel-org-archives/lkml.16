Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DBDF263F59
	for <linux-kernel@vger.kernel.org>; Wed, 26 Mar 2025 21:55:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743026150; cv=none; b=EHn6lEdjrj2iFgXulxAbF3yeU3Q3IKOhcB4GuNOi1nec55OqDhTHA5zLdx5xW/PAvvKOqlE2gSKE76vPQacx7ZGsrK+JkSB2wxrFEOIj5iZ1Lu/tEgwE7tHtQ4s8+Vc0RHbHBGJXylDAbK6CP+q4QKGy/LYB/0fGh5C3Epa9H7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743026150; c=relaxed/simple;
	bh=0sXoR9z11lwJIR8+MIdj/hTG8SCQ08AeJFyg47BT61Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HUVg1YWHs1oJHVCBKvS+DilEz5BCcUejRqP8zhqkxDTtHG75ktvZnYn78I3lpbpd4sBVI7y1ErftkFy54N0P6alFscPBZUs47jDAfO1IRwTr0iGX9dpBiEliHDMaxqrpnwWKRuDuNOziVV0kB8HNxdwpkowNtEA1Cu3oqFZMGgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pP55tpvv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pP55tpvv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AFBFC4CEE2;
	Wed, 26 Mar 2025 21:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743026150;
	bh=0sXoR9z11lwJIR8+MIdj/hTG8SCQ08AeJFyg47BT61Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pP55tpvv1GHY4e/QB8KhdhdgDbFpFZtpMoKNqVf387J4z3S16NddtN23qSscdDIUg
	 Ida2WgVVkRH1lvBJyeF86BfpIwY8UucAMx8SYmMGZYIX3up3jcQrT9aZkciy33kSgg
	 1eInqB4QPpOLW1iU8J/F4QAump1MOBr7oK5CiD3hwxRIED/IoXkAkPO1EA5KRwTFA3
	 APYyfVcD1tIteo372LNDrq5kO23P2/XMHLGuUUHnn22NaAStvAN/1EtR98mjx8NOvE
	 c8yS7GolF/PkafcoMWybTxf0cYq/EprC/t9nDp8ujusm3pSGo5lwZvhuPSowvgLaz/
	 fhATj9AWo16EA==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Dan Williams <dan.j.williams@intel.com>,
	Michal Hocko <mhocko@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Xu <peterx@redhat.com>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/4] MAINTAINERS: fixup USERFAULTFD entry
Date: Wed, 26 Mar 2025 23:55:38 +0200
Message-ID: <20250326215541.1809379-2-rppt@kernel.org>
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

Change title to "MEMORY MANAGEMENT - USERFAULTFD" and make it sub-topic
in memory management and add missing include/linux/userfaultfd_k.h and
mailing list

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a7a50dbb5044..c05b46732fe2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15200,6 +15200,19 @@ F:	tools/mm/
 F:	tools/testing/selftests/mm/
 N:	include/linux/page[-_]*
 
+MEMORY MANAGEMENT - USERFAULTFD
+M:	Andrew Morton <akpm@linux-foundation.org>
+R:	Peter Xu <peterx@redhat.com>
+L:	linux-mm@kvack.org
+S:	Maintained
+F:	Documentation/admin-guide/mm/userfaultfd.rst
+F:	fs/userfaultfd.c
+F:	include/asm-generic/pgtable_uffd.h
+F:	include/linux/userfaultfd_k.h
+F:	include/uapi/linux/userfaultfd.h
+F:	mm/userfaultfd.c
+F:	tools/testing/selftests/mm/uffd-*.[ch]
+
 MEMORY MAPPING
 M:	Andrew Morton <akpm@linux-foundation.org>
 M:	Liam R. Howlett <Liam.Howlett@oracle.com>
@@ -15220,17 +15233,6 @@ F:	mm/vma.h
 F:	mm/vma_internal.h
 F:	tools/testing/vma/
 
-MEMORY USERFAULTFD
-M:	Andrew Morton <akpm@linux-foundation.org>
-R:	Peter Xu <peterx@redhat.com>
-S:	Maintained
-F:	Documentation/admin-guide/mm/userfaultfd.rst
-F:	fs/userfaultfd.c
-F:	include/asm-generic/pgtable_uffd.h
-F:	include/uapi/linux/userfaultfd.h
-F:	mm/userfaultfd.c
-F:	tools/testing/selftests/mm/uffd-*.[ch]
-
 MEMORY TECHNOLOGY DEVICES (MTD)
 M:	Miquel Raynal <miquel.raynal@bootlin.com>
 M:	Richard Weinberger <richard@nod.at>
-- 
2.47.2

