Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BBFC288531;
	Wed, 28 May 2025 14:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748441368; cv=none; b=A8acNFUlGtwJrcfaPa7RbkUDVQes8ahCQ3phN6P9eaH7ZXWUFGLP8APMm16b2GGL/B4ompFbd4OUWa8iALkwPKG4z1Fer/Zx9RJMFO+KE21cfuDp+sfnWLGuLlSJO6+wJtYuSXq3dXV0BBuW7+gorcGKXWT0U60b/Qw5CsZF21I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748441368; c=relaxed/simple;
	bh=7yjB8O1nptaMCAdyW34dheYmTFFgAPJt00GF5IcxxAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=np9CNvv+PjpNGyq6ZNChYnQqJS9xe+mWdxcq7sBQie+uyJqqWi8olo37n9zyjIHEJB/xVVCdDQZmnblJ7x1mIkVdKcnhuJAGZJnc1O8DmfG5qiuSm4ynMWnTz67ckOBOQtf18VV1WHW8gWTXCDpCmfEhN9zpHU6upI340zyfR1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTbwWYdC; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTbwWYdC"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-32a6b34acd9so19843291fa.1;
        Wed, 28 May 2025 07:09:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748441365; x=1749046165; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YrwViwkA5g2e7HXh/5c2XXJyUI4AHTmxngFmEUZQuds=;
        b=LTbwWYdCFvgfIUqXRH0LVFyWp7aBTfTExUTE5fF2K+7EPT4GMKigTqqUdfm1yzuot/
         UcMjMLZUkmQpn4JknUKFwKBlVHZVQH29l/Wz3S86nN148Zd+gQtmCFBuPumdnQCbEDjZ
         1D6w/XoGRTlAL2LPTHpnRi2C9+Uw5ppz8v6kQ2PY2DJ7XV4mjypi6mZGuJydhM4uAJl7
         00L9Wb6zeJ1wuwCNmLMxGE87rd2wBkP5Vc5Z1O5GDegtDpm2R0NeZeTy995p/F3vp2Ym
         Gu9a4MSInLz+tNcFNT0cFpAioix0vbKj+SycqN13q5ftiKjo7W/UHcDtp62pXbXMR+Nu
         l6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748441365; x=1749046165;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YrwViwkA5g2e7HXh/5c2XXJyUI4AHTmxngFmEUZQuds=;
        b=BU+cTbJF7XCT7xSmobVsMA4rQQX2G9dODHZeUZuFLrVsetVNGCPl1UNbFPmjc8Fs34
         amUbZsd7AGF5ByVwTkFgbOmCYA2NFYgGovLf6M/KqvGtx2r09M1ku15tQyzbnZiPs/cT
         5QXpn7muDDaz2Vblzgbf7gduCkIXQMWfrS2+PI5aJv4h9IzDno2spAVTgc4nvJiKcvZn
         RMrn7rmmzB+3eD4tRsE4zcZFK7ztHwiOTdouNgN3NElzJG1tyIYqiBv1tE7BecmooGDP
         IG1tasgqaU/o6oOK2Ada1Zv82oVwHIMsbNEpAkWBatz8ynda1A3P9j0yAXJvMOxw5r4j
         /tvA==
X-Forwarded-Encrypted: i=1; AJvYcCVzTL8fkRhwXPTOOMJU0j2ssGwCbhS0sGIIPrOQhh+qDrOLJp3FvmIv5nKfV+fUg7lsr5tqtAhII02gkcYM@vger.kernel.org, AJvYcCWHdlJqWCsqO5/y40InWjkVJsoXHD3PrAzRG0fhImOpytPZ20mdvnnR3t8OuA3cJG6qM1+P26S0VS0g@vger.kernel.org, AJvYcCWSsfovvbdiAc0M/QRREkhJGtR2V3xJhbAHWRLG9zR3GqTv3Ajo/OB5p46UteYE5NfoGWbr0qnoYWOA@vger.kernel.org
X-Gm-Message-State: AOJu0YzeBeFeDmE0d7/IVtw/jnjqplhPEwfiD96bqLhfMDwjeK3E6nmq
	4Kc/BDZuvXpvn5hVw+JSnFfiwMzLoCTNf0QZMGdEBSJ9mVvlF4dTuUom
X-Gm-Gg: ASbGncuw0/zCfX2/V5Ts/ETQH4YL3rz382a1nlaujH5wMe+AnmBuYr6KIM77TybVS38
	vX2mmADKNc5XaXWFqBe/ecjo4QH2721l/VVHEdHALXqj3oNmC0jKG43gG1tFWxF0ISQjWPAevWA
	nK5jBSvL9dfs5ZPwXDnL1wUO/MO1NATpVQTaI+6kqn4TSZwocAgMJbGjRkLuvdskjDV/Q4D72+u
	46LdCBD5tGdJilVy7fCfUnNpDqXSWE28RXpLQnWHTR9ml8YqVvGYqUJcBR4SxUlzKrYLWKrOHFE
	EBiKzMqGlJyOD4quI4iPCcYagFdQ8VwV8q7PlTPssZ7aHNeFZkx12UuHIfahhPMOCCID6ic3eC1
	x/4njbY58vZqJ674cpqIsUb0=
X-Google-Smtp-Source: AGHT+IE+D40YZKOj0M6nRWuqWZuGsVn3rPHjUaIwL3IGMIhNtG8XnOqVIcyPMEvcMHIpB8Nj/U2uvQ==
X-Received: by 2002:a05:651c:b10:b0:300:26bc:4311 with SMTP id 38308e7fff4ca-3295b9e1d79mr44721701fa.18.1748441364204;
        Wed, 28 May 2025 07:09:24 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a79e9a6cdsm2654091fa.17.2025.05.28.07.09.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 07:09:23 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	jank@cadence.com
Cc: edgar.iglesias@amd.com,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] clk: fixed-mmio: Add optional poll for clk readiness
Date: Wed, 28 May 2025 16:09:17 +0200
Message-ID: <20250528140917.876453-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250528140917.876453-1-edgar.iglesias@gmail.com>
References: <20250528140917.876453-1-edgar.iglesias@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Add optional poll for clk readiness prior to reading the fixed rate.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 drivers/clk/clk-fixed-mmio.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/clk/clk-fixed-mmio.c b/drivers/clk/clk-fixed-mmio.c
index 3bfcf4cd98a2..1b764c446ce5 100644
--- a/drivers/clk/clk-fixed-mmio.c
+++ b/drivers/clk/clk-fixed-mmio.c
@@ -11,10 +11,36 @@
 
 #include <linux/clk-provider.h>
 #include <linux/io.h>
+#include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/of_address.h>
 #include <linux/platform_device.h>
 
+static int fixed_mmio_clk_wait_ready(struct device_node *node,
+				     void __iomem *base)
+{
+	u32 ready_mask;
+	u32 ready_val;
+	u32 timeout;
+	u32 v;
+
+	if (of_property_read_u32(node, "ready-timeout-us", &timeout))
+		timeout = 0;
+
+	if (of_property_read_u32(node, "ready-mask", &ready_mask))
+		ready_mask = ~0;
+
+	if (of_property_read_u32(node, "ready-val", &ready_val)) {
+		pr_err("%pOFn: missing ready-val property\n", node);
+		return -EINVAL;
+	}
+
+	pr_info("%pOFn: wait for clock\n", node);
+	return readl_relaxed_poll_timeout_atomic(base, v,
+						 (v & ready_mask) == ready_val,
+						 1, timeout);
+}
+
 static struct clk_hw *fixed_mmio_clk_setup(struct device_node *node)
 {
 	struct clk_hw *clk;
@@ -23,6 +49,15 @@ static struct clk_hw *fixed_mmio_clk_setup(struct device_node *node)
 	u32 freq;
 	int ret;
 
+	base = of_iomap(node, 1);
+	if (base) {
+		/* Wait for clk to get ready. */
+		ret = fixed_mmio_clk_wait_ready(node, base);
+		iounmap(base);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
 	base = of_iomap(node, 0);
 	if (!base) {
 		pr_err("%pOFn: failed to map address\n", node);
-- 
2.43.0

