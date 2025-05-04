Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C97151990
	for <linux-kernel@vger.kernel.org>; Sun,  4 May 2025 17:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746379893; cv=none; b=C73kv9Rh+SXWJzRH2denrKPmSauzzkRm+O/n8r9AH+OVVaxItR3a7xbkIWCmzbQqj7RDbzaJzoCSYCzgWGvw7UG8GxunZvGuBaYmoe9iThOYNa6CIpsblFTP4LaGMYS1cCKhLXD2GElXofg2TSLGLULn0tsLxEcn+SCK32NFe2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746379893; c=relaxed/simple;
	bh=zjop6nIWB4uVL6yKJrKgjDPqPPcu0nJJdJhElT/je1A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RggVpER9KUf8OoQuhGd/5LQgA9wJs7fA7emWnvy/VBv2zGiYV6MLQKNjBeijdZl/sg7bR08yj7g9RHbJesphPLBHDY7Th9A0egxl/GpLku8FIp2bxK54eRzk+Jok03am9X4xG+L63ttcLDuqJdSIyu7N8orYQ43JqO3VRfQWZEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=COTE8MVw; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="COTE8MVw"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so4427075e9.2
        for <linux-kernel@vger.kernel.org>; Sun, 04 May 2025 10:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746379890; x=1746984690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QSqS9H6qxHyvW/F/GXgRpqY+URlEU2x+Hmop2GCt6ds=;
        b=COTE8MVwpNOU9Q17Z4d9Wzun8lBSY4TL/0RT6+JnYxfoNn9nSX8mfT85qN+DEZ4crV
         7tUsa0+LBtIIsSYvxAp/oK1L8SYbwNaWLP7VfCwwglGEdvYj19RYeMxykAn/MROQKRFB
         u0akLV2N6PgONYqRSGag5Vt411bNkp8Leg70RVZbJiZ4KAcJXsnc89wmhofX5M3O0NNW
         sZozk9MDHs70LDDFjDJPhd1MjcEfCsE8VH80jlcZEO7M0RN9w9z2Yfyv5gbCSUtA3JXE
         zLJXo5jCADWjM/hYa2tOXl9GQ5owsusOk5/CvhRTGr6oN6TIQM+0SpH1Su8bw/fgJtgx
         bgVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746379890; x=1746984690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QSqS9H6qxHyvW/F/GXgRpqY+URlEU2x+Hmop2GCt6ds=;
        b=Pj0vk3+r/XeTQhvV7P6hKaQuCX3Mb48SE51Z0wfo+KbiuGsWRZkZl66/9l94a2HTFf
         qYYcXvgaiGfu0CgzSGVwG+xcRrWpYC/VLtAyIE8wLK96uT1xD43jP3yoHqm+kOPDxMwq
         WXafz4APjHOhvv8GRAQ0TW+TZO+r0R1TcflHWJ1r0N7yN1RdSUGanRQgifPGpXAUrw6N
         a9IaObQnIHDIxN0m0hGZaEyCJiRdAmAIkMLfNeUiOs5zQNt1E8QUUDNnyaVdS84wx4ur
         zNdgHe9zAo2y1oxCeB/8IG7q4Cq/bIPK0V69c24LdbHG78OBHTbDpJWCxxGbXitse6ku
         KPJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUmmhcZ95HbMxFcmlypd5JrqC3bEDmFGbeqGJ0bqGOaMCc2NChxswf9lF/PpJ+smfGeylS3z3AB9Wc/488=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWn+ucF7HKe9Ilieqyy0L7V8acUEs7Q1ah4qHbsxqDHTCIN+fb
	9lz3B2EbPAYtrBJiTjHDb+P1KaBHxUhJV61EoJUHlfhpfKCXrv56Gkd7y6+4rsQ=
X-Gm-Gg: ASbGnctoHdwNypRdY9jA5zXvJqMoHuWbypIRb8+B0yc7DewQkvvk6/CGkiR8E2VTwWu
	UPP2NXyaUi+Fqz+lSKJ/VFRYG1wBwi36LVsPmE+2q0Rg8Qe+2hbRGlTMHJcyNcBCzYxc2sLGP+7
	o2M3z5a9//3aD6AbG0MsCpa+ySrgX/q5tw3TLLbGVkqZsROtf2LNpbBwQBtSanGWaj+4SBW1XAW
	LfRJ3xWwKgTQP9ld1ZymR+dEE1xROkNRBM3o1oBV7mNmE9ojwILVoYnIJBIolV6LQWgyyKp7Gfq
	DnADF3aW9cl7+sC33EIyuRFeljGo/UTdND6Xq3qeb45gi3skuw==
X-Google-Smtp-Source: AGHT+IHOn1C33h4VlZhSA2hrwB3EdDRROasCqArnPLUTsrl91Bd7lHnaXGin+vNNH31/XX5XoxYg+Q==
X-Received: by 2002:a05:6000:186d:b0:3a0:831c:ce4e with SMTP id ffacd0b85a97d-3a099af240emr2533824f8f.12.1746379890061;
        Sun, 04 May 2025 10:31:30 -0700 (PDT)
Received: from kuoka.. ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b2b28718sm153870855e9.36.2025.05.04.10.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 May 2025 10:31:29 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] ARM: vt8500: Include vt8500 soc driver in maintainers entry
Date: Sun,  4 May 2025 19:31:26 +0200
Message-ID: <20250504173125.104419-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1098; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=zjop6nIWB4uVL6yKJrKgjDPqPPcu0nJJdJhElT/je1A=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoF6RtXfvbBMMBqxm4uZhWpKOyCm+cGjoZG3ZRh
 XlO4JNIOKSJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBekbQAKCRDBN2bmhouD
 1ydsD/4tdkzXab+tr2GAns5UEV0ccAjPwWS0Kr/dnkfsbciAjc8gqm0XVlRKeOiBff6gSuyhedr
 p0eedNgTGNu5uNzQa5Ti0sReD38FodcdelMAWQT7+35JEQwE7T+fIw7IN7Gct2oSnqcYnOPjLtq
 Asqwz/qRgKYSDJjjHkJPjKtflrYUIXizL5kreTeeBW48CG6Lbx5z2S3FdaQHReuQg93InB8g1Dp
 KgB7pFaqh/q8MByCEjNvz/7TZYSwl6ZGRM3DdGRQsebHJbD3JX6aP0Z3ZftBfP/N1KkEsOT/A5m
 yjaIXuAQG1AtYUMV5hv6mDwpSLRE5DpdLtAAEHXZirwsgDD1DBSfHUe2ObryMCSWo+tW7b8YKW0
 qRxw1E5NDCX7mFY9Af6xRDBHvjSqTSQfIZKuNcGnPCfXGxFwBW9Mz54Pfimi3skFJfuXg2ZSOvZ
 ePVUekg+PAfw7bxKfELbDX11+2px4g2uCgxxG43GHmtfnRonhLmXHJk8CqotRA2m6tnKp2vJ+Cu
 EMb84NvfcgTa3UV5aztetLlp91boxEtFPH79HV9Z605YxEWWw9b9ZrHcLIF67xlZw0OH5ESD1ko
 Evos1oCl1oc+YuyH36NTHSNZiNTi53Tn7ofIZX6Cx3zfMg0+IuDOJDxOHNMSaYBr1UnDtslnAie BKsiOuzpdW4HZdA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

Include the SoC hwinfo/soc information driver in VT8500 maintainers
entry.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 6768aa56a311..6f6278f44c88 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3454,6 +3454,7 @@ M:	Alexey Charkov <alchark@gmail.com>
 M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
+F:	Documentation/devicetree/bindings/hwinfo/via,vt8500-scc-id.yaml
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
 F:	Documentation/devicetree/bindings/interrupt-controller/via,vt8500-intc.yaml
 F:	Documentation/devicetree/bindings/pwm/via,vt8500-pwm.yaml
@@ -3464,6 +3465,7 @@ F:	drivers/i2c/busses/i2c-viai2c-wmt.c
 F:	drivers/mmc/host/wmt-sdmmc.c
 F:	drivers/pwm/pwm-vt8500.c
 F:	drivers/rtc/rtc-vt8500.c
+F:	drivers/soc/vt8500/
 F:	drivers/tty/serial/vt8500_serial.c
 F:	drivers/video/fbdev/vt8500lcdfb.*
 F:	drivers/video/fbdev/wm8505fb*
-- 
2.45.2

