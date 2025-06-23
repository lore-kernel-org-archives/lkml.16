Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9202C2D4B4F
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 18:32:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750703575; cv=none; b=MXs2dh2DM28AeFw8BqpgFlnfNCyLeK3lmcv0bweYhHHehi0aiAe9kENG8UV33gyfsR9iZdJ/bzI9XbxhnAzMzqvQTBdTSaWiYtZPwJTBbBvC3tAD7B7pjNPEUETEqsSojY4UejhFGZs85PYbzzX1Y+a8qeg8l5al3juauZvvHq4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750703575; c=relaxed/simple;
	bh=j7unceZnAbI/jKhe8OzwmUSk4YWeCfoezAT5k/+mbtE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=f7MHpf3xZr0E8Qh8LUtnHot5NcNYeT0yMikRmOMc0hcKLhEn8+YyyYgE6zxGz0JaNqEAR8pkOM9WHnKjynRW8baeO5ACf0tJRcPhUiPzwIpPhTkgGSTqIUZVhXaZYpfYQjX/jjeAeLuLhP38LTHGu1lMuW28uOPnDduAizKudS0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=oktM75/g; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="oktM75/g"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b2fd091f826so3453272a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 11:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750703563; x=1751308363; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kruPxOyyvUJ301Bt/UNLMGQOlJa4yMmtInWP2erojtI=;
        b=oktM75/gX0q64JpCspfA1o9oi9xpCBQhBl2Atw6MTKYMDyZama9AiCbmoa4CTdcFDr
         GwnDI2oEmuBApWVDWD0CDa3QLA9AJ9etfDpMu19SIgIaPlwtuSTVzQFAFNq3JhEdXnTW
         SPwmvc/mfcq7qeHK17gIjmJAe4jfxZqkcuWTRymHCXGLUU2803QLYCNdqnICwyr3FOgH
         ezotd3M9kR+KuO9hyf5b139n8HxRQdTIEIJi6sU2h+Pr6XUu1Lq0RK8fhrlxewOKEPbx
         VHrsiUTWDujiR38kSZgKkpi1VbpUtAyRIo3WFZQycKymwyiQW72Lj397CWruopM1Y3bA
         rMNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750703563; x=1751308363;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kruPxOyyvUJ301Bt/UNLMGQOlJa4yMmtInWP2erojtI=;
        b=KHv9Z3SBrb5aMHJFCKPzXYRR7uiOBhWH+3XYTDVNeT7ygibZUI2Icohm6NbN77SrR1
         cBsSVxmtExVMLKQ9O/L72Q2F4FIpSxBlH7bUhwxJkv2327NJheNZH3fZIBfP+ljBNoWz
         Me4MLowCB2EmXHxHrDoxmACDL73bP3Dd3fPNNfG1u6fuLpt+qUu8Q9MZvrLpowUagyxj
         t8UKDe5HDKGqa0yj6HWYo+BgR4FVFbC2NaUr6zUTbDtK7JUKCIHD1KOeQ+nF8UIfrp1Y
         /G6pcPX+qorcSXpywbHhhdbT3X03577eR0T0tnN0liiRaqlEuaodvVMnQ32FrcZ2dhx2
         xonw==
X-Gm-Message-State: AOJu0Yy87tSS8R6oCid9Uh7deDWUe3XIqBz0bUffG0ixov5kTihzqH53
	Jcb6+SzjPRBg42Of+c0A1rVIdSGuRK2Y9i8PAewT72/3Gg9F9hy/1+2zlGHsfyCISL+yiZxq8U6
	BQjEhMPXT2ystKbGluqhIhe4CUJcqCnGHm8G5zI02RcESJEB5nXANF9fM2A==
X-Gm-Gg: ASbGncuNX1VV0YkmHeDYOEAlU7pSkXUtmtM+i9yNS28kn5+0CRePURfInJFXL+59V0W
	7Ns3dCV8LDP1csA2JAVkosSqHP4GFcJfXTeJjOk8jGftwSKy+rymboBpJiegf0jLdyRAyVZSTdC
	dPMSGGcbUlGCeA53J51pUwE2FAqkk2FNbdTZFM1G7dsZX/Wq7ZiwVfrhBIjaB0STgujDbKnv2ax
	8SH
X-Google-Smtp-Source: AGHT+IFN+MuBxJ+QUL+UQe2hu7b0+Ppkb80MQX/ZVfwxCOW2lGiDat39qnGph06M7YMdl+YKMYdCUOnoxk8zPjTW19g=
X-Received: by 2002:a17:90b:4fd0:b0:311:a5ab:3d47 with SMTP id
 98e67ed59e1d1-315ccc48857mr832647a91.1.1750703562413; Mon, 23 Jun 2025
 11:32:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 24 Jun 2025 00:02:29 +0530
X-Gm-Features: Ac12FXz8Xagh8-R9UdOPbyOpKzegWYcA5INp1WSEVpTVF86rd3gJifht0qGqOmw
Message-ID: <CA+G9fYv2i5AOYOkepUq_Rz1wxfzu1o2W59xDgui7VPw7g-fV9w@mail.gmail.com>
Subject: next-20250623: riscv defconfig raid6 recov_rvv.c use of undeclared
 identifier 'raid6_empty_zero_page'
To: open list <linux-kernel@vger.kernel.org>, 
	linux-riscv <linux-riscv@lists.infradead.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>, linux-raid@vger.kernel.org
Cc: Song Liu <song@kernel.org>, yukuai3@huawei.com, 
	Chunyan Zhang <zhangchunyan@iscas.ac.cn>, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Charlie Jenkins <charlie@rivosinc.com>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv defconfig builds with gcc-13 and clang failed
on the Linux next-20250623 tag.

Regressions found on riscv
* riscv, build
  - clang-20-defconfig
  - gcc-13-defconfig
  - rustclang-nightly-lkftconfig-kselftest
  - rustgcc-lkftconfig-kselftest
  - rv32-clang-20-defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: riscv defconfig raid6 recov_rvv.c use of undeclared
identifier 'raid6_empty_zero_page'

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
lib/raid6/recov_rvv.c:168:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  168 |         ptrs[faila] = (void *)raid6_empty_zero_page;
      |                               ^
/lib/raid6/recov_rvv.c:171:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  171 |         ptrs[failb] = (void *)raid6_empty_zero_page;
      |                               ^
/lib/raid6/recov_rvv.c:206:24: error: use of undeclared identifier
'raid6_empty_zero_page'
  206 |         ptrs[faila] = (void *)raid6_empty_zero_page;
      |                               ^
3 errors generated.

## Source
* Kernel version: 6.16.0-rc3-next-20250623
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
* Git describe: next-20250623
* Project details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/
* Architectures: riscv
* Toolchains: gcc-13
* Kconfigs: defconfig

## Build arm64
* Build log: https://qa-reports.linaro.org/api/testruns/28829977/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250623/build/gcc-13-defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmqfZ6v24dxq5kjorJbgH6hC8/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ytmqfZ6v24dxq5kjorJbgH6hC8/config

--
Linaro LKFT
https://lkft.linaro.org
