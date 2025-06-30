Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A0CA28FAA8
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751300640; cv=none; b=jEpRGf9+YEF7l+U/lyXXu/BhwlRjSkl9t+jFsrbu/qO+ex0i8vyG/2Vc0n9YrB31dd8iiilqwLFiflzXamAGRuBC4So9Ym/buB8bENA1L6ZQSjTVWu/sE2Cf2KzDMO+3LiXF1WATUIlrWNnF1qzEayXDjXmlhdUO4efcemDakxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751300640; c=relaxed/simple;
	bh=5+OiCZTGghwKa74lu2VCudssFUMBCoc8IDFlvhmwSc0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mfB0x3yFTpqNVSo/6rrJSO2LV8LwjGesQPTxCvhTZjI/Dg6N2W2L8wVs8NKAnPU9DoEpPsSc8OG9ziotNgYdv0CEeoaKeDjDJGyx5qbAbHjOysoLvuhfubVxEHrOQFy/qyEc4WEb+JANtDsubebZ6gqEb38GUXpPLofGn+3aXg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=X4lcGtgc; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="X4lcGtgc"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7382ffcb373so2487929a34.0
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751300638; x=1751905438; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fA2hiy3pBisBqFxIA1WfhCNpsJVYMFCT5jmkfAR5MRI=;
        b=X4lcGtgcFC4FjrBVGlJtNIbmHEPy0nK+jBG+TPNJYk7M5Vj/MoXa+crBuk5AqLxzbB
         gpQGAMKwsy433OE2vNN+2rKmUfknG5WaVel0jP6nO1MzZBJfX2698w3xvz1C7xr2Zqsd
         D6UY7Jeb/08etcqf+up8ZqaIMhk/EfaVwR824WJj1rfuthPDrKa1wDbHYm3Dg3LRwudH
         jJV/pkeAUm5+v5zMMFH2KQmcFaW3OZxLvy1fooarr7n1H7qAU7clVpmgZAIh9scLZKZZ
         5NRsd390e3HUUhSziHc4Wo8v+wUV9IkR7ITd2ytEexWGRapqwy9sLXKWG2nj2zd/rix8
         eSHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751300638; x=1751905438;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fA2hiy3pBisBqFxIA1WfhCNpsJVYMFCT5jmkfAR5MRI=;
        b=kj1DL/VnzRk8LhbDawBq2PC6XVuNx7CMJuRuyuOc0P5hpeWGYtFMsbS+ywHxXVFrc9
         ya/4/a4DWgEc6Yub/Q6Y8mJvl0G55ota11X1Vh07Er30Bj2qgkqE4UsTavUqORkYuj3T
         rWuqTexCamcOX1qjj3HGq1v3bC7eR9sYVjJ98iBNTh+MLNFhP83JytuARQkfqBDe7W/U
         gQFATjyclqK5IHjwNdecG2QnMh4hebnqbmK6W6pFtI66jl9ovmjRbLVqG3FtwrhCb0YW
         QZfIrzxj31n1BJisNp+U2eU8ShhWCttV79vr1CoR7UiQb27wcW5HujOZ3ZqE2KPjd+6c
         Km0A==
X-Forwarded-Encrypted: i=1; AJvYcCWrcrG0Q7+QTAprrzKIg0RS/QjTeHQZrFA7MeS4QPXrYs/PNBTbt2Ow55EObZnBTioRTwydLYhV2RQktdY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyu+c+uQYSBX2972UcVR5G1AaJzv4rxGrY822yxaDeAuPW2Gh0V
	JlfJ6wQ03YguP58Qp6QORQFvDJkm/evdyARKU7Iw+qSTFvEeZ/NxBMJgVOr0gKrTMs0=
X-Gm-Gg: ASbGncsayuBPwaaM1cDQ4KFtbR8zBGIokj6r9suEq6KLZDqfXc11WaqGwR1bTMRgAR0
	IUfsblPFNl41YRtgkUwjwwLWE+1WV1gsLip3Ych4vk3y8d/Z12b6j49j7Ab3OQ9w1hU47HfWjxW
	93S47RujK1RT41ZHyLWfw58rCaL7yL503JKckiu4ynY3Kdz+t41aPDJqxRnP4Es+QC33nDWtSK0
	7+aORg60gUmP3TIcsaabxjGMwXWiliTU55uwzs0zhfOhBrOVJnZbjrUsGseEBlZHRLoMmUy6fwT
	MepsdQ0sTk0wEzGejezgrmFVAr9slOL23raBYhZoaR0xRlibkz88YSIuBSlFa3+sl4lC
X-Google-Smtp-Source: AGHT+IHI8m9128kRd2fU4qN7fgHZ/eU48Raar7DmwpFo5FAW57ejeRpFPJvZQgadqdVBw4gRttl5dA==
X-Received: by 2002:a05:6830:61c2:b0:73a:8705:e9e6 with SMTP id 46e09a7af769-73afc43ba8amr8817314a34.4.1751300637997;
        Mon, 30 Jun 2025 09:23:57 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73b2459ee91sm644765a34.51.2025.06.30.09.23.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:23:57 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:23:54 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] staging: fbtft: cleanup fbtft_framebuffer_alloc()
Message-ID: <e15bb200-f59a-45bb-8349-72816629abb9@suswa.mountain>
References: <cover.1751207100.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1751207100.git.abdun.nihaal@gmail.com>

On Sun, Jun 29, 2025 at 08:10:09PM +0530, Abdun Nihaal wrote:
> Fix a potential memory leak and cleanup error handling in
> fbtft_framebuffer_alloc().
> 

Thanks!

Reviewed-by: Dan Carpenter <dan.carpenter@linaro.org>

regards,
dan carpenter

