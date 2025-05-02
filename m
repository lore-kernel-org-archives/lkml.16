Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4889AD24;
	Fri,  2 May 2025 03:10:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746155430; cv=none; b=XDCKx7EY8Fevzs2mLmOLXSthKTcQbo8Mpm1NmzL/8RB3XphHC8xNo+2xGRhOe9mFCfAR67SVnjHGSPJopoDIzMqd9PUQmEjP97yeMXMYD+9ZQ4NcqgSaGL2TyraGFSSG1sFSvEbVFaVqWyWH5Sx9s2U7pXoa6z2sDFh4SQjDokg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746155430; c=relaxed/simple;
	bh=4+/rI1wiUBYGNxJna4MkbschuPz2AG/VFmnrbRg2ES0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WrFGrXyt52yzC+DAGNJBSz3v79/+rD+1WiOFVKxvWE3jJeeYfKFZbL/ommVI3M83hL0PIjRf2+W8WPJb8kDQMN4BOPjdm/g0c3oPFDtp7gM3VvcHgeB6bEZhFgh70Hbz7VqOoLd3BvUAVdXP3eARZyrW7mtWitCABtYrJLZKQDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aP3lqXu1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aP3lqXu1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2295d78b433so16033305ad.2;
        Thu, 01 May 2025 20:10:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746155428; x=1746760228; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Tz8QpW2yRSPnyN9+E+xuVvdU1GlFxrBV2mFXNUnh1I=;
        b=aP3lqXu1cVdbSkVOekLJUtYQsKFdw6cLD5GQH3gALKiMwEp+qgKOlr1wLEtCr2uQBi
         HILqVW1D8w0jE6u/lmL0rqL38RHt7+5qynwMEoF5RIHru2keS1Busatyx6mtkhEO98ZF
         9Jd4G3fztaVKe16Ke6aVuh60wnhqpzUS7B2E+CCKXu2kfRwJpycqAi6FIHKYDKejVK/Z
         sGq4o86bQx9jFToLu6G9xqVlTv/H1fLtECpImB3SHEC+u0Ru5vOjqaTbvyl4Ij+yqLZU
         4W+/tV48pnooPUAsqmZzR0h9Rp9/v5p8um6v2LtoPCl0dyPDDCe8ujra9nkNp93GWqN+
         1DYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746155428; x=1746760228;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Tz8QpW2yRSPnyN9+E+xuVvdU1GlFxrBV2mFXNUnh1I=;
        b=c4pAT2BWCs4ks/cBhtRdsHqVCa7IizxnSGqlR+ik62NePauzEfLHfc1jUfFD+h2Jyt
         90UilxrbOzpN21JblFh3fhwo4v8EV69tGdx/xXlnoagtRbt97B0IDi3Fro8PTYE32Ioy
         9deuJZkbjEUzh6dZXiGlLozQJ5rkMXfH2+x4VNcVU8VIFPjl4Bb10TGJK+eY26OnsDrP
         T6eqPrZn7870n79eLsz4pT5mlcaF9BRYLxCuLVULLbwwbLWkXepQvF+QOWrWu2K/I0Aa
         nfHzFzPV8fcAEL/gIbLWqDhEUy6ZqHf3ND8XkcYk5pzGMTjiPfEi12c9n6NBe4ComF7y
         qF6Q==
X-Forwarded-Encrypted: i=1; AJvYcCUbg2LRxZD9bHFPbaw7eSkTqKypHdmPVJNU5R2hImlPML6Zm+RufVA/JMGpod0cbxgcLislhGLyWB1KQw==@vger.kernel.org, AJvYcCVZ1pJD04chc7lSfk9yWh5vlP4d8vs6zXrYaCytMKMdSAHSuMm+NVwXftMZvrWU46lyC4DUOMOQi3oV/1Rg@vger.kernel.org
X-Gm-Message-State: AOJu0YwXjjx6rVDkpucU6d7eYfDBM2v/VAfNty87Y2zvOexE17qXvxCB
	KKf4Xv83d5/MzPqE1FNYnua0JBqg3QGvc02XZ11DVtvbs4f6aXCm
X-Gm-Gg: ASbGncv1NJMyN/GyP/Urubg66cU3MrkFZKtz3lgim9gBern0USOy4ipVqU9wYXUDkGb
	LNYoAAgW3yumcS5tB/Ms1L9PDtagIdmSqykQxmD6pemvNnN58Qh3Qfp3+DGgY/GXWSXYdGOn6EA
	q46DpNNynLwHHzIXkDlMpT75MXUeosyukzl4TRPMIUCaXARE0WrXpMGtOwOl0Q6Xqv37daXOkyW
	jFSc4dNA1eRfV0F50+ga9GQ5Epm1NLZypn2NHIPvhLVOol9C1k1Pn/UTYvMBWsH3GC8ZiDCG+kh
	ms7AIvucsw72RpvGGaK7XN+x3gJRn2jnrQqRJBSrdhFwzVoZZvdrEg==
X-Google-Smtp-Source: AGHT+IG3jYUTv9hFdKl1ALM6mgxnYYenOg9a4tAX8hp2gdvql7zMP7rnzxg9C62Y/ZjNFsF2/NsVcA==
X-Received: by 2002:a17:903:18a:b0:224:93e:b5d7 with SMTP id d9443c01a7336-22e10382c26mr21597655ad.34.1746155427823;
        Thu, 01 May 2025 20:10:27 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e10941869sm3847135ad.258.2025.05.01.20.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 20:10:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 1 May 2025 20:10:26 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Bo Liu <liubo03@inspur.com>
Cc: mail@carsten-spiess.de, jdelvare@suse.com, kcfeng0@nuvoton.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: convert to use maple tree register cache
Message-ID: <26cb8da6-58cf-4c54-89ee-3313b15b3437@roeck-us.net>
References: <20250424010829.2610-1-liubo03@inspur.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424010829.2610-1-liubo03@inspur.com>

On Wed, Apr 23, 2025 at 09:08:29PM -0400, Bo Liu wrote:
> The maple tree register cache is based on a much more modern data structure
> than the rbtree cache and makes optimisation choices which are probably
> more appropriate for modern systems than those made by the rbtree cache.
> 
> Signed-off-by: Bo Liu <liubo03@inspur.com>

Applied.

Guenter
