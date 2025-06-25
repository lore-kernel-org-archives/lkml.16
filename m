Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C1AF205E02
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 09:18:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750843104; cv=none; b=pRul38WlGQuVEI+RsEEPGNZlQmDzBMzC7f/I8kTM958gN/aumyQYvfpnPrZkacm/gaUUSSTXQ+BCmnsqIps7Bp0vYOootdKqV14a6143kMVVUfMQaRJ1TzyQXXMy+jqereZgs3O3UKkr5OuOlO46ecPx6+9c8wmkp4Z220Sg6vE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750843104; c=relaxed/simple;
	bh=5o4DwhEuzb0pZeAz4ygBSx9BKxTK6B7CFL6Pbp9UvHM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iUdBKd/8n8JrSos4u0EP2M4z5CHtvYFaVLgUY8j2vjXmRlfK4p5VDpX3SL/cPcd7KlYDqC1QJxB/3gglVS8gd+lVLzEVpY6S/fV0bBpEvTr6z9i7s3If9OaqWaz4+DTnI4i3MqlIVBaNHLNNlgLb3MR4mYJFLXcLMUfGVHXeuBg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com; spf=pass smtp.mailfrom=fairphone.com; dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b=4D5wxwNW; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=fairphone.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fairphone.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fairphone.com header.i=@fairphone.com header.b="4D5wxwNW"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6070293103cso11565393a12.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 02:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fairphone.com; s=fair; t=1750843100; x=1751447900; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8sxsJ8fLdh34TSstwWUME6Yys/TR6ScHGZgu8ZZNgAU=;
        b=4D5wxwNWufVkiHSwx52xvtXpTC/nk0K+UeWH9Z1DRIQDaM3oFUCDUjARVoyxgqBlVS
         JOvlIdEyK3Z+xOAqe22J2kTQZt5cwuBohSlybnoki8c3ui0HOLLlNMt3rE7pfXaMdB3T
         ly7KVTKorqcl/yz7lrmS+ce9/NT1pOiA5/DmFxkOt84zBE9uA1RcvYCVeYW3IWpFglpW
         7vNwp73xSwwTYZiQX33TGasnPSW8xHvo3Xts6nxB9eJhdSmWT5HOI7Q8pwlN/XdbDwI9
         kaRYRdDwjAGrwO5rUqvtC4zHICU/jYRuSW5dqjfPBOq977ZGKrYGT8W5zYrQjvHUCUwX
         MNtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750843100; x=1751447900;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8sxsJ8fLdh34TSstwWUME6Yys/TR6ScHGZgu8ZZNgAU=;
        b=raeNPsNsgfJLdMxqQLoo4ZA5m0cRaHsW2RFDX0hjoPYGe7ntblvQvW9Mwna3MJ3vOO
         B52jk7GCQT9YfQmUn3JFrVpvTPFWY9rzr1n5Ot/dD1jAPqf7g78D7iYxTESmQvt8fXrL
         nYWltG455hTWT4Q4IsC0VJYa5tewXQs1lLkC4bbWs2A7MRxtig3+hO6X/Pm7eEWcGUru
         n9ZfyO3BSYa1KOJ6z41IJG8UOsEiA13mv0x8gBEHYMWM1y2AWf14hjtfaQQFsUmoenmZ
         er1l2ztcBpDdJOfOdaxDQROUuz5BYKSuCkU+LMRvZByEzY9GVEfl1YZdg9Qgko1OezSR
         a37g==
X-Forwarded-Encrypted: i=1; AJvYcCUCznYKt1io1aC6ZYny6frNOOs0gCDvJ6U1Ms0JCGI9Wh7lZXYdBVs764vqlRDl9daoeooM7mX6Gewungc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTT2209rifjBsoow86Ch/xpgA1KlqnRlTpCfqhnDKAn9UhLCaY
	qUGp+H7bxD/4y3eaTGJ+lkH8oXRXIMqppBkEGOzYR+mWqcp86BU12QcPgWcdfE3Md1c=
X-Gm-Gg: ASbGncsZ++fvxDFaSm0RBCdxYIhMG1FgABDlUfTfUSwlSIJ142Oe1+1fo9qIvjKTNKV
	s0QFdE88IMCZAcA5PC1ngxhTNqljYP+5WpDsWNplsjyh1o75GmMp/obJLBR44bqp/4VOMpVC+r9
	2g0yqYCUAXKhvHVtg14KJL+S8pbKAgC/IR4sdbQFkYl7VQA1JZtPTJt55dM1zbCyNCZc9D5jZqU
	2x4LqawQMay47FqkLj/kcg2Px4TKySVcXj84gmNmebEaF/32WbFHy/Gt4xUC0y6htSAeWXvnZsR
	QF/o947Oxa1oNMc9lm+fb258spt7oZGOInOqrffoUEAHDIA+axOPBHrvwMRMZEFLY/qbDMMC4oH
	xsY2p6EOeI68/T8cSCaWvhucPFbhvLOrR
X-Google-Smtp-Source: AGHT+IEP66kc+zZDdWg7Icad9MqZ3w7YASShODOYdGAZ2tanUn2oS/uFbju3FQ9gBmHRuPLclDgo0A==
X-Received: by 2002:a17:907:7ba2:b0:ad8:a41a:3cd2 with SMTP id a640c23a62f3a-ae0be8601a5mr252590566b.16.1750843099212;
        Wed, 25 Jun 2025 02:18:19 -0700 (PDT)
Received: from otso.local (144-178-202-138.static.ef-service.nl. [144.178.202.138])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae054209c85sm1009952366b.160.2025.06.25.02.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 02:18:18 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Date: Wed, 25 Jun 2025 11:18:05 +0200
Subject: [PATCH 4/4] arm64: dts: qcom: Add PMIV0104 PMIC
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-sm7635-pmiv0104-v1-4-68d287c4b630@fairphone.com>
References: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
In-Reply-To: <20250625-sm7635-pmiv0104-v1-0-68d287c4b630@fairphone.com>
To: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, 
 Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750843094; l=1937;
 i=luca.weiss@fairphone.com; s=20250611; h=from:subject:message-id;
 bh=5o4DwhEuzb0pZeAz4ygBSx9BKxTK6B7CFL6Pbp9UvHM=;
 b=8RGv708E31vt2d2JuAXjtINii0ZlMIcFpJA4UhzxKcT4R83TlDqC2QyLDV+ZFI3Qpsv66fo/J
 /ndG8Yo/44SAolhMeh6g32cHxm0sRZ9Q3TA6mqQS24au9n8K9zKJpzW
X-Developer-Key: i=luca.weiss@fairphone.com; a=ed25519;
 pk=O1aw+AAust5lEmgrNJ1Bs7PTY0fEsJm+mdkjExA69q8=

Add a dts for the PMIC used e.g. with SM7635 devices.

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
 arch/arm64/boot/dts/qcom/pmiv0104.dtsi | 63 ++++++++++++++++++++++++++++++++++
 1 file changed, 63 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmiv0104.dtsi b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..04d929db76f409c49c47ef0147a3de568006973a
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/pmiv0104.dtsi
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: BSD-3-Clause
+/*
+ * Copyright (c) 2025, Luca Weiss <luca.weiss@fairphone.com>
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/spmi/spmi.h>
+
+/ {
+	thermal-zones {
+		pmiv0104-thermal {
+			polling-delay-passive = <100>;
+
+			thermal-sensors = <&pmiv0104_temp_alarm>;
+
+			trips {
+				trip0 {
+					temperature = <95000>;
+					hysteresis = <0>;
+					type = "passive";
+				};
+
+				trip1 {
+					temperature = <115000>;
+					hysteresis = <0>;
+					type = "hot";
+				};
+			};
+		};
+	};
+};
+
+&spmi_bus {
+	pmic@PMIV0104_SID {
+		compatible = "qcom,pmiv0104", "qcom,spmi-pmic";
+		reg = <PMIV0104_SID SPMI_USID>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		pmiv0104_temp_alarm: temp-alarm@a00 {
+			compatible = "qcom,spmi-temp-alarm";
+			reg = <0xa00>;
+			interrupts = <PMIV0104_SID 0xa 0x0 IRQ_TYPE_EDGE_BOTH>;
+			#thermal-sensor-cells = <0>;
+		};
+
+		pmiv0104_gpios: gpio@8800 {
+			compatible = "qcom,pmiv0104-gpio", "qcom,spmi-gpio";
+			reg = <0x8800>;
+			gpio-controller;
+			gpio-ranges = <&pmiv0104_gpios 0 0 10>;
+			#gpio-cells = <2>;
+			interrupt-controller;
+			#interrupt-cells = <2>;
+		};
+
+		pmiv0104_eusb2_repeater: phy@fd00 {
+			compatible = "qcom,pmiv0104-eusb2-repeater";
+			reg = <0xfd00>;
+			#phy-cells = <0>;
+		};
+	};
+};

-- 
2.50.0

