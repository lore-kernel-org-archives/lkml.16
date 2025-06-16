Received: from naesa03.arrow.com (naesa03.arrow.com [216.150.161.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44CFC2E92D2;
	Mon, 16 Jun 2025 11:24:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750073073; cv=none; b=cAzqPQVY9iKHc9XYYNqcVtBOAh/dr3Jjp1N6XhDCge47jOzqW70boxajmtfDcy87peWA530BINvssNN9ycSva6/RJ2qoLmLs9BbdNXH6zqzfLvMvIk92PDbFsdY/DGTGiygIFbSr3SDDkFmoJlsMgia0iOXuey8Kq73wnjXguqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750073073; c=relaxed/simple;
	bh=28J+fyT9lX5TecGCCbT96HUMwY1IUJIWz/FmodfdxZs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q4QNyUWW1F6z3+mpv0SKqLRctzzVVrlhVij8aGV9sthqs4WGd4ozaKjpBdpQxAhIu+lm2BImFTo247Xx/Gb9LX9ACNhoiQrO145RLrWfdC/tud8RgU5/pdo3yz+HKZxmvrWf5CRRskO9BsEv/mf6VZT1p5GU1d0lfDpkb2bJFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=ZT9/zQO7; arc=none smtp.client-ip=216.150.161.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="ZT9/zQO7"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1173; q=dns/txt;
  s=NAESA-Selector1; t=1750073071; x=1781609071;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=28J+fyT9lX5TecGCCbT96HUMwY1IUJIWz/FmodfdxZs=;
  b=ZT9/zQO7XtCk+HyToPUkxGDkvy4WNN8DEs3/8EEnojMzqLAO67q7Vkek
   2xPMvcOi6nUroNyb2ifR2sptQdvTxSyjdXuHrzBTv9Ke1zKSOAsJolnQF
   KbXd6jMCvbxCgbCPGXmzuIS6HZcbBfV7w1Y9PViYRMegUlnldHXTYlq20
   wOMmDh3JSiEynqOTRI/gfBbjeJtzRfgT9tw8qbzvcDh6c6jCTy3Kjc0Eq
   manBM/D108imSNA4ukOJ4McDYZOUUhU5YTgJ5yssyJs6MkZ2KPRFacb3G
   mZr/CoT96lTr0/jH2vhmc3VDaRTxmQ6eU50zCHcJLdAZvsopDo7JS0GQb
   g==;
X-CSE-ConnectionGUID: U/uKHpy4QIOuh3HHCpzvwQ==
X-CSE-MsgGUID: fZ556juoSaWQKDi0Z7d3sg==
X-IronPort-AV: E=Sophos;i="6.16,241,1744092000"; 
   d="scan'208";a="86117895"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa03out.arrow.com with ESMTP; 16 Jun 2025 05:23:21 -0600
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
Subject: [PATCH v4 3/7] dt-bindings: vendor-prefixes: add eswin
Date: Mon, 16 Jun 2025 16:53:12 +0530
Message-Id: <20250616112316.3833343-4-pinkesh.vaghela@einfochips.com>
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
X-OriginalArrivalTime: 16 Jun 2025 11:23:16.0546 (UTC) FILETIME=[0E253A20:01DBDEB1]

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add new vendor string to dt bindings.
This new vendor string is used by
- ESWIN EIC770X SoC
- HiFive Premier P550 board which uses EIC7700 SoC.

Link: https://www.eswin.com/en/
Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 5d2a7a8d3ac6..f19a1de2a76d 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -498,6 +498,8 @@ patternProperties:
     description: Espressif Systems Co. Ltd.
   "^est,.*":
     description: ESTeem Wireless Modems
+  "^eswin,.*":
+    description: Beijing ESWIN Technology Group Co. Ltd.
   "^ettus,.*":
     description: NI Ettus Research
   "^eukrea,.*":
-- 
2.25.1

