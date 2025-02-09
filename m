Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A5A92F30
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 02:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739066599; cv=none; b=IaPyAX0PoeRaPra4P8PrSjnEXTSVYSl695gezFOZs35VzdKINXAFmEti46l06WtMoykClsv3AreKja6Gfxu6iMAJhFCiD6kNCwAb5JWCPgNxQB+1PJcRKpfqV2i99ldvkfjPbbJyXnhQcvGLyfU9QoljBc8Mpor7QF35jnxVB4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739066599; c=relaxed/simple;
	bh=d1EJ75Pc9Bdw/RDQVXEClZmre12GMlFmoxKXL2tLefg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P2pVfR4vjqJ6cobxSKXtBqLtTnEvQSev3dWbG7xdqoHY7bp7EewUeOREjSGm8nl3+phubuTR5xbVddcYy1CbcThWKC9TtXkJvee7hqgwg1WVnVzVvP4EJAdVRCb0UXJ9GngQ7dr0232siuP71Gziahv7lS0zw4Rl9uG6wuJPCFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=onMe/n11; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="onMe/n11"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3086edccb4cso17046891fa.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 18:03:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739066595; x=1739671395; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EeeZzWVf5/vhmXv9AEOt/1s5u145QYyGEt7ZWKzhLQM=;
        b=onMe/n11G+tt560mWYgGtqvKHrERd8dPt08zt2dKvmNn3gCz+QtuzJoa//O3EQTVzq
         IYjCfbJV1NEjOingImauBRVgSt0RGzxXITdwijnH1Ru5ZNnj1mkjt+4BlhjTLXpNHy4y
         4UDusmKDK1T+Cy2vHXbI+CpayIoQZmEi+PnYzpVfwE+fHebrDDJjWIG0qdZzIMKbMoXf
         BSWq03kjWYzpuhqjOiV84cbwaPkv+uLDSUQH4nF3yzdj4nMAXPYbdXykA3YLRvsQHe0v
         Vdq/nJMxyi0l6GWsgSmAMY8S5fN/Kg1bF3nUgHmduZv91LN4Rw7FVWBjPv53PRwmnfWD
         Y3aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739066595; x=1739671395;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EeeZzWVf5/vhmXv9AEOt/1s5u145QYyGEt7ZWKzhLQM=;
        b=WJZwYfFASFSAoi8hBQGo2v8ufyunKgconV9i6kKl0W/uvGYDe6ITRdFrI8PId7aiod
         z/oDTOc3HBRVlmjGEbNlCKkL5kbgsBtgHBDzHb5hMT2pQhAkFDSCrvSivJffQg1SOP+s
         totr7Vr8TLMyREG6IV2U92a1poVQP7SuQUjVr6RHsT+PSkx6iLoyKiAagKeE/vlXEVtG
         0CiS4AhtBKjhGpbXxUX+93dRamm5CeNSzKVUH4M+GQQ1vA7MkFxue+V/YgKkKTPgxIuT
         Xgtq7M1k/i9Cxpk6l/c1Bocqw5QcU1PNG1y6e7vBNBE6wQpsRPigbdb0r/NhwFl8Ogm8
         IwGA==
X-Forwarded-Encrypted: i=1; AJvYcCV9wr87sOUod3Yfhj0Adnk9KahNS0ZTWRBsRvDB4YkJV79GCs3mocb2X2VjuBBwBsR9k84ElDQBgTs7DfE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzV9hXpaKpubdQGBI8pJ5OtudX24BjbisdGfvwvdmoggCf0RxWu
	Ex+qbnDcB+Ac/frShX70MU8pip/MVPtEBhD6q6cmmOp4rH3P8+g3DdNuCh3Nouo=
X-Gm-Gg: ASbGncuPvgptAoP/plgDUW1PZrTzUpy/8ooZq+v5Tt9+LHOtvJW99OAYXGIjKf4A1vI
	m9Ejb3VRkEah/MkneU28316wzL1GNsV7vugvDVgBgIdH99hRSKiEGBBFd3gw+Qf9i0SrpcuSMk3
	fJhjHNJ//Pb+nKGBUweaZpQyf3m4a2Jhv6Sb38u0H1Fz5EF01cAgkDODnQflMrUsTASw41jUvMA
	lgF7opKt0+G9LmbJk7ZZfAMJ7qQSfQPCTLO+ULF6mm6bRnlO28vDKv53yNwPDR4Tfnxk5LqP3ij
	nH3axHYfxfnALhY2Nqlxd8mGUATIMO2/rNN03ceUXwfBcUuNMpzcoaOxzzDh9YpBIUvYeIw=
X-Google-Smtp-Source: AGHT+IHY5xrwx7bXOZb5Z6RthMsSdn9sw/6mONLcYjPXUl5AfcW7b5fwlydWpYhPXPuU1dPWf8dH0Q==
X-Received: by 2002:a05:651c:1603:b0:302:210d:3b44 with SMTP id 38308e7fff4ca-307e5a8de19mr26127411fa.35.1739066595390;
        Sat, 08 Feb 2025 18:03:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-307de2f8193sm8451191fa.111.2025.02.08.18.03.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 18:03:14 -0800 (PST)
Date: Sun, 9 Feb 2025 04:03:11 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Douglas Anderson <dianders@chromium.org>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 08/35] drm/atomic-helper: Change parameter name of
 drm_atomic_helper_commit_tail()
Message-ID: <jmakx5twoivqyx2c5mkcwazgiuwi4csefsozmomussn7ppi2lu@pux4uen74old>
References: <20250204-bridge-connector-v2-0-35dd6c834e08@kernel.org>
 <20250204-bridge-connector-v2-8-35dd6c834e08@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250204-bridge-connector-v2-8-35dd6c834e08@kernel.org>

On Tue, Feb 04, 2025 at 03:57:36PM +0100, Maxime Ripard wrote:
> drm_atomic_helper_commit_tail() is the final part of an atomic commit,
> and is given a parameter with the drm_atomic_state being committed.
> 
> However, that parameter name is called (and documented) as old_state,
> which is pretty confusing. Let's rename that variable as state.
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
