Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE545275B0F
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370488; cv=none; b=PlwCL7nkVBJL8Oef2Hk8h37ubXKyAmXigycnDnI/6TXDqT0jWHehP9qlFNPctyHqu8oygAzgNIRX/g3Vc2dnHi+RuzdH3zko4NZMdzl6R84aH1pCDZnozYC/hf2og+uFCaoYJjVOebABnipI+rlc+NMeeXUPagQQml/ll673RDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370488; c=relaxed/simple;
	bh=7WjL5PJDN7tc6aoAfPZvK2QXFFS7GTcKuiGQOzvRQEI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AzVuJ1C8IwLsWf9SEeAUi/woEJC1xfut8is4M7oPeczMnO7b+19jUJX+YRR7w2zDxnAegzwIqtscEJf6rhCsIv7WN4FK9Dqoow5miagGeIPOySFQGJM0tvVUPbzLW4yXleibSTPRYA3pUzVBtQ00LD974t33SZmWOMljeo91k/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=nZL2ddbO; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="nZL2ddbO"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1770197e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370485; x=1751975285; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=27vCRapRpRoLV9KzfQODt7M6d2jewQo10FyC4pKnCE0=;
        b=nZL2ddbOBSMlariJaHCazIWBX5FD4mkvhvwxQZOYxbz/qKhBjKqhxCT5ExiWL9cJfl
         Gj4yRvD+MXqwmkD4ONrLv590qoGs8S63gSNaj5+/Luf4v+yBrlz5NFKRnPwSLGr8wWuG
         9uYBS36PboLr6PFQwLTPfjykWMFNrCWQaC2LHzivMpNgfsJ57l/bRUYtZTIVXZt0icIS
         kFwxKO7dCD4kEEYwiEfCDuRzSe87f27vmfZG1rj8CsIA7F9AKIYRAkkfoJjBdE44gHkT
         4vxSlXCBI6MAYE1XS28VTr0nf75rfRZuFMIlp3bIN3AMIWDQfaHK70igCdmMKgipno86
         yr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370485; x=1751975285;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=27vCRapRpRoLV9KzfQODt7M6d2jewQo10FyC4pKnCE0=;
        b=dXgc2fqoLRbzL+iSSj0AcSMN946DpkfjCeTr1aglxYllfNmC+C3V3tH/W8mHBqwim+
         aDGJbf6USgjZS33un8hqXFEzaTCQKWiYkcfWEBH8azP4CNOyHn/E+EGCOpgFeF5NIj5o
         brkzSt9bJ0YA0SRSursuIvv6WnTIWAuOXQ/RkmlgSgrIb6tSU14DRdzStdZT1ngWU+W6
         r4VFE43H4U3ylGciHdLV9kd31JJRvuO4dNn95ajSpXP+fHsJ746iAS/2TEi+TCCVbCpf
         SnBx9mJT3Nayv4p8E0ZTh8jpBaIL2OPEp6c1mad/2wfFZzC7taFOcjs4IaoK+hoxBcm6
         S/6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUn9/XtPowxqToxi5eL8sFK9EjlXrQzFDYIA9P9yOlA2DUe/sjkx3/APxD6isEjuPF3BoTRlJGpOer0EYk=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/zh69EuvjbqUBkc+jwoM4VALUPkgbyyClF55aIq7LmdMeV3K
	t0HBGJ3w9A3IubZTD9OTX8VmjBh+23nnrX9VhmYYP2eW08syJL0LJaO3Vw4In6bqr7o=
X-Gm-Gg: ASbGncvN3VqFVTCJuSNQ2V5OF/EM6X8Zib2ajM+SY+eMI1C4Q52nj4VOvkqyt/ZTld6
	AzaXjRqAFjjNASoH5RJxaIzpDXtTBY9bM3swvNU0FcHFkwngVOYVhtAZ4WyqSmzYQXPZEyGichB
	dR1PmB+YWGk3vm8NkiDtHw97xGQbmjZv8cbhixUJBWziLdqTCqRdBvALmdkHbvdNcNrihD0lz4M
	EwlLAfNzsJJE5X25Rz2sb3VWuycE6TftQJ8Hu0s2xDyNR1shXp8e5+IiVR69zlvC6OIoEYtqx1Z
	EbpD/8MFs6NvYXphu8do+dNVHy/qH1YOS6vL5CzNivPvcogLgzwmEWeqiS3DWUMAgMIIB6EhAfE
	yJIgRi3UXi8ImuIv5C7MTmpWy09JCS1muwNsHu6YBv1S8Vok=
X-Google-Smtp-Source: AGHT+IHua/UEt3b45/LuxxWp2SUanS88KDLpgikwHH5MvPxATRT7Z0U/3UXMo1sRCEzCo4OszKGTSA==
X-Received: by 2002:a05:6512:31d0:b0:553:277b:17c8 with SMTP id 2adb3069b0e04-5550b89f65emr5591872e87.35.1751370484839;
        Tue, 01 Jul 2025 04:48:04 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:04 -0700 (PDT)
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
Subject: [PATCH v3 15/24] firmware: xilinx: Don't share zynqmp_pm_init_finalize()
Date: Tue,  1 Jul 2025 13:47:17 +0200
Message-ID: <20250701114733.636510-16-ulf.hansson@linaro.org>
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

As there no longer any users outside the zynqmp firmware driver of
zynqmp_pm_init_finalize(), let's turn into a local static function.

Cc: Michal Simek <michal.simek@amd.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/firmware/xilinx/zynqmp.c     | 3 +--
 include/linux/firmware/xlnx-zynqmp.h | 6 ------
 2 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/firmware/xilinx/zynqmp.c b/drivers/firmware/xilinx/zynqmp.c
index a91a0191c689..87ddbb7d11c2 100644
--- a/drivers/firmware/xilinx/zynqmp.c
+++ b/drivers/firmware/xilinx/zynqmp.c
@@ -1299,11 +1299,10 @@ EXPORT_SYMBOL_GPL(zynqmp_pm_bootmode_write);
  * This API function is to be used for notify the power management controller
  * about the completed power management initialization.
  */
-int zynqmp_pm_init_finalize(void)
+static int zynqmp_pm_init_finalize(void)
 {
 	return zynqmp_pm_invoke_fn(PM_PM_INIT_FINALIZE, NULL, 0);
 }
-EXPORT_SYMBOL_GPL(zynqmp_pm_init_finalize);
 
 /**
  * zynqmp_pm_set_suspend_mode()	- Set system suspend mode
diff --git a/include/linux/firmware/xlnx-zynqmp.h b/include/linux/firmware/xlnx-zynqmp.h
index 6d4dbc196b93..ae48d619c4e0 100644
--- a/include/linux/firmware/xlnx-zynqmp.h
+++ b/include/linux/firmware/xlnx-zynqmp.h
@@ -585,7 +585,6 @@ int zynqmp_pm_reset_assert(const u32 reset,
 int zynqmp_pm_reset_get_status(const u32 reset, u32 *status);
 unsigned int zynqmp_pm_bootmode_read(u32 *ps_mode);
 int zynqmp_pm_bootmode_write(u32 ps_mode);
-int zynqmp_pm_init_finalize(void);
 int zynqmp_pm_set_suspend_mode(u32 mode);
 int zynqmp_pm_request_node(const u32 node, const u32 capabilities,
 			   const u32 qos, const enum zynqmp_pm_request_ack ack);
@@ -746,11 +745,6 @@ static inline int zynqmp_pm_bootmode_write(u32 ps_mode)
 	return -ENODEV;
 }
 
-static inline int zynqmp_pm_init_finalize(void)
-{
-	return -ENODEV;
-}
-
 static inline int zynqmp_pm_set_suspend_mode(u32 mode)
 {
 	return -ENODEV;
-- 
2.43.0

