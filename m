Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F75B1D619F
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 20:57:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565066; cv=none; b=GzbobuukkUjPEqOhoYK3mb1EoS4BQF9j+Gouj5zSt5LNze0aIbOBD77EZ13r7cGYOIb7sAKHiuqMIr2rF+yoKgX0nKVQl4oNMVhHSheDAvyB+ZaUVV6MefLGjn81560peMbn//Ps4sHZY0p3cfxZP9Re2cKLUA7gcXimp+x2A+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565066; c=relaxed/simple;
	bh=Dwi73w8Z6PrIgKWj8BhvUdNVPqAGEMJAhF7n320ltE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=URaS65aLuCv5YgxfzgnnFWdp+ICHnlinsz7uEqOEkllYb//Nz8BcnO24Clppzh5le/iTugieZUo//Dr3IYZBE6y/839naKUP9pjT8KG5vnQTjHuA5En1L1uXUYm4mHM/34LyYjFSEdxasPzOdQsEJKxvRxAHLx4Qxx0zQSV6Zng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MAUVxAlJ; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MAUVxAlJ"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a064a3e143so2841939f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 13:57:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746565062; x=1747169862; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=;
        b=MAUVxAlJuqkySUbWPV6Y4pIqJTaoXmigS8Af4qEo918jgmjkkeGNnWUXk5qe8jV5FZ
         museLZmD1SGdmQmWJpKBWRB15/e99zM+xEP4COquKID8k7uNANv0/rf/wiIRyz0z6oEc
         tz4xcP/UWHfWY1sRdDU4Icn2vcMEjl0TGEXRgl5O8WsOOcTXQZDuYwvbYhL6t7h/BTo3
         O4yyuo5Cidafx+vh6H0hfniZeKuRZQ8yUKJfLyXSafgJCA1CJgCyRrlKdiNwvhl3UbFl
         UXZuRJbwaneJCnt0mgdl9APvqjuUGVcajl9cQvF/MPkyxWDMs3i3zwviEPj9tBjqXmt0
         oWiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565062; x=1747169862;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hPphbwPW3jRb14mN9MVqvjGdvmGkxh1ARNk78hKTSio=;
        b=qbUOYFL9Hm05Q/XqOHCM5rLJgbV2fLmvk0Nxq1ShInfPm8bRSCaYrCXzFE2wAnRQwj
         Xs5P5T6/Kt1Q0rYD0JNxIpLiaJwyVWNGOYwLzCbYb46gL1aFLJA9oy1j/WwYTRE9npzr
         /TQplpLSFkdP7wg6NzButfcQuK7FmKSeNQ6Fux0ueXB1D5K7aHzwd2wqncsowpSMpODd
         YwHwtUU0wOjXo/saAbl4ISEN/fSroLMYRF8LIKmrKwL74ymEX52PzW3Eu63c++I+biG3
         XNhcOmqGVbkVL/MI7rB8t2I1tuQyBnrRdleDSvwvcQn6TZ7vlolWEA14vpvV1lO9qOFl
         PFqA==
X-Forwarded-Encrypted: i=1; AJvYcCWgMa5CwBWBOSk+u6tgDGAHtPSxZK87f2CCWPjTH1VJJ3MALJMNBpcvHm7W/V+c9ilgcu1NIukrLHFoa9c=@vger.kernel.org
X-Gm-Message-State: AOJu0YxnunnAwo/K+6rIgK7a11V6ZQnrlxgiWrXeEYfWwwy8N/axY1Wk
	smcwudcUsPA5vjhUXGWpbKGbIfFIe59OyIDGH4JSMwtaGcvTe/qbDB0bOSe8HkQ=
X-Gm-Gg: ASbGncvWpcLUtOCKB9dbGtETmbgZVD/Sga0xmq3zXFVvRgxgLk7cHExEYdCE2CZm/3x
	l420R2pyncTZKvQ5X+rM5DLyT2LpJX86aXxg51N3sJDDUuzyPyQ0fWROeZD9oZ/67qTn7+7njkw
	LVw1EDiZ8FMLni/rkEqUpFl0kv9g4MrjpsI2K8qwN8jIAzHK6XxG2XZPulzghx5VA3dUE436nLy
	HvvA/S264ev/2ngk2FptPGmA/OYT1kTk4aLcz7XbYOf79DqgNe5ZkwmgYBH7FknUCnd8j3FvfY0
	qzBq5HgWvXFmZq32CEcl3gtNsgH8fIZTaHA7KINcQ9zP2wPNSgCteXPZnpfuh7HcL8UKUNk=
X-Google-Smtp-Source: AGHT+IFSlhDE95SzY++0BnY3/6yTVPg9tSQuJShvecTP8iv8glzD71jC6MAKKuiKrPDEpfjMgkK6Pw==
X-Received: by 2002:a5d:64c7:0:b0:3a0:8495:cb75 with SMTP id ffacd0b85a97d-3a0b49ae884mr743025f8f.9.1746565061881;
        Tue, 06 May 2025 13:57:41 -0700 (PDT)
Received: from gpeter-l.roam.corp.google.com ([145.224.65.147])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17022sm14671826f8f.89.2025.05.06.13.57.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 13:57:40 -0700 (PDT)
From: Peter Griffin <peter.griffin@linaro.org>
Date: Tue, 06 May 2025 21:57:28 +0100
Subject: [PATCH v4 2/5] dt-bindings: soc: samsung: exynos-pmu: gs101: add
 google,pmu-intr-gen phandle
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-2-9f64a2657316@linaro.org>
References: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
In-Reply-To: <20250506-contrib-pg-cpu-hotplug-suspend2ram-fixes-v1-v4-0-9f64a2657316@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 tudor.ambarus@linaro.org, andre.draszik@linaro.org, willmcvicker@google.com, 
 kernel-team@android.com, Peter Griffin <peter.griffin@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1458;
 i=peter.griffin@linaro.org; h=from:subject:message-id;
 bh=Dwi73w8Z6PrIgKWj8BhvUdNVPqAGEMJAhF7n320ltE0=;
 b=owEBbQKS/ZANAwAKAc7ouNYCNHK6AcsmYgBoGne9FqRL4vyvavqCGSB8WiKiy95ngApArMCaz
 zSnaJhRQcWJAjMEAAEKAB0WIQQO/I5vVXh1DVa1SfzO6LjWAjRyugUCaBp3vQAKCRDO6LjWAjRy
 umGjD/oCM4hr2TtaKL10ufwpnUe287uZhycwCFgtVwq8X/kssw87WV1sQqeAdEhvjjA3AUwy8/d
 dOsVU8TNA7f0OmgwKvtAmB5tmgiCwt1ng69S2rn4/1M90mg86/YPwxeV08PYMdZffJi+eoges0V
 B5zFC8IyYWK0NpRGRG5kKDEcuSZwbta2bROdJyh1r2Vfk3WFPJNeCBqusgpn7qZIOUWd8VUGYfQ
 rg+qHDEM1uvD7WI4HX2rKZtwvoLchyB0eAao0xhzIVar7ALp2v5BK+99TQp/n/9ClPUwdI100Ni
 bfDhWB2Vi2TRlwrECaQ5Cxh/xC1yxYz/oGYxc65Mo6Bfmx+MHoWuDVHOc9Cx3wD5mqgRmDS7GaE
 ufmexxfCgwQQkaNKwCzATJLPv7QETXw9lSsYUFW7m0QccfqEsDXAcxo5tcF8mbp7yn3VMYcS52B
 xv4FKTJDQl4DVRXNPnQGsYgDdzGM2pXyK7t8Y0FMrCx+I/MZNpLOpVpm6Cl7aNRRNjKJoJTgzVM
 2rcxQi9VmrGfKu9W5ygzhTe9LBybVMRgQn6EF+Ve/VTtpN7iQdLfBuswSepHiKy32jz5dcAsFIY
 x0u0jaGtemD2MBIBfB6zCrpTLUwdx+nkifTxl8IaNMLRgFhG9p4HiESrcWc6/VDWlMKdEzjDce+
 0F23juvsfaJoLLg==
X-Developer-Key: i=peter.griffin@linaro.org; a=openpgp;
 fpr=0EFC8E6F5578750D56B549FCCEE8B8D6023472BA

gs101 requires access to the pmu interrupt generation register region
which is exposed as a syscon. Update the exynos-pmu bindings documentation
to reflect this.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../devicetree/bindings/soc/samsung/exynos-pmu.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
index 204da6fe458d2d4bfeee1471ebc5c38247477ae2..3109df43d5028c61cbcaa597e7bd8cb530eafb37 100644
--- a/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml
@@ -129,6 +129,11 @@ properties:
     description:
       Node for reboot method
 
+  google,pmu-intr-gen-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description:
+      Phandle to PMU interrupt generation interface.
+
 required:
   - compatible
   - reg
@@ -189,6 +194,16 @@ allOf:
       properties:
         dp-phy: false
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - google,gs101-pmu
+    then:
+      required:
+        - google,pmu-intr-gen-syscon
+
 examples:
   - |
     #include <dt-bindings/clock/exynos5250.h>

-- 
2.49.0.967.g6a0df3ecc3-goog

