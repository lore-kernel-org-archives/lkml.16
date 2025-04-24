Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F5022A4C5
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484467; cv=none; b=QQj8I4Bfkv23/cXmp/AYCxYJEMfJdZuUqwdRlNA5jd0wPb2fK8dMMmtdIzivtG3hBbTQPPRh5k9I7kRV7X5C2Kx2yBszPQNI9/kGh1BvJ/sGuu5qNxz00usM4gsU42oXzgyykhH+OdtX65JBUhCsC9w9XyFJ4Lf/Yneb0fv1b4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484467; c=relaxed/simple;
	bh=oXXVI9MA8NZQJV8UjDqTDMo6XIrdRN+oY4RhgRwelM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NMLE4nqne7lafQ7CTvq9j4pJOpW+RaGs8lq9Q5tps9juesof4tAaxC372e7SAWJPArBs+9WySFdKVocEKzEtDMfqzqVphOE3qfouFXL97fFDOxVPW6H52gR36fuT5d+b2XQJG3V1weKj7Q7c4uGZCjYAMuGTiYUHmo4PN0r4JKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Zhq+lpwM; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Zhq+lpwM"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-acb94bf784bso9844366b.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484463; x=1746089263; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=;
        b=Zhq+lpwMzm7IFLnW6sb8YZi3r6sU5LUKDBMAHQo8EixEctfNd74M2AheOzYQstMlaF
         8ayggE79aAnWLZIikx2w51duHBrDT5eBLjute6y6bTUi5ATI6PKL7iFLl2lM5Zyzqfw0
         inwPVm9GNRM5p2ehy3xdQ/3Ot8uzRO7SxDt6o/Aou6wORLNHx9DxFEsEDsbNJr4pTy1o
         9KYV/Vp6wf5EIudE1GnxGh9yB/4EF5sTgEnwfO57Sa81nWFdpzx+y78/QuPHXEYdzqSu
         eETC6hInglT80iHqfij0iifDSdkcW/ZsQdrmJTRQEmy1eLGNXGTwwIl3ZKPkI1RMBWei
         oyGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484463; x=1746089263;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Rb8W9J7Qw3lwXkyUyMZqbY7uDV4UBFzYR28V4ttS0w=;
        b=pud4TEKkh8On7mnBbVKpFHeBV5zFXv2ZCk0eXWYvaideZNdfzJnTpLsfpWsb9us5k+
         QvJ+m09tuWeUGorA9wq+epNNMkqI99xBELnOIccO6V3tl+CjTSkvwM/rbVKvpgew480s
         qd6a9Za8EBtIt+7hiczmtCt8LESPHK+aeJifwOWbtcSBT3nIrDHQxxJ1P9znfZi+FOO1
         LCGbsfeNIwXET/YUd5DkSmLdJhlaCxv7ypLjmT20hV441oY1L3MbI9NE87IBaUgygcTT
         uNytc+o2EjX+9hIJZaraHr9oQyt/SoLYNUyI14m/9f71kzHqZPGb1IKCqAxXfYl5uQeb
         /TGg==
X-Forwarded-Encrypted: i=1; AJvYcCWO0LOEDmJmvV/+lZurEJFDcmDgs+cDscwEaAlcOhyfEPxpG9aocydmAoKdLvhxWIRqVaANjn4yth80VCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGjIcfO/3Gmfl9kIMT4Dh+UjHLBkdmAC6hYEuYahj86t0sW7lg
	zo54vAwtuN579lgSJVJNFcDsziTBNoFher6Eh+zH9AQk2tCBnoL0qpuuJhjN4OM=
X-Gm-Gg: ASbGncu7AGhs2H9SjcozacJF4GivFynGIscsfHh4wGKU/B/plBLqGFIQkCul871kgwP
	o2At04e46k4hmfA+GogwnJbRPyE4qqiLsZ9tAW4zblOPuoMu+JT2sFpjJuVEAZBDbzwAj9DnDAm
	tb5PyxJ1QTRMWd5KaWrC/9tQgpRi5JQ122rcRU2eSSsVBZKITmlzbkbt/c3W6rcpPK+kir/y+V8
	QWlON7B/VjaytC/P4DtWlYM3pFs7EeEKcL0OLT0QopUyGj2jiB8SQP2XErLzE7vCmAWvHLx4zys
	o7sCCPI1ZQwH/YpNKVSP5yROA6MhXouFcA5h5yOjxLyEBxBYoQ==
X-Google-Smtp-Source: AGHT+IFODpwZkT/2DLzoJH0TEk8ECY5Db5Vvv11H7L13gvYc5UBCSm7T9un64cPNNQgwKu2fF3+X9w==
X-Received: by 2002:a17:906:7316:b0:ac0:b71e:44e1 with SMTP id a640c23a62f3a-ace57279966mr58846666b.6.1745484462947;
        Thu, 24 Apr 2025 01:47:42 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59830ff3sm71378866b.7.2025.04.24.01.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:42 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/2] arm64: dts: allwinner: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:36 +0200
Message-ID: <20250424084737.105215-1-krzysztof.kozlowski@linaro.org>
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

  sun50i-h6-orangepi-3.dtb: sdio-wifi@1: $nodename:0: 'sdio-wifi@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts     | 2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
index ab87c3447cd7..7b2de2ac8b2d 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-3.dts
@@ -144,7 +144,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcm: sdio-wifi@1 {
+	brcm: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&r_pio>;
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
index a3f65a45bd26..0911c537cc6b 100644
--- a/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
+++ b/arch/arm64/boot/dts/allwinner/sun50i-h6-orangepi-lite2.dts
@@ -28,7 +28,7 @@ &mmc1 {
 	non-removable;
 	status = "okay";
 
-	brcm: sdio-wifi@1 {
+	brcm: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 		interrupt-parent = <&r_pio>;
-- 
2.45.2

