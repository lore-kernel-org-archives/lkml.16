Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B8AC29616A
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007664; cv=none; b=ZtDbgp6NqtQ3Y60AP3F0P+2WohXHUPqWzlKfSAZdGmUJM0RuXxOanPVNqIkUl3VKQB8kCpvMlIlSSfizlSfSv/OTQubf4an96HqdMGt8y88zNWMpia0pqmbwJhth5xngK+sOx2Tg4KPPy4X0rmhGZ2InBC74uqaI4/nnxgxwgkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007664; c=relaxed/simple;
	bh=ZG0wD/LR/YXT1TNvRGuMwWiwi7r8mDmA4GGyX/lU8x4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HEOyqe/B4bWHmkl5WIV6DrKq2wv1NzpX/jqzlw6aDgABgK3Cs1YyptqqzNRpGK/Szu+9oOjx+qWz2NA8rGJ0vuxFLysGOOFWrIKjjGpO9NOwcrKpKsmXZeVorm+aH4ktJJerFA65XDvQC9x/sjIM2YMY7+LKNvUykqUbcU6yAog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F8dFzDMW; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F8dFzDMW"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-551fe540b74so4398342e87.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007661; x=1748612461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=x/aJJumEOcgP/SHpHSm52hNIxPzlDOJRQ3oP2wL6guI=;
        b=F8dFzDMWueM3RzDG+pwIcr8kODFajW1nlz6emSjIaAx0uTESKlM1cXof1XJJkWxP5v
         dQoZEeCdI9+LalcRvw0JvWfP4cozeYlzZtGfi/tA7Yh4KUn4aYxMjA6FcYCsJ3qywuls
         R36piBDoWo/6shjTFbys3VqPIG/0eI9+x6ubO9ljqP7j2l01rI2WlD6PpbbJ+F6S78S4
         xp1MEZk2eVwP/0kVAdX68jdFbUXQeri/Lgr6fIJQs9CZQU6KMQCxl940BUHcr75JcDyU
         e8n4juD7RmJbtWq3dXsPtPztEGhoRRbqcptq1IQjc2yCrQpuHg9PbJk51ewcU+venwHx
         2Biw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007661; x=1748612461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=x/aJJumEOcgP/SHpHSm52hNIxPzlDOJRQ3oP2wL6guI=;
        b=CBc4688397qD8A834GuZI0KlcWlgZTQwnvWi87fbIwiPio17h0DOOgNc87plYB9O/H
         xYMhg9b7HkmcXFnZkcmQiVP2o1l/1HyoedsCIYiGSBm7auQ/8ykMWzsJkwHeaM0Y99w5
         gHAGzqCvKFkmvEi21dZODo4my2u8SAHcuZHOmsqHmyswzujjy1acs20SkwFZJyVHxSTY
         cPeyiubzSDsg1lW+e3P0q5GIH5kM8eiEqnUXNECZXiTVrUchtWS4kYZXnCU0v0gJB2kL
         kGaI9aG/A35RRK140bUFptNvBLKzhtt/Qu6sM/zCj+k4k7tFomlqPt0wZ3IXbBmcM9zO
         nUmA==
X-Forwarded-Encrypted: i=1; AJvYcCU5Y/xIX/oTsVGUzMLHlilLh1toSu1tttfhC+bVh4h8Qys58Yi7Qotpqv1ywStti6q3k3wK+vh5V9gNZIo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz76WJJiYxxMrv0yWHHrdUOzan3ZMBvy9AhLBjLViEHVYQWmIA8
	xQCJMWv26ibxvLnW+V1suA3glZHN8W7OrXSfvGSg9ZDz1d42ekZa0SRL/Kf2bo19DMo=
X-Gm-Gg: ASbGncvnz38cX6z3WwmHfqZYo/98COy3O5Vmwr6ZiVlK9lLJivcJKUjD05NGUR18hhy
	0UXa+oRZXHODLggvHSE5Sx7s79RqcbHZotYQ7NhZVCqXW2NJqTNaUH5iEVheahcM6UdJBnYjYDs
	rIID75WxybgL8Ei441j2svDdAoBmz1+4x8zyErjQ/FlJnOPzKqLHC3a/k5g5X8yFX0ItMul/oAd
	n+kKv/3JnypMvbiSruucztvH79w5P/lnafpi+6d5R4XZdzbNYfQpeNkytojRJuNbdLprt631L5B
	MIzH08XQeFdMiP5d5nvLNf9OArZWQXM8/QRKL58o10/WZrBsXtKfDc9swKthxvaKmkhJZVRo1JV
	EdiJCZNXz7pP88CSwauMGY/IxVfogVf3WMTUE
X-Google-Smtp-Source: AGHT+IFqaMutTsheTfKkW2cqf5rtDAzYDo1ADk4nh7EfRPJsLI0D9Etd71qYegkMcQyfr86dVQn3qQ==
X-Received: by 2002:a05:6512:2616:b0:54a:cbfd:5517 with SMTP id 2adb3069b0e04-550e99259b6mr6555792e87.53.1748007660645;
        Fri, 23 May 2025 06:41:00 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.40.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:40:59 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Saravana Kannan <saravanak@google.com>,
	Stephen Boyd <sboyd@kernel.org>,
	linux-pm@vger.kernel.org
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Michael Grzeschik <m.grzeschik@pengutronix.de>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@linaro.org>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Johan Hovold <johan@kernel.org>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Michal Simek <michal.simek@amd.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 13/21] firmware: xilinx: Use of_genpd_sync_state()
Date: Fri, 23 May 2025 15:40:10 +0200
Message-ID: <20250523134025.75130-14-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250523134025.75130-1-ulf.hansson@linaro.org>
References: <20250523134025.75130-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Michal Simek <michal.simek@amd.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index 87ddbb7d11c2..02da3e48bc8f 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -20,6 +20,7 @@
 #include <linux/of.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/pm_domain.h>
 #include <linux/slab.h>
 #include <linux/uaccess.h>
 #include <linux/hashtable.h>
@@ -2101,9 +2102,13 @@ static void zynqmp_firmware_remove(struct platform_device *pdev)
 
 static void zynqmp_firmware_sync_state(struct device *dev)
 {
-	if (!of_device_is_compatible(dev->of_node, "xlnx,zynqmp-firmware"))
+	struct device_node *np = dev->of_node;
+
+	if (!of_device_is_compatible(np, "xlnx,zynqmp-firmware"))
 		return;
 
+	of_genpd_sync_state(np);
+
 	if (zynqmp_pm_init_finalize())
 		dev_warn(dev, "failed to release power management to firmware\n");
 }
-- 
2.43.0

