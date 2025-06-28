Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 577232512E6
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 14:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751122174; cv=none; b=qpNtRLgp8FrCK0A/zZ7gwjiSW9BVefj1VOTBrTj77LmfO/jva8BwIZrpdQ+ry6RQUJktUAGloP+wY+1nXJWzNLNecwRUJQjt4/UMdHvcVcuDvqJZtSKSpQAapyDBQZDyqA74Rm8J2poJRy2ws0DnbwWh7fFu8oewd3HsrYNN1is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751122174; c=relaxed/simple;
	bh=J/Fe7VsW55nHtlw7aUGllk4ytzTJTWxNR274VqR29BA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tcqsYSDXPYMorgim5BiKw46PD8lctqz9OvpuNEZfqfFLQk0hr6jFYCg+KMUWbQwe70oAmSwKgzswkDdt68opEA91D0g4gKwMYxvcDW2HSofvRtGDuTQnVBI7/4meVgdYKXvFt7/wr3n0LBZjnphxXQMIqjjw3dQq+dxXVM17ZLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org; spf=pass smtp.mailfrom=cknow.org; dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b=ZhiAGTrN; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=cknow.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cknow.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cknow.org header.i=@cknow.org header.b="ZhiAGTrN"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1751122169;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LdOjVT0hxZ4MogGhHL86KxEfuOHrbi5hNR9VAR3J/Ig=;
	b=ZhiAGTrNFHZZKC7ljxViWEQizcIb9e/dSqJYq0x/9LVH839ibJv8W/krAqafA1qXMLXWrH
	V5zlcW7movc/vHUAGp147Z1HFiiya+SyfmIl8J8dhrujZzyMU+RHYY+yf7LiAEcMULWI+e
	RbtE1yHNkI3IS8kJYpby4FyXSdYhvo0qg1/alSulFV46bgNL6M8W2YqvRWx+S0Hqa+afyv
	8McMYwW/NUAsPD4bId1HL5x5FeTQ9/DZtHuXu7QJGOrmaEVehefkde5kt+K4puAV/u8tPK
	5r14qAEoz0m9v+u3ahcCQYInuG0pekAhzzRQEpHHe4p3QPexmuKfU6dpgSmpFA==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Dragan Simic <dsimic@manjaro.org>,
	Quentin Schulz <quentin.schulz@cherry.de>,
	Johan Jonker <jbx6244@gmail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v2 04/10] arm64: dts: rockchip: Simplify VOP port definition on rk3328
Date: Sat, 28 Jun 2025 16:32:38 +0200
Message-ID: <20250628144915.839338-5-didi.debian@cknow.org>
In-Reply-To: <20250628144915.839338-1-didi.debian@cknow.org>
References: <20250628144915.839338-1-didi.debian@cknow.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

When there's only 1 endpoint, there is no need for a unit-address and
removing that allows removing of related properties as well.

This fixes the following DTB validation warnings:

  graph node has single child node 'endpoint@0',
  #address-cells/#size-cells are not necessary

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
index 7d992c3c01ce..6438c969f9d7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
@@ -731,11 +731,7 @@ vop: vop@ff370000 {
 		status = "disabled";
 
 		vop_out: port {
-			#address-cells = <1>;
-			#size-cells = <0>;
-
-			vop_out_hdmi: endpoint@0 {
-				reg = <0>;
+			vop_out_hdmi: endpoint {
 				remote-endpoint = <&hdmi_in_vop>;
 			};
 		};
-- 
2.50.0

