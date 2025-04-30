Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AF9A0235049;
	Wed, 30 Apr 2025 09:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746006815; cv=none; b=usxrxAuusMJxkh5NJz/mh7RzHxoyE/Wf6BJCPDm4HGr+y9kz3mWwP2rS003AmUPmojOQZmuEqrEdfUr1rB37v495yzwiBGId9l8Y17W71FCNbpiTXm8wM0cYv16ItS8YwB0bZz9Kn1HOKq1b43fNIVH6AyIyp4wj8ofYul3cUiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746006815; c=relaxed/simple;
	bh=ZYar+ZpT/hHW+BjicvwY2/oyKJa/a97+twGdFQAsV5E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lxSiumSqI/aRnnfbLuyVqK9C547i753xT4o2HqQ6Yl4Dtwk1uh655PbRc5ycof4YOd0NE6TzzxgeZ2aAiYAkZM/AOxewk5JxmeYdGcQUscHSLlIyC+IJIbE6qmxVLezvVgQnGMDXXrLnex5E0fQvKyYtTAlXZ9Mad0kmEYAw4T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=fail smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A229A106F;
	Wed, 30 Apr 2025 02:53:25 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.100.21])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3620B3F673;
	Wed, 30 Apr 2025 02:53:31 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: sunxi-ng: fix order of arguments in clock macro
Date: Wed, 30 Apr 2025 10:53:25 +0100
Message-Id: <20250430095325.477311-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When introducing the SUNXI_CCU_MP_DATA_WITH_MUX_GATE_FEAT macro, the order
of the last two arguments was different between the users and the
definition: features became flags and flags became features.

This just didn't end up in a desaster yet because most users ended up
passing 0 for both arguments, and other clocks (for the new A523 SoC) are
not yet used.

Swap the order of the arguments in the definition, so that users stay
untouched.

Fixes: cdbb9d0d09db ("clk: sunxi-ng: mp: provide wrappers for setting feature flags")
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_mp.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_mp.h b/drivers/clk/sunxi-ng/ccu_mp.h
index b35aeec70484d..8fc7fdb7ef494 100644
--- a/drivers/clk/sunxi-ng/ccu_mp.h
+++ b/drivers/clk/sunxi-ng/ccu_mp.h
@@ -109,8 +109,7 @@ struct ccu_mp {
 					     _mshift, _mwidth,		\
 					     _pshift, _pwidth,		\
 					     _muxshift, _muxwidth,	\
-					     _gate, _features,		\
-					     _flags)			\
+					     _gate, _flags, _features)	\
 	struct ccu_mp _struct = {					\
 		.enable	= _gate,					\
 		.m	= _SUNXI_CCU_DIV(_mshift, _mwidth),		\
-- 
2.25.1

