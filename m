Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 519171FDA89
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748256615; cv=none; b=tsnMQniwHCP+tmZzTkBD3sFnCrzruGuYaPQN/s2rYvQvUn5c9gUU9B/WZW/wUD29yJ7orligT21bNJO/jWY+fEc5DLStbtj10gerh82xE8K2wSUv934Whj+wPfu+slnhBWTVj7R0UrJpTCs9ygCOkjrjCFVcI7D4MEO/V+7uu1w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748256615; c=relaxed/simple;
	bh=yU2q2dc/+ye9DTxIWNsU5+R7KFc2SHPwmGkeguoT2DU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fkya9bhkFRWZs6JMqDsJncfgIz/EM5n3haOtCA6cJ1Ps91N021rCJIMgj7O7kEeop/c1LGBRQt4tcKMgZ0WwYBMC58/kR8mOoxStCBfoyynk/wr32/BOZsRpot/puUZxQ8uK21iCJC6F5NShKy2zPc+AoLPb/+QOQ9cuwmlKE4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZKi4Yxf8; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZKi4Yxf8"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-440668acbf3so3348295e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748256611; x=1748861411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cG61swMbPld1iw/+98rFclnYQ/laAvEp49eN2rhhuD0=;
        b=ZKi4Yxf89MaoGNzI9gAkOxTWglmbyBLI4996/CmEmdSzBbM0Nuf8o3+NM2zvpBHC1b
         3RjTtqarnBAhQjGoGngHcgIk24OIjREmN+oP0QaCsBBNmAVrNqzqfXOiYmsbhKXP/zM2
         SbaJRnp37gQoQryqeicmpYBFjDwBx6YDPtp/ySpvI9Eq8gfkEjyK+BDgqaaOn4tyu2Qo
         sdZEncNoCZ/+CXZc22cWVU4pOViU0TJdxR6fEB6toKT67HbL0dWjqL9XEXBAd8CdnyhH
         TUdmlqS7/lFADfjvPLAyNrfmUveILIm4zO4cOUTPFgE/uy4QzlRwXjtpx7GQ9IIyq9Z4
         lxAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748256611; x=1748861411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cG61swMbPld1iw/+98rFclnYQ/laAvEp49eN2rhhuD0=;
        b=MAC1eqK08hcVyX/azPDxS38x1IjMH6qQxOZgnhd2ujXAE81mDs3Q5fSgY5TzXq9D6J
         HBXGG+ITmnQWkNyXz2r64lyfdEb9bk/ULk1aysCxBRIJvbZkaiNJENh96KgK/rCe24AC
         WRefkAnyv7oXFDD/kHjF5U7sT27H3Rfra5akloeHbQhETHND9RNNEcvOQRtY5BC6X8uj
         27YF3161CicrEG55HS7WQ7x+P+C2JYEOobOiWCxXEgKlnnUI4WNEo/6EVZq2SixK5UaT
         hOzoE/CvJHupZ1v4cYzoiKUFWi6h+5uVhY5llRL0o/944048oVkX4Fwq+iNq/Oee7BXQ
         dzeg==
X-Forwarded-Encrypted: i=1; AJvYcCUeYSTuHhnp52s0Ft9DPdEb0y0G+MrXksuG+zgiWyUvjKnEAsKTVgD2T6X0KAz1ATm9bXGTz8U2jU7CUUM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/pTm67Ekm9QWSUE9T3bSOervYjEn2+vHR6RYJaQZFmtD1Fo9G
	skhxXA3R4Gs+iWuDa3glpQmN6SWU6/w8MIkIchXMW1Q4ktIIRbnxvZy3vF+yJPnMuqeeObF4zPJ
	a9sUi
X-Gm-Gg: ASbGncup9zF50iD8SFBZ/lyFnH2jBv+GJpUtQTINZ5SNPt4xuRnOiLtWOvvukpobEsW
	GQmBs46c6Zf+pPImFa6b/D3iJxupgni2U6OKeMc3pM/0bD0/DnFo0Ogr6NmXXPfW5odkFUdFk3U
	mXfdeHxh7d79uMTJfxXgZS/CdeUCwa5vmStpXEGyDEsLGab2VxkAnRSg9zkF+WFXSVbSij0mST8
	676ccFC+M8m1JS+Nrzfb1g0ybgTZCgbwHpNvllWyyk2cQxQZ2di1HGuWHpIwjS3NfgfNygR/EE4
	WBxCvxzNSZ0bvIAocLQDN4WHlOtec73KiJ7JYw9LePEBch6Q1q1dXgCnTcIlf6j6Lm7IbAY=
X-Google-Smtp-Source: AGHT+IGnwTHuuG+Jho/HJOTkFbKRV/f+Q8dqSHAsHXqa/3j8hdS8CB5qeUUJMIQv9Qhw06xYFkFQhA==
X-Received: by 2002:a05:600c:c0c3:10b0:439:94f8:fc7b with SMTP id 5b1f17b1804b1-44c90f4ccb1mr16989755e9.0.1748256611031;
        Mon, 26 May 2025 03:50:11 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f73d4b68sm236337215e9.23.2025.05.26.03.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:50:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 12:49:54 +0200
Subject: [PATCH 5/6] ASoC: dt-bindings: qcom,wcd939x: Document missing
 VDD_PX supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-asoc-wcd9395-vdd-px-v1-5-64d3cb60313b@linaro.org>
References: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
In-Reply-To: <20250526-b4-asoc-wcd9395-vdd-px-v1-0-64d3cb60313b@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=915;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=yU2q2dc/+ye9DTxIWNsU5+R7KFc2SHPwmGkeguoT2DU=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNEdWT6Qq3CPHamy1JbqY3q1W+b8Ex7iNBmMFR
 d7LsD2+YDyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDRHVgAKCRDBN2bmhouD
 12B/D/sEd9n9p/vaz9wGIctCYELj5BTiT1VBT+p/3XG3w0sikeA9hHKlajpwaNkPLykj+JVhtiR
 0VFC96Bd624OTu+kG5aKf+uEOTLp1nNpgNDUNH+dJTH3oKVzNxOiuiDNLRgPcv9x8gwDaOGQNqP
 Zx+NAv01ezIz3XG9fTL3z9qLbAW0B4EHrbDPBIfK28+RAD0iZcoeI+HKUK7K4jvdZpqxjbNGt5w
 x1IGp9k8FJ1+vXURk+xEaAeaU7DxR2nTPxfrNiZI6JKCT5WLW0iZSpHljodiY/13UU6em8Y4g6P
 Bsfx5Zh+uNVNeNfLgkzzQ5rATWC7HYgs6xO5W0brj5TCejaI8gzVdz54gA9aYpaCQlI3mUaDT+G
 hJkRTic+gKhJo9Bx9jGAdbTFkx8fLsZUCGrn73p3CZR0CQaRBFIf7sjK2gl8HihFjLk8uEy8fpC
 VM9md59JrfKKIHjTe1cfu+2BwDk9QKevkMPeYcx/KkWc5nkbAtLGqZ59iAmPE4C+usboX4Wcr/I
 JZcWCjm+q/esf342a1C3qdlUGbLkzybQIobE12JBbYXuuCCO70m2rQma5WvtRk/AsDA1cm6Yd6R
 A2e5mQ3e0PTCCz2OEGyaOFjfKVWTkczXuz0duEjfNu/2p2oL8xImYLF9VZIfW1FAlHYnUrGBEzC
 q5bqf5AYmCAI5ag==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Document VDD_PX supply on WCD9390 and WCD9395 audio codecs, which was
missed in original posting.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
index c69291f4d575ca5b4fc037ac4d59c91f0df74cd1..85283f94465d4f1ae6ec7a250e0c7f65d2fca172 100644
--- a/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
+++ b/Documentation/devicetree/bindings/sound/qcom,wcd939x.yaml
@@ -45,6 +45,9 @@ properties:
       purpose of handling altmode muxing and orientation switching to detect and
       enable Audio Accessory Mode.
 
+  vdd-px-supply:
+    description: A reference to the 1.2V PX supply
+
 required:
   - compatible
 

-- 
2.45.2

