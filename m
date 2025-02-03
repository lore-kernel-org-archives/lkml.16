Received: from out-171.mta1.migadu.com (out-171.mta1.migadu.com [95.215.58.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67731D86E6
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 06:34:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738564494; cv=none; b=J1RFvRMHVH5PNzTb9hTZzLSdAOVKPt/bCVyqsUha52sB5n+/9oLVdcjRbcL50L4luxqVH99KCfSulMEy/JysCrQ8F2Ql4Eih8BnSRUeM7gEahqxvdDKynbdUA6jceSTvfnyKwF7Kp5dZsldhDuS73+Gcxl2YKOf+3cGP6IoXZ1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738564494; c=relaxed/simple;
	bh=FFnqvapRkzDuWXPCQq67sFJeL5dRDjb37o20Z82GzSI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qs/Fn6uAMdgvBqfFX7VJAyekeUcj0DnU0O5xlK8lVABr4excppHUVgPMcDLyyTB18U3Bw6XieP24eR8yxozH2Uilc3xF3uYzycy1xGBGFMe7x301Lvj+tmI7eDo1+n5k9feTxviJJJXNTiqxy8JHm2/dUnng/gd4WLCQSYNErS4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=h4LJ129n; arc=none smtp.client-ip=95.215.58.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="h4LJ129n"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738564489;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+kCkhRAYk9c9VDEl9lyK5nkwt4FcdUmGsfEiMHKrscg=;
	b=h4LJ129njIKAmd30yLmQZqidP9fwl44WcDKvVs5StMRwER7PzTQUvYB5xzceMKebX1nYm6
	QqadUb0RSoDj9oMTktlFdS6QwKVbalcCH2NhbTlWElTvNIK0qZHNI2pqldjTV8hw+mTR+e
	RsW4WPQOcz7p/HAsZ8DuojmNRDVYOJLTH1cLS1sJ4k+U3OV8FaVAUNQsIvjYV0xYFgyGGd
	xP5rnFaZYiYmqCPmuuhNSzQMb9L/BAD1iqfh1X4ThlYLeI1Do2sasWQdY1RSMVeKaJaMIY
	MYy/0Kl96wCFk244wFj7eCOOTstVhjYfWQvNtIbhM4zu2wtHiejMArXskGuLbA==
From: Alexey Minnekhanov <alexeymin@postmarketos.org>
To: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Bjorn Andersson <andersson@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	Alexey Minnekhanov <alexeymin@postmarketos.org>
Subject: [PATCH v3 1/3] dt-bindings: clock: gcc-sdm660: Add missing SDCC resets
Date: Mon,  3 Feb 2025 09:34:24 +0300
Message-ID: <20250203063427.358327-2-alexeymin@postmarketos.org>
In-Reply-To: <20250203063427.358327-1-alexeymin@postmarketos.org>
References: <20250203063427.358327-1-alexeymin@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add resets for eMMC/SD card blocks that were missed during initial
driver submission.

Signed-off-by: Alexey Minnekhanov <alexeymin@postmarketos.org>
---

v3: dropped "Fixes:" tag since no user-observable bug is being fixed.

 include/dt-bindings/clock/qcom,gcc-sdm660.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,gcc-sdm660.h b/include/dt-bindings/clock/qcom,gcc-sdm660.h
index df8a6f3d367e..74c22f67da21 100644
--- a/include/dt-bindings/clock/qcom,gcc-sdm660.h
+++ b/include/dt-bindings/clock/qcom,gcc-sdm660.h
@@ -153,5 +153,7 @@
 #define GCC_USB_30_BCR			7
 #define GCC_USB_PHY_CFG_AHB2PHY_BCR	8
 #define GCC_MSS_RESTART			9
+#define GCC_SDCC1_BCR			10
+#define GCC_SDCC2_BCR			11
 
 #endif
-- 
2.45.3

