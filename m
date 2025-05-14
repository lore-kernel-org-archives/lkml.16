Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB74020F079
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 10:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747220234; cv=none; b=hv2ptEnnuD3R89Nq3yF/UHc+bLLXLg6m0PD8BpS0x9Iu7/u/JEMiJu3qblPSMFPmM3/0BrYIJ8By1dQ/pGhiEPHHkIzsxfVfkr0mkHvyBjxYK9MAygUywFOyLFfTJY/lU+UVPa2vB02vJkC7u0G82gBXx5JHkOm7sMwd5PTb50I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747220234; c=relaxed/simple;
	bh=Io3JrD/y03dOQPQAcqJF5SS7b20bby4BHdbd1e9wLMA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F+uO6x6hoNLOCe/8wzMccPH23PV0IRoeekTat3lZSo9Bi5b6G8L4QEWmKWrFkYabZfmZKiQNemrtw8XRO+WzltFz9NFHUDsAI5YUK8eB35d/hZuxag64MZT48ab4ScmeqzCz4KKQI66nPVVshU8odmq74GA6qiNM44QtzKACjlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=b2sOJpam; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="b2sOJpam"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3a0ad54f0aeso584652f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 03:57:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747220231; x=1747825031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y4E8aOwQAaUdRX1dyEnehNt0cEoTdcyb+vzWwLzLf9I=;
        b=b2sOJpamHS+OogMULNrBBM5HX1UW5BJQjKv6iEOLtq3+ko567dhlJcTUKKVuwnanHW
         cF5Y6uTVamoNaz+/6K70IdrrcCMtgYEo/lbLQyNkuk0hXbmVNyc49s2q1LsbirE59Arg
         HiV6Y/DnTSwmQcY21gkFFfrDzOHK41KeMclNimXmQs/+MBui1yahGS5gtcwJXyQSD3rD
         ZsAXOrw3hoqt0Vlpnsq6cM9UnFzfiwn4uQ0uQCA1mMIeU0QZCZ8lg9ueaxlI+RyvN4qi
         F94v5YudyunFL17TfSgxzHAEymYUdVlUGEQIXGRSkVhzkhk1bcqZlbpUlqvpQaRVY9pY
         PYew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747220231; x=1747825031;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y4E8aOwQAaUdRX1dyEnehNt0cEoTdcyb+vzWwLzLf9I=;
        b=UaxW5n5kpfP6UJ9aHdf8c6Ar8lrfCvxeXWK/+3xKrWcCmov+TIoj8PaZF6EA4L1NoX
         QL+x9E7ZiVT88rD15XdE0dxrVR0kDxwluGsTdoQ40jcfISqDzkYIyOJqDbluDO1F8g10
         w4iq+WlCrwjOByFP+zUDt0LZ46F27B62TMR/bZVz1QQDGn5W+sVIZAQWN9aQPaMljfw5
         JTFoaq0cQWGuvJYwMv2kMa+Jh5RiDMyQakvF4ehoFMW3hizsf1GEiMsQG3KMpVgae6kD
         4ukcVBaccfTljwuHwqoO67VOWo4Z36W7kLU/PuWqW3gFkMaQp4+yXvehDrvxDASe9NOS
         J7Vg==
X-Forwarded-Encrypted: i=1; AJvYcCV+lkuSglK5l0etEK7pgg9AI6F/2yCTq9gWtRiq0rhb8VFQ3tcttTGDhjDv+lLaW53bpkGCc7+WFRWjgus=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPXHQ3BLGTI5JYQ0PIpj+CrE7ND0CjV/Tvf716kfxgZK9AYdyh
	sPoXs8d1DbYiwNzed/HkXMVrU1NnLXN/qNePsMefWUG9KQK3A4BnUDjciSlNYBQ=
X-Gm-Gg: ASbGncsil2Hm54O9CUu2yQ4LFeSBnuwU4X8WRcRUdaS4rycDG/4P2sMwgKMZsmgZpAF
	ZXQWfG6udzCsuG6VyJfCQcktPepWIabN8D9izWfH7An14TAVhO1+TsMQmD3kWJGTpaaTq0iZqSX
	S2DAU7OYqCmHEuxgwTSqGfN2fRBTe9gZ4oBKe7HbXnMR0BIT7GXFeen41lMi2Exy/AJKPqxjCu9
	1GMeO3KacwP9ajC2/6IUI4hwW+G+bbWYL09llfwGOd8KAcJbRkm/hjj4l1/szVH1ghhlj06wedL
	etxuI2fAM/Ck1YrjmOo5jJjDKs2MV7DGnoe86BxzV62CTVMsdYXUuj6Z+E3m9uDyCQHeukvZ0F1
	2WN4HrIbal80PWqcwGXdj6kb4vImz33RcptvNjMa5wx4FrP3MZg==
X-Google-Smtp-Source: AGHT+IFtksBMN8N0y1ipHv0ssNQ0FUDjeBMyouJ1A0vX+2sBsa+p6vm/UIeQxO60xKTk6b6EFmeb6w==
X-Received: by 2002:a05:6000:2207:b0:38d:b090:a0c4 with SMTP id ffacd0b85a97d-3a34991c966mr848096f8f.10.1747220231062;
        Wed, 14 May 2025 03:57:11 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442f3368f36sm27362985e9.1.2025.05.14.03.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 03:57:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Trevor Wu <trevor.wu@mediatek.com>,
	Jiaxin Yu <jiaxin.yu@mediatek.com>,
	linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ASoC: dt-bindings: mediatek: Simplify mediatek,clk-provider
Date: Wed, 14 May 2025 12:57:03 +0200
Message-ID: <20250514105702.28622-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Io3JrD/y03dOQPQAcqJF5SS7b20bby4BHdbd1e9wLMA=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoJHb+RsGueHOitBQYXiszb3Mpl2m/RCzDn6fka
 rPIPq97lmOJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCR2/gAKCRDBN2bmhouD
 11y6D/9EcflOTi1PXfiKHcWkO2TQd8AiHmKdLSSurf7WcaMBXn8Fbwo73+EJ/2olcQAcj7XZf9D
 8JwECXhe1ztAZeht1jIcW49QiQRkkUoTkN2KRL4dooNvkTgUY3vgNyA87MXPGPjLmL/JcvJsnsW
 Jry1/y+WGGXJTxvj453+yAfKNDgE2FtURccAdIPzhniUnS4RmnYp2nABLMgdTYv0aBqZbV20rqq
 jOWXfCbRAbLEWCIeZ+nQerpgM8fHM0eTYOuV5MHzhs27OoJkYOLMLAny5qoLl7Zpm7QIs6Sf0TQ
 411wb3xmZHUvPljW+odA5kp7vNu74ORgeg4sifz8NSK3UY7wfPBnAVDcUwbazT4UPZjVlvd6oJB
 M/oQZ5PI5OZXBBFcvbfNpTspmnlUpx2dl92iNd+EU3tV1ULUHEe7fMMDPmDWuya2uC0byBeV+NX
 KHdBSm5X6JTGBik2vPT29CmY9aUOtWDqcOvbX9/mXZDAkw7FrXY3gbcj83aIpGUxHsXct9+Fp1D
 jjQE9JCq4VNnydAnG14Q7NBEgujHn3urNMS5sHe0sb456zjEw7cQsrs0W6/JmpSTxRQ6N6UrSJU
 AUkb7dxGDDDx+k5ZgmIRFW0TnxfwnBQbiJBYrXSPQny28+3lgQEWgXSN8AGE4cuB9MzdnPo8ura jtDQQXfb+Vlto8A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

"mediatek,clk-provider" property is a string, not an string array, thus
"items" is not really correct.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml  | 7 +++----
 .../bindings/sound/mt8186-mt6366-da7219-max98357.yaml      | 7 +++----
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
index 76d5a437dc8f..7ba2ea2dfa0b 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
@@ -96,10 +96,9 @@ patternProperties:
       mediatek,clk-provider:
         $ref: /schemas/types.yaml#/definitions/string
         description: Indicates dai-link clock master.
-        items:
-          enum:
-            - cpu
-            - codec
+        enum:
+          - cpu
+          - codec
 
     additionalProperties: false
 
diff --git a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
index cbc641ecbe94..037f21443ad1 100644
--- a/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
+++ b/Documentation/devicetree/bindings/sound/mt8186-mt6366-da7219-max98357.yaml
@@ -124,10 +124,9 @@ patternProperties:
       mediatek,clk-provider:
         $ref: /schemas/types.yaml#/definitions/string
         description: Indicates dai-link clock master.
-        items:
-          enum:
-            - cpu
-            - codec
+        enum:
+          - cpu
+          - codec
 
     required:
       - link-name
-- 
2.45.2

