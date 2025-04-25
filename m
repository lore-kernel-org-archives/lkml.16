Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9637022FF37
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 08:59:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571600; cv=none; b=Kw3Dc+tcOUadDlCJK9s8LT1JsX7jodEboo4PV5LNbUFvUWP3GgGnB0sCsxXYfh0j+9a/wVC2dxq71Kxxx3Z/aAD/df4qYQdx2cdusQhL6INSGOvP3OBjnACM+tuXCIbVgRhnjEuXXy9FRDhUIeMmkftg/0vgAkFFSQnRRooNHwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571600; c=relaxed/simple;
	bh=+xSCE9MB+iXnfupVs0CKDPm7yuZw6BhgZRJ8oAX0TzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nmco/3/W+WI0xbdbgWp5pUqIsgHE282NPEEeu06DakHjdDrCoAlBACDW3zfmYsvxRi7g6Fo2ebBd/vHiwPw03ZJ4q42bqPTGNKvANTlxE/PD85/uugo3rkjc/dLqczwEOHLLHnf46vddNNvdOHdvgIvOvNtSTPJ0aCLviUQOVjU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=MGFA6Ng3; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="MGFA6Ng3"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-736c062b1f5so1710462b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 01:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745571598; x=1746176398; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QI7dIhq4gpO8qmw+kHNvoSNDB7nG2z7FjzlKM42EHH4=;
        b=MGFA6Ng33aHaiphc4JPoqhxE8pOz8TySAC21Fsun0ihZIWo2F2P/bJErOap+DiRaTy
         bb2YpBQiKVFyOiYxVc2n+eQe9WXuzisDAYpzjnzDLqSeqRcGrtdYYhfOoiRfAYdSh0Rb
         CNSvmA2mu3C26K8Uzn0uVLBjIeCK8dDOHkHC+JyLwnPpoTzbi2NkNOdMYHc+7CJDPWgw
         wYhk8Xw2uaWFA7INh2S+xXMb+9MoRteBbMKfFZZYST+oW4v40CeUkI0HTXBasouPFQzi
         nalkuuwcg13DLewsN9x1q6A0X/oy5qiqKrtZjNQdBQGH9zJ6UAeJcxR/mnU649Cfl+CV
         rcZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571598; x=1746176398;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QI7dIhq4gpO8qmw+kHNvoSNDB7nG2z7FjzlKM42EHH4=;
        b=SbA1YxDq873QyYNa8tIF+6m095ySYZ+rZF+sfhRKTuVxF1jafCeE/NmEtd1Bty+Ees
         N6RKEeyQpoYivtI1827q4KySDxTMzWFM9aPGFr/EzZ9Vt4vOM4Hd0q9Ra/OqGwqxjWMQ
         4f5Sz0tKzMHr6MBOZ3folMy+ZyikVqrLxjN4qbpR0IbxFmrDFZ66+PQgW26pt+AghtHZ
         KJEo58R5NEZtpRZ62skB9NfoeFgnaCmqtzf3yxSg66zkLqxQkLDat6OYImGohg4FYvH6
         HSSLMdeuf12RALWDrlE9Gmb8YBcAD8H3J0o8/1QHicPQY7NfmUvEM68m7q5gpZviOBtv
         Zong==
X-Forwarded-Encrypted: i=1; AJvYcCVzJWPuu+1A/RbK/jkCMbYfVuWVZinD+r0F9rD/795myFH9QOYamK70a3Qewc4V508VEdEjM7CMoPayBak=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwAJRiArNQEmtxR/kJjJ2gPM6bFAETPR9I7pqF7u0qzmxSl64o
	RFuYvGLbFAsY7YyaCqMuFXwhAnE9NZ7wJVE8SfYP/6Z57hnA9ohHSjUvW5EbiCg2oulihX86EMw
	=
X-Gm-Gg: ASbGncukCOSEbVOOJfIA3wvr1k2ZMhG8RQLhc4pof5PyQkxkgmOk0NU6061kg05Xjnk
	JDsLcWKe2/yXukYVlyfOREk75xAbxvJ1A8oiMVJo/780sDflZHz1Hoi7XKI/0qM0QBUKkJHOPVn
	LYdBJm3t3JEPG1ZKSYEa71wY39t36F4CJSfAR4yXY22gewai5l3QGPghzwagB9STLoTpSnfdmke
	k7hOm4gnD7OBMg/YujHdP8YdjcoKnjHlTLrcIETsWPS8rGpwFR+Iz6ldCf/azI8Lv2M+GYWwY3w
	ew7Vbn+rHj/VoBNPts2ROtb8qZ8N2sUk9HLRblHvOyCf/msOzjfEtqw1LM/zaA==
X-Google-Smtp-Source: AGHT+IFkKSjUiJTYpCxdE0/nSPU4m+TRaoZshePJKHL8MiFoZ1AglBgvtTwnzJQU1uuNvqEmm4Tfww==
X-Received: by 2002:a05:6a00:21c6:b0:73e:359:acf4 with SMTP id d2e1a72fcca58-73fc7866454mr2183157b3a.0.1745571597887;
        Fri, 25 Apr 2025 01:59:57 -0700 (PDT)
Received: from thinkpad ([120.60.77.160])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25962f61sm2688128b3a.74.2025.04.25.01.59.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 01:59:57 -0700 (PDT)
Date: Fri, 25 Apr 2025 14:29:50 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Muhammad Usama Anjum <usama.anjum@collabora.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, 
	Jeff Johnson <jjohnson@kernel.org>, Jeffrey Hugo <quic_jhugo@quicinc.com>, 
	Yan Zhen <yanzhen@vivo.com>, Youssef Samir <quic_yabdulra@quicinc.com>, 
	Qiang Yu <quic_qianyu@quicinc.com>, Alex Elder <elder@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Kunwu Chan <chentao@kylinos.cn>, kernel@collabora.com, 
	mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-wireless@vger.kernel.org, ath11k@lists.infradead.org
Subject: Re: [PATCH v2] bus: mhi: host: don't free bhie tables during
 suspend/hibernation
Message-ID: <y5odcxzms6mwpz5bdxhbjxo7p6whsdgwm772usmmzqobhf6nam@p4ul7vn7d3an>
References: <20250410145704.207969-1-usama.anjum@collabora.com>
 <h2wv7drxntokziiwbzjw5xjzbctbomp6cfcba7ppfbih6o7so7@p6dazv32xfx4>
 <1136c7cb-1c7b-410b-93d2-c74aec939196@collabora.com>
 <cfb3sntvqhupyhm2m5tevpsl77r6mzl2aqzr3wtxvr22bezmp3@qjh7ftr2kdjy>
 <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4d87ef88-3533-4255-adc6-6c268818fe25@collabora.com>

On Fri, Apr 25, 2025 at 12:42:38PM +0500, Muhammad Usama Anjum wrote:
> On 4/25/25 12:32 PM, Manivannan Sadhasivam wrote:
> > On Fri, Apr 25, 2025 at 12:14:39PM +0500, Muhammad Usama Anjum wrote:
> >> On 4/25/25 12:04 PM, Manivannan Sadhasivam wrote:
> >>> On Thu, Apr 10, 2025 at 07:56:54PM +0500, Muhammad Usama Anjum wrote:
> >>>> Fix dma_direct_alloc() failure at resume time during bhie_table
> >>>> allocation. There is a crash report where at resume time, the memory
> >>>> from the dma doesn't get allocated and MHI fails to re-initialize.
> >>>> There may be fragmentation of some kind which fails the allocation
> >>>> call.
> >>>>
> >>>
> >>> If dma_direct_alloc() fails, then it is a platform limitation/issue. We cannot
> >>> workaround that in the device drivers. What is the guarantee that other drivers
> >>> will also continue to work? Will you go ahead and patch all of them which
> >>> release memory during suspend?
> >>>
> >>> Please investigate why the allocation fails. Even this is not a device issue, so
> >>> we cannot add quirks :/
> >> This isn't a platform specific quirk. We are only hitting it because
> >> there is high memory pressure during suspend/resume. This dma allocation
> >> failure can happen with memory pressure on any device.
> >>
> > 
> > Yes.
> Thanks for understanding.
> 
> > 
> >> The purpose of this patch is just to make driver more robust to memory
> >> pressure during resume.
> >>
> >> I'm not sure about MHI. But other drivers already have such patches as
> >> dma_direct_alloc() is susceptible to failures when memory pressure is
> >> high. This patch was motivated from ath12k [1] and ath11k [2].
> >>
> > 
> > Even if we patch the MHI driver, the issue is going to trip some other driver.
> > How does the DMA memory goes low during resume? So some other driver is
> > consuming more than it did during probe()?
> Think it like this. The first probe happens just after boot. Most of the
> RAM was empty. Then let's say user launches applications which not only
> consume entire RAM but also the Swap. The DMA memory area is the first
> ~4GB on x86_64 (if I'm not mistaken). Now at resume time when we want to
> allocate memory from dma, it may not be available entirely or because of
> fragmentation we cannot allocate that much contiguous memory.
> 

Looks like you have a workload that consumes the limited DMA coherent memory.
Most likely the GPU applications I think.

> In our testing and real world cases, right now only wifi driver is
> misbehaving. Wifi is also very important. So we are hoping to make wifi
> driver robust.
> 

Sounds fair. If you want to move forward, please modify the exisiting
mhi_power_down_keep_dev() to include this partial unprepare as well:

mhi_power_down_unprepare_keep_dev()

Since both APIs are anyway going to be used together, I don't see a need to
introduce yet another API.

- Mani

> > 
> >> [1]
> >> https://lore.kernel.org/all/20240419034034.2842-1-quic_bqiang@quicinc.com/
> >> [2]
> >> https://lore.kernel.org/all/20220506141448.10340-1-quic_akolli@quicinc.com/
> >>
> >> What do you think can be the way forward for this patch?
> >>
> > 
> > Let's try first to analyze why the memory pressure happens during suspend. As I
> > can see, even if we fix the MHI driver, you are likely to hit this issue
> > somewhere else.>
> > - Mani
> > 
> >>>
> > 
> > [...]
> > 
> >>> Did you intend to leak this information? If not, please remove it from
> >>> stacktrace.
> >> The device isn't private. Its fine.
> >>
> > 
> > Okay.
> > 
> > - Mani
> > 
> 
> 
> -- 
> Regards,
> Usama

-- 
மணிவண்ணன் சதாசிவம்
