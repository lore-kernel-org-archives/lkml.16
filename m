Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42724284680
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749551146; cv=none; b=FKUFpAKmHdi0jv5M50WMBAzW7LwdPTWo5AOSRlEBPSnYrNjukcIrXD0vn6TJ1XmU1iy/jFKIu2o+c8PY2IMXjZqY9ePuVMYndWO8iavoZnNcQjFlw/X3v6FZEEDepp9OaCw3Xcu5KTdB9lnduUntxiB0O/kZ8Ck85Fy+m9d/Odo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749551146; c=relaxed/simple;
	bh=oHV889pk9/dbexLINzXMTXrUu3qmaDgybAAQrKHQt4s=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=jU9x+sL4FJdCI933CvZ8uzVbVRxPGyVkcG3O4cD3bVVluCh0vstgjeGQ7DJKj3UsFKD6Z+3Gz8Rwo3THHrpvhZqv8EXBUzCrPBFVwS74PgtLXewa2wf6jWCJD8KLfcB1ErhMy/+jYi0SXlLcTh1L17Xeo1ezmwbHYCjK72Eh22c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WunM42N8; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WunM42N8"
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-5290be1aedcso4166376e0c.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 03:25:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749551143; x=1750155943; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=;
        b=WunM42N8gXN9vkYLoIyr4uvnA98ADTDFYeHeCX4aJZb6T3lh53yTLD71IV9JrJFwAB
         ZzZkmeRub+nDt+swTpSd2eddIK/aXhmyVMC21SO+oIkQ4CvOtqDZubMnMQg/NPYv0SC2
         Yi7Fq5JyjVzxDyWDzd1ROiZJTQ8J3HgsoWJIBSv5NWpEDvT3y6Gc1a0FrzWav/slV9PE
         xDsCV727VuVPtCmMccUTNW+q7W4o5QW4AI6J1m0WCPRfJaqb64wtvC0aWLldiyS+jt0e
         A6kAjYkPlRlA9sjlmlbnsoHJuy8eZ1G8pZT6JTdzjkc/vnwhy72Yi2LNqceLydsRJQpV
         vZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749551143; x=1750155943;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/KbPqIjq6A0gP5OwcTzAJtKToDqxED7lTQn+3ShWhu4=;
        b=QKrO/xBLK/7NYO/7S97a9VEaj89iToTC5hBuTyQEKl25PP/17K13j2tixZUNKHHLlt
         U9EMtCqW5ymrLLWGVgTVQ/MKdrDeZk2cidfzrzNKnCTq3atypPmJPn81bzREgE1TzUwX
         A9Bc8AqFgn5GsFeToeq2D+f40OBS+FTXzBcEiygByfQIyL4+oQYbpsCrIsjMYitrBGyr
         L476EYoavrmbk9vn0SwgHgtFpbDPefaXibGuQynLySTbvz7GtvvD8B4U2NSIavQf9uTW
         FFDMPjqIWzhXijC0v+BeBAudLnXuSobsc24fndDL5AGCAchFpR13+WaL/gYmXhSKMAtt
         iQ0Q==
X-Gm-Message-State: AOJu0YwfbOEu4kLV2xgzpEIVs1Q+57PpO0j84J5QvoFWi4rhdXhs1hh8
	D+lPNkjSZS5tgjPmTG8088ZKGItjFrvY4lAR0jKYmSDFXfAKDwYnufu5IrsjBpoKxmGnxLuLZs7
	cn2Ddk+LaQA4X0mTqizB2TN/HyTFptBQEIPW9EhW0jeD7AzEhPQCZ1C1pdQ==
X-Gm-Gg: ASbGncsoY+LxlWASv049P21zQCgGhIrAe5I5FJxuuJgmrfD/pkeAcnthBre1e07JKoi
	h9njfXW6ag2qbWq+BsNkxNHRuOr0JwccIiHYM/TgzKbkQT0ASaxvMeOrPnZVwk7OA9GiXa7SEeW
	rOZs6/l52U2+ey56pBNES28AY2EU+aesqIBmO4Hk4GjtjFcmPlXMUAHgUrhSHUhvwG3X6Bl/5Tr
	kT3ISvlI2Y/UYI=
X-Google-Smtp-Source: AGHT+IHshLTe8OuH7+ip/8ueWp0i74zRNPn5hHiiSdvdI8UuOJ6eD1FAplWjvLZQZJWIGjYXeSMeV/zYAYuInU3pbBs=
X-Received: by 2002:a05:6122:640c:10b0:530:2c65:5bb8 with SMTP id
 71dfb90a1353d-531131187b5mr1514506e0c.1.1749551142776; Tue, 10 Jun 2025
 03:25:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 10 Jun 2025 15:55:31 +0530
X-Gm-Features: AX0GCFuPO70Fr5H2aOlLeOzXniiVZlpD36FORRmiAmu3qpXvFghQfZN4JyKcc9A
Message-ID: <CA+G9fYuppX5LeRjOAZWsYRCs76PVbnv-TN_RrszhDsk=KregyA@mail.gmail.com>
Subject: next-20250610: arm64 No rule to make target rockchip rk3399-rockpro64-screen.dtso
To: open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Cc: Heiko Stuebner <heiko@sntech.de>, Peter Robinson <pbrobinson@gmail.com>, krzk+dt@kernel.org, 
	Dan Carpenter <dan.carpenter@linaro.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Arnd Bergmann <arnd@arndb.de>, Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regression while building arm64 with the Linux next-20250610
the following dtb build errors noticed.

Regressions found on arm64 builds
- dtb build error

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

First seen on the next-20250610
Good: next-20250606
Bad:  next-20250610

Anders bisected this to,
# first bad commit:
  [49760b9f60528393cca3ea35c4d0719f84215a48]
  arm64: dts: rockchip: add overlay for RockPro64 screen

Build regression: arm64 No rule to make target rockchip
rk3399-rockpro64-screen.dtso

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error
*** No rule to make target
'arch/arm64/boot/dts/rockchip/rk3399-rockpro64-screen.dtso', needed by
'__dtbs_install'.

## Source
* Kernel version: 6.16.0-rc1
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha:  b27cc623e01be9de1580eaa913508b237a7a9673
* git describe: next-20250610
* Toolchains: gcc-8, gcc-13, clang-20
* Config: defconfig
* Architecture: arm64

## Build details
* Build warning:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/build.log
* Build link:  https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2yJ4IOQa1XxMqDgmzjEl7VszYE9/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig defconfig

--
Linaro LKFT
https://lkft.linaro.org
