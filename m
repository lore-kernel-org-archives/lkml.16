Received: from mail-io1-f48.google.com (mail-io1-f48.google.com [209.85.166.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4838523C384
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920158; cv=none; b=nm9vaUmzvMIR7/YjYb+UHuap1agtMCocp4o7AZXYFlk3N2b7w/b8rxcsCx3KcvcUuRWYR3jgjaZ6OhA0Wr7VgDwG4Pq3Cva9p0OBoFkvDcFsIiLcyiWS6SMQRs4q2JR1J26wYCr2OeIg49mRhJ7Tr/IuNBToRpo2uwRdpb+StJg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920158; c=relaxed/simple;
	bh=9d/cL7spZ/Wpwt5q//l/yGfX4IJgepMQQJ1VLqzbCYI=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=MMgbEqmO3u3BKrlXkqKkDpF2zOSKuYjXX3aR1+Web24Hup/BGaXOoG0+6L8TJzLfgi+fZG/3Y3AABW64SFwZcJamjvXBlkJ54qCAeBqJRL6V5/yLq4DBcFzpJJuocfVH6OlUoNxSaqdRvod4Rj+zGJjmXMDVsHhMIP2aqNtUT84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z+l2hXfl; arc=none smtp.client-ip=209.85.166.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z+l2hXfl"
Received: by mail-io1-f48.google.com with SMTP id ca18e2360f4ac-85dac9729c3so790865539f.2
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747920156; x=1748524956; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZfTBhDhdrqletUuYxc3+baMCOgR/beos1y6YIz7hWx4=;
        b=Z+l2hXflKb1u7I72jkl+1PM6xPzUcnronGG2UZ44dDS9iuxhOshD3AlpWMI3Jh11+R
         6DECOkjeWnNl4rOznD1Z00eaUP5OU9khVHTayWnJluCUeuc/dkFWlgeMYkiCwtDQnhEZ
         2/MtVK2S6FaqUwMT6Go/WvYI/3yZlcZ6STFxXosIR0mdDVmut0eiJxkY0sCAT2uWX/9C
         gzuMuDOTOmxyhr+ncuhaVsUl+yd7mntCmuHFhzhFq0Z4n8udYDaQnqH17/qoafy1DIH/
         d8r3i2XgZHamMU3U/YEzHwIX8v07z3Yhv7lA+kjTXIqVh4O/iInrRC+V3DOSWDgXlcUY
         1+Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920156; x=1748524956;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZfTBhDhdrqletUuYxc3+baMCOgR/beos1y6YIz7hWx4=;
        b=IOEysMekmH7AWmED6OrDpQZkBTkUX6gnd1Y2B+YJ6J567fmGuhJotc2bMNgzsIILej
         xMDGKRtk3jUCSd5pV97oL0tyK1piUJa7I32mBwT4imNF2MSV7Zgkf3JKw0CBgJcoOsW5
         paaCfs+hBTDPCr2nhf9XR/6OInMVz1lPHXxdFpVl1ISVe/P6AQW+2lWh2TP9at57Erln
         5jbwlE5ovB1mXxw8EqjXgh7x+DFjhujk3lRIfwKG8nKyGLyGl/DwWl34LRpxBhVwpxI/
         nJHPfxZf/WUqToPy8czkCtEMl75qD7cBA29/nJEDFllP7uCmstclqDTfo3+6zt7ToFK5
         ahOw==
X-Forwarded-Encrypted: i=1; AJvYcCU7Vmt6wPvCQxd9HDvHeJUO1PjiZoN/0xjcNF3vm/8eLowo75EXSe42ixLhOckDALJHigeaG4YtDt9lWb4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyzu+kwsbBnsMVaC4n0BYUFy7Wqw1P39gkMI47/QKIiag+yCVAk
	MD7mGC65RIAXYcSkODFhfuxQAFdMJehCMFo6554PxGnI4/uWJbafeIh0Zq+l7tRkdW9gR2tFX5P
	nNhEKeDGkvJN3uJhQgBwbfOMHtwxBfCFsHmI0Vtvw5sVn1uF3IrItqXc=
X-Gm-Gg: ASbGncsAB0Kk1M50YPg+oYPxGEkKLYFjvCbFH8d7X3J2XeF0u5VK7s/R7PauxLV8Voq
	CHiR3CzS1QC25tCJ9Ki6BOilvDt77Xt1dnA/lq+a3hUuOIBBXIW+Oi7DNtyciYsAani65LGbR35
	jDwIg+RRpneYGVNKurXB+jpS8krW/XbVlFK+jgNQzfcrZTAp+Ruu5GAsCFZta03xW4yA==
X-Google-Smtp-Source: AGHT+IH2x7M+ebP0fF6u65wtIJfC2HKWreUBC1mFxNZYez5c2LjS+RbEJT03nVtElBzCk2DLszkS0XUj8hnQ/3AfrTc=
X-Received: by 2002:a05:6902:13c6:b0:e74:b106:ec71 with SMTP id
 3f1490d57ef6-e7b6a317681mr31915653276.46.1747920145756; Thu, 22 May 2025
 06:22:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Naresh Kamboju <naresh.kamboju@linaro.org>
Date: Thu, 22 May 2025 18:52:13 +0530
X-Gm-Features: AX0GCFs4fMOBdKUjtk4Ii_YEa3Zj0uO_GBWF7untQbLfXNpr8KzqJEF5L9aKhfg
Message-ID: <CA+G9fYsZPSJ55FQ9Le9rLQMVHaHyE5kU66xqiPnz6mmfhvPfbQ@mail.gmail.com>
Subject: mips gcc-12 malta_defconfig 'SOCK_COREDUMP' undeclared (first use in
 this function); did you mean 'SOCK_RDM'?
To: linux-fsdevel@vger.kernel.org, linux-mips@vger.kernel.org, 
	open list <linux-kernel@vger.kernel.org>, lkft-triage@lists.linaro.org, 
	Linux Regressions <regressions@lists.linux.dev>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Anders Roxell <anders.roxell@linaro.org>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Dan Carpenter <dan.carpenter@linaro.org>
Content-Type: text/plain; charset="UTF-8"

Regressions on mips malta_defconfig build failed with gcc-12 on the Linux next
tag next-20250521 and next-20250522.

First seen on the next-20250521
 Good: next-20250516
 Bad:  next-20250521

Regressions found on mips:
 - build/gcc-12-malta_defconfig

Regression Analysis:
 - New regression? Yes
 - Reproducible? Yes

Build regression: mips gcc-12 malta_defconfig 'SOCK_COREDUMP'
undeclared (first use in this function); did you mean 'SOCK_RDM'?

Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>

## Build log
net/unix/af_unix.c: In function 'unix_find_bsd':
net/unix/af_unix.c:1152:21: error: 'SOCK_COREDUMP' undeclared (first
use in this function); did you mean 'SOCK_RDM'?
 1152 |         if (flags & SOCK_COREDUMP) {
      |                     ^~~~~~~~~~~~~
      |                     SOCK_RDM

fs/coredump.c: In function 'do_coredump':
fs/coredump.c:899:64: error: 'SOCK_COREDUMP' undeclared (first use in
this function); did you mean 'SOCK_RDM'?
  899 |                                         addr_len, O_NONBLOCK |
SOCK_COREDUMP);
      |
^~~~~~~~~~~~~
      |                                                                SOCK_RDM
fs/coredump.c:899:64: note: each undeclared identifier is reported
only once for each function it appears in
make[4]: *** [scripts/Makefile.build:203: fs/coredump.o] Error 1


## Source
* Kernel version: 6.15.0-rc7
* Git tree: https://kernel.googlesource.com/pub/scm/linux/kernel/git/next/linux-next.git
* Git sha: 460178e842c7a1e48a06df684c66eb5fd630bcf7
* Git describe: next-20250522

## Build
* Build log: https://qa-reports.linaro.org/api/testruns/28516701/log_file/
* Build history:
https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250522/testrun/28516701/suite/build/test/gcc-12-malta_defconfig/history/
* Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9ld0H5IJGyGHQxUSopFLZrU/
* Kernel config:
https://storage.tuxsuite.com/public/linaro/lkft/builds/2xRo9ld0H5IJGyGHQxUSopFLZrU/config


--
Linaro LKFT
https://lkft.linaro.org
