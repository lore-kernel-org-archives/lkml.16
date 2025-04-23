Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37D84280CFF
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 16:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745425769; cv=none; b=hl8hBBStCEah5rYnp4IFpc1m/8wO6Trd2Yi5Mt36hrU9KBwDTKL9R37t7JcP1PhjxEFMimq4XqZF76SCMmN0riiyOycaPFljcDVWmOu21nOEYuYHerKaEMDP2PZhS20cUVlQ/haNBJ6TLXp0J8Z7iIIdUQF5oFzG88qBtBSFRCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745425769; c=relaxed/simple;
	bh=6SjkVadR1Xoah30CU+7wRwLOERvrXoUDiWriqrgG2zY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ROWeY2+CuJ1Vh8BpHuIkrcP2/2sUoHNpTN8Cns3DwdQ4ODeXCa5Vp31nkUwWVVMqrS8NZDk3rQyLV3SfrHqahwMA1epto7Y+aQgqOti8i9WIv2rnZLPGbAfb28w7UerDFQbZ779VD9Y0lyZVcUlMTqRnSJ81cCUuy/+z6SptO7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jPGj9QND; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jPGj9QND"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036B5C4CEE2;
	Wed, 23 Apr 2025 16:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745425768;
	bh=6SjkVadR1Xoah30CU+7wRwLOERvrXoUDiWriqrgG2zY=;
	h=From:To:Cc:Subject:Date:From;
	b=jPGj9QNDr5ybFkYoW7fMOhBtD+p+FoNHs8tpAiUU5G6GZ3cMJkC9pbhC7qgxgO5tg
	 +KIo3zlrtQvpY6LUPSy2fC/GpIMerXa+br2FG2bdnWXOH4t9s+A/mKpUFEqJ7xwAZX
	 oYLZzDvcNo5HV0gvJODBO60mqNs/OnFZfQnBxnd7QzSoJmwemKnhxgQ+DPFSXu8sPG
	 neicloKN61h7SApchx7Am4uBso5obtL+92rVb++/psG+8iFlfHfCRCjDxhd+lcNQHW
	 /z4bC2Z9DRZz9oRNxvZBH440N++o8M04pPrGlSyaLr2GHhLtGRLAgynN7xPCX/9wJx
	 Qyar3LvpaE0ow==
From: Arnd Bergmann <arnd@kernel.org>
To: Alexander Graf <graf@amazon.com>,
	Mike Rapoport <rppt@kernel.org>,
	Changyuan Lyu <changyuanl@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	kexec@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kexec: include asm/early_ioremap.h
Date: Wed, 23 Apr 2025 18:29:18 +0200
Message-Id: <20250423162924.2213664-1-arnd@kernel.org>
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

Fixes: 4bfe738ce89a ("kexec: add KHO support to kexec file loads")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
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

