Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A04026B755
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751379185; cv=none; b=a7tiKWczpluL6lHVRWo/uMf29CUnhQeiqa6UoClua1TwHfJ3DcCWRXKL1543/926G+OQAf7WyltKMfmAc/Zg2H4fuWfX+7Oe1QaQx8ZwI6ZckmVzD3OdoqZCUUIlKPy5u6AfoSb/A0a46ce0vRiOHi7IBFq30Vni7xFyCXhpo/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751379185; c=relaxed/simple;
	bh=cKrEiugH0xvIcKtzSeFU/00qwTU7Zi40z85pYKEb35g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aHcMSJzznvAwKm6PCP/wfd4r0i74c9pCq1jpXOq7Ic1m1tVnakPR4Q9Lht/rZ5IAfOn1T6/BW+9xkOvxk5aAusd5qR2clCEEI59hbT/mUkXcUT7KUQjMg7uvk2MQaTkr9OUcqJTZ7NjpOrbZviL+ffhU+07tJFNYj7oIxmNuYf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HIk+z3yM; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HIk+z3yM"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso2463143fac.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751379183; x=1751983983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgIRXBrUhqUfMA4ZY1lMetlJzjnZyUiR+RgRBjwesGE=;
        b=HIk+z3yM8yuaaYSQpLUqXjPELAyly4P3XZBjLUJsx688dzZX/ywIzulWOvE79493VK
         9VFx5WtaggDMoR0+Qed0Vx5cvq4YFHxN29PE4SoQq8C5h2Pi41BnpJcZ3suISftofxxD
         OJzoavpageZ6mDvN+S5vr2VBjl9oKxKrxCyHWBw1eogEcSeW1Sdt9nskUwUj/37oYo9M
         rSPkhpKcn5DO/M/uZ0pe0VSBZkS0AbbmhbFWgKSxYiduUi5J7JK318g0CRVOkZVfDm0L
         DwhlV0K2LNWY4JRiIvz4mElyjgQ8q114TdQlB+EzS38djihbKDCVTvNIG9QTf9I04QOR
         A1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751379183; x=1751983983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DgIRXBrUhqUfMA4ZY1lMetlJzjnZyUiR+RgRBjwesGE=;
        b=krLNAl9wn1MD71bc4vZ3WDuM0f7omo0jm7T/xWNcJADaCkYPp8diwT/mQK05MYfuqK
         N9h9pg7xONXw9831BtCC7UY0tIILxAgSKW5K8RxwFQogx/bgvkD+tCP8QoxGvAZIcZIs
         bQ4S85cZZibj+c09YWdP5Vd10XQwKa/qZYzxATb6imLFZswNets5Bv4mIzOLvB116roN
         k520BBoT53T6IxHCktCinupURkfyAPe875VighE3V8B+E8ss2olTWZ5afzPWV1THWUGQ
         rIJ9+30OLgs0XpGOd5UnxlQgsyOjRdUpWjitglGxwhKjGIfUUjsE9JuhOWtbOkonKsLe
         ELUg==
X-Forwarded-Encrypted: i=1; AJvYcCVKgglAeh/DHFNl5tiXDlcoTXTPaTI55nz31v4YZRr21bWLIDLUg6e+V6eOlUVsykP9Q38js59ihAoM8Ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7VsFIhoaah2H6X+kb0H7/lm8bo4cU295egwYIRfeXwmdBFPMA
	ER9zi7IAxOdTuFoJjMBSLlz+jN2WEgzFGWeiKE5ij+JGOhNEUZyQGfp7nfIcIiOLzag=
X-Gm-Gg: ASbGnctTjktWloSZdOUfYsw2kedGy3bsLBHxy9Y/Jo7fQmAmXJXbFS3NeecCo1jsxkP
	E21k/ZgwBBFlmhPeIpy1GIHKJpeI1M4KfHpZJn12ZJnPhrcN2y53OotVi984hs6rjMc7btBTdpe
	EFFTeQuLmDykIdrZfDmMYq3TbSgNV9LF+wXJ/D6xyGfRPkOMzH11s2a4vg1zvd1p/YxYvOcp2Yd
	X+gbZPYKaQfPpLoy2J/6niIcvTAjkAldihFQN8aS8nGseDrIV3hOXEpDSeF0PUF05yKcEblRRBB
	1wYo/5yXan1zCjtIdV51Q84LUAPtQUhGUFFYNTjFNLH08OiqmwoVZjMtOpCBRS3o4Ac9fQ==
X-Google-Smtp-Source: AGHT+IF8222q5H+Su9S8AoNHUZyIRZzavZDR6dz1AwLsejbGTN9lIlZ82z0uy9mz2H1nkV0KHwWknw==
X-Received: by 2002:a05:6870:a99b:b0:2e4:4617:f6e1 with SMTP id 586e51a60fabf-2efed451a35mr13168004fac.2.1751379183127;
        Tue, 01 Jul 2025 07:13:03 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:8ebc:82eb:65f7:565e])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2efd50b1ffdsm3274257fac.26.2025.07.01.07.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 07:13:01 -0700 (PDT)
Date: Tue, 1 Jul 2025 17:13:00 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Abdun Nihaal <abdun.nihaal@gmail.com>
Cc: andy@kernel.org, gregkh@linuxfoundation.org, lorenzo.stoakes@oracle.com,
	tzimmermann@suse.de, riyandhiman14@gmail.com, willy@infradead.org,
	notro@tronnes.org, thomas.petazzoni@free-electrons.com,
	dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] Revert "staging: fbtft: fix potential memory leak
 in fbtft_framebuffer_alloc()"
Message-ID: <2e1d692c-5f16-4042-9ae9-423e3991834e@suswa.mountain>
References: <cover.1751361715.git.abdun.nihaal@gmail.com>
 <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a689f32d6c56d6c5c6ba8e2faa0305b5e92d9897.1751361715.git.abdun.nihaal@gmail.com>

On Tue, Jul 01, 2025 at 03:10:22PM +0530, Abdun Nihaal wrote:
> This reverts commit eb2cb7dab60f ("staging: fbtft: fix potential memory
> leak in fbtft_framebuffer_alloc()").
> 
> An updated patch has been added as commit 505bffe21233 ("staging:
> fbtft: fix potential memory leak in fbtft_framebuffer_alloc()"),
> and so reverting the old patch.
> 
> Signed-off-by: Abdun Nihaal <abdun.nihaal@gmail.com>
> ---

This is the wrong approach.  The original patch was fine.  Just
write the next patches on top of that.

regards,
dan carpenter

