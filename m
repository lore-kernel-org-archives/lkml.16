Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5234F18024;
	Tue, 10 Jun 2025 11:22:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749554525; cv=none; b=g+T13fvzjMlmprU1pVfyLkIHII/gHhlME6AgP3sSzaukgkzXDfrQMduBeAS3hA98iIomm+EMgFuMck1eEj5EFcN/hltYdo0/6i/czsUcNsCJnHq8ZGjyeuhXDqCUqN0UNDP/nPC4GJN5GnNfZlTgrwMKDi+/RXw2cWXEYVWs+Jg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749554525; c=relaxed/simple;
	bh=9byxGKEEMaXHQ1QNqCiqviKPJ5SkmeEQ5Xvt7vT34to=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=miQzDuAqiDnEhu1Gi4mATvyt9ZfSLaraGa/czUUABdzNdiZzK0VxdsdILInayyuyxNaczPTFE3hGRZOtI7Ks2HLRLjHlXpTlCLjJptvtdYLIm4jGTvx0+D/oDhA/Echpu/aOQBXLnCnR8Mr1NYT179cJz3q5cNoxc5i8CN8HYLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=CvnoKiZ3; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="CvnoKiZ3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=bj/8ZlhYi+PUXtlyuznaF1lt7ECGXw2FzjbqurTjZWA=; b=CvnoKiZ3nraCZlyqWpMIcSDXGd
	zDzkj6GV/yiCfjfwIwbYdSsjp/+ha7T6H28erflnAiTV5R9MO0/hVaUyW5x8JpEOJ8M+DkIa/fRIO
	uumexB2u0CCrv9Udo48bza3OuDrT5HU6WoxJrnwJALtqD+i75uXoyxxNVZSgpkdf19p2IaZF1RkKP
	OSUh7Lj6DJ/xLdPYeH3grvrF6QXtpdMwDaCC1CjGGlmAvhk/W/aS5+Lwg2Zc+6wTwXmub+s5NpwFm
	POlb06b3zFZ2iAyXG8JkiW7t/eHWiVZKVBsQsFpK98ixIZ8DvOwyvl5/NRcvT9aTbvw23UBbhpHLJ
	erTJoyIw==;
Received: from i53875b1c.versanet.de ([83.135.91.28] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uOx3F-0000kG-UP; Tue, 10 Jun 2025 13:21:57 +0200
From: Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 Linux Regressions <regressions@lists.linux.dev>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Andrew Morton <akpm@linux-foundation.org>, Arnd Bergmann <arnd@arndb.de>,
 Rob Herring <robh@kernel.org>
Subject:
 Re: next-20250610: arm64 No rule to make target rockchip
 rk3399-rockpro64-screen.dtso
Date: Tue, 10 Jun 2025 13:21:57 +0200
Message-ID: <15979303.uLZWGnKmhe@diego>
In-Reply-To:
 <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
References:
 <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Hi Naresh,

Am Dienstag, 10. Juni 2025, 12:25:31 Mitteleurop=C3=A4ische Sommerzeit schr=
ieb Naresh Kamboju:
> Regression while building arm64 with the Linux next-20250610
> the following dtb build errors noticed.
>=20
> Regressions found on arm64 builds
> - dtb build error
>=20
> Regression Analysis:
> - New regression? Yes
> - Reproducibility? Yes
>=20
> First seen on the next-20250610
> Good: next-20250606
> Bad:  next-20250610
>=20
> Anders bisected this to,
> # first bad commit:
>   [49760b9f60528393cca3ea35c4d0719f84215a48]
>   arm64: dts: rockchip: add overlay for RockPro64 screen
>=20
> Build regression: arm64 No rule to make target rockchip
> rk3399-rockpro64-screen.dtso
>=20
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
>=20
> ## Build error
> *** No rule to make target
> 'arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso', needed by
> '__dtbs_install'.
>=20
> ## Source
> * Kernel version: 6.16.0-rc1
> * Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next=
/linux-next.git
> * Git sha:  b27cc623e01be9de1580eaa913508b237a7a9673
> * git describe: next-20250610
> * Toolchains: gcc-8, gcc-13, clang-20
> * Config: defconfig
> * Architecture: arm64
>=20
> ## Build details
> * Build warning:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzj=
El7VszYE9/build.log
> * Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ=
4IOQa1XxMqDgmzjEl7VszYE9/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzj=
El7VszYE9/config

thanks a lot for this notification.

I'm surprised that overlay build at all when I built it yesterday.
But yeah, the dtbs_install target really broke with that change.

I've amended the commit now [0], to change dtso to dtbo and ran the
dtbs_install target sucessfully with that change.

So on the next linux-next creation, this should hopefully be gone.


Heiko

[0] https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.gi=
t/commit/?h=3Dv6.17-armsoc/dts64&id=3De14491aaa6ff598bbe9d462e44c01ac65754f=
445



>=20
> ## Steps to reproduce
>  - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
> --kconfig defconfig
>=20
> --
> Linaro LKFT
> https://lkft.linaro.org
>=20




