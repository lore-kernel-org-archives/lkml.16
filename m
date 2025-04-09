Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8362A25A2DF
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 08:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744186249; cv=none; b=ciCASrR33ZW1/jAtX8ecKAzzEgLmrKkb/pPjoKRNxQkJVb00GlGIH7rvQa1kI34J6oKi0wD6DcC9OI8HQvJNTsoYEXx5rCJAYBDcu/M8KITp6pp5Oz0aiRBdWbvYmcnj4ibWJ4dNJGSdYr1ltBEtnOKZxo+X6USGgOyHoK+xDUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744186249; c=relaxed/simple;
	bh=m7HqZf0V8MNy+9l62oV2QlWxfw/dk4iRS0qblNkVAtE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S9xSc2a/kKSQdLqcDKd9BOdcKW+sF+TYjK3xt+g6ufqylwCOP775FEHcwgd66KAC7m4jkFUVaJ842S93aYfgzudbwnMVAiBpy+2iLz5jqKsVgoNUdsOGHL6VMTov71RluDGgof2upd3gtrHDCnDsURdMzQpFyqmsMkKxWFdt3i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=rcDdzgbf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="rcDdzgbf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so45202815e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 01:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744186246; x=1744791046; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ntWVECAKTru8M/Jr/pSj4ciuYNFjvbasICcKkEjQxNc=;
        b=rcDdzgbf+V6MTbqEcae5suwotQ3yXiOcpAVEZYYCuQSH5rM4nHmhnoO+Bjti1FmTFk
         ckC4p29rqbSceM7sFePwpb3LoNMu6upSjR99vVCk8zLrW0raHqrYcdXddYSq44+Q7LMk
         4AX1p3zJLHCmWschKe+W7Mv8dnKzqkISL8h52g+2S7YfOo1T8aj9taYvssZfhLJdMQZJ
         vFf1QzrdnbXXYzuM4Cldx1PQthUTybbn3/vcYqzRDceoBmDeIShxa/SSaz+Vn5aEZFbw
         zdW5cpz9FhpzdXWrt50Vgvq93TOQkcBWkidfla3B69I03v93pbC92pMLuc7y6kbTvR8g
         q+aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744186246; x=1744791046;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntWVECAKTru8M/Jr/pSj4ciuYNFjvbasICcKkEjQxNc=;
        b=Ww6Au+nY17TXtNPUk0li9EjPJXrFz0q+ZNrgILH/LhsndzsWpK9bFxdpFFFA4kKEKO
         FhTqRieWS7IPZFJo2PBvqYU1HxFvPvJHlaurWkTzhz40t1CqVAQeR4/+rWnZnK4kc68K
         HfKxWyeYQ8bxtVx6AtiQYvLKcAk9+u8cdFdiMAna53faSqK74eaxysHQ/cL4BnLz7YH6
         OctpiR0yr3Ucs4rCxj7032lPwTlWasYcGhLp1XzZXSftbeU9eZAilSyL+OLs76x40xBG
         4JAzpOWp3HKI5q3xDwrb89JUyzl5NX2x+XBdmdsgfWAMgRx/rG1smcp3YAL7QPzcZ7cZ
         hjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU24OMNZ0oN/pqHp6RKcC/4sdcwiVpCc9VlZg1OQ4+LBAdiUpO8jL9yqJphYnRutmiuzKsHPDueY/1gQNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdgrhomOGgMkjsbwJaXAju4M1Ezbd4gyOAY80tO1YzoKFTt5ra
	1S9aeC4ooxAtDiOBOT6ffRBDcDl8OUygfPTjc2rNP7xl5k5+mLHzON7XURDlBbs=
X-Gm-Gg: ASbGnctI4Ag6jdhWnGyZMOfYk3wtWdEu/Vhbyic8J7MbysasDFPyq44+WbGoAFcVoFX
	SV6qrAq+3+KLhZseY7folhrwp4A3xwyNf6EPf1BdwYJZq1CP0eb3Ttp9fCybyOZZDQVpNagk040
	B3OWTJbMwJShqiQLm1XlL0eintD1AVZTpIV1ilERq8/BvF8l2Gs5e0a85iJzwo7NLKuKcWF/XY1
	ZlHDvDC24uMQsi1x/ynL/X8BqmgBTQQIFyWnqtJ0/xFvxLpOTak+9ZkdQx5XymTwvEg2BXDGhgJ
	Mi66piDviivBSaiMpiQiz21iiCvKP2tuj2guFbQ1xW41sXCpGBjNVwx5
X-Google-Smtp-Source: AGHT+IGPIwyTg+gXnp6KZZLF9hZJx4uS6CBETehRq3QtuRedcuQkDkBgw1m6+Axba0F6/vbCO/UrRA==
X-Received: by 2002:a05:600c:5024:b0:43d:1c3:cb2e with SMTP id 5b1f17b1804b1-43f1ecdacd3mr23817135e9.17.1744186245834;
        Wed, 09 Apr 2025 01:10:45 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43f205ecb20sm11901015e9.3.2025.04.09.01.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 01:10:45 -0700 (PDT)
Date: Wed, 9 Apr 2025 11:10:41 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Michael Rubin <matchstick@neverthere.org>
Cc: gregkh@linuxfoundation.org, dpenkler@gmail.com,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [Patch v1 01/21] staging: gpib: Using struct
 gpib_board_type_ioctl
Message-ID: <23dec5fd-5abc-40f9-9b13-0f873ffc4242@stanley.mountain>
References: <20250409055903.321438-1-matchstick@neverthere.org>
 <20250409055903.321438-2-matchstick@neverthere.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409055903.321438-2-matchstick@neverthere.org>

On Wed, Apr 09, 2025 at 05:58:43AM +0000, Michael Rubin wrote:
> diff --git a/drivers/staging/gpib/uapi/gpib_ioctl.h b/drivers/staging/gpib/uapi/gpib_ioctl.h
> index 6202865278ea..4ddcbc2a81b0 100644
> --- a/drivers/staging/gpib/uapi/gpib_ioctl.h
> +++ b/drivers/staging/gpib/uapi/gpib_ioctl.h
> @@ -12,9 +12,9 @@
>  
>  #define GPIB_CODE 160
>  
> -typedef struct {
> +struct gpib_board_type_ioctl {
>  	char name[100];
> -} board_type_ioctl_t;
> +};

This breaks user API so now user space can't compile.  I don't think
any of these 21 patches can be applied.

regards,
dan carpenter

