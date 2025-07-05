Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407414A3E
	for <linux-kernel@vger.kernel.org>; Sat,  5 Jul 2025 00:04:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751673876; cv=none; b=TaUumwFRLmRErjHQomXwvEpTu77gBRsXHa/yYyRkYNkcH8ZSZzr002EldJNZqxoOp4+Jx/7r8w+GxXzERLY9AEN91Ii3qlprtIfvWz83TcqpDF3PfF9TshDf8fU9P+iqP4tEJ729g/J4VG5B8/R2pt7d5qEl10LKsRxHNCuysSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751673876; c=relaxed/simple;
	bh=cQn9yrpoCKxPpNPYTaDD6vWUrHb9Ycp53SAjECtWP+8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gMXTsdIZisQkDZ6PCssazTn42POqbs2uYcqKVO5ahqpJE6fPiZQM5OJDN3KWrjLniNnu9Ux+qf1iocYUxEKyF+lBUE6BFJwBbEqWGXXAtGDW53mQQaOmW0diu3RhXIYU9IxB7W0NmfumvEQ7PMWh+NYfd+BNDCPZN5fu7DLBlgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=VSVS8Wyy; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="VSVS8Wyy"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so1320228a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 17:04:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1751673874; x=1752278674; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YohGG/02x8hX9vac+k+fEJpcSYnH2Xpq8TxgAOM+wZk=;
        b=VSVS8WyyVvnvhl8nMluXKJiHF0AAkhU11WkUonCszaWjDFaDH/wJ4GyCNd3xwhVca5
         9GHQnq1AKeLx/loidkywBzBmrnGMKQdrx2xDiLOKoGfq5hMiD5gAVIK+mIo53pfenJqW
         QlBowiUklDxwMESk8H+RzmkN7AeZgF94K+f6B6eN6kAUUalk271/798TOP88u65iLTLM
         2a2h8p4A+TQY9jOGzs7UHqB4dzqMz9c/IRMlovdEsvH54SHJq6tGEdkfiJcOKgWH1iDf
         bqNcHYHLHnWJ8pd6FN3+3jsRAxYRn74goYxOwSnYw4LEloKrej1qQbs0NwwtJtRwdE6+
         7TbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751673874; x=1752278674;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YohGG/02x8hX9vac+k+fEJpcSYnH2Xpq8TxgAOM+wZk=;
        b=LSN/ZFO3lBqcxjNT5iB99daPZSpEvlu6xA5LTiotjRmFIQlflIKX/vVnOHwyOSgHeb
         6+EpmADBUvZO/sDcnv61NyPJ/u8JLV99uRj3dBkXgQVE1cFaNH46dhmTpd6/Glu0ADWr
         eduJCpFvxn+N9LHXjvnyKK+XXbGdE2RuUVpMWsf49NnsXIGLqw47ZXCXPjmo1SNZ0ylK
         G7KSuFrMC+pZ/CJW/kulrQIKzZ/yd++LYRwW+Ys5vYoTUaUncBGzwyunwMdsyj03H+kb
         HC4twUf0BSmo/TkS8hNw+6kKuhQXFAa4roeotN8tA8uYkr4xn6FRACUrQfE08TrIk7tC
         Rcew==
X-Forwarded-Encrypted: i=1; AJvYcCWQZic6TZqRswKmvkmIU3Pdz3e8p6yJkLBfS50HQY8ldWG4TZ+Dw7YqVG3IWRqiOdS6z9r8Wi+34vZ3ptE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxglT8s9b+5GATZi0AxLNszRcjIUOtfStizYZrtIjNUmUPidWI
	P6l49F9eJE7YpWI6LyJNP2FCn7mVJXw67wTkVddyALwlFQhNYUmn2SXmOIx1GJI0GNrBQLECFsp
	ktxaVj0aJ6QI0yy5T2MqVVygjcFE3ESrPOpwqSY3Ozn8e1cnLdiYwRo7G3A==
X-Gm-Gg: ASbGncuxtYDLQ8pllIcyA/HavKE0n0eDUAbDHw8tEf5fVgyQZ5F1Muz8ToOBkG/nqrX
	Zzw5Ni7YMVGgy+dE1O3CPrgYpk3mdHUDuoFtWFtWGwhqk2EvpSGWY7TqSWg7leZw/4mGLM8w9+D
	dc4ODM/YprCDhZFdrAIwxAU9zhsXzl5JR8una/1klsMkA=
X-Google-Smtp-Source: AGHT+IGf4zn55xJxNO+Ei2qbAPwEWfllK5AnE9LbEgnFHbpPBtwWNXxG6wc9ktZ1haf5oyrsvWhN4t1nDjOPW+/SnXw=
X-Received: by 2002:a17:90a:c2cb:b0:312:ec:412f with SMTP id
 98e67ed59e1d1-31aac44cc39mr7095613a91.14.1751673874549; Fri, 04 Jul 2025
 17:04:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250704125604.759558342@linuxfoundation.org>
In-Reply-To: <20250704125604.759558342@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sat, 5 Jul 2025 09:04:18 +0900
X-Gm-Features: Ac12FXwD2bbzcylFZR2ONQNxm2E_WZHpZHRmFk4o3eqUNd6oubOnm7i8DFF4Oi8
Message-ID: <CAKL4bV7GRQZ7pd3srCr-KEHOJbs=Z+pWsS99Gadpgk5LeXzhgw@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/263] 6.15.5-rc2 review
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

On Fri, Jul 4, 2025 at 11:44=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.5 release.
> There are 263 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sun, 06 Jul 2025 12:55:09 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.5-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.15.5-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.5-rc2-gf6977c36decb
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Sat Jul  5 08:29:06 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
