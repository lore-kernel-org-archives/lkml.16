Received: from relmlie5.idc.renesas.com (relmlor1.renesas.com [210.160.252.171])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 902EC2951D6;
	Fri, 23 May 2025 14:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.160.252.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010278; cv=none; b=BbRBA29V4GkRznwciu2raBRswdVk+LUBq89zNYAlrrBB8x702PVID9sxgEQMSht8wseaBT8UVXeWcqvcGwSphdOLT5zKEkVYBNTj95tkZbeso2pNsrUJUFR1yt5gzsBMYE8hL70dZWPQG81EoSKDEGEPWAelL8SNcbR2VuZKEYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010278; c=relaxed/simple;
	bh=bol4Rub4XFqYKuwqpXb+Qd/jta/6wrroqbyigaDt27o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KhpZYBLxgJ5y/L7zPQPGa1kQCEaD9WNZGA6hiHTrUXyQ/qC8JNT3GA7J+d00jw3tpOJ48h0Nh7htRBMT9GMTFTEXwceuJTA5EEcEawz1goJuzUeih0B5zElwzmtsQQJvBKNDsYt2QYql2xavEM6T2klQzkaoxJMx/eFn37keupE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com; spf=pass smtp.mailfrom=bp.renesas.com; arc=none smtp.client-ip=210.160.252.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=bp.renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bp.renesas.com
X-CSE-ConnectionGUID: 13l6cdWPQUayk5iCCI8YKg==
X-CSE-MsgGUID: qmR7IpmxRmKH7cXTuY0uEQ==
Received: from unknown (HELO relmlir5.idc.renesas.com) ([10.200.68.151])
  by relmlie5.idc.renesas.com with ESMTP; 23 May 2025 23:24:35 +0900
Received: from superbuilder.administration.lan (unknown [10.226.92.97])
	by relmlir5.idc.renesas.com (Postfix) with ESMTP id 8AE4C4010DE6;
	Fri, 23 May 2025 23:24:32 +0900 (JST)
From: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
To: thierry.bultel@linatsea.fr
Cc: linux-renesas-soc@vger.kernel.org,
	geert@linux-m68k.org,
	paul.barker.ct@bp.renesas.com,
	Thierry Bultel <thierry.bultel.yh@bp.renesas.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v10 03/10] soc: renesas: Add RZ/T2H (R9A09G077) config option
Date: Fri, 23 May 2025 16:24:07 +0200
Message-ID: <20250523142417.2840797-4-thierry.bultel.yh@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
References: <20250523142417.2840797-1-thierry.bultel.yh@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a configuration option for the RZ/T2H SoC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Thierry Bultel <thierry.bultel.yh@bp.renesas.com>
---
Changes v10->v11: none
Changes v8->v9: none
Changes v7->v8: none
Changes v6->v7: none
Changes v5->v6: none
Changes v4->v5: none
Changes v3->v4:
  - Sets ARCH_R9A09G077 to Y by default.
---
 drivers/soc/renesas/Kconfig | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index fbc3b69d21a7..7f4b4088a14e 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -408,6 +408,12 @@ config ARCH_R9A09G057
 	help
 	  This enables support for the Renesas RZ/V2H(P) SoC variants.
 
+config ARCH_R9A09G077
+	bool "ARM64 Platform support for RZ/T2H"
+	default y if ARCH_RENESAS
+	help
+	  This enables support for the Renesas RZ/T2H SoC variants.
+
 endif # ARM64
 
 if RISCV
-- 
2.43.0

