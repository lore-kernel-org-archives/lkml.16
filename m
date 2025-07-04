Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78A5B150997
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 01:20:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751592045; cv=none; b=ZZG5rky/UpMbk1Vu27JHEkClX44Kw3vEt8K3CiaQhrmmx7zaCqJAq/YHGGGx0qZuGRUBaahc6qLL2wXJ++nHbMIVHHUKUxdCp4ffoBS9RAToVgARoTq1F/NmbMScpaoHeUIjmu9guc9PUqJ954jzY5rr1GLXe/kjlbeoNGAiMww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751592045; c=relaxed/simple;
	bh=SvgUT28YQtbYTyXeSDYnGb4dD2amcrqqud8uqK2y2Ec=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=la8KZ6eRzq6JExwS2BVvOxcMK88+NHVg3/DhAxKy6CFefypX09pOGbWv/Rdfg8VxU+ktlZdd9405M5LNkNI2cBtNX2OvMHRPJxJR0EL7P6m9XVTwDAx+m/8qs33M3zy6WTUkZtmnHT1OgJGsuHVxfmmtM42jMb0I9GcRH2LEhew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZCv+jFkL; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZCv+jFkL"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7382a999970so315951a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 18:20:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751592041; x=1752196841; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=ZCv+jFkLEwv0adnsM9nMRTash4Hg/SJYFtCIuemx/P9gg+v9tzJn3b1JQ7+1UTKLko
         IvmIice+c/dBrRqB4+YdHWdiK5wD3Mrngq21mzYQGSo7VVG/jJ4fZYLx7WWGE4hLmg9Q
         KO6+eYQdRizICy1TdbplJd7HFNZV38NdDSwTI7FQY2DK8V5VLRBdVqU++j4U1WkOk8pk
         wbcVK6vog3ZFkrDvTvquUYx/WZImVH3oQoEKztFxebo7U4FjjhHjrS0bULc9ZudrSnp4
         EaYuCHc/JTnX18dTUamY4SUfof87FmxvhWbc0JZi4b9Y7XFdTqbL71RDVSXGIg9YzqQr
         qYiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751592041; x=1752196841;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5zByC6Bd1xD5NQdxKZlsMbHMCFrJLh3d5i7fkNR6uL0=;
        b=Ah8VjIoTcEYM+7M2QlZBJJaGHcaK2bf+Sv90i0NtV4Xmgqb2vCsxfvS8nbzWQu5PqN
         8on2BRdcmYffVZuSE6TL3Z+lDR+4Fbqlpx/BRSHrYlHoLeqN6Bx3XnQEQg9GvUM1xPCh
         XcffBNztlps64crrZZJhJlQ7we8aJTrf9eZZ76iKjF7J/IeHffGw6DR8YadRWbr/apw6
         Ey+s406gGYv3tqT+7aFe7I4WJForTMWH6fFJewATcfUJerI3cmfXs358mByM7ZNBH6V1
         Snrflzo9edaeV5hulhZKxcJHwtGDM0iO6UjROxbZuQEyVEVBOhyQA0VU+vda+8GtaDF0
         CKOg==
X-Forwarded-Encrypted: i=1; AJvYcCXR5WxDCPlJdVdaXC1AdKTYaYtpSndPG+sc8gbReQE7oprZd3B5H83nrk2eQ03g/fWtqOdEqZVj32PURt0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVO5bjboPHrLuQ4g0JfvWwoWyaEUlI/G629NJFiXtYIlEj0L58
	btRAUmYD3Rvvy3fwssLDrYxcfucZvi2aopurcTTI7Ug9oCe6tbGQ7Q4hx1Hlb4tLXMs=
X-Gm-Gg: ASbGnctbpTVVw2yc3uaXnMxLiHaV0qbAVpWNzZkfQuvcfCBmstNr9ZRZ72PCy650Eie
	A+xGY7NTpu5pPczHNAtJ6EXbe+cmUSi1OtYaErj5cyVS3uUK8k5dq0tfROmOvjRb6LZnf/mRdBa
	IK5lD0jI2da2L4C6OkEMc9EMnTT8Wu5AgiD34/7PPqxyulQblp4VAM+f+Ra06+v/Rbh6PCSFdbg
	aISVeLTdd9ld85Cq/YnMRySa09E9Orb2fDNB6uINrK8bofRB0TcIMsk+kloMNkY3U1qMad+L/U4
	uRbsum50K/ENJy6IbahCwi+089HirjlqcOc68nSGpQMUWTMh8OdhiVwT2mG8Ynbl+ohp3g==
X-Google-Smtp-Source: AGHT+IHh+how27xFPi3jlyY66JrJHeNp1IVUr1F4gL3pyWo/92sd3tMtxnIq687N17nvaqy2j2xmcA==
X-Received: by 2002:a05:6830:2b14:b0:727:24ab:3e4 with SMTP id 46e09a7af769-73ca48e3741mr340463a34.9.1751592041579;
        Thu, 03 Jul 2025 18:20:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:1ed4:f8f7:2a8d:77d5])
        by smtp.gmail.com with UTF8SMTPSA id 46e09a7af769-73c9f9628d8sm203282a34.60.2025.07.03.18.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 18:20:40 -0700 (PDT)
Date: Thu, 3 Jul 2025 20:20:39 -0500
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Peter Chen <peter.chen@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-usb@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, s32@nxp.com, linaro-s32@linaro.org,
	Larisa Grigore <larisa.grigore@nxp.com>,
	Ionut Vicovan <Ionut.Vicovan@nxp.com>,
	Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Subject: [PATCH v3 3/4] usb: chipidea: s32g: Add usb support for s32g3
Message-ID: <1733ae21-7257-4fdd-8249-7eaebbf769a2@sabinyo.mountain>
References: <cover.1751591078.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751591078.git.dan.carpenter@linaro.org>

From: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>

Enable USB driver for the s32g3 USB device.

Signed-off-by: Ghennadi Procopciuc <ghennadi.procopciuc@nxp.com>
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v3: No change

 drivers/usb/chipidea/usbmisc_imx.c | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/drivers/usb/chipidea/usbmisc_imx.c b/drivers/usb/chipidea/usbmisc_imx.c
index 27a3127db4f6..9a1c97ea5463 100644
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
@@ -1200,6 +1205,12 @@ static const struct usbmisc_ops s32g2_usbmisc_ops = {
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
@@ -1429,6 +1440,10 @@ static const struct of_device_id usbmisc_imx_dt_ids[] = {
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

