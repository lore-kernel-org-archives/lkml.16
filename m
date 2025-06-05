Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3491022A4E8
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 15:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749136303; cv=none; b=P22wiohp9TnGmk8kNyeMy2hWoePmEDN9zd2saZFGizHzEpfGbv7oCYiIw/obc9nOx8KI9oHiK2Ywt+tOeJOsBIZ98k+aYsn4Y9fZB39QsO3TM4HcTo+inTNCz4uHJISvkY4Wr0ZfMLOyKyTqg9YvsQizyVjDtq7rNoAENjkGVeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749136303; c=relaxed/simple;
	bh=3t5hMeP7ABBlyRxpmilprlc7d1eAM1m14oAOcrmuomg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LrJKXOoYwMDH7Omz5xCgYwKFqp6XbwsgLvJhMP4BFKi/QZGQ3M8I7U+jdAQeMHE084GVcuswKkJJTD985l0p0bHCee0pAujBUYwRGR8KDRiLisqitxfUSHFnbs0ui+HKUCmtiTqjguZpLMrzndv7KBVkIVi2hVfgsdzdzZ2YnvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cOhUf1Eo; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cOhUf1Eo"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a528243636so653658f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 08:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749136299; x=1749741099; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2bzgHxof4HGWQflHabmyRzOQmodkv7YALqL3K9iBeEo=;
        b=cOhUf1EoJ67iuqXHXVrfZ+uUM7gAQwv2unxKA9d476+7nA6BTOxhcrASHPxQ1jWzrc
         q2gIgw0nxSmnMsJP9KInpHvGM1SUQjXp3E4t0RhaeIP5uWRW3yV4wF2F6tNWIX3mdsb/
         z2RZcG386iAXysRVYgmGdZBD/JyDf7QQx4vcWnsO41/nuigNVehppxY/zFIdMMlh8t27
         wChSWfcit72C9dK7nwfrKNGU61AeGS7HcwgGqnf9IZLTaUTQcVdGU1Lb06+ecO8IPp0V
         0q6xKHQyYM3gyFrTfYTFsryS/MDAdCV221QuzEpwkJVixdo7/trxX+Vei0XtscAHqO9s
         +s3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749136299; x=1749741099;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2bzgHxof4HGWQflHabmyRzOQmodkv7YALqL3K9iBeEo=;
        b=sGtgI0jU0nb7clDKwy1Tf5yvjZTjW40J9uU+5DLdE6avEzXgIQqBHD+s09sd+x8Ere
         147VRYkAgOGDSJ14VAhTkrsyBYJxzcVOgU2SigiPr3sKUaGSbbwNXE6yAoAbZGHUtNr5
         +E+LVJWh7FO2ZFdaJgz5+T18uc05YjpPNBA3yCXFbzG9MW5KkbXWydxok+jWZcUe5nM6
         zHKUKdAjk5r4scI3QP0iOcS4dTZ2OwCavmdhSMqjgwT/5bfA+ngS+4DIgy2ak52s4alD
         TYEfKoNmiL7v1Xs4hEloO1X3bcX8tnZyBXfozRIHKIkjLnurtqnR3zFw11Bxj7iFIb/k
         Knjw==
X-Gm-Message-State: AOJu0Yw9OLOwYlu40rxEixJws07apC/nsQi8Hfx/moJtM1lQnb3svwQ+
	mwv8FFTRueVmmT17zxTEgurXDOVqizBQjIlXQDUHKjLcuItl5+DWKNAu/yAZ2sM3Gdk=
X-Gm-Gg: ASbGnctn3BEBwsqCSjmWninHm7dyH6poOInKfUZGB7AmmhvXTm5Gdcg+NCmbX/X/3d1
	2SlyW4cz/lgbGKatZPTfcBC5zN4aZzDUmnbczrQ2UU4GWHQHd5ZvAYs6jE/xKCqwaJf3KNKGEy/
	/7bAR17DOGq6+uYKAIsad0O8FCU7RKDfKvLiLY+0ZswVMi4dEuu0jNwoVmBTyaveJ8agc8r2o6E
	vS1Gl2rbs6RGFK6OKKqFPdUgJ1FVfNRzz1MJhqHIW76VZF5Dqk+qBpiyQAWk1zwTzLVCpRfagpA
	ACSVCoM4uQ0AOCvzyF3N9dyPzYE6mlTH6rEYJX2g1Ue91vDcsKIkGjx2yZl/
X-Google-Smtp-Source: AGHT+IHRtSTrr2O7oU4uHDUU1xf7WoHhUspxl0v+JpGHp0sOgs8hGDWDwWjJWhusRVSgq8S9nf6lzw==
X-Received: by 2002:a05:6000:40d9:b0:3a4:dde7:ee12 with SMTP id ffacd0b85a97d-3a51d97ca2fmr7046857f8f.53.1749136299417;
        Thu, 05 Jun 2025 08:11:39 -0700 (PDT)
Received: from eugen-station.. ([37.245.43.41])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f009758esm24923968f8f.75.2025.06.05.08.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 08:11:39 -0700 (PDT)
From: Eugen Hristev <eugen.hristev@linaro.org>
To: andersson@kernel.org,
	linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Eugen Hristev <eugen.hristev@linaro.org>
Subject: [PATCH] arm64: dts: qcom: sm8750: Trivial stray lines removal
Date: Thu,  5 Jun 2025 18:10:39 +0300
Message-ID: <20250605151040.56942-1-eugen.hristev@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove stray lines

Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8750.dtsi b/arch/arm64/boot/dts/qcom/sm8750.dtsi
index 980ba1ca23c4..69cb60dfbd97 100644
--- a/arch/arm64/boot/dts/qcom/sm8750.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8750.dtsi
@@ -177,7 +177,6 @@ cluster1_c4: cpu-sleep-1 {
 				exit-latency-us = <130>;
 				min-residency-us = <686>;
 			};
-
 		};
 
 		domain-idle-states {
@@ -1986,7 +1985,6 @@ &clk_virt SLAVE_QUP_CORE_1 QCOM_ICC_TAG_ALWAYS>,
 				interconnect-names = "qup-core",
 						     "qup-config";
 
-
 				pinctrl-0 = <&qup_uart7_default>;
 				pinctrl-names = "default";
 
@@ -2027,7 +2025,6 @@ pcie_noc: interconnect@16c0000 {
 			#interconnect-cells = <2>;
 			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
-
 		};
 
 		aggre1_noc: interconnect@16e0000 {
@@ -2037,7 +2034,6 @@ aggre1_noc: interconnect@16e0000 {
 			#interconnect-cells = <2>;
 			clocks = <&gcc GCC_AGGRE_UFS_PHY_AXI_CLK>,
 				 <&gcc GCC_AGGRE_USB3_PRIM_AXI_CLK>;
-
 		};
 
 		aggre2_noc: interconnect@1700000 {
-- 
2.43.0

