Received: from fr2000.dnsiaas.com (fr2000.dnsiaas.com [151.106.4.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A06D1991B2;
	Thu,  3 Apr 2025 09:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=151.106.4.82
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743672931; cv=none; b=SFzwsHukbL6CJK8hpALmuIxlJN4aiUt80eCZH9le75stWgKhlc1y24y7sWzhOCuC2YRsUVhcRYPtMfSt92ubA7WxsGyhjfNZZEw+r+hz72zZRvXIzwYyMyIUzeobSN6PIVV0S8zYyjNcDWUUrhKBIQ53cSBwjEqvvug4+kf0AoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743672931; c=relaxed/simple;
	bh=phR8Y06xpO4nXOYx3V2cAK1Bwd1DL64hmkS941TJ3q8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=g5wdHueNkHTEly+5Q0Poj7Sabguq5RXB+Xa63p3swnieU8kQgCZ8iK9SJPezWBPAmNxqzbkK30s/t1Wa3uiZfFao7Prj/V6kRXILgHFBi4ymJp+dX1P+UszI1UwRjCdjVo9JyOoJ4FGgWyRncRB3uGq8FQKtWYSnpB8LjqZt5Yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me; spf=pass smtp.mailfrom=superkali.me; dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b=Dtg7kAm6; arc=none smtp.client-ip=151.106.4.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=superkali.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=superkali.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=superkali.me header.i=@superkali.me header.b="Dtg7kAm6"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=superkali.me; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=gE5XW7LYRJERQKlLeNBH8x1//oKVJHYsrqcpiH4BRGE=; b=Dtg7kAm6uAfrEMN+ZklmNzn6GR
	z1oyvqP2sYOxP+ptGnu1pVFP2Dblhwj5ZvD/77CQEx0Q8jpCs76Z8Editv/q9oWO5M2nB05J3dRTP
	hxJbuRBioNxWSnzDgGrk2DhvIQPtyGd4fisZ8KwWJ2lKRU45ctCaH1sapLFt1Bo9vNxksErIhwMn/
	+63Y8MKzON7oaWXdRZQcQ6gQ/1xry7jdsyrEyWAS7Oog2KaNnf7D038ckcxJqAG+fRBr1w7UjIhni
	yLdy01i6SIdk72RmigpEpKuVishPhWDhzWha6o/YvY3wvTtc21NndmfhB+Uu1/foJlI1fWsSlVc8R
	3Gyo4GwQ==;
Received: from [185.94.132.237] (port=37142 helo=vscode.superkali.lan)
	by fr2000.dnsiaas.com with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <hello@superkali.me>)
	id 1u0Gip-0000000HaiW-3uRN;
	Thu, 03 Apr 2025 11:18:51 +0200
From: Daniele Briguglio <hello@superkali.me>
To: devicetree@vger.kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	alchark@gmail.com,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Daniele Briguglio <daniele.briguglio@icloud.com>,
	Daniele Briguglio <hello@superkali.me>
Subject: [PATCH] rockchip: dts: rk3588: add missing OPP nodes for lower frequencies
Date: Thu,  3 Apr 2025 09:18:40 +0000
Message-Id: <20250403091840.3349637-1-hello@superkali.me>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - fr2000.dnsiaas.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - superkali.me
X-Get-Message-Sender-Via: fr2000.dnsiaas.com: authenticated_id: hello@superkali.me
X-Authenticated-Sender: fr2000.dnsiaas.com: hello@superkali.me
X-Source: 
X-Source-Args: 
X-Source-Dir: 

From: Daniele Briguglio <daniele.briguglio@icloud.com>

This Patch adds missing Operating Performance Point (OPP) nodes for lower
frequencies to the RK3588 device tree. These additions improve power
management by enabling the CPU clusters to scale down to lower
frequencies when under light loads, which should improve energy
efficiency and reduce power consumption.

The changes add OPP nodes for 408MHz, 600MHz, 816MHz, and 1008MHz
(for cluster1 and cluster2 only, as cluster0 already had 1008MHz)
with appropriate voltage settings across all three CPU clusters in
the RK3588 SoC.

Signed-off-by: Daniele Briguglio <hello@superkali.me>
---
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi | 58 ++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
index 0f1a77697351..1b018823d5d3 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi
@@ -5,6 +5,22 @@ cluster0_opp_table: opp-table-cluster0 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <675000 675000 950000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <675000 675000 950000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <675000 675000 950000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1008000000 {
 			opp-hz = /bits/ 64 <1008000000>;
 			opp-microvolt = <675000 675000 950000>;
@@ -37,6 +53,27 @@ cluster1_opp_table: opp-table-cluster1 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <675000 675000 1000000>;
@@ -78,6 +115,27 @@ cluster2_opp_table: opp-table-cluster2 {
 		compatible = "operating-points-v2";
 		opp-shared;
 
+		opp-408000000 {
+			opp-hz = /bits/ 64 <408000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+			opp-suspend;
+		};
+		opp-600000000 {
+			opp-hz = /bits/ 64 <600000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-816000000 {
+			opp-hz = /bits/ 64 <816000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
+		opp-1008000000 {
+			opp-hz = /bits/ 64 <1008000000>;
+			opp-microvolt = <675000 675000 1000000>;
+			clock-latency-ns = <40000>;
+		};
 		opp-1200000000 {
 			opp-hz = /bits/ 64 <1200000000>;
 			opp-microvolt = <675000 675000 1000000>;
-- 
2.34.1

