Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A8F1A9B24
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 09:45:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750067161; cv=none; b=MQbmjj84oFJAx9NouT8aFNiqIsIVsQ680T2lgWBxSytjNiaQtt3JJFZC33/Dc7UZg1dL5rj26CWyKyYWA0w7+GQdfCjgZA8TBHIwBybgtnDon+DvneqMNyzYe4/cH/ix028ZFC8OKwpB9ynHO7IpQANOGFPJrG/jU6bBati8t2c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750067161; c=relaxed/simple;
	bh=OuFHBPiSDnHElYnOnjmGAqSP02DaggUPcI3IBLQcgxo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A5V6VSWe9ohMKdGlxcXlrf8Il0DGB9GAeyzJkwCAYDMzyboJVpFYdr9oFZDaoSlqEcDnaaAzulhqsrya9AkLrwc9qLMjEiKoZwDcIVJuRttOPafgI63jAPkO5NAEv05mAh8B7Az0nnbDEYQ4nCAS2gnGJmyI6lGw7wROAN/D8ak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=KKY2kJ1g; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="KKY2kJ1g"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-606b6dbe316so9112248a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 02:45:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750067157; x=1750671957; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YviJvB3mEmC6/KWy4TJGLCulrpnF3rGNjKlkw3ObS4E=;
        b=KKY2kJ1g477V2aDopHXzOBX1g0Wr+zGKwVmr/Okczw8j9JzQ5x7HYV2cq6h9bHVctq
         0P2o31ltbSwQBfB8Y4J/Ro9w4NsFwlbjHngRm0RUV0CQ/aooT1Lzk4PUNFjdaDZ0GN9r
         ftsHm8EbMV449i0taD3ClQQd74SG1+fDoENZHejQmtX17/kxQhZrbuoYeqCbD3jxBtpS
         A8EH7YnIYDuLapnQndYwx0u/7sWA3+1ngemlwxHKowY0Vm7SYrk/BG+B6FENPkgk4LYD
         HOLsxhuuM2x47f48QRI/yCk8S1Mmslw+qhzinKxlX1lKhcUQTQ1nUUn3Gqj32cSxMJby
         GXrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750067157; x=1750671957;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YviJvB3mEmC6/KWy4TJGLCulrpnF3rGNjKlkw3ObS4E=;
        b=fkD+/qm5SKzHC4YQxwUpTZqcs+YRuQAlqqms0Z1+37TA25jlWfa8sVPhhT+bQJmplR
         6nxwisHhHUHBxJI58MDh2gQIlPqQ+lqwvKCgO3eke8/W9SZ0Srehzm5wpbvb+A5Tjc3O
         dx5sBtmNQodyOHp5Hs05GP7rKlpZDzRIbTvCAvcD8BK1RfryOMKADMvdndZkzIle87aS
         J7zOwHpZSjpz835eopFG5NTFMBhUA/f9vnV6s3tnFpFf1y1nVYsgptrXZQ+vkFsm6Nry
         WSloROi6N37JrkAfLerdWqFfaiNiXh9eS29cBMlXTFY4ffzf2L2F7cMzjKGdcRB/sF2P
         UW+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVSmtm9JxCxYq1YPx8H17Wp8wTxQ3OgL3dKw/0teupnw6gRG8jd2aAIDZcCNH12hHcRtt26btJrtoIBMOE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDYjl/efRQhnCA4MZYjPC8uObkHUgDMhX3R43jT5NfLZmi3F6e
	RxrUH/QPQtiJ+QvkzZKI1C++NnE0gS/ZRqPixqGqVqIkqYL2j5CsIaFBLkdWtPpXzC0=
X-Gm-Gg: ASbGnctYTR619/dCtxJbJO9nosYf+BFTzV04dT88ncapFToIv3KlwttObx5bNzwm0QR
	rrXy/ngUp4JoP/7j5FKu+uu6JkTpKK6io2QDbduGOfQwobw6Qv5jowVCHJyXh2+8ClMGstyhr0y
	P0U+Gw3yhUY1WYW2/TyWpk2wruIM+b7eh0DDvi4c6tGt2d8RWrEmEUXRHqq33yRoO4E7hFUPM5Y
	BfqkAKsHcS42eUUw2dGw3a9VMnfrGCnrLnqxyvn4/bZyHVuozui0cKX1oH8PDWcNCLhOU8aFbj8
	P/ZDDin21WiNcd3L6ufv9W0LLZ+ZDc76cxTAHO+OhfCB7DClNj2m/YHtKlBVqbxXlhjd1SDc6sq
	A9Nw7z3PJcPqnhel5vUJ6BsEVADx1r18xZkD4zQzdJOM=
X-Google-Smtp-Source: AGHT+IFBvUYtkCndZW1QzfC5qAwo46v0T9wQgNbc8jLt4Uif3oBrNGyHRoJQOBcXYgi0oCzQrIclYw==
X-Received: by 2002:a17:907:1c0c:b0:ade:1863:6ff2 with SMTP id a640c23a62f3a-adfad5c9158mr790453566b.52.1750067157607;
        Mon, 16 Jun 2025 02:45:57 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-adec81c0421sm613375666b.46.2025.06.16.02.45.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 02:45:57 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Mon, 16 Jun 2025 11:45:11 +0200
Subject: [PATCH 1/2] dt-bindings: phy: qcom,snps-eusb2-repeater: Remove
 default tuning values
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250616-eusb2-repeater-tuning-v1-1-9457ff0fbf75@fairphone.com>
References: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
In-Reply-To: <20250616-eusb2-repeater-tuning-v1-0-9457ff0fbf75@fairphone.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abel.vesa@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750067155; l=1248;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=OuFHBPiSDnHElYnOnjmGAqSP02DaggUPcI3IBLQcgxo=;
 b=/lx21CCyQJsnPnwSwibTX0OuPV2RXmhvYrgVwxk7E6o5tH/+ZPfJ8KQWyk+ryg1uGi12QFX0x
 QQJMaToq3B+CMaAcZ7HaCJEL+YpaHqDu7P9lHab2Mwuuz5XVdjjg/ZL
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

