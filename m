Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BF4A20E021
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 22:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747608889; cv=none; b=JB30gNATFi0A4iv2I8hal3r5eHmUM+LjvQE9bgonYpRmVQ/dJ97De/fJWFHQS8C9L49vOwO52S24K+1UIkPtoX3yMN+OOiu29EIsow7jQP31sLSTGstRlN9oaxYtoeao3N/YE+y8Mmd1xly6XnhhTpkKlGXZ2kzrUr+3CBywhp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747608889; c=relaxed/simple;
	bh=97F/FWVCvzLd2AvA/FQKXEApP4xJ/R+Rbf/RceS1hNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iZIGFTzog+xYdKgEPKQs1FRu0SuGVvf8vZPx3zAjQtf4fD7sJtzX3zK9oVP+Ok9C+sBCSWG5GsD8xBcefT11fD+B58AVTN7qL2Y/vsoNfq4/AawMoeOtc5JY5Q4B8/JkE/+aovXqWhsABQ8bCby2ZAS7dr1ABWFoSIha26JOC7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se; dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b=qTvNIAcH; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kwiboo.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.kwiboo.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kwiboo.se header.i=@kwiboo.se header.b="qTvNIAcH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1747608886; bh=VnllxYvJ8y+xBCgppgUdhper3bPIjDGyHOTBW41WvLw=;
 b=qTvNIAcH1wcRcJnjWRlF2FSDZUbSypZVDXZqHncxlwXE++fRfrNB11ApCQh6cRcUjbLI00Ah1
 KLdEE6Zzkpgntu63A3vpycKbPVYA/Gq23qpqfcZR/u8sT4c4uBfeYTzbAkgD25b5MOlPeo3OKXs
 7RLS23HPcFZwi0vUzLDMHhq9JuS/gWbEYofYXPC9FCDmhxwGIozZLJXXKF8ORdiTZR8pixTuZyx
 vC5kHDXuFkymuznIZ2fj15cLNXYsRsisBHKeiug1hsA5LNyZxnNDL079ITKrlimQmmjlTAVdeIS
 ZfNfhQSOmp9LkEWgNc/MWeJem/oOC/GgCKRRrAdp+DSg==
X-Forward-Email-ID: 682a652edb63046e3392f2ae
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Jonas Karlman <jonas@kwiboo.se>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] dt-bindings: gpu: mali-utgard: Add Rockchip RK3528 compatible
Date: Sun, 18 May 2025 22:54:11 +0000
Message-ID: <20250518225418.682182-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518225418.682182-1-jonas@kwiboo.se>
References: <20250518225418.682182-1-jonas@kwiboo.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Rockchip RK3528 SoC has a Mali-450 MP2. Add a compatible for it.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
 Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
index 9318817ea135..c8d0d9192d92 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-utgard.yaml
@@ -47,6 +47,7 @@ properties:
               - hisilicon,hi6220-mali
               - mediatek,mt7623-mali
               - rockchip,rk3328-mali
+              - rockchip,rk3528-mali
           - const: arm,mali-450
 
       # "arm,mali-300"
@@ -148,6 +149,7 @@ allOf:
               - rockchip,rk3188-mali
               - rockchip,rk3228-mali
               - rockchip,rk3328-mali
+              - rockchip,rk3528-mali
     then:
       required:
         - resets
-- 
2.49.0

