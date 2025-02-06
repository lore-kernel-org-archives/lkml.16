Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4C7F226882
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738841847; cv=none; b=hXkuHCoIE9nOMmXYEbPAFKmJ1t6J2Hb0Y1cnxsXugBrH0ShcCZMeCzK5lbGKp1tomnSBsju0lzVyLZ2+0+0m9+uQBwNpRJpFUQfj28AL0e++Ml/3s3ANM9pVFAm8Ug4u9U/27YDiJ9hvmglrPja824Zho5TwI4a/VJB+pGL/SYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738841847; c=relaxed/simple;
	bh=WcbLGJwq4AcwSHGQ2m2Nfejx19QckbRwA20i/pxYIw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qw7CnsjrQlyG7wvHwStDMsu4qwTmt/np9wV5du9KQ735beLkY4hvvTeTalqfK12krkAOP4+42m7hrcW/HvAKRAK/gM8vcWJQVqN33J4tQ5fRtH22iLx/sxbFNIwNrzz6FwdIfs2JFBN6aaOSibV432245/0f/3oICw8TEnyoLqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=IhxYRS5F; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IhxYRS5F"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38db570a639so429278f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 03:37:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738841844; x=1739446644; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D32KWc9ir9C0HEQYeaVgTviYL0YqMb8Z6Iw4EEOaB2A=;
        b=IhxYRS5FksK4NkBSBeTMULk6t6yY24snfJhlFOVImQSq9lbhsJIK5bEe082aq7PZpH
         PQb5MmK63O9fEra//4k60rbg51EslyKt7U1gFOZJcC6HN3feitWoRtxgtp2Dks4I7FFY
         GG+/27dkkaPQePAOn4y2frrlZ3cDv1dLC6SGYrQwWuS8WTASMW33TbkbyyYjBiH1hWsz
         Pb9Wfjq+j4pqt2j32n2me9zKoxwauJEodYaPX+Uptg8aSf/gE4yfwFLZya1IXTSXl+qt
         VqaR4DveqMd4IXC+gqvvFIXFXgZPLpkMZ+miQRe+rX/xjugeh46t/6Mm1np/M7CWpOWT
         EMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738841844; x=1739446644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D32KWc9ir9C0HEQYeaVgTviYL0YqMb8Z6Iw4EEOaB2A=;
        b=ddUXwGanMInEVzQsahm+pJcuGFU1vprwbvpby9/cuKl8YuIkr8mZwBtHHfBsWlIlnz
         z59+Z5+RoQUjXMqKyWcnQtno5LETBwsFS5DQoRs8dMvc07bR/0sH6hEJA4cEokgiIz9h
         i/+8djadN+br+6JVhcYCtxSOHMNSZ3VF0xPN81O6OCZFmaJ7hbg5y6V7xnWI1hIgUXvy
         ennIP+or4lqkxShHaFoiTlUaIEZBAi3ti1cbz++GatDatQ+iMfJDEcOnVCOukveCD3JX
         rzosio9KTewTiC5mhE9aEVg4TdOHh65WAwCX0DXoG3SQBNfd9YxsqTY8Mnc4dSvDJXjO
         vceg==
X-Forwarded-Encrypted: i=1; AJvYcCUk/rkEYZXoPWXSAleJNOuVEqoyyAIZP5hlasO+sIB1BcAenf7mkCbhhn700Gj7aQBToq/vlauL91ZlpLk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBuZXPH5GvIqDSHDhYQpb2fCUDB1MB4p9W35SVi8k6Q4pxd6Mx
	et8CAmaNh9H3VQrytrBBR6lK1SysNYyZDOEhe4YmRIBD0A4KKXXQcDcU7+c3Ni4=
X-Gm-Gg: ASbGnctLRfUD7gFqRBQdmRpKtlwjk+UnI7op1Bnsc6Y/ncjVg3h8V7K42d0zK0uksqH
	yzyZJm2PUpsIN8EbgRCDNnD38xrgkEvZYF0bP8+K1g71GF95+p2vkXW3KBzJhnn7KVrxeAO9+Xc
	H0tLA7WIukrByWtm65nz3nmgdXTglm6aQnPATnXxU9hEAqcmADKrqa2wwqFVfe3p1PtJNOxsMZ/
	Ec2Xwi8Fl3o7Abn1vUgxvDnR9kgY7s5u+gwOg+D52gKVav8wWISZmgI8U67b5CUX/AHYCRJbx4V
	ZI6Qj0LybIZmCRj5YQNA
X-Google-Smtp-Source: AGHT+IHpYvv/zDG4i03lgS2R3xg3LkmpfRk52jhg17y5N5GeiW6M8nXkkM0Wq0CqmV8YB3R3Sm/1rA==
X-Received: by 2002:a5d:6d06:0:b0:38a:906e:16d0 with SMTP id ffacd0b85a97d-38dbb2ced02mr2406806f8f.21.1738841844030;
        Thu, 06 Feb 2025 03:37:24 -0800 (PST)
Received: from localhost ([2a01:e0a:af6:67e0:48f1:a46e:2623:227d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38dc2f6aeafsm625513f8f.20.2025.02.06.03.37.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 03:37:23 -0800 (PST)
From: Theodore Grey <theodore.grey@linaro.org>
To: gregkh@linuxfoundation.org
Cc: akpm@linux-foundation.org,
	broonie@kernel.org,
	conor@kernel.org,
	f.fainelli@gmail.com,
	hargar@microsoft.com,
	jonathanh@nvidia.com,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	lkft-triage@lists.linaro.org,
	patches@kernelci.org,
	patches@lists.linux.dev,
	pavel@denx.de,
	rwarsow@gmx.de,
	shuah@kernel.org,
	srw@sladewatkins.net,
	stable@vger.kernel.org,
	sudipm.mukherjee@gmail.com,
	torvalds@linux-foundation.org,
	dan.carpenter@linaro.org,
	anders.roxell@linaro.org,
	arnd@linaro.org,
	david.laight.linux@gmail.com,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 6.13 000/623] 6.13.2-rc1 review
Date: Thu,  6 Feb 2025 12:37:21 +0100
Message-ID: <20250206113721.2428767-1-theodore.grey@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205134456.221272033@linuxfoundation.org>
References: <20250205134456.221272033@linuxfoundation.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Regressions on the arm64, builds failed with gcc-8 on Linux stable-rc 6.13.2-rc1
But the gcc-13 and clang builds pass.

This was also reported on Linus tree a few weeks back [1] and also seen on
the stable-rc 6.12.13-rc1.

Build regression: arm64, gcc-8 phy-fsl-samsung-hdmi.c __compiletime_assert_537

Good: v6.13 (v6.13-26-g65a3016a79e2)
Bad:  6.13.2-rc1 (v6.13-652-g32cbb2e169ed)

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

* arm64:
   build:
    * gcc-8-defconfig
    * gcc-8-defconfig-40bc7ee5
    * gcc-8-lkftconfig-hardening

## Build log
In function 'fsl_samsung_hdmi_phy_configure_pll_lock_det.isra.10',
    inlined from 'fsl_samsung_hdmi_phy_configure' at
drivers/phy/freescale/phy-fsl-samsung-hdmi.c:466:2:
include/linux/compiler_types.h:542:38: error: call to
'__compiletime_assert_537' declared with attribute error: FIELD_PREP:
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
make[6]: *** [scripts/Makefile.build:196:
drivers/phy/freescale/phy-fsl-samsung-hdmi.o] Error 1

## Source
* kernel version: 6.13.2-rc1
* git tree: https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git
* git sha: 32cbb2e169ed556d3d60e8ea56a138cef824a28a
* git describe: v6.13-652-g32cbb2e169ed
* project details: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13-652-g32cbb2e169ed

## Build
* build log: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13-652-g32cbb2e169ed/testrun/27199349/suite/build/test/gcc-8-defconfig/log
* build history: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13-652-g32cbb2e169ed/testrun/27199349/suite/build/test/gcc-8-defconfig/history/
* test details: https://qa-reports.linaro.org/lkft/linux-stable-rc-linux-6.13.y/build/v6.13-652-g32cbb2e169ed/testrun/27199349/suite/build/test/gcc-8-defconfig/
* kernel config: https://storage.tuxsuite.com/public/linaro/lkft/builds/2scp7tWHD0J3Iyj4KIMuqDUMKSF/config
* architectures: arm64
* toolchain version: gcc-8

## Steps to reproduce
- tuxmake --runtime podman --target-arch arm64 --toolchain gcc-8 --kconfig defconfig

Links:
 [1] https://lore.kernel.org/all/CA+G9fYsHGrgZsEEVvP0XMcAhLyCYnrCPgZJ1puT6cfQBCGUB9g@mail.gmail.com/

--
Linaro LKFT
https://lkft.linaro.org
