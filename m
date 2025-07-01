Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C348277CA2
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 11:48:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751370494; cv=none; b=EhD6gAZPM2ryH7euDGiKsdNgDNBrg9VnlPvgSipIy2gkfmNwXZempjpAa/I9ECorYvng66nGwx1jsvQfHhv7H+p/lHQns3SmW/TgSS/NrtVD1e2Vpej89TFrwXgNylco5cAhnyUUGRuuS+yQqfZCHgMRgMkh8YurQrMYwXjjJX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751370494; c=relaxed/simple;
	bh=KFtySHIiBM9Wkxn85JBFJA+dMnaKsCR/GrT1EW+Df2s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ESSjyG8F9/6fV4ZXH1ObNlKjvkPxZKtbwj6lb7xhCl6d4h5htG8rHp4dU0Fvy8sLsLwg78iI1CN7Xj3/DZyKY7BH52N0ADw8mYv7Yn55rGLFbJfgkgmiahE6Bt3QqDS68iiQ7h87QOTbD2sm8v3tfKhSK7nTA7kkazHslgBrJ2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fp3DvpX8; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fp3DvpX8"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5561c20e2d5so1770313e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 04:48:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751370490; x=1751975290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43h2scNQ+uitZ0AV9xVg9Lwr/uWGDBBW7WgZih3doCY=;
        b=Fp3DvpX8QXTzc5OBeAOA8ZpAvYrUao66hL9kmdLQf1it3czwD2IGCa4hOgug7r6nM/
         odAKkmZZXofOb/WstX4XqrZ+TeiaL185t210nP0yX7v1E7LYrWD3ZTU/+ObcCkiDX5mR
         guFWQ9D4RdX+uT9qQV2fPMu6iOI5Kcx7+tK+UB1JMUrMS3iTdFchvtt7ORWu+t35nPch
         +OwzeOM3+m/08a/a+2yVXT6YdVVXHXeiW9wcjoyg6IhTjhOWQBZG4095Y/BCQzYNSYLf
         2tfJkqkWOe6KKSpr6RGa53BhRVHyzn7hWY5XwTMO0mKGIdD97bsHCzCOiqD1PmzfzISi
         pdqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751370490; x=1751975290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43h2scNQ+uitZ0AV9xVg9Lwr/uWGDBBW7WgZih3doCY=;
        b=PzZMpOkNV9xy5TEe/d8letrtolBfpQdD1/K3tHz+S2AMvy/Kn/duyRaiEWi745wb1S
         aTkbKsImoVmKeGF3VoKUQqjy/qhxOggbM31rgVI93VUC/68pFtNj7CPRy3HKf63oc6yq
         cDfO2hJZ/DgaTaJjDbLaL5QNwQFSLt1UtNff1bAMYiMKXhTZglDMnIdDFLE17BlKwJW9
         Qagrk88GN9UNAhR4gWj92B68LK7bl+cRFFuyw149oVtSuzQpeDpkOXwM4w+66toeNc2n
         UBunhoySZVQ9rk9mkmsoQ4MZi8yKg0ODVOFVqX/8xq4Lr5c32JFQISStl8ICzrUNHLdE
         f1Tg==
X-Forwarded-Encrypted: i=1; AJvYcCVyhlXdXukmovDSzeLauuZGYjfKy0jirDlk+BDYTXZ9ik3MyNPHi937Y9UgM9Yu10B6xElFx1AHpVbF0gg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyU/u6rspgleNHXYBH2UYufRU8Ptd3zs7Yfju2BKD6pYGzZfGKH
	Xa8hJ7HhDxAHlJ6cv95LYr3stX1ZTOpmGCqw3Ngrpbf71AQ11xPyoD9LUmOm4lN7mcE=
X-Gm-Gg: ASbGncsyluFbDuOEIuwUcb04yJnBtVFCQCJnaeIbw0ZQ5MQoWqSyyzxUDL4l6twKTRz
	CKXywY/+btC4X4/VgPWdU4NCuRXbLRyCulhNCoTyQD99jyOSmtJA7SzjICWe4nyZWq94mg21lb8
	kaMufMQSw5/8yfBqRi4kZK/Vm+v7qrb/QXyuCiOjjAdDHx9iJJt6T0F8SS83kFiedU69cWZdjK1
	hnMRmWFRqFVPN75eAu3Qy/uoMnhiizslhg+lPiXya8JT3BD/pjjD+VgtXeTRVJ8xABE94Ys6ILR
	WSjxmvbCCreSH+Y90oCwgiU9qu3+REuJvJ03rMFrkfrLiT6ALck0oQz6vNaWzzCF61uV/wcXDgg
	SPaUxbOEjSdZG7GVDIs7QDbeTkHbZdxANOA83eHAaN82CejY=
X-Google-Smtp-Source: AGHT+IGXZRw5n2EKVnLe+2fkx4wCE8kfUrNq7rzEqUs6wo71t2rUuFE+PmpyvT/+t2Fo2UVrlV2cCA==
X-Received: by 2002:a05:6512:3c92:b0:553:3770:c91d with SMTP id 2adb3069b0e04-5550b7ea103mr6576048e87.4.1751370490330;
        Tue, 01 Jul 2025 04:48:10 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2f162dsm1800592e87.248.2025.07.01.04.48.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:48:09 -0700 (PDT)
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
Subject: [PATCH v3 19/24] driver core: Add dev_set_drv_sync_state()
Date: Tue,  1 Jul 2025 13:47:21 +0200
Message-ID: <20250701114733.636510-20-ulf.hansson@linaro.org>
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

From: Saravana Kannan <saravanak@google.com>

This can be used by frameworks to set the sync_state() helper functions
for drivers that don't already have them set.

Signed-off-by: Saravana Kannan <saravanak@google.com>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Abel Vesa <abel.vesa@linaro.org>
Tested-by: Hiago De Franco <hiago.franco@toradex.com> # Colibri iMX8X
Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com> # TI AM62A,Xilinx ZynqMP ZCU106
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 315b00171335..686f2a578fbd 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -917,6 +917,18 @@ static inline bool dev_has_sync_state(struct device *dev)
 	return false;
 }
 
+static inline int dev_set_drv_sync_state(struct device *dev,
+					 void (*fn)(struct device *dev))
+{
+	if (!dev || !dev->driver)
+		return 0;
+	if (dev->driver->sync_state && dev->driver->sync_state != fn)
+		return -EBUSY;
+	if (!dev->driver->sync_state)
+		dev->driver->sync_state = fn;
+	return 0;
+}
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {
-- 
2.43.0

