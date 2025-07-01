Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com [95.215.58.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2C9302CB2;
	Tue,  1 Jul 2025 23:17:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751411864; cv=none; b=AVRCrhkwyfZjj54GdYWUAaX0bvHzhg5POw0svrnbHj4ztT+H5ocmsZ4OwmbKIgbZnP6YoaQQMEXIB16tr6EQSU6TWRMV/Ao+d4sNPjVLjCT3X9fyDGKrH909YGI8OIsRfa+tR47Ueqcb3J0fFLGjvz++6oLgP4zC8GuBr93GIkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751411864; c=relaxed/simple;
	bh=tHAOfmWrKC2MO0J8+E3XQ1TtW8obhRiT/OhAQjCNz0o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nMEpEw5ZI/yfyw4eg1Q7fQoWVDX9r9gTvEaCGu418stDiG3Cq2R4K+Fih1QOn5mv3uxrFr+R7e/4z5lAUfsL25K03PvA15NfcJmaero8s50+elZaMBOZtLYV7Ond6JynjZ8Bb5ieAiGiQg87oqh32T9ar/gKoNbZI9wlusdwztA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool; spf=pass smtp.mailfrom=packett.cool; dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b=sP7ag4YE; arc=none smtp.client-ip=95.215.58.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=packett.cool header.i=@packett.cool header.b="sP7ag4YE"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=packett.cool;
	s=key1; t=1751411860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fVALWoYDFjauVrLrvxQSV8FxyXgrZXKC9VSebAbBFY=;
	b=sP7ag4YEyIBG2mQjyAhCKeWne+FEXDG2ZpPy/1Zagsb9UAukQR+g46EhliVlRPN0vHLmdy
	JpahuVu97SJU6c0n2lJG/WDrcsrRYj4ZUZY29ZpQdVdUqGZDcmxRbCJcWI3JTCA1OgiGk8
	98z1SQJ1q75krx5In8AO3bHyFGqSGRCUPxOhpko4MuuT2kEoNmcvEPKwAd6c0tL29tAxeF
	FqjuausTKUeQVoLDJb85ksvdcLmf8Av3sqMl3Y+IzVZVWkUmaITLtOhOQzuTODhrFY+pKb
	oU2nGVklAk4HTU1yxwdwrnVOTpx/jtanhbe00bfQtECOZZNKbnK7v+oxn7PBMA==
From: Val Packett <val@packett.cool>
To: Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Val Packett <val@packett.cool>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] dt-bindings: arm: qcom: Add Dell Inspiron 14 Plus 7441
Date: Tue,  1 Jul 2025 19:53:24 -0300
Message-ID: <20250701231643.568854-2-val@packett.cool>
In-Reply-To: <20250701231643.568854-1-val@packett.cool>
References: <20250701231643.568854-1-val@packett.cool>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Document the X1E80100-based Dell Inspiron 14 Plus 7441 laptop, codename:
Thena.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Val Packett <val@packett.cool>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ae43b3556580..8e3b804864fa 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1146,6 +1146,7 @@ properties:
           - enum:
               - asus,vivobook-s15
               - asus,zenbook-a14-ux3407ra
+              - dell,inspiron-14-plus-7441
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
-- 
2.49.0

