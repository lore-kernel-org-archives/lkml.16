Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606A31A5BBB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743757289; cv=none; b=B9cMw+tr8/5IAE8rkAcHMpd/5OgaQIXzxSdtK/gd3FLJB/HyyBUKOaJt+3XSOrMLbu2vG2YSvvxezailEGGAOH3/jGsfYFiWESqMeCX4q97kj2AdSDCI7qlf7jNrOCWK1C79I89GSSlsa5MLAVTcImJ+UwdwvRVFCHbLimJkRM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743757289; c=relaxed/simple;
	bh=Py3IjWzUP5+zKoHFRdbmgLnOmgLdEHUcnt3FElvF8UU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOAtLjZ5FA5puGPIUnFMbipu7CtbetIS4HMkBdYCwx4dGTtRuu0MO4/H341JiEt7KmNrBiedMIv3uj3ZGQcfLprWy6RS/YWdbFhesZza8rmnsk5+347KJ2g780hg1UuPFTw+cxWIlY/53y/vK9hSvNGp+1Ac6JVnp7Tof5ZvkGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=voXC9dsF; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="voXC9dsF"
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3823A3FCCB
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 09:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1743757280;
	bh=taLKnjcRWFAOhCgBuTXiZh92hjHs2t1+eilwt6zToeA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=voXC9dsFwfZPvzHfwLmSRjWHgMDGtJmZLQVADvPoVsqZ/qScweDJZ7UR1tbgcqzWn
	 gXGwwAi5sywV0Ku8krTCvnTa2+6oZQ5wGx4iuP0OH/MJ0QgBa7HuuKyaIyoI943J0e
	 3koCDPEQZhV1RVz45hBVFobNPH3OZLyTkbatUfzsfjbakblN1BBt7qtRDDsrjTkZHo
	 dfeXr432unUByYjwTmWEMXNpcw4OH4hrtOGYgEebJADleAVsfjjfJZpRdkEIPKJ/NT
	 qZGNwgZeivdXIAagMzJ4TGnqf8Wj9IeDdbREfBNASXTnqziHI/zqbdl7a424gkHd9p
	 rPM56uXCmXHVg==
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43ceb011ea5so12160235e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 02:01:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743757273; x=1744362073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taLKnjcRWFAOhCgBuTXiZh92hjHs2t1+eilwt6zToeA=;
        b=KUAGin0uuoEb3M/wmZil9/7Z8t0/CZaL97qE5XajcXttLHHhoUtVdWlfGY9/OGS+DT
         +quwEhzdgPOs2ru2usygtsqQF9HxH1GUVLnCsNRf+G6Zn+NNqZNiwmBZZaibodSLzaa4
         8Mq4IVQ04PQrLuZuUiCThe6CKkkIOyQwfcq8AD53qli6GyJKG8aPqiNlFemA7WqVibRt
         M4c914dTPkfHiDuA+YZypkxdXObqFVxZPF89anEtZeALePVlRoMskqtlbbfCGM5YDNl0
         QQTq3MIQuqmXmBbTqeTvkIebz4V3BGf9oe60ENqbfCeIsg4h2zn5BENeauqpm6g4yjB4
         Qmag==
X-Gm-Message-State: AOJu0YzeGVi6CcnfpoTPup6qibzxNxlFemwQOOscjThlNTWVP5Nus3Z+
	RcIh78Ds+Pe9LwC/e82lIg4iRUgJlVsZQaj7gAOFAnVGJgNCVcygT38LKA98pRwITYeEQCcnMgc
	xznjZm88C2OrE7hloQRt3xsF62y7n7VBm3xObepU7wc7bwyfYDAOAbaFO1G8T08W0eH2GrkFQ+F
	rY1g==
X-Gm-Gg: ASbGncvSldLAeoczopyZVFuzOrG0w9v7mnD/angU34Ogx/XejX3AVgNOvPQP88EVU2v
	TerHPOz2eIkeluNU/mmVfWbJzoMAFEN6OTpwqglckmovnkGpVcWtuTTlBdRAd/+SVEcjs5uZaWA
	CqYwAX5XZTu80IblGSttuyq0oVV2qIa7G5M50c7dDK1n20gofPVIaTHEhFtKPWEDdx4YqgTsbAm
	dK4Emhs2dM1iB05+XFXlP2vOkE+jU2vgbV1q+DIjlVcgYzZ//hNzmSPSkOk6GgGw/LTJ5W983lT
	XXdY/AY/rIJt0Y4BntQB5/zxQaDbXhbPB84KR89jBhsUtb/QA4zNaHC1fssZ
X-Received: by 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr14950595e9.19.1743757273206;
        Fri, 04 Apr 2025 02:01:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWbk4uEoYAB/4LlThUDVA2+k1ALwsbhVFnRClxycINFocI4ojY5djxH3yqzrqFUpYfXJPnWw==
X-Received: by 2002:a05:600c:a0a:b0:43c:f689:dd with SMTP id 5b1f17b1804b1-43ecf8d0a37mr14950405e9.19.1743757272794;
        Fri, 04 Apr 2025 02:01:12 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm41974215e9.0.2025.04.04.02.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 02:01:12 -0700 (PDT)
From: Juerg Haefliger <juerg.haefliger@canonical.com>
To: andersson@kernel.org,
	konradybcio@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Fri,  4 Apr 2025 11:01:07 +0200
Message-ID: <20250404090108.3333211-3-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
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
 .../qcom/x1e80100-hp-elitebook-ultra-g1q.dts  | 36 +++++++++++++++++++
 drivers/firmware/qcom/qcom_scm.c              |  1 +
 3 files changed, 38 insertions(+)
 create mode 100644 arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts

diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
index 710879d94c00..3d98bb95e8b1 100644
--- a/arch/arm64/boot/dts/qcom/Makefile
+++ b/arch/arm64/boot/dts/qcom/Makefile
@@ -294,6 +294,7 @@ dtb-$(CONFIG_ARCH_QCOM)	+= x1e78100-lenovo-thinkpad-t14s-oled.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-asus-vivobook-s15.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-crd.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-dell-xps13-9345.dtb
+dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-elitebook-ultra-g1q.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-hp-omnibook-x14.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-lenovo-yoga-slim7x.dtb
 dtb-$(CONFIG_ARCH_QCOM)	+= x1e80100-microsoft-romulus13.dtb
diff --git a/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
new file mode 100644
index 000000000000..7f069a2e9a46
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,36 @@
+// SPDX-License-Identifier: BSD-3-Clause
+
+/dts-v1/;
+
+#include "x1e80100-hp-omnibook-x14.dtsi"
+
+/ {
+	model = "HP EliteBook Ultra G1q";
+	compatible = "hp,elitebook-ultra-g1q", "qcom,x1e80100";
+
+	sound {
+		model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
+	};
+};
+
+&gpu {
+	status = "okay";
+
+	zap-shader {
+		firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcdxkmsuc8380.mbn";
+	};
+};
+
+&remoteproc_adsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qcadsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/adsp_dtbs.elf";
+
+	status = "okay";
+};
+
+&remoteproc_cdsp {
+	firmware-name = "qcom/x1e80100/hp/elitebook-ultra-g1q/qccdsp8380.mbn",
+			"qcom/x1e80100/hp/elitebook-ultra-g1q/cdsp_dtbs.elf";
+
+	status = "okay";
+};
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index fc4d67e4c4a6..e7262ad11509 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1987,6 +1987,7 @@ EXPORT_SYMBOL_GPL(qcom_scm_qseecom_app_send);
 static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "asus,vivobook-s15" },
 	{ .compatible = "dell,xps13-9345" },
+	{ .compatible = "hp,elitebook-ultra-g1q" },
 	{ .compatible = "hp,omnibook-x14" },
 	{ .compatible = "huawei,gaokun3" },
 	{ .compatible = "lenovo,flex-5g" },
-- 
2.43.0

