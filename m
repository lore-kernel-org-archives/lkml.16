Received: from naesa06.arrow.com (naesa06.arrow.com [216.150.161.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBCD01E9B0C;
	Thu, 10 Apr 2025 15:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.150.161.27
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298733; cv=none; b=Dw3kfonpMTa9xsEvBgPZt1qhvyAAJkzBcULLidu/FN9ggEsuuERYqrhudKfrXZDj9tFJrD4KAJEwE4b4LsZ6EkNlnYWmDorYk3Q4kva4BCYnedboBeB27yvwsJ+gxaHZopRzDEOR1ECxomGweoopNRA3V+LlKOZK/MG5GDFZk50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298733; c=relaxed/simple;
	bh=0ALTharMqIir38+9/Eaz/083RGv8Pd04I92YF3XKwHA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FpTU7zS/nrCx7ZNLN3lCEZ3zQBwKWDaLQKkHykwJJFfVhIhI2mbAFsvI5gQJXPnzlE9mbF0zIIMOWWgk0hNGgDC18ZHmUIU2SRU6BpYm99nvAspnUu/2OIsFZQqXQu+95ORetra7H0vv79QK+1jYbY22dAetQNrXmu+u/CQvMjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com; spf=pass smtp.mailfrom=einfochips.com; dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b=cd1iDQ8d; arc=none smtp.client-ip=216.150.161.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=einfochips.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=einfochips.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=einfochips.com header.i=@einfochips.com header.b="cd1iDQ8d"
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=einfochips.com; i=@einfochips.com; l=1119; q=dns/txt;
  s=NAESA-Selector1; t=1744298732; x=1775834732;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0ALTharMqIir38+9/Eaz/083RGv8Pd04I92YF3XKwHA=;
  b=cd1iDQ8dwhSooTdv7wiVgptC3Uxn8vmGoMDflFjTOkj1p8o/eeLoQZB+
   c18eKnZ7rSmqDGDnvwHt403Bg9VpKlbfazRudpNslANY4QpVOIImA/X2M
   AUYo0MJB9sv1TcX0yECv9ETO8ONJ74EqiJrNiW6wvyHHhTHkvRDbsF5Ga
   MMaTvgKZ10MD8r25HdQVpNr02lv9FJ7a+lEUVGvW3hx8PH62tyoIlyMrU
   jszZ9F4mpIrvIMpfVwGXQyYeWImMUGMRkBUZ/961CYfVXUR4llotYdqSa
   D24lniyIlVLgIgt7gt6ycQMC46TBEkFvuYt5rCCfhAz70InTsL0WeATPR
   A==;
X-CSE-ConnectionGUID: bqY+UpqaSYKacwV9paOx1w==
X-CSE-MsgGUID: XWGk9LVnT2ylhwBZv+kGUQ==
X-IronPort-AV: E=Sophos;i="6.15,202,1739862000"; 
   d="scan'208";a="22941718"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa06out.arrow.com with ESMTP; 10 Apr 2025 09:25:30 -0600
Received: from AHMCPU1888.ap.corp.arrow.com ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.14393.4169);
	 Thu, 10 Apr 2025 20:55:20 +0530
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
Subject: [PATCH v3 07/10] dt-bindings: interrupt-controller: Add ESWIN EIC7700 PLIC
Date: Thu, 10 Apr 2025 20:55:16 +0530
Message-Id: <20250410152519.1358964-8-pinkesh.vaghela@einfochips.com>
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
X-OriginalArrivalTime: 10 Apr 2025 15:25:20.0048 (UTC) FILETIME=[C5268300:01DBAA2C]

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
index 3dfe425909d1..ea7093fde060 100644
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

