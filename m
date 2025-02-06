Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0F6118950A
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 04:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738817059; cv=none; b=AgItvllXbe2PRZFWqXrxGWaZgp6Y5oVArBi72ikTnmLzVg1ZIaGTfF/CYhZjcvInmLv3dTKxQn34WwYhzvm3lk7zfzDlkGvQVkDtfkBqhihOmKcHPxvMB6iahgHdUJ80I3JXL3v5arIeYOShcLJuiP06e+Y89sPrrGj3yqu1JRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738817059; c=relaxed/simple;
	bh=+5zbRciSoFCWXXamUnMkT2CsyUGmDo1Fd8UoKqH+Xa8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eBYEjF0gcnXINMv6jfAlh70GChaLbLaimtOmVgA0ynzqUkw0ufRxOIvtWnk9FjQPyob1XoNnOCk54xfSYhzp8k0ixDyj6cYS/MhGJnWCyy5xqxwV9qcMuaxNlnC5+UaDrGTnzyuR2Vb2cJqfludls0l/10RLXmx8LwOpAnxOZAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tftjw-000000004tQ-2Ndp;
	Wed, 05 Feb 2025 23:43:48 -0500
From: Rik van Riel <riel@surriel.com>
To: x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	bp@alien8.de,
	peterz@infradead.org,
	dave.hansen@linux.intel.com,
	zhengqi.arch@bytedance.com,
	nadav.amit@gmail.com,
	thomas.lendacky@amd.com,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	akpm@linux-foundation.org,
	jannh@google.com,
	mhklinux@outlook.com,
	andrew.cooper3@citrix.com,
	Rik van Riel <riel@surriel.com>,
	Manali Shukla <Manali.Shukla@amd.com>
Subject: [PATCH v9 07/12] x86/mm: use INVLPGB in flush_tlb_all
Date: Wed,  5 Feb 2025 23:43:26 -0500
Message-ID: <20250206044346.3810242-8-riel@surriel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250206044346.3810242-1-riel@surriel.com>
References: <20250206044346.3810242-1-riel@surriel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: riel@surriel.com

The flush_tlb_all() function is not used a whole lot, but we might
as well use broadcast TLB flushing there, too.

Signed-off-by: Rik van Riel <riel@surriel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
---
 arch/x86/mm/tlb.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
index 227e972b6fbc..d225a3df9aa7 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1074,6 +1074,19 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
 }
 
 
+static bool broadcast_flush_tlb_all(void)
+{
+	if (!IS_ENABLED(CONFIG_X86_BROADCAST_TLB_FLUSH))
+		return false;
+
+	if (!cpu_feature_enabled(X86_FEATURE_INVLPGB))
+		return false;
+
+	guard(preempt)();
+	invlpgb_flush_all();
+	return true;
+}
+
 static void do_flush_tlb_all(void *info)
 {
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH_RECEIVED);
@@ -1082,6 +1095,8 @@ static void do_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
+	if (broadcast_flush_tlb_all())
+		return;
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
 	on_each_cpu(do_flush_tlb_all, NULL, 1);
 }
-- 
2.47.1

