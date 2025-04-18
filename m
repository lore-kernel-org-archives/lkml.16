Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4E927815A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744983359; cv=none; b=GL9O5UvSHjPkb7F3lFS0rFvXIqi2Onu0CTc4lqUGbraqrc2zXCy7bjA2LYGfsu+iXOlulVYnw5r0g1LKeNJXw4hQ6NrVknRh7pK2xm3oryG4dr3nmNDJpe/QOx9iLf8ybEucbmXQJRibtINcKOtgTQ4DzniLZZj7ZwIf7C7rngo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744983359; c=relaxed/simple;
	bh=3QDmuHmDcXII7yvPfaVTp22nIGOY70Z6X9jLpFJwTO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PaQiZpOgz4rmgA5XV4EQv2RM8tWbqrPriXLRj0/pHmL+E/p8Ouv4ZVQHh+z74dW1rcSxj0DpjnhPtqV5NE24o3bxbVnGCD2wt+KnbWXMY42dwzkhZg9xRZibmLJzPrLYrdFrpXnmndudktc97z2XhGHsCXdsSD7AXp5N4zCtyPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=hGgktBRD; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="hGgktBRD"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-2ff64550991so1255814a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 06:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1744983357; x=1745588157; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r45gHrvj+34dC5NFe9TWN4ATAYJOPM9aWOmtX/SbRpY=;
        b=hGgktBRD2vmeOLaA3oth3cvF7TbCSOs7JAxu2HjU462I0BGYBrTy7O301iHn9xv0zu
         aiYPUCeJcHWQrK2B6omu8MzAwnZdEJsCZFOQmPsiIHKdD987X8bkeM1am2Rrh4yBEWT+
         Z+TA/HClK4F7+FrwftxDd8JS36XHUwsQQxBEnW3PZ3IaLiZ8oVd4hpYBh8nO5JY+yLAa
         7klMWnRuWzHQpfcIibMThN4EKsMy1pgyQIpt2jm1/+BJ4vev2fkhZWaM7hDiAs5ZcrXm
         CQqt/g9kdFHsyNKJTeudJ6TtFC7k03i7mlsoynal+2t7SL7WnePSJTkpJrXC8VPEhoKM
         9Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744983357; x=1745588157;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r45gHrvj+34dC5NFe9TWN4ATAYJOPM9aWOmtX/SbRpY=;
        b=DlzBOkBIYINejoJjqqwJusLtlyk1tDptCCr8KHECbhqO6IJQK4PGA2Wbkfc7/6y+iH
         psXv5MNLdwyboP9tv4Og/NYY6IajyJGrq9X5lhXKstA/LnN1t1fN4zv7fQLWw4RefmD+
         sw7jUlZ5J/lEZuqFPYnX7Ds9SV8yGRWVb8n4A4MvbpCUcl6sNMKo3bxg+n/otwqn4dxj
         oOu3P1mi2jC68CH+bWZntOShpB0Rgq7Ap2CJp8bXC2S1sgukqE6+pX4eD4HmJGwLV/f9
         hu0uHn6SDnP5vEOAw6Xh9JaJTLCfZin4cgg0oD6mtFXrQdi633v412rFVB2Xc6UW9NgN
         kMqQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQiE8FPeQsqVSvI3wfMWKnfX6CeAkGhVddD4g20LLeL42QFFIaMkg3eHWA3aMVp4VO3cnrFBJJR4uYxxQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhBUupyKPm2JoVNqttoGPv3UMNmkQs1c1iijoGqLShEz+E4d0W
	Fvep6XGeglknaRGrIq1EMuPoDrfou/hIYhtWuVc6UW52LLTbuuAVZEhp7n2N2m+GugPqv+7To2n
	46CubOSbrX2YpCgU3Lp1NMG8UxSzHQNHFlgPKfw==
X-Gm-Gg: ASbGncsuecYilYo3y3ikyrYMAsb1itiNzHHkH5zwSsjfECi8NmbLR7PYnivpIecCY2v
	ePwgO6AgsUsbmm+aogwDBbkMgmI5K+QAqa4wxIgE6Wl630a6pITQGiQJ6LejKBbhh+pnglreBdq
	xVL/OSyTdXNVIQ8EsgnwqShg==
X-Google-Smtp-Source: AGHT+IFqngEBbHaX2QdwEE3HsnDHxcnw7w8+EIZiIRsTTuz89IIJcidVWtQ0RrBbV3822UkQAYwqoYqBNqqBeud2jKE=
X-Received: by 2002:a17:90b:528a:b0:2fe:9783:afd3 with SMTP id
 98e67ed59e1d1-3087bb396abmr5001654a91.2.1744983356901; Fri, 18 Apr 2025
 06:35:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250418110423.925580973@linuxfoundation.org>
In-Reply-To: <20250418110423.925580973@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 18 Apr 2025 22:35:40 +0900
X-Gm-Features: ATxdqUGfPD_Fn3CbFgQ2JqWIaEF-HIOZJH7bBppNB-unRzzXA6xZw7RWTQbVovg
Message-ID: <CAKL4bV6cjDh24qpW-g_a2i+OF_kujS0kMp-Dvy+OoVAiOJLHtg@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/447] 6.14.3-rc2 review
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

On Fri, Apr 18, 2025 at 8:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.3 release.
> There are 447 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 20 Apr 2025 11:02:55 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.3-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.3-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.3-rc2rv-gfc253f3d7070
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU
Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Fri Apr 18 22:09:28 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
