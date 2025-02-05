Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0397425A63B
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 01:40:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738719660; cv=none; b=dHTitQzzT6Jbs8G4yPUf2zMbNCMQJqDSEsIsFpSVpiGfsz+Q2g45xtbKGlXmvV/9kY4nWqIhbOGvVexVhYKyEf02f/EB4heeH0HHiZa4y3hY8RdyfSm3YGfL5eXK2X6Ldu38+LpaPSRgDasyIq8Z/vmH9BHRtdQyE9JXO7/H5T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738719660; c=relaxed/simple;
	bh=3SFxMz0K0PqIXMlsTApWhf8YE9GEYsdOvjVuc9EJzl4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAYkLKq6vk28+xYllaz1dL65du7hLIs9oBDGuD68SlDPi9Q+VdFJ53jzx+OaGRo5qdMkuiAahiyNFGDnT5/fLcWL39uRSFSGQkr43rbEY+vrLzQfVDxBan4lIloVVY2CggUpbRYxpvyvA9HbOfQcx+6W+SLBEUxk5QQaLtb5jYQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=shelob.surriel.com; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=shelob.surriel.com
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@shelob.surriel.com>)
	id 1tfUP4-000000004Cs-2zwB;
	Tue, 04 Feb 2025 20:40:34 -0500
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
Subject: [PATCH v8 07/12] x86/mm: use INVLPGB in flush_tlb_all
Date: Tue,  4 Feb 2025 20:39:56 -0500
Message-ID: <20250205014033.3626204-8-riel@surriel.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250205014033.3626204-1-riel@surriel.com>
References: <20250205014033.3626204-1-riel@surriel.com>
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
index 7945624afc98..43e1abd4bcb0 100644
--- a/arch/x86/mm/tlb.c
+++ b/arch/x86/mm/tlb.c
@@ -1070,6 +1070,19 @@ void flush_tlb_mm_range(struct mm_struct *mm, unsigned long start,
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
@@ -1078,6 +1091,8 @@ static void do_flush_tlb_all(void *info)
 
 void flush_tlb_all(void)
 {
+	if (broadcast_flush_tlb_all())
+		return;
 	count_vm_tlb_event(NR_TLB_REMOTE_FLUSH);
 	on_each_cpu(do_flush_tlb_all, NULL, 1);
 }
-- 
2.47.1

