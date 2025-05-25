Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EF0B25DAFB;
	Sun, 25 May 2025 19:08:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748200096; cv=none; b=u7LQeOimWxgduULKu3SfuRITvWDWCzeg4FJKl4+kbF1YlfTmMMzOrwjInP6YP94MDG1HCYs4VAk+f8hgzm+vQQaqFPV3qeG7LRC5BSign/yZKrYuFq1bp8O1+p0Z27Cnx0yjRuVey2n6B+YU1XIobBcZVSjHacZf5zIghPmWssQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748200096; c=relaxed/simple;
	bh=OuKf9ibWLynECkjkcH+aIZ/gQOQvTsCAMruwIJbYKk4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qk8HcUdZ5czSxoNYMmcsA5yJx0dPsh+UXHQXE9U74RnRJJXvGcptoWyvdADaqncPeHmS2kcXrOp3goo+lQE//8P6PmhmULcom3e2RRLVmL2V0V+YX9a7uVsBE5iB1t5qrYaeHzh4Hr5IN15KrQZ4oerRDfGMR9pBwVzzr6lMD9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NFYldRYg; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NFYldRYg"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-54b0d638e86so2775881e87.1;
        Sun, 25 May 2025 12:08:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748200093; x=1748804893; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hbyLyOQGCBxv96q8YzM/a2txuX18SnFJ3VEHo3ltwtk=;
        b=NFYldRYgvKffK/uJDY/Xunf/4ZKoDaLcNFHfVRR9uGTkN5Lek8y8SvSFCfvGd+IYrH
         oWAbVJXNYJrGttGXHP+CIAnqjeB9+CjKL9Tv7KoIccVQEpehvlLA0Nwc7kn2z45VTyZ1
         9rVFjD0pcFQSxBGruQYzidDvqVZNYPNMdDMlSmC1u1cyHWHYALUok3UPVBYljLoqoCj+
         bgJSY77Ma1cQkDcGgnQu4vhIHTW5RzUBeazte2w926nG2qJQZWuBhr6/jsJiSor5drEq
         9Zej/BGPTPOm19DG6U2NBeEXgHMdlsb01YExft30k3XtS1dMQQ1jA1nOmMH/bFBfVqJ1
         VL9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748200093; x=1748804893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hbyLyOQGCBxv96q8YzM/a2txuX18SnFJ3VEHo3ltwtk=;
        b=WMXZAcWzfyGYyLyqb95C0nqko+y+lojNlJP4iVZ61ZR1h5LkCnPMHLulS7DTyfHqwh
         CczYEcqmZdPRyYMJ+ilxWxbI0LmfVqFssi1FyQZfGrh03Aidz/qfP/llvsevjAYoABWa
         X5c/rxCdzOn9otTJZ5GidZIvg6cgKnZKef7U4zVAX5fIme7TQYyKmVBy2Ww0meYIQVXV
         UqvgPubHCwRpBkTgZERgGs4IxbWmVf1ciuz20gVsBEzkV5q5CKLfuuFZz6nxH6FEg4j1
         dOssgAmKzcIY6fzcPMVxngkBx+ybHz7LpLfP5vMSiaey9y6TATswnQ2RL4Se3Ngn1m7a
         w6bA==
X-Forwarded-Encrypted: i=1; AJvYcCVMumY6u1U2bQP0uc4LpoI3pDeapw/DAU82b51wZWPDOz6NNgRrrSMrR5j0CTUSUQvYH14ft5sqi7xX@vger.kernel.org, AJvYcCVSIQOn2dTJoNuFBHbZmftgRUBFLN/YB2AINM27b2lLshZWd2BeOakWtl8vTifjFOJl2kgNPD8h9uO+@vger.kernel.org, AJvYcCXhLMcaK5yxzGqmZ95zy8yjcESPsnhjJKz+6smI/r5QNbVYomZzzdJrJtmcNZh/wMUMMyCdADJVQdTFhqcA@vger.kernel.org
X-Gm-Message-State: AOJu0YzfatAaBgvhTY3/VhEeqT/cbYbfhCGcqgpMx5CM2E/2smVY1IdI
	lmwYEz8aEhJcmCY8F3E052kzsZLb5DSWC8od8bYIAqcqPTUrBvip30jFsg9aLwLYDZc=
X-Gm-Gg: ASbGnct4G8mlEnwqJYqdy+/VJdk+exjzKmxJ1uFyygfD6mP4OP2uBCYsGUjaIZxmGnW
	jwwQlhs31SlkOLuIXZRUsfllp3T9gbjpFLF5y3cY+urCZ4O/mYbTgezv3DlK3aJys2yE5+pt1gR
	QgR5KktSASp8MyJULcvubAsXhr9I1Ws/7YGyK8Z8Ue9VHVX7VB4tFKmwY9HgWMhQh8V3beqfHBg
	GloxbAAe19/bqmLUK6II82BCVW5v2w2Qz5XX+q7AHlBG5Z8xPViqOAVxEbVk1WnuDCbrnqLKyGq
	y+2YbAWb9xVByprvUDsUSpwk1I+mlMTPG4njCSlGIE78koJN7zq44wU273Wc4igewio4JABvOJR
	KJbYeRBBjPTnsmIgPPF+vFUzFgzAGR6OIfg==
X-Google-Smtp-Source: AGHT+IHsTkjLFN9eSOj8UjXQ3oYdYwoQnuj8mqXDg5ghhfgQb/LqTqvDn5bq2N4XOC0VBo+OE3XBvQ==
X-Received: by 2002:a05:6512:1245:b0:545:6fa:bf60 with SMTP id 2adb3069b0e04-5521c7ade9amr1647872e87.19.1748200092997;
        Sun, 25 May 2025 12:08:12 -0700 (PDT)
Received: from gmail.com (213-67-3-247-no600.tbcn.telia.com. [213.67.3.247])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702cf9fsm4760552e87.190.2025.05.25.12.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 12:08:11 -0700 (PDT)
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
Subject: [PATCH v1 2/2] clk: fixed-mmio: Add optional poll for clk readiness
Date: Sun, 25 May 2025 21:08:04 +0200
Message-ID: <20250525190806.1204531-3-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
References: <20250525190806.1204531-1-edgar.iglesias@gmail.com>
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
index 3bfcf4cd98a2..4b5ba1ad06ac 100644
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
+	if (of_property_read_u32(node, "ready-timeout", &timeout))
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

