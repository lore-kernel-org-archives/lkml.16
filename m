Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFA3A1547E9
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 15:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738767678; cv=none; b=mGIyTANRSCklWVFTtyTMsWbZmMxmpaaINmNC6YE6HFxQUtcnyeCPcF8cEekzonQnZt2qskhSj2WjT26XEbWzedAdjbP9K/UxcUqtbH6sAByNkqGzSVeZR+tq9bTx3+TpJlJE1QGaoRMtjLJybEOGBWvj6Mkdm/2g0pKvsB/O8fg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738767678; c=relaxed/simple;
	bh=22plA7bX8AT61mXklLfsCcUwTcszdF+agPUh/x0jof0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VoSG35f1jLBQOUw1Tkj/QrjMy3o8YTP6GVVSQeD94TUT6Yq8Chs4t2GB99d2aBva4u2Iu/9erIqfuoU864rpitScM5OXWjekdIgSKq92u2VtQPX0ZwQvOaTC1wgX9FGScPI9IIzJo5tEWvyRAR/XGAemWwYDeCtZYSG72tHSRbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UrTbb9ss; arc=none smtp.client-ip=209.85.167.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UrTbb9ss"
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5439e331cceso2149826e87.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 07:01:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738767674; x=1739372474; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2iiUwhEUuvrx+e9EPTkARMUQldF3wsCMXBI7aQHdo0A=;
        b=UrTbb9ssUbtuezqUfL6oiJtyBm7/Y2f5ZWiPLR/dBpUsdvZ4bYxZO0UExPS0E2scHj
         RAWx9lkO2elz2vDykbdBsMr/sN/2tZ5TehP/W8IaPTrjozxWapheg3tLok2whlhHnhLz
         QxGbn6NzhdY78ibfQdjZoS5J7PTO3rROF+JuMAVa3uM7M3vS5pScXffIp5q/UwpBdLH1
         6tqdyvU9nM2mgQ1BjcnopqSM0oDA14ZMoJA9d3TRLvZKMxyfya+MhgPmSNDDrYpTfFih
         /SGCAIDSNZFSCWBSyFRCHsjDlqUHGQ9B/7NenYqgZj9M3vexs3T0iPyMWQEGyPcjofyb
         jqTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738767674; x=1739372474;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iiUwhEUuvrx+e9EPTkARMUQldF3wsCMXBI7aQHdo0A=;
        b=HRv+eX8fCoW1vxVtryZg3JDPnDOjynlAzuKHfFulqzsoFeO5irxvphyFKEPmCMItoW
         lF5GFAlMhjg7YTnJzm9wC9EYm+i0UemgBmy3agy/Tjh/WwhrYU7QJgOaa0lue1rJEAHZ
         b9J0DGfyRg8j8oeImZ9WtmkeUBib4FpwAC75v3sH7ZcnLwGl1cPcUMmEP7jyZd0SJu1p
         T4MpAIznLPbkj33c3HjOGwnwxpomJDfihI2AmuiEUpW3B2HiST4Tq3sUtXPH9xYJufiC
         Q/8KpGlJ5zO1yENWEpKbsXducRpm1AKnzYrMcnnP5FexHcJZ8XlQNqMG3VYNwN50xVft
         xitQ==
X-Forwarded-Encrypted: i=1; AJvYcCWsvKFPGieOH6C3v8O7GsLGbrUdt7o8VnlUWJr3tmE6kWCFeZxTH3k85PGUoYRsnVQpzLpYO4ZcpBcVOcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Lj9FweefjKevx8HM2XJYJ9FFw3nUAkGlOP/nGiJl6Q21tXMq
	JE98nHEXgmqOweLhhy4dN+ms5ys3hcSi/djBdfy2fhq++BYFZQo4L2uzVft3Zus=
X-Gm-Gg: ASbGncsIbeJPcKaf3/dy0uXBWydulkgTyDJZxKWnbFyKCxXuLN4Sr5wBOmnwVy4jleI
	f88NkJ3IryvjdvDK6WMgvLSIzBHeDXdtTpOsWzcx844J2u1WHE7opkMF8sBkEvrEuJ55yH1qwEM
	6fxWzsyc+3iY713lepgO6ipM0UNbCWQT165plWlNAGLPINGC56vfxragDWpglMYbLYF8qiB0Vl8
	mlY831Ck25UZ3M2hlSRwdy2yAbJpNGUxl8dy2Z4v1WJFbiEJZzBxdzpCRh6U1QKGJ1seWNQrkZM
	KI+tVApn+e2HrkasafigYqqxhtZbRC8tKedywkuUxOzyitnrQ38VNr4ncShJiIBEmsi/MUM=
X-Google-Smtp-Source: AGHT+IElsqa9xy5jxkugGJVRTB5ttsFGIdJpMqycOFUMEvUIFjeG1L4EhW/9jwyNNNjVBW0TkJy2dw==
X-Received: by 2002:a05:6512:138b:b0:542:9987:6e9f with SMTP id 2adb3069b0e04-54405a69a97mr955721e87.53.1738767673396;
        Wed, 05 Feb 2025 07:01:13 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebdf11f8sm1894666e87.33.2025.02.05.07.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 07:01:12 -0800 (PST)
Date: Wed, 5 Feb 2025 17:01:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Dave Stevenson <dave.stevenson@raspberrypi.com>, 
	=?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/10] drm/display: add CEC helpers code
Message-ID: <j2ej27mzia326q6fjqk2c3xui6dhbx2chswjjmgaoxgiajstl2@dcmgdtkzbjht>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-2-5b5b2d4956da@linaro.org>
 <ylahtg54vvrpg5rzp3z5oyi37mtblj3hn4pzwylcimfakrzy3m@idqczwb3hvxl>
 <lme4jqksg7djyrxwpo3x363vlsyhld22co3tfsthniistnrm5h@kbygscfa7afr>
 <20250205-smoky-fearless-hornet-cbf422@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205-smoky-fearless-hornet-cbf422@houat>

On Wed, Feb 05, 2025 at 03:27:05PM +0100, Maxime Ripard wrote:
> On Tue, Jan 28, 2025 at 02:17:19PM +0200, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 11:36:06AM +0100, Maxime Ripard wrote:
> > > On Sun, Jan 26, 2025 at 03:29:07PM +0200, Dmitry Baryshkov wrote:
> > > > Add generic CEC helpers to be used by HDMI drivers. Both notifier and
> > > > and adapter are supported for registration. Once registered, the driver
> > > > can call common set of functions to update physical address, to
> > > > invalidate it or to unregister CEC data.
> > > > 
> > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > ---
> > > >  drivers/gpu/drm/display/Kconfig               |   5 +
> > > >  drivers/gpu/drm/display/Makefile              |   2 +
> > > >  drivers/gpu/drm/display/drm_hdmi_cec_helper.c | 209 ++++++++++++++++++++++++++
> > > >  include/drm/display/drm_hdmi_cec_helper.h     |  61 ++++++++
> > > >  4 files changed, 277 insertions(+)
> > > > 
> > > > diff --git a/drivers/gpu/drm/display/Kconfig b/drivers/gpu/drm/display/Kconfig
> > > > index 8d22b7627d41f7bc015decf24ae02a05bc00f055..49da9b768acf3e5f84f2cefae4bb042cfd57a50c 100644
> > > > --- a/drivers/gpu/drm/display/Kconfig
> > > > +++ b/drivers/gpu/drm/display/Kconfig
> > > > @@ -82,6 +82,11 @@ config DRM_DISPLAY_HDMI_AUDIO_HELPER
> > > >  	  DRM display helpers for HDMI Audio functionality (generic HDMI Codec
> > > >  	  implementation).
> > > >  
> > > > +config DRM_DISPLAY_HDMI_CEC_HELPER
> > > > +	bool
> > > > +	help
> > > > +	  DRM display helpers for HDMI CEC implementation.
> > > > +
> > > >  config DRM_DISPLAY_HDMI_HELPER
> > > >  	bool
> > > >  	help
> > > > diff --git a/drivers/gpu/drm/display/Makefile b/drivers/gpu/drm/display/Makefile
> > > > index b17879b957d5401721396e247fa346387cf6c48a..2cd078e2b81c1a9e6b336c4187b444bcb8a50e51 100644
> > > > --- a/drivers/gpu/drm/display/Makefile
> > > > +++ b/drivers/gpu/drm/display/Makefile
> > > > @@ -16,6 +16,8 @@ drm_display_helper-$(CONFIG_DRM_DISPLAY_DSC_HELPER) += \
> > > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDCP_HELPER) += drm_hdcp_helper.o
> > > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_AUDIO_HELPER) += \
> > > >  	drm_hdmi_audio_helper.o
> > > > +drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_CEC_HELPER) += \
> > > > +	drm_hdmi_cec_helper.o
> > > >  drm_display_helper-$(CONFIG_DRM_DISPLAY_HDMI_HELPER) += \
> > > >  	drm_hdmi_helper.o \
> > > >  	drm_scdc_helper.o
> > > > diff --git a/drivers/gpu/drm/display/drm_hdmi_cec_helper.c b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..a6ed5f0fc3835b013a83308f5285ea0819c5702c
> > > > --- /dev/null
> > > > +++ b/drivers/gpu/drm/display/drm_hdmi_cec_helper.c
> > > > @@ -0,0 +1,209 @@
> > > > +// SPDX-License-Identifier: MIT
> > > > +/*
> > > > + * Copyright (c) 2024 Linaro Ltd
> > > > + */
> > > > +
> > > > +#include <drm/drm_bridge.h>
> > > > +#include <drm/drm_connector.h>
> > > > +#include <drm/display/drm_hdmi_cec_helper.h>
> > > > +
> > > > +#include <linux/mutex.h>
> > > > +
> > > > +#include <media/cec.h>
> > > > +#include <media/cec-notifier.h>
> > > > +
> > > > +void drm_connector_hdmi_cec_unregister(struct drm_connector *connector)
> > > > +{
> > > > +	cec_unregister_adapter(connector->cec.adapter);
> > > > +	connector->cec.adapter = NULL;
> > > > +
> > > > +	cec_notifier_conn_unregister(connector->cec.notifier);
> > > > +	connector->cec.notifier = NULL;
> > > > +
> > > > +	connector->cec.funcs = NULL;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_unregister);
> > > > +
> > > > +static const struct drm_connector_cec_funcs drm_connector_hdmi_cec_funcs = {
> > > > +	.unregister = drm_connector_hdmi_cec_unregister,
> > > > +};
> > > > +
> > > > +int drm_connector_hdmi_cec_notifier_register(struct drm_connector *connector,
> > > > +					     const char *port_name,
> > > > +					     struct device *dev)
> > > > +{
> > > > +	struct cec_connector_info conn_info;
> > > > +	struct cec_notifier *notifier;
> > > > +	int ret;
> > > > +
> > > > +	mutex_lock(&connector->cec.mutex);
> > > > +
> > > > +	if (connector->cec.funcs) {
> > > > +		ret = -EBUSY;
> > > > +		goto err_unlock;
> > > > +	}
> > > > +
> > > > +	cec_fill_conn_info_from_drm(&conn_info, connector);
> > > > +
> > > > +	notifier = cec_notifier_conn_register(dev, port_name, &conn_info);
> > > > +	if (!notifier) {
> > > > +		ret = -ENOMEM;
> > > > +		goto err_unlock;
> > > > +	}
> > > > +
> > > > +	connector->cec.notifier = notifier;
> > > > +	connector->cec.funcs = &drm_connector_hdmi_cec_funcs;
> > > > +
> > > > +	mutex_unlock(&connector->cec.mutex);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_unlock:
> > > > +	mutex_unlock(&connector->cec.mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_notifier_register);
> > > > +
> > > > +#define to_hdmi_cec_adapter_ops(ops) \
> > > > +	container_of(ops, struct drm_connector_hdmi_cec_adapter_ops, base)
> > > > +
> > > > +static int drm_connector_hdmi_cec_adap_enable(struct cec_adapter *adap, bool enable)
> > > > +{
> > > > +	struct drm_connector *connector = cec_get_drvdata(adap);
> > > > +	struct drm_connector_hdmi_cec_adapter_ops *ops =
> > > > +		to_hdmi_cec_adapter_ops(connector->cec.funcs);
> > > > +
> > > > +	return ops->enable(connector, enable);
> > > > +}
> > > > +
> > > > +static int drm_connector_hdmi_cec_adap_log_addr(struct cec_adapter *adap, u8 logical_addr)
> > > > +{
> > > > +	struct drm_connector *connector = cec_get_drvdata(adap);
> > > > +	struct drm_connector_hdmi_cec_adapter_ops *ops =
> > > > +		to_hdmi_cec_adapter_ops(connector->cec.funcs);
> > > > +
> > > > +	return ops->log_addr(connector, logical_addr);
> > > > +}
> > > > +
> > > > +static int drm_connector_hdmi_cec_adap_transmit(struct cec_adapter *adap, u8 attempts,
> > > > +						u32 signal_free_time, struct cec_msg *msg)
> > > > +{
> > > > +	struct drm_connector *connector = cec_get_drvdata(adap);
> > > > +	struct drm_connector_hdmi_cec_adapter_ops *ops =
> > > > +		to_hdmi_cec_adapter_ops(connector->cec.funcs);
> > > > +
> > > > +	return ops->transmit(connector, attempts, signal_free_time, msg);
> > > > +}
> > > > +
> > > > +static const struct cec_adap_ops drm_connector_hdmi_cec_adap_ops = {
> > > > +	.adap_enable = drm_connector_hdmi_cec_adap_enable,
> > > > +	.adap_log_addr = drm_connector_hdmi_cec_adap_log_addr,
> > > > +	.adap_transmit = drm_connector_hdmi_cec_adap_transmit,
> > > > +};
> > > > +
> > > > +int drm_connector_hdmi_cec_register(struct drm_connector *connector,
> > > > +				    const struct drm_connector_hdmi_cec_adapter_ops *ops,
> > > > +				    const char *name,
> > > > +				    u8 available_las,
> > > > +				    struct device *dev)
> > > > +{
> > > > +	struct cec_connector_info conn_info;
> > > > +	struct cec_adapter *cec_adap;
> > > > +	int ret;
> > > > +
> > > > +	if (!ops->base.unregister ||
> > > > +	    !ops->init || !ops->enable || !ops->log_addr || !ops->transmit)
> > > > +		return -EINVAL;
> > > > +
> > > > +	mutex_lock(&connector->cec.mutex);
> > > > +
> > > > +	if (connector->cec.funcs) {
> > > > +		ret = -EBUSY;
> > > > +		goto err_unlock;
> > > > +	}
> > > > +
> > > > +	cec_adap = cec_allocate_adapter(&drm_connector_hdmi_cec_adap_ops, connector, name,
> > > > +					CEC_CAP_DEFAULTS | CEC_CAP_CONNECTOR_INFO,
> > > > +					available_las ? : CEC_MAX_LOG_ADDRS);
> > > > +	ret = PTR_ERR_OR_ZERO(cec_adap);
> > > > +	if (ret < 0)
> > > > +		goto err_unlock;
> > > > +
> > > > +	cec_fill_conn_info_from_drm(&conn_info, connector);
> > > > +	cec_s_conn_info(cec_adap, &conn_info);
> > > > +
> > > > +	connector->cec.adapter = cec_adap;
> > > > +	connector->cec.funcs = &ops->base;
> > > > +
> > > > +	ret = ops->init(connector);
> > > > +	if (ret < 0)
> > > > +		goto err_delete_adapter;
> > > > +
> > > > +	ret = cec_register_adapter(cec_adap, dev);
> > > > +	if (ret < 0)
> > > > +		goto err_delete_adapter;
> > > > +
> > > > +	mutex_unlock(&connector->cec.mutex);
> > > > +
> > > > +	return 0;
> > > > +
> > > > +err_delete_adapter:
> > > > +	cec_delete_adapter(cec_adap);
> > > > +
> > > > +	connector->cec.adapter = NULL;
> > > > +
> > > > +err_unlock:
> > > > +	mutex_unlock(&connector->cec.mutex);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_register);
> > > > +
> > > > +void drm_connector_hdmi_cec_received_msg(struct drm_connector *connector,
> > > > +					 struct cec_msg *msg)
> > > > +{
> > > > +	cec_received_msg(connector->cec.adapter, msg);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_received_msg);
> > > > +
> > > > +void drm_connector_hdmi_cec_transmit_attempt_done(struct drm_connector *connector,
> > > > +						  u8 status)
> > > > +{
> > > > +	cec_transmit_attempt_done(connector->cec.adapter, status);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_attempt_done);
> > > > +
> > > > +void drm_connector_hdmi_cec_transmit_done(struct drm_connector *connector,
> > > > +					  u8 status,
> > > > +					  u8 arb_lost_cnt, u8 nack_cnt,
> > > > +					  u8 low_drive_cnt, u8 error_cnt)
> > > > +{
> > > > +	cec_transmit_done(connector->cec.adapter, status,
> > > > +			  arb_lost_cnt, nack_cnt, low_drive_cnt, error_cnt);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_transmit_done);
> > > > +
> > > > +void drm_connector_hdmi_cec_phys_addr_invalidate(struct drm_connector *connector)
> > > > +{
> > > > +	mutex_lock(&connector->cec.mutex);
> > > > +
> > > > +	cec_phys_addr_invalidate(connector->cec.adapter);
> > > > +	cec_notifier_phys_addr_invalidate(connector->cec.notifier);
> > > > +
> > > > +	mutex_unlock(&connector->cec.mutex);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_invalidate);
> > > > +
> > > > +void drm_connector_hdmi_cec_phys_addr_set(struct drm_connector *connector)
> > > > +{
> > > > +	mutex_lock(&connector->cec.mutex);
> > > > +
> > > > +	cec_s_phys_addr(connector->cec.adapter,
> > > > +			connector->display_info.source_physical_address, false);
> > > > +	cec_notifier_set_phys_addr(connector->cec.notifier,
> > > > +				   connector->display_info.source_physical_address);
> > > > +
> > > > +	mutex_unlock(&connector->cec.mutex);
> > > > +}
> > > > +EXPORT_SYMBOL(drm_connector_hdmi_cec_phys_addr_set);
> > > > diff --git a/include/drm/display/drm_hdmi_cec_helper.h b/include/drm/display/drm_hdmi_cec_helper.h
> > > > new file mode 100644
> > > > index 0000000000000000000000000000000000000000..cd6274e4ee9b3e41a2d85289c4a420b854340e19
> > > > --- /dev/null
> > > > +++ b/include/drm/display/drm_hdmi_cec_helper.h
> > > > @@ -0,0 +1,61 @@
> > > > +/* SPDX-License-Identifier: MIT */
> > > > +
> > > > +#ifndef DRM_DISPLAY_HDMI_CEC_HELPER
> > > > +#define DRM_DISPLAY_HDMI_CEC_HELPER
> > > > +
> > > > +#include <drm/drm_connector.h>
> > > > +
> > > > +#include <linux/types.h>
> > > > +
> > > > +struct drm_connector;
> > > > +
> > > > +struct cec_msg;
> > > > +struct device;
> > > > +
> > > > +struct drm_connector_hdmi_cec_adapter_ops {
> > > > +	struct drm_connector_cec_funcs base;
> > > > +
> > > > +	int (*init)(struct drm_connector *connector);
> > > > +	void (*uninit)(struct drm_connector *connector);
> > > > +
> > > > +	int (*enable)(struct drm_connector *connector, bool enable);
> > > > +	int (*log_addr)(struct drm_connector *connector, u8 logical_addr);
> > > > +	int (*transmit)(struct drm_connector *connector, u8 attempts,
> > > > +			u32 signal_free_time, struct cec_msg *msg);
> > > > +};
> > > 
> > > Why can't we merge drm_connector_cec_funcs and
> > > drm_connector_cec_adapter_ops? They look equivalent to me?
> > 
> > Well, not exactly. The funcs is a generic interface. Notifiers do not
> > need the adapter_ops. And cec_pin (sun4i) would also require a different
> > set of callbacks. Thus I decided that it's easier to subclass funcs
> > instead of adding all possible callbacks there.
> 
> There's two things here: cec_pin and cec_adapter are equivalent. They
> provide the same feature, but one relies on an hardware controller, the
> other bitbangs a GPIO. They are also mutually exclusive.
> 
> So I'd very much expect a different set of hooks there.

That's the point. Normal CEC adapters would need to implement these
callbacks. CEC pin adapter will have a different set of callbacks.
Notifiers do not need any extra callbacks at all.

Maybe I should restructure the patchset, pushing helpers closer to the
end of the series.

> Then we have the notifiers.
> 
> AFAIK, it's useful when you don't have a CEC hardware and need to
> coordinate with an external block providing the feature. Again, I'm not
> sure why we should share anything there.
> 
> Can't we just duplicate the function names?

Which function names?



-- 
With best wishes
Dmitry
