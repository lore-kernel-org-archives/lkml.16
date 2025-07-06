Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BF31F0E3E
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 09:29:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751794163; cv=none; b=l5+WJnEcjI6ZV8nxaxdoe4XbLWNBYlxeXD6n9Bw/JXfBgfybn83FxbjBhBcXv2GJ4WlTr7RrtCl5VY4yon4q2D3Cjfm9Hgts0uMwm6Oew8pjdXN8ZYq+o54fH85d3nrzOKR1ePN2vLSvYrqAs1WIcQf3FUrj9qOAjB4D2w2rC5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751794163; c=relaxed/simple;
	bh=CC41pVRdiQJRe7IDT4GFyh8uj0wNXZE9cLlsrCSHf00=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HTyTtJBsb9rntsJpgsJFEjYP8mIvpFuoOXcby8d0uuzExi2r9CZQblCSB4Bsz+9IsfImtcRrrBaYTKZ2w1vU025khTpOoQEdS6YuwUDEl6qphFmNPYDwq610H/bSwpAIxkqNr5EPmcyokpJsdIQXmXYca1uGhJqlTYFfs42GlMs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OlNYeSLt; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OlNYeSLt"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751794158;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6AU93rX/4NmAUMCzl+yk6cEfK1BjjGSB9sBuojk4y04=;
	b=OlNYeSLtfZ0CVPQyGdB+rQrCbAitBPvSkls8fZisHAbD6JvL/SmYGPyh5RJkug5hfafKnp
	/j7a5z+pWRIRpYqPWLhby10LfZyKLtd4zMPsEX/NJBEdc+lfe9WRhe7xXEQXpCaKFUGZxA
	oHhWi1PMH2YLgq+GBU1V9EF3jbnCA08=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Nikunj A Dadhania <nikunj@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Alexey Kardashevskiy <aik@amd.com>,
	Ashish Kalra <ashish.kalra@amd.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	kernel test robot <lkp@intel.com>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] x86/sev: Replace memset(0) and kfree() with kfree_sensitive()
Date: Sun,  6 Jul 2025 11:28:44 +0200
Message-ID: <20250706092859.412471-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace memset(0) followed by kfree() with kfree_sensitive() to improve
snp_msg_free() and silence the following Coccinelle/coccicheck warning
reported by kfree_sensitive.cocci:

  WARNING opportunity for kfree_sensitive/kvfree_sensitive

No functional changes intended.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202501141317.IrSGK4Et-lkp@intel.com/
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/x86/coco/sev/core.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/x86/coco/sev/core.c b/arch/x86/coco/sev/core.c
index b6db4e0b936b..4bc8423cfd79 100644
--- a/arch/x86/coco/sev/core.c
+++ b/arch/x86/coco/sev/core.c
@@ -1768,8 +1768,7 @@ void snp_msg_free(struct snp_msg_desc *mdesc)
 	free_shared_pages(mdesc->request, sizeof(struct snp_guest_msg));
 	iounmap((__force void __iomem *)mdesc->secrets);
 
-	memset(mdesc, 0, sizeof(*mdesc));
-	kfree(mdesc);
+	kfree_sensitive(mdesc);
 }
 EXPORT_SYMBOL_GPL(snp_msg_free);
 
-- 
2.50.0

