Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF3F4213236
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 12:11:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749125475; cv=none; b=DfurJMriNOjjlp5B5LC0c+VqQHRk3B/rx16noIGMWQNsFfHDoT/vYzj1yn9chisqQHWGQHs7OEAm3b4jk9DaDvtxhvcH+d5rz/8GZNILYcLgwRAyRdWIKwgztScVkZnJaJ/ny7OrxfSbqieTUx1G7SUasr/W2oSa+4yrYcxUWCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749125475; c=relaxed/simple;
	bh=MW3N16/x4ORzkYHJazCJmRwnbO4hITQcNKVwQrY/7gQ=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=XlI+/HJfUaVCoObLA4HQCAhvescBecIfAkTAlNNOkbPGGxqG9wEJIeVkcZ/S/p5/w9LpBWF8tof+LJIEnFgnwXY2/dnY52CUFJj3uBGRcLailha9H2Ybz1lmtbjMvnadFDIOA3skxRTlki2zMJwijFqX8mZtFFz5Fh/Dy1SRRJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QqEe4+Nr; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QqEe4+Nr"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-86dc3482b3dso1527451241.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 05:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749125473; x=1749730273; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OgmiEXi0A20P8LTwFGfS1KsXpM+N3sq3vnKks2IxAc0=;
        b=QqEe4+NrfNz7RYn+CehgTyuFIWaYHciqdEVZteBNEaupIwuMT0WLA02W/QZdtmJkf7
         GdjMRHTGS9Hxlz+iNH7ocfM+a6IPMFNaxB3BTdnSb2pcjlhR85NbFSD1O/CI/2Zbach5
         tMyHH6ANmeE/p2861xPiM+CkBh/vG917sus/ZhWCZN4guRi0MmTk/yZa9O0gBEc6huN0
         Vt3EnENPhct4feyt+10VmJS2fekT/XREVpYlBKps3tbkXLa07//Jrd9uaiz3xFMK7vD4
         1WKz9XaySiq/Y5mIU4nAPMhsjG9bb2KKIh0qg8d6uy6KAjXDtchoYGTlnJx2Vhb5HRYW
         vN1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749125473; x=1749730273;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OgmiEXi0A20P8LTwFGfS1KsXpM+N3sq3vnKks2IxAc0=;
        b=RQGfoI4xRwf+aZUr5B/cto29VaizvWV8qA2H4oHxSBtywmlpLYwzB76BOuk5Xq2gR7
         WUVlCEpHbVyc8C5vu6jwuLE77GpwNiwU8mncePCGD2cUOgh/m1ZHPqZNyoyzW3PIfmV+
         euFOz/4k7PP3r6pEc97YpnnWjsNzsBM0lB0RV+YZXoXsaRrhpOx7ftRbQs+aDiClKUFA
         0a4yDpB8HudqqXnfEdtGCDlt5QHGQIT91HOylGlykzq6WvFGTyKS+sdngPqJHKmJcPoH
         xe4+c4dVrLKdmuzijybOaclVhed9kCusdjQoUh5FCSoIPT1k91NACH9igw3/Y46Vk9Ap
         Tvpg==
X-Forwarded-Encrypted: i=1; AJvYcCW64wAstURaTZ1310vyqYAFexeWL3kwH834L5wkY3LDEJ8tc8WnLHe7xgk+qfTYuuFr4iaEymh7sIFuv8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxIoBSDjfz5YmJNNQAqBOlMFfZ3maw7Q3TXjNko4tqjUhmt53fU
	YTYgGCpANBkvrCKIAlidVEn32xN/7iMNh5htY6JPKIO1eGCkymUlUty7SV9z+T8joZPa7GEeSCM
	2u3Ba7gYnHpPz50YzxXd8vqwCslIephi9ELHnhfqrfJYsgNSrb++D/9VXcA==
X-Gm-Gg: ASbGnct58FE08Bl7m7MW9C8xfyYs4Yl3tY/GkVQC1NJhxxmI1gQDn+stpTSIlbXd5xQ
	E2+oeywhcy4nXNZnTsgkb0eupXwxeuh5DASQT4un6hz7kxdUxAnQ9PF4qdTHcqjxcpujGGNMJ8i
	XRzUqCnT4kTt07w6dn3++JyxGMg3/gx5Y5+b1VVBKirg2p3FtJ56XaPURpCbL4vsKAXN4rvhkui
	Mwx
X-Google-Smtp-Source: AGHT+IF2aumGdZUdL8u076i5ZOYIyzoO7Q7yA+GrS7FD0Blk3+o8CgZgvUcGhew/xxle19ewVkjFe1PCU2oG2AHumNI=
X-Received: by 2002:a67:f995:0:b0:4e2:b21b:2cbc with SMTP id
 ada2fe7eead31-4e758a62aa2mr2243810137.3.1749125472722; Thu, 05 Jun 2025
 05:11:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 5 Jun 2025 17:41:01 +0530
X-Gm-Features: AX0GCFt1mMqSdas5kTm6Jze2KjPhrZRGcVrdJh8UaX_gHiGLSsKT2XiJF6iZ_Zc
Message-ID: <CA+G9fYt-CMBGCFxV5ziP98upkeK2LBxkZRo7-0XN1G+zLtWK4A@mail.gmail.com>
Subject: selftests/filesystem: clang warning null passed to a callee that
 requires a non-null argument [-Wnonnull]
To: clang-built-linux <llvm@lists.linux.dev>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>, 
	lkft-triage@lists.linaro.org
Cc: Nathan Chancellor <nathan@kernel.org>, Anders Roxell <anders.roxell@linaro.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Arnd Bergmann <arnd@arndb.de>, 
	Sasha Levin <sashal@kernel.org>
Content-Type: text/plain; charset="UTF-8"

Regressions found on arm, arm64 and x86_64 building warnings with clang-20
and clang-nightly started from Linux next-20250603

Regressions found on arm, arm64 and x86_64
 - selftests/filesystem

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

First seen on the next-20250603
Good: next-20250530
Bad:  next-20250603

Test regression: arm arm64 x86_64 clang warning null passed to a
callee that requires a non-null argument [-Wnonnull]

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build warnings
make[4]: Entering directory '/builds/linux/tools/testing/selftests/filesystems'
  CC       devpts_pts
  CC       file_stressor
  CC       anon_inode_test
anon_inode_test.c:45:37: warning: null passed to a callee that
requires a non-null argument [-Wnonnull]
   45 |         ASSERT_LT(execveat(fd_context, "", NULL, NULL,
AT_EMPTY_PATH), 0);
      |                                            ^~~~

## Source
* Kernel version: 6.15.0-next-20250605
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: a0bea9e39035edc56a994630e6048c8a191a99d8
* Toolchain: Debian clang version 21.0.0
(++20250529012636+c474f8f2404d-1~exp1~20250529132821.1479)

## Build
* Test log: https://qa-reports.linaro.org/api/testruns/28651387/log_file/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xzM4wMl8SvuLKE3mw3csiuv3Jz/config

--
Linaro LKFT
https://lkft.linaro.org
