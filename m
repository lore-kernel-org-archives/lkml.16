Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E93CC221264
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 09:33:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745487188; cv=none; b=AAxTNcMfcXH0PmcSerIR8yk0LdioGnvkPmfLxNo6chMx5fGs41ygxPQf2R7UcDv6Nz7yVUT24UDGwPHmBTcrMe32ExOFBbOYm5XqeyrV2J23T5noGeQuQhItZWeBGKBhvX20eShQBzeJMp98hj7TnlTznANvTutOEFvHcktUK6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745487188; c=relaxed/simple;
	bh=556K0EU4/QwmbQP9W77wsip/egh64QVcPFAANCXUnAg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UGwAZzxH1MdR66E81oZfTOfFplSmVLC9zvlM2nBQ/4aU1TGP/E4ozQ8LXZUMyI+vigvUS2mVT7H0Pnj6CF0V98GBw0oJAis0RttKsU2dNk4jngb2Qqm4g6myD2JAt2amP88CSeC/5utQ8Z2Bpv4W7xpDl1jUNCUpkP0USayIkZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atsnuI3X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atsnuI3X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9258EC4CEE3;
	Thu, 24 Apr 2025 09:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745487186;
	bh=556K0EU4/QwmbQP9W77wsip/egh64QVcPFAANCXUnAg=;
	h=From:To:Cc:Subject:Date:From;
	b=atsnuI3XSBH/2KFZ4LUT9PZLMlLlFPFXcfB1x6Mjo5zl3sKH9Pn6PwEThU5/aPYY+
	 izj+ItP8V26CFynq+XrD2jFmC2Fa4XBeYlekja4M1TJdpba/+3NrMM9ArTGHEKfIeu
	 p8fLotOrNS9543P40hTcS6hjn6r6l2Vbq7GFA6QXlXhb/anwvYYWjZ7HcMgQHa7gPK
	 3sAtEqbvrtPv8TY+cb/ZvItcGcr8aH14PNiHydjcXr1HIIvnHsWJ2HzlNnUYOWFNxa
	 aiSwosIiO4Ew7UdQJ9p1jrYYZMEGeoaGOQmCAdNMknfY97dAFEEU00qhPT1KqAOS7p
	 gMfT5T4C6H5+g==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>
Cc: Simon Horman <horms@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] [v2] kexec: include asm/early_ioremap.h
Date: Thu, 24 Apr 2025 11:32:56 +0200
Message-Id: <20250424093302.3894961-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

The early_memremap() function is decleared in a header that is only indirectly
included here:

kernel/kexec_handover.c:1116:8: error: call to undeclared function 'early_memremap'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
 1116 |         fdt = early_memremap(fdt_phys, fdt_len);
      |               ^

Fixes: ceef8de6a481 ("kexec: add KHO parsing support")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
v2: change 'Fixes' tag to the correct patch.
---
 kernel/kexec_handover.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/kernel/kexec_handover.c b/kernel/kexec_handover.c
index 4bbc6f5ef723..3e8a0118e182 100644
--- a/kernel/kexec_handover.c
+++ b/kernel/kexec_handover.c
@@ -18,6 +18,9 @@
 #include <linux/memblock.h>
 #include <linux/notifier.h>
 #include <linux/page-isolation.h>
+
+#include <asm/early_ioremap.h>
+
 /*
  * KHO is tightly coupled with mm init and needs access to some of mm
  * internal APIs.
-- 
2.39.5

