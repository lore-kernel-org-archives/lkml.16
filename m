Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF45819
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 01:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739064061; cv=none; b=BhkZPN6P1kfp94XsHcSodGaJJgWkeKy6biy5r6l6/bv1oxYUI0/hx15oPOSksoivhhy/7phwvgITOZ/7g9plrG8k1MRT2Mp8jH444YkIU2ZaV0lgmXzNKm6//zST9In84dUbei3/1Ma7DUn38TvakY3/28EQpZh1f16iLcZ2bb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739064061; c=relaxed/simple;
	bh=0yT4kCguKthCX77sHnaX2cmW9VUop5SJXnZ6SnY+D5s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=obUjm/g0FDUF73LcTYlqXfDrSmMICiL6odOgnITL6YZ2GGhD2blM8xqOjbI0MQtn6FIv/8OHb4r+z+swkj08brpTpoe6az2iciFHhUQISNNG7DTAtcgSrN+BJRq9NX2Vo0tnRMIezOHW5GbxRrC7QU8KyiNfT2PIU4R8Tkceb0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=L6mWWCqA; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="L6mWWCqA"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3072f8dc069so34641731fa.3
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 17:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739064057; x=1739668857; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=L1xFKvBTExFhCQASwzsuUzGTNrXZOyD7hG5DLI836F0=;
        b=L6mWWCqA7KbdcPfEmw0LEMd0Z8Ownx/kMHEj8c+kRsu/DpNmRVZofFGAmz7XaYWddI
         Y1c0vg0SASuaJwyZw7LDUooA/IQpvYA3NHYycIKrLNbs8jvjgnPZpe63CNtttBGuqprj
         c6C82bVLziz0ISfGcaCWG4mpXt+gR/V/NCddMky/TcPdiU1VsF9bHMib9jZZ3B2ngl8F
         IqZDHiuqwzGEBFD8LPc3qz4Uu5VNJu51eu4lgfq7K8NXc/qAwxcK7bEanrOXEQIPM3MP
         ILHhv+zVbuREvDh0QaGN2LGzOhWJAJHu0Vso/Wyfyuu6okQfvpzgXszbe9UwLJWTVOQu
         nciA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739064057; x=1739668857;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L1xFKvBTExFhCQASwzsuUzGTNrXZOyD7hG5DLI836F0=;
        b=l8dm7YukTyYYdsMZeX6zVpww61WCajESTchsEapi0yihAqquCK6o6HZt40ytQFxezj
         Q1F2QiFEtwnD+sWPWg4Ql0525jvk6Z9e+/bPCR1mC6Uzv/IxpAOEcUrzKd8dCY93r8pc
         kPYx9+5X66QuYad5wwgYovyyLN5ohmIAcg9kw4AuYNS96RgTDV66sM64GLO2CPk5HGjz
         zVSbxFY262CqzFsLn7xXqNf+nj199ztyLEvEdgbotSvKbzvCD6+chhzHMpzYnk5H8gxr
         2mBZ6ahbp+9lEJ0g5OSbNAvhsEUcMC4EUE3yf0MSgy6QJH9LfbZ3onCwldvYX+R2mniX
         56vg==
X-Forwarded-Encrypted: i=1; AJvYcCU2CQvsCeYgByGL9tNfIyKZnmCb1pRYMhcNUrDRP5rLJ7G4hUup5yIRLaEuHGblHVFKGHcmJcIpM/A10vs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJZyYzB7Wd/VU8MgxZxN8cGdxdTLPB3B9YvvKe7nKPgl/Ar5kr
	qOGC4p3HmV11RTJ0AkC3IVxW7QWmliJGyC4LeQfOH8pXKoIngJZk5iQtxlvDnWo=
X-Gm-Gg: ASbGncuUgMaMQAvKi3jcwgUKHFHKE4Sj+eDpVqu8Q4Vh/MD2nerUHTjBRiNonaIciRW
	p2WVNsQ4p2X4SZ+HL4CgNm79Ohqu/tr71dBmiQ1R7vtkM7DFLHBSIY0+vZI90NIFuTLhG9xn+ol
	I+qp7tR5GBU6j852mJj0B08cNsEXiuDhTwhfDl+JBvxfqTBYMNIB9tJTAG8BbuxNgbWnz7clkrI
	yW5iQNtQHTw6sH2qRJGJJf8Hn1PlqvvDz7fc1/2q9/LbTvcDnSSKDdRPMIc42xQv05UlAF57I7a
	D9b6bIU2tIQ6aT5SSDQIqJeJeZGPGd61IPqOeHnaVYHOCTJdQxsCnRKByF3Nv/5fTPJT+y4=
X-Google-Smtp-Source: AGHT+IEqf9njH57lPjDoguVBxyuYhVfWY6eG4RAwezPlVjJ1Ry1UmV8BlTHnLNi8bXe5ky8c13pKww==
X-Received: by 2002:a05:651c:98a:b0:302:3e14:34c8 with SMTP id 38308e7fff4ca-307e583df86mr32501471fa.22.1739064057189;
        Sat, 08 Feb 2025 17:20:57 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2dc241sm8608341fa.97.2025.02.08.17.20.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 17:20:55 -0800 (PST)
Date: Sun, 9 Feb 2025 03:20:53 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 06/35] drm/atomic-helper: Fix commit_tail state
 variable name
Message-ID: <52relusmwrcg6dmzs7yl22kbsmzjdgx2sltpelo657jx3slhz6@6bdhzrjjbq4p>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-6-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-6-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:34PM +0100, Maxime Ripard wrote:
> Even though the commit_tail () drm_atomic_state parameter is called
> old_state, it's actually the state being committed which is confusing.
> 
> It's even more confusing since the atomic_commit_tail hook being called
> by commit_tail() parameter is called state.
> 
> Let's rename the variable from old_state to state to make it less
> confusing.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 

-- 
With best wishes
Dmitry
