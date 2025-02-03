Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEE020CCC2
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738604690; cv=none; b=G6iDRrHll3yOHfwdupFxKxsuKsAIiC+//Us0srLxn3ZUhxu4m0UlPT5o59ZvGazykLbqyMwWQOJqlWu970IZpdz7nUVdGo8KBdiV0WOTTUhkAtBU/xhugKh9K/Ymlu5cCHOe0t/aO5BctBjFpDb4WJvuq9yyDagcw31dQLih9Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738604690; c=relaxed/simple;
	bh=jQKOQDrOOGLR72qeT84RWujKcDniGLNpWyPi4ZhyUNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sjcS4aopjjTndNyCZeXds6x8L54aILSYbU9hGqyQvtD+RTq3VtXpxUvm5X9GBAFQmT9dejVS0qeFq6ojEnLy34a1oXbwH1lLC3YHZUwvl7m7YEQEZHYHp7kelyN32CQsTPpkHUi420aFIESW1MFmxGApYbKCNjNpjmt/cXJONFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=gFHMjG8w; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="gFHMjG8w"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1738604685;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AdYSrp7Ifw9Djz6sdTXRJ3gQa8DUAzacW2HnJguzAfk=;
	b=gFHMjG8wR5tiQJX1El+bJtjdlSoKh1o/I1zo+fxv+a8wTzgN12xCqAMNPPhK21dHq6/4q8
	YZZobfrNWBWcPdPqmPafXnD0pJNEG0TBhL4X/kapPSOJHhnkocuKgJ4nB9/YW+o7EZBUu8
	BU4Xw8kbu8ORS4lRpuAmMBRAfXP+XIuhF5SCrOGummJumzi3p+oYAIgfquOIcQaAJlKlrE
	qCIFNDnTgyNiDKr/s3NWcwtPSjYBtcg8WSSqpQyVWjiKD1FHSe9z0u00Xi6QoDDH3fMjCr
	F2kxqW5hZrEtTlFbF+iTRCwWYwSBslgwG65aS3Lt7OTtoiXm4wawY6Alyg41gA==
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-amlogic@lists.infradead.org
Cc: linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	funderscore@postmarketos.org,
	~postmarketos/upstreaming@lists.sr.ht,
	Artur Weber <aweber.kernel@gmail.com>,
	Karl Chan <exxxxkc@getgoogleoff.me>,
	Christian Hewitt <christianshewitt@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV Stick
Date: Mon,  3 Feb 2025 17:43:45 +0000
Message-ID: <20250203174346.13737-2-funderscore@postmarketos.org>
In-Reply-To: <20250203174346.13737-1-funderscore@postmarketos.org>
References: <20250203174346.13737-1-funderscore@postmarketos.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0647851ae..3403362e0 100644
--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
@@ -73,6 +73,13 @@ properties:
           - const: amlogic,s805x
           - const: amlogic,meson-gxl
 
+      - description: Boards with the Amlogic Meson GXL S805Y SoC
+        items:
+          - enum:
+              - xiaomi,aquaman
+          - const: amlogic,s805y
+          - const: amlogic,meson-gxl
+
       - description: Boards with the Amlogic Meson GXL S905W SoC
         items:
           - enum:
-- 
2.47.1

