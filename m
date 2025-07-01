Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF55C279333
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379372; cv=none; b=IbW5xPBTQ1I0FjoQCgMtKZlYUXrafPYR6SxtK2/h2xpKp4k96Tsv1rWAfgR7itO+LSbE9mkdP0tNGKtCfb09ASDSmX594qlZ9p4KAA3ynDYhQYLwdovrtfFH8x5qFF5VBLku2k+mQnQDdijcvkELG2GgUQPKmfDbHux4Nc4rFyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379372; c=relaxed/simple;
	bh=USZWYVOjVhKmkj3wsqZFv1I8CsaZxslz+Kis6L9+6TU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i0vtdIGFyQywgLiRTt1IIvfxOao5oKofwv8w5wtDy1IevdGOoNNrMyk2dz4qTFhR0ek2SSU4bPiuWnJOKoYsFIiuBHHP+PKEIzsgTqZHlfLNzR4PkwqSpzRRMK/hcBkbl625cjTGnzFOb2RJ7jyURYJCIgPRPHtCMKHhtBRqNCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=bEVJVulH; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="bEVJVulH"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-40ad1f7c23bso2239369b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:16:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379370; x=1751984170; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=utdJ6ug4uyT7Q8sLa8Hgrk9nBo0BM3sC5TV3oXvqsBA=;
        b=bEVJVulH86ZvBpUsWLhz8KbrHd8qg57cu7tYBKTAZPk/LN1Lm2nmZBF/wGINX9NNwZ
         P5rft+JQ9FLwHDhlSl7ZkFWVQWw+FegXOgqlPVtyBmYxWPLFKbMYn9lNYB6V9jr/S5Ua
         XmZlVtbs4jYXE2k/cRiBtEBMekuhKxfTBixhiEI8dawJf8G1t0gFdrhzEVapam5eJnte
         0yUH/BQ+SUchWdXR2Anl6MRtSnYTAipOxG/dp4Vb5W9cg77UP19LH+MjXFloaO5P1LYx
         NwVTnoSYi6VRZGyU8pfgZr46aEbKZo4h9uXFmyppy5VUpSvXxQnPaGqz7J/B5LoOgTc3
         81fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379370; x=1751984170;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=utdJ6ug4uyT7Q8sLa8Hgrk9nBo0BM3sC5TV3oXvqsBA=;
        b=ANTJ2JIcPoxzVOgpiwC+YEa4LLDrCAOqcP7ipo0idik5GwmPhSx494CA9z4qTHBtlv
         NOftD3Xn4XGqv1bj92ujbVamGicC+t1fbjUFltuLidXKgE8QScIB5D41nwywCJZpbQPd
         ewBDF94ydqbjkwdozO8UCkEpJn1ZxxtxDwIx+dEMArjkir+Q36d2vzuX8QvVDfjYTxZN
         78SMcD9BncTOjLLwr6URqoqdoTHZv2xfpggJBgwbRD3dJvSy13E5JU7DyTpzOTYKxRlh
         DCp6Ba/W4tU784gT76vf9pKGewZyXRBSZ57q797JbNJBsb8mK3OdGCSAq5MgMiEOKDFS
         /j6w==
X-Forwarded-Encrypted: i=1; AJvYcCVWpkMtBOREzJmvb253RwS2SLeod/Td7VlT0CviRSMiwnnsalj0j6I/NDhqZod1sR1y4dDzngvzMToLvxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKOxP4ZvNbPbr79PAms6IIWmvyeq+iNnynKlX3rkm+bJN03OoN
	KShyJeXBGpNUsLO1cDLV/Nrmr0s0LotO7lgcFvTH9nz/gHNvyB+5BZLhjFAdMgx0f3U=
X-Gm-Gg: ASbGncva12jBqyJb/QZPG/XyYicNSCCOZubVjRH5YM3NfheBoa4DmkHOWdYb4mqa1M2
	J3JN2DtX6s/E8w4KMbGx2cSgRO4tto2xMV4k9XcAdmIFyLhA/5usrOf5WZ28mDFNItflOIzlJ/R
	uRqEwlfyY3OpdgWQJxilIYgCZOcpGsJ1dYxNt0mO6GQnOY5Phpk5Wb+5gsA6oWiSC4PAOOGg3Ei
	0QD/B52DyFy9rheRHQDMgvyylb85F+FH+JVVuIrWyj/waOjhm7FvHisS/pBq4ZB89FV6CWQoTWV
	9+5J5mUcpUr8jq86xhzHk0hQn/LnqUZs0Mv/V5niM15yMI/QWTtFDLzxHv+t/NAj3E2rmQ==
X-Google-Smtp-Source: AGHT+IGZVEVMxiOt6jeqMEAztsF59eLZGnR7BdDjB+ynvv+0phivPuMF2SeTSIpGH0oLVnNt/k+dsQ==
X-Received: by 2002:a05:6808:17a4:b0:406:7186:5100 with SMTP id 5614622812f47-40b33e18292mr15859525b6e.22.1751379369809;
        Tue, 01 Jul 2025 07:16:09 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b32420c62sm2182425b6e.39.2025.07.01.07.16.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:16:09 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:16:07 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Abdun Nihaal <abdun.nihaal@gmail.com>, andy@kernel.org,
	gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <4c1aa07f-082a-4ba0-ad3e-14eba02423f2@suswa.mountain>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
 <aGPnPVjB6bGKMkwV@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGPnPVjB6bGKMkwV@smile.fi.intel.com>

On Tue, Jul 01, 2025 at 04:48:45PM +0300, Andy Shevchenko wrote:
> On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> > This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> > leak in fbtft_framebuffer_alloc()").
> > 
> > An updated patch has been added as commit 505bffe21233 ("staging:
> > fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> > and so reverting the old patch.
> 
> Revert has its automatic line, please do not remove it.

Why?

I hate the revert format.  It is from when git was invented in 2005.
It sets you up for failure.  These days we have so many other things
that we want in patches.

1) The subsystem prefix in the subject
2) The 12 character hashes
3) A proper commit message
4) A Fixes tag

The automated revert commit messages don't have any of that.  It's
always better to hand write them.

regards,
dan carpenter
