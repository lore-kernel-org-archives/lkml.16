Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C40B22A1CF
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016183; cv=none; b=PabdzWQVPfwBkcY32aea3V/8bCiaBpc3/VaFqUxkpNbfvllpK2W5jSOCsj6SFFSBRoxLKEc8Q4C1Qg8yZHc+LMTTwjkMHyFLnWM/9JI2DcuUxKbpon9ExQl3D3C4YvqpRaxTq7YY3nbFt5I+NJ5oYFXWjI1N359pOje551BG8bw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016183; c=relaxed/simple;
	bh=Fy62SzMM/9Z57xu5AwOs9PXpTps4H2GdXp0QBEtXn5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=J5/aKE8/RPWVSjMzCDrXE2kDI8qcGvG6VSr7ld+ldTcRxvcTEn7SvBDZz0lYHNKBJOMH9YMTZquNbQMwkEbZqVfOvGc5ghPoqDXVpmrsLH+cn2zjELeIuHKO+8Wk6u8rmkVqQolazyqI1n5iqUw+k6NBd0C2C0Ch6cYeOX8L/08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RrdX40aR; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RrdX40aR"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cf0d787eeso44932595e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:56:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744016177; x=1744620977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4lZ26/MzKr4Ipcy6k7wbvxY0bsuMHsFajLH+7Kr41sA=;
        b=RrdX40aR6g2S/eLF0+VwBPoE0i0PAItUJv1MvVpoE4A9E0BYtFKSZM0jjalg5d0bU6
         6NHzqEziqfL27VMfKzbytOPZjjis3VoTDo0jPC0nDl+d5doGixGd5WPfszsn8COfL7EF
         DRQaBMdA7Uc5kGx8HTPnvV76kYO365ZsVtpF/dHU/D4Chguhf29n2fI9vOmhvTaieTKn
         gew26rTsSEqycYU6ApT+di+cxBVrRJe5rlFDU7KuuO09NJVvbbHdQkXQcSs5G7h4IB6R
         Rw1uR98uMd+c7ao54nQaOACFPatYYVZAElhsw9eVQSIMuHVNSalI6S+tDE77kvsh8bvu
         GcHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016177; x=1744620977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4lZ26/MzKr4Ipcy6k7wbvxY0bsuMHsFajLH+7Kr41sA=;
        b=aKgMdqwOvEQi/g1ILcybkidskUJx+MPzSG6e+4BS5Hln2vTgHx5ibDfw2qsgQdqz54
         n9CTLCZgzwV194o+PS/yjDA3zmtHQDN/ZUk2/2vJB/e3Mn3V69acex8uQgNZ3yMI5h4n
         ycPA7HAvHAdkvcAsU64vT+RevIDtFv2kZgpbGn4YxPQatWHtUuAFKCeg6T+ESPFReRAs
         OqsHyinf4fV8dwGnVbfQZX/AJymVjMCizvnH3lFfNEl5aYd2Jx+O9jmuYDIZ08mmsue2
         ElYfAqLF7IQCyBM6hMX1EqENAm8GzYGmp9RX7f7NfiTK9H9pCf+PAL+QdQFNGVqVCnOZ
         FPvA==
X-Forwarded-Encrypted: i=1; AJvYcCUQWbqbUh4jeAiurDazLDShvvGH06xhuNj1VEzi75aJRXQzgpGmCRZA9Wu3XkXwSrjthuu3a9qxVZry1Hk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUa3h+Gowra+biZg89CMhAMJdqugFn+A1J1OFLgmw1LewEHELU
	X4EarwjyCCVP2s1QwQG8El5egJcKZP2k9g2x2gTRvx3xCKPcc6HNUjkz8ggLp4s=
X-Gm-Gg: ASbGnct6tODt67Axh74bQyByye6QveVYBRxnoJvhY6AVoFPNWA6OnFNkYQLsJVFoP2h
	u5hklE3QjLtHMJFqikQ//oyUQ8C83qjkPDDjxKi3m8iCQW3s2P2t9eToPkcV6iZ35MGGiFBa2ES
	Fy/DPieXXMLOHQZ41H8awuv9UlOQbLtjC+Pf+KT7cQh5L8KLgn0R8IGbc13n3WoniYwk9xagNW+
	mbxCFza3pNHJ0kt7xGZ8DsHCV/491YvY1Avy8wOBI4JF4AhBW17CPwnPf1qu/TbcVnMH7usbAhA
	p5PjEypig02VcmKTVM1Wh/rv/coy+cvOIpsiND3TOzp9/nTFb71CAh/tFnEU
X-Google-Smtp-Source: AGHT+IFX/DkqBzJz9j5+HAQzhFFiQfm7Y5i8Q/6EzrAHz716OWaZOhpPQhlCWHCWVl6h0q1QhF4T0A==
X-Received: by 2002:a05:600c:3b14:b0:43c:ec97:75db with SMTP id 5b1f17b1804b1-43ed0bf6aeemr106771475e9.11.1744016177517;
        Mon, 07 Apr 2025 01:56:17 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec3428298sm124599685e9.8.2025.04.07.01.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:56:17 -0700 (PDT)
Date: Mon, 7 Apr 2025 11:56:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Maxime Ripard <mripard@kernel.org>
Cc: sunliming@linux.dev, dave.stevenson@raspberrypi.com, mcanal@igalia.com,
	kernel-list@raspberrypi.com, maarten.lankhorst@linux.intel.com,
	tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] drm/vc4: fix uninitialized smatch warnings
Message-ID: <e5e557bf-53b9-49ca-9bd7-3dfe85ccbbb8@stanley.mountain>
References: <20250405024503.694981-1-sunliming@linux.dev>
 <20250407-colorful-important-saluki-5e4ac5@houat>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407-colorful-important-saluki-5e4ac5@houat>

On Mon, Apr 07, 2025 at 09:13:59AM +0200, Maxime Ripard wrote:
> On Sat, Apr 05, 2025 at 10:45:03AM +0800, sunliming@linux.dev wrote:
> > From: sunliming <sunliming@kylinos.cn>
> > 
> > Fix below smatch warnings:
> > drivers/gpu/drm/vc4/vc4_gem.c:604 vc4_lock_bo_reservations() error: uninitialized symbol 'ret'.
> > 
> > Reported-by: kernel test robot <lkp@intel.com>
> > Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > Closes: https://lore.kernel.org/r/202504021500.3AM1hKKS-lkp@intel.com/
> > Signed-off-by: sunliming <sunliming@kylinos.cn>
> > ---
> >  drivers/gpu/drm/vc4/vc4_gem.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
> > index 8125f87edc60..04ea1696fc5d 100644
> > --- a/drivers/gpu/drm/vc4/vc4_gem.c
> > +++ b/drivers/gpu/drm/vc4/vc4_gem.c
> > @@ -582,7 +582,7 @@ static int
> >  vc4_lock_bo_reservations(struct vc4_exec_info *exec,
> >  			 struct drm_exec *exec_ctx)
> >  {
> > -	int ret;
> > +	int ret = 0;
> >  
> >  	/* Reserve space for our shared (read-only) fence references,
> >  	 * before we commit the CL to the hardware.
> 
> I don't see a code path where ret is used without being initialized. Can
> you clarify that in the commit log?

Apparently the drm_exec_until_all_locked() loop always iterates at least
once.  If you have the cross function database then this is parsed
automatically, but I've also hard coded it as a loop at least once macro
just a 1 minute ago to silence this false positive.s

regards,
dan carpenter


