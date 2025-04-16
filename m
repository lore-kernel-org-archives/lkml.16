Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0D5FA21E08B;
	Wed, 16 Apr 2025 06:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744784837; cv=none; b=jqobvq+oAOgckU5r18rE4fRGYtqGueoig9BO+JBKR0+jFqLov8Lidn307T2kyRekEVXanF4oO+1Xm0EutMAKO04YpgPa12q2V9wbNaA0bslqHvSYWtN9d1hVaeMXl8ufjXmis7yWDBRI4oZ0dlcwJa+Sj7l9Yo++5kgOLrsVU/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744784837; c=relaxed/simple;
	bh=mrvOxsBtv8mVk1WXIRTpfq/489t4CJkuWe57iKSweXM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=jK1uoGCqpiacndcGal3d44xySjpPtGEN7yRFOa1lh51apSXdmvTPo/Zuk2wTdm+Kc01qFQq2lM+T08Df5maSXVFAqNdWHDcjZYrT92OfBmZ0d4iqf4+pPrOm7BbDCOSOQgjYAxH5dheDIk4bFLTVRcDUdlTR4l14dgolSovkDsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BCD48152B;
	Tue, 15 Apr 2025 23:27:11 -0700 (PDT)
Received: from a077893.blr.arm.com (a077893.blr.arm.com [10.162.16.49])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 35AEB3F694;
	Tue, 15 Apr 2025 23:27:10 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-doc@vger.kernel.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] documentation: Add nodebugmon for arm64 platforms
Date: Wed, 16 Apr 2025 11:57:06 +0530
Message-Id: <20250416062706.2735563-1-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an entry for nodebugmon which has been used on arm64 platforms.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
This patch applies on v6.15-rc2

 Documentation/admin-guide/kernel-parameters.txt | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index d9fd26b95b34..f4a313d6c0ab 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4085,6 +4085,13 @@
 			/sys/module/printk/parameters/console_suspend) to
 			turn on/off it dynamically.
 
+	nodebugmon
+			[HW,ARM64] Disable debug monitor
+			Disables the debug monitor exception handling on the platform
+			regardless whether breakpoints and watchpoints are programmed
+			or not. This prevents debug exceptions from being enabled via
+			MDSCR_EL1 register.
+
 	no_debug_objects
 			[KNL,EARLY] Disable object debugging
 
-- 
2.25.1

