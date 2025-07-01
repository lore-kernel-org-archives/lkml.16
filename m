Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D62273D70
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370473; cv=none; b=Mes8bZBPnEKqvqjd4Op1dLuzUzokJtL9OJmN6stJh+arfxaZbQlv4rovwl7aT7qnMsbSMVa9KCLj8SgUgQyj2JOB2rKx8gCX6lBjmItFDX51hnyaI6By4kc+tNH31svbI6/qdVsQ1ZCMdWMY+5UUtvBD93rcf11KdMLMQSP9JNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370473; c=relaxed/simple;
	bh=vaFOqCI5djpScYcqXyC+q/cAcrHuyrRIVEA7y07/NSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fZdMWG3tPBYLyIr/bdAUDyN9Mu9zydNM4wi6/bxY6cMr/rbXTAD+cTwdKL93E961Ei4tBXBi7KzGpNA93C/KzsySqF6wm+9//y4AdmoCsvZ42phiitHLUaTMdHoIyOrhkgutfY0aZdyFZI5QT0GfYLH6+y7WIPAm4HA6yMVNY64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a7oAM1XB; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a7oAM1XB"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553b6a349ccso3580486e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370470; x=1751975270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/ZOLfR72PXqOLw5WtFWDE/MmTe35xsn3qkEJhynzf0Q=;
        b=a7oAM1XBPf06BELVGcVNSDTsHQo3E3VCyA5lvWmm+nXMybgoQc+P/gQKU0Zrn+X+jX
         KxR6i8mMm5JtOnyN4i+4GVZrItVij64kH5Y7Zff1GPZ6mC+IMr2/VWR2NVEaRhB0dnxk
         ez4bHE4AyBQLkcYl4DvptRKyolVknpe8YqKlfI4l8dcBSqL7byXwBzUyoM3eAfcyVLX4
         1yEYCz0M17T8D+6NjV8yUUghdQdHq9OHBGh2FrT/7Gj2zYbvUcMaSxDlpP5tpjpflGHU
         uflyTRs2ro0GtDSvt81B9p02pfR279e6f2Xtw+9MNd5xrPlUATEaIWISHNRAa/GBebsb
         AXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370470; x=1751975270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/ZOLfR72PXqOLw5WtFWDE/MmTe35xsn3qkEJhynzf0Q=;
        b=LmZUaGJQzwmQvx1aSu1ukbdzifqANRxDP8IDc2Qn7EN9MihMK5/4XD/xpRW1bp1siC
         bdr6hdfdUC9iX5Z2vVbU5e/PQbKefwMPwUF0/1JoB84YyU06sK42FsJ/9yH5bmLs8aKP
         OFyS120sk4jv0thJB0iuwDdFHQMdbGU1O3ly99cjkk8q4TcM9scunLB+lIfJ06ZdP4K8
         HlqIT0yLcA2WbJ2fr8YP/x8nKaqxGvzFVWMNjNVxSe6KHWRFbSYUyTbfKFYXQf6J3ZW2
         GOGPb4aMoi16A0eZ9XDXXQvE4TXn8Tm5CrLkxGUtvnUEPBnQKX/2Lt4HI9bfJet/GFcB
         i7IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWknc5a3fCBxkSR9IYou98Mfi9wlhHE2990OlQT6opU1y/4UoXlrB6RB2v25bi0yeVYnFXV+5K0smXXdw8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzArH54VhVRtd0TVI7cvWUG9r1fem11wy3cvPxcuSlXyz9hnxvy
	1JmJ95AYXs7r+wVG8RYDBUAdGTJ4w9U2nTVA7BQL1ZyDUa3ZP3lxc0Pya7jFJPyAD2g=
X-Gm-Gg: ASbGncu+PZ7SetQYJs8qBa5zqVjGg3Z0OAQwtlxNa1CP+qbhzJ+15N69IagDEr+s6eu
	Cw4YVmIYszX/gLM2FPr4R/vLCEwq1OaMmybkCLf7TKh3SKVWzr5r2Y9l9Eth+MTzW4ibye9GrBm
	y+LMr10U0Rb15nnt5RjFlJbmpSC8ublQHqV32aDXYWytIh+/8ZEM5xwgHgAIaLLTkUuytioDKCl
	OvU37ADz2f146IJYkQOu3a5iKs1rC9M2IEjKQIUPADakSc15PzIsDh8pshG27fLvp2a3ffI+UkU
	NrxBQSScm86BUbYLDQDSJ5zlW9/fRj7unqYO0lv8wSNNVq46gUdv/8e9ulLAx9aXEWvomCqRpGk
	DNPYuv/TIXabJ/u1/1TSgmpIVB//f+KqRMxo/
X-Google-Smtp-Source: AGHT+IEFlqH5aVFiMAtrKQEMVhHjR3b0DQN5zCXSWC23vo3ub27qmEf/97Rk59xwHI3Cjb9MA+KM7g==
X-Received: by 2002:a05:6512:3a86:b0:553:a272:4d18 with SMTP id 2adb3069b0e04-5550b82b648mr4551995e87.20.1751370469527;
        Tue, 01 Jul 2025 04:47:49 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:48 -0700 (PDT)
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
	Hiago De Franco <hiago.franco@toradex.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/24] pmdomain: core: Prevent registering devices before the bus
Date: Tue,  1 Jul 2025 13:47:06 +0200
Message-ID: <20250701114733.636510-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701114733.636510-1-ulf.hansson@linaro.org>
References: <20250701114733.636510-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We must not register a consumer device to the genpd bus, before registering
the bus itself. Even if this doesn't seem to be an issue, let's add a
simple check to make sure we really avoid this from happening.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/core.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 9a66b728fbbf..93d71164fc56 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2491,6 +2491,8 @@ struct of_genpd_provider {
 static LIST_HEAD(of_genpd_providers);
 /* Mutex to protect the list above. */
 static DEFINE_MUTEX(of_genpd_mutex);
+/* Used to prevent registering devices before the bus. */
+static bool genpd_bus_registered;
 
 /**
  * genpd_xlate_simple() - Xlate function for direct node-domain mapping
@@ -3179,6 +3181,9 @@ struct device *genpd_dev_pm_attach_by_id(struct device *dev,
 	if (num_domains < 0 || index >= num_domains)
 		return NULL;
 
+	if (!genpd_bus_registered)
+		return ERR_PTR(-ENODEV);
+
 	/* Allocate and register device on the genpd bus. */
 	virt_dev = kzalloc(sizeof(*virt_dev), GFP_KERNEL);
 	if (!virt_dev)
@@ -3357,7 +3362,14 @@ EXPORT_SYMBOL_GPL(of_genpd_parse_idle_states);
 
 static int __init genpd_bus_init(void)
 {
-	return bus_register(&genpd_bus_type);
+	int ret;
+
+	ret = bus_register(&genpd_bus_type);
+	if (ret)
+		return ret;
+
+	genpd_bus_registered = true;
+	return 0;
 }
 core_initcall(genpd_bus_init);
 
-- 
2.43.0

