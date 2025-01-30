Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 468301B4F2F
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 09:52:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738230741; cv=none; b=dTW3M8pR/xofvZDF7ZgVnTSo5Z2HeJ2W0OPE7veA3ZKS50gkDhQtqw75e2lmdQefQozj0W7Lu4200y0z63bzAmd2S2CHfNigIncbqchDVaEzr54DV03ps5lZhz54hY00UvUClfXBnYTSvDA0JU13JGtHQphoDFrU2ZmVkWKObAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738230741; c=relaxed/simple;
	bh=oOlH31+Fi0ZgrG/RXFKf+ovqVCVSyjsMJWQgNttxRF8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=OjGURd0xtUArszf7ED6DK4tcCVptu29xGrnDlLMWzqMd8MkzCvboQT/Hx9XxR6OlCzGkgGh5cAeGYwqmXG0RGw0FNSbbEK8IhxsNsnl7aga1OQqQHNQvyTw2In2Cf/BCm9bItubrJV8oZ9lTFN0SLbf6CYZ+3gsKZlgms3a4uMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=pI+2GbOA; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="pI+2GbOA"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5187aa2c97dso173714e0c.2
        for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 01:52:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738230738; x=1738835538; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=gIgiURoIKeHZ75W8n0Yn2XXbNIX+HO5mOVAyC7vGTcg=;
        b=pI+2GbOAbFYJaAQfwOhXA7wIb8AzyLR/3fZd2cq5kC/DsAgyLWLTJRchtgZ/r0GJ13
         GSJfcz7QgGfdsy4mCR8K8YE/vO8yeA1oefJ/I9mS1K/KCmwibAnFew7sfZIxEKy5w7pX
         Ko8Wb9/INVnFcl/B5+tErqpXkiSWQaxRg2HBA5P8eicSoD4bteqE4XdHXJnqLPkKfVvE
         ZoWuii7nOIvZhRIH1W/3xwJP62BOZsz7dQXYHtrVdbTFVTbFZjiTZkGh6UaMfjSG5A/x
         SEJ3BBNCYoP9tVjAW0DQEvQ0AXcSR/iA224d3/h174cyqvbv7hC6FmOSkHWJHLJ4mM2e
         Gj9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738230738; x=1738835538;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gIgiURoIKeHZ75W8n0Yn2XXbNIX+HO5mOVAyC7vGTcg=;
        b=crwbvO3dZx5iikcMTXsv08UHmdFtXpcmp8Pcwgrg7X//KRdCF5HGb5qXx4Xkl8CPn/
         xkLG8QggTFr5jsEjhmothVEMm3TvKkwjEkNi+KTVY/1HIOGJKf5EdMztf/VdfOI14a5i
         6gGUy01AJXKEdKYbL9zTbMCfKEErBrcLZgHxYZQ15kA4dz6FAzmnnnoyLloPDR4nQyiu
         AeCRdt4Z0k01PSuzLE4zO4sKe8d4ZnyacSpC74t8/5TBinkFWsuBGjV9oYI+JelyOoLL
         EgkGi8Cba69kwBL0n5KCXawhmdTPrbi4VWIT6wnusFOBXKK/0p6AgvtNwaxML6aoABHg
         DJfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUPnvOFuOVyk+WOuGJwOf37qMBlrpFW+lUJ3xNvvKSzIQevdSN+yUXLVLemfPkXw/3R23LMg10Fgc5Q/Ys=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrHR0lMlrQcNmq+R7MEOsFZxShbOuvTyyp/7W2/bTM4Cb/GaeB
	25hCoHKdPw5kuWDzNwA1uxS2Wb+6YIi2m/0mJN7MCRzbaBdKX65UtPJUX5W5FuaaFAT0maA6bSj
	I9zegdbPWcup3qdhELAZ0w2xaFT0Q4odSxR0f2Q==
X-Gm-Gg: ASbGncssgd8bOjbYZNWVFTYDBHASPItpzRIdSbUUBRsGPCS6SQUNikRU2PiSGDWh066
	u1uv8hU4zF3aYMWm6gcWiEh3AQBNkCzp65UMZI2wsofwJFyF+zyRdmfOyExkWqfmXILLk6MHfSU
	UoJ1LS8igGOr2JL5SxXPtYkHCaDV8nvQ==
X-Google-Smtp-Source: AGHT+IFtphWzHzB5hLr/5hK9G0Oca2XVEYUATYBwh55KvkHQqmoCAkCZVHlU7DPA7oNByuxxN4PbbEmK0DqTS/BNDj8=
X-Received: by 2002:a05:6122:65a2:b0:516:157d:c5fb with SMTP id
 71dfb90a1353d-51e9e55bbbemr5640094e0c.10.1738230738043; Thu, 30 Jan 2025
 01:52:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 30 Jan 2025 15:22:06 +0530
X-Gm-Features: AWEUYZkeZKfv6tjMqdkdLJ6wGFjSj8QJD_kr6h2mDudYF9DdNw1AJWHq70JM9Rk
Message-ID: <CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com>
Subject: linus: arm64: error: call to '__compiletime_assert_536' declared with
 attribute error: FIELD_PREP: value too large for the field
To: linux-phy@lists.infradead.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: David Laight <david.laight@aculab.com>, Vinod Koul <vkoul@kernel.org>, 
	Adam Ford <aford173@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

The arm64 build failed with defconfig with gcc-8 toolchain failed due to
following build warnings / errors on the mainline linux master branch.
But the gcc-13 builds pass.

First seen on v6.13-9485-g72deda0abee6 on Jan. 30, 2025
Good:  v6.13-9338-g05dbaf8dd8bf on Jan. 29, 2025
Bad:  v6.13-9485-g72deda0abee6 on Jan. 30, 2025

arm64:
  build:
    * gcc-8-i386_defconfig

Reported-by: Linux Kernel Functional Testing

Build log:
---
ake --silent --keep-going --jobs=8
O=/home/tuxbuild/.cache/tuxmake/builds/1/build ARCH=arm64
CROSS_COMPILE=aarch64-linux-gnu-
CROSS_COMPILE_COMPAT=arm-linux-gnueabihf- 'CC=sccache
aarch64-linux-gnu-gcc' 'HOSTCC=sccache gcc'
In file included from <command-line>:
In function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
    inlined from 'fsl_samsung_hdmi_phy_configure' at
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:469:2:
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_536' declared with attribute error: FIELD_PREP:
value too large for the field
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
include/linux/bitfield.h:68:3: note: in expansion of macro 'BUILD_BUG_ON_MSG'
   BUILD_BUG_ON_MSG(__builtin_constant_p(_val) ?  \
   ^~~~~~~~~~~~~~~~
include/linux/bitfield.h:115:3: note: in expansion of macro '__BF_FIELD_CHECK'
   __BF_FIELD_CHECK(_mask, 0ULL, _val, "FIELD_PREP: "); \
   ^~~~~~~~~~~~~~~~
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:344:9: note: in expansion
of macro 'FIELD_PREP'
  writeb(FIELD_PREP(REG12_CK_DIV_MASK, div), phy->regs + PHY_REG(12));
         ^~~~~~~~~~
make[6]: *** [scripts/Makefile.build:194:
drivers/phy/freescale/phy-fsl-samsung-hdmi.o] Error 1

Links:
---
 build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27067488/suite/build/test/gcc-8-defconfig/log
 details: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27067488/suite/build/test/gcc-8-defconfig/details/
 history: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.13-9485-g72deda0abee6/testrun/27067488/suite/build/test/gcc-8-defconfig/history/

Steps to reproduce:
------------
# tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8
--kconfig defconfig

metadata:
---
  git describe: v6.13-9485-g72deda0abee6
  git repo: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
  git sha: 72deda0abee6e705ae71a93f69f55e33be5bca5c
  kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEbH5NudB5wtp6BtFn2cIlatV/config
  build url: https://storage.tuxsuite.com/public/linaro/lkft/builds/2sKEbH5NudB5wtp6BtFn2cIlatV/
  toolchain: gcc-8
  config: gcc-8-defconfig
  arch: arm64


--
Linaro LKFT
https://lkft.linaro.org
