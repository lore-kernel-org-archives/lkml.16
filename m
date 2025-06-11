Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 99AC1283CB1
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 10:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638966; cv=none; b=XhEpNGlW94ZJZFmTUhQnw12RztGxbXPrw27yie4nZp1++ISmFzYwjO/qMAgFDBn+XVjJcsI1WuNpJCLwcs/T9vzzxYgy/8Ic6p1Qhrpbzp6eLmLvvC0T9lt0nwTWlFsj7xYFlmNPM+4+PFrSopbTIKMZALHUK8OVbG3y6e/D/f8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638966; c=relaxed/simple;
	bh=JVP6OfbAmASCiu3vKazYYbs14p39xHpdEiwaR6eOXCU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=g6sV1tVfum+6z7jxzMKLIoz1O4T/CdXsWHexR0WVa0IL4o3A3v6gfcOaGwpsnfCDbH3pAXZTuW/ZdvQ31ykKfSX/Rk1yN7zEJ7SeCguX9XtXCdsQJP16ZVdyxsXB1IHaBf9iCBDo0zs23N3z4g7YTqfK+hb3JzChp/Iz8Y9zQtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D0C4115A1;
	Wed, 11 Jun 2025 03:49:04 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 830B23F77D;
	Wed, 11 Jun 2025 03:49:22 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: catalin.marinas@arm.com,
	will@kernel.org,
	broonie@kernel.org,
	maz@kernel.org,
	oliver.upton@linux.dev,
	ardb@kernel.org,
	frederic@kernel.org,
	james.morse@arm.com,
	joey.gouly@arm.com,
	scott@os.amperecomputing.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 2/6] arm64/Kconfig: add LSUI Kconfig
Date: Wed, 11 Jun 2025 11:49:12 +0100
Message-Id: <20250611104916.10636-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611104916.10636-1-yeoreum.yun@arm.com>
References: <20250611104916.10636-1-yeoreum.yun@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since Armv9.6, FEAT_LSUI supplies the load/store instructions for
previleged level to access to access user memory without clearing
PSTATE.PAN bit.
It's enough to add CONFIG_AS_HAS_LSUI only because the code for LUSI uses
indiviual `.arch_extension` entries.

Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---
 arch/arm64/Kconfig | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..20f360eef2ac 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2237,6 +2237,13 @@ config ARM64_GCS
 
 endmenu # "v9.4 architectural features"
 
+menu "v9.6 architectural features"
+
+config AS_HAS_LSUI
+	def_bool $(as-instr,.arch_extension lsui)
+
+endmenu # "v9.6 architectural features"
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y
@@ -2498,4 +2505,3 @@ endmenu # "CPU Power Management"
 source "drivers/acpi/Kconfig"
 
 source "arch/arm64/kvm/Kconfig"
-
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

