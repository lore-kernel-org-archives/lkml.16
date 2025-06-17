Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B38921B184
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 08:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750148814; cv=none; b=s7vuAxC7md6sDEw53JUIJjBhyuKXxux+PBPvHuc3mAqGuvi67Add08nRDJeAFDDD1eI8SV+yo1d0xXjGpbAQIiZLpRW+XvyoU4TdXCNVI56MBJqntxWqgMLfq1q70e+gL2ra5JlH+C45Md4rRiu+ATZ8hZMo6hNhyFYerM/VLNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750148814; c=relaxed/simple;
	bh=OuFHBPiSDnHElYnOnjmGAqSP02DaggUPcI3IBLQcgxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mwvGw+osVq2QJsTfFi7kAdYcK3KW6hd0SMjkRZwvHLPMJxQCZqZR7gAA5UtuCC3FvldUdjg8Cc+63O5SrRmFdchw76aFgkbScokAHj5U2bwQs/D2fVZkbyYecb2gAqlxXZK12B7S/nUo4iLGpMF0m2V0U00tGW5xG1SS3++CQDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=hwB8MCAl; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="hwB8MCAl"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-6071ac9dc3eso9449419a12.1
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 01:26:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750148810; x=1750753610; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YviJvB3mEmC6/KWy4TJGLCulrpnF3rGNjKlkw3ObS4E=;
        b=hwB8MCAlQPWyirbl2PJIuLMLLwk2+BWAKVQHUna5ugou356P4gpZVZVAoxQyZfzOHV
         383nDkRku9cU8xoaR2njit1B/1EZ8247fS+Iu6zp2JMCTxkBJjXsaZ/C4uCRNqbe9GRj
         11dDmoqy9en3zudEzofc8TAtxipwqtp4A1cE7f7JiPaFUecb2+SpNWRXactUzVoBhIEy
         SaCMsSkR2buYHg2y4F8sw9RwkRIH6xB05IQoSEY+DXalTb52iEVG9yI6YmiwSLehAcVP
         tWZEnmDvL8NyrMLme9JSOIuMLWBKS9iOknu5puKe00FWKAelzIfFEDjt61zgqkHfjX4D
         2Ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750148810; x=1750753610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YviJvB3mEmC6/KWy4TJGLCulrpnF3rGNjKlkw3ObS4E=;
        b=tj2iY9+B6+yu3DhSrKO4fnWqH3aKYf/0+9sOT++OJAbAOr/7/S/gPoZN+X1W9hRWea
         b49khVCgFtpfuW3Xyop/o7V3as21R7sU2q7DCwDrzbS4xtdee49sql87PkjPrwcBRlOB
         hA+bYVUAJSHN3Mh3xFRuOFX6kd0STEItvRYZuvtEJC2fbNl95QXPJB9idb9QvsSeXkfv
         hRj/UajQjLtUraPP+BHCk3yIMNndAwQwCr21hFuqc6MXliECxvelQI+emgmNGeA0wpOb
         iI1dtn7Tv7bTf0RQa3ClXZINoLl/bqsVRKKYQ0V/SIFDuQN40Vo7JmE4FCJA1gD/yCMn
         b1rg==
X-Forwarded-Encrypted: i=1; AJvYcCXnGr2LY/vMujAMDioxX2enekawIRsRZxjguH76qA4vqd9FOgXS3PEnH4HgilJO1NXboDnIJpF8RbmDEcQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzkDDgU61a6lXm4r9jwcQQMh8YGZLoHkXnCBTcgg9Xi6P/9nbc8
	LuiSPksLVdSaouKaHvrs5/QeBcQY85YwpAHN1uxogSuVJ6ADHtvuaBetmCLCGSE9B4o=
X-Gm-Gg: ASbGncujHKIDggk+8PZ/a3NGha2zJ3gSyqk7OLriW7lSgTkzNwXy/X7YmIGcBz0f+4h
	IhZ0XwGCEHIWfs6Ef1I4ztAOsd+cowTMiXOYGhEmt04wgPMwVORbdy8aPms4hu+RGDOR9aUEIry
	JFzqaZ6fWM5hvo6TAUrEGMQ7DhUtQcyxPGAl8kMKH7ZVwsf0dfQXM9Nogo0rj0x7+yjtEcHnURf
	3/8b8hcRmxySVzGCLtYTuwchpt0M+zQWM1bv5nuTXGNCUwvspyj3B6KVUEWQGQnYFrBNc5WGPGw
	m1T0qR57v93T+9d3HdKQQtWQZzIKJbAnuPx4MAdPw92DtcBnwKbXPGnF90nKIm4itoOhdRfVWNa
	eYPbQy71CTeGrmr6gArkPASgb6PNueEHl
X-Google-Smtp-Source: AGHT+IGBvTpgEQKuySRgZVEiRHZ2+eHm/TawSN1WIXCTKv0QJZ0mFrD/xYMqMzEBC005W5SZjLK1TA==
X-Received: by 2002:a17:907:db15:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-adfad4829eamr1145395366b.51.1750148809831;
        Tue, 17 Jun 2025 01:26:49 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec88fd993sm840343166b.94.2025.06.17.01.26.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Jun 2025 01:26:49 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Tue, 17 Jun 2025 10:26:35 +0200
Subject: [PATCH v2 1/2] dt-bindings: phy: qcom,snps-eusb2-repeater: Remove
 default tuning values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250617-eusb2-repeater-tuning-v2-1-ed6c484f18ee@fairphone.com>
References: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
In-Reply-To: <20250617-eusb2-repeater-tuning-v2-0-ed6c484f18ee@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750148807; l=1248;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OuFHBPiSDnHElYnOnjmGAqSP02DaggUPcI3IBLQcgxo=;
 b=UCQ80CGhJn/9FqQFeZwlp30F3hVlXhrqM3yVHy6N6PzQRXNd5o3I3x9xZBw7MwlAHFwnNd4d6
 GwTHiLUsOF9Bq/0tBC90+tbE7BOOReriWMhCM7iRdLHn+l8kQzBkcpo
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

The reset default tuning value depends on the PMIC, so remove them from
the doc since they're not accurate for all PMICs.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
index d16a543a784887eabc69faae2233057c4554be31..27f064a71c9fb8cb60e8333fb285f0510a4af94f 100644
--- a/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,snps-eusb2-repeater.yaml
@@ -39,21 +39,18 @@ properties:
     description: High-Speed disconnect threshold
     minimum: 0
     maximum: 7
-    default: 0
 
   qcom,tune-usb2-amplitude:
     $ref: /schemas/types.yaml#/definitions/uint8
     description: High-Speed transmit amplitude
     minimum: 0
     maximum: 15
-    default: 8
 
   qcom,tune-usb2-preem:
     $ref: /schemas/types.yaml#/definitions/uint8
     description: High-Speed TX pre-emphasis tuning
     minimum: 0
     maximum: 7
-    default: 5
 
 required:
   - compatible

-- 
2.49.0

