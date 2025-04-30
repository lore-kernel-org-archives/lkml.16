Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54146F06A
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 06:23:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745994233; cv=none; b=nzsEQNyNjrFf5rD6mi6EnkpENwat2AjP3WYBudGTuau2JYi6ZZ7j1HhYMi/72LYyTq8pZaUCtxN3HoCWfUmGAY2EFdH5+vhJjDwnPjKMycQkiz5KZEr37ffzc6HfkvnICIDN1n3VYsk+mk8ilX3arjtiVznS1JTAlxuYQbgjOG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745994233; c=relaxed/simple;
	bh=QdW0ibxTwWwREp4tWV5Y7Dah9FZgyJW4dRHXA8zibYs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBsBRWmJ9sAEzDQSezRpp4F79UbMQ/+yr/eNRNv/gRNubYdcLIzbJJMcweQ7h9qdJH6sIrQExaUtl2L/VR8QrtMhJCt14bd9PWZodtCYgXVGK8Tdw+dup/7V+KwxURCmmb1cNGLzOUb636YVHVAxIb8g8wU4M8mWSsVhybHX3+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UU5l5+rv; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UU5l5+rv"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-22c33ac23edso63579045ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 23:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745994230; x=1746599030; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=03WoV54tz3M6hwT9sU/vqgSJjnQ/tgaaDuyl7WpQlLc=;
        b=UU5l5+rv8og/Lm41FBjsfDNBIBSDIXkQu1uR6hCKoHqpEt83qKgiTA2Y8nLRsD1NnZ
         jutsCYGXhojLY8wZRTxtWl/PGfa32/RCAN5SLvj4sTn3XLQO9GWrmGr7ZGYijf1eoOjr
         n9lhFY3hXnTzUolYkKJCpYmTs3q0WmguGGxcYZvLnVhJId6UWwnyIJ6rk4wKhK7EPrE1
         XbSKQRiiE8hqL34FqsIcGdz9E7KWboxoffI2qHcSjgVv+iu6rjAlMA1UoTU4yNUsqNa4
         Bwm5H3wuinlxomNRF51OoywFy1nyNwK/MucSrIrX0mMIu8wM2fW885H7D4wu4sIwkNn8
         xeow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745994230; x=1746599030;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=03WoV54tz3M6hwT9sU/vqgSJjnQ/tgaaDuyl7WpQlLc=;
        b=vjkFMNeqVmZLufRVLGeu5NJmTzh3MQMagRRvgozAO6wQyKQQSF0zAC7QKDIDp29jIx
         BX3IvTqUEamMtkpzVrlItDMgvRhExTp6Q1k8n0OgFzlA8rSJfo8DTSKaKhoCY4rUwV1j
         ljTBN1sqlcCNbq95DOB1okCYIAqP7sVOy4dxglsppHlAzOSI5n5NUBQdgm/ddZnxSSPV
         Xx5bA/FqvhwSb5vEptmiAV57CWJIh6j1PLcIl7zSzbMXpKjXI4pqxgkCh+x6tY6ydHZs
         AKrHIfNcwmWJX7rg9dJN0dVJiG7VPC9aSz+m6yAn48dQIh6SP0tcdOSmiuz1/CDOjwwH
         DfwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyQR/ToPYOnMDqydQq57nRsy+U7u2yOERpnzbwfz5or2CB+0ykoJekbPx4YFgknvww8kS6TDJesolzkLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTZVYxnFBf6ULSXn5R/J1ZsnhMizOZ2vGdEhp55PEHRQssSiti
	i26mpPbj8y//7yxYZLI2x4XDPohl9BPG+K67Y/766JZmMGR3+B5Nx9CdTa50lg==
X-Gm-Gg: ASbGncu1l00VcJ5xgnPoQigZgNPUN+FoD68tQ9q6p8ITwvyEzwiO9JlyAuYUx//SY3Y
	kbhFUSdmkLlQzLlkEI/Akxn8izv8l58pmB1jDbOAvFT4ZPY4x/WfzawUv9sCKsklJrdDfZs5RuR
	xw/Rd3yuTQue7E5ltPetR/Iv5Yu1TOMAq7FNgzo9bYIX3MdRSsPe/hpuKN6d9BfKoZziqbLL5c1
	RCzYlpQwL9jLMJoOL1wUSxX4CQy1Kgy92+zG+aDt/5V03inF9TDMUQZUU8el0/CAtueZ0bwwgBv
	e6MRUwk/aWCaOCF5IQaEGp0jKzx6IsiG/JF1kOJRxWRZVKgU5WR1
X-Google-Smtp-Source: AGHT+IEeslhmFcqhuBeb3fAJDK9HU4zUhtq5N9GUPDoyLQYoyCTcLVDmw51YcSLVIRANtjSCwllR4A==
X-Received: by 2002:a17:902:f68e:b0:224:826:279e with SMTP id d9443c01a7336-22df35887e6mr32343915ad.50.1745994230152;
        Tue, 29 Apr 2025 23:23:50 -0700 (PDT)
Received: from thinkpad ([120.56.197.193])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db5221943sm113794745ad.249.2025.04.29.23.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 23:23:49 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:53:46 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Devendra K Verma <devverma@amd.com>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
	michal.simek@amd.com, vkoul@kernel.org
Subject: Re: [RESEND PATCH] dmaengine: dw-edma: Add HDMA NATIVE map check
Message-ID: <lmfkq4k6fkm4rlayysf3m2qpbyejfkgxubu2c7txtvwzlp6ua6@6jl7glnnndcf>
References: <20250429113048.199179-1-devverma@amd.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250429113048.199179-1-devverma@amd.com>

On Tue, Apr 29, 2025 at 05:00:48PM +0530, Devendra K Verma wrote:
> The HDMA IP supports the HDMA_NATIVE map format as part of Vendor-Specific
> Extended Capability. Added the check for HDMA_NATIVE map format.
> The check for map format enables the IP specific function invocation
> during the DMA ops.
> 

You also need to update the 'Debug info' part in dw_edma_pcie_probe().

- Mani

> Signed-off-by: Devendra K Verma <devverma@amd.com>
> ---
>  drivers/dma/dw-edma/dw-edma-pcie.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/dma/dw-edma/dw-edma-pcie.c b/drivers/dma/dw-edma/dw-edma-pcie.c
> index 1c6043751dc9..42b2a554f7a5 100644
> --- a/drivers/dma/dw-edma/dw-edma-pcie.c
> +++ b/drivers/dma/dw-edma/dw-edma-pcie.c
> @@ -136,7 +136,8 @@ static void dw_edma_pcie_get_vsec_dma_data(struct pci_dev *pdev,
>  	map = FIELD_GET(DW_PCIE_VSEC_DMA_MAP, val);
>  	if (map != EDMA_MF_EDMA_LEGACY &&
>  	    map != EDMA_MF_EDMA_UNROLL &&
> -	    map != EDMA_MF_HDMA_COMPAT)
> +	    map != EDMA_MF_HDMA_COMPAT &&
> +	    map != EDMA_MF_HDMA_NATIVE)
>  		return;
>  
>  	pdata->mf = map;
> -- 
> 2.43.0
> 

-- 
மணிவண்ணன் சதாசிவம்
