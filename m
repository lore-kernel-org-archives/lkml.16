Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09E2C2E4252
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 12:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750075604; cv=none; b=Lb7xcDw/l2KFEJSapTIOdzaTXiro1FXrLmZTTjaAKk4zyv6Igznpyiqpf9nHNQ48siCPmr/ZitPFzPJZxsneWxuahK0GWPK8mH0+I5KN4urinpe1PlDUV7MxPsTYw5er8bjvmsxECkkA1HM9kxEuBaU5sIZh15eIARH85kFFxTI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750075604; c=relaxed/simple;
	bh=IbZZvF1YeIlcvUq/+fdnzFkqnxbyQDarbgl2bwQ6gi0=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=Rcnx9Tgg25XEZtcFkbMnixLTYKkG9dA72dpTH9KUhVEMpv6XWob/bfL5PnRS6NnQiGUHZsFoDVpWO7idbREocEPUhJKq5BP3gyulwgAL01YXsmdhB22eWCge22GRFh4ZZ8MrFvThp11Hl5H0bocSNeP/TaBIQ5Pasou537GFhJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QabkmsMZ; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QabkmsMZ"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6faf66905adso23754366d6.2
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 05:06:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750075601; x=1750680401; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TpU5wAMG3sQlhcsZQZqrmEByJp0SllVR0AKHGW2r9qE=;
        b=QabkmsMZGZGM7UgddHYe/E4Rf0XLN+OpoVp43UzJQbcPCZX1sYJqXP/7+APpyrcQPO
         h8icBlzTk1OClCCdvR+LlvUBMJk4EhIWnDjqLxpxgm2XKstO/tldaFNWkn0uGcycLrx6
         ai064qmkabXS/rR/6/k9uLwyqzpSBXk0IXMFNKbyNaz/NrpUnoZqPp3/XQzFK5lXpNEd
         HLrYWt53ripbyDSjBtkvEtHoaxrZqKdaErx9sqezsNxbbpUBwNyzXr4WxtWNCwE94jKj
         6CAB+cOxWL9ye54RESo2WjiDCy/mXcrgBH4tfsmvJbWYGv5zpM0i2jlblADRy0ri4Oxb
         /AsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750075601; x=1750680401;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TpU5wAMG3sQlhcsZQZqrmEByJp0SllVR0AKHGW2r9qE=;
        b=GCMau54moQue4tk2wow+vm0CFr1yRMRwvRWngGi9SMUBeqjeeL1DwR6sXrGVOyog26
         HoFTYdpNqdAOHvsUO5r6IOcbrUk64b8zLSAT3NEUROW3CY0Hw9Ens5/gX5pdn+fxdqpk
         wX8/0Kv1MdvUW+24t3TWy1bKvEtSvrwmH4tPZrK1bljzuCJdLZOdZqVsawnKlCcNu8CS
         0XV/sG/3mdtroD3S3muRwDmnQOs/Jbpl662Th7ZQEh29pxlbjiCxZOpHuhyIPamRobDh
         fpMDFHl5Inz9LhI/N5ZmmemSqEJuvg6qwnHjxWehNwL8QpbeFMmh4pclOxy1axaScEcU
         0/Eg==
X-Gm-Message-State: AOJu0YyUsMrbHK8UiCt5zVGPhK3VGHnvtGV2KEh+SZfXk/5H5Rtz23gu
	QRPm5ap2WNwNhKdClxspuPQPXfqEaJUDz63mpicf6LiP2oV3XWdmP38TS2aOwGbg09WhvinND6n
	tYMtprBROMlMDcLMGHOvoLGN4E7ksuhP0vUKVJG6YxS5FjnaGUIFQNEAj5A==
X-Gm-Gg: ASbGnctsZIW/1x93t1yZfTnYAo8Ci3UaD3B4S/XPEmJ/wZ+qMcglB67MoO+1kYSmIbX
	vD9br7fqJhcJq7dx/Cb1NMGgL8b2BkbF+/61CDf1wjIYQ4pMUuti03yi5dwhKCNHof/MJUSxPmr
	qA8BbDY46cVMuoDoZUhPmWGvPxTUvXM5KmXdPMak0l0HEST65ghvA2aDPhqirFIE5HBnPzIE89n
	DIF
X-Google-Smtp-Source: AGHT+IFeUKnKrR3PiU9rxHEIRNQyrCJR8n4GoHXj1LshKjqrOlDxmNum5ASc/NWBGVeJbSNt1PqkzC0aodOI1wfeH5o=
X-Received: by 2002:a05:6214:500c:b0:6fa:c6ad:1618 with SMTP id
 6a1803df08f44-6fb4776e76cmr143231416d6.27.1750075601411; Mon, 16 Jun 2025
 05:06:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Mon, 16 Jun 2025 17:36:29 +0530
X-Gm-Features: AX0GCFs0r1nB19T1N_2PPwY-kXlE37v4o6Iuua4hbniHaojK4KFbc8YBvkBv6Uc
Message-ID: <CA+G9fYuDOnN6TrcVYcMZT5UPNc34mOHQZsfyFvpq+Ndhz8p48w@mail.gmail.com>
Subject: next-20250616: S390 gcc-8 allnoconfig mm mempool.c In function remove_element
To: open list <linux-kernel@vger.kernel.org>, linux-s390@vger.kernel.org, 
	lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Arnd Bergmann <arnd@arndb.de>, 
	Anders Roxell <anders.roxell@linaro.org>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regression while building S390 with the Linux next-20250616
with gcc-8 the following kernel warnings found.

Regressions found on S390
 -  build/gcc-8-lkftconfig-allnoconfig
 -  build/gcc-8-lkftconfig-hardening

Regression Analysis:
 - New regression? Yes
 - Reproducibility? Yes

First seen on the next-20250616
Good: next-20250613
Bad:  next-20250616

Build regression: S390 gcc-8 allnoconfig mm mempool.c In function remove_element

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build errors
mm/mempool.c: In function 'remove_element':
include/linux/compiler_types.h:497:20: warning: asm operand 0 probably
doesn't match constraints
 #define asm_inline asm __inline
                    ^~~
arch/s390/include/asm/bug.h:12:2: note: in expansion of macro 'asm_inline'
  asm_inline volatile(     \
  ^~~~~~~~~~
arch/s390/include/asm/bug.h:43:2: note: in expansion of macro '__EMIT_BUG'
  __EMIT_BUG("", 0);    \
  ^~~~~~~~~~
include/asm-generic/bug.h:77:57: note: in expansion of macro 'BUG'
 #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (0)
                                                         ^~~
mm/mempool.c:149:2: note: in expansion of macro 'BUG_ON'
  BUG_ON(pool->curr_nr < 0);
  ^~~~~~
include/linux/compiler_types.h:497:20: error: impossible constraint in 'asm'
 #define asm_inline asm __inline
                    ^~~

## Source
* Kernel version: 6.16.0-rc2
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 050f8ad7b58d9079455af171ac279c4b9b828c11
* Git describe: next-20250616
* Project details:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250616/
* Architectures: S390
* Toolchains: gcc-8
* Kconfigs: allnoconfig

## Build S390
* Build log: https://qa-reports.linaro.org/api/testruns/28763376/log_file/
* Build details:
https://regressions.linaro.org/lkft/linux-next-master/next-20250616/build/gcc-8-allnoconfig/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2ya0wQbvgatYAbcvC2OTZls5D91/config

## Steps to reproduce on S390
 - tuxmake --runtime podman --target-arch s390 --toolchain gcc-8
--kconfig allnoconfig

--
Linaro LKFT
https://lkft.linaro.org
