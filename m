Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C44571DDA24
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:07:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746108475; cv=none; b=kihF8jB/uzqSx4h0DmjT1Od+spOwllTKdzav6+I8GxaS8vP5b9qclFOfDVgdva++3b8+h5jX9Lkpy2du8zBZjbWUzad0sOPEVWFYfhJXnF5El4/8kDTBHvKg5D/QL8/bRPDvpQ9DBtOvHbTxSwhmxhxeFXlJ8gVGlQOkRsQIzq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746108475; c=relaxed/simple;
	bh=9lC6JDyhN5Ye3uhPem/9/CiQIrSt2QGWIsm0S3JRraA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JkwaJVDSMLMK59B8piV9U3DHZNU9TBDFexLHa3Y+h0bnK4sFkMzovcXai+JQPTKQClB76Z4oj9EucNAtrY6PE12IOPgnLTdLerI3G3oKKpJyQZIvg9pGFAO3AMTCOpDRsMGD8rvBgM0eLc3u49US1D8nV7FuqNjHuCoqkrsJQy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QF1qJb9G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QF1qJb9G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746108472;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AcrNyKhVOmoLr0oSNLK0T/cJNvY0MVzyEpaG1k/ubdI=;
	b=QF1qJb9GeExo3NDnKj5KevKcv4g7oTllXqjA3WD2DfCM0+7QqmszpwuyAwmjDeX0Nw68an
	l+0Nn2E+iqUSGynxKWoD1XnLK+PluyIsQe6iGfJoXw/+FCt1tUuBaJ5dz2bIkPT8R6nDyo
	lIgjn1o0uExa6XE7aZqoRD3WU0pi8Rk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-240-dzLsiFtXMha2FXZwroiBVA-1; Thu, 01 May 2025 10:07:50 -0400
X-MC-Unique: dzLsiFtXMha2FXZwroiBVA-1
X-Mimecast-MFC-AGG-ID: dzLsiFtXMha2FXZwroiBVA_1746108468
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-ace99fe4282so107621566b.1
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:07:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746108468; x=1746713268;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AcrNyKhVOmoLr0oSNLK0T/cJNvY0MVzyEpaG1k/ubdI=;
        b=drL7TniWmfBqH6wUHSMJ+e2gF8DmuWMensz/X7UkEZB7XDAlmRn03ZgGvcXs8a4kGi
         aVvlmZY9BjnQ1hezbGNAvA007AiQ4p9gNpVp0fSRqUdaghVL0fYNXarGt52nF8UPKHKS
         tG+X8G61ZtmxvPm46NFIRUMhvosEAKdhniMK22I+mNVG9tFJdJJC92YmAJjY8imvGPqG
         FtH2IVx4GWtt3RRDLCzu6hsCtfVp/xvCBkYKx2tFS/7ZyyMMJ2Gvx7P39wiEFkHOcdVo
         vbd9xYDpAWeidPT8PMUxt17uhRyQQy0fB3NcFiUKJj0YUESEpvjJGyTSEYdG3zaO3+M4
         hN3w==
X-Gm-Message-State: AOJu0Yx1ovVHouI1CY/06mOFlekw+lzZL0no35iNd4wvgoHg4GSgbnPn
	KXfOT9qJF/roj9/ZDcOG3wGbf3AsoagjsJGmveNg7E1oUgQBEJ0EmJxnxiVwpjtjvHwOAhjwiTu
	tO8NyjcyeG9V2pdVKJLXHOf2QV0+q5Ov7vS4OjSxS/P+pnyGaq3UfgWqeb9NTww==
X-Gm-Gg: ASbGncvX63w1HUsw5tV2QYGhqjqPL20KtwzzDGeAdz6ZRcA3m+wm8cEedDhMahiaycM
	L6DIplZkPfyeVNSkrfZf3hLalrBbkn/FQ4d+9q7zfNT0Q94SAjuK7wai/Ev112/jjpwdLIMNyis
	0aTovQcsV/L53PQQQ/uOjWSh90WKtppodDEcnXUQSqy1mZKzEjnsVi6teEdg1CzUsaKTgBdKCdz
	K8upjoefxWAnmKcc52phhybjx2HG0aMRoNtdFP6WRktjb8Z6bcPWwWgn41A84cajVa1Qrd1E8p6
	HIh1BPgrx3PxHwM0IJuIaSS5DzRl1tW/oQB1tPt8m0pa7T+ixaeaQcI6DYD/e89nRs+XkQ7dF90
	OgHggx+q0wrUklTzhyYhzEcEAecxeOGk5ogfJQqY2c0iJ7zmYADvlSELybpzeEw==
X-Received: by 2002:a17:907:bc96:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-aceff3c3dc2mr205251466b.21.1746108467789;
        Thu, 01 May 2025 07:07:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOaCqfR6tnOcmlekhmwPg9qvklGDS8NHNOZ/TTonxjbbreUzOoz/tZ2SucDrZZ+SKYUtYWjA==
X-Received: by 2002:a17:907:bc96:b0:ace:dc05:b186 with SMTP id a640c23a62f3a-aceff3c3dc2mr205246866b.21.1746108467411;
        Thu, 01 May 2025 07:07:47 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad0da55af28sm44458566b.125.2025.05.01.07.07.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 07:07:46 -0700 (PDT)
Message-ID: <829bc6a0-bb93-46db-b039-5df0a68ce0b5@redhat.com>
Date: Thu, 1 May 2025 16:07:46 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] media: atomisp: fix spelling error in
 ia_css_sdis2_types.h
To: Liu Jing <liujing@cmss.chinamobile.com>, andy@kernel.org,
 mchehab@kernel.org, sakari.ailus@linux.intel.com, gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-staging@lists.linux.dev
References: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20241209064022.4342-1-liujing@cmss.chinamobile.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 9-Dec-24 7:40 AM, Liu Jing wrote:
> fix the coefficients spelling error in ia_css_sdis2_types.h
> 
> Signed-off-by: Liu Jing <liujing@cmss.chinamobile.com>

Thank you for your patch.

I have merged this in my media-atomisp branch:
https://git.kernel.org/pub/scm/linux/kernel/git/hansg/linux.git/log/?h=media-atomisp

And this patch will be included in my next
pull-request to Mauro (to media subsystem maintainer)

Regards,

Hans




> 
> diff --git a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> index f37802878528..2bed08435755 100644
> --- a/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> +++ b/drivers/staging/media/atomisp/pci/isp/kernels/sdis/sdis_2/ia_css_sdis2_types.h
> @@ -19,7 +19,7 @@
>  #endif
>  
>  /* DVS 2.0 Coefficient types. This structure contains 4 pointers to
> - *  arrays that contain the coeffients for each type.
> + *  arrays that contain the coefficients for each type.
>   */
>  struct ia_css_dvs2_coef_types {
>  	s16 *odd_real; /** real part of the odd coefficients*/

