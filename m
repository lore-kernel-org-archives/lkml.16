Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB48275841
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370485; cv=none; b=ofanEko7rwZykT4E9tlQvwEMsRdKjKaFvB1KzhZfZT1JVylG+n8wCP/dBTuH1zFxf7yLQdZOtT5k/cuKd5iQMM/Q/iB6hFXeTMIzo/t85kR/QF8g1J0qp0p/iuRuYctVljWhGbHPUkta+o8IKRvTubiei+5bFrZRzuXwEtfbR9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370485; c=relaxed/simple;
	bh=7XFOVVB/6P0E/TmGAipE5EVbPBj1K41pMO/cwOHZe6E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H3I8qyJ244I7u8uMwv8//avqZJmFSFzpIgdsvuMaCz3Ev+FwRpGHmwTYIkrrQB5lkZMxMw0iyxtnuSLS/q8oRBMwbP5NSvz1TfzmcYIf27DYqKqZxgZzzCFuTYmnGTsqJAqpKIIPyrsxyoiLl1r9FepQT6SkoZmOipg7qUB2y8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SV7sjp00; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SV7sjp00"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553b60de463so3701184e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370482; x=1751975282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhr1wJzX5x14/nTupeiMBqLBJv2X3ymsgvaInizlCPo=;
        b=SV7sjp00mKEpaXCBezxr5x0W5/gBh62DWT0wLqIjgjH4lBOBFHbvrj14lxDweDAdjM
         9ZAgHm2TCh5M7oFuLaEnLLQkj/qH1lBHtAnEXLC2r6IimLBFY23uIY/fM1oipUzVoSO3
         +/zYJp2zP8d1LRlBsSfeGIyG1YlVtycrOFXAeZZGHZx2Z/U7U++l608ZEBgaLi9Bw5n+
         fj7W99YkbqKv7Zt6nStK6JIDJHGOaUER1KhhcvRUNWxZBRLB7Fo93N4zrna8yHUuKcDt
         q8LL7hxoLLncQonCcwOmK6Vj4+uerZfIk2NdfkekWcVJsdf6N9Qd6M43yqp1D06ykz+n
         6Sdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370482; x=1751975282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nhr1wJzX5x14/nTupeiMBqLBJv2X3ymsgvaInizlCPo=;
        b=NTdk9dMVrZcUOqaN6L0UDuw3wekTgn1VvhJLZ7YibRyABrndx+28iBFufAgAdEheKq
         4bTb/xC9QVG8m6Eluuil47XqmiyscFKV9r1rDghqFuJ5CWqkrXLVOoaPN7X/vPWW5ymO
         H3Sxf3Jalz+0q527W2qpfkmYamzp//BffscVYvK3YKL7hGkRaWP/ZaEA8W4rhj5lqoxT
         FS1TBIN2DDpe3R+FO0iEWCgl1KZZ1VGU6Pt2T7fQRycG+IKhTrdNjSEa+Om/32M2mLFv
         DkCKvdmHJC4xS5022VYAaic6gxf4cnHE4caUefCw9VtP0syBHDgXKzEsv0p9pzrgMU4J
         aUmQ==
X-Forwarded-Encrypted: i=1; AJvYcCW1Y+WiYPAnbY++Vx0rOR+3NS7EzynsC/dPaY/pB8tIG2NQ5lnG1IV1OPQqLDs2vo+zDpT1d0K3QwXyUGQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXiM2eXsIZtAOoEMD5/BMSSxrrCCihtnxaz0jcGOq5JlZ7o/rQ
	9f8itFyyBQo1v4WsuAD66QSeGaQ+elR0ZE2tyDau3bErW7vogiRbvDQ33qdBCHFjLCI=
X-Gm-Gg: ASbGnctRQTN1Ocv7yS0pzFswgeNhWodXWfxDy2TUFigedVdQO3vJRI+ORsE49hiNy9I
	nvdD/FgLsN3TC78sggG0YVJkhIPebX1gxMFhxjPC2Dxbu0ruriGEiGAAcBd8CCUjz4zuSzOD2Jk
	bkgAg2ZhB8QIMJ9kn3DaBpP+S6DQzQ0Sa6ALDs6sUw8CtXQaBllWPmJm2huv7j2s088mfntXu13
	p2WtXdfseLNWB+ZlTobkT0m5GF/Wa1e6X1R4J9fR3PHG+HptlKpTTpg3GV/+PtcnJvHZaYROWJ0
	5z+L3cBBoJcj6Zzc2U/T5HCXv1e/dB9sYtiUVph0W04leKhZ/YB3vUTXECjwKFJvYejB3l4BTLd
	JlUVdZIQ3OOFVT70Vb+mBww5it+s8xAu4DOjx
X-Google-Smtp-Source: AGHT+IF/OcNrgYw3hgtvoO/MekAs2AHo39DQa2rN3+FnsXniz31yfEH69hiNRp80adgJjRiNtdFnTw==
X-Received: by 2002:a05:6512:224b:b0:553:2868:6355 with SMTP id 2adb3069b0e04-5550b8669b0mr5326369e87.18.1751370481798;
        Tue, 01 Jul 2025 04:48:01 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:01 -0700 (PDT)
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
Subject: [PATCH v3 13/24] pmdomain: qcom: rpmhpd: Use of_genpd_sync_state()
Date: Tue,  1 Jul 2025 13:47:15 +0200
Message-ID: <20250701114733.636510-14-ulf.hansson@linaro.org>
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

To make sure genpd tries to power off unused PM domains, let's call
of_genpd_sync_state() from our own ->sync_state() callback.

Cc: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/qcom/rpmhpd.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/pmdomain/qcom/rpmhpd.c b/drivers/pmdomain/qcom/rpmhpd.c
index 078323b85b56..d9ad6a94b3ab 100644
--- a/drivers/pmdomain/qcom/rpmhpd.c
+++ b/drivers/pmdomain/qcom/rpmhpd.c
@@ -1027,6 +1027,8 @@ static void rpmhpd_sync_state(struct device *dev)
 	unsigned int i;
 	int ret;
 
+	of_genpd_sync_state(dev->of_node);
+
 	mutex_lock(&rpmhpd_lock);
 	for (i = 0; i < desc->num_pds; i++) {
 		pd = rpmhpds[i];
-- 
2.43.0

