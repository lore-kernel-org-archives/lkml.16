Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE11921FF5D
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:57:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462268; cv=none; b=cR7/0C9SbEafoi8790KtFG5geoRhKmghdHE1RQMRGGtO2p4H0HzvzGSq5nP7YQPSrAv7UPd24rQvxKiTQfluaCvt4cONc2sbDt11eEePNzC4PvxEvRHDxqI/Rvm3EQVxcazP0pe+JGIPduR+AcKc1wADL0lZsM7KKdnDqhbEj0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462268; c=relaxed/simple;
	bh=HxJNYY9IRB2fTnRgpeLfBfNMV4c9x5sL0a7Gxl/lSqw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To; b=i1tmxVr2rxTRM/C2G/gLY96oGItRJds31B6R9Y+2BlYXDS8zsI4r08o3a9tO3yj7+Z9wbBUgrqekoHapsGgb6ReySh31Tw21fuX1oAvFtNUyvn09EbP8mwbb6spIoWGQKlL3jYcBFX/Hl2xJvryrsjcLOVYZjIdjDO4YAtNkNUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WvsJoBS4; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WvsJoBS4"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a365a6804eso155990f8f.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462264; x=1749067064; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=WvsJoBS4r3XoWTURdvUVsEgn9z1Pkwv0XjMjWl17B7CcJq6trEszWb90LOm+F/GMxF
         5cVYwzlqqISHt/uGKPlXLCV1uHq08X7Dq7noE+9eFz3+6MpJULRyaxS2WYZtsrCcKYTD
         fN9u1e0flhF6ebl03OEkqdZKiJPfRh2lOH/S4SBl83jwmx73ZL2O6C3NranZMwHkH9vU
         6lyEnmyEsjNc3VUcBWfouppZb6Q18LgfRH3zum9AF0bmxunmr/7Gv8Fhlbt0h2fBguL3
         ljjfyJ7s0ersC/Npx8/4ceDrSJseofX4eA/+ybSUbrepBcdNqkHcCQlJzm5+Qcb7QM05
         cPRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462264; x=1749067064;
        h=in-reply-to:content-disposition:mime-version:message-id:subject:cc
         :to:from:date:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=daVisNFo2JYOWor9frp9fd1E3MXvxdVufApsYKXj4R0=;
        b=tQRqlUn2AnxopbRENpkUhIR+PXkBZeZONlK77DBNIpGVoi1swPuQMgxoq8WNWdRBOM
         0ttrPLHE1IPVM9GC3hsXShFw2G/Jx7amFihMGzIWmbAtBevBs649gSQUhRSDQ96v914S
         mtBK6XIE63l/fIc+mCBQy5QldS44abt/p7SBc6+dOIM0VkXtGx+YP9kzFTKaq25Ucvi3
         JX9oNiIOxVWI2SfXSPBbFeyCsAl/jmi8cu2rnTEU4Kd0iXMdYicGdQr4IXyIK8h/KPBV
         Zu09yyW9ofocfNK9/bADZrMmo1+Eb1HawxtVZnYM7QpGnthxviw1JcQ5vIVaWGncJOD+
         vb5w==
X-Forwarded-Encrypted: i=1; AJvYcCWUdbzAMncVoALVWEF3qosNyCpRAbbozZWQ8bI/50MuoRziffMGUnrezm2xu6QL9GiePTgfqnmKYPE0/tw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfBNZ3hPJMlVert2fJ5T+PZSKktqYXsERUG2D8sq7MWEXAz7hz
	83azl2na1ubxjaJBXsibmtVl5QZhpr4N4ME/4WDYaO76YB5jUtQk1Wg3YhwSiPIe+p8=
X-Gm-Gg: ASbGncsAa7eOHAMDOxM1iqJ7uulmRbm66VwIlI0BDhlGvmcrdT1BtmmCK9+0gZUz6Sw
	MfiX6XWJl1QLoH1x02UpSydcR/YDwNgQMvdnrgIjyiWROirXRalHM32UAQvOmNE1BK++2GYEfd4
	dtvimakd1/vjgvX19FBnP9Tgn1lpufh31cCdlximB2NtdLDdMDbYRPN7yqEHJGxK948hopJK2lq
	PJXsfxPAAD4ZT63TZzOp4AqBYVdon1q5qLxQ61dejrk4+fvdHNte5l7DNEIs/iL8Zoiwud8EM9N
	DjC4Sz412GylHLKlwvD7ZiuTTebag+WinEjXUp7/2C3GHjssbm0NJ/g=
X-Google-Smtp-Source: AGHT+IHg9XasKs+N0t/qumXHpJiiJ8sMTppJmHwcsmrYSwVnYilz8ut2u+dvhBQCw0zXqxv2hFdsXA==
X-Received: by 2002:a05:6000:240d:b0:3a4:d6ed:8df8 with SMTP id ffacd0b85a97d-3a4d6eda63bmr10797738f8f.39.1748462264092;
        Wed, 28 May 2025 12:57:44 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a4eace3260sm2353096f8f.90.2025.05.28.12.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:43 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:39 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>, s32@nxp.com,
	linaro-s32@linaro.org
Subject: [PATCH 4/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <c7c9319793b439cb35909621381ca2d4a78699dd.1748461536.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1748453565.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/ci_hdrc_imx.c |  1 +
 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/chipidea/ci_hdrc_imx.c b/drivers/usb/chipidea/ci_hdrc_imx.c
index ce207f8566d5..d062399ce15e 100644
--- a/drivers/usb/chipidea/ci_hdrc_imx.c
+++ b/drivers/usb/chipidea/ci_hdrc_imx.c
@@ -95,6 +95,7 @@ static const struct of_device_id ci_hdrc_imx_dt_ids[] = {
 	{ .compatible = "fsl,imx7ulp-usb", .data = &imx7ulp_usb_data},
 	{ .compatible = "fsl,imx8ulp-usb", .data = &imx8ulp_usb_data},
 	{ .compatible = "nxp,s32g2-usb", .data = &s32g_usb_data},
+	{ .compatible = "nxp,s32g3-usb", .data = &s32g_usb_data},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ci_hdrc_imx_dt_ids);
diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 43098a150e83..34fd26faa303 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -677,6 +677,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
 	return usbmisc_s32g_init(data, S32G_UCMALLBE);
 }
 
+static int usbmisc_s32g3_init(struct imx_usbmisc_data *data)
+{
+	return usbmisc_s32g_init(data, 0);
+}
+
 static int usbmisc_imx7d_set_wakeup
 	(struct imx_usbmisc_data *data, bool enabled)
 {
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.flags = REINIT_DURING_RESUME,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.flags = REINIT_DURING_RESUME,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1432,6 +1443,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
 		.compatible = "nxp,s32g2-usbmisc",
 		.data = &s32g2_usbmisc_ops,
 	},
+	{
+		.compatible = "nxp,s32g3-usbmisc",
+		.data = &s32g3_usbmisc_ops,
+	},
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, usbmisc_imx_dt_ids);
-- 
2.47.2

