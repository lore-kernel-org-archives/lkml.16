Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B0623506E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 08:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751011326; cv=none; b=cjF3l/Xu/ig+5OJBt5gTyjn5Qha3Ncsaq7vxO8VJMw0o0HZVDeq8+sHXiW+AAefxxYTZWON/kERAqmJHPqtlBgyiLOG2uL5Yr7mRhKVweOcTXwWGiiysnKteD+LQJCg+Yyt3MB0w/AmFokpMdgtqLhJac4ZhmJsv3u7PQvfR4fY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751011326; c=relaxed/simple;
	bh=Os18r53ZbPW4+3PxVUJh52djHd2zkWOgpdekfLd7+7U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pUNQMw/LWvjh8SWLDWMcdB25Xef/2rHrm7rQWWgH24amZq0vU5oHQm5bPjBU8yil7JUjFcr6YbDZeVeAcFaW49s729d6w8GYfPX8MJRSW4uTYy1ZuTF1ikJl9Z1PmLNKmMu4kJqZzEYKW84rHsiabcY8hUIGaHWGUrNaemF6bio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W0SL1E1U; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W0SL1E1U"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a5828d26e4so263725f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 01:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751011322; x=1751616122; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=;
        b=W0SL1E1UUZJF1os23ujdDapsBCOg2/actmz1nKtCESjyG7qcrFv84+xvpYJ8m9JtYR
         zXWp6334fLwHIWI2Uyq5TMHDlpfCFA7zoK/j71Ad3KI5Z5e/60o/qBjmwREMG8nmCXOX
         rFR4HIwzFWLzBT6TAFF4BTinlahPdNb5GJ2Wfl8IJsTEWHWrJcyCNPDZMxwFoFwFkixU
         0cjAC73j74SAGFoYTW8LQZ9t3Iiab3sJqKW4jNacXv6FO+ozyEUkt6V/T+d/cnDAHT4A
         3pF7BRAc3dXuYo2eqH7Ghpn+dFYwqhYo7U8n6aRpCyDlMR0JMekzd6+8E0mKW1ZxK2b/
         sPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751011322; x=1751616122;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hVQ26FYhE65N8xhWnR/yeeetwdVwmUBewq4SGVBPUKU=;
        b=FyBHx8kZ2rpIz0oMDIoCPMYAh5cgXv2Mn1ZLv0a8y4+TjQ3m+Ejel6T+5pir2+gOqB
         oqSVwLGPGbftBtL47AnEUstKctWt1dg5fGsPqfLLy3TMRMvhFyew0isOc7aL451eOpw6
         DV2+3gLAXVh4L5KFvh2Z/UbYBRiIqHfmfAAvJHd995Hj6jJNVKQ/3qQ5qpqqkBv5iZIz
         giA5ujwPsbvI30OMXNYLRqSbhSLzSlg00SzQC5NoUOB3dmvrHu2uypRJ2Vunwtk8brY+
         0a6+FCV4BzUz70flq3l+tkb394V4gWpLbPAu33EPBmfSkmgUJlJkzXz1VnmbVN2vxHSg
         57pg==
X-Forwarded-Encrypted: i=1; AJvYcCV7m/z2+28NWJepOSf980jKCf97V/P7KSlZhHWKJwC0zvJBHUd0h+LDlXqGCFb8zSqGz0XTsFc0gAPYQ4c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyK8MSjKITNo/cU3OG37sm0kuZ2UpQ4lmlpXGz7qgAnEYPwtRte
	Y+LlN405IzwkKtCZI5CAssQPNtZt8YES3oA9fAPqFzXFdug4mG87LBvUnkiTgWH6rV+Lq7a31fT
	c7Hg9
X-Gm-Gg: ASbGncvS3iTl0uA9svK8ZXgBTO8mStfvtzYu6sZHvETtlkUHHQv856ZufQQeD7MesyM
	XbiNOa9wQBW8SKBAsPG9+jLmY7SGuv3fPbN4fT5/y2uBYgRr+uZgNzpRpo9nqPiGnUnubKh34di
	JkldLgrUeKGTG1vEGqUXrdmy2mOAeeAeZETQVUlKD2dBHA/u63Axd84QWDqcSlxYVgfLv/hvpg0
	winvMfpJvA+thpZnIJxJUj7Gbef6Zgo+GJ9XqyC7HcYz2nJhIol7i0EJKByEyyhBuWKlc7tGnd9
	+UDsxHp1iQJsre9Vc+0gCoPnSJ0OYUqvXa/2R9F/vvYnF+Gekwtfz2mjkwjKf95J2l4STV8eGC9
	0512efuBYM44=
X-Google-Smtp-Source: AGHT+IG+OUuFO8zduSqG52Q/uKbJtNoMJ4tCAnBmQyaOHPjqHe1gEHM8je7qA53jNQAj3w0qWDlO6g==
X-Received: by 2002:a05:600c:3b2a:b0:43b:c825:6cde with SMTP id 5b1f17b1804b1-4538ee24a9cmr7911235e9.3.1751011322546;
        Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a423abbsm43490295e9.39.2025.06.27.01.02.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 01:02:02 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 27 Jun 2025 10:01:52 +0200
Subject: [PATCH 2/2] dt-bindings: phy: fsl,imx8mq-usb: Drop 'db' suffix
 duplicating dtschema
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250627-dt-bindings-db-v1-2-d5c7072acbee@linaro.org>
References: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
In-Reply-To: <20250627-dt-bindings-db-v1-0-d5c7072acbee@linaro.org>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Vincent Knecht <vincent.knecht@mailoo.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Li Jun <jun.li@nxp.com>
Cc: linux-leds@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1112;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=Os18r53ZbPW4+3PxVUJh52djHd2zkWOgpdekfLd7+7U=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoXk/0+ng738Vf2atAtc8/9LZzBj/cRNYfbJxNV
 4fZiTT1cVuJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaF5P9AAKCRDBN2bmhouD
 1zPRD/9ec1PBGRt9uSGVge2T/60FqQRPu2KOpknFFJ3Yj2DgYRFSk+cXIn3PZ4WYAVB/TIJslkB
 ZIl8QaXjr0prI1lcoi0bW4gqRy+srh++tfMfquip1o0iXOCp5aogQjaYO6u0UFcq8C3+GharY9I
 bMigbXVaL/jZ4lajDdJdM+y7p+5AcdOT9IvlYrTdKvappu9skwsr3bRnSI+mhOT63xhyIF7DWFW
 zJSWlLnRXfR1N+GLwOxrnjllEQNvCpAsHSSF7941WAxyvIznVNXDTgQ78QVhe26fbd/F1hs1z1Z
 DfpRyzJsH4uEFlNn8L3Y+7AEYG/kF83EVxbdZpqmgPnuMTyE/lulfK0LIRBr3hy35j/MxYpxSQK
 5cvNU8yfNqQRq4fBQJc9HR9Ns8Xyu23bvbjNXaNb0ek6aOykGhZ4Ggi5EzVxNKMicwX/XCmsDDs
 t47EZRIViAWLgpWgxClkV3I+AnGiIQMs59AEAbgFTc7Uj+WGvsYZbeGlbix9YccewK0RopMqYCd
 XmBy5pgRiTfFm1XWRcITflD24deF+yfdUT8arxFklLnGBf33AqrHY8zHb/E5u9Xov3xZTcs/iqJ
 nD5oqiQ3Dif0Jftw7mzCCalnUJJ+lJFXGwmWilNvJYtuB6eDo4xwTFz1Ca92alNdhDTpZIGC7f7
 FaegpyIa3vtZbbg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

A common property unit suffix '-db' was added to dtschema, thus
in-kernel bindings should not reference the type.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

RFC because this depends on dtschema changes and should be accepted
after new dtschema is released with this merged:
https://github.com/devicetree-org/dt-schema/pull/166
---
 Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
index 22dd91591a09428214afaa4c9c8e37aae9bd8aba..6a47e08e0e97b286538798190225ca2966a7ab34 100644
--- a/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/fsl,imx8mq-usb-phy.yaml
@@ -76,7 +76,6 @@ properties:
     description:
       Adjust TX de-emphasis attenuation in dB at nominal
       3.5dB point as per USB specification
-    $ref: /schemas/types.yaml#/definitions/uint32
     minimum: 0
     maximum: 36
 

-- 
2.43.0

