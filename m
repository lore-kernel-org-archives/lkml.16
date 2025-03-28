Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32F41C3BE2
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 10:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743159576; cv=none; b=oUFRat90+3I3OOhDisNnJNXRH7rNk49PR3GZBbv2LJoq6uGn80DvFgKfea+huIc3dFbVcfba+ra6PQ/GoWtyaDxmZ4bgfim8r3laWbUbgCIZ0wJ+PipgHVEmVYNbCDT+n0q9zd93KKE/DKtN/ZaKKkgEecD4RxL76IBLKzbdFlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743159576; c=relaxed/simple;
	bh=wyvzx6aL7zIW8l9CT9CGKBFa3TtXPNgrV+U99H/B9n0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cvapdY9B8aHimdq4E9ho+/U5dYwb8mrDkynUyIKKBcOYq2K/IhSkktQfqbpSE5wUNINSArSkdLa0nulF1dKJrFPe9B7JtDP15jtgmNgH2Zgh3vJbuqOhNBBRCtYalcDnBzamSy3JE/lyYaKLao7Qzs7pvB2Xe9oKOJpGVghYUuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com; spf=none smtp.mailfrom=friendlyarm.com; dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b=FWdzvTps; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=friendlyarm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=friendlyarm-com.20230601.gappssmtp.com header.i=@friendlyarm-com.20230601.gappssmtp.com header.b="FWdzvTps"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ff6e91cff5so3611518a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 03:59:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=friendlyarm-com.20230601.gappssmtp.com; s=20230601; t=1743159574; x=1743764374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vHj6gQ1zeVt3QGQTw+FIAxu8YW4dxt5y3xOPYH0BIdw=;
        b=FWdzvTpsLLL8b5Qt/Ib9OrO9fa9OfOhm965fQ5sw1uB6zyeoZaIcMejwi4rxjt93EL
         awqGdHdwPl4X6oYdY60LIGSTqW7PgrR5U9ImrfoXqQ2uPs5YVQNV/Lb6U5/4acICa+Le
         if/No6fcS8nWUPLOoE1nAsBhb8ghyXcYaoyb3x3fbv5h5bel9I2m9iW4Bu1YcyXoih2S
         7SipkNaE2oRiRC5Hisn9JLAn3QHgiYjiOYPHgtAUT3cBD6dhPGUiGx/iTtbkbdiixUnb
         XiNzkHj4M6Uk0OiPggbfJvK7CkL17ZAlqntSkLr1gaREkB8wktOtElkXueO+FT/XyTj1
         MzdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743159574; x=1743764374;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vHj6gQ1zeVt3QGQTw+FIAxu8YW4dxt5y3xOPYH0BIdw=;
        b=RNmpTaqwnlsdiV0cBElAj/16IPJAgo1jhI0WfdpHmdcKYcp2hjHhhjT8QU+yJ9Jo61
         5weohFo/UQ/CGPLFRguK44ExrgT8VuUHZzB1jTZNJOaQHTw/krW2hZxwEb4gUjeZ47Jl
         h47wxuuXFxK+nQO3+GUbYZGlFL/2zYjhKxL1BtfWPXhlTAIIDv44bvHeq9ah2IEGHZ3h
         kZibri8TI6W8bTB39Tk8mgnHMjYPLguP9fRwOZi/MmrWmEX3AzJZuS/0TS4eJrOxW9q0
         aF9y3j1dxZaxHLhLYjYV/ZRoE3hPGLKzFhl/LyaLASc/fq8ednMFFZpwAD8sBoSzAiRp
         ZlyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRpcAG7LTihcKcgDFL2I6XKyfmrSViahhF4rDhrMaA8G3zeCinnuv6/VCcCag5KHWrvBkKb9gdYqSH51A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqRfxKVUMCvwb0AubTJDR95uopAIfDHYn9JDi/J63wAAgQfVNc
	hb/bHf6do8eo/5a1yytemEBw8K8+5Pci1RjhBCaMK6W0HW+frTdYiW61U9eIGWI=
X-Gm-Gg: ASbGncvs5kgFvGZAR4dFjBFOJ7SY/k6v2khM12Vi1UQlcRpnLsV889x12DCs2b/a9d+
	l5OQFKpAkcknXPO5AEw5ZoktdaSxxq1fpBHKrC1ifrgiG7wp7Z1ImXpukEBx/rMoafYj1irg3ZR
	THRJrniaGCEAZ+8mPfnK3IcuHxOPlV7EWdThcjtqSoat/iz0dmtgva8b2Dp9BZi499kSRwfmbAe
	mKtuzmvMzlAmJ2BYL3Fxj9cS/zXqv1cbxoZ50cIu6IEv7HiWShlgXRb7SpUmSpxU1k2sjD2WDzL
	t1Q41Q6l9/HgigsXklP9EZ3L5mIg1DLjCT3DKDwZZAu86V0lYzYzxr7zLvWUV6DDZNJC
X-Google-Smtp-Source: AGHT+IHCY/P45TjdQpykRBnac2GduXlszHbzvBxCFlitCRhl0UAFu8AkE4JL9IObg2JicXApsmQMBg==
X-Received: by 2002:a17:90b:2645:b0:2ff:4bac:6fba with SMTP id 98e67ed59e1d1-303a85c1c47mr11926254a91.24.1743159573765;
        Fri, 28 Mar 2025 03:59:33 -0700 (PDT)
Received: from localhost.localdomain ([113.119.38.251])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4efdsm3844649a91.34.2025.03.28.03.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Mar 2025 03:59:33 -0700 (PDT)
From: Jensen Huang <jensenhuang@friendlyarm.com>
To: Shawn Lin <shawn.lin@rock-chips.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Anand Moon <linux.amoon@gmail.com>
Cc: Jensen Huang <jensenhuang@friendlyarm.com>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	linux-pci@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] PCI: rockchip: Fix order of rockchip_pci_core_rsts
Date: Fri, 28 Mar 2025 18:58:22 +0800
Message-ID: <20250328105822.3946767-1-jensenhuang@friendlyarm.com>
X-Mailer: git-send-email 2.49.0-1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The order of rockchip_pci_core_rsts follows the previous comments suggesting
to avoid reordering. However, reset_control_bulk_deassert() applies resets in
reverse, which may lead to the link downgrading to 2.5 GT/s.

This patch restores the deassert order and comments for core_rsts, introduced in
commit 58c6990c5ee7 ("PCI: rockchip: Improve the deassert sequence of four reset pins").

Tested on NanoPC-T4 with Samsung 970 Pro.

Fixes: 18715931a5c0 ("PCI: rockchip: Simplify reset control handling by using reset_control_bulk*() function")
Signed-off-by: Jensen Huang <jensenhuang@friendlyarm.com>
---
 drivers/pci/controller/pcie-rockchip.h | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/pci/controller/pcie-rockchip.h b/drivers/pci/controller/pcie-rockchip.h
index 11def598534b..4f63a03d535c 100644
--- a/drivers/pci/controller/pcie-rockchip.h
+++ b/drivers/pci/controller/pcie-rockchip.h
@@ -320,11 +320,15 @@ static const char * const rockchip_pci_pm_rsts[] = {
 	"aclk",
 };
 
+/*
+ * Please don't reorder the deassert sequence of the following
+ * four reset pins.
+ */
 static const char * const rockchip_pci_core_rsts[] = {
-	"mgmt-sticky",
-	"core",
-	"mgmt",
 	"pipe",
+	"mgmt",
+	"core",
+	"mgmt-sticky",
 };
 
 struct rockchip_pcie {
-- 
2.49.0-1

