Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D244122258B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:53:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744123991; cv=none; b=szGvaiYGMFrORBYCYF82quO7bgPBFIKPNnWdoc8Isdd9DQaQbVNSOu59wtJpQBmFYTqgHItv4jKeTaLiqy5twaNm3NqlFTsEku7PGPRju9C0Bkn032xXs2BDes9cKbqQgb0H12QIY4Oil33UuoAUqPeOAvq74LAPwBiAblZ5roQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744123991; c=relaxed/simple;
	bh=YAMbJeglLd+m3LPt1Abx+lmJTW0tnjp0s49KyTviaVY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HtjdbTdWHDebQCcl7z6F36aJvqtoGHek/UngBGJlsXduDO0TgJWUcUV4yKZcNrhDyEGbN7s6taP/J7hdZHhb3CqaJ4w7Jd/VsU+n6dLxyMj1g3fvxLtSIjuQAMJ51RHrl2LnxZ0AX8r5M7MbSiGyif/LUSrOUsvvWg3d1lPAewo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=L9zWDsM2; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="L9zWDsM2"
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 889FC3FB6F
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 14:53:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1744123982;
	bh=t7RLGdhnmdv0HU+cNYiwuyYsfJnpe4cA3+J5cf+iCGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version;
	b=L9zWDsM27cjJJAElIgJY8Yu2L2LgBKJPIAO0ZhBnZ09lC97UwUrU5yCqrU0zZRPsF
	 AbILvQ0j66g/xhCSu/HYR0XMwjuLC6QSoDLrAmv+SfmzuS2zjxNPWWWGY89ziLMFiR
	 dT3K8EyGqOYjNipnAL/+030d6gpyG6TmgN3LORzLydavsDKyapd2Jvtfm75OIVFGF6
	 hERCTLimT7AWXnYig66iEP5Cc2E3xp4NDB6IPHCS+spLg/8PNTcnYNMrI1EAiia9qh
	 8/Fc4yPrQkLdYfIeJAPfrQ4j+0yzeXyDEBj9Op1wy5amLh6voeFZh+AAEwv/G7ovDa
	 uZt8HArz5gzaA==
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac79e4764e5so504738866b.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 07:53:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744123978; x=1744728778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t7RLGdhnmdv0HU+cNYiwuyYsfJnpe4cA3+J5cf+iCGg=;
        b=dL/A3xlr3JJDUf6fQT+pQDIWG4XYwjWiEYbYKp10mBK67MEI0tRGq3nmJiUP1WqVtU
         GgAKecWasB4ZfTzHlOZbU5SmXWdkpl5Dlx+chvQ8kDok8dKd2BpbNFV3Tnp+os6c372F
         4CSexvJkrSwqczw6qR+JOb0Edkd5SribEy9DqFZN78KLx45nGDE5saNaQd1t1hsrl6vF
         Aq2uZJe7+KqfPViDZyh9M3X9dV2S3NNV297aR2EbiO1NNg2qk+FOeXVuYHusRDAGxNK9
         6Rm8OLCZickZ7j8KLangAQg8nhfqlqKk/b8075iUGFtmWcbf+g11OvxjCCDRdIeitdry
         QrPA==
X-Forwarded-Encrypted: i=1; AJvYcCU0/DjRtkMSFcO1JVbfA9IgA0rbmpJknfFj9xEvEA7P9/mFee7GWx+UaN7aqcTE1xMMZEUXxyhJW6JkpXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwEJRwDmSp6QDwACmJasXIEPKGXt/lkw93ajRoFh4C6JF+r3qC1
	LM1hWp7yb44tqL1fxYxVlojCTOgI99qIa9n86gvAfz9rJcwf/OSGzRaNIKz/74IZvUNYoSdexlx
	fKrQHXuf5S7z9Fzs+Eq+uHQ/onTy5kT4FP6BqiVCO0Tzj9H3luBEFd3EwTbW7NOnDs6mPd+q75m
	IuRg==
X-Gm-Gg: ASbGnctYDJN328HDzxgan/p8VsWpKNXFlHrkRIANXQyu3E+AoEC8IfRPM9k7ARfCOq2
	DaApGz/GcrqEo/FQSd069+Gr4fI1Zkql3WAKdhUM689QpykRzs1QNcr9LfDjQTPLombCmbP334i
	6UgvhEz5+fdL7U28UUjGpTQFGcPXuPHb9PwskIBmNkWRZOSD5+KfzGwhKfePtobrSiwivz/KDx1
	RdpxUmMSJZeiZfHFbnebRrFGMQDheebR+hK7LcxfrgSPc04Hh+2EMS45wbSoiHS+Uy8pQZNt35S
	yq1hxI10bv1/wUdw1brRP6KOn31ts++XaNkLstfQqOfcu9CYfVgmxCR1R4uk
X-Received: by 2002:a17:906:6a16:b0:ac7:391a:e157 with SMTP id a640c23a62f3a-ac7d1c69fedmr1405013566b.58.1744123978228;
        Tue, 08 Apr 2025 07:52:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsPIcgqIePEdNeGq4e0HZauzcWwGdWE6nTtAT2uBsc2gtQUXoDUsu029Z3/BlD7NbthzrCDQ==
X-Received: by 2002:a17:906:6a16:b0:ac7:391a:e157 with SMTP id a640c23a62f3a-ac7d1c69fedmr1405011366b.58.1744123977814;
        Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
Received: from localhost (151-243-191-194.pool.dsl-net.ch. [194.191.243.151])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac7c01c2ce0sm935136066b.178.2025.04.08.07.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 07:52:57 -0700 (PDT)
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
Subject: [PATCH v2 3/3] arm64: dts: qcom: x1e80100-hp-elitebook-ultra-g1q: DT for HP EliteBook Ultra G1q
Date: Tue,  8 Apr 2025 16:52:51 +0200
Message-ID: <20250408145252.581060-4-juerg.haefliger@canonical.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250408145252.581060-1-juerg.haefliger@canonical.com>
References: <20250404090108.3333211-1-juerg.haefliger@canonical.com>
 <20250408145252.581060-1-juerg.haefliger@canonical.com>
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
index 000000000000..9f3aac1a83fd
--- /dev/null
+++ b/arch/arm64/boot/dts/qcom/x1e80100-hp-elitebook-ultra-g1q.dts
@@ -0,0 +1,36 @@
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
+
+&sound {
+	model = "X1E80100-HP-ELITEBOOK-ULTRA-G1Q";
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

