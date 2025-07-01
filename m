Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0CE242D8B
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:47:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370469; cv=none; b=rJ3rqKKVQ0MF6Y6H6XTS0YoACK2c85WppxcEEzTUnUhfxNsKvLnMlxnULfOrD0Vm+da8n08TjEfFGUDXhhlCVJxZeXMDK+PlpHpSDhMlFRC//Fdf1ptYSICg5NtheeVfRqcFHa/f3ZOHSgnfigpak7EAVWbw/d0ueFSpkgKcFuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370469; c=relaxed/simple;
	bh=pVRpR1S2HDeRvzXbIKzoXt5qvVDcQEyiyD3SHvPQFTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OUmNET67Cw83ZiZ9+4ybcekYXbWNKxaszQtpMlREqnL5xgzG1EBgbZFlWedagOQ4d1NCX6xYV2KTOhC0E9JezSmCMktX/vHDw8yT/cA7yDv7xJ9AE4fTVYFYjkhfH+jarhL08ewgQ49/aKILuio3HZM0BVeGW89QqpvdO2OvXJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=K7F/pNaq; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K7F/pNaq"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553d771435fso4712163e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370466; x=1751975266; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2djU9nLQ8VglyUcEstpnVg4eaMTkukRCnzKizHYIlO4=;
        b=K7F/pNaqRYDyFQ/EFhymu/ZSYXH/sEhGgIvSutg1yhmCnVcLQLYpRUKodic1AKfch1
         FeGGvyfoZ9G8/el3XEXIODLUl0uzlFyHrU7CjdeNpgrDn+dGhoS5fMn8HZSbgg9GOWor
         +GXECQz4piZ8ZFy9Br8mLwMkvfhoaqFIKTr2OpszLeWNPuodjnoE1X6oNWBFW3e50Ukl
         aH1oPp/EW73dIsChLheHsU5Xb8CSbE+ebPZC2Owb+3luzPimp2Gp9ICSCFIvPZuF3wFs
         07ay+pYT9X4yGgOPIPerRxA/zlc1iPbFtI4g4DFwo93Ing4x6B55CtLXnnXDjQ/cRdTR
         R3OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370466; x=1751975266;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2djU9nLQ8VglyUcEstpnVg4eaMTkukRCnzKizHYIlO4=;
        b=BP/6uvIU68AwgjwDf9yuoMEQ/RoOZeFmSktan2h1BlzZIASbroGVMKlYiuT+tfoOIL
         u1qnEvT1wRACwzQO1vdFl8rPQ9cCdV0ivryrFk2CDZlFR2HnNqNflKxi55aVamo4Hsd/
         yOdxdQYCkg9nlu7UJ6v257zwrEk5u13v9RqMZpDp8eCIZIG54b4j4I/rst5Hkk/ZcaY6
         UvO0sMcmIv14zB77k4QACKACmV5+VAwdxnkJVXNZO03rZzmAHjhgu11cNdfFS5K8wvxY
         mC5JBr1NlKZ6/TSvF6TCUNe7R/OQ14mGIWi9aoZZkzk5+ug6q9L1G2al+NnoNcMBlKRX
         85ew==
X-Forwarded-Encrypted: i=1; AJvYcCWDghh7eXYFAudJzgFS+VIOyWMlr56BSzMyetpwvjONm9/43OzMHTbYiljR0GqTYfliZQokNJHuEUHaA9Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzSLzubqH+c0WyBUlPueMXSFXf9slt/2AIkxB91ufDXkrnPTS6x
	IjYigZFod9hJqva/kccL/z1bPlsaou0WyNVhjrLpepaUfoHtu2eaP8VSgbHVKNM0D00=
X-Gm-Gg: ASbGncv79OS78eAIs38X35705CWfp4iETIXwIBiEiDzHVVYrxLBgpWWUqVc11FepG+o
	kGi6Rta3m7Iwzz3CjpbVdOaVxl9/9qsj1LTdjUPJk65pMQ+XXlEogZ7/1h8DvWn8XfcUCkbvjKs
	gwLzKmEIFdYvO9SsvmLhN5lc7z4688LLoDizB9GAiytf/mz6lv+9xeicmN4RBf1KrI/w8RlYbyd
	3/R6U6vfyVIXQt9pYvNwQ3lzOnEn2kDqx4PxgC/qGTnNZ+i9nVoOFoUlufCRBx8XhEDJ5sX/uhk
	mY6bLhq/nEruioOycdk8s93mR77wDM0CsyAQCMeQIfcUfabSnwBMbdQ6vCj5BLDxPWj2D160VTg
	jZbhS8K13yZH1ftUVWndHLRdHO3DkQuJ6aU7H
X-Google-Smtp-Source: AGHT+IFk1+sM2wFrURHBujkY60jtzQNdzYc3WqI7dzo+D/13c4kVHtOgYXZqpdwPvp8P1wttj8OecA==
X-Received: by 2002:a05:6512:b86:b0:553:2154:7bd0 with SMTP id 2adb3069b0e04-5550b869fedmr5078899e87.5.1751370465534;
        Tue, 01 Jul 2025 04:47:45 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:47:45 -0700 (PDT)
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
Subject: [PATCH v3 01/24] pmdomain: renesas: rcar-sysc: Add genpd OF provider at postcore_initcall
Date: Tue,  1 Jul 2025 13:47:03 +0200
Message-ID: <20250701114733.636510-2-ulf.hansson@linaro.org>
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

Subsequent changes to genpd adds a limitation that registering a genpd OF
providers must be done after its bus registration, which is at
core_initcall.

To adopt to this, let's split the initialization into two steps. The first
part keep registering the PM domains with genpd at early_initcall, as this
is needed to bringup the CPUs for R-Car H1, by calling
rcar_sysc_power_up_cpu(). The second and new part, moves the registration
of the genpd OF provider to a postcore_initcall().

Suggested-by: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/renesas/rcar-sysc.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index 047495f54e8a..4b310c1d35fa 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -342,6 +342,7 @@ struct rcar_pm_domains {
 };
 
 static struct genpd_onecell_data *rcar_sysc_onecell_data;
+static struct device_node *rcar_sysc_onecell_np;
 
 static int __init rcar_sysc_pd_init(void)
 {
@@ -428,7 +429,8 @@ static int __init rcar_sysc_pd_init(void)
 		}
 	}
 
-	error = of_genpd_add_provider_onecell(np, &domains->onecell_data);
+	rcar_sysc_onecell_np = np;
+	return 0;
 
 out_put:
 	of_node_put(np);
@@ -436,6 +438,21 @@ static int __init rcar_sysc_pd_init(void)
 }
 early_initcall(rcar_sysc_pd_init);
 
+static int __init rcar_sysc_pd_init_provider(void)
+{
+	int error;
+
+	if (!rcar_sysc_onecell_np)
+		return -ENODEV;
+
+	error = of_genpd_add_provider_onecell(rcar_sysc_onecell_np,
+					      rcar_sysc_onecell_data);
+
+	of_node_put(rcar_sysc_onecell_np);
+	return error;
+}
+postcore_initcall(rcar_sysc_pd_init_provider);
+
 #ifdef CONFIG_ARCH_R8A7779
 static int rcar_sysc_power_cpu(unsigned int idx, bool on)
 {
-- 
2.43.0

