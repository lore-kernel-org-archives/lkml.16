Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEC6920E330
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 06:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748931309; cv=none; b=Actoda+U67r6adGI6lNhc89uPuHy+u3kCvNMiM6apZQQi89C5TBKT3sFhP7MsnMFHolhiriy5OYkQLhY1l/2slBsU7hJR95Wqia63nddsQfdkJiHEQ3nsxjnlkATZOeAaRjceJ+gS03bQ1MMVrPVhRVwgxsRQf1FWpAFehzMPqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748931309; c=relaxed/simple;
	bh=1Ea9a0evHerWA9sQo7KubQ3sXTMJTQmuVWo8mtMj5yA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KCk4MySNwnQgJoFIvm1ETIOE0U9a6zq9tufjtdnaLPxHaKJP2p8dRJyAmRCuCJuFYnfO3Dw2r7o+lAjbzqRoIbfSZpBV7WjAOIXv8ZmrspeeRnyNgC2BmueKnmXYkjRE8mw/QDvZo91qGfVSR2+e0LF2OB5VP47o/ETcqTfvED0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from abreu.mpip-mainz.mpg.de (guest-wlan-ext.mpip-mainz.mpg.de [194.95.63.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id D4F7661E647A7;
	Tue, 03 Jun 2025 08:14:18 +0200 (CEST)
From: Paul Menzel <pmenzel@molgen.mpg.de>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Zi Yan <ziy@nvidia.com>,
	Juan Yescas <jyescas@google.com>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] mm: Kconfig: Use verb *use* in plural form in description
Date: Tue,  3 Jun 2025 08:13:03 +0200
Message-ID: <20250603061303.479551-2-pmenzel@molgen.mpg.de>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

*workloads* is plural requiring the verb *use* in plural form.

Fixes: e13e7922d034 ("mm: add CONFIG_PAGE_BLOCK_ORDER to select page block order")
Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
---
Reading the sentence it feels like, something is missing before the
*please*, but I am no native speaker.

 mm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index f8bb8f070d0d..e3a07687ed0b 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1022,7 +1022,7 @@ config PAGE_BLOCK_ORDER
 	  or MAX_PAGE_ORDER.
 
 	  Reducing pageblock order can negatively impact THP generation
-	  success rate. If your workloads uses THP heavily, please use this
+	  success rate. If your workloads use THP heavily, please use this
 	  option with caution.
 
 	  Don't change if unsure.
-- 
2.49.0

