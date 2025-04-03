Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6861724C66C
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 12:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743682254; cv=none; b=EYrUPTJBZjRXIO6cDl791jiqiIrWC8lcEUXtYFXHDFm22wUHVc3t7SSdoa+Xx91mQHcSEF75PWLaNcjx1Uvu5HxP4tCwb6iEWYVuSWb1eJOtpG/QEkuBAQ5nTAcTtMGGfxxwtT4GfT0F9z7flGv7l0RLMTHHS1NHGbIWlIEfLwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743682254; c=relaxed/simple;
	bh=8H1wxqvoUYBXAOWDQLWnzTYlqjM75UklZhRniT6YwN4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bvVGf2XhrjKvL4FjeVQeel50XSrNQcYnRngkOExaFxUO9fsvZfzouk5FGEtVqx+Yg4rbS3BOAGrci8wxKk4LnYkGQSTCh7TXI0Lm4+XZ4hXlOtuNaFfG0aIfg0xTHdzGZAG5f6fMYpmEClgfE1Tw78hRyW9WmTkWQb0mFryWNko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=W3KM7xMO; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="W3KM7xMO"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-38f2f391864so453957f8f.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743682250; x=1744287050; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xwxMSEW/tN8wEYS66Vdt23HSX/OccF6Zf//Rdf0Iufg=;
        b=W3KM7xMO+bnMsDrd9pB76v8afL9lznyJ5Zp7UOThq07WWhD1WG94RzVF54ChVA/HMR
         zuBWJL+s3is9ACNCaioB4gPfi7ka/3WfTPvsYxmq4fWvEvOiSZn5eO4CpWpJjSeqHIch
         0KhW2HstTBGkG5JrmCTi+JB5N1sDzcIOgU1jayC1Idm8nVDnfI9SS7osQBGMUVyjL0wH
         8bIDbkpAWbaAzMVdXFmb/m1CQn/eY4e+k4qTr/Bguo6UOxRpazHf8dEXUiImTcV54S0K
         6SSMxJTx8OZwnCqHt++DyL2xquqFXrYwt5TM7GlBSHSZ9p6a4f83/wqPjPBACNfLd3dB
         d6aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743682250; x=1744287050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xwxMSEW/tN8wEYS66Vdt23HSX/OccF6Zf//Rdf0Iufg=;
        b=pWQUyoOB2JnaGS6Xsn1vyUv/fcPI7F8SbuJyB/r+Q/+d59HfI7AACt/aa9WaeCSe4k
         dhbzA1ywTGYUYdM8kLeZgqpTllJHl8/+qH2nECzIu38uRAooNTr2oier5i48SbVlZBfe
         iGYoRH547e2VQg6djtoptW5RqAcNV/n122yCD06JFyNNvsaOo+gOo2uJGqU9yq5hjWcR
         4KeJHVjQrH6uew43fhIle+vO6kjbhwMZ9j8jSYDOSkRS6d2ZR2JTkipA3D54SksEnq99
         Dxm6KfJGhAgD+j+pzSwNgG0uRzYFp33vSXjR8443xESlPWLupW5KE+Y6aOt41bPXUtf1
         gigg==
X-Forwarded-Encrypted: i=1; AJvYcCU3tHbddWxRYpaD3y4YzNW9P4V2SnxGnshxshDqUqxsU7cg7VagAwjybV0JRkQAcukODPfVAQ5REhVGO5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBmYhFboW+/WXGAw+PzJs2S/akmOcCRgRECohmnmgPvvN2AtK/
	iGQ7jajBZ2JcxBqGx+1q3NcR+sCwBM1Km02NkMgdgI70+Meflndrtwk6+Z2dWM4=
X-Gm-Gg: ASbGncvTw/BnNSj+IwG3l8nVnXnvD83lq9FJdEikb/u6JA+S0btl4urW9W6G8TMJoRb
	6+uWHVohqb9HBmylxzOCDAwOjsmAYUWJ/AjxygNdiqonp9e7iBKZVz5c0K98HifsEQDjU+/2B/X
	JMGQk8dKxZ2+HPaU2+BOy55Dp5zwDhsmFX2Hs/T+Oki1SwRVwmmwoDruFXQ0WmlgzX/F+4z6a+M
	VLOv98SJQKGUfJf8PU5G4fE6+AE7WAo5Eaj1dNlqRhV41lJ2dEDjJL5ElZkp7ZLV0uBGMyl/dI8
	NKMO4QPirhIwIw05dBfU9MkWupWIobLbIOowh6Ln98795VGtig==
X-Google-Smtp-Source: AGHT+IFfR2jDNEYU6ohqxLA66D9x/EjRIkHi/OodfaTJS1RKh9tDGyJw4YLQMD+MxkX73+TzcFGd4Q==
X-Received: by 2002:a5d:6d8e:0:b0:391:3aab:a7d0 with SMTP id ffacd0b85a97d-39c120dd0e0mr16300609f8f.19.1743682249611;
        Thu, 03 Apr 2025 05:10:49 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43ec17b3572sm20036615e9.39.2025.04.03.05.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 05:10:49 -0700 (PDT)
Date: Thu, 3 Apr 2025 15:10:45 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wentao Liang <vulab@iscas.ac.cn>
Cc: gregkh@linuxfoundation.org, philipp.g.hortmann@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] staging: rtl8723bs: Add error handling for sd_read().
Message-ID: <Z-56xSy2kNnBmpWA@stanley.mountain>
References: <20250403093741.2372-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403093741.2372-1-vulab@iscas.ac.cn>

On Thu, Apr 03, 2025 at 05:37:41PM +0800, Wentao Liang wrote:
> The sdio_read32() calls sd_read(), but does not handle the error if
> sd_read() fails. This could lead to subsequent operations processing
> invalid data. A proper implementation can be found in sdio_readN().
> 
> Add error handling to the sd_read(), ensuring that the memcpy() is
> only performed when the read operation is successful.
> 
> Fixes: 554c0a3abf21 ("staging: Add rtl8723bs sdio wifi driver")
> Signed-off-by: Wentao Liang <vulab@iscas.ac.cn>
> ---
>  drivers/staging/rtl8723bs/hal/sdio_ops.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/sdio_ops.c b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> index 21e9f1858745..86776d924c15 100644
> --- a/drivers/staging/rtl8723bs/hal/sdio_ops.c
> +++ b/drivers/staging/rtl8723bs/hal/sdio_ops.c
> @@ -185,9 +185,11 @@ static u32 sdio_read32(struct intf_hdl *intfhdl, u32 addr)
>  			return SDIO_ERR_VAL32;
>  
>  		ftaddr &= ~(u16)0x3;
> -		sd_read(intfhdl, ftaddr, 8, tmpbuf);
> -		memcpy(&le_tmp, tmpbuf + shift, 4);
> -		val = le32_to_cpu(le_tmp);
> +		err = sd_read(intfhdl, ftaddr, 8, tmpbuf);
> +		if (!err) {
> +			memcpy(&le_tmp, tmpbuf + shift, 4);
> +			val = le32_to_cpu(le_tmp);

Now val isn't initialized on the error path.

regards,
dan carpenter


