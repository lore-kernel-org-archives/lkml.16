Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36CCDBA38
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 13:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738762394; cv=none; b=DktAVjklMLtx5qPuaMT1MUk0paUjitEsC7qMX+BQFwKkThgpXIgIujsDVhjSEQEoLR+RvwLjSUbognH/qlnLAkDOvEeS14UD11X3fzO9FjlFr3d8KuVFCJYZhfUDke3AbVWKcr4PrV971luJNSRfPRjl8dwyO2xMfQMswGRPi9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738762394; c=relaxed/simple;
	bh=B0Av/YhtNfQ8E0kMwjFAVjEJd7htRepp1Cm98Y8Ac3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DCXI0WxI3JOaJ9pbTSyXdiqUZxrjapCkTqw4fw8FGRzqmAtqfvdzkUn+976tf287E8K8YASfIUnB4SsBgalTJ9XBF4udXN8WccWbS2abkSRD4ZDpdx2danDGGu3AwUD78Kr/ERwvfqG24jY5Fgd+oqDDjwoArbjTAU4c95U/1IM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D/h9YaiL; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D/h9YaiL"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3043e84c687so57294791fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 05 Feb 2025 05:33:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738762390; x=1739367190; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kdXlLzfvrhdUrBoR/jxzwmgrOFkrXyCts0ZtQTKixOA=;
        b=D/h9YaiLASMrgQi0qZD3LVsfQbgZpWv/WtUUTM/8yVk0zJuXIQ5MV39cOGC+yecjn7
         9Noo1dopHi2CsysaVktezpNFkH4afReROmfEHHteXi60hxw8p/1gbKlCnbbvrTwcvLd5
         e1cuLiqSBLbpG6lpuTMmgrCIUaqVlAB2yqtVNMmvaMSarMyVz0Luvyv3XAJo6zLwxXnI
         uMS37RcdlJvX1LYLgw6sxwrTk52HqbGubZdBXCjrZQUwqSnsJ8rejVLVNqbWIxYuRrTn
         /P4lOPqEkL32qN2DjvVUGvQMCVuFFxYW0EWeSn+LcDIj5AOybgr13UcuD8UgxcWmERiA
         ocwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738762390; x=1739367190;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kdXlLzfvrhdUrBoR/jxzwmgrOFkrXyCts0ZtQTKixOA=;
        b=uGGLLksbO7DD8w9M+NJG5eVZx1a8tkStYNOS2bR4G1dQ6z6TiRW5n7egvQKwKecHvI
         g/tVXMwuPWMJ18d9+MJlcUIZ4k75fN4hD+jegByXeFCJp1KZkRSdZrUh90YTxOay8Ivl
         kvuEc4MRwfOvE8MU2RXr0L4Ra10G7V63jc3/NiYhLMwYM3JzKLcE4yUFoHPNW+B5BUjD
         oJMaRh2jldIeeAstd+dPawC1C/BD7tBxSwehmL30s3WjYn3tvpZzFsrDy6pCzAdvEnEl
         SOCvySFr5B2FSj9IdKLd4wuMTpjKlH1ppH+oJPZsUu7RY1FlVQ/NZW8hzT/ieCSalHMc
         L3eA==
X-Forwarded-Encrypted: i=1; AJvYcCUi8FhV6x/6cuIpI2XZiMa5x0EO7Tpf/4AAMhxw0PgRcv0C5P2afM8V1xJtAuxZN7BXakx5gMSTLr9weRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGaEmaIjKVf4lMZ82JTc75zBTMl1Q7xkQiOulUOTz2HLNfz23L
	Rn7+0HsUCXlnGJHZd77SqXYBt6yzgtjPVg+6U4Jah9cRXJdgHeFUkLctbxT+Sig=
X-Gm-Gg: ASbGncsqVudW582+aEpVCRE41EaNlo53GkOsgSjEAulzNIfL/pirGzVc7BNnaa/SETH
	Wq+Qy7QqpxV2peBwQbOtuS5Soy041GImkJN/K3qCbJXCK7y6CHwhfnl4M8FvQzjSpnFC2n9NWV3
	rAL+GzPRGXG4y33C10fVV+M02RG0BA6MpggBUhJ91c+e+R0YAz5sPa+nGS7ohWXlwY2+V5jfnho
	ehMacrccHgZHY0Im/nBYw9F5MpEsJDf7KXxrkA8Q3aYeCDBVxp6Q0Hgwzbg+mnOEIP16oY9zpwo
	u7+YtCVPVt35r+OFkFH1aOrvAbGNP2H+TAFTKaJ8FhQjcxy3T6oQGKssRQQKdknV1PY2BDA=
X-Google-Smtp-Source: AGHT+IH/JpYkjPT4o1aH6hbWn4YaPtyuTEBB++cHyhx+jQWDgamHA0JZbGwRwQNMWS0IvcKLXactkw==
X-Received: by 2002:a05:651c:b06:b0:304:9de0:7d9 with SMTP id 38308e7fff4ca-307cf3146a8mr9900901fa.21.1738762390160;
        Wed, 05 Feb 2025 05:33:10 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307a30a522esm20942871fa.60.2025.02.05.05.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Feb 2025 05:33:08 -0800 (PST)
Date: Wed, 5 Feb 2025 15:33:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Harikrishna Shenoy <h-shenoy@ti.com>, andrzej.hajda@intel.com, 
	neil.armstrong@linaro.org, rfoss@kernel.org, Laurent.pinchart@ideasonboard.com, 
	jonas@kwiboo.se, jernej.skrabec@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, jani.nikula@intel.com, j-choudhary@ti.com, 
	sui.jingfeng@linux.dev, viro@zeniv.linux.org.uk, r-ravikumar@ti.com, 
	sjakhade@cadence.com, yamonkar@cadence.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: drm/bridge: Add no-hpd property
Message-ID: <h24gpx6cxm4s6gzcunjnswubtvqask5dewi3udulmntsuieklm@w3pw4ig3t7gm>
References: <20250205115025.3133487-1-h-shenoy@ti.com>
 <20250205115025.3133487-2-h-shenoy@ti.com>
 <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <efd89cf8-2f83-44fd-8bdf-aa348d4d9659@kernel.org>

On Wed, Feb 05, 2025 at 12:52:52PM +0100, Krzysztof Kozlowski wrote:
> On 05/02/2025 12:50, Harikrishna Shenoy wrote:
> > From: Rahul T R <r-ravikumar@ti.com>
> > 
> > The mhdp bridge can work without its HPD pin hooked up to the connector,
> > but the current bridge driver throws an error when hpd line is not
> > connected to the connector. For such cases, we need an indication for
> > no-hpd, using which we can bypass the hpd detection and instead use the
> > auxiliary channels connected to the DP connector to confirm the
> > connection.
> > So add no-hpd property to the bindings, to disable hpd when not
> > connected or unusable due to DP0-HPD not connected to correct HPD 
> > pin on SOC like in case of J721S2.
> > 
> > Signed-off-by: Rahul T R <r-ravikumar@ti.com>
> 
> Why are you sending over and over the same? You already got feedback.
> Then you send v2. You got the same feedback.
> 
> Now you send v3?
> 
> So the same feedback, but this time: NAK

Krzysztof's email forced me to take a look at the actual boards that you
are trying to enable. I couldn't stop by notice that the HPD signal
_is_ connected to a GPIO pin. Please stop hacking the bridge driver and
use the tools that are already provided to you: add the HPD pin to the
dp-controller device node. And then fix any possible issues coming from
the bridge driver not being able to handle HPD signals being delivered
by the DRM framework via the .hpd_notify() callback.

TL;DR: also a NAK from my side, add HPD gpio to dp-controller.

-- 
With best wishes
Dmitry
