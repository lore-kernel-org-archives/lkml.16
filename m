Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DD3B2E7F08;
	Mon, 16 Jun 2025 11:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073071; cv=none; b=o2YJwpVL2+KTplI8xyGf0G73OirFjVLeVkxKGlcmKhq/aWZYKq0dzthfJ0HyK43R/JC8f/hFF/XFDujOfonpdyIVok4ibAZREaKDPDFIvyUBxxcmLjjWPqrKEkeQUnsNXNYP2CoIV5MnD44PlLAgARA9mtVrjeV1mm9Lri3l0zo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073071; c=relaxed/simple;
	bh=48tAi45I8uFpjXnUr6Whz6NO1YAMjCklEIDkcMApDYw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=X3dKRzeKGj8zqXA3Qgm3zMzGwkck8C6Bu+Z2vaOJZ+hZd2qJXvZQGTt55/CSDTpsqFrXFQ+aR/fF7U3z+5hlKKkIp30LS7oZb3vGS5Hn7RdobnudBvP2Uf7Oh8MV+5i4/6Z2IxP9nQ16wOwecUVyH/nxFOOl1xWcyVVUPkFBRa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=VabyPZKM; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="VabyPZKM"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=984; q=dns/txt;
  s=NAESA-Selector1; t=1750073069; x=1781609069;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=48tAi45I8uFpjXnUr6Whz6NO1YAMjCklEIDkcMApDYw=;
  b=VabyPZKMBqdf1oWR2T8sftoGVznRmqSYUUr/bMvMdswHPbpolPISahUm
   uCCRfGRctsvUB3uyLUP0EKA+GDECMQbwWWaJdeOEgqmoRFdTCP4laA3eZ
   Xvd0U0vp2sW0lVGerEg+O6CnZmL/whxEjlxFy+DZHh1Ti0FJzN1SrYWau
   57N6pqZukmj3i/uAxkZ0qVkqLlxMCdGVLU2t/rU4KwQpwXmd9AZx1r1GT
   l79qkX04Kqy1+n58Qbh0OVcgQkFMZk53/Vwm4YKlqHCw6y6uEYYlELFI5
   EUgLDp4qSgdBXMN9uCDcc1AXHglToqljM7L1n46xMUampmTfXr/qXl3RO
   g==;
X-CSE-ConnectionGUID: aZH5kl7wQVSYW4SWmBJCsA==
X-CSE-MsgGUID: AMNR3QgxQt6sHMFnb2JLGw==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117882"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:18 -0600
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
Subject: [PATCH v4 1/7] dt-bindings: riscv: Add SiFive P550 CPU compatible
Date: Mon, 16 Jun 2025 16:53:10 +0530
Message-Id: <20250616112316.3833343-2-pinkesh.vaghela@einfochips.com>
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
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0421 (UTC) FILETIME=[0E122750:01DBDEB1]

From: Darshan Prajapati <darshan.prajapati@einfochips.com>

Update Documentation for supporting SiFive P550 based CPU

Signed-off-by: Darshan Prajapati <darshan.prajapati@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 2c72f148a74b..3ee7468001f6 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -51,6 +51,7 @@ properties:
               - sifive,e5
               - sifive,e7
               - sifive,e71
+              - sifive,p550
               - sifive,rocket0
               - sifive,s7
               - sifive,u5
-- 
2.25.1

