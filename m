Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5831C25DAE3
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:52:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744195973; cv=none; b=cKMIac2wyGB2otuC4Ab499iS8nbL3z9NqHvdgxMRv7CPhGJyytaj9Co6IwbzfPukWH/2C7QmT0okS2WMAalSmAmmWg9xIOuOks9E2SwIkhYnUjWzIm7LDrWRF2ens+Mz07v4o6z62Bxu2edsvZ5Vpe+eg1BB60KBEUGqrHzEBn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744195973; c=relaxed/simple;
	bh=j+uEOn94WeDJ8rRSksBy522NBpryi2/Dt/AiLrHWerw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hFz/ILJGDlxDLo6wQWSTrHoJoMbZt8uZ+ozdY38aO1ezn0ebO/166WF+0dt6lv4ufAZBVsBqe7PrDAdXdPN+1ZEKpy/8vMQqTpmKUv/sE+ZiuaUxeLemjMDYCOH/uwR3r94IG7KOwoB7xmlA6dBvnT9IBV62Xm/0fNCBFxHmLKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=t8lnxbbY; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="t8lnxbbY"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-af9065f0fc0so4445205a12.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 03:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1744195971; x=1744800771; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GP3mLYDJdiYs49Wy/ACTrdIEYtJ1MffPrsed0RZQMck=;
        b=t8lnxbbY8efZ89A+0sbiouO2Rn0Y/wm6UDmMaYVkAVcCFIgPqn2yOBfgAnFTmrkFWF
         8BD8SvxSqL0pT6xbt/fbnSbN2NKs1pyAudGF+kFp+h/WfIXjX3EzkTuxwEYoUzqf4Yst
         K2sxdpV9t2dpMLh2CYLlxdXTIgFJAKg8slx5W8GE8GDmAfPMhpm6g+a5UgpyxyARAd6T
         m1igdCXomQIjGEu0rYW7cPBbo82onDnZiOB2JOYGa2yfESwrgNf0av8/WTLrtOzx4OOF
         bwHi/53PX8Ayen9vdAVN9ofUKhw49VPnXQ77SiNUY4drhbCF095Q870xCfHvYYrFzVst
         QEaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744195971; x=1744800771;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GP3mLYDJdiYs49Wy/ACTrdIEYtJ1MffPrsed0RZQMck=;
        b=rxQmF0FWlBy5BoZ3uyosMOh1+3oToQktsGXUV6TqIxZwkw+AEzDFwM8oa+Lfpnck7j
         W1w0xJuNSTqKxldTsWWdu2cFsbisX5KoZKr9DezgAjOkNybz0gioGzxbFzVHDeVRJ9Ul
         KKunSqthxBlCuKM7Aa+jWr/qRloLBevHGIYbUiYnrobTmqDJmBdBsCKF1UVGVVs3zLo3
         sC4T2JEEf9fwNTvciqCcjH4tT84VeT1f2UiwVh0HdiKS/0zvpFkQaxzzgy/s70JsVMfd
         WIhq/vUBxsYJFQ5/kFBcmvcxZ/LPLk+vDx8L2bHmDpKiS60H14rQO+FhzgsSVaEbaNuq
         ZC5g==
X-Forwarded-Encrypted: i=1; AJvYcCWRkRdHz5qfIFL11LvhsWaZM1mP43kME21/mg254g+rSRPDFQ9imqoofdVSaIyh3PSiFcRrNepH9XTp2GE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn31ripIbpEP409IXvIgFDvs/SAcBTCLqML9RJAPyO3UEIhYQ+
	sqV3GDxTXzn63VH+85haj2EzzLUQP7qpbl8KW319aWXUE6TjSBiEMWvhPWp65gDpYX8nplu8pTy
	GgUj/CgmxejpFI1QB9b9QCWuKxFUvGIdX7jWBgEyEcNnjL0vcRZebjg==
X-Gm-Gg: ASbGncuhhoEvl4lqpUk37vqg3i2/oZfKx6rvj1tB7EBy2lWSvhXwE3aK9zjprApOAD7
	Xnrd0f7fNZhiMFnytC7eBLUOvqF4Y0/fzqS4PEGSMFmooxQakySpXJ299WvRVEQrD3CnaVjOcFg
	4mWD2qiuMcmfXgnXaf4M9EHw==
X-Google-Smtp-Source: AGHT+IE8q2Fp7m5nIPPywP2omnIJkj+8unBb4Xhy4pc3ScTFmwB7HP+RqNqLS0Q/9/FH/M13aISBQjE/oCpdYRuqHDI=
X-Received: by 2002:a17:90b:520a:b0:2ff:58a4:9db3 with SMTP id
 98e67ed59e1d1-306dd56b573mr2623679a91.35.1744195971569; Wed, 09 Apr 2025
 03:52:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250408195232.204375459@linuxfoundation.org>
In-Reply-To: <20250408195232.204375459@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Wed, 9 Apr 2025 19:52:35 +0900
X-Gm-Features: ATxdqUECQ863JszPw4BKDGauaEHrGOh4MUsIOWrVopMSy7rYKfjkRIj4B0RxQn0
Message-ID: <CAKL4bV7inHa+o4mka+16qqdxxQvpKFj+gJ6mfi1uzHrXZp27TA@mail.gmail.com>
Subject: Re: [PATCH 6.14 000/728] 6.14.2-rc3 review
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

On Wed, Apr 9, 2025 at 4:57=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.14.2 release.
> There are 728 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 10 Apr 2025 19:51:20 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.14.2-rc3.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.14.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.14.2-rc3 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.14.2-rc3rv-g5bf098994f3a
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20250207, GNU ld (GNU
Binutils) 2.44) #1 SMP PREEMPT_DYNAMIC Wed Apr  9 18:59:40 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
