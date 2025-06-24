Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C65CD28CF75
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:57:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750766244; cv=none; b=rOh/3fA5ggk6sclGAbg6K/CIUt8zHLjzb4tXdUnAoY2t8xwfmX9PfNoCnlLpw0Rx9i6MlH4fIztPFFlJ6KcQL2nBWad83DskcsmYHZopFOZiQ9S4Cv4MKMs3hj7QzdFaV12o2D7Dp7dSRMcyzhUJ2HWNJJflrbakiKMR5Fr1phg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750766244; c=relaxed/simple;
	bh=tRy1eXVSAZ56E3F4ovZPdbmpPSsxWjWS0y1a7XOGytg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aM4gYDhanUmRPPGspLLAhflUKYI2WXVa3Uom9Qrgm7y6ef5fCulpgk8ZmqWjNMerKedLfLRXw+hJaNO4omplolej9FGKcbaYJ1yXNZ9SNcJmo5F4GhSSYdFlvMsPHoE8Lw2zSRtdAVd4W+fSxzCaMeLGHhOqStXxfnXXO/xqLdg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=MhDBnMaZ; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="MhDBnMaZ"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311da0bef4aso5570475a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 04:57:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1750766242; x=1751371042; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q86PY0wC/gj3dz8RRxO/iauAyWxBGEaS/86SENs7hZg=;
        b=MhDBnMaZ73ioL1i/bOywA8euLyIP+6OIXW9V0udYBCo9Z3jY39WQva7uJT+uL29FTk
         cfcA5l8b+STdXdklCQN5D/5UrKhsHYAZeV1r73H7h8NITyn2dO7mB+4OBkgA1MRVDQ9z
         PuJLMm9mkBmO1pNrp2/2AYroBhKWvkn5/NwEyFBBMGOtIOtmRjUq/UrW/wxCE10tDI6b
         0VaFDxf9EmeTEcS4q7/1cLSGG0lSI/o3U+YNfD1kpxYmCimM5vLPIB3Ll3yvmECcOxch
         hqMNfxWXzKucJOs5UwohT/aX5fBtKdO3I1hZtQx5QHCgNGinU3gmYbt+soy8bubKzaYn
         zfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750766242; x=1751371042;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q86PY0wC/gj3dz8RRxO/iauAyWxBGEaS/86SENs7hZg=;
        b=O+zuxhxkF8DaQo8LIDd4n+dB4xqkiVjGHu3siCSwrW57cJNJQ7N1PFNQDumIXTG8il
         oAS9Sgp8ho1KprJdW5QATUe1IuAsgEOgx29M3XkHsc8K4udMdL85/JU1d0LlAP2AN4Ld
         apT4XHvfIVDpmXlzuGfszsB4FS0VIbevaL7k7c2cAOQlBx/k1s1r0wINQmqMT3WBJzXK
         W66jvaGwb/C0GyQJtGm5Yin+DkX9IPKogjLiLkDrZ19HjiZQG2TfR5UtiArMbNmzrrgb
         EpH+SSnT6kZi28CVqM2xXYhFFttnpTfQavLJJBNTZZOLVfPbutlrVfPjaCCaTFHo8s60
         vNPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhNXmzvK1NL/MAo67AR11AY/+Niwsqa8D7vwZqKoL49P1msmNSeTO/KCFmMDZ1TSq+X/eztxATyGl2s7c=@vger.kernel.org
X-Gm-Message-State: AOJu0YyUohVVws3zPQ01xJJAywgki2dCWoMHp/AlWJ9ERAY+WT7tea+Q
	h1xccfrDf541uy8uijvJ33o+At+65MykW/EcOAb5A7DpBmwXYqqiMSOBq16Xs+6J99Me2ALQMil
	2uJPq0cMu3pwh9fuOvg79DTLxSvCPtyZ7WW4CaiESzw==
X-Gm-Gg: ASbGnct+9i92WgQk29/LSWtoaSX/WjpH+sv2hymy+Nt7fbXm4ok3sCDqZz3MbS5gJhr
	brsQ+wDJbD5Wm3EQhgrbgykxQiO5bO0zDMeAHqixRznN4XKAGRoxuflgFkcRYJGLY77bTflwZoU
	lCkU79ZrsmYEyHiCSIQ/3Eip6hWdEjGzxVJS7jO/1g7xk=
X-Google-Smtp-Source: AGHT+IExtPp2I2mFB0A9OeofBQzId6Ui2rK6a6yZnOAvbn0MCJF3aNmFF52R/DaW0iRmuQwDOo3jMJSYi3yRrmIXxCw=
X-Received: by 2002:a17:90b:5690:b0:312:1ac5:c7c7 with SMTP id
 98e67ed59e1d1-3159d6257b4mr24312771a91.2.1750766241983; Tue, 24 Jun 2025
 04:57:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250623130700.210182694@linuxfoundation.org>
In-Reply-To: <20250623130700.210182694@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Tue, 24 Jun 2025 20:57:05 +0900
X-Gm-Features: AX0GCFuTEjbibu-8Tjw0fKQGwh7s3i7RYXmZdiawgw2iqWdvIFiSW0TkstL5ynU
Message-ID: <CAKL4bV7Ce1J2xVQNbsgWwNm0ekUiny6TxtSvaXa8dQ=-tT-mCA@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/592] 6.15.4-rc1 review
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

On Mon, Jun 23, 2025 at 10:09=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.4 release.
> There are 592 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Wed, 25 Jun 2025 13:05:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.4-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.15.4-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.4-rc1rv-gde19bfa00d6f
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Tue Jun 24 20:14:32 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
