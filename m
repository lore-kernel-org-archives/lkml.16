Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB622949F9
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 13:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748007682; cv=none; b=IuZ/w125Qi3sYM+TVds2MMvtWyDraQ0HeCJdVT4NrNixUOsA6+ZijQ3qoaH8wNT1s6qnEEt51VILs5FBqptyTLx6nF5O0ZyzrActxnyjSeeKw5ATnnE4en0CzkQ4ZBkIOPZKLBd3rDenbLbYwvhl8/M6h4MztTWdbjB9IwPT06Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748007682; c=relaxed/simple;
	bh=NN3Crtgicr2RANdkx4XpcfEgrbjiC/nyTFX0TvsgmcU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ha1HH62XYsO9CKVTml6Kc+jIje3mANExnuaVO4DMb3y72XEgLH+3MucqaUWyTllrvmD7yqC36TW7nvaMF3I+QLsW4dAKXYh7w10B6kEQ1AJk2xkAF4617XoEyWeES+5LR9FArn8EayZCV1yGkzKYpwhOdnpshZpE/Xa9cV0zXDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=g1N1+RtS; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="g1N1+RtS"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-3a3683d8314so5794839f8f.3
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 06:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748007678; x=1748612478; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=71f6dv8Oj3Q5ky21qEIlnyYawuoQhOrGkPFVRB1RoRk=;
        b=g1N1+RtS2Ef4xFhuExSzrtAQVKw+b6+pvCIMVRhBH3oSi20cd5lyfuhp5fP3NsFBFH
         OqeAZmCO2lQAwCSk6daaVXRmMWwG0VQ4U22E+SX4Zs1bvqrGSZXR6PtqqxEt7qz75OOD
         mtfeiH92i1ZrMAq2s91ABryOsr3a8nLsArhKlGPdqrMLYX74SEtFf6uHuITPxhgrSOH+
         lAeU+sKGdq2g36lSUaPKHyAgQJTcrFtmOVuzPDm9C5GuJ/e9ZMT+SJuAIux6VxJJvx/e
         w8h/5gv30Vd2gyV90e/D9xpKs1vI9kiZU/4LCWY2teK71NRNWDIaFBflmCmqS2VCdGYB
         sYDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748007678; x=1748612478;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=71f6dv8Oj3Q5ky21qEIlnyYawuoQhOrGkPFVRB1RoRk=;
        b=l/9ndeEEHPgCr1mn4TWKjc984pBVILrHbmLny5PFJ9Mq+T/mvfpCO1Lfi6a+kz21uW
         /uvpacIpKkn7yBGfoCspRuyDnd+RKt4ZoRMB9+jkbXYXgiw++MdMKmD6EKSnEtAcUhKu
         ppeJI9HkVk0KhSmBw6ttJtRpXurzTIoCbM+5tIrI6iAtrOpJXsgxYArqhWmD8/kX7hLz
         qVDgMkCqLgdiKPKAQVcS1OjHaGHutHd3FAAJMNzVRXGFfoQqjCqUGVYsSpi/XHNe2xeV
         ojmcUMMfOYN20DL3VYPhmBhq30kSSG/ZWsA0IwL5zi8W/QIO/txUMqI9yO2MCIhXd/5l
         oP7w==
X-Forwarded-Encrypted: i=1; AJvYcCXNCCljHMY8FvPK74cPTHbhaQ4piMgjqPq7p82kOnfSmBimiU8XIW8NEFIlEb+0WVnEEpb6P5cMkNQbqNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPnyy2ARHFgLqJecAZWXrDhSl7JZZtZiUPSyKSef1Vq0zHw3Nf
	4gbaGYmNkHMk/UwQ2TmIFUhg63DZeXLjL5HW0C3WlfxP3ZCuricIuQE+6TFKwjca5+4HmJAj83G
	Hq++cFT8=
X-Gm-Gg: ASbGncsg4dVOcjvJ4Z5mQz8jEjTK1ZYdV1KaWtZSc2ltTBRTdqv2zeZ9iraxEFwiwZf
	RGuSuzd1n3XfW5f9/IaeOeg5pnIa7gShLtCu7WbKomAc9O5+0oyovCIGo1OcnbO+4mFOKpKqCpI
	cJ3Ih/C5C0cROFwP/YDjrqlU7a9wFBO4UU8JgqMeigZcc01T7/H208kFQNuQyGst+8xzrWTdwCN
	WL6f75SS14ZaoNlc7MOiR9exdDHdFecxT4432k/Uqo5NQpqkzIKuLrGr6ZmJ6wAC3eoPeKdZk50
	2qNpltIOJgaBbdj+lhiX329P9o1FaKCZqF86SaS0dpWDQO8r/QPHZ2kryph4p+5hugVB+LRqurA
	j3oEbaPlHEIAHKl9qWyCZjlB5iA==
X-Google-Smtp-Source: AGHT+IGFndHOIFZSsgQfYdZw+/8HGCKSecirkmKfEr0kpQ5LrWHxETwwaD5/Fwd9r/MLkzRBHLqG+Q==
X-Received: by 2002:a05:6512:b9d:b0:54a:d68f:6ecc with SMTP id 2adb3069b0e04-55216df94b9mr843157e87.2.1748007667241;
        Fri, 23 May 2025 06:41:07 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-551fc0d473bsm1950609e87.244.2025.05.23.06.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 06:41:06 -0700 (PDT)
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
Subject: [PATCH v2 17/21] pmdomain: core: Default to use of_genpd_sync_state() for genpd providers
Date: Fri, 23 May 2025 15:40:14 +0200
Message-ID: <20250523134025.75130-18-ulf.hansson@linaro.org>
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

Unless the typical platform driver that act as genpd provider, has its own
->sync_state() callback implemented let's default to use
of_genpd_sync_state().

More precisely, while adding a genpd OF provider let's assign the
->sync_state() callback, in case the fwnode has a device and its driver
doesn't have the ->sync_state() set already. In this way the typical
platform driver doesn't need to assign ->sync_state(), unless it has some
additional things to manage beyond genpds.

Suggested-by: Saravana Kannan <saravanak@google.com>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/pmdomain/core.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c094ccbba151..b39d06d3ad26 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2621,6 +2621,11 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+static void genpd_sync_state(struct device *dev)
+{
+	return of_genpd_sync_state(dev->of_node);
+}
+
 /**
  * of_genpd_add_provider_simple() - Register a simple PM domain provider
  * @np: Device node pointer associated with the PM domain provider.
@@ -2646,6 +2651,8 @@ int of_genpd_add_provider_simple(struct device_node *np,
 	if (!dev && !genpd_is_no_sync_state(genpd)) {
 		genpd->sync_state = GENPD_SYNC_STATE_SIMPLE;
 		device_set_node(&genpd->dev, fwnode);
+	} else {
+		dev_set_drv_sync_state(dev, genpd_sync_state);
 	}
 
 	put_device(dev);
@@ -2715,6 +2722,8 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 	dev = get_dev_from_fwnode(fwnode);
 	if (!dev)
 		sync_state = true;
+	else
+		dev_set_drv_sync_state(dev, genpd_sync_state);
 
 	put_device(dev);
 
-- 
2.43.0

