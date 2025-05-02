Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D1826157E;
	Fri,  2 May 2025 16:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746204211; cv=none; b=VzNe5iDxw1xVKyFoizKHppOHIW7JW6uC1H86lbp8bmSdOiwqFW3FWxQB11QTKFCt6O9rVULDadm0bZIxi7yey1K+gDbd03UArhpZk8sqF7eg+98E8RmsvI2Y8YfuqXSBqDT+XrUCOS3oNb2OhTPRIm6naZCYYJmEPbotGdpdPNQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746204211; c=relaxed/simple;
	bh=X2Ng3agimfiOa3XjrZaTTRUXoUq+StkbsTQYQSI5kBU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=We44gSbYdwl/RNkvfly/xYcImRR0uIig+G++GCrsQxRxhd57f/ScP+WKQbpuOhuMTPp8X/7ZjM9madwJJPCjfULKODkhmJlQOqM5ycn2Jb49RQdzdR7J5yjck+Ma+YhAgrz7h3Yjg5Jdh5soE9wUXwWqfPwEokKwioRAvyg68+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZVqt8R7h; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZVqt8R7h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746204207;
	bh=X2Ng3agimfiOa3XjrZaTTRUXoUq+StkbsTQYQSI5kBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ZVqt8R7hTEtpyGw29k2ISovDQgjRLUBeIRsJtt7SHFM/kjQuWgidGNN9bxjosfC3u
	 +GxffksQhGqNVVu8CSg3UZwAper72bRhraZcSy/b5Si4WGO66AgmqALFuEl9l+k112
	 +DRfEVy9NwFmVV2VgArnldMYxm6O1k2FX8V9Y/0yLRjNWcP79kFV8JQChpmdt7L75P
	 z/j3g8I4ec1Q20H1iqIqQuQGNkcUZ8QHpZ+1tPJgXk2bNCVQKIM6sjWndkuhf+AbyP
	 2h3PwAOgqm1kGnfqdMsmZvRHS6SIRBTqLpAIHJhRJ21t40myHKqQ9egvHzySuYsndj
	 JPNMn9wdHLJ6A==
Received: from [192.168.1.63] (unknown [70.107.117.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6B05D17E1062;
	Fri,  2 May 2025 18:43:25 +0200 (CEST)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 02 May 2025 12:43:21 -0400
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Add
 mediatek,mt8365-infracfg-nao
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250502-mt8365-infracfg-nao-compatible-v1-1-e40394573f98@collabora.com>
References: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
In-Reply-To: <20250502-mt8365-infracfg-nao-compatible-v1-0-e40394573f98@collabora.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Amjad Ouled-Ameur <aouledameur@baylibre.com>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 Fabien Parent <fparent@baylibre.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2

The register space described by DT node of compatible
mediatek,mt8365-infracfg-nao exposes a variety of unrelated registers,
including registers for controlling bus protection on the MT8365 SoC,
which is used by the power domain controller through a syscon.

Add this compatible to the syscon binding.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index c6bbb19c3e3e2245b4a823df06e7f361da311000..f655ec18cc2d96028d17e19d704b62f6d898fea4 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -190,6 +190,7 @@ properties:
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
+          - mediatek,mt8365-infracfg-nao
           - mediatek,mt8365-syscfg
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-sysreg-scb

-- 
2.49.0

