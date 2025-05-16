Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399CD225A35
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 08:02:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747382559; cv=none; b=RH3BApd15D4Kt8GGa1JvnhiMi/4aT8SrXi9mFrkg0BKRTefHo95NLUQNIRCMYoxyHffsNU4iMrLBG+kAlND1Ckc1W08sxN0FZ/tedV6yc0k9Fph1+Mz9zqVQCH/o4WQzgsMVe/m6oRhiNT3C+PEPDWRT2kT8jRBD+FuD1UoiXtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747382559; c=relaxed/simple;
	bh=GG4H/sccbSVzVwAwliBjKqAZoNtWhkKlmZNI68D6kmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rqR3ceYabhwzki2YqJOcc9lA67SS3BSxk+TH20YUrottxcize/j8bIYZvdj/htefFqN1u0vLIeo61x3F4ckWowBsbalkMwgo7iqJh4zC0j2yiKKOVz8zrntV61VgjM6yEu94JVRCVmJqlc/0/2TiDM9byoFr8+u28GCzVd8/y0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GW/EPIWU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GW/EPIWU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a0be50048eso1735287f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 01:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747382555; x=1747987355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=;
        b=GW/EPIWUiIO1WEoPmHec93o2Cs0Oi7jXWo5qkJbwKnAPYrjw7QCUEBoFSLs5UtMxNU
         Yw0XPfckh2ZRAiKuDJJKuRDkA7SzQSvo1A0Cg/mvvcwd22JJFvTn/hYRrAOhvA0KN1TB
         R8j6LNnyWtwJpvs7At0YyfBN1OhUVzc93ssCve/uLnoCcOT7+Zpiy/PQ5I3jTZhiut6d
         LUDi+mYahPWaAN1WdXk3qPTY9lMUDUn6yJny20RHRE1qoFi+5+yHFv47es1cBAPKR+cj
         wrtzAI89HLbjFAudBCoQsnGrS5P3QOhiLkKAjo7OsRE20NooUJsedUmukz92yckDGQbU
         Dp4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747382555; x=1747987355;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bdKztaKZj+ArxWleSUI2lI0rhw/lHk7zt8SPSV2S+Ko=;
        b=sm1lsO9wm5d74HI3bzAU1axymvZH/JW8tdkAN5a2lxhyLKyYBRNNBVBCwHAa7MTm1J
         YStDdURDwCGTzC/PCpnLBBlHw5z4Jf/BxEZ1T8tMiBNe8/VdZurs6RKMJAbX8O+G8tKw
         qKL2iwrdy7Rkfj2LRHwbuUMYAJwzcHGUI2tLG5QthZy8fp5WY3NjinRLVenjWEhwZV8K
         YWqkUvEMeSBK26lcwrUoaet296ySJd2Wf1EZjPXgwy4xr+QPMK1mIYOgTXo2V69TYszp
         2qM9R2V6+kYaY1aNDolMahVlY23Db9JQv8BX1TcJkNkaIdLBOlSp40pOyEuMiBzlLGWz
         ovFg==
X-Forwarded-Encrypted: i=1; AJvYcCV2nAqo1UDBsxet5vykOp3VrcE/jFyFIvUui0IPVQG5KRFv4Pv3a33uAEQRR+Ft+6sbqgaSPEBbyC/gb4c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxpm3hSUjtpiFWceCm0fTpqZLA+ixQCDipru2rl7qAxRqrsFU6w
	eIBEUpUrea9lahSW2RTcTK92/Ps4Nkc4c6/zRBgvYpWNdDvLUu5FJNBj0Z8khvZcEqI=
X-Gm-Gg: ASbGncu2VLjd8q6ZTeujRzZN7t3+Lp82cgTZOtNRgJsunRZdgw9bHNU/AQmOoeX5iVI
	A0OLe2DD0V4dYgqGDZ0oJw5QX0+8V493Q/ueGkPBGzvFFNNZQPhWdCERAOtGi1mDorWteDGOi0F
	LAOaiawpBC2uHTQONxvHr94ub6reWdkgFT+JtucI2Hj8/i6IvMN4H/BCaIm9vevUD86PoAhxwJ7
	1wZf8JR5evIf+ITw71VPjsZsaB7CHLbQ1c9WHHN0X0QZNXdev/T5QQpVdeAMlYxnvdn40P071x0
	JiMTMI/IMSU4m+EQQxFPjgGK0B5LwUDvhUGZPd6zz+f/Srq0InY9ws2R+WiP95p7ETWvXkUWWux
	6oQIw2zvf2s4WYPxO
X-Google-Smtp-Source: AGHT+IGajP2MNPkEe6N02ds5+ATpXbBcyUjkhr3oNkMVyA1PAD1v31L2wT8EjnkrVr11DTg5FBDOMA==
X-Received: by 2002:a05:6000:2ca:b0:39a:ca05:54a9 with SMTP id ffacd0b85a97d-3a35c8263d1mr2594040f8f.29.1747382555439;
        Fri, 16 May 2025 01:02:35 -0700 (PDT)
Received: from localhost (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d185sm2005730f8f.98.2025.05.16.01.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 May 2025 01:02:34 -0700 (PDT)
Date: Fri, 16 May 2025 11:02:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Cristian Marussi <cristian.marussi@arm.com>
Cc: long.yunjian@zte.com.cn, sudeep.holla@arm.com, peng.fan@nxp.com,
	justin.chen@broadcom.com, florian.fainelli@broadcom.com,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, fang.yumeng@zte.com.cn,
	mou.yi@zte.com.cn, ouyang.maochun@zte.com.cn, xu.lifeng1@zte.com.cn
Subject: Re: [PATCH] firmware: arm_scmi: Use dev_err_probe() simplify the code
Message-ID: <4c970388-4b1e-4c5c-bc54-d55c2d9cd62b@suswa.mountain>
References: <20250515203855146Sn9x-Uw9Teur35mOjn41C@zte.com.cn>
 <aCXzPGvPayVyiMHG@pluto>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aCXzPGvPayVyiMHG@pluto>

On Thu, May 15, 2025 at 02:59:24PM +0100, Cristian Marussi wrote:
> On Thu, May 15, 2025 at 08:38:55PM +0800, long.yunjian@zte.com.cn wrote:
> > From: Yumeng Fang <fang.yumeng@zte.com.cn>
> > 
> 
> Hi,
> 
> > In the probe path, dev_err() can be replaced with dev_err_probe()
> > which will check if error code is -EPROBE_DEFER and prints the
> > error name. It also sets the defer probe reason which can be
> > checked later through debugfs.
> 
> All true...but...if you look at the main scmi_probe() function all of these
> failures are trapped at that level currently on the return path...
> 
> see the call chain from
> 
> scmi_probe()
> 	....
> 	ret = scmi_channels_setup(info); 
> 	...
> 
> ...so your probe errors will be overridden there with a more generic message
> left in debugfs at the top level.

Good point.  But that feels like a mistake in dev_err_probe().
Ideally, it would print the first error message.  I bet someone
will eventually fix this.

regards,
dan carpenter
