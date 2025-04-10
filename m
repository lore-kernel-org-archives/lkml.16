Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F04EC1E991C;
	Thu, 10 Apr 2025 15:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298733; cv=none; b=s48aoANsVeIhq67o9RLBtbjHAR56N5RQIwO12oR3sbaU+NeuEABEbxfU2LKDabV902+EfVU0Y8zDlcdVAXnMTn+ad9vcO1Q3IJo4LQESvgUXYlJykeG6Fp3kEmUwRfCVW1eVkXgRGZ9fiaINf9CvPSDGerJw+BRhf/+6bAXC/XU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298733; c=relaxed/simple;
	bh=H3wnlGqXSSS/oiZRRPE2KJNofPHwThcoVMkEwdUNQ7I=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=I+nMnBjR3aNQM8PNFLC97Rm5XJ2vNzQUfpRCGDxW/5b7qVcU9PV+RFmzHb0dO+qP9y7iMhb2NJhGg+/UmWh3jKkSYb/PwGdpmUx9sp2n6DOO9y6yh0eUqpAXY2A91VjYujOSbB5dZnM+JSbjuR85Cpebb/UOW6ED85gfbQyPtUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=LJ3ibb2q; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="LJ3ibb2q"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=2708; q=dns/txt;
  s=NAESA-Selector1; t=1744298729; x=1775834729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=H3wnlGqXSSS/oiZRRPE2KJNofPHwThcoVMkEwdUNQ7I=;
  b=LJ3ibb2q7WdfpiF4WsThbk/w3XHJq7/yeaLxhEN1nLWAt9h33DckuXsv
   Yv9hBaK7FjKqoAImcvzwayduADbZtP1UowRd72ee7M2aXfzD9TUQfcOkc
   /SrfoliI11XshKBbumHv9E0IOIBR6pX0+IvOWyj2CuVZ/RspdwKNHLtqX
   CBOJICglLOcshnf/IP2xW1zyMcS9x7FKxwB4Vajszpm/QQ6PrFjJqWUxR
   YuAK5SpRFPKJolK13hI7nzGBPS9OiuFvk5xtwk17SK6cz4a8EQrBI6Lpv
   4n/NgGxQedTRjjZUY+ch/mcAQkVd7y1dz8aWnl19GREIrshJtCDuMmuuk
   Q==;
X-CSE-ConnectionGUID: OB5NjAz5TSmFsbtGeJ6PWA==
X-CSE-MsgGUID: tLtUDXDvQv29WQJ0HuWfXw==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22941703"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 10 Apr 2025 09:25:27 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:19 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Min Lin <linmin@eswincomputing.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Yu Chien Peter Lin <peterlin@andestech.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Kanak Shilledar <kanakshilledar@gmail.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Aradhya Bhatia <a-bhatia1@ti.com>,
	rafal@milecki.pl,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/10] dt-bindings: cache: sifive,ccache0: Add ESWIN EIC7700 SoC compatibility
Date: Thu, 10 Apr 2025 20:55:14 +0530
Message-Id: <20250410152519.1358964-6-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
References: <20250410152519.1358964-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 10 Apr 2025 15:25:19.0854 (UTC) FILETIME=[C508E8E0:01DBAA2C]

From: Pritesh Patel <pritesh.patel@einfochips.com>

This cache controller is also used on the ESWIN EIC7700 SoC.
However, it have 256KB private L2 Cache and shared L3 Cache of 4MB.
So add dedicated compatible string for it.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../bindings/cache/sifive,ccache0.yaml        | 44 +++++++++++++++++--
 1 file changed, 41 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
index 7e8cebe21584..579bacb66f34 100644
--- a/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
+++ b/Documentation/devicetree/bindings/cache/sifive,ccache0.yaml
@@ -39,6 +39,7 @@ properties:
           - const: cache
       - items:
           - enum:
+              - eswin,eic7700-l3-cache
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
           - const: sifive,ccache0
@@ -55,10 +56,10 @@ properties:
     enum: [2, 3]
 
   cache-sets:
-    enum: [1024, 2048]
+    enum: [1024, 2048, 4096]
 
   cache-size:
-    const: 2097152
+    enum: [2097152, 4194304]
 
   cache-unified: true
 
@@ -89,6 +90,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - eswin,eic7700-l3-cache
               - sifive,fu740-c000-ccache
               - starfive,jh7100-ccache
               - starfive,jh7110-ccache
@@ -108,6 +110,22 @@ allOf:
             Must contain entries for DirError, DataError and DataFail signals.
           maxItems: 3
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: eswin,eic7700-l3-cache
+
+    then:
+      properties:
+        cache-size:
+          const: 4194304
+
+    else:
+      properties:
+        cache-size:
+          const: 2097152
+
   - if:
       properties:
         compatible:
@@ -122,11 +140,31 @@ allOf:
         cache-sets:
           const: 2048
 
-    else:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - microchip,mpfs-ccache
+              - sifive,fu540-c000-ccache
+
+    then:
       properties:
         cache-sets:
           const: 1024
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - eswin,eic7700-l3-cache
+
+    then:
+      properties:
+        cache-sets:
+          const: 4096
+
   - if:
       properties:
         compatible:
-- 
2.25.1

