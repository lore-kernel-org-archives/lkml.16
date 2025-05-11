Received: from e240-7.smtp-out.eu-north-1.amazonses.com (e240-7.smtp-out.eu-north-1.amazonses.com [23.251.240.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A5259C
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 12:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.251.240.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746965318; cv=none; b=UW1aWrAXMPOTEh0ZgTXuUG+2Tu8N0K1+01eo2Uz1pDErwsoYiDRtRPQrQauTrq2jk8u9Q7Rm3s6vG/6Mshw0uOXZRQTlrFD/BaipnOv6sYsOBL+wmLNynLcc5IeT9Y2dd4mFhhODnqyfcGQlEbEllJgM1q5G07KjSQEjf52Oksg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746965318; c=relaxed/simple;
	bh=7uZHawVTk3Vkp8kkmRK1DpbkFLob7DFpJ6g9Duki7S0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mG3K4AFlZOvr/LXBQtiGAn1swzsqCVG9dc0LV8rAnpg8WKIfFLkm11mQTntS18NoGHYKXgmk3XvUbuVrF1WLr9W7bXNRkmOpBzB4gTdu/LK3zqlSd9f2Pntq0BUkcuDMlyJHiE+mV2DobCFLX86GSi0nxUPHE4zKbBKBxcuGuEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com; dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b=c6vzZJ2P; dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b=qmMzaow2; arc=none smtp.client-ip=23.251.240.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=goosey.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=eu-north-1.amazonses.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=goosey.org header.i=@goosey.org header.b="c6vzZJ2P";
	dkim=pass (1024-bit key) header.d=amazonses.com header.i=@amazonses.com header.b="qmMzaow2"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=iuunfi4kzpbzwuqjzrd5q2mr652n55fx; d=goosey.org; t=1746965314;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7uZHawVTk3Vkp8kkmRK1DpbkFLob7DFpJ6g9Duki7S0=;
	b=c6vzZJ2Po45ficne1czCFNXgKLHzUZgtX49ypnmA2cmK/UTYWglpnl0tI+JQrHJl
	VVPIrV3MAmZTJmfLkrMf1Dhc84WEPHMl+VNzkcOloSg5Pb7dfM7xqEhswmfEAj6+Fpt
	aHa+q0ysLIN9EB07XO62Sv0i3Jno7l4pGb2E2zYZpWN6BNzo7CBiRPTEigsCIcPGoCp
	vcXSHOPksB7on8oU0+LRjLUrmzTe1XRdaRDOJuU/BbrYXXG8j6VZRZWjHaaosBCcRgb
	USV22V0UbWpUt/rsmhS8Vm4UBMcfvpRAfdEFRBViqola6TEyV64ZcWYGeT8P71oXQH0
	ZXnAc7DxIA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=bw45wyq3hkghdoq32obql4uyexcghmc7; d=amazonses.com; t=1746965314;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=7uZHawVTk3Vkp8kkmRK1DpbkFLob7DFpJ6g9Duki7S0=;
	b=qmMzaow2ocNEU/wVpZYgvvMR5xXCZj1keTlMv6xXSAnT7DH8cwsD4aohlm5i22Fu
	05keTSkXnz95LHlB8/aMD1eRBanpXMBnZF4ms0OrmQVNsbTvp1rhgZXu4o1QknjhbUZ
	oOvmPVHG80zMl0bdh/aRUBbuv/VPtWevHuPj4g+0=
X-Forwarded-Encrypted: i=1; AJvYcCW8fmZq3JNRxZBm0WtLCrBglxv5He6ASeGuuoXdKoc7+YPSlHK7AlUXzXI0vA3mOkoTN2CC5egCqUC6z98=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5nIboaeDIQSEEBCAFrGQ1FUzQEUETRdDf/jUtbdSYRTabx8y5
	xFnCQHX8a7W/2JLWRRfHqe/jGCGzrDTRxksgfbsoqHlzTkTFvBpOFXg2pIdLGnJEQzwFXLFwM1q
	sKyVyUtskI5iOc+faIk9bAEDcmaw=
X-Google-Smtp-Source: AGHT+IHjsfkw2aeBUVDVrVG/6UisZZxDo+qbMKKuG77YB+rauhS3AjHvX6nDl2CuRPLzzEmJnNU7Qjz+QJw8PszpMNw=
X-Received: by 2002:a17:903:1c7:b0:215:6c5f:d142 with SMTP id
 d9443c01a7336-22fc93dbc45mr134261975ad.20.1746965311606; Sun, 11 May 2025
 05:08:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJNGr6ve_6o6drwe_+bRW6UU4Ew9EjaZYaBgx0JAQjYb+A8VSA@mail.gmail.com>
In-Reply-To: <CAJNGr6ve_6o6drwe_+bRW6UU4Ew9EjaZYaBgx0JAQjYb+A8VSA@mail.gmail.com>
From: Ozgur Kara <ozgur@goosey.org>
Date: Sun, 11 May 2025 12:08:34 +0000
X-Gmail-Original-Message-ID: <CADvZ6EpJOjEEaqB2YBcrGLFz=c1z++SLZZrB-_0QWc+yV0EUpw@mail.gmail.com>
X-Gm-Features: AX0GCFurRk8VhBTGllT1fQtNh8FcPEIWgtp8UNTjbA0psT_bs29FpLvWURw0KsU
Message-ID: <01100196bf3f39f1-1e016101-be4b-4388-b7ee-b086346dec38-000000@eu-north-1.amazonses.com>
Subject: Re: Kernel panic - not syncing: System is deadlocked on memory
To: Yin Guoyu <y04609127@gmail.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Feedback-ID: ::1.eu-north-1.jZlAFvO9+f8tc21Z4t7ANdAU3Nw/ALd5VHiFFAqIVOg=:AmazonSES
X-SES-Outgoing: 2025.05.11-23.251.240.7

Yin Guoyu <y04609127@gmail.com>, 11 May 2025 Paz, 14:35 tarihinde =C5=9Funu=
 yazd=C4=B1:
>
> Hi,
> When I test the Linux kernel (commit
> 38fec10eb60d687e30c8c6b5420d86e8149f7557), I encountered a kernel
> panic issue related to memory allocation, specifically in the
> alloc_pages_mpol function. The panic message indicates "System is
> deadlocked on memory," and the call trace points to
> __alloc_frozen_pages_noprof failing to allocate pages, leading to an
> OOM condition.
> The error originates in alloc_pages_mpol, which calls policy_nodemask
> to determine the nodemask and nid for memory allocation. The
> subsequent call to __alloc_frozen_pages_noprof fails when the system
> runs out of memory, with no swap available and no killable processes.
> This crash can be triggered by executing the provided C reproducer
> multiple times. The reproducer performs a series of system calls
> (e.g., file creation, perf_event_open, io_submit, and filesystem
> mounts), which likely stress the memory management system and expose
> the bug.

Hello,

did you open a bug for this?

https://bugzilla.kernel.org

And i'm not sure if this is a bug i gues you are using qemu and you
experienced OOM (out of memory) because there is no swap and  physical
ram is completely full.
it gets killed while kernel is initializing.

[  133.880979] Free swap  =3D 0kB
[  133.889391] Out of memory and no killable processes...

This was an expected kernel behavior when there was no swap.

Regards,

Ozgur

> This can be reproduced on:
> HEAD commit:
> 38fec10eb60d687e30c8c6b5420d86e8149f7557
> console output : https://pastebin.com/raw/T4dfWHSf
> kernel config : https://pastebin.com/raw/u0Efyj5P
> C reproducer : https://pastebin.com/raw/3hPqjF6M
>
>
>
