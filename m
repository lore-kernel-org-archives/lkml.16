Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0CC7192B85
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738229495; cv=none; b=pbxy2iy8o8ZCrAEYwZAaaNWtqq17V2+Fq4nzGA287fbVY+nVgpQ5BGF/gKXV2OXhUU6xnSU/Z2aaeOHaIJyIxaQUdw9Bwb37gFWsEINnAfPpLyobTEB7zu4ZCq033sDfhIaRl+VegXi/2XY6C/sDTwUNS5v9cY8gQsNpx+PnPEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738229495; c=relaxed/simple;
	bh=FABrqX+Hjw484256YaPHen56rdftKHMIcVK00b4E1jA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GjW/Wn5Etw8isfyQieRkB3AXsTHL2Hp+dJ0dXaUxrotHnwtW6ZO/OXbr89o6tKxmQzns7N4D7LtuzGXcHRuytqAy/sYT0U24tx2Ygv2J8KGdYRulZa1LOT69A1IzXw2VyiiCh+TE4RXY2mzCflgSxDslMKzEY6Y8TTwjtjEleKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F80jOlUk; arc=none smtp.client-ip=209.85.222.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F80jOlUk"
Received: by mail-ua1-f51.google.com with SMTP id a1e0cc1a2514c-85c5adbca8eso165481241.0
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738229492; x=1738834292; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=;
        b=F80jOlUkdY7BAeP1WiOo9GYvKT/IyTiR0z/kPdq09j/2dWK5IF+4ewxBhen0R51DPq
         bVsXbA2bAGA0oWil7tSCh2Ufl68DCBKTOH/aKDTk+5NYKnbXtw2N3mACeFo/SNvbS35Y
         aYP5u+Vm1tmO0fA4CWhyFttEY9GddMnYVOqQ8aCQy2dwr2iNlw4ltMGlGRCluzfeTSBC
         E0RM3MEQvsXo8QRk58P77MMvPlRalLwmxlcQIi9Y3NCl4pMjHe37C2p5jX3ADZ4HepPQ
         zgCmVFJY56RUeoY9tHJO//SxjysLbE6Tk2Fxgm6ToZgOpYvukUlXPnSM6FUuYpsQYikC
         YRBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738229492; x=1738834292;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dmWcBJcs6Wk755m4D9DSq+3kzSFiV3zXYSE9SNe/ZDI=;
        b=hV4Nc/YAuQX51LNey6tOfUjZgu6JqS6eCA1OMmqXTQxNIyTTjrWL+t3NmuxRRoMVZ9
         osTMlUvTA6C/4lCxyvuI06VP++3S5sotU6Tj4UiaEIE6dM75wurRLLe2xZTVTfBbL4qK
         jgag3zRYANGLsFfZekajznKrLkk5nuOlbubWt+aF1j+LJmI5pDZ3lXwjRmI9NQVQTAKU
         6cIkP+ir69lxrHtPjd7mSRc7LVidrFJykOLJcisZUsxDCl72T8LU354lrRh2U9zmlaTX
         t7+GYxqYJTuqrBM2Q2lvSI6Z/n5AE4o6BubpsmKBmvbVMu+U099h3tM38ijRR/ITfHuE
         +gIA==
X-Forwarded-Encrypted: i=1; AJvYcCWkpNeU7VAeUFsNywoRr5FmcB5dboRziyjxhYwTX+uUtAyWE1BxJSWMtG5H05eXJ6hPwHWCu+y1IodIiRQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YywkOfrN1EzE7TlAp95zYXS/MiC0ATFY/FHmEc7yrvxG5TuRBlB
	QFQGONQtJH4v5u1/15BoJIgb3TaM5oChnE/S9fVmanc/tLL3M+2rnlndL2Fu0+2ik5V/Ig/UO+7
	P5iVZl/ApfTTaAv6mgGhnBkuEGGTupur2PIx1wQ==
X-Gm-Gg: ASbGncs+o6HIN6o9CYoAE/CZN4rJSINbRZvTbcBoNUubWY35IzlNPiTQzzZrFc96GWv
	hfLoe1O71DGVcjl10dW7VoFo01DfLrn4TZfZS+E3Ge/c/kK9fetr418DdVMQNlkTwhfAxfxHpvM
	ngSCSFZMAw7NJe43HMd/pVmPkFznne1w==
X-Google-Smtp-Source: AGHT+IHHO4p75yBvoZrH4CWt7Sm3+WjJipBubc0F5yEZyIihuApBbf7n+j83VZzoGbXPEsG7JEuXYNAUETI3Fr3UyNs=
X-Received: by 2002:a05:6102:161e:b0:4b2:5d16:f75 with SMTP id
 ada2fe7eead31-4b9a4ec7f86mr5303490137.4.1738229492696; Thu, 30 Jan 2025
 01:31:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 Jan 2025 15:01:21 +0530
X-Gm-Features: AWEUYZmjjTJhG4gbVvsZPMKcHyLA3_iG79mE5k3okwZmPnMLWYy8tDLAX5wqlig
Message-ID: <CA+G9fYtNfM399_=_ff81zeRJv=0+z7oFJfPGmJgTp6yrJmU+1w@mail.gmail.com>
Subject: linux: master: x86_64: gcc-8: error: call to '__compiletime_assert_909'
 declared with attribute error: clamp() low limit dsc_min_bpc * 3 greater than
 high limit dsc_max_bpc * 3
To: lkft-triage@lists.linaro.org, open list <linux-kernel@vger.kernel.org>, 
	Linux Regressions <regressions@lists.linux.dev>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>
Cc: David Laight <david.laight@aculab.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The x86_64 and i386 build failed with defconfig with gcc-8 toolchain due to
following build warnings / errors on the Torvalds Linux master branch.
But gcc-13 builds pass.

First seen on v6.13-9485-g72deda0abee6 on Jan. 27, 2025
Good:  v6.13-7644-gc2da8b3f914f on Jan. 27, 2025
Bad:  v6.13-8265-g9c5968db9e62 on Jan. 27, 2025

i386:
  build:
    * gcc-8-i386_defconfig

x86_64:
  build:
    * gcc-8-x86_64_defconfig

Reported-by: Linux Kernel Functional Testing

Build log:
---
make --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=x86_64 SRCARCH=x86
CROSS_COMPILE=x86_64-linux-gnu- 'CC=sccache x86_64-linux-gnu-gcc'
'HOSTCC=sccache gcc'
In file included from <command-line>:
In function 'intel_dp_dsc_compute_pipe_bpp_limits.isra.80',
    inlined from 'intel_dp_compute_config_limits' at
drivers/gpu/drm/i915/display/intel_dp.c:2547:3:
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_909' declared with attribute error: clamp() low
limit dsc_min_bpc * 3 greater than high limit dsc_max_bpc * 3
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                      ^
include/linux/compiler_types.h:523:4: note: in definition of macro
'__compiletime_assert'
    prefix ## suffix();    \
    ^~~~~~
include/linux/compiler_types.h:542:2: note: in expansion of macro
'_compiletime_assert'
  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
  ^~~~~~~~~~~~~~~~~~~
include/linux/build_bug.h:39:37: note: in expansion of macro
'compiletime_assert'
 #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                     ^~~~~~~~~~~~~~~~~~
include/linux/minmax.h:188:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
  BUILD_BUG_ON_MSG(statically_true(ulo > uhi),    \
  ^~~~~~~~~~~~~~~~
include/linux/minmax.h:195:2: note: in expansion of macro '__clamp_once'
  __clamp_once(type, val, lo, hi, __UNIQUE_ID(v_), __UNIQUE_ID(l_),
__UNIQUE_ID(h_))
  ^~~~~~~~~~~~
include/linux/minmax.h:206:28: note: in expansion of macro '__careful_clamp'
 #define clamp(val, lo, hi) __careful_clamp(__auto_type, val, lo, hi)
                            ^~~~~~~~~~~~~~~
drivers/gpu/drm/i915/display/intel_dp.c:2506:25: note: in expansion of
macro 'clamp'
  limits->pipe.max_bpp = clamp(limits->pipe.max_bpp, dsc_min_bpc * 3,
dsc_max_bpc * 3);
                         ^~~~~
make[7]: *** [scripts/Makefile.build:194:
drivers/gpu/drm/i915/display/intel_dp.o] Error 1


Links:
---
 build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/log
 details: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/details/
 history: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27066663/suite/build/test/gcc-8-x86_64_defconfig/history/

Steps to reproduce:
------------
$ tuxmake --runtime podman --target-arch x86_64 --toolchain gcc-8
--kconfig x86_64_defconfig

metadata:
---
  git describe: v6.13-9485-g72deda0abee6
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git sha: 72deda0abee6e705ae71a93f69f55e33be5bca5c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEcVft7ytiSSvOSnAuAxlCgRH/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEcVft7ytiSSvOSnAuAxlCgRH/
  toolchain: gcc8
  config: gcc-8-defconfig
  arch: i386 and x86_64

--
Linaro LKFT
https://lkft.linaro.org
