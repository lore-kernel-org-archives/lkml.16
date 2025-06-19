Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD34B28C87A;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750353031; cv=none; b=OjngpjJlYAnracUxXWhUdYtatXec8q6ulyu4gWIU/h4IjSgyxKY8KUMsWYbo19jeNruhzBT3oFqGJvpxS7TLM6SEn1QVnefDGgEAI7K4Ws6emqQyYUFWja3CP/FIEbiqwvL0R7VOJIQQqdJYatOVjodkMGQdPXuHxEyfQ4j5oVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750353031; c=relaxed/simple;
	bh=IQ/Y9U0nzxzGUrCLzecuHFfq901/was5ToS48J7PkBs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=bjY2sdEEnkTP/5SWfA2ix4NkWiAjMTmH7tBbhczkcIhbiV3+uvfb9vZ6BsipSAiH9L+Bl70sTFtRVAugRp5cNL2iyw1vCfALoW+i2v+h3yGlKGEW8z05WEHYsG11wY4bnFNmxKfhCRGY3LmLTdyju2LFwlyI0LnufsZmzGb4MCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n7ZdUe9C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n7ZdUe9C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E047C4CEF1;
	Thu, 19 Jun 2025 17:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750353031;
	bh=IQ/Y9U0nzxzGUrCLzecuHFfq901/was5ToS48J7PkBs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n7ZdUe9CBdTNyTfQlROqRZ5vpt8NKwi2nppZSwqQarz5IhWBTb7Fuf8Y6A0/k7RKV
	 oZKsSCbwBRFUPRD6rP/TpNuQ9RtRxabjo6oqERe77Q5R9Eo5l8++R5LrXc86UqaYFi
	 OR068erT3x6FE1H1NfS/K3PcLb5E/Qnhle/zFrbIzQhAhjgATpLBCKFf9QnB7PUkuY
	 VgukLCpXYCyGdnVISPcXPT0tVLE9F7O2NlVM1kiLQqrFfRq9Zgnb64GUCbAGWDf64l
	 uSeHjzyKXQm4hPmBeVSBrBj5JQwTQbufs1pY3nTNwAyPX1uUE1SmTmyX1dyriZbgZy
	 5P18Yvb8c9R7w==
Received: by wens.tw (Postfix, from userid 1000)
	id 85B495FEDE; Fri, 20 Jun 2025 01:10:28 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
Date: Fri, 20 Jun 2025 01:10:24 +0800
Message-Id: <20250619171025.3359384-2-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619171025.3359384-1-wens@kernel.org>
References: <20250619171025.3359384-1-wens@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Chen-Yu Tsai <wens@csie.org>

There is a PPU0 reset control bit in the same register as the PPU1
reset control. This missing reset control is for the PCK-600 unit
in the SoC. Manual tests show that the reset control indeed exists,
and if not configured, the system will hang when the PCK-600 registers
are accessed.

Add a reset entry for it at the end of the existing ones.

Fixes: 52dbf84857f0 ("dt-bindings: clk: sunxi-ng: document two Allwinner A523 CCUs")
Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 include/dt-bindings/reset/sun55i-a523-r-ccu.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/reset/sun55i-a523-r-ccu.h b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
index dd6fbb372e19..eb31ae9958d6 100644
--- a/include/dt-bindings/reset/sun55i-a523-r-ccu.h
+++ b/include/dt-bindings/reset/sun55i-a523-r-ccu.h
@@ -21,5 +21,6 @@
 #define RST_BUS_R_IR_RX		12
 #define RST_BUS_R_RTC		13
 #define RST_BUS_R_CPUCFG	14
+#define RST_BUS_R_PPU0		15
 
 #endif /* _DT_BINDINGS_RST_SUN55I_A523_R_CCU_H_ */
-- 
2.39.5

