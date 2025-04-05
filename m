Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1EC3A1BA
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 14:19:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743862762; cv=none; b=GT6vJYagq+cW6HHy3Uv01HQCI7RL0ljjYdDI6dUQlp18DmjBO7guvKijUFa6a2TiuVa5lz0bRn4/BLQEdvriv6NlX1FDeGrCaYzlXNVeYLQH1fHzTQLnsTV/pAJT+aEFATtmHzy+SXAW8XOJd8pmI0erk9WHQc9WPXbIvz+DeW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743862762; c=relaxed/simple;
	bh=l74iBGb8CYoPepq0f+0E27YnDUTS+yR30dVNzQkwb8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EUVGwVIhZDTrmL9Cw/oNuX0emObs3dfrNTJyQUkYLgvBT+5Ootb4rKpgn8rmcIikzLguKaJxwojsLvYh6igtL1LpaT5aETNddm07k/7iNj6aCpd9X73q7TJWaZLqzsgfn/9eOLgGgJdUtXJhLuuQT/rBh32PLkTSiHFhznvBimQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=UNW56sIl; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UNW56sIl"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43cfecdd8b2so23523415e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 07:19:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743862758; x=1744467558; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QREsqMnXp3ed/MAkal6kS2dgg2uSOYjf8lEHpd+2mJA=;
        b=UNW56sIlR0nTQ9QByQtdfHhMfsnnwGsSui+MzZIv0CbInBOTkly9muzaXHFtXEGcXO
         wWl9/Ygc6YIc9USZQga+AJ7Ak0i8+jmOt2y1kAAj1RoKblBJ7KSNrljpB+jlKFSTQlGP
         xsTKgd+W7U2OnKoC7MWqD+vBQpz3a2+C+anWJeAf/Jgl6OKQ+3Lui4pMP6ukEPn9qbrj
         6rtO0ZiGHyJp4AKAae1LR3fCPVI/YaOEnWMXYU796cVmbewd84Ad+ZXgM1P9P9dvRsTE
         RFzj5+IbjIRb1oMGOXirWZ2pqo3WJxWMeIKdJGLmeI/NHzcsqROk4WU7PQzVKfmZzXua
         M5ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743862758; x=1744467558;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QREsqMnXp3ed/MAkal6kS2dgg2uSOYjf8lEHpd+2mJA=;
        b=GNI2yBr8el8nzwIRR8Cj+zVV5iMSZ7SOSmOsX5HjnbSxKqXS5QzAPmv3mmP6eu0iRW
         KamB0Unq47SN1U0C+fLDsGPGiQhOuR9ri7i9Sy9Fw+OWbkDiGGh5XVcAgXfPvgihnzAF
         dsnlbGyGBOBWXQV/Ucq6Jew72p7f0b/WlM218xgCEdqQrubMlUq06qe2TDgMO4mt9hNK
         9zcx7V4N/50OKL4f90xJYBjRD7oJjXiSY0lLfj9FDJWeIyS5msDF7SVrpkFSIpF7rOdH
         J059TrYHtzFCZxSOmIZ1oWAo8XbddqsseRCqAwjfKkJdDbJnqf8R2qOUXhTrjxIqra7Q
         DJVg==
X-Forwarded-Encrypted: i=1; AJvYcCVEGkAAtf/1GJOZSrJKJtut1x+dSI6ES8IZ8viHcmvJmSVB2dC9aLZ6fvZVCEPC942iOeiyBj21sq2rQ4k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZPOcuzs5yiJBct7RY+8HHbLUdILrGcxfRihYwgmJjg5Tskusr
	Tl83BfY5+CMTNsmHjJ1AlitOdBo4Oj+25YqPEIKWsPPLSr181k5yMaHxTLHo9Dw=
X-Gm-Gg: ASbGnct+g0QjUH4aGnSXvgyfvLh45ssmZSrNUrwXmdeJtHzBe6IF8f02Fe8bzuU0K4s
	Us0I128vWRgjaX68TNBOzpKF72UNhursEpQPXEwtVOtv2dVZnKdny/7bHMQvdLgWUiWqOHMEc8h
	HA/BeHkww92a2v85UseKLmrKSuZZhtS2j5ynFuEJKNQ/lZ3hAogCbNyW516c+D8QmQpx2ZUTMEo
	X4TrthJfCcRqzHlfcfIMl52HmQ8As6ujaGnsTGbRg8EcztjxxGB61Icb7KK4L2Z4t/H3UK/PpUi
	x9WG8AgLS/jhr9b0PF44qV/g3pb4PQ1SgcNNSjxGZhxSaq8qng==
X-Google-Smtp-Source: AGHT+IFW8L+8WZ3ckDNSGjgYJDZALIThBZS5wEzhYuabxviGgmk9WPLFChRNbWZnh+bHR59rItd3kA==
X-Received: by 2002:a05:600c:1387:b0:43c:f513:9585 with SMTP id 5b1f17b1804b1-43ed0bde88amr69216715e9.13.1743862758182;
        Sat, 05 Apr 2025 07:19:18 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39c301a9da1sm6900116f8f.22.2025.04.05.07.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 07:19:17 -0700 (PDT)
Date: Sat, 5 Apr 2025 17:19:13 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] staging: rtl8723bs: Optimize variable initialization
 in rtl8723b_hal_init.c
Message-ID: <8ce041b2-087c-4d47-891f-28ecc0c91c76@stanley.mountain>
References: <cover.1743820815.git.karanja99erick@gmail.com>
 <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f7b63d834b98aedfe2ce277d8008d7e398ea29ba.1743820815.git.karanja99erick@gmail.com>

On Sat, Apr 05, 2025 at 06:14:48AM +0300, Erick Karanja wrote:
> Optimize variable initialization by integrating the initialization
> directly into the variable declaration in cases where the initialization
> is simple and doesn't depend on other variables or complex expressions.
> This makes the code more concise and readable.
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  .../staging/rtl8723bs/hal/rtl8723b_hal_init.c | 155 +++++-------------
>  1 file changed, 41 insertions(+), 114 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> index e15ec6452fd0..1e980b291e90 100644
> --- a/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> +++ b/drivers/staging/rtl8723bs/hal/rtl8723b_hal_init.c
> @@ -152,13 +152,12 @@ static int _WriteFW(struct adapter *padapter, void *buffer, u32 size)
>  void _8051Reset8723(struct adapter *padapter)
>  {
>  	u8 cpu_rst;
> -	u8 io_rst;
> +	u8 io_rst = rtw_read8(padapter, REG_RSV_CTRL + 1);
>  
>  
>  	/*  Reset 8051(WLMCU) IO wrapper */
>  	/*  0x1c[8] = 0 */
>  	/*  Suggested by Isaac@SD1 and Gimmy@SD1, coding by Lucas@20130624 */
> -	io_rst = rtw_read8(padapter, REG_RSV_CTRL+1);
>  	io_rst &= ~BIT(0);
>  	rtw_write8(padapter, REG_RSV_CTRL+1, io_rst);

I hate this.  It's a bad idea to put "code" in the declaration block.

> @@ -501,8 +499,7 @@ void Hal_GetEfuseDefinition(
>  	switch (type) {
>  	case TYPE_EFUSE_MAX_SECTION:
>  		{
> -			u8 *pMax_section;
> -			pMax_section = pOut;
> +			u8 *pMax_section = pOut;

This is fine because "pOut" is a variable.  It doesn't have side effects
and it's not "code" in that sense.

regards,
dan carpenter

