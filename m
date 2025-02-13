Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 98CAC2063FD
	for <linux-kernel@vger.kernel.org>; Thu, 13 Feb 2025 04:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739419790; cv=none; b=TNj6DNf9nWx3JR0pWqXUk+pyWnXqikJldsv4B8cg/XwhG6QV75pcY0TUTLNeRN1B3yy1NYBXlGEgm3fQUwPuJ5t66mB1VegozevfU1UbxS+P/x1KMURrdxiVKks3a3dLoNzUIFVpx92e49MkIKPZAD3LmmNIIm7+RlQENbfLG/c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739419790; c=relaxed/simple;
	bh=gAjYa2loiYOQDDtfqqOeBDMNOulNnJUyC6hS8qEctOY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f5V2MsCA27lOOA7Huj9WGtrHVv0CCMunpeGjsLv9nPzkR+scLHfda5rH8NYYeaqDtDpYXZFBBpTbdpCaMrrPrYI/Stlwtmj3ws4DqIu2icMXgLkBKi0L2JMLCoycn4QoG2pZoT1fQDIJA3da/ecPKX/dU7oYzJL0/1xUabfSXR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A49851762;
	Wed, 12 Feb 2025 20:10:08 -0800 (PST)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.135])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id C55293F58B;
	Wed, 12 Feb 2025 20:09:45 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: steven.price@arm.com,
	christophe.leroy@csgroup.eu,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] mm: Make DEBUG_WX depdendent on GENERIC_PTDUMP
Date: Thu, 13 Feb 2025 09:39:32 +0530
Message-Id: <20250213040934.3245750-3-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250213040934.3245750-1-anshuman.khandual@arm.com>
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DEBUG_WX selects PTDUMP_CORE without even ensuring that the given platform
implements GENERIC_PTDUMP. This problem has been latent until now, as all
the platforms subscribing ARCH_HAS_DEBUG_WX also subscribe GENERIC_PTDUMP.

Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 mm/Kconfig.debug | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/Kconfig.debug b/mm/Kconfig.debug
index 41a58536531d..a51a1149909a 100644
--- a/mm/Kconfig.debug
+++ b/mm/Kconfig.debug
@@ -186,6 +186,7 @@ config ARCH_HAS_DEBUG_WX
 config DEBUG_WX
 	bool "Warn on W+X mappings at boot"
 	depends on ARCH_HAS_DEBUG_WX
+	depends on GENERIC_PTDUMP
 	depends on MMU
 	select PTDUMP_CORE
 	help
-- 
2.25.1

