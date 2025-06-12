Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38622D29C3
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 18:51:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749754276; cv=none; b=th5rFWI0zdFeuD398+U1lx/g+tCiUQxjKs53ByzQqPU3doqeIlO3HbqBeBZ1MdDN5eblLd3jfTHuXtTWY/hJ6Vuw9wrRHPbuQdhYLxygDw8nF2YEIGrA2dYHPfExlbOPTH+FdswBXUeO/yKV8+q3JD2cdH46Ge3zErWpel6oyUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749754276; c=relaxed/simple;
	bh=IWlKY+BMG19gHf6CAGx0zr0/tTNrF1H4xaMS/LlJU2U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SiT67J8GrLq/VjZoyeNjmjH2HcOk9K3RVjtNG7QDTMevX7hRcUIX3TJkVKPGQBxZHUZOqKnfPOG3Ay44H06RNod33eoH+TtlA/TrGmoQOnydyp/kK9+slBFKv8RKDChUdGuGrrEw5wvW5zOVR6l6FE76kZFgRLMfZdpcgwkZQw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=LwcSVhA2; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="LwcSVhA2"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a365a6804eso824611f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 11:51:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749754273; x=1750359073; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=LwcSVhA2evGpPWYLNDAJwbo2w5+fh0wRw9GnuzQUbFoRHD50Qj8t0/7fYENrz+ekAZ
         nldua6oEWWvKPqCMtEWNDiv5zNtXFpvjUheRFoMgI5HKJ2y5ojwYIQ1YxSxUiZCcgKJi
         nIq4MEmnV1geVCbAM77Qhoj3eyloy7qAM1Pdb1lT3vKbHLSjL/F6sbZ91/P2dVt7itTX
         Nh3Xzq2mHOJc3v/Juy3YrKl9YH0sjPw0U92G+JIis2dId7JpZ5HT3TDGaGCH8xnj8o6z
         V4VvkttWTkHom4B7akL5Ed+EnLNqcE3gwmhiPDfTrLd81oB4Mp2hIcOSoCNwgoDteM0S
         KAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749754273; x=1750359073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RttzpPmx4+I2vFDRVVqMPeYipRESqQyZkl6IDrQJbiw=;
        b=aRMhnPVSEs0kYHgIwd7+9k7Lh5gIL5h9QtCpLzsYUdMBpbg+vlg1nrbzZB0o6ewkbT
         dYQscobyonOmHt3mMw0nMi38zKvvjXKD5h0eckgGP1uyzvgC+LEE2Kd8Bfr08ikdl6U4
         UfAsf3QEY4gd8ugN6D+b7cL6O8GUJDJ7luY2cUbbN6DWfo9c64RNslOcf6AUp/jpwOPZ
         SEZpSJaRtTHHtYQrcZOKaphYoA8S8N59All0A4IeEE+guY3R40b/OysHEOgHjeuZu59A
         JMHrJJOpcE5+LzuW299GCFCjR0LHzKAg5wrgCJVKpZJ7Hg5Y+zv+RW0OZIhqu0ABU66J
         NVkg==
X-Forwarded-Encrypted: i=1; AJvYcCUlaXK7EAF6jzW/RmJq5kQczBqc4v1YXPUJ1IyfPHR0XHEmc5uto1yzDKDt2UC1AvxPWeVn1r8bFtJv05w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yza9FOZeSeg5LgL+eu5zDkUS/xscN5iJLmTBSA1x8hH8lnXObMF
	ml0OlcqVhhGCHXfKMbn2LtsxV1uA6kOz867yWfWqehh0RNYc10xdaXOzcMDztlUMfzY=
X-Gm-Gg: ASbGnctuAOx/cn5KhlzvpkyS+m7g3oEfZoJUYV/FeBPFHjLDq9Ki8/viU0Bq3KPGGO9
	KxvFOYj3s+5FhW6yqiErDYjrdOXVaCRpDL8c0gJkSfH+HdXI/YSt18jzsUslbi69HMYo6NYxuoS
	FlGVJQr0h9cCO1ziBM8qnGxsHBgDgV+1vKPFRoEM9tqr01S+imXOlMr5dOgWI6HAeHMT8IBBeGu
	Dc0v9QZEfjlkUyxdNmYt5jbYUzNHnBdWqtxvXWYMVdDGDKhiTg6OLGyfKs26ijufC1TPxIC3L/N
	nGl3GVtz99HE39MORp3lC+MO/MCwiUPpQZMk81XbOCEZGvEgdTEOlqo3TofRIA5qhEU=
X-Google-Smtp-Source: AGHT+IF8J8y/ngnpoyOUShRv9/aJkdzYRnZ60F/4jSk31esEVM/l95MI9oTPjOP8gHOhRdPMBTj3gA==
X-Received: by 2002:a5d:5f91:0:b0:3a5:5270:a52c with SMTP id ffacd0b85a97d-3a5684cc429mr399383f8f.0.1749754273164;
        Thu, 12 Jun 2025 11:51:13 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a568a7f8f9sm113600f8f.42.2025.06.12.11.51.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 11:51:12 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:51:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, s32@nxp.com,
	linaro-s32@linaro.org, Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH 3/3 v2] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <957b91eb2270113a857474ddaa29c99198ed95ab.1749747898.git.dan.carpenter@linaro.org>
References: <cover.1749747898.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1749747898.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
Changes since v1:
* Drop the changes to ci_hdrc_imx.c since that part is compatible with
  the s32g2 chip.
* Use the .power_lost_check() callback.

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 67ff073ad806..d5389156e157 100644
--- a/drivers/usb/chipidea/usbmisc_imx.c
+++ b/drivers/usb/chipidea/usbmisc_imx.c
@@ -673,6 +673,11 @@ static int usbmisc_s32g2_init(struct imx_usbmisc_data *data)
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
@@ -1201,6 +1206,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
 	.power_lost_check = usbmisc_s32g_power_lost_check,
 };
 
+static const struct usbmisc_ops s32g3_usbmisc_ops = {
+	.init = usbmisc_s32g3_init,
+	.set_wakeup = usbmisc_s32g_set_wakeup,
+	.power_lost_check = usbmisc_s32g_power_lost_check,
+};
+
 static inline bool is_imx53_usbmisc(struct imx_usbmisc_data *data)
 {
 	struct imx_usbmisc *usbmisc = dev_get_drvdata(data->dev);
@@ -1430,6 +1441,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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

