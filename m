Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D159828FAB9
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 16:07:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751299669; cv=none; b=ruJ8stOxUVTwP0ysezVjUGEWUOPwkuzdhiqkbZnsPvcAaJqzahnRU3YHdZTCrdUqVDT2SIaNxiTILKz4I30vUhP4oU1sxh6/7zp1GAVi9vP2YCD4yQ4XeJyZd+QtsBatwgu0Se7/TIhs4of/mN38C0RW5KhHZrvuMqNYwv5SMCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751299669; c=relaxed/simple;
	bh=LG1ksJiKWB3q9vR/65Pc5t6so9vAfBBQg/u1r+q10qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsaCRQmdje/ph4TbtksSCI7PitRCMOeibP/QGXn6saCe+Jq+zkzZv3tmRtWHO4XLxHq2our0VKJYVZLTAD1nFprYyj4HS57nGS6+4r0tn8ICivXJTq4Q34jmDzhMNkGf8NgL8oO3n1s58cp8IWwj+dr1pz+seljYYOh/koelTkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FcPWNbMd; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FcPWNbMd"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2ea65f5a0easo2662484fac.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 09:07:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751299667; x=1751904467; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/R7vNwiF+9oBPUCy1uxOqRbFBhRy6o+8A0EvAUXNdqg=;
        b=FcPWNbMdQg2WjYWbIYWWKRumX6etVvk/78d8SEAsQMXZjhzHw+S7+hYAlPrpa9/ncl
         T7Hv8uHG13UfLfmCpLwTFzNcje6zhkccccO2vw5xiqR3A5C5v0J6ivCMY/8l1iiisuA0
         jBhVv+vozDGe+I3zHbpWbF8IqB+pH0v6dnbvFOCTRu84yQvipbjqjcnH56D99sS1Z728
         d3iH20GlBeq40slW4XauKedlKK1JhTqIM16O29dxNImuRBhWQxAKSKqm7inNwQI+aWFC
         RqgrMsDoFv68zlefJ1h225xmFj4I8UOclFVRIe7huKlZXmr1u691txnMJ42hl+9fIrEk
         Japw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751299667; x=1751904467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/R7vNwiF+9oBPUCy1uxOqRbFBhRy6o+8A0EvAUXNdqg=;
        b=ZiNo43YmKlRd5AfEPbCCuVCkElS8YLKuHW/HW9i9l08PzH8JtJ5/1Ut5uaLqu+O1K9
         hsWGx0BA+A56IZP8caxee3Yz7khuADJARsp/a08hn3u8fVN01VOppzxDFhHvnRWIJer5
         6oQTdLJxAEUxfOf/YQtw+qb9AqnVHlJivLKB94Asl9qK3Hb10PcHlvz2tDlcQa9MgTQx
         CMt1jXbOh6z/2Xb/Ah7K9pLyhl3dCaHtOOn4U+UPNo63g6xPnbBghHA0/ttBA5B3ZeJf
         wo07KkZ23AG6AWG9/X8YkOaXh4sG61VvWQfCMuC0r+xj7knACoHLYfwizEMCMwfiA/zF
         YORg==
X-Forwarded-Encrypted: i=1; AJvYcCXBGmc/v8VfVJNGpg5r/zFxj8F45qKantUU4dAIEoLy6dVnNIojvY4PECyyldRuTHVcBrL4mAxVgA/9sSc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgvemZX8JrztGXQviGB3PAwR3FQI4W8sLEWrwdWM8df5/pvgIo
	z5Vqbn82wF8hGx8Dy4qxkDrYdJXH2mFCr2ZQOF15XfU7zANBwt6FmRSNrSxWX5tIdmc=
X-Gm-Gg: ASbGncuhhmtuzc1CXTrnKL57tvTDnhEN/2i3qZEVrPpjVa4Ywcw/UrxZCSZ8jQLwfuH
	joCRUVitic8skqeWUJkT1D/lhQCgK4OYx7sA48nr/qHGOlUCMV37e2qJQ2D7dDkCAFPdS3JZHNS
	CJQqV/sdZAezK+UoB0MMz0P/fN0Eiq3/NkCX962u8DXmOSlKLif/+OBOsIBcpnEFnFRiW0EGXkD
	qyw4OmZH9O8Yw1cSvwImOhKrKu+rhODO0OrpFnDUf14e8XKVUC8qckUDs41XV7JacH3v/+6fm11
	DujyvzfCFfmwid3NEdmBKmpRruIZjb3UJcvwdH0WBE0eodkbyLenTHH+2SKy0dWf/4X8
X-Google-Smtp-Source: AGHT+IGVpDYVlflVaW0F0NYK4knKVLcBuKDTprguFAwInJb/gAiKPsIXTprvj5I8HVKELM4BHElL1Q==
X-Received: by 2002:a05:6870:c84:b0:2c4:1b1c:42c3 with SMTP id 586e51a60fabf-2f3c0424f69mr94470fac.9.1751299661472;
        Mon, 30 Jun 2025 09:07:41 -0700 (PDT)
Received: from localhost ([2603:8080:b800:f700:fb67:363d:328:e253])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afb122a27sm1702697a34.62.2025.06.30.09.07.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 09:07:41 -0700 (PDT)
Date: Mon, 30 Jun 2025 19:07:38 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Manish Kumar <manish1588@gmail.com>
Cc: sudipm.mukherjee@gmail.com, teddy.wang@siliconmotion.com,
	gregkh@linuxfoundation.org, linux-fbdev@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: sm750fb: fix all checkpatch warnings in .c and
 .h files
Message-ID: <bf5aeded-3bb1-4535-ba84-f81e425b5734@suswa.mountain>
References: <20250628082305.20847-1-manish1588@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250628082305.20847-1-manish1588@gmail.com>

On Sat, Jun 28, 2025 at 01:53:05PM +0530, Manish Kumar wrote:
> This patch resolves all checkpatch.pl --strict warnings in the
> sm750fb driver source files, including both C and header files.
> 
> Changes include:
> - Replacing CamelCase identifiers with snake_case
> - Avoiding chained assignments
> - Fixing indentation, spacing, and alignment issues
> - Updating function declarations and comment styles
> - Making code conform to kernel coding style
> 
> No functional changes.
> 
> Signed-off-by: Manish Kumar <manish1588@gmail.com>
> ---
>  drivers/staging/sm750fb/sm750.c       |  90 ++++++++++---------
>  drivers/staging/sm750fb/sm750.h       |  32 +++----
>  drivers/staging/sm750fb/sm750_accel.c | 120 +++++++++++++-------------
>  drivers/staging/sm750fb/sm750_hw.c    |  24 +++---
>  4 files changed, 135 insertions(+), 131 deletions(-)
> 
> diff --git a/drivers/staging/sm750fb/sm750.c b/drivers/staging/sm750fb/sm750.c
> index e77ad73f0db1..8794195a9594 100644
> --- a/drivers/staging/sm750fb/sm750.c
> +++ b/drivers/staging/sm750fb/sm750.c
> @@ -33,7 +33,7 @@
>  static int g_hwcursor = 1;
>  static int g_noaccel;
>  static int g_nomtrr;
> -static const char * const g_fbmode[] = {NULL, NULL};
> +static const char *g_fbmode[] = {NULL, NULL};

You're removing a patch which we never applied.  Start from a fresh
tree.

regards,
dan carpenter

