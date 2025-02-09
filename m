Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875F64C7C
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066506; cv=none; b=V4j0GZkO4vSSCxKmeXkBAxiNS4UVJUHmOf+NW2+dHyeyQxZVd1om3AT9xEwXftVD5bT8/ZizVzRwaAmpe/gZ5S5v+6X1DFJL7L1uTuuw8JkmKPicEn2GRBUOHRUMGYolDjADhaifDEd/fbeE81pleHhwURTBKD84OmdpZr90PKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066506; c=relaxed/simple;
	bh=THGZ8Vrsa2RzqHUTLLeUQHBwhUf+BdwCqd63mIVa3I8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK5ZjtfnUer0A7MdrjIytaxS7hbzyp1Bx5J3wBt1/PkcVbC6dEDY/r6sE5I4jCkPpBQxJU1DBwZruTStDu5EwDFfJ4YnW/4g/0WE8POSFZ2RaagthdgXyu3HfWnhkeZ3CUN/XFIJkYe3ZGQ+pWnhwCgeMoy8GdJ/hXoUSO/tuUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=EfHyiwnx; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="EfHyiwnx"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5450622b325so680934e87.1
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:01:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739066502; x=1739671302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2PGp1XgnxteHu9RdPhVH5sY4q1WTjnO00NTGkJChuoM=;
        b=EfHyiwnxizO/5EZij6ZWEixRVBMwpEs/HqtsX+LbLaQoz+vP+VBWf755xR99vSw+aE
         oXvliuP2kdO+mMNs7umHFKDS8t5jY2I1ouW5rdZDfT2f0OMJ0azNCuynIH8Hr5FIQLqI
         xJCY4Ao5ryaoDTOujFGP7riCOG9EZ3bYRggtMrfJGtGFJvBXk58KO9ttippWPTrREs0G
         gfRX4jEeS7j+EQx9RQRbGnCkQIumHtFcUm7xL/YXe8a/I4Ef6LfVn4U3L6a5B1lFzPFY
         LsOwiu0sIoFzUlHe4bSGX4fK1t0CRhoeDNqj5ayhGjyirVOKLUMaJofg3bEXyqrbZ2Xn
         UJBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739066502; x=1739671302;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2PGp1XgnxteHu9RdPhVH5sY4q1WTjnO00NTGkJChuoM=;
        b=k4wTExDjoVRSmR0IrE++lxnRr7NB7K46UQOPAeJb+wuDx/wpFSaZ43k6o+u6mx2b1P
         M3nrybfxysKcQVjK5IVFAqy9QA0/lFK8L+sTpkUzmLWkDPYXCitmDssCXoJdbpwiCpFA
         5lcFkLQDzeMZjNxdcluMOkFXF+M+8dkVM+1cVDLefKXwtVW9f/jSxflVsgdZDf7ldPL+
         /BO1InIz7KPXLaov9iZzP9K60KDf2e2JbZTaxfq0g+YkVD2uljMR9y18kQgwy5w6zSSD
         QnNuPiFr32X51i0KSVt20F5A3ZsQi7g5+XO1qcXJXxVGtE3GIQhZy1gDXiiGdYyLOa51
         OHOw==
X-Forwarded-Encrypted: i=1; AJvYcCXKt98wVZuyzy2Q6OFKNxV7UayIgXGJboz8zVxnPqD/4r4kzxsMhBLb85BLAvBV/kvy2FqbxvQL8oRJwps=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz40PuJgrm5hs6DQjB7Sz7kguuo3aSY1gHnFVHSs1VkxYeJVwev
	hdpqOlIV5QOAcNiSNY+hZqaiG75/oRvNBQqhbR/ukHWyky9yEGnKuo9/BZ+q4o4=
X-Gm-Gg: ASbGncuoddR/TIV+PwmO8nqm3aLj5XH5vu7rnZlVF2myPi+yXieVwCq2JmH7+sHGh9z
	kiF2YMomvh4/nImtyDkEZtBeQcc1oBdfm2DmSLwlfkcwHxQ5L7Y08Vly5m1qadVMSI8kLRcKluD
	fOPfZnsHqCmehjYjjYho/jq6bYYho3hGOdtrk/yIFakDSJCQPoDnb8atUAv85/RsTJ3Tn0u9PZu
	zwJMRJAiFwFBZmnLS16TtJv/ZLXHpfMJoR5cHOI2+w32eviO1NnBuSC6QmTj9B8umEajsJ5XRcd
	ZWpOVcnUd89FAFRkqaK6+Uz+zq3aw5cHaw7e7uHxuZ2AKvsnd1Jw/zVIW3o/Vx7r3vsSPrE=
X-Google-Smtp-Source: AGHT+IGJS1+g4puxkPbuLs8WIzLmSKlUfwG5DYlgVtVpvbpfwu+I92SkzuZNAQBNdSTJnZpCoPa0/A==
X-Received: by 2002:a05:6512:159e:b0:540:1c18:4e38 with SMTP id 2adb3069b0e04-54414aa88bemr2594802e87.28.1739066502582;
        Sat, 08 Feb 2025 18:01:42 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5450a36fa4asm28876e87.167.2025.02.08.18.01.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:01:41 -0800 (PST)
Date: Sun, 9 Feb 2025 04:01:39 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 07/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_wait_for_dependencies()
Message-ID: <ttjrs6vggvbwc7rprctmkigjusd6gog4pxysicxdxtweeojflp@zm7nh7zvfq5q>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-7-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-7-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:35PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_wait_for_dependencies() waits for all the dependencies
> a commit has before going forward with it. It takes the drm_atomic_state
> being committed as a parameter.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
