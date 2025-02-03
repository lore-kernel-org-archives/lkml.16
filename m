Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03FE204F98
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:23:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589006; cv=none; b=PYQV3abwtxifVevfXsfzSjC329UmnIXusWglySeWtI702LQ5voOYDjrrsRb4LrhT7NrgEan7ZW4O0WUbxwtqpPhIZ4Oh7L/AFNhX1mfI9yzdZUV8k6FQq446eLRPQqe7h9daOU3G3122ZxS0G54EntH5K6KWUNBn69IuVZkjeZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589006; c=relaxed/simple;
	bh=Lpvp0u73x3ubU5UrDV0TdedIOkakoM8csxlvAZtxZxM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dMPL/hD1OQLjynGgwUJr2ouFov50EqP7I/T5/7Of2Io8UqpCAFPyzywgLDI6llDdBUuXocA8UwX7yeziLBGQiaNjSp2i4eMPgbjaHOxBhFTaku/qQxTE2hBGs5/IxXF/UsMeI/j6xC8Ux0FdQfzdWUQAF3hxNsrX007Fc56iwTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Sjoo1cYn; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Sjoo1cYn"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-438a3216fc2so44316065e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 05:23:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738589002; x=1739193802; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AGPRCN+4MJTf9yyHW8IbDG/NcTY8+Z+VttrmJ0Xh5q4=;
        b=Sjoo1cYnRxS7ogH4R7/aiNZ4nBtVGX6g5wD6pst26FVZiwoqto08ey98L/3qGbB4NL
         86GwxUXzPIqvqIaPrREdz8Vng6Tr4med/GcRiLemE0pOz1cQE4ZXrR0wECIbZbv1TvTW
         Tad2PbtxIS+FiKrxkciYgduBEkhz3oRwOph59VQ6LFXuFt5rQRU0ahunbqprEP24RZdL
         wHL6skxgSrq4WATogdLvJ0J6hQON1hvusDFz8sSHaR9x7U53sOPG6VyL9VnarF6q6gOu
         hlNHO4flugthmcooOJviYAhJgaU33ckDRu8XFrqHQEYw4J51ddWUpjSGYgbSKGNp+2yZ
         jy6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738589002; x=1739193802;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AGPRCN+4MJTf9yyHW8IbDG/NcTY8+Z+VttrmJ0Xh5q4=;
        b=lleMM5jwnKTEktO6cDaX/8oVawNgYzcEqxcH7n19mWQwHj59vBPvdkOUUxtGVD0ouK
         IML6k/XDgw1huqm+FuO8N8Ae9DnhpYkRGZYj8xmGflHNPQctlXKVnoouVAFWDHhnxZM3
         RetHJbE49LFZj1BVXMVsFOIc5JIKMN7iwu2eOIIUaMnusLreqJytINKbNByOC2D71kcM
         MLMJbBoZmGlbLHohlzfDtvL8TUch8dK2tihmIcrk5j9rCgZZIsDhBmSLsCUi30WkW1z9
         J7yIoj7iJCErXVsmQ28SVwFPall0a6LgzgfBUM5ZI44boi9smaAZlKQGNx40CTBv5UwF
         q26g==
X-Forwarded-Encrypted: i=1; AJvYcCVLO/yUrV1/+E6sl7DOQrb73f6d0zQNerx0FwJ1vwPBAMctGuuUykT29JDhLvqIH6WxUfngJTBfY389rVM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrMxhVXvg6vF/D6fCmzmHI7rcr6UODbBZBjtLuikIdbyLJk/98
	3MewUr6+zuW7Fd30oWEfSLZNIHHczlQEmpgP26SYgvlCNZELRj+uS1NUC34AP/8=
X-Gm-Gg: ASbGncvHXhh/lsRtHklw8vQbBVkOcVfzw1plkBw4eisZ42irQ4xwdguraohpfKfFGK4
	GGur/K6gUBAAqHq595xvXxTjOHdi+QkOBEj/EmlrTnlIfALhVTnB73PIe3sOx8p3jLgozuAaphT
	xK0aLTTm1baNWlwo3YuwspPMiidoBJ/XJMQa7siuiYIDhLQcjdtYmBNXcO+o3u7a5VbkMrwKX0M
	/OYHYIgAq2WOTC+NQP84A6lSP8g4ijmtefBh70TLGDS1wQI+JMyD59vr7KodtqQ0WwRsZ6X89yc
	twyPL6GiWHZvtxMSVCxlVfxBj/3XA3v/zShW
X-Google-Smtp-Source: AGHT+IHSrVoAeR8CvFOpm/KLo/lYQGLkfOymi8NjX1llKLvGV9X7F5CzwyX6n14Q64FZPjBje8QrFA==
X-Received: by 2002:a05:6000:1a8c:b0:38c:5bb2:b932 with SMTP id ffacd0b85a97d-38c5bb2bc01mr13239406f8f.3.1738589002167;
        Mon, 03 Feb 2025 05:23:22 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ece21sm12570858f8f.20.2025.02.03.05.23.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 05:23:21 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 03 Feb 2025 14:23:17 +0100
Subject: [PATCH v4 1/4] arm64: dts: qcom: sm8650: drop cpu thermal passive
 trip points
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250203-topic-sm8650-thermal-cpu-idle-v4-1-65e35f307301@linaro.org>
References: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
In-Reply-To: <20250203-topic-sm8650-thermal-cpu-idle-v4-0-65e35f307301@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7736;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=Lpvp0u73x3ubU5UrDV0TdedIOkakoM8csxlvAZtxZxM=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnoMNHnDH9SXi8/O6onFwXjR+RUWCBjAN0CF3aYDVm
 x7nerpCJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ6DDRwAKCRB33NvayMhJ0df1D/
 9JJ4j4yzw7qLaOa/zo8b2tr0DZ5quNAhNduTVELukS+B9Zdsol/ehArfdQdoNooHi2R9rcs11kR3rq
 9utELawz19DPaDXNBOeIfc0KM8lwgStbrvAu31+Bh9ot+F28bzgiDjH6v17Doc05kRjr2wm/EOd9gV
 Lof/AsE6sUYWqZDTRBVd0HA6QG8DdMl4Z6yqF4pLGxlSyAG6bhAiNSv1yyQS3dF/gI5XHteFwKnU2Q
 zbLAt8VnalN+Jfswelm/LZ9qn232VK5aqik5ksbWS/lldAQmX4iViV7+4LSIwFlE91ztdFhLQxRZo1
 ukHsxb6VUc2iKLc5JyJvhQHD0KozUBW2JgTF/VbRR1pFfVwR6pmoUCa77CPZZSsTovvHF5o7CIJf8P
 +jMsl+5MZfAmbjAk60Hqp/htHAXhG60TnQagWmNJ6dn9KTL9RSS+eFgMC+q5s/51K/4C0wpi7PquiF
 vIuEsHSlO3MrWKJoJQ3cJ3dN+LIYZymtceFd9yycUx4BkZ5LSEe4i5fNKxqpB6AzymoCLPCdH9RtqU
 RvRpxjrwJb1pmekBGgevWc77NIeKRcfX0VwoNBGl5Sh9mDvqT+fc2yFrl1ARoI1YDsTFNQ7cqGmtHy
 un9b7w4ZGIMlaU3N3SUa6tBqrHg56wmo1DQm7cubKCmSLTivWT+Zn+dI8ZSA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

On the SM8650, the dynamic clock and voltage scaling (DCVS) is done in an
hardware controlled loop using the LMH and EPSS blocks with constraints and
OPPs programmed in the board firmware.

Since the Hardware does a better job at maintaining the CPUs temperature
in an acceptable range by taking in account more parameters like the die
characteristics or other factory fused values, it makes no sense to try
and reproduce a similar set of constraints with the Linux cpufreq thermal
core.

In addition, the tsens IP is responsible for monitoring the temperature
across the SoC and the current settings will heavily trigger the tsens
UP/LOW interrupts if the CPU temperatures reaches the hardware thermal
constraints which are currently defined in the DT. And since the CPUs
are not hooked in the thermal trip points, the potential interrupts and
calculations are a waste of system resources.

Drop the current passive trip points and only leave the critical trip
point that will trigger a software system reboot before an hardware
thermal shutdown in the allmost impossible case the hardware DCVS cannot
handle the temperature surge.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 180 -----------------------------------
 1 file changed, 180 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 25e47505adcb790d09f1d2726386438487255824..95509ce2713d4fcc3dbe0c5cd5827312d5681af4 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5751,18 +5751,6 @@ cpu2-top-thermal {
 			thermal-sensors = <&tsens0 5>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu2-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5775,18 +5763,6 @@ cpu2-bottom-thermal {
 			thermal-sensors = <&tsens0 6>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu2-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5799,18 +5775,6 @@ cpu3-top-thermal {
 			thermal-sensors = <&tsens0 7>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu3-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5823,18 +5787,6 @@ cpu3-bottom-thermal {
 			thermal-sensors = <&tsens0 8>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu3-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5847,18 +5799,6 @@ cpu4-top-thermal {
 			thermal-sensors = <&tsens0 9>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu4-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5871,18 +5811,6 @@ cpu4-bottom-thermal {
 			thermal-sensors = <&tsens0 10>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu4-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5895,18 +5823,6 @@ cpu5-top-thermal {
 			thermal-sensors = <&tsens0 11>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu5-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5919,18 +5835,6 @@ cpu5-bottom-thermal {
 			thermal-sensors = <&tsens0 12>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu5-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5943,18 +5847,6 @@ cpu6-top-thermal {
 			thermal-sensors = <&tsens0 13>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu6-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -5967,18 +5859,6 @@ cpu6-bottom-thermal {
 			thermal-sensors = <&tsens0 14>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu6-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6009,18 +5889,6 @@ cpu7-top-thermal {
 			thermal-sensors = <&tsens1 1>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6033,18 +5901,6 @@ cpu7-middle-thermal {
 			thermal-sensors = <&tsens1 2>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6057,18 +5913,6 @@ cpu7-bottom-thermal {
 			thermal-sensors = <&tsens1 3>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu7-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6081,18 +5925,6 @@ cpu0-thermal {
 			thermal-sensors = <&tsens1 4>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu0-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;
@@ -6105,18 +5937,6 @@ cpu1-thermal {
 			thermal-sensors = <&tsens1 5>;
 
 			trips {
-				trip-point0 {
-					temperature = <90000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
-				trip-point1 {
-					temperature = <95000>;
-					hysteresis = <2000>;
-					type = "passive";
-				};
-
 				cpu1-critical {
 					temperature = <110000>;
 					hysteresis = <1000>;

-- 
2.34.1

