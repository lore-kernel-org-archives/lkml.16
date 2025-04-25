Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB88253951
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 11:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745582043; cv=none; b=Y0FBx2vynOO8CY11asbQmOmKNOZgQyL6Kg1e4x3e/kVlW89jQj65qWvAoUxGYKWhH8XrB7HgzC5DwFbCBjmuH4IQZdZ7auNLrtINl8fMc0xiOd50f2NjwWDtA0minYQGn2wirIq+HN3hgB+45iO/nyfCLiUMBjZYFopUJt9Z2Cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745582043; c=relaxed/simple;
	bh=qe+W3z14Vw2wfaOu9ITi7s91Y9kEJeXglwzkNhG8nIs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mWIkgBMCl1Qe5JUdatg2Bo0XNjMdlN35BtJHJHi8OT/SSY2P9NUliLz8lAKwOyHHaHz737saEWlzlqVxdOzrilq2hj/u3zpfdqh1FJpfno+DwY42VApFjlRxXktVMjER5kDxy5kmlOK9AM6iAjfkXYCZHF+iTeorwLlPg4cm2rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=casTvpNw; arc=none smtp.client-ip=209.85.218.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="casTvpNw"
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-ac345bd8e13so308708966b.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 04:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1745582039; x=1746186839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PFVqEvZNZmgDIHITifK+m8w6rPETJxy3/wEVnk7igpo=;
        b=casTvpNwishGqauGcKW2lWRRZN93gw1ihJaH26DBRp185E2rzHEPdxs0e//qRppPtv
         wPmzMkkyqnZ9oYQrZM7jDNB4pPvc6IUR5QG2y3a3lB8QtENLmLMHQMJ/IlgYPOYBoDC8
         7NhdOna9pfj6hWdHlnP6VpSPPcO1mTb7Q6Wc2U7UBDWW5ltg4AF8UqHYTojP06t10Vxx
         eg/C6ghD56cXrwc+UzbHVDnBrOIaGQGr78HXusTefN1zHuggYdCER43pMOGzHPm9d+he
         m4LsQTkJx4NIVVyvawXLymqLt1gwQ2qLIXdwNN/qb+dhu8P/bm6C0LFnpSxOXCYpT1dr
         PQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745582039; x=1746186839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PFVqEvZNZmgDIHITifK+m8w6rPETJxy3/wEVnk7igpo=;
        b=lp/PVXldHLGgB6Hlv8ijM/K5w8CkDvtflP5vtIEYRhBmPzUYqxi+LlDB9kJ6VMRcD9
         +zkfz2GeenAmzGHs+YEfzcIPvYvfM8a4yJweJbICX4LkmuS1SHFtLA/2DxqA1oPI6J//
         EsI9hCUe9t7tAjzbxfJ+SgvU5v/dgpuIMdxfi3+uSCHolBwNzvi5kLZgaYyNdIDUmCTt
         YyUHRrxHMoLUNsXO6REUKaDHxxZ8tVGO3EqHUB4T4dK6BhvzxgJKRLLzDbpvdbmQBdX/
         n9TXkxxrw7A6EmIHLeC79c2yLaDUeM0K071/M80z85wFvYLX06EzxR7nYXCLWAin945O
         XGvA==
X-Forwarded-Encrypted: i=1; AJvYcCVxSSiSWd6r3PLNxDZiA+jYra6WVpoi5mNYqiBQdNIpTXDBN75q+TM1W1j1Y2JdosXWanCEA/u1ENI4BHk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzitjdlcSS8KngumLyDxpHbpGrssWTcgk80OVIi0je0pghQaRnj
	BZXsyehkcil0yvorsl0OTZKYvGC6tnCoZhDeDHXW6BA/l51JsMtTS0wn0tJAR8g=
X-Gm-Gg: ASbGnctGghi9vEOkXSKHvvDqZKgzGg1nwmqSQgsVRWRorpFVSXZaFQy2dxineKZn8Ff
	UOZjKHW3zA8s+VIqBC04jUeSoDtjpgZEzhO/J6FZHnqIRXQs2Kl7eb9goa0T3jFNS75/MCEOHq2
	cgfCDnmAqeITGOQ0/twaFGGFaHxkdamBQ9C96N1sGbOiU8U/Pe1J/3CHN/2/ZrfkOZ/1lltO9I+
	6l6gqznJCLnf3oGUMCocM640MDXgjcNj7S9lyiWHDI0xU0Efvx/bhcs0nsPD9+cZ1+ney0EZ3LQ
	oWcNh88O/T5rSm6Zxmrg9H/7pVYoAc7xFNaOTY3OYu9FMRdlU4fJGgLrn/cf7iboYfSaAVbjcpj
	f3W2uyL/DHziFqYWehvX/yPBKJBcRFTyGYpkWVkMkfsJfmDs5dbahH2nWTwLL2UkIHj0=
X-Google-Smtp-Source: AGHT+IFydxzM4xveDiHNxirQ0FhZcj5TUtv/EQfa5vwmL4iBPwaxKfYgWV+76QHSL615mmQU9XFPrQ==
X-Received: by 2002:a17:907:72d5:b0:ac4:5f1:a129 with SMTP id a640c23a62f3a-ace710c6430mr204966166b.15.1745582039433;
        Fri, 25 Apr 2025 04:53:59 -0700 (PDT)
Received: from [100.64.0.4] (2a02-8388-6584-6400-d322-7350-96d2-429d.cable.dynamic.v6.surfer.at. [2a02:8388:6584:6400:d322:7350:96d2:429d])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e41bc36sm126081566b.33.2025.04.25.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 04:53:58 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Fri, 25 Apr 2025 13:53:46 +0200
Subject: [PATCH 07/11] arm64: dts: qcom: sc7280: Use q6asm defines for reg
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-q6asmdai-defines-v1-7-28308e2ce7d4@fairphone.com>
References: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
In-Reply-To: <20250425-q6asmdai-defines-v1-0-28308e2ce7d4@fairphone.com>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, cros-qcom-dts-watchers@chromium.org
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2

Use the MSM_FRONTEND_DAI_MULTIMEDIA* defines to make the code more
readable. No functional change intended.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 8e86d75cc6b4929f6cf9592a3f1ae591a19e6d78..b898b2cc8ffcf1bc54493ba244240573981c82f2 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -28,6 +28,7 @@
 #include <dt-bindings/soc/qcom,apr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
 #include <dt-bindings/sound/qcom,lpass.h>
+#include <dt-bindings/sound/qcom,q6asm.h>
 #include <dt-bindings/thermal/thermal.h>
 
 / {
@@ -3833,15 +3834,15 @@ q6asmdai: dais {
 							iommus = <&apps_smmu 0x1801 0x0>;
 
 							dai@0 {
-								reg = <0>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA1>;
 							};
 
 							dai@1 {
-								reg = <1>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA2>;
 							};
 
 							dai@2 {
-								reg = <2>;
+								reg = <MSM_FRONTEND_DAI_MULTIMEDIA3>;
 							};
 						};
 					};

-- 
2.49.0

