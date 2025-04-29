Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1AFE218ABA
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745938214; cv=none; b=ArWhX+uHY8ZIQvFa3/5inlei7XKAJ7dv3L47MseixDl1wvHrhYtW+pseVbhfk2/kohMAoQ3uXe9z5d+J4F0CXu3h8cv9JZPUlZhg+7Nk89fW4Al9l+4SD/0OHdNcq9THemZScKO3K4S+5XisbEDs2krIfKEoN52zmubi6NnB1mY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745938214; c=relaxed/simple;
	bh=krTaRF67fPNsLB+dqfMsYJ7ZzFpkv8kbuSh7hjXyKGQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bbhUk8USAUvW/a84GjRhl6PXUipqpSF3E63co/QMYLHd+1S2rXDk6A7eS6fLyNP4aKt26hUpEwxBF0EyyEkkSz4V4B2lRWA8kjkp8zha8BTwiQc88rPqobjQcHfh/UNSV4lMDgRjKDGcBnaK5EXP0DnyiWIvhw4NnRiXOXT5564=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=VUG6LLqT; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="VUG6LLqT"
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 154533F278
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 14:50:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1745938206;
	bh=7zoJNAv7neP8pZ54k9HnfCrdAuXD65pSkqMbfySDhgE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=VUG6LLqTbP0vBPD/vNeoYnQ2+t3r7FJIlGxvf59BTS+YOl309kvmNT1572yQaM6G/
	 spsX4HSeNIHhio8pIzfiHrcndAxpwpRKyDntp+yzkXSG54CYIPAvIGg3uk5ixWK+wz
	 6ND0cgmM4jcO0jkkcju/Tho26bL7FKDHmRh/A03KZKiPI0poZ6qrf/WbQHhujYZrXe
	 iwvE8aV/MGr2Lup0w3ermf2mSyLxXHnyKNDdU6QoBqIgFocExPKzSJLH9U2lPdy4LE
	 M9psTxnSrNIDXQjjW7tmWd5TC62rObZWbw83D+gq9VcQmyP2Lct5JtNUeWaueFysKv
	 fgr/Es8gI83pw==
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43d01024089so40746955e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 07:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745938204; x=1746543004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zoJNAv7neP8pZ54k9HnfCrdAuXD65pSkqMbfySDhgE=;
        b=hAEAP4fiLDxRy00BZ4Vh5987SrhTCnYjW6JSZajpWuRkKSCeDzvdeAPqZwTouib4DB
         UKzgK567ubq5PQsHot2RbTaPRaY8W4mlxUffN2bGyVcHhqaGVKyeBH2apxP4+t74xsRt
         8pNAOubUqrQNuRkLaDxSFfzXITjcVH3bF4h0RBKbTlDB4yj14ZgIMipANgKRalOTR5mr
         CEGTdPRu4aTUUPLJDVIUnCZyAc4loBwmthre4rnI1pRdrc79E6lW6401x8ZLaDilLe+O
         bJVcDK18enwIvRiTZWsLXBkCcUsoT+lDC7AN/GemWU5iOZ27/v38hH0lE3hbZoghkJfN
         wMwQ==
X-Forwarded-Encrypted: i=1; AJvYcCXq+JWiiKrrIqwLelXECXo7Y5qJgdQQB0JUwui354+XRNH2QO/l7WnRUXri5nuXH2e55xuj9INmaRsc1kY=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5SDaZM2lJZd52ZQuF1q+c1dw/nESmh8RL3JI3DbmmOH6Lq0a
	3hA8qigQE9MAgZ1K1YL2rXgtlejRgPwfnHI5EMWmQGpBfI2Wpz8trfXOla+5EJRcInD93xPxJlM
	cCHI1wHJsajjXMbxvBlXYX/FIO5McbeW8jyIdPnIBsd3rV4c1pt2OfWLO4i5Hp2oKdu0lNDXbCz
	W6yA==
X-Gm-Gg: ASbGncvE815GBWhV9lI/YaTApLLDbIW9p75mTAW4o5vBHgXD8LukpGB7ZBfV0zP2Qxq
	j8XpfDlR06ErpHL60FDJ1OGlC1C2taGLGAQn46P0Mezq6CObg9rnUb8bFvMBHAg3LZkHRYrcAFA
	aWiBcw6gUQvi/KWphqdRip+EL2IzqFz/qAQYQH4NBQ4O/bb+mAL82y074FCepA1NGPpNV7dP2dN
	Y4Z1UNnV77VeqorEH4Rux0dn+2oLDoBhj1OSK3GN5pTvu8k6+KC3eim34FrKIKM505bw5IMS8ny
	/ol1ve4MQLxCMVTB9jXifFslp0yQHgkOJ3aeaI+wJa0rmhXI3Z5jBzb8
X-Received: by 2002:a05:600c:c14:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-440ab846a52mr106209535e9.22.1745938204436;
        Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFNDbbGCcksRyCuvtj7AZi9NRp+RqmwiuGFNbYjNx1+LdUjm8j11MjOpdX2/aQqHlEkGBb5g==
X-Received: by 2002:a05:600c:c14:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-440ab846a52mr106209275e9.22.1745938204102;
        Tue, 29 Apr 2025 07:50:04 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2d8842sm190654525e9.31.2025.04.29.07.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 07:50:03 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: juerg.haefliger@canonical.com
Cc: andersson@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	konradybcio@kernel.org,
	krzk+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH v4 3/4] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Tue, 29 Apr 2025 16:49:56 +0200
Message-ID: <20250429144957.2088284-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250429144957.2088284-1-juerg.haefliger@canonical.com>
References: <20250416094236.312079-1-juerg.haefliger@canonical.com>
 <20250429144957.2088284-1-juerg.haefliger@canonical.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Introduce a device tree for the HP EliteBook Ultra G1q 14" AI laptop. It
seems to be using the same baseboard as the HP OmniBook X 14 so just use
that for now.

Signed-off-by: Juerg Haefliger <juerg.haefliger@canonical.com>
---
 arch/arm64/boot/dts/qcom/Makefile             |  1 +
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 30 +++++++++++++++++++
 2 files changed, 31 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 140b0b2abfb5..732cc3f6a220 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -293,6 +293,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
new file mode 100644
index 000000000000..4ea00d823693
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1e80100-hp-omnibook-x14.dts"
+
+/ {
+	model = "HP EliteBook Ultra G1q";
+	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
+};
+
+&gpu {
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+};
+
+&sound {
+	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
+};
-- 
2.43.0

