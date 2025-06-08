Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 840B2382
	for <linux-kernel@vger.kernel.org>; Sun,  8 Jun 2025 05:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749359648; cv=none; b=rWaN9OVFLi66GNc4OrPK+j2V1Kxvlvf1TaNsI9QqqVC878aE91uE0oNaVUMs6usT1em3AV1tWarkYgNLQhx6NkxtrE23fK/xCpqZbQoiTd8fsOkW7Aah2hZpcFJoKn9KHaeRQEzTMzLbSKODPZbKm96f3vWN8jwWz/rBRjNUnBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749359648; c=relaxed/simple;
	bh=R7yFIfJJ72yu/12lLfw+YdCnKdRGHYhVeS9kfsURIWQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QZVLUxqyOsBBHC5CgtP+LfT4WGvVlKTVCT70esgkaHt5rHoR1lU53yvgTcsQ3Vf2GsCMRAT/IeJOcb0sFAH27TGPon063cq2KZ1llr1z5tdaeMiAj5KxeOvj5jgnihDG3uzxe3uYwyJaMPWtdIUieJZw5hcETJ8DlVIqnQAMh6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com; spf=pass smtp.mailfrom=futuring-girl.com; dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b=yMebrNsP; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=futuring-girl.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=futuring-girl.com header.i=@futuring-girl.com header.b="yMebrNsP"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-b2c4331c50eso2523191a12.3
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 22:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=futuring-girl.com; s=google; t=1749359646; x=1749964446; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq24FXrS96fZ/hOloFhOjn4H+O+16opz4TqnnVXi5gI=;
        b=yMebrNsP1oACfWNxO4xg1CXaswNMsX4L147PY7+uUlMY0Wxv16N2k2m9KIFboq3IZj
         BOYC4FCQWg1BKOCYw0Ix2p/NJ6GN7Jsm6jNcEx/po/S4HG/uuoibiwewWdCPx9eAUOZi
         3BJdagFSvrkFXByChe3G3jEVInXtwjEytiymg/TknhXP4shiv44BLLD+MLm1ygoeCBz4
         Amu5jK72aYc3HGbxWnpNmJs9foWiJB1Qcx/hRoXDg8pwLZd860jiT+F74ZinyjLz8LJm
         jhG6KwCA0cDD0MsNldLMLJJwEI5Gix5jgUTv+Wa1ipMebqA7h48/z8MeNntqJ8jIqSDU
         Aqbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749359646; x=1749964446;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bq24FXrS96fZ/hOloFhOjn4H+O+16opz4TqnnVXi5gI=;
        b=lC88ZyWPuilCi07Y00nkRsqg7xKiO/t1h3YDaWE9rCf/GVpRL3HKEz1UxdXfb4syv4
         Ur7FsrWu83Yba5kbBahE6nTvPZ9rkNkSFmLfEstuZ0eWKAjw+3OWdpbul1kGcCIRhwou
         6sSkQ2nygeZq0mrTuPT8KsDjtS1OOT0F6JK3qgqcu461wdI7SnrNPICTW5IixqsOK/a7
         b5wMDB1otyEfTdm67Fm9g33wjr861ICTG2SoW/I+U6Ly9W6gWfBG3tcV2XpqZtAiQEK1
         IE4Ao+8EWH3pgL8WVEy2ayWoonBEkX6S1D3Riqnj9aQ+v9wPkpZStUH+zhNf2G5aLkde
         KyDQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1cOKkATxNl3Yk4PapPWu75p5CjT94/ZP8vCs+KRMigNXNGwxSvPmbxSvJ6MK8UVsTGlkGD/FiMD1+IHA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0UHc/Gaeuq7nb7niDpL0aPwV4fWUO1sMvYbDWxg2r9IRehwAf
	OGf/Z/jDg0EPbQpVrNUwmZu2eVRM/jB+JBQsDXD1t+X5y3wXcnpxAWlQIycX2VMhNHFy/nFVW/x
	k+LG6t6CTtxhqry5/kF6wuzRy52tJmYM0YGg0IhPkGg==
X-Gm-Gg: ASbGncuiMMa6svtaybfjUUwFY8YN/G3ZUhUlMKtw9bkoGqygajMQJXIuocNzoqQ7K4T
	D40Mi4nBnbBi4i5Dj33lv0Y6AvfGzdNcu9mcAdS2VgAFZB2amXj5n/w0vfCsUTt9dF36EZbW2mE
	XyL8TxDskGC6rUOGbw2nhvyiSDd0v/P3kJm6m07P7LBV4=
X-Google-Smtp-Source: AGHT+IENDAqgfEmWtDHYiRyVTLe/VG6n9eA8bBw+SHHFtxygDA218GlKFLInc20fHWa12oeOBRLbkK6qXbDoHPE0cPk=
X-Received: by 2002:a17:90b:1847:b0:311:eb85:96df with SMTP id
 98e67ed59e1d1-31346b56aedmr16157454a91.17.1749359645765; Sat, 07 Jun 2025
 22:14:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250607100719.711372213@linuxfoundation.org>
In-Reply-To: <20250607100719.711372213@linuxfoundation.org>
From: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
Date: Sun, 8 Jun 2025 14:13:49 +0900
X-Gm-Features: AX0GCFtkSD6iMqXwA4mvNAHmJR_H_fErF2XtQqI6x3N-rGaSjH3mHz7rlegcE3Q
Message-ID: <CAKL4bV5xfxq+Hvnd3C6DdjTT-WO2dcjgK_yLGHSPu-vuq2iW4A@mail.gmail.com>
Subject: Re: [PATCH 6.15 00/34] 6.15.2-rc1 review
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

On Sat, Jun 7, 2025 at 7:11=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> This is the start of the stable review cycle for the 6.15.2 release.
> There are 34 patches in this series, all will be posted as a response
> to this one.  If anyone has any issues with these being applied, please
> let me know.
>
> Responses should be made by Mon, 09 Jun 2025 10:07:05 +0000.
> Anything received after that time might be too late.
>
> The whole patch series can be found in one patch at:
>         https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-=
6.15.2-rc1.gz
> or in the git tree and branch at:
>         git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-6.15.y
> and the diffstat can be found below.
>
> thanks,
>
> greg k-h

6.15.2-rc1 tested.

Build successfully completed.
Boot successfully completed.
No dmesg regressions.
Video output normal.
Sound output normal.

Lenovo ThinkPad X1 Carbon Gen10(Intel i7-1260P(x86_64) arch linux)

[    0.000000] Linux version 6.15.2-rc1rv-g04e133874a24
(takeshi@ThinkPadX1Gen10J0764) (gcc (GCC) 15.1.1 20250425, GNU ld (GNU
Binutils) 2.44.0) #1 SMP PREEMPT_DYNAMIC Sun Jun  8 13:31:39 JST 2025

Thanks

Tested-by: Takeshi Ogasawara <takeshi.ogasawara@futuring-girl.com>
