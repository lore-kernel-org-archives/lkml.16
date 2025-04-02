Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9585BAF0
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 13:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743600037; cv=none; b=orS/A4tE83A3x6eh3IXtXP7+DuwUsbKI4c7eAGpkFEypUPPjSZHezyALRaGyC3NzKmJ0kZQBPUUhjonsMCH43yvV1v1ddzYO6UbUS/t9xhrNccFzZJajIs/BYl+3zozkKOQ6/Nxzz+A+IHOr5eX1rz2+fjKXDLkqdHioZQbJsKw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743600037; c=relaxed/simple;
	bh=N+huIrTauyuCYVT6DvX3IHTIVyunCkxZO6lbTCo1G8w=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZukLxayNC+MsPyyPinAFFx69zN8bgFJC5g0dsmTs2GxykQSVmYcHdg3W6WlZT1FqD4qgZ9mP3I0jznQ/ssMB1NLbtEQNIM74H4r8c7kd85a8S83r18lpAJGRprefB+oStlvC9PGnn3c5GEAvHCRimQA3BaiC+ynn4tVDZm3FtkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dZMuVrTM; arc=none smtp.client-ip=209.85.221.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dZMuVrTM"
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-523f670ca99so3111715e0c.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 06:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743600035; x=1744204835; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=In+1Y69nMBfgKqa4StrtMwmuVIRitgkzeLMrf8QA0XQ=;
        b=dZMuVrTMhF/WYw+fikvyqLZDkQgC7UaeFS2arnGqdumjbwd0CVkXkdbhOq8diJpDsQ
         I+BZtrH47yfjTX705Rb0GIkzn7Bs7eDmqx4u9jrwFTWJMMhD4+xsg/Xolf3NbYMorUkm
         VxOogSXzGW2oSafbMY3w7PWabZ4n+GBFAUWWYv5o6+YpR1xemFFxySPK/IPh4IyuCTGp
         fEu379dPfrVRwRdSzhmKyjBCuySMQ1NooIIZncDdbt1fEsuWqwCh3/SM+EJUdFHo80ps
         EAUBWp1DVhDcEIoj+I24tbpI50MFlmFdRcU39rnVkrt/t9Spge/e2xuO1Dbj5Dlyb+nJ
         BBWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743600035; x=1744204835;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=In+1Y69nMBfgKqa4StrtMwmuVIRitgkzeLMrf8QA0XQ=;
        b=pIaYAxt1Kv5d46n6cUIZWwA3CS0528rSNQ8GkMhmDjvQZuH9xVfARsSWWAmbcqcUg/
         7EJt11OWNMNDxAaNs8ac/0oUsNc05fwQPw0ZtuPlkGG2RKK5FsDfE/nQdQ9o9kypWZMw
         dl0pIcd5PkCHll0SpRFe20NfS+Unsl6Jm7S+OMt5ZyVhR/3pHrZJn8XCGxgUvU8tERYw
         5AMbAJ+9uaiXrZMGYhrWhVRxqT66TAhmxsa9Xzu/mrazzvaRZXrslsPxVwxIMjJe+mwK
         BQu4e1fxraGZEgV/bI5JB0vSI+ciI/Jkw6Sr9onmxBDFtk5sqxJLgHQqvbyGojBt0XAj
         EYzQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6wqL+zvfZMlqzJIj3GXYxFmJL4a+u3iVVD/0jd5VmbWNfZqIWN6Jxsto3F4YtH4GdxAk9c19UnIn5+Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjKbjQNFCQq9XE8l1jkVL3pBzO/9kEi25S91CxyWb89gV/B7N1
	EOyXLhYaUk3HcR5gunc6RAHWRTKu1qy9/zFgl3Byp8nQZOJ5UdbpJM+Hjs1ge1fgPWdgdWSS2GQ
	QWygn2lurg0qEnmucnsI7Axp4ZqsdPR9h5EsQMA==
X-Gm-Gg: ASbGnct9MBp5XSyWi6/vWU0/46ThKH8CDKTcCXnfuncGJyDwgZfhRujg+FEVXdIIR9X
	PhjCz2hRvtACXvaDwUZsoBi6JXkYLYoUs5d5rsYMGG4E9uj5NsKtpyoJ1wySyd3NGkDPP160ILd
	ZduGw1OI8QHvcK+g1MMr2lYXYhqEt+9unwXwa7+8YECXLUh2/jiHg9MjuMz2M=
X-Google-Smtp-Source: AGHT+IFsHe2qgE/3dZ7ATZQlTlH2f6sgRKoBUonASYXuz0Bb/UAqUiZV1X4Y0sczKgfKtwF36TiHquI/NJM5jnDcsl4=
X-Received: by 2002:a05:6122:249a:b0:526:42c2:8453 with SMTP id
 71dfb90a1353d-52642c2849fmr5205649e0c.7.1743600034755; Wed, 02 Apr 2025
 06:20:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 18:50:23 +0530
X-Gm-Features: AQ5f1Jq96Wf-mikRgwQXfn81V0rc9lAZ1ueGPOm8SXNAmq3Q4b2XBmmyCtKsgkM
Message-ID: <CA+G9fYug_77HoqyonvsnJiya2q+0-hf9k4Yjk_dDn7P91Sq+3A@mail.gmail.com>
Subject: next-20250402: riscv/mm/tlbflush.c:195:23: error: 'start' redeclared
 as different kind of symbol
To: linux-riscv <linux-riscv@lists.infradead.org>, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="UTF-8"

Regressions on riscv builds tinyconfig, allnoconfig failed with toolchains
clang-20 and gcc-13 on the Linux next starting from next-20250328.

First seen on the next-20250328
 Good: next-20250327
 Bad: next-20250328..next-20250402

Regressions found on riscv:
  - build/gcc-13-tinyconfig
  - build/gcc-13-allnoconfig
  - build/clang-20-tinyconfig
  - build/clang-20-allnoconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Boot regression: riscv tlbflush.c error 'start' redeclared as
different kind of symbol

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
arch/riscv/mm/tlbflush.c: In function 'arch_tlbbatch_add_pending':
arch/riscv/mm/tlbflush.c:195:23: error: 'start' redeclared as
different kind of symbol
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                       ^~~~~
arch/riscv/mm/tlbflush.c:193:53: note: previous definition of 'start'
with type 'long unsigned int'
  193 |                 struct mm_struct *mm, unsigned long start,
unsigned long end)
      |                                       ~~~~~~~~~~~~~~^~~~~
arch/riscv/mm/tlbflush.c:195:31: error: 'uaddr' undeclared (first use
in this function)
  195 |         unsigned long start = uaddr & PAGE_MASK;
      |                               ^~~~~
arch/riscv/mm/tlbflush.c:195:31: note: each undeclared identifier is
reported only once for each function it appears in


## Source
* Kernel version:  6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: fefb886b1344e222b3218f3c0165b0fd770e8b88
* Git describe: next-20250402
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/
* Architectures: riscv
* Toolchains: clang-20, gcc-13
* Kconfigs: tinyconfig, lkftconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250402/testrun/27859100/suite/build/test/gcc-13-tinyconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9owDFW4gzrtyDZItZlOSzN7Zd/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9owDFW4gzrtyDZItZlOSzN7Zd/config

## Steps to reproduce
- tuxmake --runtime podman --target-arch riscv --toolchain clang-20
--kconfig tinyconfig LLVM=1 LLVM_IAS=1


--
Linaro LKFT
https://lkft.linaro.org
