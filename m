Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6475C279334
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370499; cv=none; b=ot5s6BZG+oSgBkLCT1H8ucjVC76ENwMfFnSIXdxluKoI+59O3vTRiGS4L3XlSeU+pLomWKyGxApEUzgML5EV6uBLoVTmCO1cHPRfCv3RwWF23Gsc4VLvDmzLVF5ipJgUdIkF8s4yHNlmF4RKX2jk4lFVyflFRZ4jxz8DZ1DYB+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370499; c=relaxed/simple;
	bh=oVGYbB4M2g4Pk0G4mXbQpFb6WBtoi4wL+V0FO2AQVTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bvqzcU3u0q3yvBQWXLjvn73qaJJr9g6vJ4Gx4Fvhwz9KU8n12ndm0HZtuvevDMuH3sToOZWL5GnD7pilVmzob9bv5t02C3tHhmaXcCM5D5MUzfstmaXBTdOftK/TNeKxvHVFDAKsyrisASlKGfg1GToHcoNWHOBEDDLfBR24YiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NTA3e+LJ; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NTA3e+LJ"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-555024588a8so3328295e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370494; x=1751975294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Grr6sl4cEvHS0b8iaih2yeMDMbPzzC5ZGk2V/+UW+I=;
        b=NTA3e+LJXJaOUZ4kofiWKYg1ga+GnHobxK5kmUV7W1RpJH70MpDR2fZ4nAAVtniqLX
         ug4gurmVaATq+euvBClsj4YFkQQCa8CvbmpDepy7YgzcqAquUMHHGJhj6hvlbjk97sln
         n5sP0qqKpZ6VS+gwezbapV3jV9OoQ/KlRw8agN+9XtqRV2mdsgKO69tsXmhkNn6IpvxK
         3utrL70iTH5jldgw2NPizGqf6pHDPAbLbzyI2jM4Gi/SBfUIKsStp63gIRVn6rd+3O8O
         mSLsaahUhx8vhwdxp8yk67urLVEE+5qPkDcEC+h65GQRt9Uls/7vhMHcJBOFxfXlqgCV
         8uuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370494; x=1751975294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Grr6sl4cEvHS0b8iaih2yeMDMbPzzC5ZGk2V/+UW+I=;
        b=L7CO4kolBUBO5JEnnWiVVhuteSLi/ihTw7bW+YPXgiY5uWvl3f/d0EXBJXNGLwBtk2
         sfWhWY+GtdfjKb3+gEZQaiWtbDX2DZ8VRIpTK3YJ94qvruRjuwaKyZvgd02KNNkNn6u7
         kfqwF75kaVehP4XnmtMfifHNg31IDC/vue3Awjd/uVINOic2+10TDGh0xAP4IAIt5X3/
         akkscoB4nPsT5dNR0a6c8OQ9TvHqtBHGFUUf9cLuZmC9721SpUWFGJbvmSAAjyBaV8A3
         gn28EuoYQ5Tt+Vm8haMcSVKKxwBYMxU5dOZ+QvEC25XjZwjtWvXdnfmeItao1Py4vRn+
         E/YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNDNkmBRZgnKP1r+ZNiN/mG2vXJoToD7oiLBxGPvKwwTyRVpY+LSQcfrqJ3UvEf1H/a1hzgE6QmULgrtI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeAKCs7UtCOTpqQF4UJR184mr0pKJHuYM7Ytcc0ONqOxR52WW2
	/AlUPH88/a/yRxVyUKBB+7y1FGCv1sx8li34w9kU/YZWG34WwTIzhcgHy+1/iozp45g=
X-Gm-Gg: ASbGncuQ8h2CniqMwmUqFAUhlq95o90m9DeC1HjM/sw0vg8IV9YtDoZo/PyS1zcox3a
	mSsIqLg/b/Bs9yiBEvKRfVyTkr14mE6Ljwqnm4r6eJ1RcnTpQGqUB1rsxranX7xhZuR74LJl83V
	YVulvfykhnjyoIPqzNdZNAjp/VKbOqsBwXo5CS3bkH6jrV1n0ToTF9nDfS+f8ATVwCsVAMzlXDs
	9DmR0xfLnKNSonghqiPSudVKYfclwSHGeuAh7lLgAN2vfyW0iuPyUeNDdjMN03Br5/DPHjwBpTt
	LTJ518y/4rqPwIf5r9Jy+Giv/y2KKTFeBPYlWNHTpooqdcXDHWWFg0gTUIVPGwruvWb/aXewNZJ
	s7YqpuEhxUif5T3aH2FLi2ssMS6MMQFOPzKKb
X-Google-Smtp-Source: AGHT+IEAzEGjWuHMus1XDYl0PiNkmllaOO69M065vbKdwdWl1n37RJb78JR7OOuVsVm98bpKzaxCeA==
X-Received: by 2002:a05:6512:3da2:b0:553:26a7:70ec with SMTP id 2adb3069b0e04-5550b79db9cmr5623472e87.0.1751370494435;
        Tue, 01 Jul 2025 04:48:14 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:13 -0700 (PDT)
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
Subject: [PATCH v3 22/24] pmdomain: core: Leave powered-on genpds on until sync_state
Date: Tue,  1 Jul 2025 13:47:24 +0200
Message-ID: <20250701114733.636510-23-ulf.hansson@linaro.org>
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

Powering-off a genpd that was on during boot, before all of its consumer
devices have been probed, is certainly prone to problems.

For OF based platforms we can rely on using the sync_state mechanism that
the fw_devlink provides, to understand when all consumers for a genpd
provider have been probed. Let's therefore prevent these genpds from being
powered-off until the ->sync_state() callback gets called.

Note that, for non-OF based platform we will keep relying on the
late_initcall_sync, which seems to be the best we can do for now.

Suggested-by: Saravana Kannan <saravanak@google.com>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 18951ed6295d..a86aeda1c955 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -1324,6 +1324,7 @@ static int genpd_runtime_resume(struct device *dev)
 	return ret;
 }
 
+#ifndef CONFIG_PM_GENERIC_DOMAINS_OF
 static bool pd_ignore_unused;
 static int __init pd_ignore_unused_setup(char *__unused)
 {
@@ -1359,6 +1360,7 @@ static int __init genpd_power_off_unused(void)
 	return 0;
 }
 late_initcall_sync(genpd_power_off_unused);
+#endif
 
 #ifdef CONFIG_PM_SLEEP
 
@@ -3459,6 +3461,7 @@ void of_genpd_sync_state(struct device_node *np)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
+			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 			genpd_unlock(genpd);
 		}
@@ -3486,6 +3489,7 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
+		genpd->stay_on = false;
 		genpd_power_off(genpd, false, 0);
 		genpd_unlock(genpd);
 		break;
-- 
2.43.0

