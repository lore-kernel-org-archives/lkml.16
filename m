Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D3E1990DE
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 17:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949206; cv=none; b=lpFVT/zbskvQtS88D08Mf/gbC8kXybzOwSoNPbZulGTcyZKEytHsNBrFETibJx04RcF9IIdsrDs5M8NEHKQHAcXJvKcbp6gnXZDG3tSvz4hi+sB5SeE59eyDsi4eXVKd+dXxRnwbVeHBM3lW4DdLq6bVA2HqHKr0KDdIRXLWlGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949206; c=relaxed/simple;
	bh=avwKJTHwZhEICbpkM2GsB25ND3png6YyHfACluZr+Ug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TWG4K4K9nQkNrQ4OmblXW9LeHACNs+Kcle/rnDBD6ElyC4A5U1J2mJcbxgMI2tqbhopllOgPr4iKT1xsSFevIFjrqVS9SqfD9ePhkGA6/9XHFoV6Mrmn2Rt0no7Qnj5Zp7kwrpXupaNJC2mtKSI/zmoqAgvmlPzzsg99Qy52/Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=byR1w/oE; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="byR1w/oE"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f50895565so15058945ad.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 09:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738949204; x=1739554004; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8kQ7aPeifT1xdGGMZlwPvaAdEmOG9nj84TNIl4A91gs=;
        b=byR1w/oED7Q6rEzBU+7qJGjHYCyqfUxqGMIPOhQPeJhbLZTPqWwuZJMQYkRBVswMdv
         YXDLKHyYpJ06soD/0Da0AvBeMkp56CilUOqSfNepxe8STCJQ3PGkP6p8pAOybL9go6YO
         mb/fYc24iwlrJBAgD6sWTFdozKC0Fd03IUJDJrOMYmbI1UIdr0SS6KyjjQYqmHw7mA/h
         n3L4ufRqsFvRyITX2tfLnSqXMntHKgVXaL40e57jD1dhsQ0jfbd2oKkj3e9xnvxJjh3K
         nkIgA2aHhHp6JCBTSz8DX90Ef6EeABtip6ByMI1tQSsf0mHXWzqTDSsU9HH/r9MgWHZM
         wSSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738949204; x=1739554004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8kQ7aPeifT1xdGGMZlwPvaAdEmOG9nj84TNIl4A91gs=;
        b=S8bhSFbMEFAhy0QVe6OQzX82aKLtDZC6AMyWCkCkXKMS2RkcsX8Es+K0PF9e/WCaR8
         YXjkNHdxODsCg7HXYcmfTX02Z0GVw0bPuz7V+C+0p+mtqyNdXgKbaQjT3BC2/EF4lChE
         tnSoGuC7tCMA+XGyZViev5hWOXUViUMp+v/3AgooRSHPoLMR1/+sraKvjoQ7ih2KzAtV
         ZhylCZEi6GOp4H3W2lhp/918BgxPWTNo5S9Il++IxiJkLmjYb82VizwqhXs4wZ8/e20H
         necmP6boVQvv+1fZSrleT1/T4lQxPGu7IOOWsnp71AxBwc2ebwTT1wukFhubrddFCm7Z
         0YyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWra5qdnDcXEumSXz9o1uCt3dg0O3uXHAt6UQgDW4vB1bV0ls4NVPpF9xrRwY2sN4hnEHzVTJ6AYjj+5tA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+HYOvrbeKvLE7TKMyBrFDIOK8d9mjhqYCzENp6T9aqKxH0+By
	y4jcQzP9HrIEDFs2Uq9Q/8KVJOJOIMBpailJVT8sBRYNvDL4cs4VfQookI6PdA==
X-Gm-Gg: ASbGnctvGlBQ8FqVL9RbDecKJd3KYf+sZPkstCWKC8f5G8v/nRBjme3wa3Fioh6bi2I
	/bnKV3IEplNJdEmfGQvcPicYLUnrhIo0LQFFLBdiXxKuOJplL7lo3w3pzg8pQwlxAghTRXp0mg9
	p/ZviXnTEDWiLE69wPUYTBe6Uv4F8K+unS1+L1uBZBG7TrCUL1hksNBY293Bh73GmrHf6zvNRy6
	pkv66WBUh9f+CjKieOej2XiDskEWJFtGs3qgnzYFBRGbT/mN++ief+Ng2+kGT9FUpI/KUtQVnI4
	RdQrGQI55IR617diGGDSQuaFHQ==
X-Google-Smtp-Source: AGHT+IGwlMJjAWRYza5p7WJGxEFFQpo89Mjy7QrfQNgroEojUj8PNO092Q8xdIFkP1o8AKidffm+WQ==
X-Received: by 2002:a05:6a20:d705:b0:1e6:509c:1664 with SMTP id adf61e73a8af0-1ee03b6f0ffmr6990656637.39.1738949204454;
        Fri, 07 Feb 2025 09:26:44 -0800 (PST)
Received: from thinkpad ([120.60.76.168])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048c16222sm3332034b3a.135.2025.02.07.09.26.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 09:26:43 -0800 (PST)
Date: Fri, 7 Feb 2025 22:56:40 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: kvalo@kernel.org, jjohnson@kernel.org, linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/3] wifi: ath11k/ath12k: Set IRQ affinity hint after
 requesting all shared IRQs
Message-ID: <20250207172640.npoa3ojrdhxg765a@thinkpad>
References: <20240823155502.57333-1-manivannan.sadhasivam@linaro.org>
 <a8f4f4e7-1c13-44d8-b19e-4ac85b48ee04@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8f4f4e7-1c13-44d8-b19e-4ac85b48ee04@oss.qualcomm.com>

On Fri, Jan 31, 2025 at 02:21:45PM -0800, Jeff Johnson wrote:
> On 8/23/2024 8:54 AM, Manivannan Sadhasivam wrote:
> > Hi,
> > 
> > This series fixes a warning from kernel IRQ core that gets triggered in the
> > error path of QCA6390 probe. While fixing that I also noticed the same issue in
> > the ath12k driver, so added an untested patch for the same.
> > 
> > Finally, I updated the irq_set_affinity_hint() API in both drivers as it was
> > depercated.
> > 
> > - Mani
> > 
> > Manivannan Sadhasivam (3):
> >   wifi: ath11k: Set IRQ affinity hint after requesting all shared IRQs
> >   wifi: ath12k: Set IRQ affinity hint after requesting all shared IRQs
> >   wifi: ath11k/ath12k: Replace irq_set_affinity_hint() with
> >     irq_set_affinity_and_hint()
> > 
> >  drivers/net/wireless/ath/ath11k/pci.c | 26 +++++++++++++-------------
> >  drivers/net/wireless/ath/ath12k/pci.c | 26 +++++++++++++-------------
> >  2 files changed, 26 insertions(+), 26 deletions(-)
> > 
> 
> What is the status of this series. I inherited it in Patchwork from Kalle.
> 
> It looks like there was a question if the 1/3 patch was actually applicable.
> 
> If we think this series is needed, can you rebase & repost?
> 

Yeah, this series slipped through the cracks. I will respin.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
