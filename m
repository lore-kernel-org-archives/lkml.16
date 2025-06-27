Received: from mta-64-226.siemens.flowmailer.net (mta-64-226.siemens.flowmailer.net [185.136.64.226])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D359122577E
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.136.64.226
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751036099; cv=none; b=JNbCPZYkfFNh3ykYLt3PVN8wRw/4SopTXyB3GEDYz76yYv4PSGCjEkSI59gHWDizRiVtsmMNbGj3j4S8vtT4F39Xf5fajX8NT4FW4WZgap4H0rGdyaP8lovQgBezUamy7RBCN0xetxUd5vNjEf8OYmJcAw/5QwGfKho/zt0ID90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751036099; c=relaxed/simple;
	bh=15J+IQAkOb/B6R9Pfbs3G/etVMfCqLb+Vjq0lgfKV5g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=c2gwkng6GB3IIwvZJubYQHnVW8skpCO+lDOrquCG2zpmkAbBblo95zNWkggasFydxbDabyrot046N8zX+t6/bsDorO6PyUnI1rCA7sx1f8nEXOJtqk+TxDEzNfQdqJfowhYWWVvcxADbJS/2FswwR1HlvMSjuusBD9N3ZkzRll4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com; dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b=NknhPClr; arc=none smtp.client-ip=185.136.64.226
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=siemens.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rts-flowmailer.siemens.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=siemens.com header.i=alexander.sverdlin@siemens.com header.b="NknhPClr"
Received: by mta-64-226.siemens.flowmailer.net with ESMTPSA id 20250627131426a3bf49ad6ed7034d72
        for <linux-kernel@vger.kernel.org>;
        Fri, 27 Jun 2025 15:14:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=M4o1mmAGEsf5Agze6Yc8E7yYvvCWB7C1WHPlHiIkd64=;
 b=NknhPClr7PprOtuFLqVoQoigCsC/fp8L63nr9ZT+VhQURM3aPPKa+CvAKrjU+CNT0j47oR
 cm7e26Z2e73zs9J93WZi4lyoAafUooAJA7vj4pZGSBa/NioXPq44qsO2MGZW3tYb+AXe2foB
 2HXutKzK/P1+B9fYXP/M9oYSQDHxyDAd96brh76vYblYWIWOtCLS/DQ92HQgSIcpNR9zIoMv
 nL6cRWqrzkk7fL03/zD9kVf8yvzLrpob1pUROFsvDWIKlOodJGipfrh642fs/wwNxV4+zBt+
 xwHk2uQnntmavXFmfpI/Knj9SoFE1Kl7ZqvueMrnHxvWChTmufnW0JxA==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: devicetree@vger.kernel.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] arm64: dts: ti: k3-pinctrl: Introduce Schmitt Trigger macros
Date: Fri, 27 Jun 2025 15:13:23 +0200
Message-ID: <20250627131332.2806026-1-alexander.sverdlin@siemens.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Introduce ST_DISABLE and ST_ENABLE macros so that they can be used in
conjunction with PIN_INPUT* macros, e.g. (PIN_INPUT | ST_ENABLE).

Note that K3 might have quite strict input slew rate requirements and
all inputs actually have ST enabled on reset, but AM62PX_IOPAD macro
will not preserve this power-on default config. Therefore ST_ENABLE
is encouraged in many situations, especially if the input is to be
used as IRQ trigger.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
 arch/arm64/boot/dts/ti/k3-pinctrl.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-pinctrl.h b/arch/arm64/boot/dts/ti/k3-pinctrl.h
index cac7cccc11121..3e371be7b8062 100644
--- a/arch/arm64/boot/dts/ti/k3-pinctrl.h
+++ b/arch/arm64/boot/dts/ti/k3-pinctrl.h
@@ -8,6 +8,7 @@
 #ifndef DTS_ARM64_TI_K3_PINCTRL_H
 #define DTS_ARM64_TI_K3_PINCTRL_H
 
+#define ST_EN_SHIFT		(14)
 #define PULLUDEN_SHIFT		(16)
 #define PULLTYPESEL_SHIFT	(17)
 #define RXACTIVE_SHIFT		(18)
@@ -44,6 +45,10 @@
 #define PIN_DEBOUNCE_CONF5	(5 << DEBOUNCE_SHIFT)
 #define PIN_DEBOUNCE_CONF6	(6 << DEBOUNCE_SHIFT)
 
+/* Schmitt trigger configuration */
+#define ST_DISABLE		(0 << ST_EN_SHIFT)
+#define ST_ENABLE		(1 << ST_EN_SHIFT)
+
 #define PIN_DS_FORCE_DISABLE		(0 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_FORCE_ENABLE		(1 << FORCE_DS_EN_SHIFT)
 #define PIN_DS_IO_OVERRIDE_DISABLE	(0 << DS_IO_OVERRIDE_EN_SHIFT)
-- 
2.50.0

