Received: from out-172.mta1.migadu.com (out-172.mta1.migadu.com [95.215.58.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244322745C
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 07:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749715007; cv=none; b=K9naU4EiRXMg5X5YdR+1OpYm+KjwoQzPMmm6w5QbEmdYOE72FiyjMst574tS5eluA7f2j/CtykkOtUFWjMXJTNcwN5rSO+YGUMvop+gAXte0wQQY3fipZ+Vj47yXxOaPx1bUwtCToNYZh9NudFx7AR4V2uHVQ+KWa5xSEMA0s4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749715007; c=relaxed/simple;
	bh=LvsURw/nqMWRXkm+nrhQDBaJHU6fMAmmLXpVcAQ1/T0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WrM+02O7pA8OzBv0vvv2qDD5D9pqHYy8z+0f+K7KPjj3TW7SlcyJQ79+jIMhnUDHYSEN2jjaoR5PoY40pU7zeY5eiCO+r2rtfn3oEwX6407vZhn53wjFc/xrfSpeer1Q3dzbsqOanhzCShdnPNWkn2KQlSSCcSRi/KB3kLBz3iE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=O6Ge+pdM; arc=none smtp.client-ip=95.215.58.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="O6Ge+pdM"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1749715004;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q9di4IfgIfQZ0n6KWtQk6/b40WsXW7j7pcH/DrSfee4=;
	b=O6Ge+pdM8WhzjFbEcRkFEMPi0hWkm1bRsbb+9aLEUiEw+eBxXLBoOBuyLHCknQYpOxC/wx
	3c2ZDtaG5QiVgAQAVs+qUmgP/N/vFR5szvcGIeWWGOmpxPLobrrCB6jZtXWX+JkL7gevc4
	lPnhNMYdV/KQWuq2GdQqdz3t5nNpDD4=
From: Hao Ge <hao.ge@linux.dev>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	Suren Baghdasaryan <surenb@google.com>,
	Mike Rapoport <rppt@kernel.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Matt Turner <mattst88@gmail.com>,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Christoph Lameter <cl@linux.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Kent Overstreet <kent.overstreet@linux.dev>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-alpha@vger.kernel.org,
	linux-s390@vger.kernel.org,
	Hao Ge <hao.ge@linux.dev>,
	Hao Ge <gehao@kylinos.cn>
Subject: [PATCH 3/5] s390: Modify the definition logic of WEAK_PER_CPU
Date: Thu, 12 Jun 2025 15:54:26 +0800
Message-Id: <ec8f82c68710869a310059d1a13dd071a79b1f74.1749702889.git.gehao@kylinos.cn>
In-Reply-To: <cover.1749702889.git.gehao@kylinos.cn>
References: <cover.1749702889.git.gehao@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Hao Ge <gehao@kylinos.cn>

As stated in the first patch of this patch series,
we make ARCH_NEEDS_WEAK_PER_CPU a Kconfig option,
and replace all instances of ARCH_NEEDS_WEAK_PER_CPU
in the kernel code with MODULE_NEEDS_WEAK_PER_CPU,
gated by #ifdef CONFIG_ARCH_NEEDS_WEAK_PER_CPU.

We'll make corresponding changes for the s390
architecture.

Suggested-by: Suren Baghdasaryan <surenb@google.com>
Signed-off-by: Hao Ge <gehao@kylinos.cn>
---
 arch/s390/Kconfig              | 1 +
 arch/s390/include/asm/percpu.h | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/s390/Kconfig b/arch/s390/Kconfig
index 0c16dc443e2f..716031d22346 100644
--- a/arch/s390/Kconfig
+++ b/arch/s390/Kconfig
@@ -132,6 +132,7 @@ config S390
 	select ARCH_INLINE_WRITE_UNLOCK_IRQ
 	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE
 	select ARCH_MHP_MEMMAP_ON_MEMORY_ENABLE
+	select ARCH_NEEDS_WEAK_PER_CPU
 	select ARCH_STACKWALK
 	select ARCH_SUPPORTS_ATOMIC_RMW
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
diff --git a/arch/s390/include/asm/percpu.h b/arch/s390/include/asm/percpu.h
index 84f6b8357b45..a202baef86fb 100644
--- a/arch/s390/include/asm/percpu.h
+++ b/arch/s390/include/asm/percpu.h
@@ -17,8 +17,8 @@
  * per cpu area, use weak definitions to force the compiler to
  * generate external references.
  */
-#if defined(MODULE)
-#define ARCH_NEEDS_WEAK_PER_CPU
+#if defined(MODULE) && defined(CONFIG_ARCH_NEEDS_WEAK_PER_CPU)
+#define MODULE_NEEDS_WEAK_PER_CPU
 #endif
 
 /*
-- 
2.25.1

