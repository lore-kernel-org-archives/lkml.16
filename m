Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0F025E80B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 12:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744201455; cv=none; b=ZqH6TeSvruVYIArm1SV7xg80It+QD2i5C4OcHMbwXeq7s6gTzsrY2Czw68PQsvCyfZh0A6WuSOrgnX8Cu2K25cKYIZmfZKPdKhn/xXiS0L8nl7Otpu6+V48qMWUEgjvWdB/h5giaMYN0wwnC2wFFHF653mI9LZwBfQqyE1TtQR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744201455; c=relaxed/simple;
	bh=XJj6XvkQZvZnU7KV6XAood8YWkTdHu5c0H1A7ovBxzA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=p720QJkvEvmEyXREPiQEIuYFfs+6beeAGCNb+0oo0WqFOnW2td39rxe/Ta7wW39cMXYImelAzBRz/Q2sWP8ckvTLOYG/aqL0KE5rV8itr7LJVfDDQo+z3lTLtQOZfVXYRKkVv1NOuHdtbZFMiyTaPJ+ZUgvl9sxyYKdnDZLSV2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sxjtqdOS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sxjtqdOS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F6EAC4CEE3;
	Wed,  9 Apr 2025 12:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744201454;
	bh=XJj6XvkQZvZnU7KV6XAood8YWkTdHu5c0H1A7ovBxzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sxjtqdOSL8gQo9pk7SGNQNxZ1USKpj5+Yb60+jIhvZbCOUYIUyA88o8l8lqpbdsWK
	 cImwUtDd0rdcTiLUNpzPimLgwg2QKtBE4nDvfARDGB3cDQGiG9W4eJsaNANZGtu0XI
	 UGlWeOqF6IOoSrANDCqqJX7pwel8+imi9xsqnnYi35cBB7h55BcpypcztP03M97gO7
	 UHQDu56P8q3pWYCt/jMIDZpfW1i1vYp9ctiPsO6hQ9Mbxl3NWl25RvdB9PVin1xpKw
	 lVbdZk0B9zekRXM4nOlWc6gx72hg4J992cY3LuA7SI5ll1CXeR23K9q2g3E/847CTn
	 1eKvNqrB26dvQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Russell King <linux@armlinux.org.uk>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/10] [RESEND] ARM: fixmap: make __end_of_early_ioremap_region an enum value
Date: Wed,  9 Apr 2025 14:22:59 +0200
Message-Id: <20250409122314.2848028-7-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250409122314.2848028-1-arnd@kernel.org>
References: <20250409122131.2766719-1-arnd@kernel.org>
 <20250409122314.2848028-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Building with W=1 shows warnings for the __end_of_fixed_addresses
definition:

    In file included from mm/early_ioremap.c:18:
    arch/arm/include/asm/fixmap.h:39:35: error: '__end_of_fixed_addresses' defined but not used [-Werror=unused-const-variable=]

Move the calculation slightly up in the file into the enum that
contains __end_of_fixmap_region and __end_of_early_ioremap_region.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm/include/asm/fixmap.h | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/arch/arm/include/asm/fixmap.h b/arch/arm/include/asm/fixmap.h
index 707068f852c2..90e0bd79b180 100644
--- a/arch/arm/include/asm/fixmap.h
+++ b/arch/arm/include/asm/fixmap.h
@@ -33,12 +33,11 @@ enum fixed_addresses {
 
 	FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
 	FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
-	__end_of_early_ioremap_region
-};
+	__end_of_early_ioremap_region,
 
-static const enum fixed_addresses __end_of_fixed_addresses =
-	__end_of_fixmap_region > __end_of_early_ioremap_region ?
-	__end_of_fixmap_region : __end_of_early_ioremap_region;
+	__end_of_fixed_addresses = __end_of_fixmap_region > __end_of_early_ioremap_region ?
+				   __end_of_fixmap_region : __end_of_early_ioremap_region,
+};
 
 #define FIXMAP_PAGE_COMMON	(L_PTE_YOUNG | L_PTE_PRESENT | L_PTE_XN | L_PTE_DIRTY)
 
-- 
2.39.5

