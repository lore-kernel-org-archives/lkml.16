Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10F8B188713
	for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 17:36:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744479379; cv=none; b=WnQClEBTmoYLVWug/+t8+aG6vNH6BE9jeoLzMpIye5Uf1fhIuIrOg/s4bQtFxm0tGBsovt2vmfDpWHaUgud8gLnKW8w6Z+x/ghhXtlXjH+1tZGr5106EZDiPaxxUwzGjQPymbolHsy9UXSPTsSeHYb9UEPHrMFeskFjsbLJCJgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744479379; c=relaxed/simple;
	bh=VdpEtQHS4RANXbcAki1/hEz3qxnYZZMo5L/fS3da740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f/jqKjxaoPdZmxWgeKiX8my3lV/FG3Bknqj3Qxegb19OeaMeg7LIKic5W8EJaPZeRM0K928i5YbD8mjiNE9WtIUiiX1aiAhGp6c9FgrNQcTrylTxzEguLeQGBcxKjxQfcn9JLSedRjddfizbYDMU/jbk48SQre1shtz4k9uuit4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HWaPvp3u; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HWaPvp3u"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so1712948f8f.1
        for <linux-kernel@vger.kernel.org>; Sat, 12 Apr 2025 10:36:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744479376; x=1745084176; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X7dkdux/S+32xfZZQlqaPzDOWY9Jh7gDAqzffHnwOYA=;
        b=HWaPvp3usLsy4E2er44BtZihCnG8It1Bcfh13iyIVdShwbwj0rhra8yF3ZfXqYd+eG
         tUHF9np9HUzA1FZoji0JsgdVmVqn5H+UiUz0liraoly9TQ40FNSKArLzK3ermZnJuu5f
         MGCACA5wGQmzWWOxCUb+JI6wUHn6dxBRl5VPHqDmfeztwPV2k6XtMjT/1Y8ZlyQDmSFn
         ByCCvlcfO8OBfZWGWYng+jHPJLpCJpXNTe2/ZSGbuuMFi4RV4dBBPSmwEdKKREH1/U4T
         PpFNyWhZlMgAUmuxXTxnfW2ExvQXiaRf03qvebUfAwI+XsBz5j36paN4Y+BkFxIpb1WJ
         +0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744479376; x=1745084176;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X7dkdux/S+32xfZZQlqaPzDOWY9Jh7gDAqzffHnwOYA=;
        b=D2CcjHE26Job/CAsXlfZKZpHgCejXZ6kCyZV35CTf6EWUfStE+Gc+x+sFQjGOU9xzZ
         66KJKqhRhyYGPJuKw9uLJg+s6DfCtfHxfWZJlab37UTmXDLg1jGB1H7DJgfaOy51nCkB
         U2+7SSzTGNWqqLhZLBJ/UfyuMz0D7fcH32DiWXVcWZaEZQ+I3mSLFRnjL9RNyzm1ajb7
         ziC4MxXZ/kXA6KccSlhiKmpK6q5MxoEywiy7P4JJDWD1YZwNwKN634JstReJWgnH0iAh
         ZTcHdhGiSHm6m50eNA5Bv4gHe39KcLtkoOVapRFPinnHy4rCFn5NdqYl2XbDsdk/lTrt
         3DFA==
X-Forwarded-Encrypted: i=1; AJvYcCWqvLT14dqZ7nnl8w9F6+nZRnlIzt04ZF6IuxBltLOWrf1wpjW0TXmwpdxYTZeuVcGmece/r2zj2njSF00=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaXgyBwsAURBO5nMa8UAeXOoZnHbJWmxbUoZsZ2zr8OaLey6Mb
	zTVW48+nSP8ab2txx7iXswMo5jQWPBItXNRJNcq42Oo1oXANJ718uQQyvLeDtJ8=
X-Gm-Gg: ASbGncve2QozI+zZZSBf8sGk1bO6Cs/vhox9EucLnEOYH1niLlw3ZfOJwboXCa64Wrw
	ckgTMFs+WwSoDUkyATYdY301wwcpIlU9ecd7zNcQLSEDb6iTt+1cQGPL9fni5/N5i6JEZ6rMb07
	jOdk1AtGFnvWw9Gywnor//iowtyFGVgKKz2XzCwWT2s7DxtIn+DBhCh8nf5VvdMQNt1PNazDuCv
	ebYUrlUglJbl5bvyOakKs9Dd5YHXgAYgNJetsTad86OpRn8J0l7GsD8dy5ROylCm+ZOjZHWaGvS
	D4UdqTeWHyi+wktBt2BMd6CZ1O8coDFl2L6HOPY+cpj8ZA==
X-Google-Smtp-Source: AGHT+IFUwejHUevcPeJvr4IraPW9g0C7hsZdWHMbJKLSZE5OrOow4mt8Oerm5HFlqnfXpeaKs6Touw==
X-Received: by 2002:a05:6000:248a:b0:391:22e2:cd21 with SMTP id ffacd0b85a97d-39eaaebc6femr5723855f8f.36.1744479376207;
        Sat, 12 Apr 2025 10:36:16 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf445515sm5508587f8f.89.2025.04.12.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 12 Apr 2025 10:36:15 -0700 (PDT)
Date: Sat, 12 Apr 2025 20:36:09 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Erick Karanja <karanja99erick@gmail.com>
Cc: gregkh@linuxfoundation.org, outreachy@lists.linux.dev,
	philipp.g.hortmann@gmail.com, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] staging: rtl8723bs: Initialize variables at
 declaration in odm_HWConfig.c
Message-ID: <04e0e0c1-5d21-4910-8063-c1ef67bc1eac@stanley.mountain>
References: <cover.1744285781.git.karanja99erick@gmail.com>
 <f8fd7b9ec1a1fc1a65be5e7735b37c42032e9715.1744285781.git.karanja99erick@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f8fd7b9ec1a1fc1a65be5e7735b37c42032e9715.1744285781.git.karanja99erick@gmail.com>

On Thu, Apr 10, 2025 at 04:06:07PM +0300, Erick Karanja wrote:
> Make the code more concise and readable by integrating the initialization
> directly into the variable declaration in cases where the initialization
> is simple and doesn't depend on other variables or complex expressions.
> 
> Signed-off-by: Erick Karanja <karanja99erick@gmail.com>
> ---
>  drivers/staging/rtl8723bs/hal/odm_HWConfig.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> index 994b8c578e7a..85cda5c3a5b5 100644
> --- a/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> +++ b/drivers/staging/rtl8723bs/hal/odm_HWConfig.c
> @@ -52,9 +52,8 @@ static u8 odm_evm_db_to_percentage(s8 value)
>  	/*  */
>  	/*  -33dB~0dB to 0%~99% */
>  	/*  */
> -	s8 ret_val;
> +	s8 ret_val = value;
>  
> -	ret_val = value;
>  	ret_val /= 2;

Better to write this one as:

	s8 ret_val = value / 2;

regards,
dan carpenter

>  
>  	if (ret_val >= 0)
> -- 
> 2.43.0
> 
