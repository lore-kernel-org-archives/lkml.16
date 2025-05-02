Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 653351E04AC;
	Fri,  2 May 2025 18:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746212207; cv=none; b=OuhoxcX/0XFMSmpWSDOMykeU83+96L+sBH/cuvsMnp89IgZFknXFTWEu8bbOq7sahwU0IsU2CEEjSNV36+Nufm9ok+FxJSTsCWx9QvLCRpLFVXgMAbWyhUu8Q+oihKnsvII6f8AGvjgV+p7IP0XBiVLXmi3Z8qqNwzZjwYVPWZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746212207; c=relaxed/simple;
	bh=JwOXtPS7BSEnD2nL1tGht0Ft29x7XdscNbGf2At+3tI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=giPA37kU8pA0MEp1XNYTWMuCbO3iwkazSLLk15uG+GUqH8Tjn0INT2fbnq1qnd3VqshbWvw0oZwkKSGWK8jQStTxX8RRZJem27Kb+bstGApYpQbXgXTG5VaEHExgcH6CmtIdYxbiLaj0ghXXMk5ZcJuXQb0K1YJ+OXj1wuj4VWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org; spf=pass smtp.mailfrom=postmarketos.org; dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b=n32iTJD5; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=postmarketos.org header.i=@postmarketos.org header.b="n32iTJD5"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1746212203;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7ApIzObDd4nyzZE76GeFoWuehixdxnhUAd8DIc0B6Jw=;
	b=n32iTJD5oBpZCgPWtz3amPLjMHCeET/z4qWCwqpNar9RWnPtd1NRXePBIMSjj2XxSIFZMj
	fjS/QUVJE75HsiyvrYcTGZYrIfR8hXdbL15sBepwvAWDFXorHTP8eyFWoEbDLsGGzfgAQb
	VdCPVxK/r/sNk0i/s/mfOiOZRhQ1+bE92TQ8JG86+16+3e1eW4++iY1VguChF2ZMJ2/Xx5
	68mWEzFP+L6XfFlydIplJ85idCdmSxJuW+pZnuV+wcF5agdBxzaQGeSawjZyUF2ly91UuV
	b0ADllQssfAguC3K/gJPDlX1metdJPgunwh3kZPYuipGYC+7WFUJpHB0+ty/1g==
From: Ferass El Hafidi <funderscore@postmarketos.org>
Date: Fri, 02 May 2025 18:56:05 +0000
Subject: [PATCH v6 1/2] dt-bindings: arm: amlogic: add S805Y and Mi TV
 Stick
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-aquaman-v6-1-f1af347d9709@postmarketos.org>
References: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
In-Reply-To: <20250502-aquaman-v6-0-f1af347d9709@postmarketos.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 ~postmarketos/upstreaming@lists.sr.ht, 
 Ferass El Hafidi <funderscore@postmarketos.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=openpgp-sha256; l=1247;
 i=funderscore@postmarketos.org; h=from:subject:message-id;
 bh=JwOXtPS7BSEnD2nL1tGht0Ft29x7XdscNbGf2At+3tI=;
 b=owEBbQKS/ZANAwAIAYSvy9DXiZoDAcsmYgBoFRVRivrcQ5h28FcP2PqARQ6nd480JCseyXuYI
 bGZng2qFTqJAjMEAAEIAB0WIQQDAbw3+1VcrP15i+6Er8vQ14maAwUCaBUVUQAKCRCEr8vQ14ma
 A/LHD/95OO9OVFAXb6dFZJxD1L0+y3U86mLY/RhOWX1Nha4y12J+k10AEPzw5OKCLGnRCbb/xi7
 f84hJFm3sxgnWVhptJHlAzX3DVWe09WT2MDamnWA4TMUE9KKV4IW8VZjJ1EaI2hwbuy8ie+p93q
 ruAKT7QZQJOlCfVrOiWC3YiB8/8nJ/oLFqqNdnXmi9Ywrke1EGG52gFuRZoFyGIGELE9n/ZwdVY
 zywwkH8HOLSWDESBfXayzKwdE89bypV4rtoerfHgTnl3Uekdv8Q7gFg6QuWwK+yI6IDpddE+fBv
 OTXr8WLGDEUCQrfEisith/+USeihlVTs4zLMPnAYVpXgcz5Kr1Voi8kJvQaXcVmZnt9wXQNhZXe
 SC595o0d1jmqy8O/yG2nMh9FJRjuIYNM4rYIqAqeuiSUMzqI/gOiAGFRFF6lOe7qiHCWk0Bn/MF
 j6FgMJPnDHLwFIm7mcNBJ78c53uFVje2K4ZTXREoT1ZJoDN8CbUZXzeTnViPoLbAumaYISRomtP
 UYL4405L/TMjImsb2ld1pzF8Y24wQeImPjxLQHcPsbTM2GF9d+bYX3q3BG/ja05fOydcd8eg4VO
 t9QEWLavgnYW78365i5dj1DE/4Nk94QKvjCyfItzyb7amjcYzk+dDDuR6aZDyNkKDZClxsi8x8M
 zaGWT8GY/kwfHkw==
X-Developer-Key: i=funderscore@postmarketos.org; a=openpgp;
 fpr=0301BC37FB555CACFD798BEE84AFCBD0D7899A03
X-Migadu-Flow: FLOW_OUT

Add support for the Amlogic S805Y SoC and the Xiaomi Mi TV Stick (aka.
xiaomi-aquaman).  The S805Y is very similar to the S805X, with just a
few minor differences.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Signed-off-by: Ferass El Hafidi <funderscore@postmarketos.org>
---
 Documentation/devicetree/bindings/arm/amlogic.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
index 0c84c56855bad5b924e6da1da374fdb611c2087d..befc51765f9cc28e11bc12ea958bd2981d638cab 100644
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
2.49.0

