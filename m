Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B14A19539F
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 08:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750234332; cv=none; b=Kc+D5fmQMlz2CZ9MxZ3g9eGQTC76CtPPX93Dq6ejVBC8QtI7KlKqhU7Kl1sjyFazykNG4j5oPrEJVPEWamzwsKDCdt4yztk5wFbajj5P4scLEUSYmuOyG4+Z+4zuJI5MsFf1vaY9zm23B9u/gngv3NMkie9+ORSKvqMPc7wPFS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750234332; c=relaxed/simple;
	bh=0RQPUVwvAOsk5IBp82srvzdKvozlrwpTmR5FjAY3tkc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Czjrz5fqT+jlEXLDNHYVPfdF5XISvew5qoRzBihll9FQ6K7q8trX0J0ePfolPv7B2iG3gAThNFEMJuIlZkAWYmZlDRPWn9+n/C5eIntu5iFfQ8wqE4qpptloS2NprnRVT+YakCysHCWggN2wMzdMwZ9tiINlCRxnD6YQdC37nKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=EdntvusL; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="EdntvusL"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2363e973db1so3663825ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 01:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1750234329; x=1750839129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brjF5TFgyuOObGUl0vP/36GKYjNLHFU9TL+BiTpUMpo=;
        b=EdntvusLIWNlwvN1hiHkvQOPSq1PSmVx19x9i9cABqQIryizJOks5J1WuMJ6bb6RmU
         LCn/vzdO6FJPgzqJyaEgfqcYCohpbYvplaI8PsRf1TlXKWyHToV+zm/zns/ZeFGHhEZd
         IqceooA2hi6ED+Onv+qzTLsTHssHWDsFhgoWCy/43AQbRHHiL3UEeC9+NyfBS83ABKYZ
         VPlGXBGiLcXEhU4AioSdDKzeUk/m5LOrhJAYfx0h+QxT2D65auorMmbxx6fz18zIWfV7
         OvQSXpYqkIOlLpDedRCpDfqnov6sMHtQKydl9JU6dJbdOFzenJV2LOVm3me1zFsZC9op
         6Gqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750234329; x=1750839129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brjF5TFgyuOObGUl0vP/36GKYjNLHFU9TL+BiTpUMpo=;
        b=YaaTRpyFR1umZgPh1DRV+969HI+tBkcaxPGi0Q3v5xq+qUi430KeEmmh5naUTfG3DZ
         pnr186R+bKt1hFsyUh/m5mE3i4AwYjhs7+INtWCzrIrZy+7uqVi4wg5pbZBgNkAj1oWK
         Y320IymD4VbOyhXLCEn0YzJ9VSHbJZaXDKPGdbkUFrgyIZKtbD9SH31DRPcVBwORH3A5
         18TAalLkblfQdq1ycdRXKJ77CpTV95wsIwhtfD2eTkuqEt6mqS7zbKmdzNp4ka6DMJNS
         LtyXkGTGRH4wgdgsEtNhqi49QhNg8xQmzHSJMkmcJARya9hJeDUmbOZoAJ9aQ7gUxGy4
         Q9wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVk2AbLaVxOteS0SvIyptXVorshMSJFHYPbswzEGE/hb4pdLiJqxQ0A2DDpOfvxJwPZGeM0QQPS3y0i1NY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFSnTLfsGl7862cUz6E6jdaM7nVyf2Zw9WDMxjTftzG08sfjGD
	ejjqUl33tThrnItdIhh4+8Qw2hkCrlhaEBIqhBY3eQP6IXByPLU57AflGzJrmuD6hZ8jBaFYRL9
	PCbUsuHo7oDx5NEH4mXyxJkZvoXt+yuaseEJEOUICwA==
X-Gm-Gg: ASbGncuV+lZjHsdpQg3buXA8ansJE1e3+XlFzOjxfXkalB/YcRDY3z5j4aupZ5Z9PHB
	ejCxhCBZhk1Qq06u4+0KhD5klkyHh/M5UWOzL5CDFVr44AWuOvc3/OZ8StwIA5VBJ3Pxcwd77S3
	DBNolgfFL8hyM/osG4KXI/eupJgnJsLnGZCVNN+BiVf4M=
X-Google-Smtp-Source: AGHT+IGpJLHZtnqyqQh2JhkwSxrOCuHgk1TDDY09x7fcoLDuh3vm/ooqXWD5JEagbJwkl/efavMkytyKfGh/yNK0AJQ=
X-Received: by 2002:a17:903:228b:b0:234:11e2:f41 with SMTP id
 d9443c01a7336-237c2046e94mr26764865ad.6.1750234329638; Wed, 18 Jun 2025
 01:12:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250617152451.485330293@linuxfoundation.org>
In-Reply-To: <20250617152451.485330293@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Wed, 18 Jun 2025 17:11:53 +0900
X-Gm-Features: AX0GCFvsu6UCDmq2tIZWb5YR-nmqe-aN02_fZ-ldFZkqfeOhcwzzccegmgganmE
Message-ID: <CAKL4bV7fgF4uFC04rDjjAYVYG9vJHhYzfwq4yB0s7ns-kqdvXA@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/780] 6.15.3-rc1 review
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

On Wed, Jun 18, 2025 at 12:29=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.3 release.
> There are 780 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Thu, 19 Jun 2025 15:22:30 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.3-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.15.3-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.3-rc1rv-gd878a60be557
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Wed Jun 18 16:32:09 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
