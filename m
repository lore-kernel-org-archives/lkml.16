Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B2BE227B83
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 13:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749128653; cv=none; b=kqhienpdSN1ZuDorXdKrmdiTDiR3UExQzr2OBcc3huXqVrY221jlFKWCbpQwoig4iaUDitnKxbUdkgDieI8uSLhtx3j6m0EiZgjEzFtrVa0XUYK04uRtapzWPzT2W9Ef5JvZXRP6M/QK/0JbWuv1BfRqqgZFVv+351AwRNbwoqs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749128653; c=relaxed/simple;
	bh=t4faCEII9JXsy8bQ1teoJQwe81rcZnPfPN7AzMQqsho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LnmBITIwg4Ty99ppexJh2JnrMYJX4LQy4uA3fCEHpS5DC04dunE/o0/v4gLCL2IQr7QqacN37cOkok3Z20MC4zmLHt8DqzgDoLZQ3xh9USIZ1XnD8ExvSd4ThIeX0vdoa7I3oj75ae7Bn7gs+AwBIBB276D8WxV2oufZgh1T7A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mulHPlET; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mulHPlET"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a3758b122cso589243f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 06:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749128648; x=1749733448; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=;
        b=mulHPlETvc4CWLowZXAx5uUDZhvngCJrGFk/p/Cet1lOuVmoi+EAvSmzw2gNd4yvu+
         6mhcwzKBqWNKF3r6jtQVlGUWKI+wCEFNPFQfI3BL+5DjPTHsDun50c5K99Xtni1G+/Al
         GT+/L3vzl9BwYO9jI70XqAu22Pa+2VQR3C6oiS0d+/EvS0Bj1roCL2mjcSHOAFDdtoAK
         SyqkpcD8wHWuRcA/HoyM12OMUKbm2PmdhZYIMB6sQrCJ3Ue0GU/RqsFMrrrZkgZxbjs6
         CrIafZBZLKUt/+93GgV43C8p2S8A/HJKaTY39iSCtcLldaitux4nxKD4ij4hG6+SPibT
         6YTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749128648; x=1749733448;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q9thax7IB2ssxJhFBCOKiLh16kICG5rEU7Rz9YHU3JE=;
        b=C1QxUwbp8jb/Of9nysgcsApsNRbLxTQyLhN4+W2C5nmzI35bZvx7S3ONeIDhuCi+kH
         vfMiyHr6sV20Ukvj/Hod81l2oHntTkqsARSmDxXmOnj6xki7zQYx6B8ZRsfsPrMDN+g9
         LRBVSUsx9LtqEst+lxplyzlWiSz7KDCqXiBvHMg65ZSqvyq+0vugNNwUBWwmxkcuebYf
         3CJ8171RQtZEbiyY6WfYjyoiToodD5rZUnL8pOFxAJq5xf1VgWYozTNgCFzEl5g5N6PS
         XlRXfy8i0Jy13bEQxSoNROtKoM4d2iPFH5jxQhZxcBkcAC6nbLyzWglOe8dcDfxp6oA4
         /W9g==
X-Forwarded-Encrypted: i=1; AJvYcCXdCCuRxKCZ6uFdCS/fcd5IaJ1c3/M5zgd7iye9moUU+/L6ZJzPdETCeUS6gDDBqjzXO5MJPf27i/45oW4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJyxMgUjiAhZuN3xUXBwBfbQDaOBfQ6CWyEFP3KouXBGdgyVpy
	Vb25kt+m4by/oa/NW9epOCsKiArDAlCaofmmHcJWwz1+n+nSSzMaNu+gaKtokh1jHsHEJd6H743
	dDqWlMb8=
X-Gm-Gg: ASbGncusaVeCrH93ea01DsD70sDVEWUzlbLOk8get2G4feW2wLx+gfFH7HOdYwwkOT5
	7g1ocg7NcDAZpLr0BpsB8qcUsPO4JDbBxnTBifn9JICOYb5jSNo7D5jstfSgns6JnsbvWL4d6i7
	TkAIFGHbPlXcDhxfLfJlDgX8B6zeZXlrHte9pHYKc47WDJgQn9ho2rrME72mLLSb/MPzd3vx50X
	wIDu3h5tMNI21UuJ5zl8gHcwAskxHajTd2hut9WrdNdULiM4TnCjoroIlSY+6jvWsYSMhpfIrOy
	AvC1gaiREmjppU/xnQ0jojhoOdZVkRt56MNQ8Zm01xM3lp0sEkcvOU/B6xA=
X-Google-Smtp-Source: AGHT+IE/BmSVdL4tbFWwRI8QdSGrFvhSPvFKD3SoCTJ/6Nr+n1FoiYUpOSD1J4F7Wnuta6OWoz81dA==
X-Received: by 2002:a05:6000:40e0:b0:3a4:ea40:4d3f with SMTP id ffacd0b85a97d-3a51d973c93mr6275072f8f.53.1749128648387;
        Thu, 05 Jun 2025 06:04:08 -0700 (PDT)
Received: from [192.168.1.221] ([5.30.189.74])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a525da8e66sm2814969f8f.38.2025.06.05.06.04.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Jun 2025 06:04:07 -0700 (PDT)
Message-ID: <3c6513fe-83b3-4117-8df6-6f8c7eb07303@linaro.org>
Date: Thu, 5 Jun 2025 16:04:04 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] dmaengine: qcom_hidma: fix handoff FIFO memory leak
 on driver removal
To: Qasim Ijaz <qasdev00@gmail.com>, Sinan Kaya <okaya@kernel.org>,
 Vinod Koul <vkoul@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: stable@vger.kernel.org
References: <20250601224231.24317-1-qasdev00@gmail.com>
 <20250601224231.24317-3-qasdev00@gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <20250601224231.24317-3-qasdev00@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/2/25 01:42, Qasim Ijaz wrote:
> hidma_ll_init() allocates a handoff FIFO, but the matching 
> hidma_ll_uninit() function (which is invoked in remove()) 
> never releases it, leaking memory.
> 
> To fix this call kfifo_free in hidma_ll_uninit().
> 
> Fixes: d1615ca2e085 ("dmaengine: qcom_hidma: implement lower level hardware interface")
> Cc: stable@vger.kernel.org
> Signed-off-by: Qasim Ijaz <qasdev00@gmail.com>
> 
> ---
>  drivers/dma/qcom/hidma_ll.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/dma/qcom/hidma_ll.c b/drivers/dma/qcom/hidma_ll.c
> index fee448499777..0c2bae46746c 100644
> --- a/drivers/dma/qcom/hidma_ll.c
> +++ b/drivers/dma/qcom/hidma_ll.c
> @@ -816,6 +816,7 @@ int hidma_ll_uninit(struct hidma_lldev *lldev)
>  
>  	required_bytes = sizeof(struct hidma_tre) * lldev->nr_tres;
>  	tasklet_kill(&lldev->task);
> +	kfifo_free(&lldev->handoff_fifo);
>  	memset(lldev->trepool, 0, required_bytes);
>  	lldev->trepool = NULL;
>  	atomic_set(&lldev->pending_tre_count, 0);

Is it possible that the handoff_fifo is freed, then we could observe
reset complete interrupts before they are being cleared in
hidma_ll_uninit later on, which would lead to the following call chain

 hidma_ll_inthandler - hidma_ll_int_handler_internal -
hidma_handle_tre_completion - hidma_post_completed -
tasklet_schedule(&lldev->task); - hidma_ll_tre_complete - kfifo_out

?
