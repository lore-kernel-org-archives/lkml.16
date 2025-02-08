Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4501DA5F
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 03:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738985078; cv=none; b=oLgkiwcsGlb85JEa8odmC52jIi2rIk+t3qV93NIUMfvj2Ok9gUNSai2l5X14+zQn2Vs14ynqT3lBbU14z3Y3MV9uw8umXADAUtuKg1GEUk46tP15fy8u6Iuon9XX3T5aGl4nMh26iVZ96bf0lx0GGeBclsrvJauYCHJETseamr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738985078; c=relaxed/simple;
	bh=thhMImcNjkBOZVN3411pEW3GYeb5l0VTXUUDiUnUpWQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G15Z1n1ABIPrX6EjnztWxHBaqrs5rpSu7Ja/4AagKiU3rGpd9isgdtWizga3HdODK+5yHWd3Xb1psDKMuaDIcznl4PANErbvZ12M9HNaKQ2/pdpEI+iiop17uwbUrt+BAME8BX7cloJK7Bp/jay03769Z9duzPdjHEp/jZxQC3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cQuxsSbU; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cQuxsSbU"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-30615661f98so28842421fa.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 19:24:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738985075; x=1739589875; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
        b=cQuxsSbUWSrGstyhWVkvDQ3KY2mQklY0+3v6MsbxbmMj8o9MBgViEIO6/YSIjaASnb
         HF1xmFtWamH2BPMk9Nmt0dnbioq9M3sSTB8Ec8sAFA0+F9WGX2DopJXG1wH2RXD2TSk+
         /u4SnctOF4HMvefgQ42H3NUaVaCNM2Q3L93KO1dRF/xfUMDUh6U/91JI56YELPSlp4ny
         7vnH7BBomWjGDAkSAA7a7ymqZGM339E5KQeBR6y6LZuKs2gR2R6nJpJ7Llsa16aZmAWn
         FehRxru9O2DOX9wXMcTYuNPLx/Qwg51nNU/Xx1Ty3exVNTG23Qstl4mLc3oqYxe1mWR2
         2Avg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738985075; x=1739589875;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tc6hvH16HL02+LBdNm0oBeAynWr7uQ4sq+3344BeoFU=;
        b=U21stQG0IO/ZQTVzSRxunQu4EI/5gu/AgbL5hNIJYaPbBYOLrXuqVPdpG71jTjvS8j
         k8Axrl/dl9jTTuDRn6quwUy/tgnsgAtjcEjyh8YVNti2UA1CdUaBpT2RXUldA3rcJXjf
         074D/nTFwpqWvk0IYaEXBLl0xgXUsz8oMm6+8mx/+1uJ4s65JNBVyoZZDpYScDNcGmo8
         GWs6QJr8pV7o29z5oN6hx53m9MgW2ocx6c2DA8eE6AjS9z01ai6BkkWYALQ9hA4PdMuu
         NnpinDt6NeA1Fg4pLbQSr5vEI15PKqwwGDdclyJ5BlRsmbZkAJUvFvudCVXttl1V4Y3R
         S3cQ==
X-Forwarded-Encrypted: i=1; AJvYcCWKgHlZa1uZItL8BK7dvprr5LSV3Ye7s78ytCeZ3oHn/E7LwmkkpUTSLG0wKbbjX6xc/Qj6VRoBD60Sqf4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYmL1/Xp4uvrhOF4yTaManVbqb0jsnLaruRjxDDo++z3/qP5Oj
	psMAoHzttoxJq+4iE7fvmYjitKiRqeuq49SF00BHxbApu8GnJF1jNGpQh7DIMh8=
X-Gm-Gg: ASbGncv7Taf850YEvu5jQRBYe+Apvy/xR7CfgsssYGlQ2QQreXnbyP0t5dqiu+p/mBJ
	QonZnFYGMxACSqNBp0pfCbkS2MJaWH0pcaGE2/n2w/xtgKt2hauEPHW/X4jF3L0pdfxTtVOmxTT
	jePF2tCl85jTtsseSw2aZnb8EXHAM+tRz/pg2P8CG6wT2Am/ZNYwpEkggcGw7HgpB4gk3Z4OFxv
	8sxP2G79Ek/rcTJfLvjdcj+oBxkny6YF/NG6otl8QoZUFslwCZTZ4v6sPOiuV/fJ/g06CGcJxU7
	GBybbIgFPFFDB6bZiCr8yjo5fT5YwHNBV7suZK/yb7egUHBAC44AsbGIZKlzkpuOPZnoiug=
X-Google-Smtp-Source: AGHT+IFydtUFynrK2gRpKzEKvd+/uEV8NSFd5so2WMhom1ky7+A67a+p0tJRz+0pk2ZePPqPbJ3Tsw==
X-Received: by 2002:a2e:a550:0:b0:306:1524:4a65 with SMTP id 38308e7fff4ca-307e57fed91mr19942481fa.20.1738985074455;
        Fri, 07 Feb 2025 19:24:34 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de1a67c9sm6260441fa.48.2025.02.07.19.24.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 19:24:33 -0800 (PST)
Date: Sat, 8 Feb 2025 05:24:29 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, Simona Vetter <simona@ffwll.ch>, 
	Simona Vetter <simona.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
	freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 6/7] drm/msm/hdmi: also send the SPD and HDMI Vendor
 Specific InfoFrames
Message-ID: <ry2jfdxhbogl42wbiajll5et5n2puvu46fn25v25qwpac7bbyu@wvhz3ijtfd56>
References: <20250208-bridge-hdmi-connector-v7-0-0c3837f00258@linaro.org>
 <20250208-bridge-hdmi-connector-v7-6-0c3837f00258@linaro.org>
 <9c35f577-2124-4f80-a5d3-542b47ed6825@quicinc.com>
 <7hpfx2whiyt5pjfcqnzmx5wllezlyttugmvqg2pg3be546m75p@5jfyw4z5wxsw>
 <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <af3fa1fd-122b-44e9-8e3b-48918bad7bab@quicinc.com>

On Fri, Feb 07, 2025 at 07:05:14PM -0800, Abhinav Kumar wrote:
> 
> 
> On 2/7/2025 6:04 PM, Dmitry Baryshkov wrote:
> > On Fri, Feb 07, 2025 at 05:31:20PM -0800, Abhinav Kumar wrote:
> > > 
> > > 
> > > On 2/7/2025 4:27 PM, Dmitry Baryshkov wrote:
> > > > Extend the driver to send SPD and HDMI Vendor Specific InfoFrames.
> > > > 
> > > > While the HDMI block has special block to send HVS InfoFrame, use
> > > > GENERIC0 block instead. VENSPEC_INFO registers pack frame data in a way
> > > > that requires manual repacking in the driver, while GENERIC0 doesn't
> > > > have such format requirements. The msm-4.4 kernel uses GENERIC0 to send
> > > > HDR InfoFrame which we do not at this point anyway.
> > > > 
> > > 
> > > True that GENERIC_0/1 packets can be used for any infoframe. But because we
> > > have so many of them, thats why when there are dedicated registers for some
> > > of them, we use them to save the GENERIC0 ones for others.
> > 
> > True
> > 
> > > Lets take a case where we want to send HVSIF, SPD and HDR together for the
> > > same frame, then we run out as there are no HDR specific infoframe registers
> > > we can use. Is the expectation that we will migrate to VENSPEC_INFO regs for
> > > HVSIF when we add HDR support?
> > 
> > Most likely, yes. That would be a part of the HDR support. At the same
> > time note, we can use GENERIC0 to send new HFVS InfoFrames defined in
> > HDMI 2.x (once Linux gets support for that). At the same time we can not
> > use VENSPEC_INFO to send those.
> > 
> > I can imagine that the driver will have to switch GENERIC1 between HDR
> > (if required) and SPD (in all other cases).
> > 
> 
> We dont have to use GENERIC0 for HFVS infoframes. We have dedicated
> HFVS_INFO registers for those.

Ack, I have been checking the old (apq8064) chipset.

> 
> > > 
> > > Also from a validation standpoint, I guess to really validate this change
> > > you need an analyzer which decodes the HVSIF. So was this mostly sanity
> > > tested at this pointed to make sure that the sink just comes up?
> > 
> > Vertex 2 dumps received HVS InfoFrame, so the InfoFrame contents has
> > been validated (validated SPD, AUD, HVS and AVI frames).
> > 
> 
> Yup, vertex2 validation is perfect for this!
> 
> Overall, I am fine with this,
> 
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
