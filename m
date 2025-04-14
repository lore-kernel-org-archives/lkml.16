Received: from mail-vk1-f173.google.com (mail-vk1-f173.google.com [209.85.221.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C380C27B513
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 16:08:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744646885; cv=none; b=EfSenNaHcCz/Zbn3mTuW/MPze+9zPLpvz/JjBEXCbVnjbiGGH5gYo0b+nc9Tx3MBN2UGcI5iriy6kyN7TylbYvreH4alllMIPF38dc2IlrUuu/LDAz5ObcCIL0gqjF5ZBTHmlReRk9SnLMHNOueF8rZaEmyWxnQPfLWklDUEMu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744646885; c=relaxed/simple;
	bh=YsDDrqdiKPewJFDI/ZaIPX3S15luwx8n2Mto/qWn4FU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=nVaokuRc0wghQrv+0IPR8VK6JyWrLtr0ic+IL/ckyZPyr3DzTYEXuGacw800SxSTFq0mo6/hfTIKHghGfCCP93aRbY03JlifXqs0FDzKHYzI5WtY82bn/HKQe9uogQdVDKFOrnMERHKrIGhBAOnLhg3mLbDglT4jYMPKjqRIKCM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RU52wIoL; arc=none smtp.client-ip=209.85.221.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RU52wIoL"
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-5259331b31eso1854589e0c.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 09:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744646882; x=1745251682; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=GVdhvs8iCKF+l1CgTbrVGuUPsMa5kPGA5aq8CngfGco=;
        b=RU52wIoL4NZVYIMc7+jUhsTtGENoQwkEllZ3lPfTmdt5K47jZMwRbIu7wwYxSrV+Wu
         tMpYlijrTwmr1lPDpQJ8LwgvXA6/pIVJk8EW51/53pwproSVwufTPsS1WnztWMG4YBU3
         Dq0z+y2fYEVBz1sdVZLAoIUVmiQgc2m5N9kv9mkpuWi/xpTfTSh4R+3hmuXDjEhfR6de
         A0rT8J2g012hWA3jV7PKNd9ui9HoEbpCUrmmMt4zNyCaCJHTgfM00RdYNZdoQ8oz4fCG
         AVH9V3iA528PEPVtBgK3/yYrEMWO9LIL0W3lGn9F719q2R/STda0lNDjeF6zGHiR80nw
         hwlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744646882; x=1745251682;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GVdhvs8iCKF+l1CgTbrVGuUPsMa5kPGA5aq8CngfGco=;
        b=dePbqMlfC80urf+z2LUHPfL9aZdLemqLSPWc5KprFjvHgulbySuXhSCAW2Rz8swubD
         6IYFBbipzc7V6QwCF3BdnL86uevd+NY3+m13boBgaDXpbTxedE/dW8DI9cDXv0J4ywOv
         HfvEm8bH5cmZOVvdPuRQyHV+U/ogeVNsWk+qAmuj6DfUDnXE4oOFrNa0yN3pLDlPr/gv
         pX7sPCwspoNsxjrXaygf3FvgRKgC5NqybYRcwtYD58uzicSibeTYC3iTdN9uPJQqUCQR
         /n0KtO+8Wl7KXen/ka6QNboYhN2KF+/FdvMUxTVSI3hqXDN9f8R7WFGFf788WWNBx5DB
         +rfg==
X-Forwarded-Encrypted: i=1; AJvYcCX5V5xZHryQr8sPqZzPHKE52aS9PoZuawvmA1QShW8+luV7iqHywAsMP3Hc/GNGnkW41ufLTmih8rL4d7w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR29eyFiY8FSuzhPNeoPiKO0ADzUvLbvZxAP8gdnBjnIGCzDkb
	tlpIBrWjyedJwjpZvSDkpl8CPuBt9f+6w2jw7AVm0fgnohwZRGfCXWDmNcZDqvencpJK+uno075
	DOtrNt94f/G3M4CvrPzS0sBzSw6ARl56mR6ZG+7XRSnPqikJG104=
X-Gm-Gg: ASbGncv80sIB/sLvfTc8wyIryz9rI+YmNpKu7ZbImbBUaoGA4P53zPXD8IuEVsN253w
	vce7I8DtpUIHC5uvTfb9eeCLqTgDFeMT6p4B5PMpHuE83Q50jHBSwmB0kVA3OA5SmilKnfOvo28
	qIxp+M88NGwH7wnED1R9lvmMMTMjSc9ZwS8Pp8ataEMylsR6Gwvm/h/QA=
X-Google-Smtp-Source: AGHT+IHBAGkweFTifi1qPgR9IAfMLmuSmWZaZQ6DuipMBRn0J0LfwS+rc70yp8/jIym5PdQxz5lfL2wrwCdthfYvTjU=
X-Received: by 2002:ac5:cdf7:0:b0:528:6ea9:bc45 with SMTP id
 71dfb90a1353d-5286ea9d6a9mr5875777e0c.7.1744646882420; Mon, 14 Apr 2025
 09:08:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 14 Apr 2025 21:37:51 +0530
X-Gm-Features: ATxdqUEU9CbNcg5O-P00XITiRp_i9HXoSVbIKt6BMPS9caFWsHNxBM8T9sm2aH8
Message-ID: <CA+G9fYvnun+bhYgtt425LWxzOmj+8Jf3ruKeYxQSx-F6U7aisg@mail.gmail.com>
Subject: x86_64 clang-20 clang-nightly config lto-full failed - ld.lld: error:
 linking module flags 'Code Model': IDs have conflicting values: 'i32 1' from
 vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o
To: clang-built-linux <llvm@lists.linux.dev>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	Arnd Bergmann <arnd@arndb.de>, Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on x86_64 config LTO_CLANG_FULL with korg-clang-20 and
clang-nightly on the
Linux next-20250407 and found again on next-20250414 tag

First seen on the next-20250407.
Bad: next-20250407 and next-20250414
Good:next-20250404

* x86_64, Build
 - Build/korg-clang-20-lkftconfig-lto-full
 - Build/clang-nightly-lkftconfig-lto-full

Regression Analysis:
- New regression? Yes
- Reproducibility? Yes

Build regression: x86_64 clang-20 clang-nightly config lto-full failed

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
ld.lld: error: linking module flags 'Code Model': IDs have conflicting
values: 'i32 1'
    from vmlinux.a(gdt_idt.o at 1321040), and 'i32 2' from ld-temp.o

Clang-20 versions:
   "name": "clang",
   "version": "20.1.2",
   "version_full": "ClangBuiltLinux clang version 20.1.2
   (https://github.com/llvm/llvm-project.git
58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)"

Clang-nightly versions:
   "name": "clang",
   "version": "21.0.0",
   "version_full": "Debian clang version 21.0.0
   (++20250402105505+c57b9c233a87-1~exp1~20250402225526.1363)"

## Source
* Kernel version: 6.15.0-rc2
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: b425262c07a6a643ebeed91046e161e20b944164
* Git describe: next-20250414
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/

## Test
* Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250407/testrun/27929871/suite/build/test/clang-nightly-lkftconfig-lto-full/log
* Test details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114606/suite/build/test/clang-nightly-lkftconfig-lto-full/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114606/suite/build/test/clang-nightly-lkftconfig-lto-full/history/
* Test history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250414/testrun/28114590/suite/build/test/korg-clang-20-lkftconfig-lto-full/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2viBgnFQjsmdmrsmASvlyYWisRa/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2viBgnFQjsmdmrsmASvlyYWisRa/config

## Steps to reproduce
# tuxmake --runtime podman --target-arch x86_64 --toolchain korg-clang-20 \
   --kconfig defconfig --kconfig-add CONFIG_DEBUG_INFO_REDUCED=y \
   --kconfig-add CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y \
   --kconfig-add CONFIG_IGB=y \
   --kconfig-add CONFIG_LTO_CLANG_FULL=y LLVM=1 LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
