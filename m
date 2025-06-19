Received: from shelob.surriel.com (shelob.surriel.com [96.67.55.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F6DD233D92
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 20:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.67.55.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750364000; cv=none; b=uTOdB4Z37UDGoXEvN6iZfNM+jkMmihKty/jZ1UqPS8/7C/Vv5jpWKUCDgQ7KgM5n7b1ujhtBqx3twQ+IpRFfRBY/xOXHLHxIV2heGHcAGOc9isap4rKFkzCV8WqU9Re1PhMrHMlUfnk/aNP7KqUMMsFOhcfTNS6nOrxS6JpQC68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750364000; c=relaxed/simple;
	bh=S5cxOSa6d88PfbTdq9eoJMTTbccAluAglm7/Dfl/fm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RW6P9GRlQbZWrX9XoAMnd/S9SUBVmODUA6Kvw57bTNgi6uOEaLWyAPgifnTChX4SvWuSNKxtUovSqIBvmVU4Be2X77rz2ONOQft2pwYn576rBanLQ7IJjtVtw8IGWS8j3NxN1kRZa39LrQNuGpJ2CoyQG+lhTtOC9MMAldTLoR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com; spf=pass smtp.mailfrom=surriel.com; dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b=ctqX5tuo; arc=none smtp.client-ip=96.67.55.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=surriel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=surriel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=surriel.com header.i=@surriel.com header.b="ctqX5tuo"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=surriel.com
	; s=mail; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=1SMkrgUDqqJ7Fy358K5JacpCt/v6noOWf3XUoT7x+/I=; b=ctqX5tuoUdi0vlXs2P9KTLt6Dm
	WPsOp62TwkWNL+dgJYLmLJtYbSYegeezuGhRQsIwGYJhAu+OnOj1thJaYOX1nvMyeAbzVz7U8C9/d
	r8I1kvS4QOiLudI6G7kgZC40FuXZTqrdRCK65AnxsDH7lao8Jx4tn8vnZDaMs6C01qjlXtIVx8YKO
	6UMJDN1pDzP4uvxgKnCGBi2CSHBzzKmcCmPkswgEtmqZ5QpMHl6dByGMwMaeTKh9xmWvtS598BoF3
	+fbIGEFssiESgl78sKaaoBUexEgM7UvoN48tG44erQbDBEIDKGRmMBDfiWGmtYcwVYYYoxNQDq5yQ
	s9FY6NfA==;
Received: from fangorn.home.surriel.com ([10.0.13.7])
	by shelob.surriel.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.97.1)
	(envelope-from <riel@surriel.com>)
	id 1uSLV6-000000000CT-1Trd;
	Thu, 19 Jun 2025 16:04:44 -0400
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
	mingo@kernel.org,
	Rik van Riel <riel@fb.com>,
	Rik van Riel <riel@surriel.com>
Subject: [RFC PATCH v4 2/8] x86/mm: enable BROADCAST_TLB_FLUSH on Intel, too
Date: Thu, 19 Jun 2025 16:03:54 -0400
Message-ID: <20250619200442.1694583-3-riel@surriel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619200442.1694583-1-riel@surriel.com>
References: <20250619200442.1694583-1-riel@surriel.com>
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

