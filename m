Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360AB22CBE6
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 17:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744392082; cv=none; b=QEoqauM8qFr5aTWre4TJZ63kjzSeocVEB7s7CVHNMpwpSHiiFFI6MINTqWPmg2ar8D86ZVudSUPGDfgi0PZ1Gl7k4wMJOOC/pbHYL05SueRCukS+ctIQc3/8UWuUt0nqku95o+4ouWsAgyjIx/O1i9R2a6wtQjdIiIYm1UXViw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744392082; c=relaxed/simple;
	bh=9R9uLvsmeGoe14eRCjcItaLOJaEEHinQ3mbc0RgE83Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZlJiQhKeDefAQCXOVbHGAzUdBWN9vrJqLUprw2KmfzcQxfH0ddQU4gtIw0jvxQXwtuSgdVdklPYTSyDz1EOX1iXQnlMCwADY/+jONqYtNY9iEEUkMZsPi1HH5gl80e3d2BlKsFUliqxpwAffJL1kehZ5aeByA02ySm4rVfyB0ro=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pzXMU6+7; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pzXMU6+7"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22403cbb47fso25175175ad.0
        for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744392079; x=1744996879; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ptvUoeOx/AZMyIxL2MXssLTygn46TbSRcNaMqbuDt2w=;
        b=pzXMU6+74I1NKFQ4cCgXfY8uvYLZQtI3NJ8sGbYBpso31b0ADraTDwbo5jkqA5c/Q1
         JzfnL0+nJEnY6UgYKDzjMtm+hbahUw1R0wym2ZKoJyS2UcmYuFQTvjO3s5swkMe1i5hC
         PjL5dVwpGmR2bI95+fLxJn0P1hWvXHZErPU0T8WEehUz1WYfhr7s+FCv+ij2f8O+YHcK
         UmIDUmmCop7l+x6zg7Bcz/3rRoGbzd0r+tqj4GPbLck9ivGKMWf4B8VDn7Cv7O65Bz8J
         ohQn+wVu6/jlfbKFfwipWsYQ+5jriS47dAYCJmT3jVVGQPRnRc2a3GyfVVb/1/v7OxxS
         v17Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744392079; x=1744996879;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ptvUoeOx/AZMyIxL2MXssLTygn46TbSRcNaMqbuDt2w=;
        b=TDj5s334yx3pFwXsodbOvBnINi/YMw5R4ZJT8lHlI2zRgN9xc982At7qMMEX+UfseN
         E5JGaTviUb0Us5rDkfLRWfcye4qaHfgVyCqO1dHIBVM6gXYudmHrkT+B0nVCFAvjrzAf
         HYBIHXJ68gNTk/gFQcPe08jlDStgEJkk/TaDoJZhOrnU2mPmt3AyigqTNq7PuvHsVMSE
         XfTbWXSmbw1a4ESeoj5P0/aFNDuJnAmnyf8dqQBmVtZXQ8QRaZuNewGYOAGzbohGP0va
         tecxw0+Y6/wy/nppdPBAM5m4TTfdonpyF3BmjgWqYPgXTtCkwRwjFewhTm2laU/B8x/1
         NkIA==
X-Forwarded-Encrypted: i=1; AJvYcCXbZNTABsFPh/c8Q1IyUJQrEUNyvFue1WnRgzfc5ftmi6Nf1LgCcYtqGSNobjqPYJWe0kGJBbB6gvow4Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO7ao2lNSKBQV3jZbd3QhFI5fP4fFjER3dyrPBB18daobNUsvN
	tY9/LG65Zrsyw3exX9NT+UWtwBOHPv09NZwj18LDpyydsprvfzeu9dW4vMWNYA==
X-Gm-Gg: ASbGncv5Dc7tc/0gLCM7W8cbLzzDNzy5jc2yXz0UE8Fw7zRvLgv23F5t0gfq6rtBJYP
	f400287VJx33DYRHCjsFjVmfYxIF1W0xY75Cf0z8jO1BzH9rrp6UMFflj2l1eb3sS7txPyRWzuq
	6+hUewwtFQkF3UqL6bLqnyFwVqLm/UYhhFhtrsfyJZ8lIDz7rWO3EIUExVXso5N4jktWxn/c2WI
	3Mo2ENjzr8FcPX1XQeeA+SbhkvkOa1DCHjKykwVZing+FH67DcKL40ffGC49HU45KvvrqBV7swq
	r+w21v7d1zu7LowjTK43zsneontkP6V/AemPpgCGrMKT53nZ5ws=
X-Google-Smtp-Source: AGHT+IEkpe799Pegl6qkMrJUuoyw8pAVbCt7hNjunwJoxR7oSK/mpaIPaCfCt7LHX0P/PK4I3bcdSg==
X-Received: by 2002:a17:903:41ce:b0:224:11fc:40c0 with SMTP id d9443c01a7336-22bea4a3495mr53313805ad.11.1744392079396;
        Fri, 11 Apr 2025 10:21:19 -0700 (PDT)
Received: from thinkpad ([120.60.142.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b87885sm52538765ad.55.2025.04.11.10.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Apr 2025 10:21:19 -0700 (PDT)
Date: Fri, 11 Apr 2025 22:51:13 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Manish Pandey <quic_mapa@quicinc.com>
Cc: "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	"Martin K. Petersen" <martin.petersen@oracle.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Avri Altman <avri.altman@wdc.com>, Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, quic_nitirawa@quicinc.com, 
	quic_bhaskarv@quicinc.com, quic_rampraka@quicinc.com, quic_cang@quicinc.com, 
	quic_nguyenb@quicinc.com
Subject: Re: [PATCH V3 0/2] scsi: ufs: Implement Quirks for Samsung UFS
 Devices
Message-ID: <nziy3xvvduxeeav7umyvorguctatt7kw3tt6bvuvgwwn6knhbd@2nrs5wb5b2vb>
References: <20250411121630.21330-1-quic_mapa@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250411121630.21330-1-quic_mapa@quicinc.com>

On Fri, Apr 11, 2025 at 05:46:28PM +0530, Manish Pandey wrote:
> Introduce quirks for Samsung UFS devices to modify the PA TX HSG1 sync
> length and TX_HS_EQUALIZER settings on the Qualcomm UFS Host controller.
> 
> Additionally, Samsung UFS devices require extra time in hibern8 mode
> before exiting, beyond the standard handshaking phase between the host
> and device. Introduce a quirk to increase the PA_HIBERN8TIME parameter
> by 100 µs to ensure a proper hibernation process.

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

- Mani

> ---
> Changes in V3
> - Addressed Mani's comment and updated commit message.
> - used BIT macro in ufs-qcom.h to define quirks.
> Changes in V2
> - Split patches to add PA_HIBERN8TIME quirk in ufshcd.c
> 
> ---
> Manish Pandey (2):
>   ufs: qcom: Add quirks for Samsung UFS devices
>   scsi: ufs: introduce quirk to extend PA_HIBERN8TIME for UFS devices
> 
>  drivers/ufs/core/ufshcd.c   | 29 +++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.c | 43 +++++++++++++++++++++++++++++++++++++
>  drivers/ufs/host/ufs-qcom.h | 18 ++++++++++++++++
>  include/ufs/ufs_quirks.h    |  6 ++++++
>  4 files changed, 96 insertions(+)
> 
> -- 
> 2.17.1
> 

-- 
மணிவண்ணன் சதாசிவம்
