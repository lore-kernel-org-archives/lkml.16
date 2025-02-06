Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5881322FF35
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 22:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738879767; cv=none; b=utu/Pf4S6lg8/ju1rfpBdpTzMAq3bMMLs7+rtdSv8lpoQ3fUAm/PhRAdodXcIXcdfE8WkwTUuTAVBj+/9hRteCnCbOz7cgcT3dqcViaesOh4wQf1F4lKupLjmkbd7Wx6rPipv5DSOnvaw4so8mke1EugV4ktrYQ5Rr1nr8oJCWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738879767; c=relaxed/simple;
	bh=v8Cb/I97cbYSHojVbzWOcSDJMzlNFCCIVvXaYBcMZxI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i2jYlHH+zsCPhJ47MWNT7L8NVlpOCi3J2j2AwJCKU1c16oesUnNHc4VG320pipnZDkmszb7B1JVttPmNQpVbT9zsyPReeagRTYDbzkQpnHQ2x7oIf4+Anvxx2fhtCxGn0h3d8DKGisakdCF8bM6YeMoEQpqYay3ogJlWHeowLg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=WS9x6mvv; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="WS9x6mvv"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f49bd087cso10620945ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 14:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1738879764; x=1739484564; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YowFV95RzqYpXXncaW4VNnhPzNA0mgUHkVJDlV/Z4no=;
        b=WS9x6mvvw1xRtAvcpMCfBQJHjKlMf8A/0GANFGWK3D4TvvqRrOLf+witlUNi4HOqPv
         v7zIcMgdW+8qfMbJaBNu/b1CsNcDchgfKL5IYdn9uWukS0LoIY++PlFrj3XSvSqtcR74
         Cqy++AHBfbINO0NsAqXOeNcWC0C3e4xlbibUnme0wQabxssoYLzQD8jPiftyBB8qbmVo
         OVCX4vjMqGspB1WukFpXCzgTXFBIB0/isr1hvavOOww347EMyP26Zuni5PUwE24WdgHH
         YE5ToAchpAI/hhgjRMObZ359n2X7cKao3Q9P4Y4t0ako7U3IT45+A1Uhh/7/CFw7L0pF
         Xfww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738879764; x=1739484564;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YowFV95RzqYpXXncaW4VNnhPzNA0mgUHkVJDlV/Z4no=;
        b=pOiI1WkMx84uoTjPuKDJGKJxZug/52NXzvFZ1wryvxgij10CBCfUUg5+VdSIKbgFWE
         RDcmj30IwDkUQEfQrFrMwcNnR04dDYTu3DXH7IHZ0vZnWp58GuTEf6FOdKaVjN75xhhh
         RJ/X7dU5bjvp/uHUfQ3lqvCzs3JesY2ZzYfzoXlfNoUq5cpXcXltIp9vCZPlrk63j+ok
         NXqcRio1+UsyC0FkJPzqNIEprDhw7gNsQGuvSD5jjBOw3sBf/CV2MsupHfd2fSdg+j1Y
         bdrSHif+h1wHkHakKFwRmHC6pu2a2tczG02jVw4Mi4LWxwezR7qiccOAm/VrADyirP6E
         52cg==
X-Forwarded-Encrypted: i=1; AJvYcCWqOdt6yz821vxWkSeR3aZtEjZB5wnRzFNGsWOf8eWxT78i4hMONYXTsmXle00Q/cyUWTPzR9d/Y3+NZpc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkNSQcTSHIPfVznUz9Y0HcMjXTXVF8hzxySzOXFAmOereQEogs
	70+mYzwnBdOdxC2KU2mtMM30nNIVIwu1OOg0eDaNX3eIpxr7KSSiUgcTaQj+ksMHVQ6U5xq0IRr
	ofv5japd4DzAVirAsqK59+Ewjkt8ny+blXxcXuA==
X-Gm-Gg: ASbGnctH9kChYs3LdF/7OSYF6n2spf0ZeW/ZUYxRs2EqVLwtKLuEwAjGjZobL4BEDKk
	XfmyZmYBaeKd08YJMu3VoiG32Rbth8+VORVf+zfrHxsQRtiviqntLiZflkCbuDQiyIcqmWA==
X-Google-Smtp-Source: AGHT+IHVA3aLLUHBjvM7tBiT/JAeRIG715XqkMU23ZlOgaA1/IPqLSTPkVNA5hE3GgpS2Sq6STuEQ8GQr00qCN1MoNE=
X-Received: by 2002:a17:903:2a86:b0:212:6187:6a76 with SMTP id
 d9443c01a7336-21f4e6afbccmr15332045ad.14.1738879764518; Thu, 06 Feb 2025
 14:09:24 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206160711.563887287@linuxfoundation.org>
In-Reply-To: <20250206160711.563887287@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 7 Feb 2025 07:09:13 +0900
X-Gm-Features: AWEUYZkqc_QFPDa0cmxptap1fL55qjlShAz2QJJR1zciPi5pSP-77julnD_XuYc
Message-ID: <CAKL4bV5Ks9OCh8SrgkoF=UrK3KW+POAXOD77L1kD0P9fOiNC4w@mail.gmail.com>
Subject: Re: [PATCH 6.12 000/583] 6.12.13-rc2 review
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

On Fri, Feb 7, 2025 at 1:11=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.13 release.
> There are 583 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 08 Feb 2025 16:05:14 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.13-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.12.13-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.12.13-rc2rv
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250128, GNU ld (GNU
Binutils) 2.43.1) #1 SMP PREEMPT_DYNAMIC Fri Feb  7 06:24:00 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
