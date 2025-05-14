Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D03E21770D;
	Wed, 14 May 2025 11:56:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747223770; cv=none; b=fZXwF6QOgXkGH7fmBjt2SaF0OQF04US5H8GFotUsetIqA9K97/dHoD11FlkUwrDMzhU6s/bZr2wor/f0edJZ4i1V5OMMTeqSUeYvfUb6Ix/lPHgiey10YuM06EOATB8Ycmho//hKRZoap0Oit1I3vjBU0fjj3wAEkIHe7WAw6JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747223770; c=relaxed/simple;
	bh=03qO4U7yeAMiNm8NqrhsDiQX3XmavNIEE2Y1aHqZjhQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K4LJWDbp6A4uJ7LOePF9wSu7WSgkoE6OTLBSYSufgY3oNRTkMEV5ZNrZtcdKKdcnjh7Ura34M47nm/5O2MeWEpSVFUOvxwe//VWH8gY2Hib8JNvM2eCr27rv8nRxCf2oKzR/mZza49RCHnVISSDL4ctOnouEPhWMaauujh1z1/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fAMSzKpg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fAMSzKpg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id DA9A4C4CEEF;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747223769;
	bh=03qO4U7yeAMiNm8NqrhsDiQX3XmavNIEE2Y1aHqZjhQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=fAMSzKpgasPE1vP13EZmdRVW0RR8kBprF5+4OXR5/BGoCUfbcl1WXU0EbuoF6E3QZ
	 ccHsP/2AoqSjDeoGBGm9V9aPkrxmSkuaNju0N8ouiN7LW5JC6Twi5JTNYkZFDqPQlY
	 37ypGLWsloOricYhzMrvPCBHlEQfHrc3OEKS8x9bKaj7ijzbhig9mItaksrSssA3C1
	 eQxdOGpNCcfAWtgBwl6JaBWqJxvMZMmtO2rpw3eKHWokKbxxgT17Q1JD+LmS2JARsI
	 LSNDpEX1uilkJAf6S7FL3NO5gCzss/lv5LD0czlQX89R0/nOSIX/CHt/NMGMpRJbuc
	 PDwko8NGrs8GA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C79F0C3ABCC;
	Wed, 14 May 2025 11:56:09 +0000 (UTC)
From: Alejandro Enrique via B4 Relay <devnull+alejandroe1.geotab.com@kernel.org>
Date: Wed, 14 May 2025 13:55:54 +0200
Subject: [PATCH 1/2] dt-bindings: gnss: add u-blox,neo-9m compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-ubx-m9-v1-1-193973a4f3ca@geotab.com>
References: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
In-Reply-To: <20250514-ubx-m9-v1-0-193973a4f3ca@geotab.com>
To: Johan Hovold <johan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 Alejandro Enrique <alejandroe1@geotab.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747223768; l=746;
 i=alejandroe1@geotab.com; s=20250514; h=from:subject:message-id;
 bh=3xJpnPbRisAKL2+dPmneQBdkYHGq5g2cneB0rP+Fuic=;
 b=63IpCvQdkbBYkX0QTX0yjWJPaRm8LjZ6cUlPCKhvTUdIEoLLNVv0Vw08upHRK3rV/fghhc+QD
 Q1JftRbJlOlCW3069s5l46Y8yLR1FmfPU4uVd/P9BCdocsGqBINdEjE
X-Developer-Key: i=alejandroe1@geotab.com; a=ed25519;
 pk=xzHMPbqczL/tMsjXr26iLoHwIzLveHVnT+GIU4p1k38=
X-Endpoint-Received: by B4 Relay for alejandroe1@geotab.com/20250514 with
 auth_id=404
X-Original-From: Alejandro Enrique <alejandroe1@geotab.com>
Reply-To: alejandroe1@geotab.com

From: Alejandro Enrique <alejandroe1@geotab.com>

Add compatible for u-blox NEO-9M GPS module.

Signed-off-by: Alejandro Enrique <alejandroe1@geotab.com>
---
 Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
index 7d4b6d49e5eea2201ac05ba6d54b1c1721172f26..cf5ff051b9ab03e5bfed8156a72170965929bb7e 100644
--- a/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
+++ b/Documentation/devicetree/bindings/gnss/u-blox,neo-6m.yaml
@@ -22,6 +22,7 @@ properties:
       - u-blox,neo-6m
       - u-blox,neo-8
       - u-blox,neo-m8
+      - u-blox,neo-m9
 
   reg:
     description: >

-- 
2.34.1


