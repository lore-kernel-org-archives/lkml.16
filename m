Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3C5925B692
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:26:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744187208; cv=none; b=gNK/bHz7jOwhrVAXEm7ofmSrgpet6Wj3jeuMMuKNuM4rkGIEV0gWoSs4V9I8ifbP5bWh47xubB3GKx4Mxd8GAj3CEmkMlG51e3IYSs7xOQGt0tr/mLq3nNCecg91e9UB9bgC4I1d1PXl8q7Jnqushhb7yE2DnLz6hlzZ3cwSpnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744187208; c=relaxed/simple;
	bh=9mciwu4mtquGdEdTTCaWflAnOKZqghnNk3FnTpVRf1Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ia98AyhYmx8AHKSqX70KztoEzNZtteMe3A4waCTxkCCxev49nlbKT6xBupNhI5xW7dTIZFuSNF8hrlKNeYl3PYAokpusca8a3jl5A2P4+jMPaW65vL0Ty2Lkqnb96QgvuCAfGkoG9JAKKy3PaYDkabJqFbQ7+6AxM1FNSbLP2Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dBScaZSH; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBScaZSH"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3809550f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744187205; x=1744792005; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gxnhdbErfpSDUzVm/MJ1FKUcQwzNrE/EQxe6ade7B/M=;
        b=dBScaZSH3kCAi/4VQPVfR5Xmf5W8/6BYX+p83Vq+DgvFK9WucohfmpButHu7Z5OC7c
         sv0qXJMZqWVO75Y1DULcDDd3UyOvB+RgX6dJiltWUlNrFtGrr1gXZV81R2GLNSALSD6y
         tC74XRsz9O92JmxLVLcVm3mCRABuy5TJ5WDbhOZxzS9G568eM3GUXdipTyRE6VrltmaJ
         ZdCGyU0DVYmPdAm8j1GwXt8gIlDHYBhzYEhBdAZc5IsKTax0IigTbZ25+etupi4vqewq
         75atmy8UCCZSKGq+gINctdoViyYWww5+eu+WJlUwXPvgsII6DvdoU8VWWTMyKd8N+K0X
         iEpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744187205; x=1744792005;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gxnhdbErfpSDUzVm/MJ1FKUcQwzNrE/EQxe6ade7B/M=;
        b=FgcRBACuhnHGTzKTxaCXEHKYRk/1A+vealjx8ybUis16bDCZtz/hDnJ3OOA8lywXN0
         0j0dtu4C1eNP94tDH/e4aG/T4Dl7XCJOOgbuxn2x0uEuTMRICUhLcYRzy+nIp5EPPj5y
         m1fbK3JzqZYa0mHX8WVmglbCsFy+MCGKzoszStF2gCnk2vQEUBp4ByUbJd7Vwjj/i0yx
         dRz78iNyuxjUTxy18eLtwsy64rS4OhpyhRJDWfxInkJOizTS5FxgIkL8SS0HxOVDm+Ef
         E6Z07gb8ivNKR2Hx7R6ATK3n4zRNYJiFw+7m0RDXOzfU53iNnZEcPrypaJ0wAk4mZ5UL
         4f1w==
X-Forwarded-Encrypted: i=1; AJvYcCUK11QdsnRGQIcg+BJMn+MWumpou+ciL437DXS9cTAaDUdkqd6ng7/zbonmoTbj3AvzI+tY62adkTqUYtA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDRmylSf+Iodp7kj5eX5fbFMPNRk4PTSo8CYa3ueiGlKYZY8vi
	GuzGy78VUy9/zf1Ew+cY2Ejh3BEqmMvd5oVb7DZrj1DC6ZIAPo2ZtcgVEQXkzwQyTR+w/kYyXrq
	Q
X-Gm-Gg: ASbGncvM5aAGUFVMN4Vu8FV+BqWJR3jP0piCe8FwAtr75cRfLi1pCmQPQJ0q5rfFG7w
	kbJA/nAmNi145GdhB8NhZm/lOJZI/CXnKwdX83k71kja+b5Y+975LHbeAC4vCRn/Xrk+HC3px+s
	CNW8CnPmcGDx4ROZ60NeNcSr9A47xpsy//a6hg7QkIij2lAS6VMu77rRpmam0hgKxXKgcX8nwWZ
	YDIyH048tF46BRok0PoHvFEFZyQYjswfYZ4E+lu6ElksawyXtxF48eoSdbNsZ8KTUKpyW7UGghi
	yd5efWtgNw3pQRo6VWP55ImFS4jjVFNGTWQeIibRdQ0HBQ==
X-Google-Smtp-Source: AGHT+IGFeSP7AaSQ03G7V1vbHKDCayG1EjsRKjk3tAbnZ4QszeoIUy29MFqZGhs6fu552vwU9PZ2+w==
X-Received: by 2002:a5d:6d86:0:b0:39c:310a:f87e with SMTP id ffacd0b85a97d-39d87aa837dmr1851776f8f.16.1744187204896;
        Wed, 09 Apr 2025 01:26:44 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f2075fca5sm12240525e9.32.2025.04.09.01.26.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:26:44 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:26:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 01/18] staging: gpib: struct typing for gpib_interface
Message-ID: <804eaa0e-e1ce-4ee2-8ad4-f56bedd6d14f@stanley.mountain>
References: <20250408222504.186992-1-matchstick@neverthere.org>
 <20250408222504.186992-2-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408222504.186992-2-matchstick@neverthere.org>

On Tue, Apr 08, 2025 at 10:24:47PM +0000, Michael Rubin wrote:
> Using Linux code style for gpib_interface struct in .h to allow drivers to
> migrate.
> 
> Adhering to Linux code style.
> 
> In general, a pointer, or a struct that has elements that can reasonably be
> directly accessed should never be a typedef.
> 
> Reported by CheckPatch
> 
> WARNING: do not add new typedefs
> 

This commit message is quite long but it's totally unrelated to what the
patch does.

This commit message should just say "Having the word "_struct" in the
name of the struct doesn't add any information so rename struct
gpib_interface_struct to struct gpib_interface."

regards,
dan carpenter

> Signed-off-by: Michael Rubin <matchstick@neverthere.org>
> ---
>  drivers/staging/gpib/include/gpib_types.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/gpib/include/gpib_types.h b/drivers/staging/gpib/include/gpib_types.h
> index 2d9b9be683f8..10d8776ef425 100644
> --- a/drivers/staging/gpib/include/gpib_types.h
> +++ b/drivers/staging/gpib/include/gpib_types.h
> @@ -22,7 +22,7 @@
>  #include <linux/timer.h>
>  #include <linux/interrupt.h>
>  
> -typedef struct gpib_interface_struct gpib_interface_t;
> +typedef struct gpib_interface gpib_interface_t;
>  struct gpib_board;
>  
>  /* config parameters that are only used by driver attach functions */
> @@ -51,7 +51,7 @@ typedef struct {
>  	char *serial_number;
>  } gpib_board_config_t;
>  
> -struct gpib_interface_struct {
> +struct gpib_interface {
>  	/* name of board */
>  	char *name;
>  	/* attach() initializes board and allocates resources */
> -- 
> 2.43.0
> 
