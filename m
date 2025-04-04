Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53CE25776
	for <linux-kernel@vger.kernel.org>; Fri,  4 Apr 2025 07:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743753227; cv=none; b=ZvtKpfqdXaabg5v5I+RYXnv6e20a+drLhJZ/uBd0czCayAIHPXQnIv66PQSDjmVIYgydtnD7MMkO1L5l7b3tibgA0UBrKNKJSpU2t0hDOoJnzvxY0vW3c+/+8rn58B+aKkH+EaRX5lcXgOuWOK2rACFQukwcp7npzO3A7sXYFbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743753227; c=relaxed/simple;
	bh=r9khSvMMV0yozH0rzjo8JBgc41XEfqOhVFzyTEndWgw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m9/L/hNXECR8PkIvytCDmQ9F5g9rRCEl4+XCVeTVIYbiDJFMuKu5JwamARzkmYEh7O1NNk/ehaOtsmb93uZjG8aSWOtoYmPvZ4d57+g8alu1kYJwCagI8ZUABdqykqyYkTEmP76vQguXAPnZUzH/YS460XpUjXgh2uYOyRbyegU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oRdPxgXp; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oRdPxgXp"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so10533015e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Apr 2025 00:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743753224; x=1744358024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3GvNudHj43sLnU2IimkQsPqmval+E8iAU6S3i4j/9Ag=;
        b=oRdPxgXpKAlq1tpMRcbnzU53KAG2qfbg4B8l0vgEwQadGRfl/Vp3gC+zIFlntIYa9W
         jk1WBFl1igYKDliYjRSW8f5kZuFAV6GZD6tyc+FG+YttzPp9tzc9FK5TMtPSClgzMESX
         PLAsnzOnLUEShmPytrAcldqRH4V44XuJFL2bp8RU9LvsY8K4I6FSwLIbgng/KMU7A1Gl
         TyBm1btun/m8yCPXq7Zsj8eXo7jyqiexkokUtd881X4H1KUulRY6trwSOAZP57e10xMt
         vv3W/mGc6aB16tdeNjV2IzkeCSCMhDzzu/wEScVRHTxbPIyv3mQ3TbfEjtT3yey68haH
         +ofQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743753224; x=1744358024;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3GvNudHj43sLnU2IimkQsPqmval+E8iAU6S3i4j/9Ag=;
        b=eW1V+d58IJM3ukjnhve/PFGYSzBApuExN/hg6iZRyecWQtYP/J1zr7cYZul4SOMbxY
         fHIL9zuHdsYAB0M4C/AmhmBumj+3/YcaFuMQ37TJC/yP39f3eawN2oCHhV2eBCmGus4G
         01tVEfHJGM4wVXH/1qRhPYF2p5c4fadBWnVt0Py1JAvX7DecDVDyb3XAaJWmgS2YwAny
         HhCmVgU3efWKgROmY4flAPejhzLsCdkfGxHqn3coOSehlR1docnTOx/Q05vYJ/zsZI0g
         wq9j+j22eGo9lLK88CKHC+diLJ+3qaBQgrXDFpnzVcAYt2AXADLlkE8Sd6yV0qzlZtmB
         AsSg==
X-Forwarded-Encrypted: i=1; AJvYcCWnnpcvZn6ooceoeBgoGy3/1YYfOcUz4ld+zT+rmqPLGhp6d2SpmdyNKF1NfFftVuh8SueJzOz8mp2lnKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPxYPGa2I1vI/RVuL6mpXyU+DM0VuJjnEb/Y3s0PFILEx2oULF
	6e0vtAIje+908lzAM+6/9rYDqWEIXU9KgzDedn2kE8KrwejvNx2QJ8ufAq+TLGw=
X-Gm-Gg: ASbGncuPrBshnPBm3p5BOcaaela9bcvmIK4jNww5mwm1oGj8wZkCBLkHoRYLc1EbfBe
	WShw/Kkd5gljmMgU0grXdkTpBROXWlBl1pOGG6uSmHQyCVMQ+FNL+vUntUDjjHuw+9L2A+7pDjZ
	RsCYRlgBenrHJ6MfSGjBWEnxsOYVX5rcKqv6YLgrEzy18qbtmhSbne+Om8+SIH0zMYrjA3ad5OD
	0C/D1hQFoZ5sjK6Et6jqeXc0PiXtitkxd9WnGTJI3voi2kY3PRxzlLmIwO0xhs/S4pM7b2YA9Bv
	2gAA2bXcasaJOtSVvWDO/IKHoulFDtu7GhBGvpgXGCHS/n6KRg==
X-Google-Smtp-Source: AGHT+IEdqvONhq2YUwRwTjwRLNZUpJ81Q60Z9i3sMQ6SbaJbaM3ciB6FWcqPTl4o5r9FVChY4xceDg==
X-Received: by 2002:a05:600c:1d8e:b0:43d:fa5f:7d30 with SMTP id 5b1f17b1804b1-43ecef0230cmr19010215e9.16.1743753223927;
        Fri, 04 Apr 2025 00:53:43 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec364d036sm38271635e9.26.2025.04.04.00.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 00:53:43 -0700 (PDT)
Date: Fri, 4 Apr 2025 10:53:36 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Sunliming <sunliming@linux.dev>
Cc: Greg KH <gregkh@linuxfoundation.org>, dpenkler@gmail.com, arnd@arndb.de,
	everestkc@everestkc.com.np, niharchaithanya@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	sunliming <sunliming@kylinos.cn>, kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] staging: gpib: warning: variable 'nec_priv' set but not
 used warning
Message-ID: <f6e2c865-7c9f-4301-a1a8-8a5b1dbbb5f4@stanley.mountain>
References: <20250321010649.10918-1-sunliming@linux.dev>
 <2025040310-poncho-armband-782a@gregkh>
 <8e92451a-4d43-1836-ce5f-afb6a523115b@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e92451a-4d43-1836-ce5f-afb6a523115b@linux.dev>

On Fri, Apr 04, 2025 at 02:08:38PM +0800, Sunliming wrote:
> 
> On 2025/4/3 22:08, Greg KH wrote:
> > On Fri, Mar 21, 2025 at 09:06:49AM +0800, sunliming@linux.dev wrote:
> > > From: sunliming <sunliming@kylinos.cn>
> > > 
> > > Fix below kernel warning:
> > > drivers/staging/gpib/eastwood/fluke_gpib.c:196:23: warning: variable 'nec_priv' set but not
> > > used [-Wunused-but-set-variable]
> > > 
> > > Reported-by: kernel test robot <lkp@intel.com>
> > Please link to where this was reported.  The report from the robot will
> > have the needed information in it on how to do this.
> 
> Get it, I will resend the patch to fix this.
> 
> Thanks.
> 
> > > Signed-off-by: sunliming <sunliming@kylinos.cn>
> > As per our documentation, please use your name, not your email alias, on
> > the signed-off-by line.
> 
> It's not my email alias,my name is sunliming too.

Why is it capitalized on your From header on your email but not in your
Signed-off-by?

regards,
dan carpenter

