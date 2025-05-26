Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C720296A
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 12:21:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748262085; cv=none; b=ooO08gyNqBrOSeis6PDwraBQ1IBxLAOtnoZeS8zu+RQbvYZFrtJeP/kHywoqauvMVBiFfLXrk0xKtPWnR/jJrp+m3lArEIApywukrmK/5+Dgqm83si5ljjCXzG3TGq8yGEr8YOes4FtzqsCapQgojO3WaS8+bds6LTuWeYpRT84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748262085; c=relaxed/simple;
	bh=0ngO20W7VIXOPPIpKLH9V0T5vSnlC+XP/HDxogKEcvw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IzGszkDQzk82JhPbPd1SjcR+1L9RONcYaBjEoC54fJdWnLfea7+9XH6PaamNelsyUJqzIQo10utmF/nMsbjCbq8rxulhq1NzXkQRuuCxyu2VCrmliA0ymhKJWBYLCbUsPhZj1hDj5Nx4V6JKYNbOtvb2B8AnZRicoZrW/+30GGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev; spf=pass smtp.mailfrom=tuxon.dev; dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b=Bsk4MkA0; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxon.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tuxon.dev header.i=@tuxon.dev header.b="Bsk4MkA0"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-acae7e7587dso276051766b.2
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 05:21:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1748262081; x=1748866881; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTKtxx+v02w/uCQvxtiKHkLQ6WbqMeNJ42C/cOEagi4=;
        b=Bsk4MkA0sOfIaC1ZLPxwhW9B1uEY8d+j0fZJAjLzUZwm/kCS+hnglaEBszbAfgXslP
         in/gibIuW5OXP0lr8WEG4x4QPgopSajeFCpvXREwXqLhQJVvQPWiasoMOEckDvDi3Ryi
         3eLvduSEMvtg+BNZMGIhDcW8Hy6F7BpYXbA55VL6PGt21UyRPrQqLSlP7M3mGzdMSZVO
         4ddTi4XANae7mepb4Xj30xm8hHpCcMiXPyZCB0oHZ/Gi/XpAkR02G6rA3fMtmz4oAjAA
         eZ3NhuQ1BO0xiD+FssUtvLESwRWWwkureqAoM+zBvFMoe0FybxDhzLFR8NkfsNC+KWzP
         6Z/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748262081; x=1748866881;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTKtxx+v02w/uCQvxtiKHkLQ6WbqMeNJ42C/cOEagi4=;
        b=WP5peIWTZw6CoKk+l4q6837y2uLBUrXy8JjuIjMfkzczfFJDVOM/pYauXzzHwm/GXo
         kH6ajo8pJ7vuFwXP6Bum5Qe7CyXoRsC7mHQOn3jQT/QjwiNL74WlZASH5qr3DEvHr6Qa
         IOjQ9D13FXWKKIzvYU76MRSpUotx/N+agE6zQM3RdgIjVtW7OD+/zjaBd+RxgqD1X/8h
         exGNCAakbkYRUXmL3swLG4Oq0ic2dJqXHtVffJ1z3h7SB10O8jHOu6egzUMG5ngdrdy/
         Rc7Q/E+QcHe9+7tj5UuA01QTB9h0G+ZcB9mi+aIuydRwO6ywd27JoBN+37bzcXq7Xs7B
         7ENQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+szrWwphRBPeUjnBztlPF64yU1uu00lLdyYeko+1B77SzGChWZ2uRGttOijLfI/7t9TKUJE/j1kYt1S0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXViWwwiTh+VDe1A/waq5+y1Vp+OnrzxysfqsQ1S+8mACxznS8
	pstQ/7WfxnpaU64UtFpuiikTQWFoPfIJRPOlBYwPWVxqAUqh2TqUrI+iMuWtx4TKc9g=
X-Gm-Gg: ASbGncuUGsM2AX7CL2KSLKBRMYZL/oW3HqkHx/qiI2ByB3OU3dmAMqZNqFP1F6pzdrL
	NZuYMwhqGjs9gGnz7W7ZF2BzubS0zFpUvNJfV/J0HK90ESNooviMKeNn2ytU3cG8mZqesy55LLl
	AnHVl15JSSad9u/QAODzMC7Qry+QZMzoXGK9AksXBcuU1Gn1uoDmjGgI91AHm0dzDUUya3Dyb09
	+7818mXPIKg79gJXuqkZY/Rpv71FOYSzDGjENidKyrPskn7jcPaCcgjETzDaegY5OzgKjzvp4NR
	upROnRocMtNelGRopbIYW363vX+uBPf+QCLPVabHwljNO05fthk73lqfpWmry8F1PVHdEjq1Izt
	UJn31
X-Google-Smtp-Source: AGHT+IFGyTBXRx1OP1elaikpqfnexAwlKW1XYqDCPwkgr0d6u1X7vnNpG3ig1OaG24SWaOx2VsJBvg==
X-Received: by 2002:a17:907:9812:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-ad85b2121f6mr710370266b.52.1748262080705;
        Mon, 26 May 2025 05:21:20 -0700 (PDT)
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d071c36sm1687630066b.64.2025.05.26.05.21.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 05:21:20 -0700 (PDT)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	len.brown@intel.com,
	pavel@kernel.org,
	ulf.hansson@linaro.org,
	jic23@kernel.org,
	daniel.lezcano@linaro.org,
	dmitry.torokhov@gmail.com
Cc: claudiu.beznea@tuxon.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	bhelgaas@google.com,
	geert@linux-m68k.org,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH v2 2/2] driver core: platform: Use devm_pm_domain_attach()
Date: Mon, 26 May 2025 15:20:54 +0300
Message-ID: <20250526122054.65532-3-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
References: <20250526122054.65532-1-claudiu.beznea.uj@bp.renesas.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

On the Renesas RZ/G3S (and other Renesas SoCs, e.g., RZ/G2{L, LC, UL}),
clocks are managed through PM domains. These PM domains, registered on
behalf of the clock controller driver, are configured with
GENPD_FLAG_PM_CLK. In most of the Renesas drivers used by RZ SoCs, the
clocks are enabled/disabled using runtime PM APIs. The power domains may
also have power_on/power_off support implemented. After the device PM
domain is powered off any CPU accesses to these domains leads to system
aborts.

During probe, devices are attached to the PM domain controlling their
clocks and power. Similarly, during removal, devices are detached from the
PM domain.

The detachment call stack is as follows:

device_driver_detach() ->
  device_release_driver_internal() ->
    __device_release_driver() ->
      device_remove() ->
        platform_remove() ->
	  dev_pm_domain_detach()

During driver unbind, after the device is detached from its PM domain,
the device_unbind_cleanup() function is called, which subsequently invokes
devres_release_all(). This function handles devres resource cleanup.

If runtime PM is enabled in driver probe via devm_pm_runtime_enable(), the
cleanup process triggers the action or reset function for disabling runtime
PM. This function is pm_runtime_disable_action(), which leads to the
following call stack of interest when called:

pm_runtime_disable_action() ->
  pm_runtime_dont_use_autosuspend() ->
    __pm_runtime_use_autosuspend() ->
      update_autosuspend() ->
        rpm_idle()

The rpm_idle() function attempts to resume the device at runtime. However,
at the point it is called, the device is no longer part of a PM domain
(which manages clocks and power states). If the driver implements its own
runtime PM APIs for specific functionalities - such as the rzg2l_adc
driver - while also relying on the power domain subsystem for power
management, rpm_idle() will invoke the driver's runtime PM API. However,
since the device is no longer part of a PM domain at this point, the PM
domain's runtime PM APIs will not be called. This leads to system aborts on
Renesas SoCs.

Another identified case is when a subsystem performs various cleanups
using device_unbind_cleanup(), calling driver-specific APIs in the process.
A known example is the thermal subsystem, which may call driver-specific
APIs to disable the thermal device. The relevant call stack in this case
is:

device_driver_detach() ->
  device_release_driver_internal() ->
    device_unbind_cleanup() ->
      devres_release_all() ->
        devm_thermal_of_zone_release() ->
	  thermal_zone_device_disable() ->
	    thermal_zone_device_set_mode() ->
	      struct thermal_zone_device_ops::change_mode()

At the moment the driver-specific change_mode() API is called, the device
is no longer part of its PM domain. Accessing its registers without proper
power management leads to system aborts.

Use devm_pm_domain_attach(). This ensures that driver-specific devm actions
or reset functions are executed in sequence with PM domain attach
action or reset and the driver will not end up runtime resuming the device
when it is not anymore managed by it's PM domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---

Changes in v2:
- dropped the devres group open/close approach and use
  devm_pm_domain_attach()
- adjusted patch description to reflect the new approach

 drivers/base/platform.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 075ec1d1b73a..0b2036d4bf4b 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -1396,15 +1396,12 @@ static int platform_probe(struct device *_dev)
 	if (ret < 0)
 		return ret;
 
-	ret = dev_pm_domain_attach(_dev, true);
+	ret = devm_pm_domain_attach(_dev, true, true);
 	if (ret)
 		goto out;
 
-	if (drv->probe) {
+	if (drv->probe)
 		ret = drv->probe(dev);
-		if (ret)
-			dev_pm_domain_detach(_dev, true);
-	}
 
 out:
 	if (drv->prevent_deferred_probe && ret == -EPROBE_DEFER) {
@@ -1422,7 +1419,6 @@ static void platform_remove(struct device *_dev)
 
 	if (drv->remove)
 		drv->remove(dev);
-	dev_pm_domain_detach(_dev, true);
 }
 
 static void platform_shutdown(struct device *_dev)
-- 
2.43.0

