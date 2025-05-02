Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBACAD24;
	Fri,  2 May 2025 03:07:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746155281; cv=none; b=V5QQ4j5G+UOMdFUsBZll/UPEU3f8JsV7WehRuNLcKRKgmPeBw+wsVUCWNYIjhqnKXlgBhc0KUp5+ITCaJRWFfsNYzCMQZqlWJ1+XnpCvSJd6sPJHKnuwa+Ys3vQfLUZQU1obrD7Pf64Fm080L2y7tetwZpXCxLER93JuvPfuaK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746155281; c=relaxed/simple;
	bh=MJyl2k5yqd44Kvel7sxoCFX11yZKu/q5XrHYAApYtis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QLzKo/MBNaK1kA1/4WkF7GoWYGnj1l4iz9aiXl7ckPP8RYktYujJFTnFMmv6liQSum3nx+OOEwnGKEMx+k5i2XKLYuqVGzA29h92U8SmDwjQcFbUCu2wB9+WZMP8tCLaH2oToV7PZojotXB9Fy3eECdYw6u/VVbAcLQXlzLwjy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zts0Jjvx; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zts0Jjvx"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73bf5aa95e7so1550735b3a.1;
        Thu, 01 May 2025 20:07:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746155279; x=1746760079; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kVtvDV0C/eHfIXjQ6YUfb3F1rCb5PxuZuk0fhziZi+g=;
        b=Zts0JjvxYq9CUQjaG8LpYa2O3rqxK76Vp10OfOIZkF7LQs04At/5qHC8UoUZtMvmlq
         JVsVwGkTl2bR5zWC+2wSjX0oq7GTIoepqe/Oqx5WK/ca959ORDlvLSrBWaaqNemcPjy8
         RIz2aVCtoE27zA7of8mnUIVE+2FIiBTFmacktfs82uDq2z/sGonI11JRf2kgN3rwD+SJ
         8WmBSPUhffkF008YMAPlDM/jiyUwGrtBh+yPA4Aw71YcF10cm9scoQvpe0SIApskTWuS
         4G2sZDKyFt1BwjdATaVXnCkMWDldbI3PoTi/9zF+8zl0I9HDg7RcrG854iWgevV6Vd8/
         c91w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746155279; x=1746760079;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVtvDV0C/eHfIXjQ6YUfb3F1rCb5PxuZuk0fhziZi+g=;
        b=BgF7R2Qy8s1sCYb+/vJj/nytHuMD18RA013A1BvFfwmPfInctXgrCci5ziZMjcz9PG
         7Nj1yWZ6lKA+V9z/m6h8wRzdDI/SYc66WWUCONS+JnYqQ/pduKHEhCf4IGZqFxJNRHX9
         WLdhQHKlggsIz9XhP+cQguDYylefDLV293Yf0VTav60yXIMmSvFEhIFCTp32ap/pNeQc
         qD4za3RKDZr+5StVSy/e5pTCg9pAClEuQQrhdt08DMVF46+F5HZxrblZ9egN64Z9PNiw
         yx0XSXVyBYY4cm+0yKdYOlCvc69c01YzEfMzH+Hkw4SQAfhi6Gw2hFND/i3+vAHXG3wo
         5w5A==
X-Forwarded-Encrypted: i=1; AJvYcCVdR2zaFmTWK8iA7DPHdxYJ3zoHGwuqAfjqFm0Y0NeKXql8bQjnVHv2wiaFQfzIoWFAVCXWdWHxRNTuC7Ep@vger.kernel.org, AJvYcCWpJmkhmSLYJ7CeBuf24C7yIJhGhhOPdd7WH+SEM+SDFd6Q0z2bTn//2wGbfonAQMb+3+dWvFSaqaX+aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrCJgLS9XrXjrk8Gk9jihjUJPi30YRmY0/S/aHFZqJiS0bX3eB
	x3AErZx5qNsGcAHs78hFfiUwNyuuCdxyudnN82Jrp2HUtGDc9PDS
X-Gm-Gg: ASbGncvgKYDQS1Wlb20KCbSwYro27+z/Xyb1kdxqi/1wByRimQZ4iTyVuOMCP4AUGzd
	oS7qCNDD8rwxEMilXXG6yOrfHrYoz4v+UwVn4ShDXnRHEwxxPLt8x88tSlmnfm9QiUqBz3Ha6dC
	HBuxeJAgofEabUl3AhRmN8C7pYHTCLU9vmoXbqarVlmTX7L0bq1x0SHtFOBJDnfXWxM61xiNmlt
	x3UDwIm0bZ9SVnXvNMpXiPVXYGLqTDzK5CSSJzEtglLIexV0DOqGqDuT+jghzvhGA0rsuZpmIG4
	QjAn/vyMYEmtIZ/s6ZB4pWaZRWhNpXxGhRFHZvtvAjSqMsx5SfJzPg==
X-Google-Smtp-Source: AGHT+IHM7iT0kaDRezlM4eZHATSGJlglo1w9pqSNSyXL7KG+pXFpYOMcv4R71hZO1pglEoxpc823FA==
X-Received: by 2002:a05:6a20:d494:b0:204:432e:5fa4 with SMTP id adf61e73a8af0-20cdee3ad97mr1865553637.23.1746155278726;
        Thu, 01 May 2025 20:07:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058d7a225sm458715b3a.23.2025.05.01.20.07.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 20:07:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 1 May 2025 20:07:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexei Safin <a.safin@rosa.ru>
Cc: Eugene Shalygin <eugene.shalygin@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) check sensor index in
 read_string()
Message-ID: <745427d1-3c2d-4ad4-90b5-773466aa269e@roeck-us.net>
References: <20250424202654.5902-1-a.safin@rosa.ru>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250424202654.5902-1-a.safin@rosa.ru>

On Thu, Apr 24, 2025 at 11:26:54PM +0300, Alexei Safin wrote:
> Prevent a potential invalid memory access when the requested sensor
> is not found.
> 
> find_ec_sensor_index() may return a negative value (e.g. -ENOENT),
> but its result was used without checking, which could lead to
> undefined behavior when passed to get_sensor_info().
> 
> Add a proper check to return -EINVAL if sensor_index is negative.
> 
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
> 
> Fixes: d0ddfd241e57 ("hwmon: (asus-ec-sensors) add driver for ASUS EC")
> Signed-off-by: Alexei Safin <a.safin@rosa.ru>

Since we can't agree on warn or not or how, I decided to apply this
version after changing the error return value as suggested.

Guenter
