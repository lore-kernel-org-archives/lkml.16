Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E6929DB9B;
	Mon, 16 Jun 2025 11:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073008; cv=none; b=a1Mgq/lSztCx/lSsBOzssGU4DPOVEEEzMlxIftA9wV2usEXSFH3aCxRRAofBYycUs24cY8SyiaRwkTjBZMsnFX04H/tVIPm5yKHoJv8nuyfZZ/qTFdkCw0mmY8bqgtCdE0OvMWKa0AxiSLkfusye6hBa6CuaXw5yEIYxWv/hWXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073008; c=relaxed/simple;
	bh=JrJ+umgrNMzWySXESlaKAGuivVKus8Rx3Q4aaoBen2A=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OY1/AKmKv3EdrgdQJzMiKktQ8mLd1OGquIey3WGCayuSPZvdqOvNdP/BKFd19G9zGnpl9cc+/qEBPnUFQ53ktVDqEb4X7MO/RLV8O/8mJI4kUZZM4kquZekmORTnMWl5lFe3YhzkXU6iYjPpsBQKmhcPatA3TofOXc5WurG0R28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=YhzZQtK8; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="YhzZQtK8"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1119; q=dns/txt;
  s=NAESA-Selector1; t=1750073006; x=1781609006;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=JrJ+umgrNMzWySXESlaKAGuivVKus8Rx3Q4aaoBen2A=;
  b=YhzZQtK82+1Fox9hKLu5J2BCJkMat2lofZtmiW/H12XQ+eBUFbawf6+s
   ZsGRLqjnWQpJApqL6oVRjEh5nJuNIqwWPjiDrjgVv7POmzhbW3zO1tkB/
   B9O+p/TnvnrngADDHm2ID96sp7YadOMZRLp3RTx5ppfC4QDdFp1ysYEbJ
   NM+/IlDkBqSOaGN5Yy/7gY2YcFlwMnXfg+Yve5QI4Z9RewTrh7A6wwdJN
   D91ro7nqasaJyDUqkUlotWb9PwsOHDk/+znxgXFOxUcMJbBLwhXomZdXc
   L2xvkqXOSu3udrmjOXAvh93LOddF8TgBmyeR6NipSC55W4M1xazdrhpDE
   g==;
X-CSE-ConnectionGUID: oL9CiXDSQ8WZlVQisCBqwQ==
X-CSE-MsgGUID: Xw5K/lG/Q7SUtrotL8LHyA==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117905"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:24 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Mon, 16 Jun 2025 16:53:16 +0530
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
Subject: [PATCH v4 5/7] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
Date: Mon, 16 Jun 2025 16:53:14 +0530
Message-Id: <20250616112316.3833343-6-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
References: <20250616112316.3833343-1-pinkesh.vaghela@einfochips.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0724 (UTC) FILETIME=[0E406340:01DBDEB1]

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Add compatible string for ESWIN EIC7700 PLIC.

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/interrupt-controller/sifive,plic-1.0.0.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index ffc4768bad06..9d7daaca125c 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -58,6 +58,7 @@ properties:
       - items:
           - enum:
               - canaan,k210-plic
+              - eswin,eic7700-plic
               - sifive,fu540-c000-plic
               - spacemit,k1-plic
               - starfive,jh7100-plic
-- 
2.25.1

