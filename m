Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9631B4246
	for <linux-kernel@vger.kernel.org>; Sat,  8 Feb 2025 12:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739017040; cv=none; b=PUzytBKCh6yxwwQEncCJ8uYHxN1DQtIr00Fc2QMC4gUsfrIQL9iGCqeAEDvjfyo0RbYcWvhFgWcra0aZ98EP+Bln6fTk3QDtKblAmBFl75YdjdzvjsbdTt/ZoBZSFDAfbiHrKQcTH4DuHS+r2N7+QifsOg3oK89DYgWq5zejXgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739017040; c=relaxed/simple;
	bh=T4eIb3bqRCOm/qgXKt5JXRdNtc/g3t2rmHuZgsY86yc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GZpopULmHTqtlCZSfiftVbq8TuZyYn+LiWw/QqB7LsiWPeXwcY5K5fqhT+u03puszeNx+8z6aa8yJcpq7rLYuafCulCrgVySf5vsaMjpiuOpmrFXorwzrrJ1AkrbbfDweRXd/1Wq7Hbc43B9Jcfg6X2UY4fmQttIJy9FyX4QOMk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vz4WbChs; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vz4WbChs"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-53f757134cdso3048565e87.2
        for <linux-kernel@vger.kernel.org>; Sat, 08 Feb 2025 04:17:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739017035; x=1739621835; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86n5+Q0ZSLD5Q/iLrsvS8vsVVb/euNtkQzazsN+zt/4=;
        b=vz4WbChsrYzHJeJBLC/mlxlljZujRZ0PfRVGAH7rcTDuEDV7gxQWUZkvPhGv8jrfdV
         svOkbRMHQeQmR20yjY2DYYC1dlNPLF7DvoIYQbumt2OAbD43o304uC5av1GxI/eaTICd
         c8ZBOgFnLWkFT83MdOhCKra+e9+fs9cXscdRxUbP62QaklwRIDBLN8qF/QLvx4l7cK7d
         xY7u4E+D3KHCfCDt6nWwTWCWemCsNek4th61UkEBPjInpfsKP0/bF4J6CX3+Az9rh+oh
         4fjFDKIRdqu1e+zW2XLNQUReMcG4S+beFnqXxsFZ44eEubVg3n5ncCD2SSrUCHfRWhQO
         Ikfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739017035; x=1739621835;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=86n5+Q0ZSLD5Q/iLrsvS8vsVVb/euNtkQzazsN+zt/4=;
        b=RmSNHrob1LBMD1i8HXjnLW6xxQCH9VeIlKxJ0j4Aubu95l3HCY7d9v5HM8FMlhRgnG
         rVlindyskH8wah2Di3PYqQLNmzwBuCFIXrlT0uAjQc2Q1jBThLpgxczo/gGpZIaFY06b
         Ha+Q/rdhMcUZ2+sqa5OCOnC0uagEaa43bBXpxNMwoRc4+/6zw2nVSrhZKP38VQTsA2L8
         XIMfuDNHMxwFiF+djkhxiDuXq+a3wZUVrdl1K7LEkDxdv65pyp9OUfy2a8fxq62SbBCr
         +QF2CELG2t0cK+/q3tq7fZ0YrwxkHr9YAZQW0gT2GaxcUZkIk9rk7TpiFsftRzOb4V/M
         19JQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK6xmRRM0dZoVD5/KYCb4OCc9AAVY/+tIa1fgdhu01X+E6CSlt4yJOMejMScgoMh0E+Y+UlsPI9eBaK9g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAXKI8gmmujHuiUuJsbyO6gcTIWOKSOVq8LkEMn8KOC5/7UmuP
	G7DaOx+Q8/WxOFmxKycVwVPim7cht0Gk+5yMxvxRj8kYIm1tJwDwRRtRxkYjYLQ=
X-Gm-Gg: ASbGncv9C53+AtZ6X0RU0u15c3nyeAaAkZCzLZYQmSVyQq4nq7inWq7U3Ru3/tvJx9f
	ebqH8CWdFcoYNtelUqYWPPs3wDWjIRKAav5Q4Pzwgoz4BqbUjccPMm+YkWngTP1BzVWOGBP2W2x
	FWeNrv3E7vZvmHzpl+r9kTT9meSp7WnK8R+SxUfpOPF8JtRlR2hvozyKw3E9NiLLx/syxhp5ChU
	unVKk8jrvzJno4BbynozywZvTENRrIDkkzxodBof/97RfmeWgLze+FISHz9KpeWmKsyAFPNJ1jf
	+8ou0EQBi7jX2Ud9TZRzU9Srim0VI29yuLa6YVdYjfYCZcvBgJ499Xbg+2+RwoCaZi4eUDE=
X-Google-Smtp-Source: AGHT+IFwIWTeNKS4wN4R624q3kbyJQojVN74fOV9zot7wxyHPiII72LWtpH9IvPMBK8s7MHZJcW8Bg==
X-Received: by 2002:ac2:4ed0:0:b0:542:9883:26f with SMTP id 2adb3069b0e04-54414aee2c3mr1807642e87.50.1739017035188;
        Sat, 08 Feb 2025 04:17:15 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54504062523sm191475e87.79.2025.02.08.04.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 04:17:13 -0800 (PST)
Date: Sat, 8 Feb 2025 14:17:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: andersson@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, 
	konradybcio@kernel.org, krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] arm64: dts: qcom: ipq6018: move mp5496 regulator
 out of soc dtsi
Message-ID: <x353yhiu4zsdyu5dpgfe6li53bq6b25rd3rhsquab7g4cbzehl@klbvqidc2sac>
References: <z6vspyykbj7e55uequibwacdx7uuwubtuabnsxagcudmqrfwn3@4gfna5rqiimc>
 <20250208080015.553458-1-amadeus@jmu.edu.cn>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250208080015.553458-1-amadeus@jmu.edu.cn>

On Sat, Feb 08, 2025 at 04:00:15PM +0800, Chukun Pan wrote:
> Hi,
> > Wouldn't it be better to move it to the board file without having
> > intermediate include files?
> 
> The intermediate include files were suggested by you:
> https://lore.kernel.org/lkml/xmvtbib3q72tnfpcaic3vbgwilpo7yjnqimr5uk2myjgtslbgm@mlp2kqvljayc/
> 
> Unlike mobile phones or development boards, the pmic (voltage) setting
> on routers is relatively fixed. (Because QCA will not provide relevant
> documents). On IPQ60xx SoCs, s2 supplies to cpu, l2 supplies to emmc.
> The downstream vendor kernel puts it in soc.dtsi (no device override),
> so I think the include files is more appropriate.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry
