Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62788C2FA
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 03:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739071906; cv=none; b=Fl7zmafLADxmwlm/OS5Xg+1qlO0gKWWUEP1UP/eMvjsSpNha6c20ByioTrWN0U+4mQlaFxTY+KNWQa6yj8L14Ui4BJlnspjU/1tDlmskFYQPcnqYo9pr+QTJancVtCKeFg8JN/vzODNw1Ymg72e4SNzljwWEdQTycbFASE8nsOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739071906; c=relaxed/simple;
	bh=Hae1ExZWDnlPr0rzzdPuklPQlkbJMftjetjwMM1H+Og=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=afP7j3vVUThTYhg8IYVvtB5tNkUnxo3SiTLQlErt7MNggEw3mqoNJD+73vyOYhUR66PioMkapIXYTT9B8SPcQHc1O7Y3PGYfkDIXXcY+IxnB1t6I0GkrnwiU9TTgS6hwtYDvKLp17Z3eHOsHNOA8lJg2OJSMWvKkc9b3ebUnxLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=P1rwP4aI; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="P1rwP4aI"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-308a559bdf7so18821671fa.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 19:31:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739071902; x=1739676702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=28IEsxjLPW/17EuEuU+kwykv943l5wZ3TOeqG+jMPnM=;
        b=P1rwP4aIWBYxHBHChbTbhoJpIXQhhJvIqu63xSXt++PoLhSOgX3f1sX5tNh+6kWH5/
         +/8EIx/dPICJvu96CN3ARHuMcHjjtWj+gbqzdGfffD7j3Ei+UUOvx1DNjogyJw8h3Zvu
         m9r4lmZL2Y4xqCDFvQQRrCvQhheIzEb/ajZNNxYbEnSKhAm1rhZoTs846VaWqA9ea41F
         BokjCzO8ZTuLIWp8G0rbH0HGJhPubXJh5YjVgFRevzQepUaguZ8yiaWZaUDPbhM8gRcE
         698tkHfMPHhavEb5wwPia2UQnlzjnqnkRohhX73XmafSUBuFISs/guFnvx3YCMJELlsb
         Hsdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739071902; x=1739676702;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28IEsxjLPW/17EuEuU+kwykv943l5wZ3TOeqG+jMPnM=;
        b=DrG0IVAXN0ANRBXA0kliWQSLMwjkT3QLf30kLiMH7LFfmEQTJG5WXK5cAY0c9p0ZOP
         wWf8PsxKPg0rEAnSzWlkaEbBoGtwFWlePtrZjNHEYBL9jhLJ3k6a95UswxNOA7KNhBK/
         /EAytK+qOzouxZjddku1m0VIqZVro07tzhQ22cEhaFhoVY1RsNGQRLP62qIfXFi3l1Q0
         bwURP6v0edvQigV0NbOVu0UQVjDqxfml4y9ulODdKfxk+k+N8cxBOxrLhDsRqad4eySg
         fK1moHboMLWv+LROG35jHPdxUIYlt52jn01W3XXkpFHo6qdOQKjo01aizNausCrYL3Py
         s8Cg==
X-Gm-Message-State: AOJu0YyF0eqhPZZbsiXQE7QK9/ve9cWkOwIJ8HoKqwvgzv+fUmd4PO4e
	rT0y6+AgcctskuHKZLG4CAMmV+jucZFNAH11T6RDBdtRWk4LAJT+AuFlfxD5P1Y=
X-Gm-Gg: ASbGncuBY5MtVDxvY5mcpYSYDCuk8VDzN9P6UNAXPQvwlxJqueHSRIzSu/DpIPrzGk2
	GdydeDPVKFnEUS/bahZjgvbRhkIg2lJeZru04BATxAeorTTtoUKT1F8D+qUlhesOioy+78RKYu+
	fwnAiKaJwCEOp0ozbt4HDe1v1ie32NHK/7o7fPAQo+DR/gmH8Si+4/k6TDWtw/LHc44MDPPQvyu
	cF7ppKQNIhN6naN97D9d3mWYiLBQJe4L8lG2kfKHUcdnSNaYb9H0nFcZG8QbBQEY3dpEaE831tt
	euAuwbjWQ1bziOLwsso/hMTXAaDqf9LswZ1MoWrrjeM8c0xCQoCG8Y7E3XUdS5XMfYoSmPg=
X-Google-Smtp-Source: AGHT+IFiG9OlyfSDN9Gbzge8HDkG084NNv3XQuhDjBxeTaCVWE6puHcqHZdRNWTexmpMoVSUwZacRg==
X-Received: by 2002:a2e:9147:0:b0:308:860e:d4d3 with SMTP id 38308e7fff4ca-308860edd40mr21033071fa.22.1739071902274;
        Sat, 08 Feb 2025 19:31:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-308ec25911csm21241fa.57.2025.02.08.19.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 19:31:41 -0800 (PST)
Date: Sun, 9 Feb 2025 05:31:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Liviu Dudau <liviu.dudau@arm.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Hans Verkuil <hverkuil@xs4all.nl>, Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v3 0/3] drm/i2c: tda998x: move under
 drivers/gpu/drm/bridge
Message-ID: <qd7stwkjqqwrozddbllgz7brme5udfnncaltpacmxgemvj34vd@fdqtyokt7ktv>
References: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250113-drm-move-tda998x-v3-0-214e0682a5e4@linaro.org>

On Mon, Jan 13, 2025 at 11:53:43AM +0200, Dmitry Baryshkov wrote:
> TDA998x is the HDMI bridge driver, incorporating drm_connector and
> optional drm_encoder (created via the component bind API by the TICLDC
> and HDLCD drivers). TDA9950 is an I2C-CEC translator, being present
> on-die on the TDA9989 and TDA19989 chips.
> 
> Move TDA9950 driver to drivers/media/cec/i2c and TDA998x driver to
> drivers/gpu/drm/bridge/.
> 
> Note: In a comment for v2 Hans has acked merging these patches through
> drm-misc(-next) with no additional immutable branch.
> 
> Note to RMK: I didn't change that, but I'd like to propose to use
> drm-misc tree for this bridge.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
> Changes in v3:
> - Dropped irrelevant sentence from the tda9998 commit message (Hans)
> - Link to v2: https://lore.kernel.org/r/20250110-drm-move-tda998x-v2-0-ef2ae5832d21@linaro.org
> 
> Changes in v2:
> - Moved TDA9950 driver to drivers/media/cec/i2c (Hans, Laurent)
> - Moved TDA998x driver to drivers/gpu/drm/bridges istead of tda/ subdir
>   (Laurent)
> - Link to v1: https://lore.kernel.org/r/20241215-drm-move-tda998x-v1-0-7817122b1d73@linaro.org
> 
> ---
> Dmitry Baryshkov (3):
>       drm/i2c: tda998x: drop support for platform_data
>       media: cec: move driver for TDA9950 from drm/i2c
>       drm/i2c: move TDA998x driver under drivers/gpu/drm/bridge

Dear drm-misc maintainers, is it okay to apply the patchset?

Hans previously (in response to v2 cover letter) acked mergine of the
CEC patch without additional immutable branch.

-- 
With best wishes
Dmitry
