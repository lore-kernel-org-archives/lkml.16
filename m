Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE2E7238D3B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598175; cv=none; b=N6N8sSc0w1Cvr9iL4qt8cfxUnrQyHlVx2aWn5b5I5gHUh81Vq5D8FDCREHwFHtUGipHVN/EhK/Y+LZ8k/Nwuwb7PDbn+nMbiSsjM7hWXxcUFlv+3PEtkbBtSsu6HSSrNo86GD3qSA4s97jZcLn3ur4D4zPGwP7JdXU5yn4php+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598175; c=relaxed/simple;
	bh=iy8gPSknBpYANxR3oDbou+tV9uyY16PAcTCT3p0TVTQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=SVk+zediXD1eByOAxUAqhc+ak9E6kKuy5QG2fTonJ3e0znSL6Q8H3jfumMRuIgFfHH3cE6EuC1wjsxGuilr7CTRrgDLH3cVqbWRZWLPddMPygoX0QyuFx2goJtTmGjiEi8oygL5mH0L8UfMAgm+dmb6Q5AkqjIfcxWMrjJnjHLc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=p2revYZX; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="p2revYZX"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86fea8329cdso5533452241.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:49:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598172; x=1744202972; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=p2revYZX57bC3SE0rF3qEGnzfbBliYjtZVJ05uoY0cI/8uMHAJLoXqNwMVOForv7PF
         MESTEjhq7HQyOtti+Eu1vSnYfHhm2HmKtm/hcDfGsAQgdePlvOZBMFetT1qGVvDEo6oj
         7KjU48t8qP06hoPzQMeNJdxd7lsHf8G2OEqlJ/DtlDDGXamR8/hGNNrB95+I/J633rqV
         SXMCqW8ZTPMcNPcuXqTXF4d5q7JbSmUtnlbiDDN+5m1bH0jsutTdEBJIIrX2wpoZEqR5
         N+Bj7cTFlbFu4SXX95pdeyoBi6HcX0U5XGezv3u77NrwpaHhRElaAlZ/bhczQJeFxLDE
         R/Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598172; x=1744202972;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=y+3sJL5+WsmkUHEYm1BzR/GyrjVHVNtLDIyVC85cNdI=;
        b=JuG8drrcuXvx6y5VA2befvnXgOA3H8jv+shEZoeu8AbluIcfJyVaHPF00La7EGshbN
         vPD67N5oZJn2T+fBP2+coUr+M4WD5OrsoNzz/R0dNqzVcV8U8ebAOlKusjRApWt5rCvm
         C2lfIpIzu2exydkMDsQUYn47PV4yUvUqScfUxRTCgxFKX5SmOz3io6Q4uLzdI4iCubtq
         iWJhTiW28HS5Xgz8r0KCeftkD4ifdkYqert/zyvQW6YuT9nA347Rtmx9w0WNxRzOvwWE
         nyvfukicBBu1frTuY0iK53D9g2f3uDeeBuDBy3XPu8bp8FvwW2DUacOsJLjk3ScvRVM7
         XQcg==
X-Gm-Message-State: AOJu0YzhYCNMbpsZKCabqOFxxMCVT47hNkOo1g7JjHeXzWVcm3z/tGdD
	pXcJ3/wKCIEGMxYXlgnHGOaL8dXoYoXC2Na0l6WHBDKkGYqu9SVV+eeKTLSk335+oSOWZNkXWWn
	W+rjwLCOfdNI2jORKHRHc1fM48nQH/5FJBCZDC4Hp4aBiv+ObxCk=
X-Gm-Gg: ASbGncv2A9G4y93EdnmnVztzNUocGMatodakkBDVHKzohIwseRkRCQDXD5dKowTF86m
	393RclKHEwudXl3LqY93ERWbjhmP/OCuKNCFDryJKzdezed1pGfgA6esa/Boh7RnejuUdp4ePKT
	TOOFkLuSHMNbW0eQMEhYyLnhRdHbPsa107y5dUGKBC7+M/IPq2GC9mukGbbkk=
X-Google-Smtp-Source: AGHT+IEZPV71xCZFRaiMP7CnHUqII0vri11WJXA0JOvFvWq6jg//KmbiEFno6N5n8nVLL7zZFwNgKtdEbJvUoV78150=
X-Received: by 2002:a05:6102:f8f:b0:4c1:9bdb:6188 with SMTP id
 ada2fe7eead31-4c839e38348mr1583448137.13.1743598172341; Wed, 02 Apr 2025
 05:49:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:19:19 +0530
X-Gm-Features: AQ5f1JrYBDqdwedr2g0EeIuRXqX4Zi5GT7DMBhpK7McR8fimUhQCIrzEPDNgmhA
Message-ID: <CA+G9fYve7+nXJNoV48TksXoMeVjgJuP8Gs=+1br+Qur1DPWV4A@mail.gmail.com>
Subject: v6.14-12245-g91e5bfe317d8: Boot regression: rk3399-rock-pi-4b
 dragonboard-410c dragonboard-845c no console output
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, clang-built-linux <llvm@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on rk3399-rock-pi-4b, dragonboard-410c and dragonboard-845c
the lto-thing, hardening and lto-full config boot failed with toolchain
clang-nightly on the mainline master branch with no console output.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on rk3399-rock-pi-4b:
  - boot/clang-nightly-lkftconfig-kselftest
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-full

Regressions found on dragonboard-410c:
  - boot/clang-nightly-lkftconfig-lto-thing
  - boot/clang-nightly-lkftconfig-lto-full
  - boot/clang-nightly-lkftconfig-hardening

Regressions found on dragonboard-845c:
  - boot/clang-nightly-lkftconfig-hardening
  - boot/clang-nightly-lkftconfig-lto-thing

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: rk3399-rock-pi-4b dragonboard-410c dragonboard-845c
no console output

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Boot log
Starting kernel
...
<No console output>


## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Architectures: arm64 (rk3399-rock-pi-4b, dragonboard-410c, dragonboard-845c)
* Toolchains: clang-nightly (Debian clang version 21.0.0 )
* Kconfigs: lto-thing, hardening, lto-full

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27859063/suite/boot/test/clang-nightly-lkftconfig-lto-thing/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdkI9AGWWvuT5OzYdgSgXEeH/config


--
Linaro LKFT
https://lkft.linaro.org
