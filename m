Received: from mail.thorsis.com (mail.thorsis.com [217.92.40.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD3F24BD0F;
	Mon, 10 Feb 2025 16:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.92.40.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739205950; cv=none; b=ifIykvuE3E0etLuAJ2/x/Ga9Un68X6mAVrfF7eednBbYN1FaFHzjlDyUYM3GDq/ij7+aCpMDByUsbm9tBFH8E5sXgh7zUZQt8B+wem6rEZqBj/QXmq+mJHk5APwYN062PjpUGVnojisO1EOWFOoR9lETA3kql3W9DPvl9+nv4cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739205950; c=relaxed/simple;
	bh=b4lYTDnpkr0KJoUnCnG4HZU0UkFb/yot10aEK6Eco8M=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mAlaxUixTRM/rBnd10GOmwrfSvZTJwhqSgc1UMergJGOvz4KPfK4yNKbidv340tRfS8nP8zlAM1wOPYqYqYt+/4R3MoCv6tMemqzRlnNpJuaARYbgvNQPLtaAoGvXU7QFSNU07daWVmBoH6jfCCous6yx+ytpDiugbC0rWVh5L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com; spf=pass smtp.mailfrom=thorsis.com; dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b=ZwlPk/EE; arc=none smtp.client-ip=217.92.40.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=thorsis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thorsis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thorsis.com header.i=@thorsis.com header.b="ZwlPk/EE"
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 160D2148026A;
	Mon, 10 Feb 2025 17:45:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1739205946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b7LZo2mymbyoxBQ+HVYCFE4IwziNlomr+D3mfbsPVcQ=;
	b=ZwlPk/EEHCFUY+znTldtIjO5fYWORis2QIZRHWBwqye73x6TlDNAIqmxTV02KONZ7hIlNL
	BbTXgOxSYjYl6FkT4ruIcukZk6T9rMXUK7joxvXKDc4XqlsxYFd7HFhdeL94l+yFMUyWDo
	XqMh1DnERQMtiX+h6T51jhwHgyt/0iNMjkn9Hl1wboli+b8RY/IQ+5GWV316kukApfpK60
	mIhpfwESXhoSI2Pq2A51zbxVbdrLD374bkMtPXPmzsbFmE5fVYj0VSWscfRNKQmy+ffnWP
	v7XI85fOimcPRYzaZxmN+SgKvcLMV88zniERCYZwAH3zHdHErjPk24gUf1n0MA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v2 07/16] dt-bindings: nvmem: microchip-otpc: Add compatible for SAM9X60
Date: Mon, 10 Feb 2025 17:44:57 +0100
Message-Id: <20250210164506.495747-8-ada@thorsis.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250210164506.495747-1-ada@thorsis.com>
References: <20250210164506.495747-1-ada@thorsis.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The SAM9X60 SoC family has a similar, but slightly different OTPC to the
SAMA7G5 family.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v2:
    - Fix dt_binding_check warnings

 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682e..9a7aaf64eef32 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -21,7 +21,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: microchip,sama7g5-otpc
+      - enum:
+          - microchip,sam9x60-otpc
+          - microchip,sama7g5-otpc
       - const: syscon
 
   reg:
-- 
2.39.5

