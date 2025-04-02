Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EA3521B199
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 12:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743596524; cv=none; b=VTMmn2yRLmYnF17iUzzkWhj01Mp73XGYqYrnsAGxqDSsHYsvFPQEqj4oy4KBcfSN6709SStrkic2Bicae5JoV71wh5zmbd8oDG/H09FdTZAEFZ/dFzQAUld7GNU/D44eapJxtDeN88aEjb6MLQwJzPsO6cDFAqPWfRZNSh9AEFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743596524; c=relaxed/simple;
	bh=hFmt9tVTbnzz6IMTCrEPKn6NiL3yOalLnxXBtm1hJ0I=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ue638SB++qt6MrKykURhggeI6/xg9GNBQ9NWCeQ6mE8ewtBH/l6Qw1/NRMyQHUNiQfJPiwROWVCpBcdGHAIOe+/tZ9ciUn5SX94URbfpGejkwjZ7GbP8bO8v+jKtubE9Iq0P4O+t1Xzqa8Zf0Ow7FBi0jdj03vc96uWKDz3rG3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BV3YxtRH; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BV3YxtRH"
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-525da75d902so2857961e0c.3
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 05:22:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743596521; x=1744201321; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=;
        b=BV3YxtRHwmumFk4OibmAdJCeTgwWG3pKwGnOwegbztZp6nmrtL67W4+P0p4hClb/WF
         SdtFnXuDSP7VJG6GtRfAHHpGzvC0KAxw5hODZ8mVXBb8vlIIWbGrL+9JUQ8/AcpMNarm
         4vVxjyIB0j2LlB8LLhCgORbnSnff/f4pKepG/58wL9pnPQgIcYH04ay/GgR3DegiBrbO
         IHPq/PpVKqQnM4SAUA9bWK43EdWcRWj2ZTNy3uCM9MEcS9CEdHoHZVICBBsa9Zgfl9qv
         INpQoNalbSjITd8GgEpUHu83+uyPm8HVq4ZcKeXrzZumbYVXSlzC24Ak3keH/HcADeQj
         yqwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743596521; x=1744201321;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qD/PMOyx9XK9R1d/xQ4M0XKWGpm4ZEHxb/f9TzxVDzc=;
        b=cY2NZvwNdGC/igzxPzZNg7wCYWY7J2KdMJIrYxi3V90SVv/RCKV1dFWacM1zRShrCZ
         zzPnIjKsHA6yHYWHTNYxyh3vXxGL/U3wOkZ7kzkOk1dZD6GYD1zMRuFIPj+muRQ9UUbT
         SsriEIZ8Ci7L+Toj5P/wFwiYk6U3vR9TIipHfUa/HdWlMqGBc+KGEfRzLdKPkWoequ1J
         VpeWUiiJ/hnzCe8Dp4HJMLa73u4dsuQcEso7L5YpUUE/TtwETcLwHVdg13+BDbTwg6LC
         8PMYRjyypnl4p3SRDtso5RHzKytJO3YNOCwHS7Wk1HQPKofl6VDRaW5gqI3MTdK4G5aj
         enhg==
X-Forwarded-Encrypted: i=1; AJvYcCXeIdsiP3Zapzjs7jcxkt4aGpEttQRuwPjT5OJSF8YfCKno+hsSKwHTLL91f1TmnX8SWBnzuPYSrURDmeU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwC3l8I0R04Bk+apB0C0zs6Qb+sZXlp/PCXnfxZa6X5c1IRGJK4
	eixf9NuPg+9sZKQHh8V44NZg3R76dJUichryJiiZI7uQI6WgP1Gh+zGqk9mseFhAuQs7XJ816z8
	j41igRPIhF2BVWpPgyPeBZdNqIlAK7sonKZRLuQ==
X-Gm-Gg: ASbGncvumTnx5YuGpWgPFFGo8uOe7tvGIYz7MBs2tqiPx7S0urruhxek6OZuP2Rc0lS
	ZVSoOYMjDJ8fkym+Wcis0BkrbunCR6UDucQa4TheStKNI2L9JGONwCh3LgLTQiTK74eBT0ScqFk
	zNNmjeEloftILnp7ISe/RQutGrcJ66nv7dxlMJWnyHawTK+aUpO9db24cOMzM=
X-Google-Smtp-Source: AGHT+IGZd1b5fqfa6pHXvxexGDlAKss+FYCovowlkAi3Xj1GtUKyZmc4loNHv1qXkrx3HBYz8r1MbDuMAFYoP6L8Qfw=
X-Received: by 2002:a05:6122:1ad0:b0:525:9440:243c with SMTP id
 71dfb90a1353d-5274cfb95a2mr1043348e0c.11.1743596521224; Wed, 02 Apr 2025
 05:22:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Wed, 2 Apr 2025 17:51:48 +0530
X-Gm-Features: AQ5f1JqYWbXD84vj9qiHXH7fpaSiEYXFSjnm4-yFz-CnOCSphgOZJOvkdDjcXGE
Message-ID: <CA+G9fYuQHeGicnEx1d=XBC0p1LCsndi5q0p86V7pCZ02d8Fv_w@mail.gmail.com>
Subject: clang-nightly: ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!
To: clang-built-linux <llvm@lists.linux.dev>, Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	linux-s390@vger.kernel.org, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org, samba-technical@lists.samba.org, 
	linux-cifs@vger.kernel.org
Cc: Steve French <sfrench@samba.org>, bharathsm@microsoft.com, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Nathan Chancellor <nathan@kernel.org>, Shyam Prasad N <sprasad@microsoft.com>
Content-Type: text/plain; charset="UTF-8"

Regressions on arm, powerpc, s390 defconfig builds failed with
toolchain clang-nightly on the mainline master branch.

First seen on the v6.14-12245-g91e5bfe317d8
 Good: v6.14-11270-g08733088b566
 Bad: v6.14-12245-g91e5bfe317d8

Regressions found on arm:
  - build/clang-nightly-nhk8815_defconfig

Regressions found on powerpc:
  - build/clang-nightly-lkftconfig-lto-full
  - build/clang-nightly-ppc64e_defconfig
  - build/clang-nightly-lkftconfig-lto-thing
  - build/clang-nightly-defconfig
  - build/clang-nightly-lkftconfig-hardening

Regressions found on s390:
  - build/clang-nightly-lkftconfig-lto-thing
  - build/clang-nightly-lkftconfig-lto-full
  - build/clang-nightly-defconfig
  - build/clang-nightly-lkftconfig-hardening


Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

Build regression: arm powerpc s390 modpost "wcslen" fs smb client
cifs.ko undefined

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log

ERROR: modpost: "wcslen" [fs/smb/client/cifs.ko] undefined!

## Source
* Kernel version: 6.14.0
* Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
* Git sha: 91e5bfe317d8f8471fbaa3e70cf66cae1314a516
* Git describe: v6.14-12245-g91e5bfe317d8
* Project details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/
* Arcitures: arm, powerpc, s390
* Toolchains: clang-nightly

## Build
* Build log: https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/log
* Build history:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/history/
* Build details:
https://qa-reports.linaro.org/lkft/linux-mainline-master/build/v6.14-12245-g91e5bfe317d8/testrun/27856145/suite/build/test/clang-nightly-nhk8815_defconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdO7KHQCCZBICM0MvpaTUbLm/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2v9EdO7KHQCCZBICM0MvpaTUbLm/config

## Steps to reproduce
 - tuxmake --runtime podman --target-arch arm --toolchain
clang-nightly --kconfig nhk8815_defconfig LLVM=1 LLVM_IAS=1
 - tuxmake --runtime podman --target-arch powerpc --toolchain
clang-nightly --kconfig defconfig LLVM=1 LLVM_IAS=0
LD=powerpc64le-linux-gnu-ld
 - tuxmake --runtime podman --target-arch s390 --toolchain
clang-nightly --kconfig defconfig LLVM_IAS=1

--
Linaro LKFT
https://lkft.linaro.org
