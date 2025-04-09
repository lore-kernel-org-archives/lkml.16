Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEA951DA60F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196530; cv=none; b=UyHs03m7l3bzz7EW0noGTv5BRomTC1J3vlPLvl8WIvqQ9MdXWL7J4Hm5pIIjWYjx9DA+BNDvPMJ2HFwrIbgAcalv+ywic1FdsnrZ5QOrtTFz5qR1GOq3ZJ4QTFP3fChgjHLzaUz7YDaaPTni3hQOaFXjWaRafPJ2JTB1icRuw+Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196530; c=relaxed/simple;
	bh=nSzqOWI3rZXEaJ3L9FxTC+hfQE5GBdW8UHo8Bfm3AHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hncRLD9B6xOnG8bNJIxUye+cT5c0A2/UW/d+yHpJyHjjmGocFLPjkU0LYTr8NG77QGBWzMZ+/tzDU1uGa/ALxzrIxZLyP6iLZ2+RNrMP711sLBHFY/T1/ChjVaD4IV0qA10NCotQ1BxntuihWAeKzuniyEw9+3QzlQ9tb9MqBTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R1RJ4UVM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R1RJ4UVM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74049C4CEE3;
	Wed,  9 Apr 2025 11:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744196530;
	bh=nSzqOWI3rZXEaJ3L9FxTC+hfQE5GBdW8UHo8Bfm3AHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=R1RJ4UVMqGdomsDQ/gi4j40D/zJh5/2OYABZavVV2iLEMjAyP06PYQXY7bSq14Z+7
	 FJFauOCPTioQa7F3JPobJ3icgn2WwZ2KJLFe5SRyVQYIxW88qBQruGXS2RERLsZNtm
	 VIbcZX6M/BQxz7YX9qZPN5PCa+V6flR3PjIXl9ByZDO66a+DfJSWVQ6FKxvqhQIVTR
	 kV4hbQf/+QTFgCPDnKTs5Y9r8zvQvsEL6Ft+QMwpkT/+HCsbmPVXByk/cMwecCSVUP
	 gHLqV1xzwrzXEa5G1mYhHrB2BGPRSxzzyolEPSa+rTDnn1TO6ZZi4YTUXGWe1wO12Z
	 qHYTL5NRE6dXw==
Date: Wed, 9 Apr 2025 13:02:05 +0200
From: Danilo Krummrich <dakr@kernel.org>
To: Philipp Stanner <phasta@kernel.org>
Cc: Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Ben Skeggs <bskeggs@nvidia.com>, Simona Vetter <simona@ffwll.ch>,
	lists.freedesktop.org@cassiopeiae, nouveau@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/nouveau: Remove forgotten TODO
Message-ID: <Z_ZTrZ-dcD5YiSm4@cassiopeiae>
References: <20250409091413.94102-2-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409091413.94102-2-phasta@kernel.org>

(+ Ben)

On Wed, Apr 09, 2025 at 11:14:14AM +0200, Philipp Stanner wrote:
> commit ebb945a94bba ("drm/nouveau: port all engines to new engine module
> format") introduced a TODO to nouveau_chan.h, stating that an
> unspecified rework would take place in the "near future".
> 
> Almost 13 years have passed since this "near future", so it can be
> safely assumed that the TODO is not needed anymore. Besides, its content
> is useless anyways since it does not specify *what* should have been
> done.
> 
> Remove the TODO.
> 
> Signed-off-by: Philipp Stanner <phasta@kernel.org>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.h | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
> index 016f668c0bc1..3b73ec91c4ff 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.h
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
> @@ -33,7 +33,6 @@ struct nouveau_channel {
>  		u64 addr;
>  	} push;
>  
> -	/* TODO: this will be reworked in the near future */
>  	bool accel_done;

After having a brief look, it seems that it may has actually been reworked;
there is only a single use of accel_done, which is in FIRE_RING(), where it is
set to true. But it doesn't seem to be read from anywhere.

So, I think we should remove both, the TODO and the accel_done field.

@Ben: Maybe you remember the history of this.

- Danilo
