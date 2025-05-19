Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D30EC267AF1
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 08:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747641913; cv=none; b=LqoqaKDQ6P5ASxN8LATel4TonjpHWIHGCZCR2x6pY5STyWmuDhqvFgYOSpO34r8YOhOHj8kljtzstpddLS8y6AAtcyR55zvEuCkOW67CT7AmCC10otcoSvCDUFY9oDoyr3YmMPbMokOZEfOxSzDUf5fskkJriQ8UZdTtesrPQHY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747641913; c=relaxed/simple;
	bh=eNjYz8w5sMtLPA6MRlmwOuJOvQJcZkOlZvehWvQGnwc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0lpliS6XGnmUJvMzL5tAAsWXxSa8i0Llg5VmURRFiOgocbTolEY//mmFZ0k64ufBIvtoWU1fw5PBk2ayniwoHTQbMcfvIKu111nXylbxMVaJdhwI5uM52WcUVUIBoX+OBTjHUQMhjaGDBh5CWWTQ+OHudyaAeGwOt/gOM16FUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=G629HJlG; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="G629HJlG"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a362e099cfso389775f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 01:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747641910; x=1748246710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8/uUno12+MugHV7pnu6lW/BQmxMIkNtzIi2L3w3Py9U=;
        b=G629HJlGOK/DqDwwRndxRb7kVPzIaiOhUQ2N7hr31r+aqRcStJXWZy/Cf4qzzv8Cmn
         B70ha21/+0Yh/nPJnuDLImVWLKBSpmAcDu+JgCIjkOdfIdm0Sn/FUB7hD2A4QqBtAvCo
         re/AdMFeEuRqzWaP7v4nmHkhD/HODM16c8hc/p+wsuWUFXFOHP27edJsffZIw3XL5VeZ
         PEJU16/uvPLNK4rgsTUN286sVs9sOZs8Yv6esHlZ+0SWsWPitpvViZZSssUZC1+uuV+j
         H/IL/TieZ5GghwbqknA6T2FP11kHt/oK7lE6V8y9Q87r9D0ptUZFo0BjA4P7yrCMdBpQ
         mfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747641910; x=1748246710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8/uUno12+MugHV7pnu6lW/BQmxMIkNtzIi2L3w3Py9U=;
        b=TZfBgumJepr2r11qRmJS1b7vFqOXDuGmwOqGOGYBM+mKPpKId64eSBA3BpAmyT5J0D
         /oCTttHrp6Zdpaadfnw62K7ngf9CevWD4+Q2A6hM7lEoeQcPVcoLlxYZOEsjmF7s1Dnn
         wZoPUGSFRIoI0Hmj2oRaOyNDBHmuruQnPwnJcZoxgZOQU43E82TGcPJv1/MfwGwM+wAU
         qBM/DQIasCytw9mk2rOXjCvV7avcQ+tY3rrOXB3TeIB+QbQcFh96BigVdxjANCoszr+3
         3vcILWAUSomTnAQf/7zDhp9guzvW0HDSwZwvTVVR/gJhYr9HMWN9HUGmpwpsdgnDWdjh
         CzTQ==
X-Forwarded-Encrypted: i=1; AJvYcCUoYucxsluvoU4WSa05EeZ4Oaz7S9KNk1Q2ewyAngKOJ8+OZ2C+cSCfb41nA2oHQvpnlQAUDVDcSDUXdns=@vger.kernel.org
X-Gm-Message-State: AOJu0YzYgRoSVRxEcwhsqD69OcuN1bCSmRCnRJ4KBJoTwP7Ph7UWt2fQ
	EWf0Av2k6YiJbcNRlDCT8UMn8hQagI1gnOe8VnNFhCEcDGWYIAmtH5+ZFkw9mvHBhMc=
X-Gm-Gg: ASbGncshAF8Sp4KHJvm/pTvm6w1yDJknZyUVLe6H1Lh8ykmYkAxdhUyiWQ0h3oPY3Cw
	OH/N28oo0pWDCz9f/Noqjj3KPFRjNs0hSGvHhZUrdUHljtx6Woqc4uAaCx4C3HmWazfXD0mdnRm
	K6Atm5/z1TvBBUE4cBvBzAtzfFR8MmEfiPGpOQtz3+M0BfGdtqVDBlvLwoqe9ekGysVI7XtZkI7
	T0ngzOtBAnvGBgSCla83kNrU41UWOurIJ4PvZ3/VttqVhF6T7DetcPHZA5mDxhztjV3klCxgg3X
	aJUbJ9Cx6J1Vp8e2dwgbiCX7OIBNS5Dm4V+xnPBiBfWtm9fRUBhGcosFUQS7Vg==
X-Google-Smtp-Source: AGHT+IFeaCCRDIubiGu54CbK3aqd0Ov35Z88utQJJcSo42eFJKtNFYB/mAl3+BbnejgRY1XpJld7rQ==
X-Received: by 2002:a05:600c:3b95:b0:43d:2318:ed7f with SMTP id 5b1f17b1804b1-442fd5a2cb4mr40169245e9.0.1747641910121;
        Mon, 19 May 2025 01:05:10 -0700 (PDT)
Received: from kuoka.. ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3951854sm198293705e9.24.2025.05.19.01.05.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 01:05:09 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rao Mandadapu <quic_srivasam@quicinc.com>,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: [PATCH] dt-bindings: soundwire: qcom: Document v2.1.0 version of IP block
Date: Mon, 19 May 2025 10:04:54 +0200
Message-ID: <20250519080453.29858-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1500; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=eNjYz8w5sMtLPA6MRlmwOuJOvQJcZkOlZvehWvQGnwc=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoKuYlT1JUthzmjuD+5hZUrrF5hzhw0Rxr6qB8W
 fqh1D8/n8iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCrmJQAKCRDBN2bmhouD
 1/ZmD/9yMrVo5Z1OUYC5ystLok/+hkuXW+ZI2t8xpC7liKuSsx+sQGa/mIC6E2dlZArUMyj/IFO
 Vic7WtnzS7PUr5I+EyR4Jj/EnlMIOAvqrUXEUBnzBwYNXcdPfpLKc74oGuLaXsy91AlhfyueNag
 wXcw6tmf2ExFNmzB8QkKh3FQlhwNmuYPt0TOa+xmsjaiOGhqtP+5iahvuQAq83mNwe1zf1UY2rn
 tVqAaMsV/knQga1I7Ut4KKhxtWaLQCT/NyYutJnagPPn7Ez1vPSAkqEebbuvwKdWWns30oRig7h
 a5Y4ycgybvLKRFKn0k6hHDPM2ZOcyIyuoTx0KS0PWWCR/jg5y1Jz05ODeN5sHJ61cqKr8bSmJeS
 dOxeVvxPtDE8+Na+3mYd3NZNYVOH+DgUFidjMqG0G1f0WSTd6yRAH5CjEgORNN4g/wSNNgeKcRk
 dM4gFGIHffItVVYLfr6HZPuSp+eK7LQCvPNU6kbc9WrZlupCGozt8JgvwljcSIo+MnM2ehN3dGr
 HIteZvFVxNBOGtIJoysMRKYQShVVlTDAXrBAuuns53X8O1cCBKUUhzh3h25yJBg3QWAeoOrwe/v
 456r0QTrl+hOYBEji8KtOJJm/6kmpg8lqXzwQqhEjwAf2/7IMqFsbXZ2RvIAJFrmKd37ZB5wmvs zTdOtaBYkfdJpuw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

All Qualcomm SoC Soundwire controllers are version-detectable (even
1.x), however certain unidentified quirks might be potentially needed,
so document v2.1 version used on Qualcomm SM8650 and SM8750 SoCs,
fallbacking to v2.0.

Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/soundwire/qcom,soundwire.yaml    | 19 ++++++++++++-------
 1 file changed, 12 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
index 3591c8c49bfe..95d947fda6a7 100644
--- a/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
+++ b/Documentation/devicetree/bindings/soundwire/qcom,soundwire.yaml
@@ -15,13 +15,18 @@ description:
 
 properties:
   compatible:
-    enum:
-      - qcom,soundwire-v1.3.0
-      - qcom,soundwire-v1.5.0
-      - qcom,soundwire-v1.5.1
-      - qcom,soundwire-v1.6.0
-      - qcom,soundwire-v1.7.0
-      - qcom,soundwire-v2.0.0
+    oneOf:
+      - enum:
+          - qcom,soundwire-v1.3.0
+          - qcom,soundwire-v1.5.0
+          - qcom,soundwire-v1.5.1
+          - qcom,soundwire-v1.6.0
+          - qcom,soundwire-v1.7.0
+          - qcom,soundwire-v2.0.0
+      - items:
+          - enum:
+              - qcom,soundwire-v2.1.0
+          - const: qcom,soundwire-v2.0.0
 
   reg:
     maxItems: 1
-- 
2.45.2

