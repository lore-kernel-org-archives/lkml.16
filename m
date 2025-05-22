Received: from e240-9.smtp-out.eu-north-1.amazonses.com (e240-9.smtp-out.eu-north-1.amazonses.com [23.251.240.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67AD7230BC2
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747914739; cv=none; b=AL4zrSP+ZZXyIcSh2U+KjTiSmpj/KweooHb9hRskLAkkOSZ6x3vdAZZl26y/+U3XY/DigQ/XO+FbJIWau5G2XMFY5ddlQI6KB+YZkR90LeuEOSj1ApWDmGOK4qbZY7QvuoxJZmw1YdBheJmpZ0vNnZrZDYU0Ta9+bOlT/9as41w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747914739; c=relaxed/simple;
	bh=a94gsEAsCnfPohT3Dirpbg/CsPKjVyzG+N92zufE/98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XspruY+wh6ctV5a0zqhjzHJXCjKZlvVh3M0qQlfueCLsZtcDxBDowX03Cc2+CLQIEOESpBln0EnszftQcZ82zfxuPVm/a6ys+2QEzjhj46TfxwObjmCdMihsugurMHtjIFuRqEVYeshyE1YpZHzvQYBH2o/Bt3me+8GKsS4ukP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=UvqVRNIQ; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=B9FOZBZG; arc=none smtp.client-ip=23.251.240.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="UvqVRNIQ";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="B9FOZBZG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1747914735;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=a94gsEAsCnfPohT3Dirpbg/CsPKjVyzG+N92zufE/98=;
	b=UvqVRNIQ2a4vkduZYRep3YahLvjNJwK2JqqY7IhjrisqIzU6BOnE6aQQICf5oDPx
	7tsRao2woJyZImqYAaWsNXcfYvmUl1eIWFncOXixfPg/VcoBOlPLx3Y2lugAYIiAFzU
	m3iEMAKAD+7OqkTFmGNQp7c0qAmkWdYOrxyG/ISUMIAokPPDPH9lsTT3LcRlvF7XRwu
	U2f3/f7lnvI7cO90DJ3CSDfmL031nQeWYutjaZrBW8K0oYe+8ST0wGYlD3Zu/y/bzCX
	cor9NDGqW3csOLmXyqX3hkWUMd12+dcmSl+hWvNZZlK+cYxSa2zYPibtYlmwAe1SbGE
	tNPLupqNCA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1747914735;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=a94gsEAsCnfPohT3Dirpbg/CsPKjVyzG+N92zufE/98=;
	b=B9FOZBZGaCGICMYitjYKmwEEX3U8lc+5Cvvs5fqZdSF1wru9U/Lo9Ml9+Hh7wRkh
	m10c4aHsBHeWZXfm2NolVpNxK2SRaCjNUCx+07hEyL0Hy3KiojN7BLDvoPEfF2NIaIF
	VEfQYpQlWcP1kfPOQwmQSBsGTj9yIuVT0EZ6svzY=
X-Gm-Message-State: AOJu0YyU4TNl+TAszDozLW7p1dwsmUNQHG07yV+T+3ua1oiqFGX3VNHV
	A/KkQWyppS2wLDnwWnyPrSMdWYJ1NOyKfxtqOW7UVTE9cgIFUvuTAIsNQbvkkRcvtTqUWTfO4Bb
	NuS8/Ubh1F9Wq7UVpHzf5HxImyCfKzNs=
X-Google-Smtp-Source: AGHT+IE4COxC5PiGZ2qupl6t28kzAg6H9+4RqMEF9FyHEZhG03MW70ocaglKsaoebWcoU0xj/ubFS6KsKuyvo1EJFeg=
X-Received: by 2002:a17:903:1988:b0:21b:d2b6:ca7f with SMTP id
 d9443c01a7336-231de3ada46mr321310655ad.32.1747914732961; Thu, 22 May 2025
 04:52:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
In-Reply-To: <CABH-8xdaDFjWyQ40Nyo59Gm5kD3Qi5hh76o-uam1yC3wNtJNqQ@mail.gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Thu, 22 May 2025 11:52:15 +0000
X-Gmail-Original-Message-ID: <CADvZ6ErsEk5qBh1dB1gtcmrj07pfzcULufq6gbW8G-Umh+Q1WQ@mail.gmail.com>
X-Gm-Features: AX0GCFvMKTmNoWdUbzrWG929aFreiTOUr6QiJdt7bMGQah8DUGyB8un3XET6rjU
Message-ID: <01100196f7d63ec3-68eb236a-e17d-4da0-bddc-5b169db28d7a-000000@eu-north-1.amazonses.com>
Subject: Re: Regression: RX 470 fails to boot with amdgpu.dpm=1 on kernel 6.7+
To: =?UTF-8?Q?Durmu=C5=9F?= <dozaltay@gmail.com>
Cc: linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	David Airlie <airlied@gmail.com>, Tao Zhou <tao.zhou1@amd.com>, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	Yan Zhen <yanzhen@vivo.com>, Greg KH <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.22-23.251.240.9

Durmu=C5=9F <dozaltay@gmail.com>, 22 May 2025 Per, 14:27 tarihinde =C5=9Fun=
u yazd=C4=B1:
>
> Hello,
>

Hello,

did you get a message in dmesg from kernel, for example an error like this?

https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D1106268

The dmesg command will give you an output maybe journalctl output or
mesa (glxinfo) output would also be sufficient because we need to know
which upstream it is affected by.
and thanks for report.

Note: because there are two similar errors i added the necessary
maintainers for upstream.

Regards

Ozgur

> I'm experiencing a critical issue on my system with an AMD RX 470 GPU.
> When booting with recent kernel versions (6.7.x or newer), the system
> fails to boot properly unless I explicitly disable Dynamic Power
> Management (DPM) via the `amdgpu.dpm=3D0` kernel parameter.
>
> When DPM is enabled (`amdgpu.dpm=3D1` or omitted, since it's the
> default), the system either freezes during early boot or fails to
> initialize the display. However, using the LTS kernel (6.6.x),
> everything works as expected with DPM enabled.
>
> This seems to be a regression introduced in kernel 6.7 or later, and
> it specifically affects older GCN4 (Polaris) GPUs like the RX 470.
> Disabling DPM allows the system to boot, but significantly reduces GPU
> performance.
>
> Things I=E2=80=99ve tried:
> - Confirmed that the latest `linux-firmware` is installed.
> - Verified correct firmware files exist under `/lib/firmware/amdgpu/`.
> - Tested multiple kernels (mainline and LTS).
> - Using Mesa with ACO (Radeon open driver stack).
> - System boots fine with LTS kernel (6.6.x) + DPM enabled.
>
> System info:
> - GPU: AMD RX 470 (GCN 4 / Polaris)
> - Distro: Arch Linux
> - Kernel (working): linux-lts 6.6.x
> - Kernel (broken): 6.7.x and newer (currently tested on 6.14.6)
>
> Thanks in advance,
> Durmus Ozaltay
>
>
>
