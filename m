Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58DCF189902
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 06:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751351805; cv=none; b=DalpXMJ5+46eZQXxjzdcWO8g3pheZwq5pH8H1Lh5a4hX1bKUrYz6CsaoopWz9AYgSwkUKwLKYcXTBZMVO1/t7EUuQyhCB8/Izj/8uSA/60ia34Yur81Q5sVOE2vpFdB9UczRSohBOjYLn3o7hrVbRSgVqlQX81Qn5xN3gnQvQ2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751351805; c=relaxed/simple;
	bh=LVOBn5gIt8SN8+AKL1VG0Mcc4HlGoH1nt639zAe/kOo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D9O6AHVl78NZ+ktxlk8DM4I5SmLcrzR8gg1egbDNpHxRbLSFyDzW1b8ftoegYWUl5YOD0mh0lFibrNF83S4d6CtOm+i59l9iyZzr6aNNnDR3NvFLFmmZ+tk8F3YjPsYCkVR9s4HB6yBm5FRBYw8NWKtLcLtMX54YtKBaVW0zeJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HyK96gyi; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HyK96gyi"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a4ebbfb18fso176609f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751351801; x=1751956601; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XF9BsXSBJjchhqC1W0y2iD+54l1AU0WSwwDuBKksZ/A=;
        b=HyK96gyi2b78nGQHbbf8105VZxi9QOs2jZt0EgfsrkI2mbiPlcGg+3KxTw1oRI5DqW
         SyAmpj1UIXD+e3Jm5q/72afsVrIgfK+8sRcy6SKGH/LFQXquPSjMlx8fZDaMpOCatxUc
         XLk8V+biOI0dbG+gf+THZLBRMnKhWQhwd1zQEGSqRsHMEBsQhwVWCKVaCcxdvcEic3uG
         kiy+ZSOB7TprTF9EBkEjxd/WHQjcMX4LCWK6akrscIGTtFe9V7Ex0vopB8bjXG6HxYwz
         jSe72pwJq8d8B3ZjsnHBG9RMyAxNllVAne6bINs67vtWAhR4hZW7LbTRlfgMWnRiazJQ
         okMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751351801; x=1751956601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XF9BsXSBJjchhqC1W0y2iD+54l1AU0WSwwDuBKksZ/A=;
        b=nKthJcXXQjjF2joXpckWdMMa2YMPxbP2ofNp306NivoOpjeI0x5YYrYCN13iO4cBZp
         rzUUYWutmMdu6kTVGgHLHLOmL52pE0du345dQVeTaa4NALzlMBET2okr+xB51VNUOZ3B
         ykAyOgHMcv7n/it4FIGZEfcGW5I3M+B8c5KKBoy0SQ2FJDDDLl2nkx01RmaIeuYY3FS7
         yPmIHff+L1Juhmnp7d5QM+gK/L7SipSDVVjFL+6gu/edSYpqddfTIbRxmbdregghFd2o
         4QiqOcTSGsLBzvEAGgN48eh32zg5Bqkwa8ICa2c5G5NrNlsRagrV7KdK9Cb8fCbT54+L
         jmSg==
X-Forwarded-Encrypted: i=1; AJvYcCUsz/KEMHPKoaL4M4TswgSD+TRG2sgUQG60VqunpLzypCPxpmY9ZVzy9Nc8IPTmN1+zJf306/NktIX4xgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu5ZMZprB6vhizKXVPPKY0Tnqt4fQpS31udwbrH3aK19TpBbTr
	mAY33iJN3CbeYDPsA66EJiqlrIv5BAm2qtJOp9fKnXjkKxj5TAX0NliLeVjuTEKvfBM=
X-Gm-Gg: ASbGncvmap8Sg0Ru4fJy1ar8V9KOA0Ih0g6tOydJpfL+AvatZ7lCu6OTSoLe+eWaFoG
	qZi7t7e2Y49WnuIpbXJ0zA3TuV1uOy0DKxhV+FRMxxCZDCLSqthvMGGQ2/WFsy21Z4yX4lo8862
	c368QrMoqEyUpX3XNHS49FMZV0t6W22UNAfEyZW8xtkI7i2PE0WtpZXiIXiAQgzfzmuki2WAZgm
	vnTmdj9+VIbr5xZZMYD7M3zV1Qg0r59/mNAHEOrtK4MtQnw6j3LeeeJFUwsnSJbDGq/azElwlGC
	6Q6Ds8E+d8mqlKExSx3ATUK/QLo3ox3xjFalmWj7pwkNYkSQDPbsCqVpNzltY2tvXcJ8FGMqKih
	ewmUx8G5J1Q==
X-Google-Smtp-Source: AGHT+IGi0D+19VoSHVRWUeDZpEANnFxXdyNqWbA6Zz7HbqVloW2LQcu/8xvrAEhyjKTVBMpjMPDSIQ==
X-Received: by 2002:a05:600c:470d:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-453a812fb30mr6274275e9.4.1751351801542;
        Mon, 30 Jun 2025 23:36:41 -0700 (PDT)
Received: from krzk-bin.. ([178.197.222.89])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a421434sm157119695e9.37.2025.06.30.23.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 23:36:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lubomir Rintel <lkundrak@v3.sk>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] dt-bindings: phy: marvell,mmp2-usb-phy: Drop status from the example
Date: Tue,  1 Jul 2025 08:36:37 +0200
Message-ID: <20250701063636.23872-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=779; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=LVOBn5gIt8SN8+AKL1VG0Mcc4HlGoH1nt639zAe/kOo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoY4H0ffaPTbeopHCCCMc1UVmiQZRCkCVMP4baz
 8YHWXyqWvKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaGOB9AAKCRDBN2bmhouD
 1x01D/9XFJFW9DXK6yY20AHJAmi1JQG17UexaKXhKbRP1qjAcsWq3WePdUEIaMHDSBYOMY+CYsd
 rS2q0FNN/yv+0pBPDnvC/XBhfS2tRQT4SCB4Vt4NH7BX78uSwnAr7pWiWGnQ145yCeEBD9vNA/b
 sI5sRN9Ea+fZERgKqwpqQ59DQ65CyaPbmmp/dm0sAHxRBAVOc3cFWCaQQJvSJNXiUSlBYWH8rtI
 uIefJGyUCu1pXsl/gsTIliVhn0JFTl8IXvAT3jPo+Hp6ZTmNB6OE8BVCl+PdR4pQ68fiMFqJ+Dn
 awlO6/i8bPhUcCnpuw97SnTy8qBfEhWtkbeMjT+vZxa/dgFfl3ulUtLmb5gMNLiJDrdRnqk3+tz
 9VD7nITR7jv+58y6CyNFum3Mm2FO2j3F9W2eL96DQlHFjJCNna8zGk1d/IgTXaebHrHib97tMg9
 xI2zLFoMKXAE5QiG0TZRr+z3BUNtEIk6DhJbuX5QrT8g2/OiTORqNt+/sL0Q4mS3eSu30pdinB0
 KbmvcIbNWrJvgj5q1nIRagdSMHUanCwTxeOWsdq+j2CR66lHyNy5jo8rtI/x9tkKcOZN4KpMiX2
 V5AGBDKfTCO+Q1kF+W1vMUuTfrzPRWzNERfxvjOTHlyvHFmP4SarDmzyUPjt60/8v0tMLDzKj0p dpsgim1dFMB5uuQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Examples should not have the 'status' property and 'okay' is anyway by
default.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml b/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml
index 2441c5fae550..af1ae2406f65 100644
--- a/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/marvell,mmp2-usb-phy.yaml
@@ -34,5 +34,4 @@ examples:
         compatible = "marvell,mmp2-usb-phy";
         reg = <0xd4207000 0x40>;
         #phy-cells = <0>;
-        status = "okay";
     };
-- 
2.43.0

