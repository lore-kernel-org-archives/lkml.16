Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 753C7221F05
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 08:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745484447; cv=none; b=YPwIjXUJdZYiHdFS4foD7ZhxHs3zasoYeSNbw1fHODQOeYV02DnnuQ/laZmkDb4fooafMJNgON5NGiSac2CaI0UVXW6cUf6Ki8TZ2U3DefnMPECZF95Sn83ie3eTrpXXX8cL2gSS72gjrK85Mt85g5tEFIi9FUfM3EHT9mW/DVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745484447; c=relaxed/simple;
	bh=Y/7UbvEdq6i8vN7DiMVxtTrHzVK3zraPiUxsxJBUdd0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=q4j5a4DxfCYgg3e1LMFS90s/fzAdXhMumbwzqB9gWRUqQedQ+5g3P1B+u2lUScXiN458OeHIZirSxhSLRyItfpR021Vvc3BAxlGV34gsnZ7TAmmtJamF5xReR/nZ0Tar+q7KMxIRNpEoygehGes1NRxm6+evlRdiEc5TRRoSjMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j+k7C/LD; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j+k7C/LD"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-ac339f58631so7172866b.3
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 01:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745484444; x=1746089244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=;
        b=j+k7C/LDQyTZfDc2HzHN3521BKeLaFDS41YEb9B2r3w+Y74y9AihpW54fpOWKF59yZ
         p7uTm5xlfh/XiIX5/p5qnt3yUCjtYyykObsEy+b/oi6tpf1eHBxkfdqTb41k/xKykBZA
         LOW1EuQ+Baa2e+Ii6Ke7GJMz0cAlLvnoNRy2/ydfLIQqKGbrUooOvHb+RQ1/jsw7sWY4
         ItnbmECDDekszquVih1zIQrWb7/046CFwQBlydk8NqMo6RpDH8c9h2LvtVGPp45l2/A2
         wSRuGCAOGt1DOR4ecehJx5RJYVcwEPVyaqgV24x35zt38Jjbv54r7hyDTxFIihp33tLX
         iw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745484444; x=1746089244;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AzKbft0Av4+PkH9aVIXn9viIteKtaJ1aX/6MVhkBfwo=;
        b=HjEYyOENAqj4wdCa4iJnFOoi33Q4AEL2dnkwX31l1CNzzOnE2c3/bVrE+63o9X0mRm
         5/hSG52Llniw7huaRlE2CPDoRRHM1MLGMkM+9BYmjE4U63AWJ7T0yQXxIg39DGYyhP5l
         YLnucAj8ggPiusWDEP9W/708T09HHkOcNyrgXgenWgF5C3PckTQjtOo6lfjNjOT0t29M
         YA58HgPcexmwJwQ/UpcD/X8jId/+v/jFKB7++Ax0XHZicPPSFcu/MzpyI+PGUJy7lgFE
         fwhW/n77bbvs2KTz8Ym0j3bT+HmvSeBJsMX4GGeibiD8h2aAjSfy1SuHF+ggAFh3tDbc
         kgxw==
X-Forwarded-Encrypted: i=1; AJvYcCX7XbcRN4TzJqx7H5/x7dQQ1afRIbGjctK7+rNZR/Ea2ZLzZOEw96mNu2HgLuQm0QIid24rBRqRULk/8fI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxz6PBcB3e+QEb+5Q+SjXDth8O7IPYUTPOVeM7pzA07tOUWlJ89
	/DulgEEL6RI7LU2n/lhxWYg/v4RrBBpeLDxevxdcm4de9POJYMyYCRYTeZt2iQM=
X-Gm-Gg: ASbGncsfl3Xpibjc2G+KbD8q6e4KUdeh9oy8VXH0qcV+MDkNZi88koq5mPc0Fx83xKu
	VL12lXRiQmL5ga+jt5ReRqYNRJHr+tD8UJU05v8+j3jfwVYEofKDpaG5+Qk1Q9y7/jsU181q87r
	FDQMZNDCOVezGaj+3xk4B6WZCXMI5z5GjW3nUI+yUKWD+MBKuVA2g27JEG8csDRLytECRGC1P9z
	9vTsKG9Hu1e7OyS7PlXruhxvv2Nmz7aU5+vBE0Fjiro+ggOp3h52+Q8BtAaP13KcKYw97o9xo02
	ugR9tzeN1+teO1hZhjsmXG1pkGCuZuK4yq3PrPQ6+DcBhSugBg==
X-Google-Smtp-Source: AGHT+IGFDaepY4la+CBTucmeGZBrlMkFUgpMj6E1x8ks6fo/36DTs1K5XFkEMFO750OFGsNEb8G5FQ==
X-Received: by 2002:a17:907:c13:b0:aca:9de1:f88c with SMTP id a640c23a62f3a-ace573b33d6mr52851166b.10.1745484443690;
        Thu, 24 Apr 2025 01:47:23 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace59c25de8sm70417666b.135.2025.04.24.01.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 01:47:23 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] arm64: dts: amlogic: Align wifi node name with bindings
Date: Thu, 24 Apr 2025 10:47:21 +0200
Message-ID: <20250424084721.105113-1-krzysztof.kozlowski@linaro.org>
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

  meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index ecaf678b23dd..9d5a481b309f 100644
--- a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
+++ b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
@@ -217,7 +217,7 @@ &sd_emmc_a {
 	vmmc-supply = <&vddao_3v3>;
 	vqmmc-supply = <&vddio_boot>;
 
-	brcmf: brcmf@1 {
+	brcmf: wifi@1 {
 		reg = <1>;
 		compatible = "brcm,bcm4329-fmac";
 	};
-- 
2.45.2

