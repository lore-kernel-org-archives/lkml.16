Received: from leonov.paulk.fr (leonov.paulk.fr [185.233.101.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B5617A2E6;
	Wed,  2 Jul 2025 08:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.233.101.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751444608; cv=none; b=outVh1o342E3ksySmq7Mfp1nlGf7LCUAIubKOzGikMntG+U26Q+ymhZSRuceazmH58eBgr3UKsG74hsP4w3poBPjVdPDU/puMnfBmXWGrH7qf8uDd6eEXoJ7THy5cG9GjG6PB7SFLXZd87PAwz1/cCm2Hyi1x7iayt55X0w4SOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751444608; c=relaxed/simple;
	bh=WxSznPqbYbVUoE7up+1y8GqEmNKZ6G36aoavQc8B348=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GawGGuXHvrqG39YyFfyhDoSikY4TLdFNDuM3wleKrpa8QHw16z14OSJcP/qZQDF24yGgQ8Y0vI3V4f/ELC9KcqDO5AjkftWXHIUjor430EXCDU7sDTcpEMCaA7+GWncnQ4PuuxipRHmS5s+1Q3wuzbjwZCFDCC+Wbaa92Z8+1+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io; spf=pass smtp.mailfrom=sys-base.io; arc=none smtp.client-ip=185.233.101.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sys-base.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sys-base.io
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 733C51F0003D;
	Wed,  2 Jul 2025 08:23:17 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E809FAC98C0; Wed,  2 Jul 2025 08:23:16 +0000 (UTC)
X-Spam-Level: *
Received: from localhost.localdomain (unknown [192.168.1.64])
	by laika.paulk.fr (Postfix) with ESMTP id 5848FAC9884;
	Wed,  2 Jul 2025 08:22:32 +0000 (UTC)
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Paul Kocialkowski <paulk@sys-base.io>
Subject: [PATCH v2 1/2] dt-bindings: display: simple: Add Olimex LCD-OLinuXino-5CTS
Date: Wed,  2 Jul 2025 10:22:29 +0200
Message-ID: <20250702082230.1291953-1-paulk@sys-base.io>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the Olimex LCD-OLinuXino-5CTS, a 5-inch TFT LCD panel.

Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
---

Changes since v1:
- Fixed yaml indentation.
---
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index 5542c9229d54..f0f7ed4f9d36 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -234,6 +234,8 @@ properties:
       - okaya,rs800480t-7x0gp
         # Olimex 4.3" TFT LCD panel
       - olimex,lcd-olinuxino-43-ts
+        # Olimex 5.0" TFT LCD panel
+      - olimex,lcd-olinuxino-5-cts
         # On Tat Industrial Company 5" DPI TFT panel.
       - ontat,kd50g21-40nt-a1
         # On Tat Industrial Company 7" DPI TFT panel.
-- 
2.49.0

