Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39BD22F42
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 18:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738175573; cv=none; b=BF24PUwEstkoxP4CRvkFVezLKA+x2kFSiFFz/YK89e2xE6+CBU/g+wNnBuqs75NXlZ/Am/snE6XRGv+Doar4+6WHfWfP1LPf9Agn/qdtSQ6hbvRjI1qtALAjxXc8bWrS329Dfu1LhkP/0SQaEsLnbQXhsj9nxQO89ZQ80y9Tgyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738175573; c=relaxed/simple;
	bh=+SMty8+4sZp+DGOIBfixCCxd1+w45yVQVSqe/od6eaA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aLhx2fR8wjGDk1UcoBTz5AMaKb/uUd04KFv/ZkLq3M9X3V35r8VciRs0yHZAaxDBg8v0xoyl0I0HmeRdSaa8Uf2H5pUXohckoeIEs4+5QsdSAHHlyfpU0yPcGwaCkKo6QCOeXcmm1D9o+oxNM4oifSjpEfHghd0y8+2VbHshO8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Xb3Ai4i6; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Xb3Ai4i6"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-30036310158so59925601fa.0
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 10:32:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738175569; x=1738780369; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WQDGTjwpOWFF/+TOhFhnEF0nvuu2y0K3Bho/f1lI2U=;
        b=Xb3Ai4i6I3yZpjPVQ6VslcEtCdcoISF1NSQ1CEnUmQWD4Caw2t96sdz0gJe/bD2NHa
         Xhoy8FEYcvAS/PUTr50oACBvny0LOpMSmL0RGWcaEpUHUuvqljpMYn05P+Ux+F3Pff5T
         WN6TxJkBoJa8/UMUoZ3oEftyBVvmPkyJp9CfYD9t+MxGfMTMN0D0ZVwPL4R7Ev43e+iD
         /HQWCZCNu1J2n4/aVWJPYW1IJfzO8pcBnPxqbeq27cp27iLwVpSa+vRiQ16Lr/cPuqGp
         uKXjdw2YuC+G7m4FOu8YI+Z0p1L04IOam5j7VXSBkhEKA2Z/sf/XQANJbxKjuRRb511k
         lbpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738175569; x=1738780369;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0WQDGTjwpOWFF/+TOhFhnEF0nvuu2y0K3Bho/f1lI2U=;
        b=bxaxtXhMsBpvEmxHl6JF5pLu3scO/F+noxu0UfzMT/n0l95YFtW1tQUffsOY+HiS1H
         XmZjujgCBvTDwX2f68lvzO/bbHnUz2tNCNUn8rvNWI26tJ0SVkv2/HGGm05q61ckpg+E
         8VjWUhB7DDLcvDZZCekxbmG80EGlT2UeNRrTPE4CzHp6uT69PmnrG6l2zeDZqsAVpbdb
         nh60pgxd2iCyLR5/UjJrFeWm+KVAJFcbzd34r4Rws0JybnfSJqfIuFZHHWRgl9+6qB3O
         wxosdnjctiOFN7ZiSZ7JR21LlyBPJo0V6qbzQj7r+aqy0IUw6LpxoNNKzSpw0zdkLWpY
         rf7w==
X-Forwarded-Encrypted: i=1; AJvYcCVh1zPrv2UdaY7jeKHRY72/fPJB/ecPu2klNA6VGZfEY0pvibUFfts/DfZXsfmkIP2xM9yeMwtXswCXQFc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+eRXrpnfkxKH0IMXLk+ierLO2oDXvIwY8hQvF56/1KHOzTn5
	laotUfEuXWJwKfE9rhSjHArX0wZ0SSMi3KIWIF5X/UGjAda/PruWOPtEnqsokKQ=
X-Gm-Gg: ASbGncuCzE4mI5VmcWslznrP5sd5qQq6PudxfirYSZblXZlGd9ZLQLfDqG8CGCYbStv
	iJHEIp5WV9JYq2rHXFATtSKoHgyX9+JQxDudrSpAQde8rf+eVAxNQ9VrEDw+RT/S61LJhdosePb
	wtDZ0WgGrgxC/VysmeFKzH5RSfYBNEewYFf6KP6jRKF9+t+bZTRja30Ym+hgpF4q2bQa6A+xjcj
	Fc1w2r2H48bV4Dhi6VwZiu9pRaseNQiwB0c1KygAi0HCHeYprDyQ2k+tj+l9R4gX/aD92UB8yIX
	urCU7jqqOomOoliPwFMlsifCkXYaEhCAdvuphy1A9c7Rs7qJEFGHW5xVI0guksFPKDZX51w=
X-Google-Smtp-Source: AGHT+IElTnwSVKi6MZo+1NGIgBsRRnCn8N7AxB90A4mEzyT0dXpC8YcetBNofgV4M57HJJ4zOMTZqw==
X-Received: by 2002:a05:651c:2125:b0:302:3e14:34c8 with SMTP id 38308e7fff4ca-307968f8e4bmr17478991fa.22.1738175569097;
        Wed, 29 Jan 2025 10:32:49 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3076ba6bd3csm22097091fa.21.2025.01.29.10.32.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 10:32:48 -0800 (PST)
Date: Wed, 29 Jan 2025 20:32:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Maxime Ripard <mripard@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 08/10] drm/display: bridge-connector: handle CEC
 adapters
Message-ID: <abbyf3h4weoshu63mrdwy4vmm3z4t3vb74ikvcnk3lhptlxhm7@bdcj4a3cxpzu>
References: <20250126-drm-hdmi-connector-cec-v3-0-5b5b2d4956da@linaro.org>
 <20250126-drm-hdmi-connector-cec-v3-8-5b5b2d4956da@linaro.org>
 <j5vgb5kcjs2ax3kws6rlbcca57set22ncj6onvgbm4xwjtw43t@uplzdjywzrkr>
 <qe7cm52nozxvawm6yjzbvfarwoiokpwkr26s66tkypgrsztc7t@vnzbek6i4qhr>
 <c676ef1a-3b08-4342-b4da-d0b525f2f55b@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c676ef1a-3b08-4342-b4da-d0b525f2f55b@linaro.org>

On Wed, Jan 29, 2025 at 05:44:31PM +0100, Neil Armstrong wrote:
> On 29/01/2025 00:44, Dmitry Baryshkov wrote:
> > On Tue, Jan 28, 2025 at 05:14:06PM +0100, Maxime Ripard wrote:
> > > On Sun, Jan 26, 2025 at 03:29:13PM +0200, Dmitry Baryshkov wrote:
> > > >   /* -----------------------------------------------------------------------------
> > > >    * Bridge Connector Initialisation
> > > >    */
> > > > @@ -633,6 +711,21 @@ struct drm_connector *drm_bridge_connector_init(struct drm_device *drm,
> > > >   			if (ret)
> > > >   				return ERR_PTR(ret);
> > > >   		}
> > > > +
> > > > +		if (bridge->hdmi_cec_adapter_name) {
> > > > +			if (!bridge->funcs->hdmi_cec_enable ||
> > > > +			    !bridge->funcs->hdmi_cec_log_addr ||
> > > > +			    !bridge->funcs->hdmi_cec_transmit)
> > > > +				return ERR_PTR(-EINVAL);
> > > > +
> > > > +			ret = drm_connector_hdmi_cec_register(connector,
> > > > +							      &drm_bridge_connector_hdmi_cec_ops,
> > > > +							      bridge->hdmi_cec_adapter_name,
> > > > +							      bridge->hdmi_cec_available_las,
> > > > +							      bridge->hdmi_dev);
> > > > +			if (ret)
> > > > +				return ERR_PTR(ret);
> > > > +		}
> > > 
> > > Maybe we can use a different bridge feature flag to trigger the CEC code
> > > support instead?
> > 
> > it is possible, but what is the possible usecase? DP drivers should be
> > using DP_AUX CEC instead. And I think there are no other kinds of
> > bridges which implement CEC support. Meson driver does something strange
> > by registering CEC notifier from meson_encoder_hdmi. I think instead
> > this should be moved to the DW HDMI bridge itself
> 
> It was done before bridge_connector has any support for CEC to keep the
> functionnality, I'll be happy to switch to this.

Well... Converting dw-hdmi to use all HDMI API is going to be
interesting anyway:

- iMX8, iMX6 attach with flags=0, so dw-hdmi creates connector (with all
  its fanciness).
- Ingenic and RCAR-DU use simple drm_bridge_connector, so they will just
  get all new features.
- Meson uses drm_bridge_connector + additional bits on top of it (like
  CEC, max_bpc, HDR).

Either we end up with a monstruous commit that reworks dw-hdmi _and_
drop extra bits from meson driver at the same time or we need some
well-thought plan. For example, first make some of the features of Meson
optional and dependent on their generic counterparts being registered by
drm_bridge_connector, then convert dw-hdmi _and_ use
drm_bridge_connector internally, finally drop extra meson features now
consumed by the core.


-- 
With best wishes
Dmitry
