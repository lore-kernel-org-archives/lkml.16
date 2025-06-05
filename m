Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828B7172BB9
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 16:35:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749141363; cv=none; b=XUgYtHuWqokR+kKOu4UyQLFJTh2XmR1HlXP/yU+XfB/jU7mXtupUR/x9oMGa9luQrzBkHe49H+B3XIuhFbeWesde0ZdBo15ptpu6e4GQStZ+Kt3ce5LZRo4A24AVPtLv6Z2eQduNydr1VYzCZT1OcbuSQYdrDdnNE+GpyHhOS/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749141363; c=relaxed/simple;
	bh=S5cxOSa6d88PfbTdq9eoJMTTbccAluAglm7/Dfl/fm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fzYhR4D1qc8lCdQK6clI2aAvkCrcySDPhPVFkLdWz6i4Br1agteW4zhQYZddQKv9JHKsUqd3K7WqHWQjCZa5EzzGjU0NAM4WWzeC+1u0vItRbMStVceZdOda+N30I8x5Y1wpsnsve1K1BY8z8NHg8ufzp5jt9Q50fFGNadewUw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=LqooNOCZ; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="LqooNOCZ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1SMkrgUDqqJ7Fy358K5JacpCt/v6noOWf3XUoT7x+/I=; b=LqooNOCZTiZ7cTGXsh1U7Jc3tl
	MbULD+5Zc9VxkZWtMoaypGpilkB/nO6POPonEtWoe3Vh881rNwjFE/idtr19n1sTDPUyZKydGqc0N
	JpYhp6XlxoCazlLCSNGB5EB5iwXUtQA+eprZentYphTTHmT0lUXtMOq0bP/IKEm213vg8vUwqj9mH
	hqVmRtbFhdbiZTJC7Yrz+AjNWg/V2MV018lcxhPO5tURZmlisPuxik8GFyf+QccJKufklZ3X24f9I
	1gpnDFcz7dVHiHf9SfVO0ze1Pi4teE0fieUcGkgXjkjY69/NiJSUOkVyfWO4YVkK1hLCDBb6fTxRa
	V7vZiXDw==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uNDZC-000000002qg-3H7C;
	Thu, 05 Jun 2025 12:35:46 -0400
From: Rik van Riel <riel@surriel.com>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@meta.com,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	bp@alien8.de,
	x86@kernel.org,
	nadav.amit@gmail.com,
	seanjc@google.com,
	tglx@linutronix.de,
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v3 2/7] x86/mm: enable BROADCAST_TLB_FLUSH on Intel, too
Date: Thu,  5 Jun 2025 12:35:11 -0400
Message-ID: <20250605163544.3852565-3-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250605163544.3852565-1-riel@surriel.com>
References: <20250605163544.3852565-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rik van Riel <riel@fb.com>

Much of the code for Intel RAR and AMD INVLPGB is shared.

Place both under the same config option.

Signed-off-by: Rik van Riel <riel@surriel.com>
---
 arch/x86/Kconfig.cpu | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/x86/Kconfig.cpu b/arch/x86/Kconfig.cpu
index f928cf6e3252..ab763f69f54d 100644
--- a/arch/x86/Kconfig.cpu
+++ b/arch/x86/Kconfig.cpu
@@ -360,7 +360,7 @@ menuconfig PROCESSOR_SELECT
 
 config BROADCAST_TLB_FLUSH
 	def_bool y
-	depends on CPU_SUP_AMD && 64BIT
+	depends on (CPU_SUP_AMD || CPU_SUP_INTEL) && 64BIT && SMP
 
 config CPU_SUP_INTEL
 	default y
-- 
2.49.0

