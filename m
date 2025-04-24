Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20DD527A936
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 12:37:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745498279; cv=none; b=QGPt2pamUPMB4Lex1jjCck+GXNTzpd8nXHDwbbShTE/Ya/XYJ6Mt+dKESXsGJJ/cqhdh15bCcKHzTtI12lIFUyM4ZAr+qY9JhUTwBI4f0coioNt8iWseEL7BoaTSOS9u+SJUkjZivR5i2SJxvb6oxTb91HKB+wbDKz1/gv7uR4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745498279; c=relaxed/simple;
	bh=y6xwBroK6Cw33bDi3/bZVR2AEIsdxRcF2bY256Tok1M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HQ2umeAeT8xWDI4Z/qKdsbnL95jB/vJoi0ptjbtAyceECLnjhATNVbfUUR/FLT2KXaqxaGUvgMaJYV+tmtQIyZDBKbGn2qekJpGH+0Pw7non3H06EZPfEAhJVOqjnwN7uR76hBsrrSkJAwBkZ4BhxVbcm1rPJR/qfX7K5NS+aj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=bnZx/hXq; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="bnZx/hXq"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af590aea813so2064356a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 05:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1745498277; x=1746103077; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nZpWL/S+NSRUlk5wqUBhROOnOk/3l0ze67ok0V8c+5I=;
        b=bnZx/hXq9gufBDxFRSjWWlE8eXGiDjYZkH/Ld19kan4qYmTI7pU0XWIzsVWHjyPHyL
         +53YM5Se7ERnCws1NgbmtFvSH55a5K0pJm2z/N2HsRRHnziyXtBRRhX4+iuLEgIB1vUT
         FbF4lRFx7DiI6XVBriy7KJ6raavuEr0/ysnG8+zEkl8LYe9GKpWzAJmtdlH+YnuACnVU
         hF1Qn/JtzEZI0TnxKWTDdY4KoBDD5uH4mZYrWg2d3Sz3wxgwvrtv2Otm7d/O9TpBLYRg
         1Ah9vrtcDdBQ/lU3m2T67pw6s6ZbkFSdd5j9eW5UCFkJ1Cgva2Ln03dn5lpXGdFq/aHP
         RAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745498277; x=1746103077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nZpWL/S+NSRUlk5wqUBhROOnOk/3l0ze67ok0V8c+5I=;
        b=vnioRgqoAckNfxVJInRbcSSjIbYOjrYVCMMzd7GUSyjGtTHDqq8s1Z7IT+47s1xpH3
         SAET8peMP3axGIEQqy/piDi40ySHFnQ2WsxQmwuJFrSJZsuwWz9S4jCBVNE4nszlB66B
         FGkdyS39OunCbtXFbzEC+lasj+CJcwajnhfn3dRnZXxzwpVMTQNA80wBN2o/IDSETxgN
         goLhSNs+T0HznUoH5P+nwgXxoGmoA1uhmpGc/rYEaMoGMkU4+yRgsb1FnWp1+jXLyZ4C
         25KbXjyJ4EJ9kBo1GOp0k0L09A+ao2Nr5nFg/4wjUl+X2TTyNaGMSooKq6OaEjT6XWtI
         qYMA==
X-Forwarded-Encrypted: i=1; AJvYcCXdFnIjD1Xhs9SiJTKLy0e3L+eF7i29fKHykg6MYq0LsPbz9bfK4Dp1RKi2Y+SKnixcIlOgC5WWeMBdR6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6oyBj89M3+Je+6RJRW1SrhgEsKw0MoVTNEUo/HdLueqRrrI50
	YkSNdYi6K0DQsKP4j6gwCjDPyZ/tIruMAyh+CmY/XbXvGYNHdc8uoS4bsCCDY/RgkgT2PPX8jLT
	jXR1VSZ/VdLpbfHNxfoEtgX3T7/kPQsFc9kq17w==
X-Gm-Gg: ASbGncsCh7t90SypuxDIr986pWecoMbGqtldzuzDHjbElazZNA1v5h6m8hH92KqXC7L
	GWKQBVBax9uQUMnTxUvdVV5btugFQY+mCGz+rHZFKtPbP76345Eg5LPCVEp5e17hQY4l6nHXzi9
	sihF2fmGw0BI9wlrO9/ygNTjXgRcf8FZtu
X-Google-Smtp-Source: AGHT+IFZiMB6j3ycGd0+0mt1gFr0C5pjE8ZeKmh2QCQ+qpdXY6INn1eOuR8jJhehu9q6wu/xF32MCcHREH5Z2qVs7zo=
X-Received: by 2002:a17:90b:28cf:b0:2fa:2133:bc87 with SMTP id
 98e67ed59e1d1-309ee37b4f8mr3286435a91.6.1745498277298; Thu, 24 Apr 2025
 05:37:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250423142620.525425242@linuxfoundation.org>
In-Reply-To: <20250423142620.525425242@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Thu, 24 Apr 2025 21:37:40 +0900
X-Gm-Features: ATxdqUG7SveaxlChrXmWKmEOOPp12zjRNih3IrQJPBkjwP-JegqpOJKeUEoj8_k
Message-ID: <CAKL4bV4AZY_8WmQv25XC5EiuRzTS4gfCoo_DDq0evfFkMmHZqQ@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/241] 6.14.4-rc1 review
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: stable@vger.kernel.org, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@denx.de, 
	jonathanh@nvidia.com, f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, 
	srw@sladewatkins.net, rwarsow@gmx.de, conor@kernel.org, hargar@microsoft.com, 
	broonie@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg

On Wed, Apr 23, 2025 at 11:47=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.4 release.
> There are 241 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Fri, 25 Apr 2025 14:25:27 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.4-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.4-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.4-rc1rv-g86c135e93323
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU
Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Thu Apr 24 21:12:13 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
