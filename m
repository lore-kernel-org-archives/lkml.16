Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15A631EEE0
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745909312; cv=none; b=CtXLi7q1VgfzpPgyi7Jb0eJPqjCqv6dfpXiK3Pwv1k+kXJlELLEbPdtNxigqNF6XL5DPEfF134lWUx+ZqM9m4/cM3BaYHCFOprLvca+DHGbws4cfcHYxxXBhjS224jXkoY3xlgDjrCNCYg84Yzns5/5J2+1DrMosiaZUnqZQX+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745909312; c=relaxed/simple;
	bh=9CyJ9vrui2u8M8iSVZFuwmIfqoRlB9IonBcSStjHu8I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=RGm2SfB9RiTDcnTqRB5swclCOpaq9Q/Q/4rn/Rj5WnXbVC2eaowZfW4mM6BkIgkmHRKjZdFZS1itfxk7eOQyUTgQjeNgjmDk5MIQGhRXQMlbhH0BMS04xdFho1VL2cVW29pCfreoDMKeqp70dx7SZv+mNz4OcjWJ86Ad02ExGHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=iyT3/HZg; arc=none smtp.client-ip=209.85.221.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iyT3/HZg"
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-52410fb2afeso5551716e0c.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745909310; x=1746514110; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=sXi/SUjRC6MuKQgZypsU6mTKwVzFc0J4r/au1GEfB6U=;
        b=iyT3/HZgpiqmf7DF03di20xDkVBEbYu1C+QZNAiQqhAxDSO1UPEhw+NA4Vxa2dIWy7
         4cbL3hUzveYTlhwcg1p7NcPt1aC2/MPVmnkzmGkron4plEboNAkRtvOSV/WNE9XIMjSt
         xwv9+t2G58DRlPMGB0XPLbeVWgaxNyP9R9Z18PHhcY/7G2uchOLIfpYPA7iWVTNqTY7I
         rU6bP5s/WorU6jmn2JTB7DDtIZQ/HmjH7xBjtOAYsfxXsaqnRCXQLXDI2mcnpnvsx7fH
         QU/oCryrlLo+gsFKibT94x5udjn1HVT9XJXpo1FRPxhCq0C0iQc46eUwbXA/DrOzGpSt
         D3vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745909310; x=1746514110;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sXi/SUjRC6MuKQgZypsU6mTKwVzFc0J4r/au1GEfB6U=;
        b=gDN41stMFSCgXlK54ggP7Ii+2AtdsOFe+PpCsu0GR8bPWp4KK9ux/nPdYs/7oKqdNP
         RlJpf+bbTOUszd3LPtro6KNxG9XTqdAlnE1V7R4G5R1aDZU0zWclLI4K82zDLjTFj0Sr
         maA6xNbO1Wi+Ial64ODIpraYGFS5yLt/3ImU5D8qK7pDkd3+y0SNvkOjcKmc2KhEyqMZ
         e1CyM0yu50qwz5CT3vg0IUbv/GTg497QVjA5SQ1M/50pqaB4iVZJAKysyBvcZ17sgCDp
         JSfD+6QbpzmonAvM8SPqZ6HpG2ise2z+eyka4p4+GG99y3cKEZqex/f8tewAsyDCYCPa
         S1wQ==
X-Forwarded-Encrypted: i=1; AJvYcCVW6IH5XMT9cNpvsuCPKw+5MugL2G+490hRZ7qOzPlskAOVUtJjjBXyj5Z9OMdHXvqgaB368PPIVGLiW8g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQqxvbHB+Pu40ypCt8qdPkIXPJiUhZLqg8AtQyfk2nseXYz7Aa
	EEzQBVWPqCWmV9ivNuFKUVD7dxjjwIDlrF0wko4Ly+/yb+sFqI3mnct4GKaSCd7wLQ1S+sPJLdR
	SMPem6l0zSuq2ULbQCfeo4OngqHHA0F+WGXiABw==
X-Gm-Gg: ASbGnctv9obgfUZ3dr0fK07ujFnPrZ+r0kAr635k5sEsGPB5yfPfNmUsCdceaa0Bopz
	/E6Tjjdchw8DewB02Vwt1yZVXF1C+4jVv3CHD5eC04WxMaS1EshGcSkquFi2rzMjbffLVkdIE9H
	x5feQ/PB+skkD0Lm025ULRIheiImJSdGzR5neCh7+ds+aIDHCfIT/A2vc=
X-Google-Smtp-Source: AGHT+IE/wW4rey32KhYXnxm7YMuvinzWZGvhxBn7qZf2ls6SaJNTx93pWcEcAKsoRl631YWuZ2kxHHUmOj06rOZzMfs=
X-Received: by 2002:a05:6102:3f12:b0:4c1:71b6:6c with SMTP id
 ada2fe7eead31-4da7f52f85cmr1891727137.7.1745909309952; Mon, 28 Apr 2025
 23:48:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Tue, 29 Apr 2025 12:18:18 +0530
X-Gm-Features: ATxdqUFl-SyW1AweGtS7b9hyai4LUeaBQ5GoyXRjUVKMKKGjw-9Kv4VCa9Ay_TE
Message-ID: <CA+G9fYs+7-Jut2PM1Z8fXOkBaBuGt0WwTUvU=4cu2O8iQdwUYw@mail.gmail.com>
Subject: next-20250428: drivers/net/ethernet/qlogic/qede/qede_main.c error:
 field name not in record or union initializer
To: Netdev <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Anders Roxell <anders.roxell@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm64, s390 and riscv with allyesconfig config build failed
with gcc-13, clang-20 and clang-nightly toolchains on Linux next-20250428.

First seen on the next-20250428
 Good: next-20250424
 Bad:  next-20250428

Build regressions:
* arm64, build
* riscv, build
* s390, build
  - gcc-13-allyesconfig
  - clang-20-allyesconfig
  - clang-nightlty-allyesconfig

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm64 riscv s390 allyesconfig qedf_main.c field name
not in record or union initializer

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build error:
drivers/scsi/qedf/qedf_main.c:702:9: error: positional initialization
of field in 'struct' declared with 'designated_init' attribute
[-Werror=designated-init]
  702 |         {
      |         ^
drivers/scsi/qedf/qedf_main.c:702:9: note: (near initialization for
'qedf_cb_ops')
drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: error: braces
around scalar initializer [-Werror]
  206 |         {
      |         ^
drivers/net/ethernet/qlogic/qede/qede_main.c:206:9: note: (near
initialization for 'qede_ll_ops.ports_update')
drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: error: field name
not in record or union initializer
  208 |                 .arfs_filter_op = qede_arfs_filter_op,
      |                 ^
drivers/net/ethernet/qlogic/qede/qede_main.c:208:17: note: (near
initialization for 'qede_ll_ops.ports_update')
drivers/net/ethernet/qlogic/qede/qede_main.c:208:35: error:
initialization of 'void (*)(void *, u16,  u16)' {aka 'void (*)(void *,
short unsigned int,  short unsigned int)'} from incompatible pointer
type 'void (*)(void *, void *, u8)' {aka 'void (*)(void *, void *,
unsigned char)'} [-Werror=incompatible-pointer-types]
  208 |                 .arfs_filter_op = qede_arfs_filter_op,
      |                                   ^~~~~~~~~~~~~~~~~~~
drivers/net/ethernet/qlogic/qede/qede_main.c:210:17: note: (near
initialization for 'qede_ll_ops.ports_update')
drivers/net/ethernet/qlogic/qede/qede_main.c:210:32: error: excess
elements in scalar initializer [-Werror]
  210 |                 .link_update = qede_link_update,
      |                                ^~~~~~~~~~~~~~~~

## Source
* Kernel version: next-20250428
* Git tree:  https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 33035b665157558254b3c21c3f049fd728e72368
* Git describe: next-20250428
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/
* Architectures: arm64 s390 riscv
* Toolchains: gcc-13, clang-20, clang-nightly
* Kconfigs: allyesconfig

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249321/suite/build/test/gcc-13-allyesconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249321/suite/build/test/gcc-13-allyesconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250428/testrun/28249321/suite/build/test/gcc-13-allyesconfig/details/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2wMJhRaVybixSxTSIyLTw8JqNxe/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2wMJhRaVybixSxTSIyLTw8JqNxe/config

## Steps to reproduce on arm64
 # tuxmake --runtime podman --target-arch arm64 --toolchain gcc-13
--kconfig allyesconfig

--
Linaro LKFT
https://lkft.linaro.org
