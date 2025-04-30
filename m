Received: from mail11.truemail.it (mail11.truemail.it [217.194.8.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67078230BE2;
	Wed, 30 Apr 2025 10:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.194.8.81
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746008915; cv=none; b=RA/8shJqW+NPnf2+fnmwFQ20GBPZXNCGAd6YJxrGz+7aBbo3KrML2Mrketvsyij4ovekR8+Frc4F0id9WjGaVevYxvV71NY9zqbuIfEeiKQ8ArZsu0prXhRjfBUQbHUfAzVGm9oimEPCSgmbdOhVsQ58u1IVeZRfoADe3jQFMtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746008915; c=relaxed/simple;
	bh=p7WTLliDrU1NCSCtAQ2n0DSdfhf0TqgZEEWZQ5x4uWA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=QYdt5za+P8c2+GDioDQAbl/ea0K0dQaDETh54Ighmbj3GsaP4ymQILYPgCZ1UsINHpM5gAfDHjHxSQlIONGePUzldMWoBM8jsXX4qiZxIdUqbAq2jCUoZlsSiT3F6Z4frIpxwZy/JETuh4X1L6mabMIdkrNJ9vZpIRBnZMhfd+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it; spf=pass smtp.mailfrom=dolcini.it; dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b=zN0GFWg7; arc=none smtp.client-ip=217.194.8.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=dolcini.it
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dolcini.it
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dolcini.it header.i=@dolcini.it header.b="zN0GFWg7"
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5B6471FA7B;
	Wed, 30 Apr 2025 12:28:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008911;
	bh=s3lUIl7tpDtkxNOWzKSiZqXC/oZXnG1SOoq8hfyeiVc=; h=From:To:Subject;
	b=zN0GFWg7+v9aC4eohZEm/n8gZUmvQf0H+VnxWI644v11+zIwDey1tcJceywYqDqYB
	 deD8cUwClhqfdIuJinXt1cC74XDDxkoqFmVesZiEGu6ya1xBvRDk+Bpr10sW18XuHe
	 H6RUoT97ryUkFFbTQjX3fQ3tE5wFwMIyHn/Km8cgg2DtMmkZjoBrV56zYG4yw1z0kd
	 yhUp5CCSJ2S/Gh1urZeD3FYKa6wV4BZvMjhGYcHvnPmLRUsbuiBoAms2EmVQID3QFm
	 xmzChctnH+DCZVukKzmjd7hGnUx7DsQFYv2tTuRocBEJ9YBIOuL5t+mtPAJD4kAC68
	 8kk2ttnmz+uzg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/6] dt-bindings: arm: ti: Add Toradex Verdin AM62P
Date: Wed, 30 Apr 2025 12:28:10 +0200
Message-Id: <20250430102815.149162-2-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430102815.149162-1-francesco@dolcini.it>
References: <20250430102815.149162-1-francesco@dolcini.it>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add toradex,verdin-am62p for Toradex Verdin AM62 SoM, its nonwifi and
wifi variants, and the Toradex carrier board they may be mated in.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../devicetree/bindings/arm/ti/k3.yaml        | 24 +++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/ti/k3.yaml b/Documentation/devicetree/bindings/arm/ti/k3.yaml
index a6d9fd0bcaba..bf6003d8fb76 100644
--- a/Documentation/devicetree/bindings/arm/ti/k3.yaml
+++ b/Documentation/devicetree/bindings/arm/ti/k3.yaml
@@ -76,6 +76,30 @@ properties:
           - const: toradex,verdin-am62          # Verdin AM62 Module
           - const: ti,am625
 
+      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards
+        items:
+          - enum:
+              - toradex,verdin-am62p-nonwifi-dahlia # Verdin AM62P Module on Dahlia
+              - toradex,verdin-am62p-nonwifi-dev    # Verdin AM62P Module on Verdin Development Board
+              - toradex,verdin-am62p-nonwifi-ivy    # Verdin AM62P Module on Ivy
+              - toradex,verdin-am62p-nonwifi-mallow # Verdin AM62P Module on Mallow
+              - toradex,verdin-am62p-nonwifi-yavia  # Verdin AM62P Module on Yavia
+          - const: toradex,verdin-am62p-nonwifi     # Verdin AM62P Module without Wi-Fi / BT
+          - const: toradex,verdin-am62p             # Verdin AM62P Module
+          - const: ti,am62p5
+
+      - description: K3 AM62P5 SoC Toradex Verdin Modules and Carrier Boards with Wi-Fi / BT
+        items:
+          - enum:
+              - toradex,verdin-am62p-wifi-dahlia # Verdin AM62P Wi-Fi / BT Module on Dahlia
+              - toradex,verdin-am62p-wifi-dev    # Verdin AM62P Wi-Fi / BT M. on Verdin Development B.
+              - toradex,verdin-am62p-wifi-ivy    # Verdin AM62P Wi-Fi / BT Module on Ivy
+              - toradex,verdin-am62p-wifi-mallow # Verdin AM62P Wi-Fi / BT Module on Mallow
+              - toradex,verdin-am62p-wifi-yavia  # Verdin AM62P Wi-Fi / BT Module on Yavia
+          - const: toradex,verdin-am62p-wifi     # Verdin AM62P Wi-Fi / BT Module
+          - const: toradex,verdin-am62p          # Verdin AM62P Module
+          - const: ti,am62p5
+
       - description: K3 AM642 SoC
         items:
           - enum:
-- 
2.39.5

