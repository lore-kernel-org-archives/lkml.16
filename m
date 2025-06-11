Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BDD501B81DC
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:12:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749654729; cv=none; b=iIyvC7DZ2q5vIYOWZ4W4/wenweUk8K9qOP/ZQBTu8wy4B37V29UJWtIO3GBPMYT0gm7CFIvPicWY5l3RG1gfueMsKqS5KFwjaYisc9nm4I763ufc13U9dcbFJBTh4oJW+iMQYE7/cI4TyRAPN+lw8Mithr0kb5C2ZQvSevSMoZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749654729; c=relaxed/simple;
	bh=C2wBC2VYolKyq9LN7bFr8OvYdkRhDxJR74W+YO42yOk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=HoM0lMTcuGOJCLeBkeV3/Bn9hUm83QUf53P0qyb+4itdufdQgazFmunToSMjR1sTFyr4e+HkW/xorA371MgRyWMQFbiZLUp2rBcAnPIfh12NJWZlAdykOxWt4I0x8ayfW8Kb7XX8G27gbqwlzpC0wDbCAFGOIjm06PQAo4djzpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 82DEB1688;
	Wed, 11 Jun 2025 08:11:47 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 443A53F59E;
	Wed, 11 Jun 2025 08:12:05 -0700 (PDT)
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
Subject: [PATCH v2 2/6] arm64/Kconfig: add LSUI Kconfig
Date: Wed, 11 Jun 2025 16:11:50 +0100
Message-Id: <20250611151154.46362-3-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250611151154.46362-1-yeoreum.yun@arm.com>
References: <20250611151154.46362-1-yeoreum.yun@arm.com>
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
 arch/arm64/Kconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 55fc331af337..962cf99492ae 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2237,6 +2237,9 @@ config ARM64_GCS
 
 endmenu # "v9.4 architectural features"
 
+config AS_HAS_LSUI
+	def_bool $(as-instr,.arch_extension lsui)
+
 config ARM64_SVE
 	bool "ARM Scalable Vector Extension support"
 	default y
-- 
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}

