Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291C16AA7;
	Fri,  7 Feb 2025 02:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738896637; cv=none; b=Ck6wkkHDUJ0D342tSLjagOA4vJDG73ub3lr1ifGlo71P5flwqd3B2rNnxnEz87/m1rIQsDolTjTNd7sRCGROljvKhLNv9yy2r9/Ht7GImGEUErSmw3QJeVQH9kyfjiFChHQddVtdVS/ESMFFM2YwViHRAbBBaJANQvmmFobwXZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738896637; c=relaxed/simple;
	bh=Pw4J47D4Ak6ZuSh8jSQQKFiGB27z0TdakYjj5mIYRAg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSGa1ddoKjYi2z5UbJE1DqhO30ijsnlInVQtePAVi1PfYN5893cRtAtjuBs5MIZaoAv+G6XFzbOaSvCrxzox0sTvUsjZJlzUymWyHmznOSqFXza1hCIJe01DMb9+5nQmiVMkC8SZQrkmAkiq+lShg/FfGdeDFvGt1/Z3xsCN+wQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=asc0rbKs; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="asc0rbKs"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-21f2cfd821eso29140095ad.3;
        Thu, 06 Feb 2025 18:50:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738896633; x=1739501433; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LoN9fL/quEggCApNZ17/tou7HmOaPFaHe8jxVPZJ3Ck=;
        b=asc0rbKsmKUIE6TwKj1VS8E++cO+6f9Ux+TNBr0ceQrjvEeDyw3zTPYQ142DGJ5JEw
         M2V+nQ9A2bLivbFWpOcDRrcsQ4S8SVydYuXOU9oZP2ZF+O0vEP4IiPdxij9qN7krbNb2
         rmFUZuzrsT4SOLPJHu4naejYak3/eYfdwSli/XbsKyIL91Ol3XxloXC+2mXq3QPHHCay
         4/NeRMup7H4WPPKLBnaZZ3oZHdh7jfXUs8bLCtOdgXbnGzSe8Za13K3SCnhS9X4aS4QM
         mIIsgqOCtaPUKWFlZWWoYlfPkIjb0LkD2X06Bw0JKBjGQMiGHkEfLPwRCPNWcShCI8qQ
         d/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738896633; x=1739501433;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LoN9fL/quEggCApNZ17/tou7HmOaPFaHe8jxVPZJ3Ck=;
        b=CRSs74VSuHKUNeSIIp0TtF9UWSDm9ri2TWMNQqLq0dyBye96JKAUUmfbTyYtRxoBLA
         IgYnNxfH/pC3tdB/lcFOrpZzkIO5OvmQDt1epBwL6XqSTGe1wBlbV/pCatuBaLw1BUd8
         HvtlzjvxxozHOrkHXsjMdSOYiN00re2lM0O20/bsN0p8c+9qgd9zJUij6piqCkv3sYwy
         0gxH+yKT4DXqZWbG4te44fjG3M+Qq7+XU24ncKTvPder2lQEzsMD+yK0r5TRgFm/mwWJ
         kgaSKIwWTljsZyyyEtjTj7/FTRsJmeAsLltnQKA9yrIvBgRpwYuE/rTphmzlDtnN1pt4
         MDPg==
X-Forwarded-Encrypted: i=1; AJvYcCV/LtPgYzusxeCoHh8pJoXmmYLUbKb8jPqcuLUGuOHrBMlHTCdfNkVevNDgobVpxxPfUEQU+9xZ/JstFh27@vger.kernel.org, AJvYcCXWI9rOFa4NCWyxj0yXix2Fgb0pi4wdv2uTzg3QVG4zACHDic1CHoOuvJV7I6xhra2RQqqkzX7qeMl1zA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSA1MjsM/wU3T47aqzmCkEaA4ryMjS1AcFzete2eksLw1G6apI
	kol+VtAA3EIfYd9S1eP1lDwuzJ0oMEB1rdhmqWn7KysPF9bzsYrA
X-Gm-Gg: ASbGncvLL6au3BWrngaqUwTsXQFkWlMdEEm5JboOb+GIGNDi8PIq0/HonwJ5IZvBdXs
	XDIVN/ZUYxuCatm2dkgsY8XpURk6xxLMy2QVx5ZXW/7OIoBulJwjIaTZHNfVTQx98i5geCAvsxL
	FMqyG8xadm2725YISjUgQmV/ctIxLuPivQ2I/Em5gFQrt04ttdczlgBoiKrH6TsAo4iwHuH8Wcl
	YygP1RKaYDXWJ5LBu3Lxf+MlY4mlfjXRgKjkfSbtxlRVtHyrlPb+/GhTp62falRDYufsejY3dFG
	gPalRca27zAyfFuIDg/bKqP1O0tc
X-Google-Smtp-Source: AGHT+IEaS8Y70uAmNA3HmxUuCl7ks342fPM4JwQmdFuR6NBgl4S3HxVR9jw/x3UbMqTJ35O6+l/aug==
X-Received: by 2002:a05:6a21:348b:b0:1e1:af70:a30b with SMTP id adf61e73a8af0-1ee03b439a4mr4319807637.34.1738896633235;
        Thu, 06 Feb 2025 18:50:33 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73048bf139fsm2067995b3a.92.2025.02.06.18.50.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 18:50:32 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Feb 2025 18:50:31 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Jean Delvare <jdelvare@suse.com>,
	Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Inochi Amaoto <inochiama@outlook.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: sg2042: add back module description/author tags
Message-ID: <cda21f0a-a6b4-4622-bd04-014dee423b32@roeck-us.net>
References: <20250205121419.373464-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250205121419.373464-1-arnd@kernel.org>

On Wed, Feb 05, 2025 at 01:14:08PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> A previous code reorganization inadvertently dropped the two tags,
> which leads to a "make W=1" warning:
> 
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/hwmon/sg2042-mcu.o
> 
> Add these back.
> 
> Fixes: cd4db38c4368 ("hwmon: (sg2042) Use per-client debugfs entry")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Reviewed-by: Inochi Amaoto <inochiama@gmail.com>
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied.

Thanks,
Guenter
