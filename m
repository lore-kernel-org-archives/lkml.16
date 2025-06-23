Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA6072BDC34
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 16:18:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750695516; cv=none; b=WFyqI7rz6PgE5yTxol2S7ihL7tuH/NE/pqgLa718DSuJiLOCFANDB1shBFniqCWmFpi2gMARWS/ipre+U4C9MXG5fKjln7VlXI0BasS7/CsUBh1GWEIeTj3fIkZBoNPN9L6BWOwrnihZhoFXT50mWu+GXc2yEwMgPH0y4657WrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750695516; c=relaxed/simple;
	bh=zchNO3HCWwoFQnDoUAapWNGzqAw5TG5DYK0U++aFf80=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kYaEoTkCO/TAzFpHtC+86lZtZllwr3bqKApDKvfi4ImEDsz0Cv/D/VTuFb5NXAFncjYRayd48OZFiIQxEOdXm1ghfNj7LWh5oyXoK4VgxtmNolrzE/bwPYolOh43LmicNHZrbchCkNqZ6jBOR+1MAvhmRIhwN3BF3ZtNl41SIAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLktB6Ax; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLktB6Ax"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a54700a463so2426959f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 09:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750695513; x=1751300313; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8P4BKlF0L91nBpuIvtJw81/Y/F3X1v/6aoitvWQlibo=;
        b=mLktB6Ax9g0d336NQ+evCmXaeniWsGy8mQ6vvA8i/N8Pk2OwU1Cd/5fET3ZKD8+ci6
         37Jb+gr+u8niADoWwrssc2X5Ys51rSinyt6bbvJETDeLvAszsAppxtGovdj/yQtiCc/V
         apQ/UVcZ9N64osjVBmimytFdSNPU8M7YAYhobFgGdefXQ50tKJn7qZsCQYGMNNqFRFCr
         SmhSbj/cslmDdZAhc0HbT0CYEX0V6psUvtHuyESoGPIl5ctyvvsi6DP4BvDd30iT9MHC
         KCsfNJNH15neu/ix0zLekkx7Cr9GhjJFTFcqtjbyy1oBPT5/7+vZvOdlIXujY39jePEy
         ARgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750695513; x=1751300313;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8P4BKlF0L91nBpuIvtJw81/Y/F3X1v/6aoitvWQlibo=;
        b=ItOZjllfxxvzeXbCcQwckHlUEW0JJ2apDUGkUSoSyIuRJ6JqE8SzyRNbgo/hMQAXbE
         UUumEYioO3yKdIxIGsvuGdoBk41IYISzxDpGj21s5LY9iYpl1OBfrGb8jfcMmoXLalhD
         84OakIE5auePxSxQYdxR5NQWlCefgVsK7tjpHLA5+L47ayW1yjwACtYPdzOBVVNgBV1V
         AD1v9nt4Iv4M7PucEosDC0PMBtAT2RvgWqaGilXG/pSC1BRQeCLzxxXuR/Lj8R/MFOS7
         4xBDVY4hFUrCoIzSg/EbzwtSFP6lBba5k5SL8ZZdyIamv2bLeHESXQBB0IhF9v5Hx4GA
         VHpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKai2oF17U6Rp61pq//JFLnY6Kv4W0BfjtlTPlatwJ9SVYPLkCsa6OtPFVZAn4SXd1YYdK8e7Qo32oKlk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHi2GZWadxw8NgH99SorUbVmz72l0r0prws4VWarMe0NvQYfHw
	adKtfYTajytedFsZz+ItphyA3srp5EsJcn0Xqttty3c27DulF7yTbtrfDQjfkdkpUfU=
X-Gm-Gg: ASbGncvNj72QlPJ9iJAp0mPpy7fuv/WbPgsTmb9e3L9xQe/3HXxfWyN308FlHuQ8hf9
	JvML8NcgfM7nyUU3+ejsLr7r26Ehq+2PegCQcTpvu0Fksu7esqi/Nx4NSkvNhoAqtndhXd8Mxzu
	C1hc0u80ku7HuiL4qkiyLdfsXZgShpDQ+xfe4JFI1wyA/YShWXSg2FK4e8KgTMCAADCKBZRh6Sk
	q4cXog5EmhifZnv/DXYkczbvprsx4COxXMqmobO/OiTQrYhLeUuT7Wc8dCV72cX6qsr4CNRw4Ln
	XfZlxKFfKH35gWjksqAwX1jgTbGFCKoKSXESH1MG13wJD1aZgb3kjE1fGUjkDlMSX2IDiud3TA=
	=
X-Google-Smtp-Source: AGHT+IGRAHfzz02yaZCUQ4NgxRMmn6Ic0SvW0VIh60ro1+UYsZHIgHMHFSGMA6Pf56q88UTsOQG+Ig==
X-Received: by 2002:a05:6000:2882:b0:3a5:23c6:eeee with SMTP id ffacd0b85a97d-3a6e71ddb32mr130435f8f.21.1750695513111;
        Mon, 23 Jun 2025 09:18:33 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff21:ef30:b3ca:db17:bc4f:ae5a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d0f1054bsm9701697f8f.9.2025.06.23.09.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 09:18:32 -0700 (PDT)
Date: Mon, 23 Jun 2025 18:18:27 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Xilin Wu <sophon@radxa.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Sean Paul <sean@poorly.run>,
	Marijn Suijten <marijn.suijten@somainline.org>,
	Hermes Wu <Hermes.wu@ite.com.tw>,
	Dmitry Baryshkov <lumag@kernel.org>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH v7] drm/msm/dp: reuse generic HDMI codec implementation
Message-ID: <aFl-U-QX4T6retMq@linaro.org>
References: <20250423-dp-hdmi-audio-v7-1-8407a23e55b2@oss.qualcomm.com>
 <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4E62D52FC6135E5B+a6b1634e-5c66-4db5-bb1e-bf64e2e8d8a2@radxa.com>

On Thu, May 29, 2025 at 10:40:12AM +0800, Xilin Wu wrote:
> On 2025/4/24 01:52:45, Dmitry Baryshkov wrote:
> > From: Dmitry Baryshkov <lumag@kernel.org>
> > 
> > The MSM DisplayPort driver implements several HDMI codec functions
> > in the driver, e.g. it manually manages HDMI codec device registration,
> > returning ELD and plugged_cb support. In order to reduce code
> > duplication reuse drm_hdmi_audio_* helpers and drm_bridge_connector
> > integration.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> > ---
> > A lot of DisplayPort bridges use HDMI Codec in order to provide audio
> > support. Present DRM HDMI Audio support has been written with the HDMI
> > and in particular DRM HDMI Connector framework support, however those
> > audio helpers can be easily reused for DisplayPort drivers too.
> > 
> > Patches by Hermes Wu that targeted implementing HDMI Audio support in
> > the iTE IT6506 driver pointed out the necessity of allowing one to use
> > generic audio helpers for DisplayPort drivers, as otherwise each driver
> > has to manually (and correctly) implement the get_eld() and plugged_cb
> > support.
> > 
> > Implement necessary integration in drm_bridge_connector and provide an
> > example implementation in the msm/dp driver.
> > ---
> > Changes in v7:
> > - Dropped applied patches
> > - Link to v6: https://lore.kernel.org/r/20250314-dp-hdmi-audio-v6-0-dbd228fa73d7@oss.qualcomm.com
> > 
> > Changes in v6:
> > - Added DRM_BRIDGE_OP_DP_AUDIO and separate set of DisplayPort audio
> >    callbacks to the drm_bridge interface (Maxime)
> > - Link to v5: https://lore.kernel.org/r/20250307-dp-hdmi-audio-v5-0-f3be215fdb78@linaro.org
> > 
> > Changes in v5:
> > - Rebased on top of linux-next, also handling HDMI audio piece of the
> >    MSM HDMI driver.
> > - Link to v4: https://lore.kernel.org/r/20250301-dp-hdmi-audio-v4-0-82739daf28cc@linaro.org
> > 
> > Changes in v4:
> > - Rebased on linux-next, adding DRM_BRIDGE_OP_HDMI_AUDIO to Synopsys QP
> >    HDMI driver.
> > - Drop outdated comment regarding subconnector from the commit message.
> > - Link to v3: https://lore.kernel.org/r/20250219-dp-hdmi-audio-v3-0-42900f034b40@linaro.org
> > 
> > Changes in v3:
> > - Dropped DRM_BRIDGE_OP_DisplayPort, added DRM_BRIDGE_OP_HDMI_AUDIO
> >    (Laurent, Maxime)
> > - Dropped the subconnector patch (again)
> > - Link to v2: https://lore.kernel.org/r/20250209-dp-hdmi-audio-v2-0-16db6ebf22ff@linaro.org
> > 
> > Changes in v2:
> > - Added drm_connector_attach_dp_subconnector_property() patches
> > - Link to v1: https://lore.kernel.org/r/20250206-dp-hdmi-audio-v1-0-8aa14a8c0d4d@linaro.org
> > ---
> >   drivers/gpu/drm/msm/Kconfig         |   1 +
> >   drivers/gpu/drm/msm/dp/dp_audio.c   | 131 ++++--------------------------------
> >   drivers/gpu/drm/msm/dp/dp_audio.h   |  27 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.c |  28 ++------
> >   drivers/gpu/drm/msm/dp/dp_display.h |   6 --
> >   drivers/gpu/drm/msm/dp/dp_drm.c     |   8 +++
> >   6 files changed, 31 insertions(+), 170 deletions(-)
> > 
> 
> This change breaks DP audio on the qcs6490 platform, tested on kernel
> next-20250528.
> 
> [    0.368035] [drm:dpu_kms_hw_init:1173] dpu hardware revision:0x70020000
> [    0.369359] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> dai_count 0
> [    0.369362] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> Missing hw_params
> [    0.369364] hdmi-audio-codec hdmi-audio-codec.0.auto: hdmi_codec_probe:
> Invalid parameters
> [    0.369366] hdmi-audio-codec hdmi-audio-codec.0.auto: probe with driver
> hdmi-audio-codec failed with error -22
> [    0.370536] [drm] Initialized msm 1.12.0 for ae01000.display-controller
> on minor 0
> 
> Manually reverting this change solves the problem.
> 

Try applying the following patch, the current code in next/mainline is
broken and de-references some wrong memory. Probably pure luck that it
ever worked during testing. :/

https://lore.kernel.org/dri-devel/20250620011616.118-1-kernel@airkyi.com/

Thanks,
Stephan
