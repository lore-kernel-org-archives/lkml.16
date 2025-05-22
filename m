Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC89228BABD
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747919528; cv=none; b=N5CW6VXcGHPWUKcNw3wmmoE3y3EQimIQgmyBWYpu6/MAwSWpxrQOrgxt2aCBSlJxtzgC2qo+OOk6PrtdpgOMmoL4/MUgTEwgXarzY8oIyFaqfEfQacGil/lqQd6CC6xfCLxozKb+Lsa9pIQQ6bFAn67auw08eTyIkiITyi0ZnQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747919528; c=relaxed/simple;
	bh=VwD68oPdZR7QMQCqJ6VWvr3muJ2LNlzFhJmXibbXOuE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=hyxbQd4gPRSreUrv8q/yTUc4NxO3h6xiNOHhoRS2qjcT01IikGVmnWfn/dcc6i9+T1oG1BTi3pnY0IINzPsX6B78O3SaJgWJYjpPk/zaVuPucca2auHDl83Q7ClINj/ClVgf31sp53+o1aJIuDdq2qR7+UWsfkFY2mRQdBjXQ/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ycq9YWdx; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ycq9YWdx"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5e39d1e0eso863771885a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:12:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747919525; x=1748524325; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=;
        b=Ycq9YWdxpOKxxk0SxqS4VwJ7S6KlAP01OgpLJKe2MSknqqRLl8j6eNmyh6d9dBP1sK
         9xhsE6B5E9/bsIxiyaU8f91iv6DwjhpgF5L+CklhfTvgbEwHvu6kG1q5yjj/N9l7gL4Y
         x5Xi6WurPLgyAapCCweRVVkjMw/QxRg1pUGRW5QbMLenuhoGIHJSxysqFCSMu5xmA22v
         njlELzZkbGLLmRlmrvcGsjK3OOztjIbJMOETI9WxYk3/04IO4+5uSN0Vxu53YI5tDhR6
         cYX3tgim18mfC2AUoAPNkOssuFW79LALhEufAOnYhECet/wCBCZstHrnzRQUnd8bsU4u
         2wRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747919525; x=1748524325;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vVd3U96Y4i9Vlcsd5gesH7KRFcK58OXYVflQsNrla/c=;
        b=dbydRYM1Sd0kIT417oQuAU7HcCjhIgwRfBDIQjPW8pyeOL5xZRT6Eaxqtf4V+iSmLj
         ek7tpHCMxjD/tCbdnfOc9/LywRUzHm7zRHh5yTB3IW7cJepYldiyOspu855od/vX90Uz
         lKXN8/MHg8e7ya/CjgmXcuDrqCiNB2SE8rBgBdFC4ryxBvWYu14EcZi8Go5eeGa/xyxW
         30hm4GaffVBoeEAFxKY1dxsXALHup3RJrj39t1K98GaCflOQINFkiLCzrgsPG24CbzxP
         Lhh/AFj7YG/1PbJ8z6/qG9Y+3bkwnEosK4rjF2QqMwl8/Al1sa9HxdOiNpA67MCqpyUe
         Yx7g==
X-Gm-Message-State: AOJu0YxDETS8gTtNvglDKAsoJLDnqzNhPBnqIsvvCMELVjIjfWMQ5lxc
	gwoJ9GGQ6BR5Zbrtvh8/H3bIuLWZ8PjvNz44j5v5965apP7V9YwhGs56hP+T5+ITMfHRLlZnlXW
	UiSqfbZ/gnyvH3hbFhek7fwQJxz4I1QgsppmrzRGduY4ruIpGs9vY3/c=
X-Gm-Gg: ASbGncu+6cnW/xmLeyJTYgMqEFEu/gFLBlgiACfSL7v2/GkJfySpyXMOYM6xBps2MBh
	ecuSf5LiULx9nIe18B1IIZ/1xe8bWCMMMMrmy+rB6fz5d2Qah6Z7SRtsuELks12lT31ZK6Vy0CB
	4pOYt5IaTiDhVs6RDwV3mxJng8vZdyuy7mniCSa3dUtNMPlV31rPnIFyaTJvtU+Uo3zA==
X-Google-Smtp-Source: AGHT+IFer49uV/0MlFOwzViAxidhmUTCovTOCELPmnDhegazhsSbbMo1dxe+RgiFPEHTV1iqxE1ZvAzIrmUV7Y4BUPA=
X-Received: by 2002:a05:620a:4405:b0:7ca:f3d0:e7c8 with SMTP id
 af79cd13be357-7cd47fed6f9mr3472211685a.52.1747919524812; Thu, 22 May 2025
 06:12:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:41:52 +0530
X-Gm-Features: AX0GCFsHvByQyFYjjj2yI43kVVdpVcQ_KO3AH4tPajR5bk66xedIzcAuV4seOEA
Message-ID: <CA+G9fYssasMnOE36xLH5m7ky4fKxbzN7kX5mEE7icnuu+0hGuQ@mail.gmail.com>
Subject: arm64 gcc-8 defconfig call to '__field_overflow' declared with
 attribute error value doesn't fit into mask
To: open list <linux-kernel@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, linux-wireless@vger.kernel.org, 
	Netdev <netdev@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Ard Biesheuvel <ardb@kernel.org>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Johannes Berg <johannes.berg@intel.com>, 
	Miri Korenblit <miriam.rachel.korenblit@intel.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64 defconfig build failed with gcc-8 on the Linux next
tag next-20250512 and next-20250522.

First seen on the next-20250512
 Good: next-20250509
 Bad:  next-20250512

Regressions found on arm64:
 - build/gcc-8-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: arm64 gcc-8 defconfig call to '__field_overflow'
declared with attribute error value doesn't fit into mask

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
-----
In file included from arch/arm64/include/asm/sysreg.h:1107,
                 from arch/arm64/include/asm/cputype.h:248,
                 from arch/arm64/include/asm/cache.h:43,
                 from include/vdso/cache.h:5,
                 from include/linux/cache.h:6,
                 from include/linux/time.h:5,
                 from include/linux/skbuff.h:15,
                 from include/linux/if_ether.h:19,
                 from include/linux/ieee80211.h:19,
                 from drivers/net/wireless/intel/iwlwifi/iwl-trans.h:10,
                 from drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c:6:
In function 'u32_encode_bits',
    inlined from 'iwl_pcie_ctxt_info_init' at
drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c:208:3:
include/linux/bitfield.h:195:3: error: call to '__field_overflow'
declared with attribute error: value doesn't fit into mask
   __field_overflow();     \
   ^~~~~~~~~~~~~~~~~~
include/linux/bitfield.h:215:2: note: in expansion of macro '____MAKE_OP'
  ____MAKE_OP(u##size,u##size,,)
  ^~~~~~~~~~~
include/linux/bitfield.h:218:1: note: in expansion of macro '__MAKE_OP'
 __MAKE_OP(32)
 ^~~~~~~~~

## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28517069/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28517069/suite/build/test/gcc-8-defconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9LbWebbQqL9EYIT8oB7qmNj/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9LbWebbQqL9EYIT8oB7qmNj/config

--
Linaro LKFT
https://lkft.linaro.org
