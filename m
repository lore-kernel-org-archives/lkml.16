Received: from mail-ua1-f44.google.com (mail-ua1-f44.google.com [209.85.222.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D012D9EC2
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 10:57:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750157866; cv=none; b=oBO/O/FnzbXw3EsVhKRlkaKb9BQbHITtzBV4SLRzOgx/WapQnzk0ya3RTuD/F9QbM+JK93WbnZG8J/CAfy8a+vMCinVuElcRl8FTRrbyN9omHskvEvC4LxF/cPMQyIiDjoo995n8OBHKy5R4JjP74QFAhRpbd6cYcTIf9olpqRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750157866; c=relaxed/simple;
	bh=HBk6zJZHV4vsa0VhDW4aY+uhm1/ziG3zTyQp7E0npXw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GJu3jZpWd6swe8YNHJh2bAa8F1I8zamY9C4HRhytfKA4NqIUocM+u2TIDMdRbfIc+pX8j8YqmGCjsIasUWaYNvmPc5TyIFkEl2rsifK8HI7r4k9IeLZt93l42AWe/Ly0Sbp+IOGmHImuFnpqGIZLSws9+5DNupjtb/Dci22FUJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=FVpxhL3x; arc=none smtp.client-ip=209.85.222.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="FVpxhL3x"
Received: by mail-ua1-f44.google.com with SMTP id a1e0cc1a2514c-87f04817bf6so3974772241.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 03:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750157863; x=1750762663; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=c81IQWCtU+e1Z+bGqEEZMZ9K+kUzvc3Zxz0U0u0EUOc=;
        b=FVpxhL3xc+wRf7QquZoy4IZMlKq5GYC8EQ1iI87L2ElVjPDQO2dF4ElBlqikrAGrph
         IFOSHXS4cmTkxl1RdgriGwFDoC9YuNsX6BdXSi/s6X2PoPCIY9QMZhH8WNYp9kcQmg1M
         3P1eagVBGxxwNuMZb/RT3T55aZAwS71lF6CJKc9ceNm3/ZDjDEbkspkKhtZAmMRa2FhX
         7ylWIyhldepnhhR5AW3EKZHUMPep4kAT/et4hP6DfxnhCyiSXQ6vwhrHeZpcnaDHEvgY
         72R2WDExtBl0yN1pep0TE59v9FmEiUQvsQGy4rupjgtIeUp2QPQ3OKACPIizVWKg6PrN
         HPFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750157863; x=1750762663;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c81IQWCtU+e1Z+bGqEEZMZ9K+kUzvc3Zxz0U0u0EUOc=;
        b=EoKMCwTRPbe1u53nLMnczoNLgYmQ94+U6UmnnZCzlAC8J9hW2MKpE0esaPbaJUGvGA
         CR5k/lhIvpi9n1Lo6J4XhuqM2ujUVu2ZThXtrlvfNCelgFskYFEd7jd0ZrmT8ixS0Pwh
         Z9+AJb+I7HiPcisZtvZDXFWmsPzltsNgaaaRO74PfXdTSZzKQ2QGl49lxqD00B6qOgLf
         Lwo6gdQ6EfSUkcb2T/pEvCceX9MAhi3qyoEnSeldIaagsH1xVJDhsje1RYzPfotNxNUA
         YNnwQO6hzAlEzvFhukb89F55o3jS9cmAptrdALwEncWKyPI6UrDs/qV515et1Eznb9L0
         20IQ==
X-Forwarded-Encrypted: i=1; AJvYcCWY8GM4Yy1VrblA/D877wuF6wylMRKlGncdqbZVK0LU/P4GZmlXrWWJfUtDO9cpy7IfVm7/88clElQu2ok=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5gQxpmyTqxxTMfKE/C0RHD8g6qRORPjE3uu4si1K2XbIj0Urv
	8EoG+VfcPuax6eki0lUR9AupmkWV+tIy2+DpOpufRC3TbpmtXiYaWS2B7ywivbCMRfQWZk76vBC
	Gts1YnoyM3MbjkZ7qKyh0pYIbMXcaCr7rvufb31yEeQ==
X-Gm-Gg: ASbGncsu0ZAFFD7fUzxYyrHc8qj9Z26WCKKv15eKlP7JL6bb24eFoCczQM7MzzbiNxS
	vmYvME0M1QnKjO/EN287ooL85v5Mwu+fRyAkyVhc4hSYbHH1oJitnUD0CZO3n3H8wp0ugoE+5fO
	+P0rFVyIhKrMyo91UX4yhAlp+wZ9Bhcj+f2QlB7E4hcLjtFUt+H20EqaNf4QJ0zeDxH0UlpD8F+
	Yt+
X-Google-Smtp-Source: AGHT+IFG65MJEmLyCiOA9BERiPBGn3eCQfrV2NYScdNTN7N795VvYOJPF7RDGtmA6jqxlIol8QUfzzemKq7HOJv3ueY=
X-Received: by 2002:a05:6102:2927:b0:4e7:cbf9:43a1 with SMTP id
 ada2fe7eead31-4e7f6218da4mr8381544137.23.1750157863167; Tue, 17 Jun 2025
 03:57:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 17 Jun 2025 16:27:31 +0530
X-Gm-Features: Ac12FXwULPm4A9nRkKZyjofb2giwdTHhtOl9_auNYX02QYl3DXMx7cn-e5ky_Vc
Message-ID: <CA+G9fYsiWN1gWhHBk9uruDBzVHvLYCTL-VcxU2iiPMcS1EXyBg@mail.gmail.com>
Subject: selftests ublk UBLK_IO_F_NEED_REG_BUF undeclared
To: "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Shuah Khan <shuah@kernel.org>, Ming Lei <ming.lei@redhat.com>, Jens Axboe <axboe@kernel.dk>, 
	kbusch@kernel.org, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

The following build warnings / errors noticed while building the selftest/ublk
with gcc-13 and clang-nightly toolchains on Linux next tree.

Please suggest if I am missing something in my build setup.

Regressions found on arm arm64 x86_64
  -  selftests ublk

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: selftests ublk UBLK_IO_F_NEED_REG_BUF undeclared

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log

 CC       kublk
In file included from kublk.c:6:
kublk.h: In function 'ublk_io_auto_zc_fallback':
kublk.h:240:35: error: 'UBLK_IO_F_NEED_REG_BUF' undeclared (first use
in this function); did you mean 'UBLKSRV_NEED_REG_BUF'?
  240 |         return !!(iod->op_flags & UBLK_IO_F_NEED_REG_BUF);
      |                                   ^~~~~~~~~~~~~~~~~~~~~~
      |                                   UBLKSRV_NEED_REG_BUF
kublk.h:240:35: note: each undeclared identifier is reported only once
for each function it appears in
kublk.c: In function 'ublk_ctrl_update_size':
kublk.c:223:27: error: 'UBLK_U_CMD_UPDATE_SIZE' undeclared (first use
in this function)
  223 |                 .cmd_op = UBLK_U_CMD_UPDATE_SIZE,
      |                           ^~~~~~~~~~~~~~~~~~~~~~
kublk.c: In function 'ublk_ctrl_quiesce_dev':
kublk.c:235:27: error: 'UBLK_U_CMD_QUIESCE_DEV' undeclared (first use
in this function); did you mean 'UBLK_U_CMD_DEL_DEV'?
  235 |                 .cmd_op = UBLK_U_CMD_QUIESCE_DEV,
      |                           ^~~~~~~~~~~~~~~~~~~~~~
      |                           UBLK_U_CMD_DEL_DEV
kublk.c: In function 'ublk_queue_init':
kublk.c:447:63: error: 'UBLK_F_AUTO_BUF_REG' undeclared (first use in
this function); did you mean 'UBLKSRV_AUTO_BUF_REG'?
  447 |         if (dev->dev_info.flags & (UBLK_F_SUPPORT_ZERO_COPY |
UBLK_F_AUTO_BUF_REG)) {
      |
^~~~~~~~~~~~~~~~~~~
      |
UBLKSRV_AUTO_BUF_REG
kublk.c: In function 'ublk_thread_init':
kublk.c:507:63: error: 'UBLK_F_AUTO_BUF_REG' undeclared (first use in
this function); did you mean 'UBLKSRV_AUTO_BUF_REG'?
  507 |         if (dev->dev_info.flags & (UBLK_F_SUPPORT_ZERO_COPY |
UBLK_F_AUTO_BUF_REG)) {
      |
^~~~~~~~~~~~~~~~~~~
      |
UBLKSRV_AUTO_BUF_REG
kublk.c: In function 'ublk_set_auto_buf_reg':
kublk.c:579:16: error: variable 'buf' has initializer but incomplete type
  579 |         struct ublk_auto_buf_reg buf = {};
      |                ^~~~~~~~~~~~~~~~~
kublk.c:579:34: error: storage size of 'buf' isn't known
  579 |         struct ublk_auto_buf_reg buf = {};
      |                                  ^~~
kublk.c:587:29: error: 'UBLK_AUTO_BUF_REG_FALLBACK' undeclared (first
use in this function); did you mean 'UBLKSRV_AUTO_BUF_REG_FALLBACK'?
  587 |                 buf.flags = UBLK_AUTO_BUF_REG_FALLBACK;
      |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~
      |                             UBLKSRV_AUTO_BUF_REG_FALLBACK
kublk.c:589:21: error: implicit declaration of function
'ublk_auto_buf_reg_to_sqe_addr'
[-Werror=implicit-function-declaration]
  589 |         sqe->addr = ublk_auto_buf_reg_to_sqe_addr(&buf);
      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
kublk.c:579:34: error: unused variable 'buf' [-Werror=unused-variable]
  579 |         struct ublk_auto_buf_reg buf = {};
      |                                  ^~~
kublk.c: In function '__cmd_dev_add':
kublk.c:1178:25: error: 'UBLK_F_QUIESCE' undeclared (first use in this function)
 1178 |         if ((features & UBLK_F_QUIESCE) &&
      |                         ^~~~~~~~~~~~~~
kublk.c: In function 'cmd_dev_get_features':
kublk.c:1381:30: error: 'UBLK_F_UPDATE_SIZE' undeclared (first use in
this function)
 1381 |                 [const_ilog2(UBLK_F_UPDATE_SIZE)] = "UPDATE_SIZE",
      |                              ^~~~~~~~~~~~~~~~~~
kublk.c:1369:46: note: in definition of macro 'const_ilog2'
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                                              ^
kublk.c:1369:24: error: array index in initializer not of integer type
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1381:18: note: in expansion of macro 'const_ilog2'
 1381 |                 [const_ilog2(UBLK_F_UPDATE_SIZE)] = "UPDATE_SIZE",
      |                  ^~~~~~~~~~~
kublk.c:1369:24: note: (near initialization for 'feat_map')
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1381:18: note: in expansion of macro 'const_ilog2'
 1381 |                 [const_ilog2(UBLK_F_UPDATE_SIZE)] = "UPDATE_SIZE",
      |                  ^~~~~~~~~~~
kublk.c:1382:30: error: 'UBLK_F_AUTO_BUF_REG' undeclared (first use in
this function); did you mean 'UBLKSRV_AUTO_BUF_REG'?
 1382 |                 [const_ilog2(UBLK_F_AUTO_BUF_REG)] = "AUTO_BUF_REG",
      |                              ^~~~~~~~~~~~~~~~~~~
kublk.c:1369:46: note: in definition of macro 'const_ilog2'
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                                              ^
kublk.c:1369:24: error: array index in initializer not of integer type
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1382:18: note: in expansion of macro 'const_ilog2'
 1382 |                 [const_ilog2(UBLK_F_AUTO_BUF_REG)] = "AUTO_BUF_REG",
      |                  ^~~~~~~~~~~
kublk.c:1369:24: note: (near initialization for 'feat_map')
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1382:18: note: in expansion of macro 'const_ilog2'
 1382 |                 [const_ilog2(UBLK_F_AUTO_BUF_REG)] = "AUTO_BUF_REG",
      |                  ^~~~~~~~~~~
kublk.c:1383:30: error: 'UBLK_F_QUIESCE' undeclared (first use in this function)
 1383 |                 [const_ilog2(UBLK_F_QUIESCE)] = "QUIESCE",
      |                              ^~~~~~~~~~~~~~
kublk.c:1369:46: note: in definition of macro 'const_ilog2'
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                                              ^
kublk.c:1369:24: error: array index in initializer not of integer type
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1383:18: note: in expansion of macro 'const_ilog2'
 1383 |                 [const_ilog2(UBLK_F_QUIESCE)] = "QUIESCE",
      |                  ^~~~~~~~~~~
kublk.c:1369:24: note: (near initialization for 'feat_map')
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1383:18: note: in expansion of macro 'const_ilog2'
 1383 |                 [const_ilog2(UBLK_F_QUIESCE)] = "QUIESCE",
      |                  ^~~~~~~~~~~
kublk.c:1384:30: error: 'UBLK_F_PER_IO_DAEMON' undeclared (first use
in this function)
 1384 |                 [const_ilog2(UBLK_F_PER_IO_DAEMON)] = "PER_IO_DAEMON",
      |                              ^~~~~~~~~~~~~~~~~~~~
kublk.c:1369:46: note: in definition of macro 'const_ilog2'
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                                              ^
kublk.c:1369:24: error: array index in initializer not of integer type
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1384:18: note: in expansion of macro 'const_ilog2'
 1384 |                 [const_ilog2(UBLK_F_PER_IO_DAEMON)] = "PER_IO_DAEMON",
      |                  ^~~~~~~~~~~
kublk.c:1369:24: note: (near initialization for 'feat_map')
 1369 | #define const_ilog2(x) (63 - __builtin_clzll(x))
      |                        ^
kublk.c:1384:18: note: in expansion of macro 'const_ilog2'
 1384 |                 [const_ilog2(UBLK_F_PER_IO_DAEMON)] = "PER_IO_DAEMON",
      |                  ^~~~~~~~~~~
kublk.c: In function 'main':
kublk.c:1613:46: error: 'UBLK_F_AUTO_BUF_REG' undeclared (first use in
this function); did you mean 'UBLKSRV_AUTO_BUF_REG'?
 1613 |                                 ctx.flags |= UBLK_F_AUTO_BUF_REG;
      |                                              ^~~~~~~~~~~~~~~~~~~
      |                                              UBLKSRV_AUTO_BUF_REG
cc1: all warnings being treated as errors


## Source
* Kernel version: 6.16.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
* Git describe: next-20250616
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
* Architectures: arm, arm64, x86_64
* Toolchains: gcc-13, clang nightly
* Kconfigs: selftest/*/config+defconfig+

## Build arm64
* Build log clang:
https://regressions.linaro.org/lkft/linux-next-master/next-20250617/log-parser-build-clang/clang-compiler-null_c-error-use-of-undeclared-identifier-ublk_param_type_segment/
* Build log gcc:
https://regressions.linaro.org/lkft/linux-next-master/next-20250617/log-parser-build-gcc/gcc-compiler-null_c-error-ublk_param_type_segment-undeclared-first-use-in-this-function-did-you-mean-ublk_param_type_devt/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250617/log-parser-build-clang/clang-compiler-kublk_c-error-variable-has-incomplete-type-struct-ublk_auto_buf_reg/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ycmBy2r4aPm6emlo7FXwX0my1D/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ycmBy2r4aPm6emlo7FXwX0my1D/config

## Steps to reproduce
 - tuxmake  \
    --runtime podman  \
    --target-arch arm64  \
    --toolchain gcc-13  \
    --kconfig defconfig  \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/netdev.config
 \
    --kconfig-add
https://gitlab.com/Linaro/lkft/kernel-fragments/-/raw/main/systemd.config
 \
    --kconfig-add CONFIG_SYN_COOKIES=y  \
    --kconfig-add CONFIG_SCHEDSTATS=y debugkernel dtbs dtbs-legacy
headers kernel kselftest modules


--
Linaro LKFT
https://lkft.linaro.org
