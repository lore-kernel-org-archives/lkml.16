Received: from cpanel.siel.si (cpanel.siel.si [46.19.9.99])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3CF6279792;
	Thu, 22 May 2025 08:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.19.9.99
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747903159; cv=none; b=u9c3U/cgrcH+OORilw8gZEucGxph0LvA9tiW5b9Nn7W0/rWMz61qnmkvUs7ZysiHWurCPJK1ve6UfYWrgb4IWbfR2fWDsioAzEGjVduemD+6H9DziXitsjvxliHbk6tj5J7bbpDqcW3MDJY+o6pfJoneygTRIXSmwXd6ZlB1uz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747903159; c=relaxed/simple;
	bh=QTy1k3Ew/RqSP8xX7rFD4GrhuViSyGVepDKk8lzTijU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WTjD+mA00XHXxRvQc0gS6P5meAm4gi/Kz0oBWmjQ9SKCU8dek1su6lrtVviYUt/vbwC8ol5IX6a4jls+lf+vTZX1OkTMI7CeW4Er8ujCwmhVJQ55gUg6uoK85EIN0WRSq+tBO/SjL4TZ5NSSWoufEwQil4C2aUcbV9eH4ISMWrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com; spf=pass smtp.mailfrom=norik.com; dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b=GKUe9g1D; arc=none smtp.client-ip=46.19.9.99
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=norik.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=norik.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=norik.com header.i=@norik.com header.b="GKUe9g1D"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=norik.com;
	s=default; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=VLjIX7nSKhkcnuApiD0KRwJJujcGBBsiXxOFrQ/KWTc=; b=GKUe9g1D9ayAnusFpEJP2ZdXcM
	Cfs3ZLh9fZTVemOy7zdZcDDn9+PbQ3IKNf92Rfp5QWlI6ixHQXx9qBiMHucmbv2i8a8pmy6nU6c4l
	Is2KZ3EysWeWNqqiTFbK0Ppwaz5HZR4TZr4mZ/J3VBfPOMzv9Uryo4Zm9VthDqfFFnc8zbEz2YdLW
	Q7ZJQ+QhMncTk+w3NFsA10GHFxS7Ea69UBCPzNKJZRqdutyVRTBjD24L5BfsyeO7o199iieOozBLK
	sUys5gk0Fx4kMUl+De7QtbZLMq9pGctcF9uQ1+1Ve0Vj7gg7D26XPdWEaPNlp0oQBE3jaKV30bas9
	1q+qCR4Q==;
Received: from [89.212.21.243] (port=51574 helo=localhost.localdomain)
	by cpanel.siel.si with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <primoz.fiser@norik.com>)
	id 1uI1SI-002sBQ-1V;
	Thu, 22 May 2025 10:39:10 +0200
From: Primoz Fiser <primoz.fiser@norik.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	upstream@lists.phytec.de
Subject: [PATCH 2/2] arm64: dts: freescale: imx93-phyboard-segin: Set ethernet1 alias
Date: Thu, 22 May 2025 10:39:09 +0200
Message-Id: <20250522083909.533567-2-primoz.fiser@norik.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250522083909.533567-1-primoz.fiser@norik.com>
References: <20250522083909.533567-1-primoz.fiser@norik.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel.siel.si
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - norik.com
X-Get-Message-Sender-Via: cpanel.siel.si: authenticated_id: primoz.fiser@norik.com
X-Authenticated-Sender: cpanel.siel.si: primoz.fiser@norik.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 

Set ethernet1 alias to EQOS interface on phyBOARD-Segin-i.MX93 marking
it the secondary networking interface. The primary ethernet0 interface
is already set by the SoM include file (imx93-phycore-som.dtsi).

Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
---
 arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
index 0c55b749c834..6f1374f5757f 100644
--- a/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
+++ b/arch/arm64/boot/dts/freescale/imx93-phyboard-segin.dts
@@ -18,6 +18,7 @@ /{
 		     "fsl,imx93";
 
 	aliases {
+		ethernet1 = &eqos;
 		rtc0 = &i2c_rtc;
 		rtc1 = &bbnsm_rtc;
 	};
-- 
2.34.1

