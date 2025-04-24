Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 808B6221FA1
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484456; cv=none; b=dosRhfXHz52lgSft61zPBDpMmctmrhAXdISFxZeSO1Z2BTIFBpN/+YLZPPAZEqWM+bQtrBGMWbdBB85L0bF/EwdNe/nqOXcGHh+tFmXCJsteTQDZ0hu6qYETuSDxTM8V1LdKbwQPK9DHKYtnp0kI36ZVE68r05QBciOsKh2biUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484456; c=relaxed/simple;
	bh=F0xOwzDPtFS9U4iNvPRsZNyW2uHbepoKdjhv7XKbvew=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=diAGQU2QrE4P83whTqiyO4j4jnZB+Rop5YG2h+voe4CUf6RRwVMeH79fqlFF7I6SoXscleZKYD1FBsKVmOOb6a9ZCcEOc/WCcOT4nqEzehZLiGuT+AOB+K/EaGEFhed2+2WvlP00m7urLi884inD91RLca3Di/Yo3XbX+pZQhsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=q/lU12lk; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="q/lU12lk"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5ded500589aso123512a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484453; x=1746089253; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MfUui9CnzkUm11aexUOZ7jdxIuh9w7zKBILc88SrxCE=;
        b=q/lU12lkk2a1eC3G/RPv2nI4UHEmPcuxVLjxhTtMG0KngjFgJc6LNW47h3xPgZ3rQy
         vRiw1hBuEbMpR78vKhulJdCNhsznA23zfZQV4HavNnA65iyDtJRuZ1CnoKVhI7ujXzQD
         1kefqX0NZ4SXzRD3sBLUmoRJ5AQJnoo5W+HBRzYn/QxssBXNCd0G4IukLsUp3MJGxSY2
         XlhVzJRXD+QnZDhq+EqVPjiuADHc7ldAF1nZqQk52r/+kzIXaoe78kwRr8lBthaawRse
         ONfQsfcdjKh8F9mWMOJmA/vhlOaN/cpTE1JntY779Xb+emOQ34BzF+PoQ0+QOIvcj2Rk
         XnqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484453; x=1746089253;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MfUui9CnzkUm11aexUOZ7jdxIuh9w7zKBILc88SrxCE=;
        b=nhEmlLIECLbmMvdbzdvY0MYyKeKqvhTlrLYSbErQsIe1vPieb/LhIE7+sDig20JclQ
         NEinVqarEKBv6WOZXXVPFXZIKPYW5NHfrpd6oUUKFbKQLONI2OY7Yr4aCb6inTi8sfJu
         9pqOVkuCXkx82nmrhAaHJi55fNPCcYQMDB6S0jjvHaTVSMqEPfitsziJ//hy1U/KVQJ3
         EpmIuv4U4crqT+6Xahro7+Y1HVJzXYRlAI19MVpc4/q+xB1vCuwewLGPrfgHxAWxobwC
         nx4005drUhnTFN+hiBtAI44/AIogdW89vkU2ApHuzlfkByVDMLipnCO5yWf2cV8ldbKy
         ITaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnPh66ZI1bOl2nyXFTFXq6Ou4DH8DKm2jCyDb3mTIXOPw2WURRwdip5ZNEmgSh0a1+9IUuH3xnu1EDo8Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxL9xbmA6OeK1Iaxfd1o9xnx5+qpxFnBW2E1Zf8zZMBrY3iZT3
	ZguQ8Rjj7/TT4btCKeO+7PmlFWiMOVKmZs0MDlTg4+qgAM9vAZLM1inH8JsSQDU=
X-Gm-Gg: ASbGncvfoHtuUhgjaWzBtsvSaswW1SzcrLwvno4xc13DEXWgPK00b3szLdo/r76ckx3
	0kJ1o0Urf2bLkwPE8jdL4omXlWf5ndl5EGFdr1An/of/qm9Vnda6dN+eEWx5VV8ojZekFZvySJO
	aVLsfl/hGknsY9YxsXwmwdThV4KLQk/G7TD1hqqJ1LgUxe8luVC+lTgrVrni31nNxXAYYeM0Up+
	kygiZ+AkoSHovJvY+U3NmoO2ESTnakbICdDdgZG0Tx4hclOpILnFeaemPndU/y44ExkbXz+MRS7
	SCmEbRtaTZmXvRDzeq3qjLpe0HpiakSNnlOH9fWsEVhu59xc8w==
X-Google-Smtp-Source: AGHT+IHLFoX7CwatJ2mbMZsle/jLjUcm5nShwK0CF7ojgyWJgAROD1BSTHdg9v5UKfR1EFXoUy7vkg==
X-Received: by 2002:a05:6402:2111:b0:5de:ce71:badf with SMTP id 4fb4d7f45d1cf-5f6df23404cmr585098a12.6.1745484452651;
        Thu, 24 Apr 2025 01:47:32 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f6ed416ceesm810348a12.52.2025.04.24.01.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: rockchip: Align wifi node name with bindings in CB2
Date: Thu, 24 Apr 2025 10:47:29 +0200
Message-ID: <20250424084729.105182-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Since commit 3c3606793f7e ("dt-bindings: wireless: bcm4329-fmac: Use
wireless-controller.yaml schema"), bindings expect 'wifi' as node name:

  rk3566-bigtreetech-cb2-manta.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
index a48351471764..e7ba477e75f9 100644
--- a/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
@@ -775,7 +775,7 @@ &sdmmc1 {
 	rockchip,default-sample-phase = <90>;
 	status = "okay";
 
-	sdio-wifi@1 {
+	wifi@1 {
 		compatible = "brcm,bcm4329-fmac";
 		reg = <1>;
 		interrupt-parent = <&gpio2>;
-- 
2.45.2

