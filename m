Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C4B2206BF
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748462248; cv=none; b=dOqf6KHyA1YHIe15JZSiPTcrjHI8Z7aMmEnaHDFHT1m3y4CNdPghC/QHbs8GKTyPk2RYH8zgkeEMMORtWCYOsZVCEZsIFwNn46z5LdTKh75tjxkB+q4vLIWjQ+WeXGv4mzeBenC7w17QWCJRTxQrTA5V9EaNJxywCgguu7cc8pk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748462248; c=relaxed/simple;
	bh=NSe9RzYFBpq47/dJ5qqWUOPu2I/KiKwtwt0jkoCunaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qyEUH1BAwNmlPWQbRRf2s/esMthiPitR4LcmY5nYpsrcgAuwJZZLTI2l+MT3pwxU/A8MqNYCO3bMDoNfymdDtorysBr8tpGVOYT7Ub5UZbwIjgszzCKjLaGICkboEEw9P9u3t4lYz+nnIrpST0HwJQGQs8FrMaiI+kmEwQd8tss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=CFQ7G+io; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CFQ7G+io"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf0025c0so1272205e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:57:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748462245; x=1749067045; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=CFQ7G+iogz9ohwn6ms/590G4KfsuI77AWtGZuvgyCydOokQxrzdBayAgp1JLSpXysF
         zHr7llscxlMVmyj5iBH+jD7FWXlext/3Zkzm39jdkNdowuKnpZYZusVmRPI9RDA1ciIa
         u5KBitHC5f6ZwhqnGt+X2dhAJXIqxQlitaOXJhyION7ErzGKv3keH+qAJ5A2pPye0C3d
         CcQCpLHGGgLdA5vWFPmR0KSwgX+jXhGTQI3XXfNJ3G7LfD/0Bv6IBhPdHO5WYmACEb1h
         r0pq4XNQ6uDHiLOXK91+9S0yQ2YacH8jAhnUx0T4TGmWfnaqRb1fvhk4QsnWHKhIQ00G
         UQDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748462245; x=1749067045;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jox9SekNR3rtKHNYCobALo8p2iBIaUa3VzzVOakwrMQ=;
        b=Kq60CCoxbTjSnY6uRaZk/sOpnqF3ayZDlgrxVrKkEVToT/aSdgdytDlKtk7Iatf72x
         OFn1ZIDdWFFEGkqWBTbZUmfD+hEGBL0+c6SU3t+nQFPGvFiB9yM3fGbso67vFZBPjyOW
         aaiNJxugLBWZO4jyJKJJeb6Z9F91aDLzoQuzQGAlZTPaUgQ1fRxHtNghyVlPrg6rlas2
         NbN/o+JWLsKK7vI8hEdUBaJXhsdMaF8r9YZAhcXh2cKsiVx8DwNGIHv9H/jrv65s0VyF
         pwNpjATE3/5BjsfXcXaJTIkQX8n6/NIDtKrwdiakAp0I3Z6eIk+O49sPsdt6sY6owa+S
         PttA==
X-Forwarded-Encrypted: i=1; AJvYcCUGmfEQ5mVxN+8Y+09FB/cyZM3uGJI9/9IN6+jxdT8bixVRgPK8+fAB0bCilx+viGP6GTwY4wPx3IJDs7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPMlz9t0PZb4eagWkoU28shnPhs9mR++Fe+t+1y69ED0Ex/58K
	fE5RREXdlXYh7BciZTg3VMgOXFEQH4LX9iqyXpWGXPGB9mG1IgzYgS1ANxI2/1xATkc=
X-Gm-Gg: ASbGncsnit3dG3COdOgBJ2D5IOQnaiZUCvOTyA9ZbxA9rcZHF3QOvSPsAadfbI8GYpM
	/Ripk6hvYbLAE9ob1wC3uJNYElNsHiTtfnzIE15HYThX0gepRr1j0a4Ec1A9UC87ejJRyj6Kx2D
	hnjrpGaeUH7pwzd3kiHlh0BCVQC0tAMBwv4l5rS1tEg/WPjNA4F0D0JVyfkAoUd3xvXwAPXAzcX
	3BG559YjawoYGH9bEOE7CbedhJI0VzHr0I4p14M02qcLM3Mu+G2bSr3NvantmlPbOnS3V5kuWcj
	vPkG2xEbsL2Tv+w5M+an/BHmV/o2hnMZ0wneHoegkVuGUUcEJK2GztMZ3gnONDA8tQ==
X-Google-Smtp-Source: AGHT+IGFimIQlDKktgw+rSB1HgWLv0+JQH4Uvai1EVQNKILhkigc431Q3x3/98hg2t4hXWqFBll7vg==
X-Received: by 2002:a05:600c:4f43:b0:442:e0e0:250 with SMTP id 5b1f17b1804b1-44c933ed7efmr166096775e9.29.1748462245206;
        Wed, 28 May 2025 12:57:25 -0700 (PDT)
Received: from localhost ([41.210.143.146])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-450cfc2d383sm586565e9.32.2025.05.28.12.57.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 12:57:24 -0700 (PDT)
Date: Wed, 28 May 2025 22:57:20 +0300
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
Subject: [PATCH 2/4] usb: chipidea: usbmisc: s32g: Add a REINIT_DURING_RESUME
 flag
Message-ID: <b1ddbc5993b2906cf916d023fdf27b07088a9672.1748453565.git.dan.carpenter@linaro.org>
References: <cover.1748453565.git.dan.carpenter@linaro.org>
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

The s32g2 and s32g3 chips will need to re-initialize in the resume path.
Add a REINIT_DURING_RESUME flag which will trigger the reinitialization.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/usb/chipidea/usbmisc_imx.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 118b9a68496b..95759a4ec60c 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -155,6 +155,9 @@
 					 BLKCTL_OTG_VBUS_WAKEUP_EN | \
 					 BLKCTL_OTG_DPDM_WAKEUP_EN)
 
+/* Flags for 'struct imx_usbmisc' */
+#define REINIT_DURING_RESUME	BIT(1)
+
 struct usbmisc_ops {
 	/* It's called once when probe a usb device */
 	int (*init)(struct imx_usbmisc_data *data);
@@ -171,6 +174,7 @@ struct usbmisc_ops {
 	/* It's called when system resume from usb power lost */
 	int (*power_lost_check)(struct imx_usbmisc_data *data);
 	void (*vbus_comparator_on)(struct imx_usbmisc_data *data, bool on);
+	u32 flags;
 };
 
 struct imx_usbmisc {
@@ -1266,6 +1270,9 @@ int imx_usbmisc_resume(struct imx_usbmisc_data *data, bool wakeup)
 
 	usbmisc = dev_get_drvdata(data->dev);
 
+	if ((usbmisc->ops->flags & REINIT_DURING_RESUME) && usbmisc->ops->init)
+		usbmisc->ops->init(data);
+
 	if (usbmisc->ops->power_lost_check)
 		ret = usbmisc->ops->power_lost_check(data);
 	if (ret > 0) {
-- 
2.47.2

