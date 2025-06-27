Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E2A293C76
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 09:39:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751017171; cv=none; b=llTPFWeJoemhSTpNL+XPrvhVTvoCi2ttbGdgHJkcFVQ26ndznVcFrSuCaOmrOhLK+FSPDE/opUJ3VL5fjd8zUgpXQpWu/Naeqk02n+RQaXdlnvFcxDJyn/cendfXwXnSFp5rMA7L9W60PnBpKk9fJjc7mYsfsch5RNnZMPqwDfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751017171; c=relaxed/simple;
	bh=sqHLSnoPdND2n2YqIlO9rU36LPxSklJW5fcjecRMfIU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PN2+Q96QUxnzVztEpdEtMrEpsOWeDMPYS5CcuFBh2Escfwj2seOUCrq5swV+0YsFjEuvfeiDQNWC2ok/RNJDHlqZAWHQCk/0WqW0PxxrgklzregWXgOiWg6oqHbXsBLsZLXoZsSU73X39v20M2DWuy5LpNfRhutryJUr7mx/S7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=iQpTZMnt; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="iQpTZMnt"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3138b2f0249so1719653a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 02:39:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1751017169; x=1751621969; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7EoXolbAXfPP7jncmJ+OthdgINgb5uiOwXnkRnnjQZQ=;
        b=iQpTZMntS1cfqk91R40wtBZthKh0HYZdXof1ML/IjyPPHjGkpK0m8zr/OgErcECd2H
         Y7oqc5J8KSDO7gcsVXIwICuk2pzqalXutB4zrYB040oRGvNkE48htrA1KLyD/FYVLUXe
         WcrDQa07TC8b0GTNAGFo8NhxQUC7tWy0OGNuzau7A0Lw/VK8qjdJNc5f4PPS8CbpWl3P
         izOtG1P5QUj1f8EmL6hVh+ujtWrkGq47VXX405oYT/V+as9lvx3Oh6F+TVSdUpXl4vFW
         du4MWaM6qnV+/PxXDdI3jw/oQBbJFrFSyZkQsW5qgJAujSJWfqVW6gX0OPo6irV1GO+N
         drKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751017169; x=1751621969;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7EoXolbAXfPP7jncmJ+OthdgINgb5uiOwXnkRnnjQZQ=;
        b=nJge6tcoxeTQM3FPESSspy06mGafY8aFQvxaz1KyU77QgpKqLLV8XQmLChDvef/pdd
         9wOEIya9y5M+4HULp8k+Zzx+U0HjQJXeTHDYtoAht9ATfolP4VHa5t95x2XaTp0LZ7mo
         yNUvGwiGAKNsenz4f3uiwlWSjuppqIq3wbl4QXjijh/PzihriwQHd8khKliFJ0oiYoxH
         giw8KOunLd0by8WWTliytT5HNLjDWEap7nRdf+LLk3qsxWn1L9WwrVxRVwlffUREKAvY
         LvJkrlJKv2iJN1XIowbRJ/B5hX2rAzZfWrqQzkHErEv+g+SJKxttaJoMWTEKKhwgk2F9
         AslQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqBoDeMzH+83GyDHCufRUw/G4YrqBcWMg55dNMyNiU1HPb5eVIkDv/gPV6eIBpwEYhDs1QnanFRV0CZyw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvWvAN35Y1oi8vVVwNOiPM0PZcdI35iIuktsNsLKH1NCG8FY6w
	DybEofxySpmhAbtEXL9/1ccIOHCYYy+dyujPRJjhMYuY2SW0Evf2cKihvA994u+XQjZVs1x9n/+
	iIwx+SSmr6CIoqYMhW6p2zz0fGpBaLbXaMuGTuJFIjg==
X-Gm-Gg: ASbGncvH6t7dOldc5lmLH9oPAjDuiDVwUjGEeqy2ZWUeB016b+3eira53I41/vmUKWU
	oMttvTFQFF9u3hoaxyRBvEKXy1oQJoIIZHbkyhxY+FhlmOrdETLXqt+oRNZpptZnzn6l+RBnz91
	hzxeFcdPQjITY8UjRpkDwVvpJJGEOepH2GvEiybQevjNs=
X-Google-Smtp-Source: AGHT+IGP36mzrkCAQx/61O1uVwnGrnhnEFQFaqi7Au+tCZKEUAsLtA9E3QNCQ4g5Lbjr9hqyOV0ruBng7xb3pRA7xMQ=
X-Received: by 2002:a17:90a:f94d:b0:311:c5d9:2c7c with SMTP id
 98e67ed59e1d1-318c9250375mr2738869a91.23.1751017169338; Fri, 27 Jun 2025
 02:39:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626105243.160967269@linuxfoundation.org>
In-Reply-To: <20250626105243.160967269@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 27 Jun 2025 18:39:13 +0900
X-Gm-Features: Ac12FXzLbc93PcgOHbJI6EISu6a8l58rrpz2xfCSW65gNinqzCCU2fndTSOrQ-Q
Message-ID: <CAKL4bV5mKKAAE2AXWDVLRhzUNiG51Q7jsx0FhKx_GsDJMRGpjQ@mail.gmail.com>
Subject: Re: [PATCH 6.15 000/589] 6.15.4-rc3 review
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

On Thu, Jun 26, 2025 at 7:56=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.4 release.
> There are 589 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 28 Jun 2025 10:51:38 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.4-rc3.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.15.4-rc3 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.4-rc3rv-gd93bc5feded1
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #2 SMP PREEMPT_DYNAMIC Fri Jun 27 11:57:58 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
