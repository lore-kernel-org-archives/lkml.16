Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFC71CA81
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 10:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738320557; cv=none; b=QVDw+VVsmfw1cJz8uF9TJqCF1wrAOn2/ObiC2EW6vbaOZgPY6StCKl6C5IDX/PHKFfDMBHI/8wXwUKIgAiaj0oVuYZ4JequyglfOJilCBt157U7oIyiViROX2uz1H4aMv96haFX6dKAyDQjIX2B3hFjgGDvDMSQmi0a99oGQigU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738320557; c=relaxed/simple;
	bh=IIYKwK6gZm3RIvkU5BV1j672fhQTKpiM8TLnp77ECi0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuhzwSBfl0d6rIJEmjfDq/owoM7OOf37syb75IXIIOxY3Gd0RnwQdk4wz9rBdKDKNIi70a7Xncadv0AGVGy2q2G+P5RSxW20Y2rGR8nK2DXkJADEcPxW7UsntUqz3rTL8UeWnpZcnmVZNVFXXCi7utw2kcEe5V1dltvvoGsK0mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=TNNHzvuj; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="TNNHzvuj"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-2ee76befe58so3186406a91.2
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 02:49:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1738320554; x=1738925354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NBZYZHrEvu4xGP6oPB0bXa2YOEKtC4uPTQviRrKj7b8=;
        b=TNNHzvujLitZaC0N3syaPn552nxs0PmFz9PrxtWPDxcZlSGqCv2QHKR5sYrk77bsU7
         7dpr2LJ4qmkPGpLiPCITOa264kdzsk+I2QYYxsGJ3hKo6dNqtyemeLSS5DhL6c5/IZv6
         7W6EZjhNQZ9mRhhYSCHQHrt7u+LpZy0C03j/FPNmbY9csSNZ9OKkZkQSRr0jIPQ8IGHv
         ND/W0zg0bIOk6cxtSneGLWGg1om3R/fy6MukY6gYQWT/4EyE8Gdpk+cH98lHhzuXl5It
         4qFWlFgf4LtGs8/32az2qcM0/qxtjWtG7dw342Y/bdrCRGrU4BYPGAo+9kieXYqo5fQT
         u7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738320554; x=1738925354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NBZYZHrEvu4xGP6oPB0bXa2YOEKtC4uPTQviRrKj7b8=;
        b=DHx2McJ2fk1sjbnJm8tgp+iy6fZzleGLlIvsbPJBBmftAndxQET4x8yCyh8aDLIxuw
         cyoFLM5WAhzxQ6P+DPz4pH5Ky2MqckAQgr7EU09tCy0qjbYA5ZZU3NCTL/liC6DWYb1q
         KSYG5TfIVvt0Rt3fcyJ5OjPSZlUFjZYc0MUXAA+rH3AqCg/54D0NswVT32DvT/cClRKl
         Mx2TaBLfcmWZ+/l/ywkGQeiZY70s9InApLbT8yDUDKJGx1b9pcKqhl5GOz/J9saCv3T+
         tiyehFKTSU+vr4xbAdo3BIuvny8puRcNPW916qfqZNvUrADqy9/T/zRDB0nYvqeYsqa8
         V3GA==
X-Forwarded-Encrypted: i=1; AJvYcCUZzFQnm/ER0dcAh2x/VvEK/cCaraOLE6xXXh9wdJT6z4zmLkebfjoHo0JU5aQGKoSbu4aBjz56FSS83HU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrcfBTqGw12jKmbnUteOsDbNM/49xh469jXLkpIL+rAtoLjdQ3
	kyvSrYGvQKTombFC1PNwYXM0sW+HpfCEi1NGHktSNf1rNi1Fxqk0NXFqLjBvKT2k2quNwDbvCOS
	TefTEdqUo8NvtOKW3QwlblKKeVHDiaq3qXtTx8A==
X-Gm-Gg: ASbGncvvBSExaw/wCqTLNNRXpljXbAPDjqaBlzPoX76IdSKq6f6TtjiCMfNTulPzlXr
	BVsVh9S0CcyTUOB1CCa3+Amdtf4u/WdURbdUjuZ7aOxTG077F2weY5VYbug4iuPdUGMFnk/3u
X-Google-Smtp-Source: AGHT+IFKMXzXc4z9qRfH0nkfTgT5sHmXwdaig0w8m4WIvvOQeXzdGBoKKtImAcaIob7KYzCEPrYtBvH67mycnh7TPDw=
X-Received: by 2002:a17:90b:2743:b0:2ee:48bf:7dc9 with SMTP id
 98e67ed59e1d1-2f83ac0068cmr16801592a91.15.1738320554447; Fri, 31 Jan 2025
 02:49:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130144136.126780286@linuxfoundation.org>
In-Reply-To: <20250130144136.126780286@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Fri, 31 Jan 2025 19:49:03 +0900
X-Gm-Features: AWEUYZmlkcZeCyYCkqXYCWF1l8nqyTSyhAYJRU0GENQ8PIYwKOuQ7t-L7mtJL6E
Message-ID: <CAKL4bV6=tBX95okqxpYJy8WqdWEsteb3+uK65Zf1xV+K8y-Gwg@mail.gmail.com>
Subject: Re: [PATCH 6.12 00/41] 6.12.12-rc2 review
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

On Thu, Jan 30, 2025 at 11:42=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.12.12 release.
> There are 41 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Sat, 01 Feb 2025 14:41:19 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.12.12-rc2.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.12.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h
>

6.12.12-rc2 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.12.12-rc2rv
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 14.2.1 20240910, GNU ld (GNU
Binutils) 2.43.1) #1 SMP PREEMPT_DYNAMIC Fri Jan 31 19:24:31 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
