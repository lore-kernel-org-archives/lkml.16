Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD0229E0FC
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750842885; cv=none; b=NiK7CVTMqfhiho1tUccX+1PZC760Z6r6DpZHzZHFeepQfQ9vRw232/KevRqEa8rNHLQCq5S0sOtddkaI7EBGnOMDRVMf+TS56k1fFQLm8p09BZ/1h0bKjMHH8vM07CeUVw/8XpnPPGtbt3DQ8BBs3TPeJX5DDimrR+tQlO8PsFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750842885; c=relaxed/simple;
	bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Miu3tIBuwPkW6lRoM5GbQJA3/nljpzX4msxf5JlvvNofZC21hcK032P+FoVrj3Z/seiEwDobAk0DjVGYWHbYkkLOICCV5K03leT/NPdlKjQR8I4BuiWza82MomVo9iVSbzZKVII9QJghwtFLL5mg95xOOgnRrIMtXCk2ryVZrVE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=1GjBIvz3; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="1GjBIvz3"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ade4679fba7so239512566b.2
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750842881; x=1751447681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=1GjBIvz36b1r+IthEhw8y67JdzzAB9NTRvfVnbimVWoJelvUV7/9GcBb1tIGAbsxvB
         TnqrQYRZOfNGqpwmiSRSOnJefcmVH/YPy1Nk748GZY8s1U8Q5ESdFR5VT1Gyt7MenqjO
         knhfiP1W/PogDdJG9MQn+Uo1kK/MtkXX+oaXbFu0HoEab+PSQqDN4JpruzTEMfBPHgDK
         CJ7+ZFOKl1gc5m4RNFUfEHG7LEaK9CRq46Ew666CpwPakB+fQ6s1tVP1bjXnDwBPA86/
         2rtmVAt3dLpskSGFrAFi7BlLBpPmVzldClCsYiIwDvk1eLSx2qCGQy3BwSLYOgcBBJsd
         CzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750842881; x=1751447681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eaodSZscksOv8tm14xnsYu3NQ9jnag2C5XRSXbuw1WQ=;
        b=mqOOqMsOsebdM2MClROdbi7YPzFRLp9+1q/s8y/RWThflmaYYREL65xAlpKuZnuPRs
         Y99IFAWOw9yLe/dz08yWJ5CiCnHI1gkWSxzyXG3O0H3dH1I6G7dtJ1hq/j5m/az6Cxsf
         FMZCeivzO2kmig0lrHYvwE6zPWebFxP8Br/cOAHZ6AUFmMZnzHMjtlrLxrYv/qVgGrAH
         yIse83fArRhjE+UeZBBAjogiYNBb2/zB8rutHQuAJM8TIzsUGJZip+pXyobmDyCcXOnf
         DD2pvh3UAlhL8msrQLOHHpF153hGygZ+Yap8JI2A7zknlZTxqe64ZAfheRRc/Mk6xooE
         IOnA==
X-Forwarded-Encrypted: i=1; AJvYcCX/euhyssBHDutDLUcQhvIaa6BWqRVq7Gm6spfWyh8pVrNkG1nJ0gZWdpgEf6ojXZTho0baUNvEzEp55ME=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyh16YMRXMX674E8po06WZoRtnaf0WxlNOF7MwOo2qyMtwUcEOR
	fDthhNHpsLOgMwSmdsR6mhBHIN80pk510L03oM0oZOH9nAK7YwePDitTvD24ebDZ37A=
X-Gm-Gg: ASbGncumaVbbjMe/3mdLnMkaEwKqif1pLVEdKCHN25lfFiES8hXqxs22gTRC9v0B1dk
	QcqAiif4LrfYdGFRLr/St6ygduV7IWDD4l4T5iiZBKe6hNXkORe4SY3PkEKewZ39kKewjSnj+6/
	gUc39s49dnd3RCpxSnXlBytsHpkFJ5xZmtVMIrafDZUQcdCa0384ChYbFPSyKHJkdnrbqIWgntQ
	l/lA2R4xQSKOBvfm+odRwlrMHt5udi0ttFKcZ6hkn0buE25G0ZvuManXuwg5fRYycIIi4pyWYSD
	S4T2r5X0WU2dIfrvoiy11CZdKGkKkHpeEedy+VBnDOOzMH08G2Qucq8TjROSqr+FPDsZYuKNfhK
	N5+UoqWOF+4Y2YIEzXPYWlUcX6rSu1HjT
X-Google-Smtp-Source: AGHT+IFunGF+TjIwhPwj7Rlya0zRP0lHBHlNUL1mjavzGDv/ErrwypExO8gGDjyrAhjbat4NdQqScg==
X-Received: by 2002:a17:907:94cf:b0:ad8:9257:5735 with SMTP id a640c23a62f3a-ae0befdd107mr232454866b.3.1750842880971;
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054083c95sm1021480166b.91.2025.06.25.02.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:14:40 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:14:30 +0200
Subject: [PATCH 2/4] dt-bindings: phy: qcom,snps-eusb2: document the SM7635
 Synopsys eUSB2 PHY
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-eusb-phy-v1-2-94d76e0667c1@fairphone.com>
References: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
In-Reply-To: <20250625-sm7635-eusb-phy-v1-0-94d76e0667c1@fairphone.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wesley Cheng <quic_wcheng@quicinc.com>, 
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Abel Vesa <abel.vesa@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750842877; l=978;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=HKY7AzgHHOMUKSqDSyXSmqFr6rS8cg0ALPFDJvvYf80=;
 b=pP28XPa6bi+AGmir1JGO84WkB42ZjM3elJtM0fuLH4V4x+sBvSLyjs+iDvGCt1Ejj0fMGiu/F
 6MUAWaZpQkqAycz3ZyI0H9Xi+Fgd3En7swav7XUkjWFIENM9Kb6pWsQ
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Document the Synopsys eUSB2 PHY on the SM7635 Platform by using the
SM8550 as fallback.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
index 142b3c8839d62d91377061ade3a7c400eb970609..478d6e315a4f19d624af28710eed676bbaa144e7 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-phy.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,sar2130p-snps-eusb2-phy
               - qcom,sdx75-snps-eusb2-phy
+              - qcom,sm7635-snps-eusb2-phy
               - qcom,sm8650-snps-eusb2-phy
               - qcom,x1e80100-snps-eusb2-phy
           - const: qcom,sm8550-snps-eusb2-phy

-- 
2.50.0

