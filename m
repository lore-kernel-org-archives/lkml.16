Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C26927466
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745471289; cv=none; b=YvbFz5CqdjvApvFMht/ZWzk/ZeF0gzGAZm5s01mQjmAtfvDOphM/4MqKCfr3bOMrb/mMmuSdSaIL07Ve8BRyO3pczMeK/+jmZQxB1M+pVFBiBclLuo8iX75pIdy/m3wA0n4S55IIu6JqHeN0ndWz/KqBCah+oX+WoAPmPEvU5ic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745471289; c=relaxed/simple;
	bh=F6uOsjghVkNbX3/0dSdkmIOYm376mVnitly79L1kdAc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dy2YWEoi3z56uQn3004AOV53A9Tgmdk0+1vM0zPMAGgeItWsIrZrXzupqC3zmsYkyc6wWkjfM65BRnoX+tHcaxOZLsyqkZds53v3rnom12/yw7mjIF84T2Yxrsd3pmqmNLW+wH7m2yHs27WSNn1LBBmHFi8Ai7fLNIQFTDgMSP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=k9Eq1uaP; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="k9Eq1uaP"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c062b1f5so465666b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 22:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745471286; x=1746076086; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HCRkAMDBEcZOvUbHZMZAot/OwWs2AVrCZxyXey4UAAU=;
        b=k9Eq1uaP9WzOUQ/77JzVT0kKiCWUkz4F/mYPr2dvWYHMbXUd//J9awqwT8LYeej1rY
         7DJYrkguQ4x3OC/OSNCpVOBQbgEYAFvTATa734VOV5OP+XiJRvd7FdbVStWC40qYEs4q
         3IwNnpoNziNSz2/y0Mlbehvndgct+tLRDUFpW5OOiPR/qkN4/i1Ja/NsPMqDhmmCDV7e
         jbm86zbzEkAiTdhLD2B/WqnlSTZiPzAl+8p7XUuPH/mIh1yeGJtywlO5pNrbieIgUNOP
         Le3Rs/rn9B3AefNP1vESuYE8gOa61PPj1up16vrso/in5iyG1M07UCIkV861y0Wn4wXW
         /sPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745471286; x=1746076086;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HCRkAMDBEcZOvUbHZMZAot/OwWs2AVrCZxyXey4UAAU=;
        b=VuFHCN/UlOYHPM2AULkGaqv3Crcab4GL7jRV8s2/1KLl35t5XT8AIwnZQeA1YDNCE2
         57IRe1MDxiPEgQHvli5WldqutGPhuDaHR9TDcy7/4tyGZkQDAiQFZl5Gt3TFW+nOKrFs
         xE8XJ9Xu9ymvYO8X3kTFMbw5k2Wjtq9cNIJK1jHllfOkyhQWLzukNAJfKKiDFHR0YfCZ
         Fs4wgP/NwZTZQAgKOATOJGMFKDVUcIdij14yUk6yj+F682qw9BMxL9sFKlAuiJkV51Nn
         y2xBdYaKd6FLkkQLQb/ubKkOLZCqL9YyriI01ea8TSofxaDsLfF2nCQ/DfnMcGRYdEsc
         81FQ==
X-Forwarded-Encrypted: i=1; AJvYcCVQcbvOGTmhmzA3COF6FE/I4JAbORxzsPWYKm8b+Gw8Ihu12egbwveo27FI7AzQ7TmfyTNr007QAasdJHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxwMJe2Nno2DlpxutEG/dOsUDq5/S5R/4LJou6MTzkxOOVnPXGn
	/oHIwEC8UxGXkW9aHtM33EV3SG2RVu4Zg4My3bFmj6qv4i6ccsfArYl6pN5zXXF/179KbUqZARw
	=
X-Gm-Gg: ASbGncsxw6gy53C9i9nuwwSkupsVqla2G5wyumPLPEuau+B1s1BzaNaN0OPtGMSZUaf
	WD/oSM5j5qK6OhSX2SryOkAAMM1cdG5WDPnsCuIJuIsw2TXwewsQLtssIyBYQtXK1z56p5+Qx4/
	6ArfVLV9BSmuMg7DvCOsUoS9H5va1mHUD9PuEO6W6elhqq0nYkyy0cyvlu15qOQd2TJpd8Zyoao
	M9VgleeB4Wb+6AgztRP7tNBFKJCdz0vpj2YjgQpnzbVax/93CjC906KV/h+4zAbAUR+nVTnAaGn
	OFIrWaO8piR1aCNaCViF9xmrr2m2PhcuOspcTjkW13X1UNa70yA=
X-Google-Smtp-Source: AGHT+IHKk0j4Ltd7MUfpRKyZV9i9ybMMdwfMuPy+Of0VruZIuaYQ9y0Zu4YDFK6qnZd7N1n/vaXojA==
X-Received: by 2002:a05:6a00:448a:b0:736:ab49:d56 with SMTP id d2e1a72fcca58-73e244bab2amr1856960b3a.1.1745471286543;
        Wed, 23 Apr 2025 22:08:06 -0700 (PDT)
Received: from thinkpad ([120.60.139.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25aca621sm486790b3a.163.2025.04.23.22.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 22:08:06 -0700 (PDT)
Date: Thu, 24 Apr 2025 10:37:59 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
Cc: mhi@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: mhi: host: pci_generic: Remove assign resource usage
Message-ID: <pslapnhzptjtognzwaiqmlhgfrlbhk245pem6gbxbjwkk3nhx4@uux4cjcsqtst>
References: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250416-remove_assin_resource-v1-1-e92dd361fa0a@quicinc.com>

On Wed, Apr 16, 2025 at 10:49:51AM +0530, Subramanian Ananthanarayanan wrote:
> Avoid redundant usage of pci_assign_resource for BAR allocation.
> This is already taken care by PCIe framework. Invocation of this
> API leads to unnecessary relocation of BAR space to a new memory
> address.
> 
> Signed-off-by: Subramanian Ananthanarayanan <quic_skananth@quicinc.com>

Applied to mhi-next!

- Mani

> ---
>  drivers/bus/mhi/host/pci_generic.c | 4 ----
>  1 file changed, 4 deletions(-)
> 
> diff --git a/drivers/bus/mhi/host/pci_generic.c b/drivers/bus/mhi/host/pci_generic.c
> index 03aa88795209..7501abc835c7 100644
> --- a/drivers/bus/mhi/host/pci_generic.c
> +++ b/drivers/bus/mhi/host/pci_generic.c
> @@ -996,10 +996,6 @@ static int mhi_pci_claim(struct mhi_controller *mhi_cntrl,
>  	struct pci_dev *pdev = to_pci_dev(mhi_cntrl->cntrl_dev);
>  	int err;
>  
> -	err = pci_assign_resource(pdev, bar_num);
> -	if (err)
> -		return err;
> -
>  	err = pcim_enable_device(pdev);
>  	if (err) {
>  		dev_err(&pdev->dev, "failed to enable pci device: %d\n", err);
> 
> ---
> base-commit: 5b37f7bfff3b1582c34be8fb23968b226db71ebd
> change-id: 20250416-remove_assin_resource-aa0db88d02eb
> 
> Best regards,
> -- 
> Subramanian Ananthanarayanan <quic_skananth@quicinc.com>
> 

-- 
மணிவண்ணன் சதாசிவம்
