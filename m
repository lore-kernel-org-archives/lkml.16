Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 692D41B3725
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 07:47:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748936859; cv=none; b=gKhc767TCsgqYV0Qur0zNyPu2cp48XJqZIBD6V8/qn/GzeBry7fHU7Eq4ofIOJ13PmchLubOAUEfPK+qUIusHXRZfZeXcQe4E5B0lGeEMMiAEHVbXOqIoN9EQmpxcNJd0SGN4xun1BeLQsRPDq8gLlr8LuLgeBarLm7KNC0zGhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748936859; c=relaxed/simple;
	bh=84VAWVFlPhyzrCXyj2+DcTr+WKL+4wxRMFJtq/MQ9Mw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=nlcxONqF2CImNVu1KzUMknQyy6z6DV3sSmz8iDLs8iqWQrtr2NAucx2OfN/XCYLrOtM5wxPLJTvJnX50TQfUtRjWZfRgvRX+9jlizSfMKVrQGtmKmlXVs2V5+3O9nhhuWE407cn5LDz9yaABl2Xf2SCtNIiHGqOG4UDURlna/GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WSOh1pjo; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WSOh1pjo"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so2299134f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 00:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748936856; x=1749541656; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=;
        b=WSOh1pjo/lRfEeJCCp+92gle168NAJoDN21pFmEEFcS2q+MhaPHwhYU5KhR3S+YjUH
         xjWqh8vQ7stYmTsr/sUJ2zDhh+Kkdgp0zW2S9aiCxFUnhZ8eLX4uEJwy69O3xrWIPCTQ
         FwxjQd1vwVLtt/s5gBYVIq062Bikl8JPW4qGJRItSuyNtnE3I1/4gJkW5AeoOkFEI8NR
         yDWopFXXef6CCNxMjkw3ZO1uIAgzvsNPNbWWjOY47hgasJ0XhDCEmsQibX4iK+a7CJOA
         pQe9dgg0aQx/H/6mdYI4AYSv3v03GmOwlIUA/LhueGHsSkou7OUzhXANPD/nLbuk0fYN
         3HDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748936856; x=1749541656;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=caJ7ux2yumSI+rOgZYfrKx6bLw/EgXNi4UXfiijyCIE=;
        b=SsjRmr8pHLoEpgenYO5o6f+ZrOPAtdSCI+a/1wguCcOXS+W1HUnspDtUomVknP7kyf
         phzXDBKC5U7OpmWmWljY2IquhA4lZA79KPNF2Ofx5e/siy7jcYy20WWVeiM3wmna74NH
         YrbW6AHO6/r3vXKQ0gfLJcZVXbCiRisMsSqPowCndToM2r9sig0iN0pRFHjW5XDqUCzs
         2OCNnBN60cCzr7uPzXDSW+eHuYzewu7+W+nAuvSqsASkadRxFmOTfXStW/jMY6/y+foW
         xR8yTdvB34h5pEyJSaYBT/DtuiKCEoG+UC6wutY9Ay7VsxNyDE5nYKpXvb4hFLPB11Hy
         2I/w==
X-Forwarded-Encrypted: i=1; AJvYcCWnKkEKkxwtGuHua7PJYvhcdmMqEs1weGLnfd0y2ufUsWjp2S/R52brK8ImZmrTUaSY6x4OkgHrgtWCHLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBd3TSkV+8LM+VUaZHmBLJMJ4snHpF6BNIzf3STOitCYehoDpn
	yrc8QOS9aOxc2wu3oxsohA69xGYprBXiY40JfmazbqW0qwTsfMQKS5QDaWR6BWQBxA4=
X-Gm-Gg: ASbGncs3ztsGTlQdWIZ0cM+drF8a9OkLMS4rDHhjzYBq1FrFcUe3XM1tarVN1WGrSf+
	GbHugYkDC785U0rdZlEGvvR/+5F2fLbATMDhWGpAjWdNEvg1K7DyNxXZ7kZC0lGKkEIBWxUKufR
	iDEtd3c8OuEi73m7eQxQCVVu9O4JGA8ObpDOU+LEizA3I80K97j432UXYgAJtoIjF0f2x7ZQkLC
	AJ2Zg3IBFjFcpno61qOQhsPgZgdqoOdxc7+cOr7srbdnF7NRt9Fecacyo7JbeUcS2iZxgtb4EmF
	rzO/3cKlSKDby2LJ3pGwAYY4HLAx+miU1VUMotJ3yerCx7l0x3Zv3xg+TTCpUb7JUvcErbMJ
X-Google-Smtp-Source: AGHT+IEDZguHy26GTUwFsHWSzO/bLYq1dpznuDMKPsYMZaUuQBDHm6dBdCH9NBhwEc0SzxYYLbe17g==
X-Received: by 2002:a05:6000:4023:b0:3a4:f723:3e73 with SMTP id ffacd0b85a97d-3a4f89a893emr12077391f8f.16.1748936855700;
        Tue, 03 Jun 2025 00:47:35 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:3d9:2080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f8f1e7sm152181815e9.1.2025.06.03.00.47.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 00:47:35 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Tue, 03 Jun 2025 09:47:33 +0200
Subject: [PATCH] arm64: dts: amlogic: meson-gxm-rbox-pro: fix wifi node
 name
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-v1-1-2d54a476757d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJSoPmgC/x2M0QrCMAwAf2Xk2UC2URF/RXzo2lgDri1NN4Sxf
 zf4dBwcd4ByE1a4Dwc03kWlZJPxMkB4+5wYJZrDRJOjK83YS5WAfv2UZNyq9sZ+xUVylJwUX/J
 lxdgVW9lyxBkDBefHxd/IEdi3Nv5Htn08z/MHSS/1noMAAAA=
X-Change-ID: 20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-c0c5a1ba8050
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1124;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=84VAWVFlPhyzrCXyj2+DcTr+WKL+4wxRMFJtq/MQ9Mw=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBoPqiWafsssuKl4aBXXalW+12j2G5hJWZTyeYc05Yt
 p3pu+16JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaD6olgAKCRB33NvayMhJ0V7WEA
 Ch3KymIceqWdnWOiU5bsyN+KN/+/qIw0hdpFG1GVA3q5Sb0lbC8MnMaAfqQxoT535Ny+BvxM8b6aht
 3nXk5//79gXMwRFBhwFrmQRRAsximQ8ZMXLYS3AP+ZhRBes3fZeGL44cpxiL4ehOqT9JVio8f9CVLo
 wGurl+h2qwznwfg4d3pQhyWOZQYwm2WLMsfxHOPqZGPjqBOr2kf9a991KOpgeJv6gNMbrP7JGdbdOr
 3rY46RNuiBB88MpGa/jzZuw0bcWHyzGifAPmuR+Ye0ngJjbp3SSbn7jDNBxYkH13KLs/8VF9KddADc
 1gN4PhjgVq0KJ9IdIq9AiLIvsJS/IZFTNsmcpvFiI0Tdf1/nXcqTTs6d8OFhVP6IM31mD4+Fs9CEgb
 V6Q/eBy2EX6O8AQQHMY08XFaUiwHY9+Tu8vyOi+cDm+U3BzFqSTpzqTOGHvGBaw/Rtp0+us/2fJCIS
 5/thXgW7/syAlRKZSsZre875a8Fs+c1KVbJ+MajHhqBH0DBGg4ZkXtaJih0twQ8Yv7mMgJOUOqTwMn
 vALq+AU3qvyrZ5E9WMvKCDAsxHr6H5CCJxbthtUyLkQUyPKlFzYpDYV3G89eNovoKqkPTzG8ofW/X/
 8vm5pQ/kkw1oGK9LFOsXSH4PzKV86QxCcQw8G5uvtmUOvtTlcsITTyLYTOjw==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

This fixes the following error:
meson-gxm-rbox-pro.dtb: brcmf@1: $nodename:0: 'brcmf@1' does not match '^wifi(@.*)?$'
	from schema $id: http://devicetree.org/schemas/net/wireless/brcm,bcm4329-fmac.yaml#

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts b/arch/arm64/boot/dts/amlogic/meson-gxm-rbox-pro.dts
index ecaf678b23ddd6f0e1f27532059aa706c29fe046..9d5a481b309f7201e5a82b7a91b8ca265c7ef42a 100644
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

---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250603-topic-amlogic-upstream-bindings-fixes-dts-round-3-c0c5a1ba8050

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

