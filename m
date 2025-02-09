Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7074328FD
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:13:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739067183; cv=none; b=B+iax9AE7pTLD5Xrmupa73Ax6tv5D9brW9L9ZfNrr2o9R4+WcVZmsN58O753DeDbMka3zV0jcc2jyWr+OErlxyB+eS0DEvYOyeIA3XH/vSbPsDgSDcHJ//2/7sw+MEr2lm/wiaeFb3sZzDB5azy3eDwGxbNF2gVSPVcvOpxOUis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739067183; c=relaxed/simple;
	bh=RPZ7/COgPN1Hm+VL18O1iF3ak6nsIbNK88a5ELIbIco=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nhcZtYWH9yiMUonSuc0nEg4iy9jFhZNDqWrej0afb+HiR5/Y/AB/cFD/5QfWL9ZqAaFnuZFa6aUZP8RJ+S4RbE0l46KCNA4JevOV4tFiwB77RAH12WcQQjLFtg1THvm83AY3mD8wohSyt35vkd0ZxXOMv/kY94PrLCtHAVYZpwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=t1v6qlz0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="t1v6qlz0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5450abbdce0so37366e87.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:13:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739067179; x=1739671979; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AalceiQZrK1g37TK/NrL9Qv/T7IdCcj8oK+SI0is+p4=;
        b=t1v6qlz0WE7ocJdBpA4MSFEiOrma35LpdnxL9FiWdspIIzyVun97hJVubNlcSzgVhi
         qh0WgC2TmiWKyMDTofM74tjMIaq8soAqc1yXnAOvWDq8mDFulN50a4IlCF2HqC1zV5bN
         R5ugdWu69yq1Jy1wy86G+nS61epAGQvwuF7sJRs3TCuia83PZqktKpPuY10EjaseC+zG
         Q+T1QhHpoIcy9rdiv3xHScX9hwEvGX7mF6j9D4Pd9rtyqaGo8Cq4AzYohfo/YVOxSm/m
         SBu93cnv0oRyQND0S1qnlH0TpHSXSpNDKUU9t1c04Kf1wE5liZr3zoVxcrcsywLozvJ/
         vEKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739067179; x=1739671979;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AalceiQZrK1g37TK/NrL9Qv/T7IdCcj8oK+SI0is+p4=;
        b=hf7I9AFshAi0uqH0eiiNrq3AvLYXh8Y+QOiKCduajy73AzHzcs1O4N28ubLoRdSiPR
         G5vaqhc1gXMt8wMiSxTQMiX05hbLuq2RflvT6rUB7VTv89yDwkWBnBsgYRdvs7+arVZ2
         vBzJrABwSAo9F8RaeCMQr6bvuY33wio3R/Lf0LO4ti5QX6LVINsZ9KGmXwk+ltRt1NKw
         L6vGf507mUvcbpzCoScz2ioI273cJh/8KaGXTRiOrdCjeHPIQoovPTEBm6hBRQEuM0Vr
         D/e1kyR7xcvbmLQYiNDhNO2bi5i1ZhbfH+jZmmVVGOrkhMWt/svPurfkpQ4L6/838MoF
         qgIQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyzQQKOmeq4Q9U8S9A10LbtmHuoZhV4YaafBajQfXYOIbqwV3INEmTi++2ct4qHBoM2wHu5/sguGny/Ik=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw60E1GJY/zkWvb9XxBdxVEDik6uuM2pEKzNk0PMITVLOPVVXsQ
	95thtVTQtLAslD0UPquwg09dTfx7XKZDtEm76bB7npYuX0scKKqEj4RVBHgZDL8=
X-Gm-Gg: ASbGncsn1641riNvOnEjUf3676kHNrModNROstj/8rVE1IySYSPHVnbl38ehv7sG/fs
	cxbFWk5cAtjYlHfbiWBBlxqfMG7oDIYvaNG3YgAJIH1KdQChEX3X/W7plautDW6nsDSqc39n0G1
	vdRbdFlQCo7Ysm4uThuLjEmk3nRcAQXa2JiyeuyIy2G8Cy5lTBd9j1A+0Q2h9nNj0XgBtgowxCy
	2AKD267b32x3R+TfTa1go1LvZgqBHRLYECSXj3xbqff7sybLPtlnA5U6ihetBaWQU8zc2LN9UEw
	GVbhfJuLdx90uDSkeJhn8N70p+BIn7l7w3XGodQyTyFLHHDKa+6SRChkR+B7QD8Stx0wc3g=
X-Google-Smtp-Source: AGHT+IGIzcCA0nFOVu73TILu83WflT1xWvuP7Qdk13bmuvhLtO8irRyNlKPlWULFpKUgZsCsaNjclA==
X-Received: by 2002:a05:6512:159b:b0:541:3587:9d45 with SMTP id 2adb3069b0e04-54414a96460mr2763506e87.4.1739067179437;
        Sat, 08 Feb 2025 18:12:59 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54506abb5fasm234745e87.25.2025.02.08.18.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:12:58 -0800 (PST)
Date: Sun, 9 Feb 2025 04:12:55 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 11/35] drm/atomic-helper: Change parameter name of
 disable_outputs()
Message-ID: <qmy6xmdl34u7ejdenri4foz5ksfypp52uvckkqgqsuczw3mvd6@ivdzm55hehqp>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-11-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-11-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:39PM +0100, Maxime Ripard wrote:
> disable_outputs() disables all connectors and CRTCs affected by a
> commit. It takes the drm_atomic_state being committed as a parameter.
> 
> However, that parameter name is called as old_state, which is pretty
> confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


-- 
With best wishes
Dmitry
