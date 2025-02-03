Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7110720408E
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 17:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738603895; cv=none; b=hd/DMpJCJND6Wjt7fEGH0ck+nNRFI/gwTFFRiof21TDl28a97GU0giLIJ12ENcOVF73/gQq3hhvyduJwZbAIsY/oNBbSGVGuuqNKJb0gOlBJCF57Wd0PbKgEX8jI/GANmf77R7e7RehnehsU/QeKnhr/FaMGDzuJUdIWLIisHnY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738603895; c=relaxed/simple;
	bh=YDhUgtlTAwS0RUw95kPd9JoxS0ZWO9dvD7Jku166Tt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hkshwikwbh9ru1PyxmtI5B4TbEPwvLkeDInz1cq31bsIp+yyrDhcD8jhu+xwrlzCRnGtRzMYFD2kiSxhLMlxeYYgWYe0kxwu3IHGOJou8YAwMlHPcaX7PyITyTDj5+/I4moAcTmxZZIiB9hWKnqIs1QoAAd9JjgUmCbvGnw4meU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t24P9316; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t24P9316"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-543e47e93a3so4982143e87.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 09:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738603891; x=1739208691; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6J5C2NglTFNy0YpzDKyoh02/sMog3Gz9jf3ZxrSeYfw=;
        b=t24P931678LDgB+s2sBHZpIsNlMNDP0oCo2SCHo46E5E79nI4B4V39HDZNVPslfErR
         jNZGNXhJmVbW/lYv9BnmB/haYl/swEXYaTjaZyvr2CQEODZD6/4Z3vuRxkdKfGlfdGIS
         vtebGYVoJuU0gFeY7VlIRT3hLxDrlSExCo5hNcwM1RrNrikigRUSaXc39RH7pHFkheyL
         2v94bgdpHH53Cu0ZGRzHnXUwB7F0CCdYaj6AnLbLNlLSgMRC/q+YP9boN+QAc80zayAy
         b0G9nLn99/HxtEnlBkk7Bh6iEpCuIRfM0CRTjyK/RveuwOtJz4GY1w9uXXQOn6ULJc3V
         VotQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738603891; x=1739208691;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6J5C2NglTFNy0YpzDKyoh02/sMog3Gz9jf3ZxrSeYfw=;
        b=U1OyrBQMWaJQwuUGOvXRpKFN0YFO+zhD/3KFbTUb8uztk+f7RuMLoILLU0mppWmsaC
         eK1L8m6GZgVxmBRcGkEJVkkc48eYEe6X47ZNtbVVVXEQnvctOSyT86hpQlpc58gNETOM
         FK6tJCH1K++EWXmyESEP1SOfv1A3AcXiyMXMVf4dwynQOQtqIIVUj9MMGQpYNAgnGlPt
         f1AxvdmTij1ATw/oMv3ghaXHuURFi+6UJ+Xfiu/IU0GXXMgzeAzW0lZKb6aA8MCth+4X
         BxOuF7yvHyl1RMxm0SWS5KorW3tLIw1g+qgEaJTYtILuVfRD+zSbqJKG6x93tq34ahF8
         Dn1g==
X-Forwarded-Encrypted: i=1; AJvYcCWMzf8MSLRh3zwZ5mAxKk1wr/UXVWrahMozDxuUPI4eFHIwA0iDHgYv0VO15jC2HG5Fcf3zp0EQXyo8sF8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsW3sKVYJd0WLo09lTO/Xd/Q0qeHyai2oJW7AHyzu7Y1HvFLT+
	zpqqHjsipbUKkCbHEj8XTv4tokbNahtl13xvHVtNndqLAey6W/8SEajWDQbTJks=
X-Gm-Gg: ASbGnctC8EpBE0DWLa3hNSfXkA3Yiry2vUOmHw/5Mxoto8zF9IrJIS9uDsilD8+gezu
	kzjpWdhuEo4oune/iMn1RRkCfCI6CECaDAYN42Qrkd1DI5ZT7YV55fRHVF/lRVlLnv/IpRi24qJ
	ZOcjhYnkrtV3/1sKNeAFPeU5fGw1cJpmsQxkO+JRx5AjZ19i7l4YLo2su7Wxr8wOH//JxPawXgv
	mhr+eXy/bisrVVZkFpmOy5ATGQmi/xzg4hHpvlY1IzezBgsCmulMIL/mEQD/d0l/CN+uZfSpbVD
	aluUfrZZfP3oeX4jV6LLFhsmRTFiK+/V9J7z2hc68ddnaM98/qH3+F6B1bbM2LzUEY1vHIQ=
X-Google-Smtp-Source: AGHT+IFkNKZpMLqmFDZoDeQKhVlcO9/NhY+aFDQECzKLKClwYk71/Jrbal9oPP0TJgwbGI19n1UGFg==
X-Received: by 2002:a05:6512:3183:b0:542:8cb0:88a8 with SMTP id 2adb3069b0e04-543e4c3fffamr7547584e87.52.1738603891401;
        Mon, 03 Feb 2025 09:31:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543ebeb06bbsm1347935e87.146.2025.02.03.09.31.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Feb 2025 09:31:30 -0800 (PST)
Date: Mon, 3 Feb 2025 19:31:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Herve Codina <herve.codina@bootlin.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>, 
	Andrzej Hajda <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Dave Stevenson <dave.stevenson@raspberrypi.com>, =?utf-8?B?TWHDrXJh?= Canal <mcanal@igalia.com>, 
	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, Marek Vasut <marex@denx.de>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Louis Chauvet <louis.chauvet@bootlin.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [PATCH v5 2/4] drm/atomic-helper: Introduce
 drm_atomic_helper_reset_crtc()
Message-ID: <tk7ygprxgujdok4eo4iipmqs2bnsecxngltz2mk7kyqwl3ufpl@23rygh6g5iam>
References: <20250203161607.223731-1-herve.codina@bootlin.com>
 <20250203161607.223731-3-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250203161607.223731-3-herve.codina@bootlin.com>

On Mon, Feb 03, 2025 at 05:16:04PM +0100, Herve Codina wrote:
> drm_atomic_helper_reset_crtc() allows to reset the CRTC active outputs.
> 
> This resets all active components available between the CRTC and
> connectors.
> 
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
>  include/drm/drm_atomic_helper.h     |  2 ++
>  2 files changed, 43 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
