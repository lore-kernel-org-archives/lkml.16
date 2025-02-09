Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3C1714F70
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066615; cv=none; b=gO5OYFAv/v/NoxGqVip10y63KlvNYbF1H/P3mB2s7yPx4Ts0YxQMLm1Js8SeIbSnnBvsaKXVmNRDgIRJjPDtaFYcQhcT0kle1VKbdxbOxKw65Vihh5+pM8sA2qfmNmof7GGBmyqFoXHkYOsNCy5vS/OvHq+lV153l1khMfHmKT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066615; c=relaxed/simple;
	bh=hGZzmUVj67BngaC5ekQYqssPrhdbZ+utmRfNjGkC/Ks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IOU9UJi0MwzXrzyu6Y8Mp9RvcxdAToP5UuitI3cUE5JBq9RzMzK9z+M4n8yNMJo2Yh8kd1kJrtJbX09dYpUsQKWmvNsiw9PIGOfnX9cC5QieqhVpiyqchmfmaavDKtwrZxbaVlNY088o+BKv0Fq5xU451IDsfWixpSDdWAAg4gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mAXsqRrx; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mAXsqRrx"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54504bf07cdso1010095e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739066612; x=1739671412; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=s3AEv+HSIyGMm7v6esZWCBtFdqZLjSMRFXdAwcjD+tU=;
        b=mAXsqRrxN57+IdcsJsUP3FhVoUdm/nI++y6MgWWfdvpXVUFEwG3w7PDUnv787Runda
         FN3sDKm8WMcaTPxh9oUJLZltb3pVpD96QU4sd7Fb8+XSPO6w160ZSZQdeeYjpBJRmE96
         uUh/e/5cMc9LgtA7NXTlvAI3ntmFmWjfXCPPfpaQbKAAH4Srrww5yQqa8asQxk2+HIPK
         cOUpIzqTvf8OtpvaJ5aEdq3kinFb6M76k2ggnfQ7hFYTL+tZGT1zlwZ1U73smEiaO1EO
         Mq8XCRk3NBGizcOmvxQGSNr0n1LakX5bDUzlRZv+wHk8xrqU17WDnJ/EzL3DITsYRxp0
         NM2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739066612; x=1739671412;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s3AEv+HSIyGMm7v6esZWCBtFdqZLjSMRFXdAwcjD+tU=;
        b=dD+RYc0L1kKgtewWQG/NsUaLZ7f41I+gZ14Q4yPpzD00WNkfHFUzmjODxOiUh3uo5S
         G845mS4qzR9D5KLVFszRwHJD9bDFFmwSeO+2RV1xSZsTmqrtDY2LzWIQZ/w4yJ15jKJw
         H5THjEdwk/sgFeMGSr1XzJQ1362/i6MoaB636+LaDa65oD5zH/P7uPAMYUlNAEEo6J7T
         RhTz0teL5Wssvx3gcIwr6/msPSg1+6HoLgb3AKnzmqCBKAJVdQ9lfTYeFwgaAY+CVo2z
         fjfri1jIlX9Gdl67LrMQVJvpnriDGJz1zX1ZqWwP/Z6sSG0vCER69HQSGjfhFa5I1+xB
         n9fg==
X-Forwarded-Encrypted: i=1; AJvYcCUcDUTEeoPOkKwOJJqkhPpmtjAOt4/rVte3Ow2T1H/A6JAD8Vn4zV3rvkQJ2s3vmXWgvgiP+S8mqncLics=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3tfV8Wuc4KIZ2qoGiuhrUb82ag+j6/glw95PgZQhWSD6K8mfD
	iAVkv9iLb4YqnNIfNAizk4O524hwMrEVUE/fvwyyjuoCy6MsQ5a8NFDuB1NMB9U=
X-Gm-Gg: ASbGnctcWagifDIQk2kSOAhbh/YpqhHiMjzFGW3UTl3ukzMpwUqbAj8sWS/baeuWeT8
	jkzHmgdA9fBxVHJy37kpZeQX5kP310FTPJJ80agEIXLKW3Lo7sPiZP3+0ecxl6QEDLCQxrXzi9l
	Tp4akOiIxzuUFl94FelIi/mZTc0YsjL44r2ALY/R6ALVMF8zIej1sEmjDzD+Q4qnRJ/jyH0wf3G
	8AZ1v7bBzae0m587yGFFcL+cQcrsf+L7WznVXm5sG4DJpXmfMF3rFRq2bSNy9IxglkH1SVAwaSa
	o2mkjQIuunFQWe3vh6s3/0mHhLONXXMj5x2MK7nfUlBesdWj+JAECYvVYvRF04S1oclVthk=
X-Google-Smtp-Source: AGHT+IFuNgUYuYuxDQfQ7GcGQX+uKB3srf0MZr5mCBeZD06wF/230+YnQJjKbWZ9J4J0XTQuOQozLQ==
X-Received: by 2002:a05:6512:1395:b0:544:13cd:bf2 with SMTP id 2adb3069b0e04-54414a964f2mr2851649e87.5.1739066611243;
        Sat, 08 Feb 2025 18:03:31 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-544105f2ef1sm854191e87.188.2025.02.08.18.03.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:03:29 -0800 (PST)
Date: Sun, 9 Feb 2025 04:03:27 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 09/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail_rpm()
Message-ID: <acnyys2ddbxhdtigqeorltfxhobptx337kxn3tcsgslb3ehvht@ycz6nwi2kkb3>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-9-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-9-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:37PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_tail_rpm() is the final part of an atomic
> commit, and is given the state being committed as a parameter.
> 
> However, that parameter is named old_state, but documented as the "new
> modeset state" which is all super confusing.
> 
> Let's rename that parameter to state.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
