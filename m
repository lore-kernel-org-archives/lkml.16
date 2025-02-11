Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE751EE7B7
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739263975; cv=none; b=Tq7UqmP/bLhhYTxBioD11rHZRiWfcVoHdoqSkedAAEVGoHa6ITCN8SELbhOjlY/1XBDBVghLDwm1i+H2LJB9zh9zcbIutO5c7nFT7pXvThj9qR37fDY9z85xKAggbiiWfLnTXBMqAm1Z7Q/7jViu5maF+d0PYAF406+ykUtRctE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739263975; c=relaxed/simple;
	bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mCcZVzE4xcwyVxhoJ7qR6MKkorGdmT14ui9dWBb8IS3wPHIzS8+wkCV/l1VruUmHOluLhrIYW8wKqZtXRIjgABdQHqYbtsWHWY4FPmRSwqC3Yf2IR6qbGS6ntLC+K3cFN0dxERFj/6HM17YngAq39u0ruL7769VEHyENaPwV1kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yvInHoFH; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yvInHoFH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38dc6d55ebaso2532495f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 00:52:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739263972; x=1739868772; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=yvInHoFHOXjhZpMT/M2R2mndKVRQv8t1pYFUaddzaWkr+J2USGgfIgO1EIXpnjIbfP
         QfBkOXAmxWezCwc/CuoCtrWzQKsq8nkYHFLhPF85/3XkhpyHzKcMxX4xfes8OMrUCtsL
         Q55Ab/6mi3l9gKIXdgwn9gfa6ndP5ivaT8hscku+l7ToBqn1RK2ohtMs+PyeIMqqXud0
         gbUbS+BnJ+sLKtqhB2yEVtPjbxmCsEHXbsVDwfZ4o1VkT7lxRMWHP2TgOHu7rQ/+k9sn
         JdYasqLHxPYaUOep85XIceuH657CvuUcQBpwewjbWCWpizzor/YkskZnslFIvRKFyPSi
         YbXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739263972; x=1739868772;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+NkZO69thNDcfaAG3NbtxaUIPk7UAb9CQ7DP0haQo+g=;
        b=NiEBu+RNAXzXL2OPwkLk9qHMHWQ7Tdcv2E1GAk9tx5D9NK8iwZReqmNA+5HLUbkrDW
         ipZGL1p2eECmxtSdfnD0zfKYUSBuZfkNyXW7iKY0H3/ZsJIa3Sop6DMp4K/ideShuwnQ
         UBD7HBE1ftdVhovPPftT0ITfA6R7d71+uu5MHs//oyvUtzsrFNVSQ2RqLue9nObyAjvS
         Ud7pres0SAtn4R8gPPqdd78o8bAv0B9pOdMokQ8NyT5mV+zRCBMtioy2IlEGg58iVqjt
         ZjtPKUtrcDR0dz8eox140P5R85h7/IbtyOfcP0p/Kq6pTycMZpzkCq8+Kl22pNBHoya3
         mhEA==
X-Gm-Message-State: AOJu0YzrWC2EjInKAI4/dUiM6TJRFnV0PmM2F0r8tIrfYXXYyrg405Qq
	YApOcXnXwB2SOxDo27T72rzW0QQgdhCmXJLMnqdOu0QybR7PajT/e+MhS4T9B2A=
X-Gm-Gg: ASbGnctGp4X0C5G4XyfRjVYN5znWT1qMyJLX3XX/hE+brhoEO7zsrgPadr3gAVBPKMH
	T+ebS422vSZMxyEhyCCxZdvE+YnUqx4FEtpHas23NZDnEE/1UDwqQ+zgFb7saOlqVXPWP7pBA/V
	iA1Ane9IcMQXVvWYKm25a688cfYLRr8dlhUpaeDtlnfAx0yATXHtGkwUyFVSjnqoREQc3Y5JPuT
	SgkHA42yTl+iXPXjXGhI7PiGu6AoABPo3izZ0GMHWOZj4xTCAsMqbbVaEba9ZcNWWACJxFB+MP2
	Avqle9gYwDzkRq1jlYi3s2XihLK7TGXddmh+1co/I3Po9LjUkYyMOQqo+uv9HsSsViIv2vo=
X-Google-Smtp-Source: AGHT+IF875qkg/sDKrXAWcxZ4sn212gtMPj+TTXBNYYLBq3b1R8Z+ofg0sDdL9n5YnOrakhwVaiQ9g==
X-Received: by 2002:a05:6000:178d:b0:38d:e363:494b with SMTP id ffacd0b85a97d-38de439d6d6mr2000697f8f.8.1739263971823;
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
Received: from ta2.c.googlers.com (169.178.77.34.bc.googleusercontent.com. [34.77.178.169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94d7d4sm207698225e9.10.2025.02.11.00.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 00:52:51 -0800 (PST)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Date: Tue, 11 Feb 2025 08:52:49 +0000
Subject: [PATCH v8 1/3] dt-bindings: firmware: add google,gs101-acpm-ipc
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250211-gs101-acpm-v8-1-01d01f522da6@linaro.org>
References: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
In-Reply-To: <20250211-gs101-acpm-v8-0-01d01f522da6@linaro.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 andre.draszik@linaro.org, kernel-team@android.com, willmcvicker@google.com, 
 peter.griffin@linaro.org, daniel.lezcano@linaro.org, 
 vincent.guittot@linaro.org, ulf.hansson@linaro.org, arnd@arndb.de, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739263970; l=2122;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=V7ZhEkTlDjAWx4+eB5Cx9IjkVRaezyIIl4x2rGpDimw=;
 b=i8pShKS7nfAdoKT8vU6vjvJX+KtCpHt/WWMuPa02dDc92NnM8Q72v6dI7wIq9gAN/5/hL4Ivy
 lIma3r/spLVCeCPauQE097Vq3DCayDV67kgFs4pVsNWSWe05l3eUb8H
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=

Add bindings for the Samsung Exynos ACPM mailbox protocol.

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../bindings/firmware/google,gs101-acpm-ipc.yaml   | 50 ++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
new file mode 100644
index 000000000000..982cb8d62011
--- /dev/null
+++ b/Documentation/devicetree/bindings/firmware/google,gs101-acpm-ipc.yaml
@@ -0,0 +1,50 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+# Copyright 2024 Linaro Ltd.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/firmware/google,gs101-acpm-ipc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Samsung Exynos ACPM mailbox protocol
+
+maintainers:
+  - Tudor Ambarus <tudor.ambarus@linaro.org>
+
+description: |
+  ACPM (Alive Clock and Power Manager) is a firmware that operates on the
+  APM (Active Power Management) module that handles overall power management
+  activities. ACPM and masters regard each other as independent hardware
+  component and communicate with each other using mailbox messages and
+  shared memory.
+
+  This binding is intended to define the interface the firmware implementing
+  ACPM provides for OSPM in the device tree.
+
+properties:
+  compatible:
+    const: google,gs101-acpm-ipc
+
+  mboxes:
+    maxItems: 1
+
+  shmem:
+    description:
+      List of phandle pointing to the shared memory (SHM) area. The memory
+      contains channels configuration data and the TX/RX ring buffers that
+      are used for passing messages to/from the ACPM firmware.
+    maxItems: 1
+
+required:
+  - compatible
+  - mboxes
+  - shmem
+
+additionalProperties: false
+
+examples:
+  - |
+    power-management {
+        compatible = "google,gs101-acpm-ipc";
+        mboxes = <&ap2apm_mailbox>;
+        shmem = <&apm_sram>;
+    };

-- 
2.48.1.502.g6dc24dfdaf-goog

